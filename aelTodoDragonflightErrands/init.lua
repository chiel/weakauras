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
		quests = { 70750, 72068, 72373, 72374, 72375 },
		isCompleted = hasCompleted 'ANY',
	},
	{
		name = 'Dungeon Quests',
		quests = { 66862, 66868, 66870, 66871, 66874, 66875 },
		isCompleted = hasCompleted(2),
	},
	{
		name = 'Community Feast',
		quests = { 70893 },
		isCompleted = hasCompleted 'ANY',
	},
	{
		name = 'Grand Hunt',
		quests = { 70906 },
		isCompleted = hasCompleted 'ANY',
	},
	{
		name = 'Siege on Dragonbane Keep',
		quests = { 70866 },
		isCompleted = hasCompleted 'ANY',
	},
	{
		name = 'World Boss',
		quests = { 72055, 72056 },
		isCompleted = hasCompleted 'ANY',
	},
}

aura_env.biweeklies = {
	{
		name = 'Aylaag Camp',
		quests = {
			65784,
			65792,
			65796,
			66711,

			65798,
			67605,
			70210,
			70701,

			67034,
			67039,
			70279,
			70990,
		},
		isCompleted = hasCompleted(4),
	},
}

aura_env.dailies = {
	{
		name = 'River Mouth Fishing Hole',
		quests = { 70438, 70450 },
		isAvailable = function()
			return hasCompleted 'ANY' { 70793 }
		end,
		isCompleted = hasCompleted 'ALL',
	},
}

aura_env.processEntries = function(rawEntries, turnedInQuest)
	local entries = {}
	for _, entry in ipairs(rawEntries) do
		local state = entry.isAvailable ~= nil and 'UNAVAILABLE' or 'PENDING'
		if entry.isAvailable ~= nil and entry.isAvailable() then
			state = 'PENDING'
		end

		local completed, completedCount, totalCount = entry.isCompleted(entry.quests, turnedInQuest)
		if completed then
			state = 'COMPLETED'
		end

		local progress = ''
		if state ~= 'UNAVAILABLE' and totalCount > 1 then
			progress = string.format(' (%d/%d)', completedCount, totalCount)
		end

		table.insert(entries, {
			name = entry.name .. progress,
			state = state,
		})
	end

	return entries
end
