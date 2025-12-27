--This is an example Lua (https://www.lua.org) script to give a general idea of how to build scripts
--Press F5 or click the Run button to execute it
--Type "emu." to show a list of all available API function

watch_addresses = {
	{ s = 0xB000, e = 0xFFFF }
}
ignore_regions = {
	{ s = 0xC0C2, e = 0xC0C9 } 
}
how_many_to_show = 50
framesToResetOn = 60
timer = 0

function onFrame()
	timer = timer + 1

	if timer >= framesToResetOn then
		local entries = {}
		for addr, ct in pairs(counts) do
    		table.insert(entries, { addr = addr, ct = ct })
		end

		table.sort(entries, function(a, b)
    		return a.ct > b.ct
		end)
		local limit = math.min(how_many_to_show, #entries)
		
		--emu.drawString(5, 5, "Top " .. limit .. " Hotspots in range " .. printHex(start_addr) .. "-" .. printHex(end_addr), 0xFFFFFF, 0x0, 0, framesToResetOn)
		emu.drawString(5, 15, "Avg hit/frame - " .. framesToResetOn .. " frames (~" .. framesToResetOn / 60 .. " sec)", 0xFFFFFF, 0x0, 0, framesToResetOn)
		
		-- print the top however many
		for i = 1, limit do
			local addr = tostring(entries[i].addr)
			local avg = entries[i].ct / framesToResetOn
			local col = 0xFFFFFF
			if avg > 15 then
				col = 0xFFFF00
			end
			if avg > 20 then
				col = 0xFF0000
			end
			local cols = 3
			local x_loc_offset = ((i - 1) % cols) * 80
			local y_loc_offset = ((i - 1) // cols) * 10
    		emu.drawString(5 + x_loc_offset, 30 + y_loc_offset, printHex(addr) .. ": " .. round(avg), col, 0x0, 0, framesToResetOn)
		end
		timer = 0
		counts = {}
	end
end

counts = {}
function countHotspots(address)
	local ignore = false
	for _, ignore_region in ipairs(ignore_regions) do
		if(address >= ignore_region["s"] and address <= ignore_region["e"]) then
			ignore = true
			break
		end
	end

	if(not ignore) then
		local ct = counts[address]
		if ct == nil then
			ct = 0
		end
		ct = ct + 1
		counts[address] = ct
	end
end

function printHex(num)
	return "$" .. string.upper(string.format("%x", num))
end

function round(num)
	return string.format("%.2f", num)
end

--Register some code (printInfo function) that will be run at the end of each frame
for _, addr in ipairs(watch_addresses) do
    emu.addMemoryCallback(countHotspots, emu.callbackType.exec, addr["s"], addr["e"])
end

emu.addEventCallback(onFrame, emu.eventType.start)

--Display a startup message
emu.displayMessage("Script", "Hmm.")