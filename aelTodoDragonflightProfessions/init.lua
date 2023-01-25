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
			quests = { 66937, 66938, 66940, 72427 },
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
			quests = { 66517, 66897, 66941 },
			isAvailable = hasSkill(164, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Profession Trainer Quest',
			quests = { 70211, 70233, 70234, 70235 },
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
			quests = { 66884, 66900, 66935, 72423 },
			isAvailable = hasSkill(333, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Profession Trainer Quest',
			quests = { 72172, 72173, 72175 },
			isAvailable = hasSkill(333, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Primal Dust',
			note = 'Chests / Scout Packs',
			quests = { 66378 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Primalist Charm',
			note = 'Humanoid Primalists',
			coords = 'Thaldraszus 53.19 64.83',
			quests = { 70515 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Primordial Aether',
			note = 'Arcane Enemies',
			coords = 'The Azure Span 40.25 60.62',
			quests = { 70514 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Prismatic Focusing Shard',
			note = 'Chests / Scout Packs',
			quests = { 66377 },
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
			quests = { 66890, 66891, 66942, 72396 },
			isAvailable = hasSkill(202, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Profession Trainer Quest',
			quests = { 66942, 70540, 70545, 70557 },
			isAvailable = hasSkill(202, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Work Orders Quest',
			quests = { 70591 },
			isAvailable = hasSkill(202, 25),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Eroded Titan Gizmo',
			note = 'Chests / Scout Packs',
			quests = { 66379 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Infinitely Attachable Pair o\' Docks',
			note = 'Dragonkin Enemies',
			quests = { 70517 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Keeper\'s Mark',
			note = 'Titan / Tyrhold Enemies',
			quests = { 70516 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Watcher Power Core',
			note = 'Chests / Scout Packs',
			quests = { 66380 },
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
			quests = { 70613, 70616 },
			isAvailable = hasSkill(182, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Dreambloom Petal',
			quests = { 71857, 71858, 71859, 71860, 71861 },
			isCompleted = hasCompleted 'ALL',
		},
		{
			name = 'Dreambloom',
			quests = { 71864 },
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
			quests = { 66943, 66944, 66945, 72438 },
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
		{
			name = 'Curious Djaradin Rune',
			note = 'Djaradin',
			coords = 'The Waking Shores 28.88 57.90',
			quests = { 70518 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Draconic Glamour',
			note = 'Dragonkin',
			quests = { 70519 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Iskaaran Trading Ledger',
			note = 'Chests / Scout Packs',
			quests = { 66376 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Phoenix Feather Quill',
			note = 'Chests / Scout Packs',
			quests = { 66375 },
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
			quests = { 70562, 70563, 70564, 70565 },
			isAvailable = hasSkill(755, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Work Orders Quest',
			quests = { 70593 },
			isAvailable = hasSkill(755, 25),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Ancient Gem Fragments',
			note = 'Chests / Scout Packs',
			quests = { 66388 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Chipped Tyrstone',
			note = 'Chests / Scout Packs',
			quests = { 66389 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Elegantly Engraved Embellishment',
			note = 'Nokhud / Sundered Flame',
			quests = { 70521 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Incandescent Curio',
			note = 'Elementals',
			-- coords = 'The Waking Shore 75.77 37.00',
			quests = { 70520 },
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
			quests = { 66363, 66364, 66951, 72407 },
			isAvailable = hasSkill(165, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Profession Trainer Quest',
			quests = { 70567, 70568, 70569, 70571 },
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
		{
			name = 'Iridescent Ore Fragments',
			quests = { 72160, 72161, 72162, 72163, 72164 },
			isCompleted = hasCompleted 'ALL',
		},
		{
			name = 'Iridescent Ore',
			quests = { 72165 },
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
			quests = { 70619, 70620, 72158, 72159 },
			isAvailable = hasSkill(393, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Curious Hide Scrap',
			quests = { 70381, 70383, 70384, 70385, 70386 },
			isCompleted = hasCompleted 'ALL',
		},
		{
			name = 'Large Sample of Curious Hide',
			quests = { 70389 },
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
			quests = { 66952, 66953, 72410 },
			isAvailable = hasSkill(197, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Profession Trainer Quest',
			quests = { 70572, 70582, 70586, 70587 },
			isAvailable = hasSkill(197, 50),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Work Orders Quest',
			quests = { 70595 },
			isAvailable = hasSkill(197, 25),
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Ohn\'arhan Weave',
			note = 'Nokhud',
			coords = 'Ohn\'ahran Plains 83.56 56.13',
			quests = { 70524 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Primalweave Spindle',
			note = 'Chests / Scout Packs',
			quests = { 66387 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Stupidly Effective Stitchery',
			note = 'Gnolls',
			quests = { 70525 },
			isCompleted = hasCompleted 'ANY',
		},
		{
			name = 'Umbral Bone Needle',
			note = 'Chests / Scout Packs',
			quests = { 66386 },
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
			note = entry.note,
			coords = entry.coords,
			state = state,
		})
	end

	return entries
end
