local DESTROY_METHODS = { "destroy", "Destroy", "Disconnect" }

local Dumpster = {} do
	Dumpster.__index = Dumpster

	local finalizers = setmetatable({
		["function"] = function(item)
			return item()
		end,
		["Instance"] = game.Destroy,
		["RBXScriptConnection"] = Instance.new("BindableEvent").Event:Connect(function()
		end).Disconnect,
		["table"] = function(item)
			for _, methodName in ipairs(DESTROY_METHODS) do
				if item[methodName] then
					item[methodName](item)
				end
			end
		end,
	}, {
		__index = function(self, className)
			error(("Can't dump item of type '%s'"):format(className), 3)
		end,
	})

	function Dumpster.new()
		return setmetatable({}, Dumpster)
	end

	function Dumpster:dump(item)
		self[item] = finalizers[typeof(item)]
		return item
	end

	function Dumpster:burn()
		for item, finalizer in pairs(self) do
			finalizer(item)
		end
		table.clear(self)
	end

	Dumpster.destroy = Dumpster.burn
end

return Dumpster
