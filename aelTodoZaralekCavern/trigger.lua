-- PLAYER_ENTERING_WORLD, PLAYER_TARGET_CHANGED, STATUS

function Trigger(event, ...)
	aura_env.init()

	local turnedInQuest = nil
	if event == 'QUEST_TURNED_IN' then
		turnedInQuest = select(1, ...)
	end

	local inactiveZone = math.floor((GetServerTime() - aura_env.patchRelease) / 60 / 60 / 24 % 4) + 2

	local events = {}
	local rares = {}

	for i, zone in ipairs(aura_env.subzones) do
		if i ~= inactiveZone then
			for _, entry in ipairs(zone.events) do
				table.insert(events, entry)
			end
			for _, entry in ipairs(zone.rares) do
				table.insert(rares, entry)
			end
		end
	end

	table.sort(events, function(a, b)
		return a.name < b.name
	end)

	table.sort(rares, function(a, b)
		return a.name < b.name
	end)

	local sections = {}

	local entries = AelTodoProcessEntries(aura_env.general, turnedInQuest)
	if #entries > 0 then
		table.insert(sections, { name = 'Zaralek Cavern', entries = entries })
	end

	entries = AelTodoProcessEntries(rares, turnedInQuest)
	if #entries > 0 then
		table.insert(sections, { name = 'Zaralek Cavern Rares', entries = entries })
	end

	entries = AelTodoProcessEntries(events, turnedInQuest)
	if #entries > 0 then
		table.insert(sections, { name = 'Zaralek Cavern Events', entries = entries })
	end

	local plugin = {
		name = 'Zaralek Cavern',
		priority = 'LOW',
		sections = sections,
	}

	WeakAuras.ScanEvents('AEL_TODO_UPDATE', 'zaralek_cavern', plugin)
end
