function hasCompleted(amount)
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

aura_env.weeklies = {
	{
		name = 'Aiding the Accord',
		quests = { 70750, 72068, 72373, 72374 },
		isCompleted = hasCompleted 'ANY',
	},
	{
		name = 'Dungeon Quests',
		quests = { 66868, 66874, 66875 },
		isCompleted = hasCompleted(2),
	},
}

aura_env.processEntries = function(rawEntries, turnedInQuest)
	local entries = {}
	for _, entry in ipairs(rawEntries) do
		local state = 'PENDING'
		local completed, completedCount, totalCount = entry.isCompleted(entry.quests, turnedInQuest)
		if completed then
			state = 'COMPLETED'
		end

		local progress = ''
		if totalCount > 1 then
			progress = string.format(' (%d/%d)', completedCount, totalCount)
		end

		table.insert(entries, {
			name = entry.name .. progress,
			state = state,
		})
	end

	return entries
end
