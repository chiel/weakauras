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

function hasReputation(faction, requiredRank)
	return function()
		local rankInfo = C_GossipInfo.GetFriendshipReputationRanks(faction)
		return rankInfo.currentLevel > requiredRank
	end
end

function hasSkill(skillLine, requiredSkill)
	return function()
		return aura_env.getProfessionSkill(skillLine) > requiredSkill
	end
end

aura_env.generalEntries = {
	{
		name = 'Show Your Mettle',
		quests = { 70221 },
		isAvailable = hasReputation(2544, 2),
		isCompleted = hasCompleted 'ANY',
	},
}

aura_env.entriesByProfession = {
	[171] = { -- alchemy
		{
			name = 'Treatise',
			quests = { 74108 },
			isAvailable = hasSkill(171, 25),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Faction Trader Quest',
			quests = { 66937, 66940, 72427 },
			isAvailable = hasSkill(171, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Profession Trainer Quest',
			quests = { 70530, 70531, 70532, 70533 },
			isAvailable = hasSkill(171, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Decaying Phlegm',
			note = 'Decayed Enemies',
			quests = { 70504 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Elementious Splinter',
			note = 'Elemental Enemies',
			quests = { 70511 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Experimental Substance',
			note = 'Chests / Scout Packs',
			quests = { 66373 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Reawakened Catalyst',
			note = 'Chests / Scout Packs',
			quests = { 66374 },
			isCompleted = hasCompleted 'ANY',
		},
	},

	[164] = { -- blacksmithing
		{
			name = 'Treatise',
			quests = { 74109 },
			isAvailable = hasSkill(164, 25),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Faction Trader Quest',
			quests = { 66517, 66897 },
			isAvailable = hasSkill(164, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Profession Trainer Quest',
			quests = { 70233, 70235 },
			isAvailable = hasSkill(164, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Work Orders Quest',
			quests = { 70589 },
			isAvailable = hasSkill(164, 25),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Draconium Blade Sharpener',
			note = 'Chests / Scout Packs',
			quests = { 66382 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Molten Globule',
			note = 'Fire Enemies',
			quests = { 70513 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Primeval Earth Fragment',
			note = 'Earth Enemies',
			quests = { 70512 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Valdrakken Weapon Chain',
			note = 'Chests / Scout Packs',
			quests = { 66381 },
			isCompleted = hasCompleted 'ANY',
		},
	},

	[333] = { -- enchanting
		{
			name = 'Treatise',
			quests = { 74110 },
			isAvailable = hasSkill(333, 25),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Faction Trader Quest',
			quests = { 66884, 72423 },
			isAvailable = hasSkill(333, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Profession Trainer Quest',
			quests = { 72172, 72173, 72175 },
			isAvailable = hasSkill(333, 50),
			isCompleted = hasCompleted 'ANY',
		},
	},

	[202] = { -- engineering
		{
			name = 'Treatise',
			quests = { 74111 },
			isAvailable = hasSkill(202, 25),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Faction Trader Quest',
			quests = { 66891 },
			isAvailable = hasSkill(202, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Profession Trainer Quest',
			quests = { 70540, 70557 },
			isAvailable = hasSkill(202, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Work Orders Quest',
			quests = { 70591 },
			isAvailable = hasSkill(202, 25),
			isCompleted = hasCompleted 'ANY',
		},
	},

	[182] = { -- herbalism
		{
			name = 'Treatise',
			quests = { 74107 },
			isAvailable = hasSkill(182, 25),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Profession Trainer Quest',
			quests = { 70613 },
			isAvailable = hasSkill(182, 50),
			isCompleted = hasCompleted 'ANY',
		},
	},

	[773] = { -- inscription
		{
			name = 'Treatise',
			quests = { 74105 },
			isAvailable = hasSkill(773, 25),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Faction Trader Quest',
			quests = { 66943, 66944 },
			isAvailable = hasSkill(773, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Profession Trainer Quest',
			quests = { 70558, 70559, 70560, 70561 },
			isAvailable = hasSkill(773, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Work Orders Quest',
			quests = { 70592 },
			isAvailable = hasSkill(773, 25),
			isCompleted = hasCompleted 'ANY',
		},
	},

	[755] = { -- jewelcrafting
		{
			name = 'Treatise',
			quests = { 74112 },
			isAvailable = hasSkill(755, 25),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Faction Trader Quest',
			quests = { 66516, 66950, 72428 },
			isAvailable = hasSkill(755, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Profession Trainer Quest',
			quests = { 70563, 70564, 70565 },
			isAvailable = hasSkill(755, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Work Orders Quest',
			quests = { 70593 },
			isAvailable = hasSkill(755, 25),
			isCompleted = hasCompleted 'ANY',
		},
	},

	[165] = { -- leatherworking
		{
			name = 'Treatise',
			quests = { 74113 },
			isAvailable = hasSkill(165, 25),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Faction Trader Quest',
			quests = { 66363, 66364, 72407 },
			isAvailable = hasSkill(165, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Profession Trainer Quest',
			quests = { 70567, 70569, 70571 },
			isAvailable = hasSkill(165, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Work Orders Quest',
			quests = { 70594 },
			isAvailable = hasSkill(165, 25),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Exceedingly Soft Skin',
			note = 'Slyvern / Vorquin',
			quests = { 70523 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Molted Dragon Scales',
			note = 'Chests / Scout Packs',
			quests = { 66384 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Ossified Hide',
			note = 'Drakes',
			quests = { 70522 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Preserved Animal Parts',
			note = 'Chests / Scout Packs',
			quests = { 66385 },
			isCompleted = hasCompleted 'ANY',
		},
	},

	[186] = { -- mining
		{
			name = 'Treatise',
			quests = { 74106 },
			isAvailable = hasSkill(186, 25),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Profession Trainer Quest',
			quests = { 70617, 70618, 72157 },
			isAvailable = hasSkill(186, 50),
			isCompleted = hasCompleted 'ANY',
		},
	},

	[393] = { -- skinning
		{
			name = 'Treatise',
			quests = { 74114 },
			isAvailable = hasSkill(393, 25),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Profession Trainer Quest',
			quests = { 70620, 72159 },
			isAvailable = hasSkill(393, 50),
			isCompleted = hasCompleted 'ANY',
		},
	},

	[197] = { -- tailoring
		{
			name = 'Treatise',
			quests = { 74115 },
			isAvailable = hasSkill(197, 25),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Faction Trader Quest',
			quests = { 66952, 72410 },
			isAvailable = hasSkill(197, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Profession Trainer Quest',
			quests = { 70582, 70586 },
			isAvailable = hasSkill(197, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Work Orders Quest',
			quests = { 70595 },
			isAvailable = hasSkill(197, 25),
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

aura_env.getProfessionSkill = function(requestedSkillLine)
	local info = C_TradeSkillUI.GetProfessionInfoBySkillLineID(requestedSkillLine)
	if info.skillLevel > 0 then
		return info.skillLevel
	end

	local prof1, prof2 = GetProfessions()
	for _, profIndex in ipairs { prof1, prof2 } do
		if profIndex == nil then
			return 0
		end

		local _, _, skillLevel, _, _, _, skillLine = GetProfessionInfo(profIndex)
		if skillLine == requestedSkillLine then
			return skillLevel
		end
	end

	return 0
end

aura_env.processEntries = function(rawEntries, turnedInQuest)
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

	return entries
end
