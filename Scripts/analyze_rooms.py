from room_parse_funcs import RoomDef, BankRoom, Bank, EnemyType

print_struct_analysis = False
split_rooms_into_quads = True

print_y_overflow = False
print_x_overflow = False
print_overdraw_map = False

BrinstarData = BankRoom(Bank.NORFAIR)

bank = "Bank02"
room_objs = BrinstarData.BankRooms
structs = BrinstarData.BankStructs

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
            if(ctrl_byte.endswith(EnemyType.ENEMY)):
                enemy_type = next(byte_iterator)
                enemy_location = next(byte_iterator)
                if(isInQuad(enemy_location, quad)):
                    enemy_lines.append(f"\t.byte {ctrl_byte}, {enemy_type}, {enemy_location}\t\t\t; Enemy")
            elif(ctrl_byte.endswith(EnemyType.DOOR)):
                door_param = next(byte_iterator)
                if(quad == 0 and "B" in door_param or quad == 1 and "A" in door_param):
                    enemy_lines.append(f"\t.byte {ctrl_byte}, {door_param}\t\t\t\t; Door")
            elif(ctrl_byte.endswith(EnemyType.ELEVATOR)):
                # I don't think this actually used
                enemy_lines.append(f"\t.byte {ctrl_byte}\t\t\t\t\t; Elevator")
            elif(ctrl_byte.endswith(EnemyType.STATUE)):
                if(quad == 1):
                    enemy_lines.append(f"\t.byte {ctrl_byte}\t\t\t\t\t; Statues")
            elif(ctrl_byte.endswith(EnemyType.HOLE)):
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
        if "Bank" in room.Label:
            print(f"{room.Label}:")
        else:
            print(f"{bank}_{room.Label}:")

        modified_palette = "$00";
        if(room.DefaultPalette == '$01'):
            modified_palette = "$55"
        elif(room.DefaultPalette == '$02'):
            modified_palette = "$AA"
        elif(room.DefaultPalette == '$03'):
            modified_palette = "$FF"
        print(f"\t.byte {modified_palette}")
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

#if(print_struct_analysis):
    #print("struct counts (ordered by count)")
    #for item in sorted(struct_counts.items(), key=lambda item: -item[1]):
    #    print(str(item[0]) + ": " + str(item[1]))
    #print()

    #print("struct counts (ordered by key)")
    #for item in  sorted(struct_counts.items()):
    #    print(str(item[0]) + ": " + str(item[1]))
    #print()

    #print("Structs: Rooms they are used")
    #for key in sorted(structs_used_in_rooms, key=lambda k: len(structs_used_in_rooms[k])):
    #    print(str(key), end=" in rooms: ")
    #    print(structs_used_in_rooms[key])
    #print()


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