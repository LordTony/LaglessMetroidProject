--This is an example Lua (https://www.lua.org) script to give a general idea of how to build scripts
--Press F5 or click the Run button to execute it
--Type "emu." to show a list of all available API function

start_addr = 0xEF00
end_addr = 0xF022
how_many_to_show = 50
framesToResetOn = 200
timer = 0

function printHex(num)
	return "0x" .. string.upper(string.format("%x", num))
end

function round(num)
	return string.format("%.2f", num)
end

function onFrame()
	timer = timer + 1
	--if drawMacroCount > 0 then
	--	emu.drawString(5, 5, "DrawMacro this frame: " .. drawMacroCount, 0xFFFFFF, 0x0, 0, 600)
	--	drawMacroCount = 0
	--	
	--end
	
	if timer >= framesToResetOn then
		local entries = {}
		for addr, ct in pairs(counts) do
    		table.insert(entries, { addr = addr, ct = ct })
		end

		table.sort(entries, function(a, b)
    		return a.ct > b.ct
		end)
		local limit = math.min(how_many_to_show, #entries)
		
		emu.drawString(5, 5, "Top " .. limit .. " Hotspots in range " .. printHex(start_addr) .. "-" .. printHex(end_addr), 0xFFFFFF, 0x0, 0, framesToResetOn)
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
	local ct = counts[address]
	if ct == nil then
		ct = 0
	end
	ct = ct + 1
	counts[address] = ct
end

--Register some code (printInfo function) that will be run at the end of each frame
emu.addMemoryCallback(countHotspots, emu.callbackType.exec, start_addr, end_addr)
emu.addEventCallback(onFrame, emu.eventType.start)

--Display a startup message
emu.displayMessage("Script", "Example Lua script loaded.")