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
			if item.destroy then
				item:destroy()
			elseif item.burn then
				item:burn()
			end
		end
	}

	function Dumpster.new()
		return setmetatable({}, Dumpster)
	end

	function Dumpster:dump(item, finalizer)
		self[item] = finalizer or finalizers[typeof(item)]
		return self
	end

	function Dumpster:burn()
		local item, finalizer = next(self)
		while item ~= nil do
			finalizer(item)
			self[item] = nil
			item, finalizer = next(self)
		end
		return self
	end

	Dumpster.destroy = Dumpster.burn
end

return Dumpster
