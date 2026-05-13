import re
from dataclasses import dataclass
from collections import defaultdict

@dataclass
class RoomStructInfo:
    Position: str
    StructPtr: str
    Palette: str

@dataclass
class RoomDef:
    Index: str
    DefaultPalette: int
    Structs: list[RoomStructInfo]
    Enemys: list[str]

hexMap = "0123456789ABCDEF"

f = open("./Source_Files/Bank01.asm", "r")

lines = f.readlines();
start_index = next((index for index, line in enumerate(lines) if "[ Room definitions ]" in line), None)
end_index = next((index for index, line in enumerate(lines) if "[ Enemy animation data tables ]" in line), None)

target_lines = [line for line in lines[start_index:end_index] if not line.startswith(";") and not line.strip() == ""]

# parse the room bytes
unsplit_room_bytes = []
for line in target_lines:
    bytes = re.findall(r'(\$[0-9A-F]{2}?)', line)
    for b in bytes:
        unsplit_room_bytes.append(b)

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
    idx = "$" + str((index // 16)) + str(hexMap[index % 16]);
    pal = bytes[0]
    strcts = []
    enemies  = []   # skipping this part for now
    room_obj = RoomDef(idx, pal, strcts, enemies)
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
        rooms_savings_exists_in.append((room.Index, str(len(room.Structs)) + " bytes"))

    print("Room Number: " + room.Index)
    print("Default Palette: " + room.DefaultPalette)
    for index, struct in enumerate(room.Structs):
        previous_struct = None if index == 0 else room.Structs[index - 1]
        if(previous_struct is not None):
            struct_combos[(previous_struct.Position, previous_struct.StructPtr, previous_struct.Palette, " -> ", struct.Position, struct.StructPtr, struct.Palette)] += 1
        print(".byte " + struct.Position + ", " + struct.StructPtr + ", " + struct.Palette)
    print()

print("Possible savings of " + str(possible_savings) + " bytes")
print("These " + str(len(rooms_savings_exists_in)) + " rooms:")
print(rooms_savings_exists_in)
print()

print("struct counts (ordered by count)")
print(sorted(struct_counts.items(), key=lambda item: item[1]))
print()

print("struct counts (ordered by key)")
print(sorted(struct_counts.items()))
print()

print("Structs: Rooms they are used")
for key in sorted(structs_used_in_rooms, key=lambda k: len(structs_used_in_rooms[k])):
    print("Room# " + str(key), end=": ")
    print(structs_used_in_rooms[key])
print()

print("Struct Combos")
for item in sorted(struct_combos.items(), key=lambda item: -item[1]):
    if(item[1] > 1):
        print(str(item[0]) + ": " + str(item[1]))
print()