aura_env.cache = {}

aura_env.colors = {
	completed = CreateColor(unpack(aura_env.config.color_completed)):GenerateHexColor(),
	heading = CreateColor(unpack(aura_env.config.color_heading)):GenerateHexColor(),
	note = CreateColor(unpack(aura_env.config.color_note)):GenerateHexColor(),
	pending = CreateColor(unpack(aura_env.config.color_pending)):GenerateHexColor(),
	unavailable = CreateColor(unpack(aura_env.config.color_unavailable)):GenerateHexColor(),
}

aura_env.priorityOrder = { 'HIGH', 'MEDIUM', 'LOW' }

aura_env.stateColors = {
	COMPLETED = aura_env.colors.completed,
	PENDING = aura_env.colors.pending,
	UNAVAILABLE = aura_env.colors.unavailable,
}

function AelTodoHasCompleted(amount)
	return function(quests, turnedInQuest)
		if amount == 'ALL' then
			amount = #quests
		end

		if amount == 'ANY' then
			amount = 1
		end

		local completedCount = 0
		for _, quest in ipairs(quests) do
			local completed = turnedInQuest == quest or C_QuestLog.IsQuestFlaggedCompleted(quest)
			if completed then
				completedCount = completedCount + 1

				if completedCount >= amount then
					return true, completedCount, amount
				end
			end
		end

		return false, completedCount, amount
	end
end

local defaultIsCompleted = AelTodoHasCompleted 'ANY'

function AelTodoProcessEntries(rawEntries, turnedInQuest)
	local entries = {}
	for _, entry in ipairs(rawEntries) do
		local state = entry.isAvailable ~= nil and 'UNAVAILABLE' or 'PENDING'
		if entry.isAvailable ~= nil and entry.isAvailable() then
			state = 'PENDING'
		end

		local isCompleted = entry.isCompleted or defaultIsCompleted
		local completed, completedCount, totalCount = isCompleted(entry.quests, turnedInQuest)
		if completed then
			state = 'COMPLETED'
		end

		local progress = ''
		if state ~= 'UNAVAILABLE' and totalCount > 1 then
			progress = string.format(' (%d/%d)', completedCount, totalCount)
		end

		table.insert(entries, {
			coords = entry.coords,
			name = entry.name .. progress,
			note = entry.note,
			state = state,
		})
	end

	return entries
end
