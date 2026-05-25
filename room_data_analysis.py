import re
from dataclasses import dataclass
from collections import defaultdict

@dataclass
class StructDef:
    Label: str
    Id: str
    Rows: list[str]

@dataclass
class RoomStructInfo:
    Position: str
    StructPtr: str
    Palette: str

@dataclass
class RoomDef:
    Id: str
    DefaultPalette: int
    Structs: list[RoomStructInfo]
    Enemys: list[str]

hexMap = "0123456789ABCDEF"

f = open("./Source_Files/Bank01.asm", "r")

lines = f.readlines();

struct_pointer_table_start = next((index for index, line in enumerate(lines) if ".advance StructPointerTable_Hi" in line), None)
struct_pointer_table_end = next((index for index, line in enumerate(lines) if ".advance StructPointerTable_Lo" in line), None)
struct_target_lines = [line for line in lines[struct_pointer_table_start:struct_pointer_table_end] if not line.strip().startswith(";") and not line.strip() == ""] 

# Parse the struct pointer table based on the high byte
struct_ptr_labels = []
for line in struct_target_lines:
    labels = line.replace(".byte", "").strip().split(",")
    for label in labels:
        if(label.strip().startswith(">")):
            struct_ptr_labels.append(label.replace(">", "").strip())

structs = []
for struct_current_index, label in enumerate(struct_ptr_labels):
    idx = next((index for index, line in enumerate(lines) if line.strip().startswith(label + ":")), None)
    ctrl_byte_mode = True
    ctrl_byte = -1
    current_struct = StructDef(label, "$" + f"{struct_current_index:02X}", [[]])
    structs.append(current_struct)
    done = False
    while not done:
        line = lines[idx].strip();
        if not line.startswith(";"):
            bytes = re.findall(r'(\$[0-9A-F]{2}?)', line)
            for b in bytes:
                if ctrl_byte_mode:
                    if b == '$FF':
                        structs[struct_current_index].Rows.pop()
                        struct_current_index += 1
                        done = True
                        break
                    else:
                        ctrl_byte = int(b.replace('$', '0x'), 16)
                        ctrl_byte_mode = False
                        current_struct.Rows[-1].append(b)
                else:
                    current_struct.Rows[-1].append(b)
                    ctrl_byte -= 1
                    if(ctrl_byte == 0):
                        current_struct.Rows.append([])
                        ctrl_byte_mode = True
        idx += 1

for x in structs:
    print("; Structure #" + str(x.Id))
    print(x.Label)
    for r in x.Rows:
        print('\t.byte ', end='')
        for idx, byteStr in enumerate(r):
            if idx + 1 < len(r):
                print('#' + byteStr,end=', ')
            else:
                print('#' + byteStr)
    print("\t.byte #$FF")
    print()

print("="*25 + " [ Rooms ] " + "="*25 + "\n")


room_pointer_table_start = next((index for index, line in enumerate(lines) if ".advance RoomPointerTable_Hi" in line), None)
room_pointer_table_end = next((index for index, line in enumerate(lines) if ".advance RoomPointerTable_Lo" in line), None)
room_target_lines = [line for line in lines[room_pointer_table_start:room_pointer_table_end] if not line.strip().startswith(";") and not line.strip() == ""]

# Parse the room pointer table based on the high byte
room_ptr_labels = []
for line in room_target_lines:
    labels = line.replace(".byte", "").strip().split(",")
    for label in labels:
        if(label.strip().startswith(">")):
            room_ptr_labels.append(label.replace(">", "").strip())

# parse the room bytes
unsplit_room_bytes = []
for label in room_ptr_labels:
    idx = next((index for index, line in enumerate(lines) if line.strip().startswith(label + ":")), None)
    done = False
    while(not done):
        line = lines[idx].strip()
        if not line.startswith(";"):
            bytes = re.findall(r'(\$[0-9A-F]{2}?)', line)
            for b in bytes:
                unsplit_room_bytes.append(b)
                if b == "$FF":
                    done = True
                    break
        idx += 1

print(unsplit_room_bytes)

# get every room into its own byte set
split_room_bytes = [[]]
for item in unsplit_room_bytes:
    split_room_bytes[-1].append(item)
    if item == '$FF':
        split_room_bytes.append([])

split_room_bytes = split_room_bytes[:-1];

room_objs: list[RoomDef] = []
struct_counts = defaultdict(int)
structs_used_in_rooms = defaultdict(set)
struct_combos  = defaultdict(int)

# Assemble Rooms data structures
for index, bytes in enumerate(split_room_bytes):
    idx = "$" + f"{index:02X}"
    pal = bytes[0]
    struct_infos = []
    enemies  = []   # skipping this part for now
    room_obj = RoomDef(idx, pal, struct_infos, enemies)
    room_bytes_end_index = next((index for index, b in enumerate(bytes) if b == "$FD" or b == "$FF"), None)
    room_bytes = bytes[1:room_bytes_end_index]
    for i in range(0, len(room_bytes), 3):
        struct_ptr = room_bytes[i + 1]
        struct_counts[struct_ptr] += 1
        structs_used_in_rooms[struct_ptr].add(idx)
        structInfo = RoomStructInfo(room_bytes[i], struct_ptr, room_bytes[i + 2])
        room_obj.Structs.append(structInfo)
    room_objs.append(room_obj)

possible_savings = 0
rooms_savings_exists_in = []
for room in room_objs:
    predicate = lambda x: x.Palette == room.DefaultPalette

    if all(predicate(x) for x in room.Structs):
        possible_savings = possible_savings + len(room.Structs)
        rooms_savings_exists_in.append((room.Id, str(len(room.Structs)) + " bytes"))

    print("Room Number: " + room.Id)
    print("Default Palette: " + room.DefaultPalette)
    for index, struct_info in enumerate(room.Structs):
        previous_struct = None if index == 0 else room.Structs[index - 1]
        if(previous_struct is not None):
            struct_combos[previous_struct.Position + ", " + previous_struct.StructPtr + ", " + previous_struct.Palette + " -> " + struct_info.Position + ", " + struct_info.StructPtr + ", " + struct_info.Palette] += 1
        print(".byte " + struct_info.Position + ", " + struct_info.StructPtr + ", " + struct_info.Palette)
    print()

print("Possible savings of " + str(possible_savings) + " bytes")
print("These " + str(len(rooms_savings_exists_in)) + " rooms:")
print(rooms_savings_exists_in)
print()

print("struct counts (ordered by count)")
for item in sorted(struct_counts.items(), key=lambda item: -item[1]):
    print(str(item[0]) + ": " + str(item[1]))
print()

print("struct counts (ordered by key)")
for item in  sorted(struct_counts.items()):
    print(str(item[0]) + ": " + str(item[1]))
print()

print("Structs: Rooms they are used")
for key in sorted(structs_used_in_rooms, key=lambda k: len(structs_used_in_rooms[k])):
    print(str(key), end=" in rooms: ")
    print(structs_used_in_rooms[key])
print()

#print("Struct Combos")
#for item in sorted(struct_combos.items(), key=lambda item: -item[1]):
#    if(item[1] > 1):
#        print(str(item[0]) + ": " + str(item[1]))
#print()

print("="*25 + " Rooms with struct Y overflow " + "="*25)
any_room_has_y_overflow = False
for room in room_objs:
    overflow_found = False
    for s in room.Structs:
        xpos = int("0x" + s.Position[-1], 16)
        ypos = int("0x" + s.Position[-2], 16)
        structDef = [x for x in structs if x.Id == s.StructPtr][0]
        for index, structRow in enumerate(structDef.Rows):
            structXpos = int("0x" + structRow[0][2:], 16)
            if index + ypos > 14:
                if not overflow_found:
                    print("Room #" + room.Id)
                    overflow_found = True
                    any_room_has_y_overflow = True
                print("\tOverflow of " + str(index + ypos - 14) + " row (" + str(structXpos) + " macros) @ Row " + str(index + 1) + " Structure #" + s.StructPtr + " .byte " + s.Position + ", " + s.StructPtr + ", " + s.Palette)
            #if xpos + structXpos > 16:
            #    if not overflow_found:
            #        print("Room " + room.Id)
            #        overflow_found = True
            #    print("\tX Overflow of (" + str(xpos + structXpos - 16) + " macros) @ Struct " + s.StructPtr + " Row " + str(index + 1))
if not any_room_has_y_overflow:
    print("\n\tNo rooms have Y overflow")
print()

print("="*25 + " Rooms with struct X overflow " + "="*25)
any_room_has_x_overflow = False
for room in room_objs:
    overflow_found = False
    for s in room.Structs:
        xpos = int("0x" + s.Position[-1], 16)
        ypos = int("0x" + s.Position[-2], 16)
        structDef = [x for x in structs if x.Id == s.StructPtr][0]
        for index, structRow in enumerate(structDef.Rows):
            structXpos = int("0x" + structRow[0][1:], 16)
            if xpos + structXpos > 16:
                if not overflow_found:
                    print("Room " + room.Id)
                    overflow_found = True
                    any_room_has_x_overflow = True
                print("\tX Overflow of (" + str(xpos + structXpos - 16) + " macros) @ Row " + str(index + 1) + " Structure #" + s.StructPtr + " .byte " + s.Position + ", " + s.StructPtr + ", " + s.Palette)
if not any_room_has_x_overflow:
    print("\n\tNo rooms have Y overflow")
print()

print("="*25 + " Room Overdraw " + "="*25)

for room in room_objs:
    grid = [
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    ]
    overdraw_count = 0
    for struct in room.Structs:
        xpos = int("0x" + struct.Position[-1], 16)
        ypos = int("0x" + struct.Position[-2], 16)
        structDef = [x for x in structs if x.Id == struct.StructPtr][0]
        for structYPos, structRow in enumerate(structDef.Rows):
            structXpos = int("0x" + structRow[0][1:], 16)
            #print(structRow, structYPos, structXpos)
            for offset in range(structXpos):
                if(xpos + offset < 16 and ypos + structYPos < 15):
                    grid[ypos + structYPos][xpos + offset] += 1
                    if(grid[ypos + structYPos][xpos + offset] > 1):
                        overdraw_count += 1
    if overdraw_count > 0:
        print("Room #" + room.Id)
        print(str(overdraw_count) + " overdrawn macro" + ("" if overdraw_count == 1 else "s"))
        for row in grid:   
            for cell in row:
                if cell == 0:
                    print(".", end='')
                else:
                    print(cell, end='')
            print()
        print()
