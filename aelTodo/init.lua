aura_env.cache = {}

aura_env.colors = {
	completed = CreateColor(unpack(aura_env.config.color_completed)):GenerateHexColor(),
	heading = CreateColor(unpack(aura_env.config.color_heading)):GenerateHexColor(),
	note = CreateColor(unpack(aura_env.config.color_note)):GenerateHexColor(),
	pending = CreateColor(unpack(aura_env.config.color_pending)):GenerateHexColor(),
	unavailable = CreateColor(unpack(aura_env.config.color_unavailable)):GenerateHexColor(),
}

aura_env.priorityOrder = { 'HIGH', 'MEDIUM', 'LOW' }
