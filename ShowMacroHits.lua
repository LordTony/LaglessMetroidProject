--This is an example Lua (https://www.lua.org) script to give a general idea of how to build scripts
--Press F5 or click the Run button to execute it
--Type "emu." to show a list of all available API function

function tableToString(t)
    local s = "{"
    local first = true
    for k, v in pairs(t) do
        if not first then
            s = s .. ", "
        end
        -- Handle different types for keys and values
        local key_str = tostring(k)
		local start_idx, end_idx = string.find(k, "cycle", i)
        -- Add quotes for string keys and values if desired
        if type(k) == "string" and start_idx then
            key_str = string.format('"%s"', k)
        end

		if start_idx then
        	s = s .. key_str
        end
        first = false
    end
    s = s .. "}"
    return s
end

--done = false
drawMacroCount = 0
function countHotspots(address)
	  state = emu.getState()
	  --if done == false then
	  --	emu.drawString(5, 5, state["ppu.cycle"], 0xFFFFFF, 0xFF000000, 225, 600)
	  --	done = true
	  --end
	  local col = state["ppu.cycle"]
	  local line = state["ppu.scanline"]
	  local lifetime = 60
	  local visual_start_offset = -100
	  emu.drawRectangle(col, line + visual_start_offset, 3, 3, 0xAFFFAA90, true, lifetime)
	  emu.drawRectangle(col, line + visual_start_offset, 3, 3, 0xAFFF0090, false, lifetime)
	  emu.drawString(5, 15, "0x" .. string.upper(string.format("%x", address)), 0xFFFFFF, 0x0, 0, lifetime)
	  
	  drawMacroCount = drawMacroCount + 1
end

framesToResetOn = 600
timer = 0
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

		-- sort descending by count
		table.sort(entries, function(a, b)
    		return a.ct > b.ct
		end)

		-- print the top 15 (or fewer if there aren’t that many)
		local limit = math.min(15, #entries)
		for i = 1, limit do
			local addr = tostring(entries[i].addr)
			local avg = entries[i].ct / framesToResetOn
    		emu.drawString(5, 5 + (i * 10), "0x" .. string.upper(string.format("%x", addr)) .. ": " .. avg, 0xFFFFFF, 0x0, 0, 600)
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
emu.addMemoryCallback(countHotspots, emu.callbackType.exec, 0xC200, 0xFFFF)
emu.addEventCallback(onFrame, emu.eventType.start)

--Display a startup message
emu.displayMessage("Script", "Example Lua script loaded.")