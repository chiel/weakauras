-- PLAYER_ENTERING_WORLD, QUEST_TURNED_IN, STATUS, PLAYER_TARGET_CHANGED

function Trigger(event, ...)
	aura_env.init()

	local turnedInQuest = nil
	if event == 'QUEST_TURNED_IN' then
		turnedInQuest = select(1, ...)
	end

	local sections = {}

	local entries = AelTodoProcessEntries(aura_env.weeklies, turnedInQuest)
	if #entries > 0 then
		table.insert(sections, { name = 'Weeklies', entries = entries })
	end

	entries = AelTodoProcessEntries(aura_env.biweeklies, turnedInQuest)
	if #entries > 0 then
		table.insert(sections, { name = 'Bi-weeklies', entries = entries })
	end

	local plugin = {
		name = 'Dragonflight Errands',
		priority = 'HIGH',
		sections = sections,
	}

	WeakAuras.ScanEvents('AEL_TODO_UPDATE', 'dragonflight_errands', plugin)
end
