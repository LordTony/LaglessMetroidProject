--This is an example Lua (https://www.lua.org) script to give a general idea of how to build scripts
--Press F5 or click the Run button to execute it
--Type "emu." to show a list of all available API function

nmi_addr = 0xC0D6
return_from_nmi_addr = 0xC212
framesToResetOn = 120
timer = 0
scanlines = {}

function onFrame()
	timer = timer + 1

	if timer >= framesToResetOn then
		local min_val = math.min(table.unpack(scanlines))
		local max_val = math.max(table.unpack(scanlines))
		emu.drawString(5, 5, "Scanlines to complete frame work", 0xFFFFFF, 0x0, 0, framesToResetOn)
		emu.drawString(5, 15, "Low " .. min_val, 0xFFFFFF, 0x0, 0, framesToResetOn)

		local color = 0xFFFFFF
		if max_val >= 220 then
			color = 0xFFFF00
		end
		if max_val >= 240 then
			color = 0xFF0000
		end
		emu.drawString(50, 15, "High " .. max_val, color, 0x0, 0, framesToResetOn)
		
		timer = 0
		scanlines = {}
	end
end

function noteCycleAndScanline(address)
	local state = emu.getState()
	scanlines[#scanlines + 1] = state["ppu.scanline"]
end

function printHex(num)
	return "$" .. string.upper(string.format("%x", num))
end

function round(num)
	return string.format("%.2f", num)
end

--Register some code (printInfo function) that will be run at the end of each frame

emu.addMemoryCallback(noteCycleAndScanline, emu.callbackType.exec, nmi_addr)
-- emu.addMemoryCallback(noteCycleAndScanline, emu.callbackType.exec, return_from_nmi_addr)
emu.addEventCallback(onFrame, emu.eventType.start)