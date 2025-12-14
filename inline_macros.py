import re
import numpy as np

original_structs = """
;Structure #$00
LAC84:  .byte $08, $01, $01, $01, $01, $01, $01, $01, $01, $08, $00, $00, $00, $00, $00, $00
LAC94:  .byte $00, $00, $FF

;Structure #$01
LAC97:  .byte $08, $02, $02, $02, $02, $02, $02, $02, $02, $01, $28, $01, $28, $01, $28, $08
LACA7:  .byte $02, $02, $02, $02, $02, $02, $02, $02, $FF

;Structure #$02
LACB0:  .byte $02, $04, $05, $02, $04, $05, $02, $04, $05, $02, $04, $05, $02, $04, $05, $02
LACC0:  .byte $04, $05, $02, $04, $05, $02, $04, $05, $FF

;Structure #$03
LACC9:  .byte $01, $06, $01, $06, $01, $06, $FF

;Structure #$04
LACD0:  .byte $01, $07, $01, $07, $01, $07, $FF

;Structure #$05
LACD7:  .byte $02, $31, $32, $FF

;Structure #$06
LACDB:  .byte $01, $08, $01, $33, $01, $33, $01, $33, $01, $33, $FF

;Structure #$07
LACE6:  .byte $01, $28, $01, $08, $01, $1F, $01, $17, $01, $17, $01, $1F, $FF

;Structure #$08
LACF3:  .byte $02, $0E, $11, $03, $0F, $12, $22, $03, $10, $13, $14, $FF

;Structure #$09
LACFF:  .byte $04, $08, $35, $35, $08, $FF

;Structure #$0A
LAD05:  .byte $03, $08, $35, $08, $FF

;Structure #$0B
LAD0A:  .byte $02, $36, $36, $02, $1C, $08, $02, $08, $34, $02, $34, $34, $02, $08, $08, $FF

;Structure #$0C
LAD1A:  .byte $02, $20, $20, $FF

;Structure #$0D
LAD1E:  .byte $08, $08, $1C, $08, $35, $08, $35, $1C, $08, $FF

;Structure #$0E
LAD28:  .byte $08, $1E, $1E, $1C, $1C, $1E, $1E, $1E, $1E, $08, $1E, $1E, $1E, $1E, $1C, $1E
LAD38:  .byte $1E, $1E, $08, $1C, $1E, $1E, $1E, $1E, $1E, $1C, $1E, $08, $1E, $1E, $1E, $1C
LAD48:  .byte $1E, $1C, $1C, $1E, $FF

;Structure #$0F
LAD4D:  .byte $08, $2E, $2E, $2E, $2E, $2E, $2E, $2E, $2E, $FF

;Structure #$10
LAD57:  .byte $08, $08, $0B, $0B, $0B, $0B, $08, $0B, $0B, $08, $08, $08, $1C, $1C, $08, $08
LAD67:  .byte $1C, $08, $FF

;Structure #$11
LAD6A:  .byte $08, $1C, $08, $08, $08, $08, $0A, $08, $1C, $08, $08, $0A, $09, $0A, $28, $28
LAD7A:  .byte $08, $08, $01, $08, $FF

;Structure #$12
LAD7F:  .byte $06, $2C, $2C, $2C, $2C, $15, $2C, $06, $2D, $2D, $2D, $2D, $16, $2D, $FF

;Structure #$13
LAD8E:  .byte $08, $2B, $2B, $2B, $2B, $2B, $2B, $2B, $2B, $FF

;Structure #$14
LAD98:  .byte $08, $1A, $1A, $1A, $1A, $1A, $1A, $1A, $1A, $FF

;Structure #$15
LADA2:  .byte $01, $20, $01, $20, $01, $17, $01, $17, $01, $20, $FF

;Structure #$16
LADAD:  .byte $07, $20, $20, $20, $20, $20, $20, $20, $07, $20, $1A, $20, $1F, $20, $1A, $20
LADBD:  .byte $FF

;Structure #$17
LADBE:  .byte $08, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $08, $0D, $0D, $0D, $0D, $0D, $0D
LADCE:  .byte $0D, $0D, $08, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $08, $0D, $0D, $0D, $0D
LADDE:  .byte $0D, $0D, $0D, $0D, $FF

;Structure #$18
LADE3:  .byte $01, $0D, $FF

;Structure #$19
LADE6:  .byte $04, $0D, $0D, $0D, $0D, $FF

;Structure #$1A
LADEC:  .byte $02, $0D, $0D, $02, $0D, $0D, $02, $0D, $0D, $02, $0D, $0D, $FF

;Structure #$1B
LADF9:  .byte $08, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $05, $27, $30, $0D, $0D, $30, $FF

;Structure #$1C
LAE09:  .byte $08, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $FF

;Structure #$1D
LAE13:  .byte $01, $0C, $01, $1F, $FF

;Structure #$1E
LAE18:  .byte $04, $08, $35, $08, $08, $04, $08, $1C, $08, $34, $04, $34, $08, $08, $08, $04
LAE28:  .byte $08, $08, $1C, $08, $FF

;Structure #$1F
LAE2D:  .byte $04, $1D, $1D, $1D, $1D, $04, $1D, $1C, $1C, $1D, $04, $1C, $1D, $1C, $1C, $04
LAE3D:  .byte $1D, $1C, $1D, $1D, $FF

;Structure #$20
LAE42:  .byte $04, $33, $33, $33, $33, $FF

;Structure #$21
LAE48:  .byte $01, $22, $FF

;Structure #$22
LAE4B:  .byte $03, $28, $0E, $08, $03, $37, $08, $39, $03, $38, $39, $39, $03, $28, $3A, $0A
LAE5B:  .byte $02, $3B, $3C, $FF

;Structure #$23
LAE5F:  .byte $03, $1E, $1E, $1C, $03, $39, $08, $1E, $03, $0A, $09, $1E, $03, $3D, $0B, $0A
LAE6F:  .byte $FF

;Structure #$24
LAE70:  .byte $04, $1E, $1E, $1C, $1E, $04, $1E, $1E, $1E, $1E, $04, $1C, $1E, $1E, $1E, $04
LAE80:  .byte $1E, $1E, $1C, $1E, $FF

;Structure #$25
LAE85:  .byte $01, $23, $01, $23, $01, $23, $01, $23, $FF

;Structure #$26
LAE8E:  .byte $02, $3E, $3F, $FF

;Structure #$27
LAE92:  .byte $08, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $08, $1E, $1E, $1E, $1E, $1E, $1E
LAEA2:  .byte $1E, $1E, $FF

;Structure #$28
LAEA5:  .byte $01, $1F, $01, $1F, $01, $1F, $01, $1F, $01, $1F, $FF

;Structure #$29
LAEB0:  .byte $01, $3E, $FF

;Structure #$2A
LAEB3:  .byte $04, $2E, $2A, $2E, $2E, $04, $2E, $2E, $2E, $2A, $FF

;Structure #$2B
LAEBE:  .byte $08, $2B, $03, $03, $2B, $03, $03, $03, $2B, $FF

;Structure #$2C
LAEC8:  .byte $01, $1B, $FF

;Structure #$2D
LAECB:  .byte $08, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $08, $1F, $1F, $1F, $1F, $1F, $1F
LAEDB:  .byte $1F, $1F, $FF

;Structure #$2E
LAEDE:  .byte $01, $2F, $FF

;Structure #$2F
LAEE1:  .byte $01, $1F, $FF

;Structure #$30
LAEE4:  .byte $01, $17, $01, $17, $01, $17, $01, $17, $FF

;Structure #$31
LAEED:  .byte $01, $24, $FF
"""

original_macros = """
Bank01_LAEF0:  .byte $F1, $F1, $F1, $F1
Bank01_LAEF4:  .byte $FF, $FF, $F0, $F0
Bank01_LAEF8:  .byte $64, $64, $64, $64
Bank01_LAEFC:  .byte $D5, $D6, $CB, $CC
Bank01_LAF00:  .byte $A4, $FF, $A4, $FF
Bank01_LAF04:  .byte $FF, $A5, $FF, $A5
Bank01_LAF08:  .byte $A0, $A0, $A0, $A0
Bank01_LAF0C:  .byte $A1, $A1, $A1, $A1
Bank01_LAF10:  .byte $00, $01, $02, $03
Bank01_LAF14:  .byte $0B, $00, $FF, $0B
Bank01_LAF18:  .byte $03, $0A, $0A, $FF
Bank01_LAF1C:  .byte $08, $09, $02, $03
Bank01_LAF20:  .byte $0E, $0F, $10, $11
Bank01_LAF24:  .byte $12, $13, $14, $0C
Bank01_LAF28:  .byte $FF, $FF, $FF, $30
Bank01_LAF2C:  .byte $FF, $33, $FF, $36
Bank01_LAF30:  .byte $FF, $39, $FF, $3D
Bank01_LAF34:  .byte $FF, $FF, $31, $32
Bank01_LAF38:  .byte $34, $35, $37, $38
Bank01_LAF3C:  .byte $3A, $3B, $3E, $3F
Bank01_LAF40:  .byte $3C, $41, $40, $42
Bank01_LAF44:  .byte $FF, $FF, $43, $43
Bank01_LAF48:  .byte $44, $44, $44, $44
Bank01_LAF4C:  .byte $45, $46, $45, $46
Bank01_LAF50:  .byte $FF, $47, $47, $48
Bank01_LAF54:  .byte $48, $FF, $47, $48
Bank01_LAF58:  .byte $48, $47, $47, $48
Bank01_LAF5C:  .byte $49, $49, $4A, $4A
Bank01_LAF60:  .byte $4B, $4C, $4D, $50
Bank01_LAF64:  .byte $51, $52, $53, $54
Bank01_LAF68:  .byte $55, $56, $57, $58
Bank01_LAF6C:  .byte $59, $5B, $59, $5B
Bank01_LAF70:  .byte $5C, $5D, $5E, $5F
Bank01_LAF74:  .byte $4F, $4F, $4F, $4F
Bank01_LAF78:  .byte $88, $89, $8A, $8B
Bank01_LAF7C:  .byte $84, $85, $86, $87
Bank01_LAF80:  .byte $8C, $8D, $8E, $8F
Bank01_LAF84:  .byte $FF, $FF, $FF, $FF    ;Not used.
Bank01_LAF88:  .byte $FF, $FF, $FF, $FF    ;Not used.
Bank01_LAF8C:  .byte $FF, $FF, $FF, $FF    ;Not used.
Bank01_LAF90:  .byte $FF, $FF, $FF, $FF    ;Not used.
Bank01_LAF94:  .byte $B0, $B1, $B2, $B3
Bank01_LAF98:  .byte $B4, $B5, $B6, $B7
Bank01_LAF9C:  .byte $B8, $B8, $B9, $B9
Bank01_LAFA0:  .byte $FF, $FF, $BA, $BA
Bank01_LAFA4:  .byte $BB, $BB, $BB, $BB
Bank01_LAFA8:  .byte $C7, $C8, $C9, $CA
Bank01_LAFAC:  .byte $94, $95, $96, $97
Bank01_LAFB0:  .byte $0D, $FF, $FF, $FF
Bank01_LAFB4:  .byte $FF, $FF, $59, $5A
Bank01_LAFB8:  .byte $FF, $FF, $5A, $5B
Bank01_LAFBC:  .byte $80, $81, $82, $83
Bank01_LAFC0:  .byte $04, $05, $04, $05
Bank01_LAFC4:  .byte $06, $06, $07, $07
Bank01_LAFC8:  .byte $60, $61, $62, $63
Bank01_LAFCC:  .byte $C1, $00, $00, $08
Bank01_LAFD0:  .byte $0B, $BE, $BC, $BD
Bank01_LAFD4:  .byte $BF, $01, $02, $03
Bank01_LAFD8:  .byte $C0, $01, $C0, $03
Bank01_LAFDC:  .byte $FF, $C1, $FF, $FF
Bank01_LAFE0:  .byte $C2, $01, $FF, $FF
Bank01_LAFE4:  .byte $30, $00, $BC, $BD
Bank01_LAFE8:  .byte $CD, $CE, $CF, $D0
Bank01_LAFEC:  .byte $D1, $D2, $D3, $D4
Bank01_LAFF0:  .byte $90, $91, $92, $93
"""

macro_bytes = re.findall(r'(\$[0-9A-F]{2}?)', original_macros)

macro_size = 4
macro_array = []
for i in range(0, len(macro_bytes), macro_size):
    macro_array.append(macro_bytes[i:i + macro_size])

def all_same_values(arr):
    return len(set(arr)) <= 1

original_byte_count = len(macro_bytes)
new_byte_count = 0

def rebuild_and_print_metroid_map_struct(struct):
    global original_byte_count
    global new_byte_count
    lines = struct.split('\n')
    header = lines[0]
    header_label_name = "Brinstar_Struct_" + re.findall(r'#\$(.{2}?)', header)[0]
    print(f';{header}')
    print(f'{header_label_name}: ')
    rest = '\n'.join(lines[1:])
    struct_bytes = [int(hex_str, 16) for hex_str in re.findall(r'\$(.{2}?)', rest)]
    original_byte_count += len(struct_bytes)
    byte_index = 0
    ctrl_byte = struct_bytes[byte_index]
    end_byte = 255
    ctrl_chunks = []
    while(ctrl_byte is not end_byte):
        chunk = [ctrl_byte, *struct_bytes[byte_index+1:byte_index + 1 + ctrl_byte]]
        #print(chunk)
        ctrl_chunks.append(chunk)
        byte_index += ctrl_byte + 1
        ctrl_byte = struct_bytes[byte_index]
    ctrl_chunks.append([end_byte])
    #print([end_byte])
    #print()

#if A == $FF        we are done drawing the row
#if A == $FD        we draw the previous row
#if A == $F2-$F8    we draw the next N macros where where N = A-$F0
#if A == $01-$08    repeat the following macro A times
    i = 0
    while i < len(ctrl_chunks):
        current = np.array(ctrl_chunks[i])
        column_count = 1
        while((i + 1) < len(ctrl_chunks)):
            next = np.array(ctrl_chunks[i + 1])
            if np.array_equal(current, next):
                column_count += 1
                i += 1
            else:
                break
        if(len(current) == 1 and current[0] == 255):
            print(".byte $FF")
            new_byte_count += 1
            i += i
            continue
        if(len(current) > 1 and all_same_values(current[1:])):
            ctrl_byte = current[0]
            mac_index = current[1]
            macro = macro_array[mac_index]
            print('.byte $0' + str(ctrl_byte) + ', $0' + str(column_count) + ', ' + ', '.join(macro))
            new_byte_count += 6
            i += 1
            continue
        long_str = ''
        data_without_ctrl = current[1:]
        print('.byte $F' + str(len(data_without_ctrl)) + ', $0' + str(column_count), end=', ')
        new_byte_count += (2 + (len(data_without_ctrl) * 4)) 
        for d in data_without_ctrl:
            macro = macro_array[d]
            long_str += ', '.join(macro) + ', '
        # Remove the last ', '
        print(long_str[0:-2])
        i += 1
    print()


struct_splits = original_structs.split(';')

for struct in struct_splits:
    cleaned = struct.strip()
    if cleaned:
        rebuild_and_print_metroid_map_struct(cleaned)

print("=" * 50)
print(macro_bytes)
print("Original Size: " + str(original_byte_count) + " bytes")
print("New Size:      " + str(new_byte_count) + " bytes")
print("=" * 50)

bank02Macros = '''
$F1, $F1, $F1, $F1
$FF, $FF, $F0, $F0
$64, $64, $64, $64
$FF, $FF, $64, $64
$A4, $FF, $A4, $FF
$FF, $A5, $FF, $A5
$A0, $A0, $A0, $A0
$A1, $A1, $A1, $A1
$FF, $FF, $59, $5A
$FF, $FF, $5A, $5B
$FF, $FF, $FF, $FF
$10, $10, $10, $10
$23, $24, $25, $0B
$1B, $1C, $1D, $1E
$17, $18, $19, $1A
$1F, $20, $21, $22
$60, $61, $62, $63
$0E, $0F, $FF, $FF
$0C, $0D, $0D, $0D
$10, $0D, $FF, $10
$10, $FF, $FF, $FF
$FF, $FF, $FF, $30
$FF, $33, $FF, $36
$FF, $39, $FF, $3D
$FF, $FF, $31, $32
$34, $35, $37, $38
$3A, $3B, $3E, $3F
$3C, $41, $40, $42
$84, $85, $86, $87
$80, $81, $82, $83
$88, $89, $8A, $8B
$45, $46, $45, $46
$47, $48, $48, $47
$5C, $5D, $5E, $5F
$B8, $B8, $B9, $B9
$74, $75, $75, $74
$C1, $13, $13, $13
$36, $BE, $BC, $BD
$BF, $14, $15, $14
$C0, $14, $C0, $16
$FF, $C1, $FF, $FF
$C2, $14, $FF, $FF
$30, $13, $BC, $BD
$13, $14, $15, $16
$D7, $D7, $D7, $D7
$76, $76, $76, $76
$FF, $FF, $BA, $BA
$BB, $BB, $BB, $BB
$00, $01, $02, $03
$04, $05, $06, $07
$FF, $FF, $08, $09
$FF, $FF, $09, $0A
$55, $56, $57, $58
$90, $91, $92, $93
$4B, $4C, $4D, $50
$51, $52, $53, $54
$70, $71, $72, $73
$8C, $8D, $8E, $8F
$11, $12, $FF, $11
$11, $12, $12, $11
$11, $12, $12, $FF
$C3, $C4, $C5, $C6
$30, $00, $BC, $BD
$CD, $CE, $CF, $D0
$D1, $D2, $D3, $D4
$90, $91, $92, $93
$20, $20, $20, $20
$C0, $C0, $C0, $C0
$C0, $C0, $C0, $C0
'''

lines =  bank02Macros.splitlines()
m1 = []
m2 = []
m3 = []
m4 = []
for line in lines:
    mcrs = re.findall(r'(\$[0-9A-F]{2}?)', line)
    if len(mcrs) == 4:
        m1.append(mcrs[0])
        m2.append(mcrs[1])
        m3.append(mcrs[2])
        m4.append(mcrs[3])

def chunks(lst, n):
    for i in range(0, len(lst), n):
        yield lst[i:i + n]

print(".advance MacroLowerRight")
for chunk in chunks(m1, 16):
    print("\t .byte " + ', '.join(chunk))

print(".advance MacroLowerLeft")
for chunk in chunks(m2, 16):
    print("\t .byte " + ', '.join(chunk))

print(".advance MacroUpperRight")
for chunk in chunks(m3, 16):
    print("\t .byte " + ', '.join(chunk))

print(".advance MacroUpperLeft")
for chunk in chunks(m4, 16):
    print("\t .byte " + ', '.join(chunk))
