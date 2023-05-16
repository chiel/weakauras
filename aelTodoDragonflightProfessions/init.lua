function hasReputation(faction, requiredRank)
	return function()
		local rankInfo = C_GossipInfo.GetFriendshipReputationRanks(faction)
		return rankInfo.currentLevel >= requiredRank
	end
end

function hasSkill(skillLine, requiredSkill)
	return function()
		return aura_env.getProfessionSkill(skillLine) >= requiredSkill
	end
end

aura_env.initialised = false

aura_env.init = function()
	if aura_env.initialised then
		return
	end

	aura_env.initialised = true

	aura_env.generalEntries = {
		{
			name = 'Show Your Mettle',
			quests = { 70221 },
			isAvailable = hasReputation(2544, 2),
		},
	}

	aura_env.entriesByProfession = {
		[171] = { -- alchemy
			{
				name = 'Treatise',
				quests = { 74108 },
				isAvailable = hasSkill(171, 25),
			},
			{
				name = 'Faction Trader Quest',
				quests = { 66937, 66938, 66940, 72427, 75363, 75371 },
				isAvailable = hasSkill(171, 50),
			},
			{
				name = 'Profession Trainer Quest',
				quests = { 70530, 70531, 70532, 70533 },
				isAvailable = hasSkill(171, 50),
			},
			{
				name = 'Decaying Phlegm',
				note = 'Decayed Enemies',
				coords = 'The Azure Span 17.27 36.98',
				quests = { 70504 },
			},
			{
				name = 'Elementious Splinter',
				note = 'Elemental Enemies',
				quests = { 70511 },
			},
			{
				name = 'Experimental Substance',
				note = 'Chests / Scout Packs',
				quests = { 66373 },
			},
			{
				name = 'Reawakened Catalyst',
				note = 'Chests / Scout Packs',
				quests = { 66374 },
			},

			-- one-time
			-- 75646 - Nutrient Diluted Protofluid - Zaralek Cavern (2133) 52.63 18.30
			-- 75649 - Marrow-Ripened Slime - Zaralek Cavern (2133) 62.13 41.13
			-- 75651 - Suspicious Mold - Zaralek Cavern (2133) 40.44 59.21
		},

		[164] = { -- blacksmithing
			{
				name = 'Treatise',
				quests = { 74109 },
				isAvailable = hasSkill(164, 25),
			},
			{
				name = 'Faction Trader Quest',
				quests = { 66517, 66897, 66941, 75148, 75569 },
				isAvailable = hasSkill(164, 50),
			},
			{
				name = 'Profession Trainer Quest',
				quests = { 70211, 70233, 70234, 70235 },
				isAvailable = hasSkill(164, 50),
			},
			{
				name = 'Work Orders Quest',
				quests = { 70589 },
				isAvailable = hasSkill(164, 25),
			},
			{
				name = 'Draconium Blade Sharpener',
				note = 'Chests / Scout Packs',
				quests = { 66382 },
			},
			{
				name = 'Molten Globule',
				note = 'Fire Enemies',
				coords = 'The Waking Shores 39.29 74.07',
				quests = { 70513 },
			},
			{
				name = 'Primeval Earth Fragment',
				note = 'Earth Enemies',
				coords = 'Ohn\'ahran Plains 58 50.5',
				quests = { 70512 },
			},
			{
				name = 'Valdrakken Weapon Chain',
				note = 'Chests / Scout Packs',
				quests = { 66381 },
			},

			-- one-time
			-- 76078 - Well-Worn Kiln - Zaralek Cavern (2133) 57.15 54.65
			-- 76079 - Brimstone Rescue Ring - Zaralek Cavern (2133) 48.32 22.00
			-- 76080 - Zaqali Elder Spear - Zaralek Cavern (2133) 27.51 42.89
		},

		[333] = { -- enchanting
			{
				name = 'Treatise',
				quests = { 74110 },
				isAvailable = hasSkill(333, 25),
			},
			{
				name = 'Faction Trader Quest',
				quests = { 66884, 66900, 66935, 72423, 75150, 75865 },
				isAvailable = hasSkill(333, 50),
			},
			{
				name = 'Profession Trainer Quest',
				quests = { 72172, 72173, 72175 },
				isAvailable = hasSkill(333, 50),
			},
			{
				name = 'Primal Dust',
				note = 'Chests / Scout Packs',
				quests = { 66378 },
			},
			{
				name = 'Primalist Charm',
				note = 'Humanoid Primalists',
				coords = 'Thaldraszus 53.19 64.83',
				quests = { 70515 },
			},
			{
				name = 'Primordial Aether',
				note = 'Arcane Enemies',
				coords = 'The Azure Span 40.25 60.62',
				quests = { 70514 },
			},
			{
				name = 'Prismatic Focusing Shard',
				note = 'Chests / Scout Packs',
				quests = { 66377 },
			},

			-- one time
			-- 75508 - Lava-Drenched Shadow Crystal - Zaralek Cavern (2133) 48.23 17.06
			-- 75509 - Shimmering Aqueous Orb - Zaralek Cavern (2133) 62.38 53.79
			-- 75510 - Resonating Arcane Crystal - Zaralek Cavern (2133) 36.63 69.45
		},

		[202] = { -- engineering
			{
				name = 'Treatise',
				quests = { 74111 },
				isAvailable = hasSkill(202, 25),
			},
			{
				name = 'Faction Trader Quest',
				quests = { 66890, 66891, 66942, 72396, 75575 },
				isAvailable = hasSkill(202, 50),
			},
			{
				name = 'Profession Trainer Quest',
				quests = { 66942, 70540, 70545, 70557 },
				isAvailable = hasSkill(202, 50),
			},
			{
				name = 'Work Orders Quest',
				quests = { 70591 },
				isAvailable = hasSkill(202, 25),
			},
			{
				name = 'Eroded Titan Gizmo',
				note = 'Chests / Scout Packs',
				quests = { 66379 },
			},
			{
				name = 'Infinitely Attachable Pair o\' Docks',
				note = 'Dragonkin Enemies',
				quests = { 70517 },
			},
			{
				name = 'Keeper\'s Mark',
				note = 'Titan / Tyrhold Enemies',
				quests = { 70516 },
			},
			{
				name = 'Watcher Power Core',
				note = 'Chests / Scout Packs',
				quests = { 66380 },
			},
		},

		[182] = { -- herbalism
			{
				name = 'Treatise',
				quests = { 74107 },
				isAvailable = hasSkill(182, 25),
			},
			{
				name = 'Profession Trainer Quest',
				quests = { 70613, 70614, 70616 },
				isAvailable = hasSkill(182, 50),
			},
			{
				name = 'Dreambloom Petal',
				quests = { 71857, 71858, 71859, 71860, 71861 },
				isCompleted = AelTodoHasCompleted 'ALL',
			},
			{
				name = 'Dreambloom',
				quests = { 71864 },
			},
		},

		[773] = { -- inscription
			{
				name = 'Treatise',
				quests = { 74105 },
				isAvailable = hasSkill(773, 25),
			},
			{
				name = 'Faction Trader Quest',
				quests = { 66943, 66944, 66945, 72438, 75149, 75573 },
				isAvailable = hasSkill(773, 50),
			},
			{
				name = 'Profession Trainer Quest',
				quests = { 70558, 70559, 70560, 70561 },
				isAvailable = hasSkill(773, 50),
			},
			{
				name = 'Work Orders Quest',
				quests = { 70592 },
				isAvailable = hasSkill(773, 25),
			},
			{
				name = 'Curious Djaradin Rune',
				note = 'Djaradin',
				coords = 'The Waking Shores 28.88 57.90',
				quests = { 70518 },
			},
			{
				name = 'Draconic Glamour',
				note = 'Dragonkin',
				coords = 'Thaldraszus 45.76 56.59',
				quests = { 70519 },
			},
			{
				name = 'Iskaaran Trading Ledger',
				note = 'Chests / Scout Packs',
				quests = { 66376 },
			},
			{
				name = 'Phoenix Feather Quill',
				note = 'Chests / Scout Packs',
				quests = { 66375 },
			},

			-- one-time
			-- 76117 - Intricate Zaqali Runes - Zaralek Cavern (2133) 36.73 46.33
			-- 76120 - Hissing Rune Draft - Zaralek Cavern (2133) 53.02 74.26
			-- 76121 - Ancient Research - Zaralek Cavern (2133) 54.53 20.19
		},

		[755] = { -- jewelcrafting
			{
				name = 'Treatise',
				quests = { 74112 },
				isAvailable = hasSkill(755, 25),
			},
			{
				name = 'Faction Trader Quest',
				quests = { 66516, 66949, 66950, 72428, 75362, 75602 },
				isAvailable = hasSkill(755, 50),
			},
			{
				name = 'Profession Trainer Quest',
				quests = { 70562, 70563, 70564, 70565 },
				isAvailable = hasSkill(755, 50),
			},
			{
				name = 'Work Orders Quest',
				quests = { 70593 },
				isAvailable = hasSkill(755, 25),
			},
			{
				name = 'Ancient Gem Fragments',
				note = 'Chests / Scout Packs',
				quests = { 66388 },
			},
			{
				name = 'Chipped Tyrstone',
				note = 'Chests / Scout Packs',
				quests = { 66389 },
			},
			{
				name = 'Elegantly Engraved Embellishment',
				note = 'Sundered Flame',
				coords = 'Thaldraszus 52.84 64.75',
				quests = { 70521 },
			},
			{
				name = 'Incandescent Curio',
				note = 'Elementals',
				-- coords = 'The Waking Shore 75.77 37.00',
				quests = { 70520 },
			},

			-- one-time
			-- 75652 - Snubbed Snail Shells - Zaralek Cavern (2133) 40.39 80.65
			-- 75653 - Gently Jostled Jewels - Zaralek Cavern (2133) 34.50 45.42
			-- 75654 - Broken Barter Boulder - Zaralek Cavern (2133) 54.39 32.45
		},

		[165] = { -- leatherworking
			{
				name = 'Treatise',
				quests = { 74113 },
				isAvailable = hasSkill(165, 25),
			},
			{
				name = 'Faction Trader Quest',
				quests = { 66363, 66364, 66951, 72407, 75354, 75368 },
				isAvailable = hasSkill(165, 50),
			},
			{
				name = 'Profession Trainer Quest',
				quests = { 70567, 70568, 70569, 70571 },
				isAvailable = hasSkill(165, 50),
			},
			{
				name = 'Work Orders Quest',
				quests = { 70594 },
				isAvailable = hasSkill(165, 25),
			},
			{
				name = 'Exceedingly Soft Skin',
				note = 'Slyvern / Vorquin',
				coords = 'The Azure Span 40.30 39.44',
				quests = { 70523 },
			},
			{
				name = 'Molted Dragon Scales',
				note = 'Chests / Scout Packs',
				quests = { 66384 },
			},
			{
				name = 'Ossified Hide',
				note = 'Drakes',
				coords = 'The Waking Shores 81.59 33.08',
				quests = { 70522 },
			},
			{
				name = 'Preserved Animal Parts',
				note = 'Chests / Scout Packs',
				quests = { 66385 },
			},

			-- one time
			-- 75495 - Flame-Infused Scale Oil - Zaralek Cavern (2133) 41.17 48.81
			-- 75496 - Lava-Forged Leatherworker's "Knife" - Zaralek Cavern (2133) 45.23 21.08
			-- 75502 - Sulfur-Soaked Skins - Zaralek Cavern (2133) 49.53 54.74
		},

		[186] = { -- mining
			{
				name = 'Treatise',
				quests = { 74106 },
				isAvailable = hasSkill(186, 25),
			},
			{
				name = 'Profession Trainer Quest',
				quests = { 70617, 70618, 72157 },
				isAvailable = hasSkill(186, 50),
			},
			{
				name = 'Iridescent Ore Fragments',
				quests = { 72160, 72161, 72162, 72163, 72164 },
				isCompleted = AelTodoHasCompleted 'ALL',
			},
			{
				name = 'Iridescent Ore',
				quests = { 72165 },
			},
			-- {
			-- 	name = 'Heated Ore Sample',
			-- 	quests = { 66936 },
			-- },
		},

		[393] = { -- skinning
			{
				name = 'Treatise',
				quests = { 74114 },
				isAvailable = hasSkill(393, 25),
			},
			{
				name = 'Profession Trainer Quest',
				quests = { 70619, 70620, 72158, 72159 },
				isAvailable = hasSkill(393, 50),
			},
			{
				name = 'Curious Hide Scrap',
				quests = { 70381, 70383, 70384, 70385, 70386 },
				isCompleted = AelTodoHasCompleted 'ALL',
			},
			{
				name = 'Large Sample of Curious Hide',
				quests = { 70389 },
			},
		},

		[197] = { -- tailoring
			{
				name = 'Treatise',
				quests = { 74115 },
				isAvailable = hasSkill(197, 25),
			},
			{
				name = 'Faction Trader Quest',
				quests = { 66952, 66953, 72410, 75407, 75600 },
				isAvailable = hasSkill(197, 50),
			},
			{
				name = 'Profession Trainer Quest',
				quests = { 70572, 70582, 70586, 70587 },
				isAvailable = hasSkill(197, 50),
			},
			{
				name = 'Work Orders Quest',
				quests = { 70595 },
				isAvailable = hasSkill(197, 25),
			},
			{
				name = 'Ohn\'arhan Weave',
				note = 'Nokhud',
				coords = 'Ohn\'ahran Plains 83.56 56.13',
				quests = { 70524 },
			},
			{
				name = 'Primalweave Spindle',
				note = 'Chests / Scout Packs',
				quests = { 66387 },
			},
			{
				name = 'Stupidly Effective Stitchery',
				note = 'Gnolls',
				coords = 'The Azure Span 21.96 40.95',
				quests = { 70525 },
			},
			{
				name = 'Umbral Bone Needle',
				note = 'Chests / Scout Packs',
				quests = { 66386 },
			},

			-- one-time
			-- 76102 - Abandoned Reserve Chute - Zaralek Cavern (2133) 47.21 48.54
			-- 76110 - Used Medical Wrap Kit - Zaralek Cavern (2133) 59.16 73.18
			-- 76116 - Exquisitely Embroidered Banner - Zaralek Cavern (2133) 44.54 15.67
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
end
