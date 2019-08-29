local Dumpster = {} do
	Dumpster.__index = Dumpster

	local finalizers = {
		["function"] = function(item)
			item()
		end,
		["Instance"] = function(item)
			item:Destroy()
		end,
		["RBXScriptConnection"] = function(item)
			item:Disconnect()
		end,
		["table"] = function(item)
			item:destroy()
		end
	}

	function Dumpster.new()
		return setmetatable({}, Dumpster)
	end

	function Dumpster:dump(item, finalizer)
		self[item] = finalizer or finalizers[typeof(item)]
	end

	function Dumpster:burn()
		repeat
			for item, finalizer in pairs(self) do
				finalizer(item)
				self[item] = nil
			end
		until next(self) == nil
	end
end

return Dumpster
