#!/usr/bin/lua

local libuci = require "uci"

config = {}

config.uci = libuci:cursor()

function config.get(sectionname, option, default)
	return config.uci:get("lime", sectionname, option) or config.uci:get("lime-defaults", sectionname, option, default)
end

function config.foreach(configtype, callback)
	return config.uci:foreach("lime", configtype, callback)
end

function config.get_all(sectionname)
	local ret = uci:get_all("lime", sectionname) or {}
	for key,value in pairs(uci:get_all("lime-defaults", sectionname)) do
		if (ret[key] == nil) then
			ret[key] = value
		end
	end
	return ret
end

return config
