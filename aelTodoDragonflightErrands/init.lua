aura_env.initialised = false

aura_env.init = function()
	if aura_env.initialised then
		return
	end

	aura_env.initialised = true

	aura_env.weeklies = {
		{
			name = 'Aiding the Accord',
			quests = { 70750, 72068, 72373, 72374, 72375 },
		},
		{
			name = 'Community Feast',
			quests = { 70893 },
		},
		{
			name = 'Grand Hunt',
			quests = { 70906 },
		},
		{
			name = 'Siege on Dragonbane Keep',
			quests = { 70866 },
		},
		{
			name = 'World Boss',
			quests = { 72054, 72055, 72056, 72057 },
		},
	}

	aura_env.biweeklies = {
		{
			name = 'Aylaag Camp',
			quests = {
				65784,
				65789,
				65792,
				65796,
				65798,
				66698,
				66711,
				67034,
				67039,
				67605,
				70210,
				70279,
				70701,
				70990,
			},
			isCompleted = AelTodoHasCompleted(4),
		},
	}
end
