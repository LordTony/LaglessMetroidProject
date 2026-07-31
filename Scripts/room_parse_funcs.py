import re
from collections import defaultdict
from dataclasses import dataclass
from enum import StrEnum

class EnemyType(StrEnum):
    ENEMY = "1"
    DOOR = "2"
    UNUSED_1 = "3"
    ELEVATOR = "4"
    UNUSED_2 = "5"
    STATUE = "6"
    HOLE = "7"

class Bank(StrEnum):
    BRINSTAR ="Bank01"
    NORFAIR = "Bank02"
    TOURIAN = "Bank03"
    KRAID = "Bank04"
    RIDLEY = "Bank05"

@dataclass
class StructDef:
    Label: str
    Id: str
    Rows: list[str]

    def __repr__(self) -> str:
        returnme = f"; Struct #{self.Id}\n{self.Label}:\n"
        for row in self.Rows:
            returnme += f"{row}\n" 
        return returnme

@dataclass
class RoomStructInfo:
    Position: str
    StructPtr: str
    OverridePalette: str

class RoomDef:
    Id: str
    Label: str
    DefaultPalette: int
    Structs: list[RoomStructInfo]
    Enemys: list[str]

    def __repr__(self) -> str:
        returnme = f"; Room #{self.Id}\n{self.Label}:\n"
        returnme += f".byte {self.DefaultPalette}   ; Room Pal\n"
        for row in self.Structs:
            returnme += f"{row}\n"
        returnme += f"{self.Enemys}\n" 
        return returnme
    
    def __init__(self, Id: str, label: str, byteStrings: list[str]):
        self.Id = Id
        self.Label = label
        self.DefaultPalette = byteStrings[0] if len(byteStrings) > 0 else "$??"
        self.Structs = []
        self.Enemys = []

        if len(byteStrings) == 0:
            return

        room_bytes_end_index = next((index for index, b in enumerate(byteStrings) if b == "$FD" or b == "$FF" and index != 0), None)
        room_bytes = byteStrings[1:room_bytes_end_index]
        for i in range(0, len(room_bytes), 3):
            self.Structs.append(RoomStructInfo(room_bytes[i], room_bytes[i + 1], room_bytes[i + 2]))
        if("$FD" in byteStrings):
            enemy_bytes_start_index = byteStrings.index("$FD")
            self.Enemys = byteStrings[enemy_bytes_start_index:-1]

class BankRoom:
    BankStructs: list[StructDef] = []
    BankRooms: list[RoomDef] = []

    @staticmethod
    def getWordsAsLabels(targetLines: list[str]) -> list[str]:
        return [x.replace("$", "L") for x in re.findall(r'\$[0-9A-Fa-f]{4}', "\n".join(targetLines))]

    @staticmethod
    def getCommentStrippedLines(allLines: list[str], startMarker: str, endMarker: str) -> list[str]:
        struct_pointer_table_start = next((index for index, line in enumerate(allLines) if startMarker in line), None)
        struct_pointer_table_end = next((index for index, line in enumerate(allLines) if endMarker in line), None)
        return [line for line in allLines[struct_pointer_table_start:struct_pointer_table_end] if not line.strip().startswith(";") and not line.strip() == ""] 

    @staticmethod
    def getWordLabelsFromBetweenMarkers(allLines: list[str], startMarker: str, endMarker: str) -> list[str]:
        strippedLines = BankRoom.getCommentStrippedLines(allLines, startMarker, endMarker)
        return BankRoom.getWordsAsLabels(strippedLines)

    def __init__(self, bank: Bank):

        f = open(f"./Original_Source_Files/{bank}.asm", "r")
        lines = f.readlines()

        struct_ptr_labels = BankRoom.getWordLabelsFromBetweenMarkers(lines, "StrctPtrTbl:", "[ Special items table ]")

        for struct_current_index, label in enumerate(struct_ptr_labels):
            idx = next((index for index, line in enumerate(lines) if line.lower().strip().startswith(label.lower() + ":")), None)
            ctrl_byte_mode = True
            ctrl_byte = -1
            current_struct = StructDef(label, f"${struct_current_index:02X}", [[]])
            self.BankStructs.append(current_struct)
            done = False
            while not done:
                line = lines[idx].strip();
                if not line.startswith(";"):
                    bytes = re.findall(r'(\$[0-9A-F]{2}?)', line)
                    for b in bytes:
                        if ctrl_byte_mode:
                            if b == '$FF':
                                self.BankStructs[struct_current_index].Rows.pop()
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

        room_ptr_labels = BankRoom.getWordLabelsFromBetweenMarkers(lines, "RmPtrTbl:", "StrctPtrTbl:")

        # parse the room bytes
        split_room_bytes: list[str] = []
        for label in room_ptr_labels:
            idx = next((index for index, line in enumerate(lines) if line.lower().strip().startswith(label.lower() + ":")), None)
            if idx == None:
                done = True
            else:
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
                
        # Assemble Rooms data structures
        for index, bytes in enumerate(split_room_bytes):
            idx = f"${index:02X}"
            self.BankRooms.append(RoomDef(idx, room_ptr_labels[index], bytes))