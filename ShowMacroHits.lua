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
function showMacros()
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
	  drawMacroCount = drawMacroCount + 1
end

function onFrame()
	if drawMacroCount > 0 then
		emu.drawString(5, 5, "DrawMacro this frame: " .. drawMacroCount, 0xFFFFFF, 0x0, 0, 600)
		drawMacroCount = 0
	end
end

--Register some code (printInfo function) that will be run at the end of each frame
drawMacro = 0xEF32
emu.addMemoryCallback(showMacros, emu.callbackType.exec, drawMacro)
emu.addEventCallback(onFrame, emu.eventType.start)

--Display a startup message
emu.displayMessage("Script", "Example Lua script loaded.")