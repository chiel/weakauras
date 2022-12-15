function Trigger(allstates)
	local pluginsByPriority = {}
	for key, plugin in pairs(aura_env.cache) do
		local priority = plugin.priority or 'LOW'
		if pluginsByPriority[priority] == nil then
			pluginsByPriority[priority] = {}
		end
		table.insert(pluginsByPriority[priority], key)
	end

	local pluginOrder = {}
	for _, priority in ipairs(aura_env.priorityOrder) do
		if pluginsByPriority[priority] ~= nil then
			for _, key in ipairs(pluginsByPriority[priority]) do
				table.insert(pluginOrder, key)
			end
		end
	end

	local i = 1
	for _, key in ipairs(pluginOrder) do
		local plugin = aura_env.cache[key]
		for _, section in ipairs(plugin.sections) do
			allstates['heading_' .. key .. '_' .. section.name] = {
				changed = true,
				show = true,
				name = section.name,
				index = i,
			}
			i = i + 1

			for _, entry in ipairs(section.entries) do
				local name = entry.name

				allstates['entry_' .. key .. '_' .. section.name .. '_' .. entry.name] = {
					changed = true,
					show = true,
					name = entry.name,
					index = i,
				}
				i = i + 1
			end
		end
	end

	return true
end
