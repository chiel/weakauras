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

function hasSkill(requiredSkill)
	return function(currentSkill)
		return currentSkill >= requiredSkill
	end
end

aura_env.entriesByProfession = {
	[171] = { -- alchemy
		{
			name = 'Treatise',
			quests = { 74108 },
			isAvailable = hasSkill(25),
			isCompleted = hasCompleted 'ANY',
		},
	},

	[164] = { -- blacksmithing
		{
			name = 'Treatise',
			quests = { 74109 },
			isAvailable = hasSkill(25),
			isCompleted = hasCompleted 'ANY',
		},
	},

	[333] = { -- enchanting
		{
			name = 'Treatise',
			quests = { 74110 },
			isAvailable = hasSkill(25),
			isCompleted = hasCompleted 'ANY',
		},
	},

	[202] = { -- engineering
		{
			name = 'Treatise',
			quests = { 74111 },
			isAvailable = hasSkill(25),
			isCompleted = hasCompleted 'ANY',
		},
	},

	[182] = { -- herbalism
		{
			name = 'Treatise',
			quests = { 74107 },
			isAvailable = hasSkill(25),
			isCompleted = hasCompleted 'ANY',
		},
	},

	[773] = { -- inscription
		{
			name = 'Treatise',
			quests = { 74105 },
			isAvailable = hasSkill(25),
			isCompleted = hasCompleted 'ANY',
		},
	},

	[755] = { -- jewelcrafting
		{
			name = 'Treatise',
			quests = { 74112 },
			isAvailable = hasSkill(25),
			isCompleted = hasCompleted 'ANY',
		},
	},

	[165] = { -- leatherworking
		{
			name = 'Treatise',
			quests = { 74113 },
			isAvailable = hasSkill(25),
			isCompleted = hasCompleted 'ANY',
		},
	},

	[186] = { -- mining
		{
			name = 'Treatise',
			quests = { 74106 },
			isAvailable = hasSkill(25),
			isCompleted = hasCompleted 'ANY',
		},
	},

	[393] = { -- skinning
		{
			name = 'Treatise',
			quests = { 74114 },
			isAvailable = hasSkill(25),
			isCompleted = hasCompleted 'ANY',
		},
	},

	[197] = { -- tailoring
		{
			name = 'Treatise',
			quests = { 74115 },
			isAvailable = hasSkill(25),
			isCompleted = hasCompleted 'ANY',
		},
	},
}

aura_env.knowledgePointCurrencies = {
	[2023] = true, -- blacksmithing
	[2024] = true, -- alchemy
	[2025] = true, -- leatherworking
	[2026] = true, -- tailoring
	[2027] = true, -- engineering
	[2028] = true, -- inscription
	[2029] = true, -- jewelcrafting
	[2030] = true, -- enchanting
	[2033] = true, -- skinning
	[2034] = true, -- herbalism
	[2035] = true, -- mining
}
