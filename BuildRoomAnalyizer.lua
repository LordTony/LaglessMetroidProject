count_macro_addr = 0xEB4D
count_row_addr = 0xEB28
count_struct_addr = 0xE69C
erase_start_addr = 0xE64D
erase_end_addr = 0xE65A
start_counting_stuff_addr = 0xE629
print_stuff_addr_1 = 0xE6BE
print_stuff_addr_2 = 0xE6F0	
work_finished_addr = 0xC0DC

num_macros = 0
num_rows = 0
num_structs = 0
erase_start_cycle = 0
erase_start_scanline = 0
erase_end_cycle = 0
erase_end_scanline = 0
room_number = 0
room_ram_addr = 0
now_counting_stuff = false
print_work_finished = false
start_cycle = 0
start_scanline = 0

function printHex(num)
	return "$" .. string.upper(string.format("%x", num))
end

function round(num)
	return string.format("%.2f", num)
end

function cycle(state)
	return state["cpu.cycleCount"] 
end

function scanline(state)
	return state["ppu.scanline"]
end

function startCounting()
	now_counting_stuff = true
	num_macros = 0
	num_rows = 0
	num_structs = 0
	roomNumber = emu.read(0x005A, 8)
	local state = emu.getState()
	start_cycle = cycle(state)
	start_scanline = scanline(state)
	emu.log("Started Counting  " .. printHex(roomNumber))
end

function endCountingAndPrintData()
	if(now_counting_stuff == true) then
		now_counting_stuff = false
		print_work_finished = true
		local state = emu.getState()
		local final_cycle = cycle(state) - start_cycle
		local final_scanline = scanline(state) - start_scanline
		local final_erase_cycle = erase_end_cycle - erase_start_cycle
		local final_erase_scanline = erase_end_scanline - erase_start_scanline
		local final_build_cycle = final_cycle - final_erase_cycle
		local final_build_scanline = final_scanline - final_erase_scanline
		emu.clearScreen()
		
		emu.drawString(5, 5, "Room " .. printHex(roomNumber) .. " at " .. printHex(room_ram_addr) .. " ~" .. round(final_scanline * 100 / 240) .."% Frame", 0x00FF00, 0x0, 0, 6000)
		emu.drawString(5, 15, "Cycles " .. final_cycle, 0xFFFFFF, 0x0, 0, 6000)
		emu.drawString(75, 15, "Scanlines " .. final_scanline, 0xFFFFFF, 0x0, 0, 6000)
		
		emu.drawString(5, 25, "Erasing ~" .. round(final_erase_scanline * 100 / 240) .."% Frame", 0x00FF00, 0x0, 0, 6000)
		emu.drawString(5, 35, "Cycles " .. final_erase_cycle, 0xFFFFFF, 0x0, 0, 6000)
		emu.drawString(75, 35, "Scanlines " .. final_erase_scanline, 0xFFFFFF, 0x0, 0, 6000)
		
		emu.drawString(5, 45, "Building: ~" .. round(final_build_scanline * 100 / 240) .."% Frame", 0x00FF00, 0x0, 0, 6000)
		emu.drawString(5, 55, "Cycles " .. final_build_cycle, 0xFFFFFF, 0x0, 0, 6000)
		emu.drawString(75, 55, "Scanlines " .. final_build_scanline, 0xFFFFFF, 0x0, 0, 6000)
		emu.drawString(5, 65, "Structs " .. num_structs, 0xFFFFFF, 0x0, 0, 6000)
		emu.drawString(75, 65, "Rows " .. num_rows, 0xFFFFFF, 0x0, 0, 6000)
		emu.drawString(135, 65, "Macros " .. num_macros, 0xFFFFFF, 0x0, 0, 6000)
		
		emu.drawString(5, 230, "Tiles Done S/L " .. scanline(state), 0x00FF00, 0x0, 0, 6000)
		
		emu.log("Completed Counting  " .. printHex(roomNumber))
	end
end

function measureEraseStart()
	local state = emu.getState()
	erase_start_cycle = cycle(state)
	erase_start_scanline = scanline(state)
	room_ram_addr = emu.read(0x003A, 8) << 8
	emu.log("Erasing " .. printHex(roomNumber))
end

function measureEraseEnd()
	local state = emu.getState()
	erase_end_cycle = cycle(state)
	erase_end_scanline = scanline(state)
	emu.log("Completed Erasing " .. printHex(roomNumber))
end

function countStructure()
	if(now_counting_stuff == true) then
		num_structs = num_structs + 1
	end
end

function countRow()
	if(now_counting_stuff == true) then
		num_rows = num_rows + 1
	end
end

function countMacro()
	if(now_counting_stuff == true) then
		num_macros = num_macros + 1
	end
end

function onWorkFinished()
	if(print_work_finished == true) then
		print_work_finished = false
		local state = emu.getState()
		emu.drawString(120, 230, "Work Done S/L " .. scanline(state), 0x00FF00, 0x0, 0, 6000)
	end
end

emu.addMemoryCallback(startCounting, emu.callbackType.exec, start_counting_stuff_addr)
emu.addMemoryCallback(endCountingAndPrintData, emu.callbackType.exec, print_stuff_addr_1)
emu.addMemoryCallback(endCountingAndPrintData, emu.callbackType.exec, print_stuff_addr_2)
emu.addMemoryCallback(measureEraseStart, emu.callbackType.exec, erase_start_addr)
emu.addMemoryCallback(measureEraseEnd, emu.callbackType.exec, erase_end_addr)
emu.addMemoryCallback(countStructure, emu.callbackType.exec, count_struct_addr)
emu.addMemoryCallback(countRow, emu.callbackType.exec, count_row_addr)
emu.addMemoryCallback(countMacro, emu.callbackType.exec, count_macro_addr)
emu.addMemoryCallback(onWorkFinished, emu.callbackType.exec, work_finished_addr)