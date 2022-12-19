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
}

aura_env.processEntries = function(rawEntries, turnedInQuest)
	local entries = {}
	for _, entry in ipairs(rawEntries) do
		local state = 'PENDING'
		if entry.isCompleted(entry.quests, turnedInQuest) then
			state = 'COMPLETED'
		end

		table.insert(entries, {
			name = entry.name,
			state = state,
		})
	end

	return entries
end
