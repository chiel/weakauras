function Trigger(event, ...)
	local turnedInQuest = nil
	if event == 'QUEST_TURNED_IN' then
		turnedInQuest = select(1, ...)
	end

	local sections = {}

	local entries = aura_env.processEntries(aura_env.weeklies, turnedInQuest)
	if #entries > 0 then
		table.insert(sections, { name = 'Weeklies', entries = entries })
	end

	entries = aura_env.processEntries(aura_env.dailies, turnedInQuest)
	if #entries > 0 then
		table.insert(sections, { name = 'Dailies', entries = entries })
	end

	local plugin = {
		name = 'Dragonflight Errands',
		priority = 'HIGH',
		sections = sections,
	}

	WeakAuras.ScanEvents('AEL_TODO_UPDATE', 'dragonflight_errands', plugin)
end
