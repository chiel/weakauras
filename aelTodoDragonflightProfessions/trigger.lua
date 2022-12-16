function Trigger(event, ...)
	-- knowledge points are treated as currencies, there is no `QUEST_TURNED_IN` event
	-- associated with using a treatise, nor is the hidden quest immediately marked as
	-- completed by `IsQuestFlaggedCompleted`, so instead I set a timer for 1 second
	-- and fire a fake event which re-triggers this function and causes a full update
	if event == 'CURRENCY_DISPLAY_UPDATE' then
		local currency = select(1, ...)
		if aura_env.knowledgePointCurrencies[currency] then
			C_Timer.After(1, function()
				WeakAuras.ScanEvents 'AEL_TODO_DRAGONFLIGHT_PROFESSIONS_UPDATE'
			end)
		end

		return
	end

	local turnedInQuest = nil
	if event == 'QUEST_TURNED_IN' then
		turnedInQuest = select(1, ...)
	end

	local profMap = {}
	local profNames = {}
	local prof1, prof2 = GetProfessions()
	for _, profIndex in ipairs { prof1, prof2 } do
		if profIndex == nil then
			break
		end

		local name, icon, skillLevel, _, _, _, skillLine = GetProfessionInfo(profIndex)
		profMap[name] = {
			name = name,
			icon = icon,
			skillLevel = skillLevel,
			skillLine = skillLine,
		}
		table.insert(profNames, name)
	end

	table.sort(profNames)

	local sections = {}
	for _, profName in ipairs(profNames) do
		local prof = profMap[profName]
		local rawEntries = aura_env.entriesByProfession[prof.skillLine]

		local entries = {}
		for _, entry in ipairs(rawEntries) do
			local state = entry.isAvailable ~= nil and 'UNAVAILABLE' or 'PENDING'
			if entry.isAvailable ~= nil and entry.isAvailable() then
				state = 'PENDING'
			end

			if entry.isCompleted(entry.quests, turnedInQuest) then
				state = 'COMPLETED'
			end

			table.insert(entries, {
				name = entry.name,
				state = state,
			})
		end

		if #entries > 0 then
			table.insert(sections, { name = prof.name, entries = entries })
		end
	end

	local plugin = {
		name = 'Dragonflight Professions',
		priority = 'MEDIUM',
		sections = sections,
	}

	WeakAuras.ScanEvents('AEL_TODO_UPDATE', 'dragonflight_professions', plugin)
end