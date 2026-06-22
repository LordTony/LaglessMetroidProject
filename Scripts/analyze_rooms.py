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

@dataclass
class RoomDef:
    Id: str
    Label: str
    DefaultPalette: int
    Structs: list[RoomStructInfo]
    Enemys: list[str]

print_room_structs = False
print_room_defs = False
print_y_overflow = False
print_x_overflow = False
print_overdraw_map = True
print_struct_analysis = False
split_rooms_into_quads = True

hexMap = "0123456789ABCDEF"

enemy_ctrl_nibble = '1'
door_ctrl_nibble = '2'
elevator_ctrl_nibble = '4'
statue_ctrl_nibble = '6'
hole_ctrl_nibble = '7'

bank = "Bank01";

f = open(f"./Source_Files/{bank}.asm", "r")

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

if(print_room_structs):
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
split_room_bytes = []
for label in room_ptr_labels:
    idx = next((index for index, line in enumerate(lines) if line.strip().startswith(label + ":")), None)
    done = False
    current_room_bytes = [] 
    split_room_bytes.append(current_room_bytes)
    firstByte = True
    while(not done):
        line = lines[idx].strip()
        if not line.startswith(";"):
            bytes = re.findall(r'(\$[0-9A-F]{2}?)', line.split(';')[0])
            for b in bytes:
                current_room_bytes.append(b)
                if b == "$FF" and not firstByte:
                    done = True
                    break
                else:
                    firstByte = False
        idx += 1

room_objs: list[RoomDef] = []
struct_counts = defaultdict(int)
structs_used_in_rooms = defaultdict(set)

# Assemble Rooms data structures
for index, bytes in enumerate(split_room_bytes):
    idx = "$" + f"{index:02X}"
    pal = bytes[0]
    struct_infos = []
    enemies  = []
    room_obj = RoomDef(idx, room_ptr_labels[index], pal, struct_infos, enemies)
    room_bytes_end_index = next((index for index, b in enumerate(bytes) if b == "$FD" or b == "$FF" and index != 0), None)
    room_bytes = bytes[1:room_bytes_end_index]
    for i in range(0, len(room_bytes), 2):
        struct_ptr = room_bytes[i + 1]
        struct_counts[struct_ptr] += 1
        structs_used_in_rooms[struct_ptr].add(idx)
        structInfo = RoomStructInfo(room_bytes[i], struct_ptr)
        room_obj.Structs.append(structInfo)
    if("$FD" in bytes):
        enemy_bytes_start_index = bytes.index("$FD")
        enemy_bytes_end_index = next((index for index, b in enumerate(bytes) if b == "$FF" and index != 0), None)
        enemy_bytes = bytes[enemy_bytes_start_index:enemy_bytes_end_index]
        enemies.extend(enemy_bytes)
    room_objs.append(room_obj)

# print out rooms
if(print_room_defs):
    print("="*25 + " [ Rooms ] " + "="*25 + "\n")
    for room in room_objs:
        print(f";Room #{room.Id}")
        print(f"\t.byte {room.DefaultPalette}\t\t\t;Default Palette")
        print(f";== Layout ==")
        for s in room.Structs:
            print(f"\t.byte {s.Position}, {s.StructPtr}")
        if(len(room.Enemys) > 0):
            print(f"\t.byte $FD")
            print(f"; == enemy / door data ==")
            byte_iterator = iter(room.Enemys[1:])
            for ctrl_byte in byte_iterator:
                if(ctrl_byte.endswith(enemy_ctrl_nibble)):
                    enemy_type = next(byte_iterator)
                    enemy_location = next(byte_iterator)
                    print(f"\t.byte {ctrl_byte}, {enemy_type}, {enemy_location}\t\t\t; Enemy")
                elif(ctrl_byte.endswith(door_ctrl_nibble)):
                    door_param = next(byte_iterator)
                    print(f"\t.byte {ctrl_byte}, {door_param}\t\t\t\t; Door")
                elif(ctrl_byte.endswith(elevator_ctrl_nibble)):
                    print(f"\t.byte {ctrl_byte}\t\t\t\t\t; Elevator")
                elif(ctrl_byte.endswith(statue_ctrl_nibble)):
                    print(f"\t.byte {ctrl_byte}\t\t\t\t\t; Statues")
                elif(ctrl_byte.endswith(hole_ctrl_nibble)):
                    hole_type = next(byte_iterator)
                    hole_location = next(byte_iterator)
                    print(f"\t.byte {ctrl_byte}, {hole_type}, {hole_location}\t\t\t; Zeb Hole")
                else:
                    print(f"\t.byte {ctrl_byte}; ERROR")
        print("\t.byte $FF")
        print()

def isInQuad(positionByteStr: str, quad: int):
    xpos = int("0x" + positionByteStr[-1], 16)
    ypos = int("0x" + positionByteStr[-2], 16)
    return (
        (quad == 0 and xpos <= 7 and ypos <= 7) or
        (quad == 1 and xpos > 7 and ypos <= 7) or
        (quad == 2 and xpos <= 7 and ypos > 7) or
        (quad == 3 and xpos > 7 and ypos > 7)
    )

def organizeQuadByte(room: RoomDef, quad: int):

    tile_lines = []
    enemy_lines = []
    for s in room.Structs:
        if(isInQuad(s.Position, quad)):
            tile_lines.append(f"\t.byte {s.Position}, {s.StructPtr}")

    if(len(room.Enemys) > 0):
        byte_iterator = iter(room.Enemys[1:])
        for ctrl_byte in byte_iterator:
            if(ctrl_byte.endswith(enemy_ctrl_nibble)):
                enemy_type = next(byte_iterator)
                enemy_location = next(byte_iterator)
                if(isInQuad(enemy_location, quad)):
                    enemy_lines.append(f"\t.byte {ctrl_byte}, {enemy_type}, {enemy_location}\t\t\t; Enemy")
            elif(ctrl_byte.endswith(door_ctrl_nibble)):
                door_param = next(byte_iterator)
                if(quad == 0 and "B" in door_param or quad == 1 and "A" in door_param):
                    enemy_lines.append(f"\t.byte {ctrl_byte}, {door_param}\t\t\t\t; Door")
            elif(ctrl_byte.endswith(elevator_ctrl_nibble)):
                # I don't think this actually used
                enemy_lines.append(f"\t.byte {ctrl_byte}\t\t\t\t\t; Elevator")
            elif(ctrl_byte.endswith(statue_ctrl_nibble)):
                if(quad == 1):
                    enemy_lines.append(f"\t.byte {ctrl_byte}\t\t\t\t\t; Statues")
            elif(ctrl_byte.endswith(hole_ctrl_nibble)):
                hole_type = next(byte_iterator)
                hole_location = next(byte_iterator)
                if(isInQuad(hole_location, quad)):
                    enemy_lines.append(f"\t.byte {ctrl_byte}, {hole_type}, {hole_location}\t\t\t; Zeb Hole")

    return [tile_lines, enemy_lines]

    

# print out rooms
if(split_rooms_into_quads):
    print("="*25 + " [ Room Quads ] " + "="*25)

    for room in room_objs:
        print(f"\n;Room #{room.Id}")
        print(f"{room.Label}:")
        print(f"\t.byte {room.DefaultPalette}")
        base_label = f"{bank}_Room_{room.Id.replace('$','')}"

        # Ptr to Top Left Quad Data
        top_left_quad = organizeQuadByte(room, 0)
        has_top_left_data = len(top_left_quad[0]) + len(top_left_quad[1]) > 0
        if(has_top_left_data):
            print(f"\t.word {base_label}_Top_Left")
        else:
            print(f"\t.word FFLabel")
        
        # Ptr to Top Right Quad Data
        top_right_quad = organizeQuadByte(room, 1)
        has_top_right_data = len(top_right_quad[0]) + len(top_right_quad[1]) > 0
        if(has_top_right_data):
            print(f"\t.word {base_label}_Top_Right")
        else:
            print(f"\t.word FFLabel")

        # Ptr to Bottom Left Quad Data
        bottom_left_quad = organizeQuadByte(room, 2)
        has_bottom_left_data = len(bottom_left_quad[0]) + len(bottom_left_quad[1]) > 0
        if(has_bottom_left_data):
            print(f"\t.word {base_label}_Bottom_Left")
        else:
            print(f"\t.word FFLabel")

        # Fall through to Bottom Right
        # This one is a bit different than the others
        bottom_right_quad = organizeQuadByte(room, 3)
        print(f'\n{base_label}_Bottom_Right:')
        if(len(bottom_right_quad[0]) > 0):
            print('\n'.join(bottom_right_quad[0]))
            if(len(bottom_right_quad[1]) > 0):
                print('\t.byte $FD')
                print('\n'.join(bottom_right_quad[1]))
        print("\t.byte $FF")

        # Top Left
        if(has_top_left_data):
            print(f'\n{base_label}_Top_Left:')
            print('\n'.join(top_left_quad[0]))
            if(len(top_left_quad[1]) > 0):
                print('\t.byte $FD')
                print('\n'.join(top_left_quad[1]))
            print("\t.byte $FF")

        # Top Right
        if(has_top_right_data):
            print(f'\n{base_label}_Top_Right:')
            print('\n'.join(top_right_quad[0]))
            if(len(top_right_quad[1]) > 0):
                print('\t.byte $FD')
                print('\n'.join(top_right_quad[1]))
            print("\t.byte $FF")

        # Bottom Left
        if(has_bottom_left_data):
            print(f'\n{base_label}_Bottom_Left:')
            print('\n'.join(bottom_left_quad[0]))
            if(len(bottom_left_quad[1]) > 0):
                print('\t.byte $FD')
                print('\n'.join(bottom_left_quad[1]))
            print("\t.byte $FF")

    print()

if(print_struct_analysis):
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


if(print_y_overflow):
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
                    print("\tOverflow of " + str(index + ypos - 14) + " row (" + str(structXpos) + " macros) @ Row " + str(index + 1) + " Structure #" + s.StructPtr + " .byte " + s.Position + ", " + s.StructPtr)
    if not any_room_has_y_overflow:
        print("\n\tNo rooms have Y overflow")
    print()

if(print_x_overflow):
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
                    print("\tX Overflow of (" + str(xpos + structXpos - 16) + " macros) @ Row " + str(index + 1) + " Structure #" + s.StructPtr + " .byte " + s.Position + ", " + s.StructPtr)
    if not any_room_has_x_overflow:
        print("\n\tNo rooms have Y overflow")
    print()

if(print_overdraw_map):
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