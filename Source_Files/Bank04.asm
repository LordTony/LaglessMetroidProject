;Kraid hideout bank.

.include "Game_Start_Common.asm"

;------------------------------------------[ Graphics data ]-----------------------------------------

;Samus end tile patterns.
GFXEndingSamus:
Bank04_L8D60:  .byte $00, $00, $00, $00, $01, $01, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L8D70:  .byte $00, $00, $3C, $FF, $FF, $BD, $5A, $24, $00, $00, $00, $20, $00, $42, $E7, $FF
Bank04_L8D80:  .byte $00, $00, $00, $00, $00, $01, $01, $03, $00, $00, $00, $00, $00, $00, $0C, $1C
Bank04_L8D90:  .byte $00, $00, $00, $3C, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00, $40, $80, $00
Bank04_L8DA0:  .byte $00, $00, $00, $00, $00, $80, $A0, $F0, $00, $00, $00, $00, $00, $00, $20, $30
Bank04_L8DB0:  .byte $1D, $39, $38, $70, $F0, $F0, $F0, $E0, $1D, $39, $18, $60, $F0, $F0, $F0, $E0
Bank04_L8DC0:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank04_L8DD0:  .byte $80, $80, $00, $00, $00, $00, $00, $00, $80, $80, $00, $00, $00, $00, $00, $00
Bank04_L8DE0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L8DF0:  .byte $E7, $E7, $C3, $C3, $42, $C3, $E7, $E7, $E7, $E7, $C3, $00, $42, $C3, $E7, $E7
Bank04_L8E00:  .byte $0E, $0D, $07, $0E, $1C, $19, $1B, $1A, $0E, $0D, $07, $0E, $1C, $18, $18, $18
Bank04_L8E10:  .byte $7C, $6D, $39, $10, $38, $FF, $FF, $7C, $00, $11, $01, $00, $00, $00, $00, $82
Bank04_L8E20:  .byte $88, $0C, $8C, $DC, $5C, $0C, $88, $98, $80, $00, $80, $C0, $40, $00, $00, $00
Bank04_L8E30:  .byte $00, $00, $01, $03, $03, $07, $07, $0E, $00, $00, $01, $03, $03, $07, $07, $0E
Bank04_L8E40:  .byte $1C, $7E, $FF, $E7, $99, $3D, $7C, $56, $1C, $7E, $FF, $E7, $81, $01, $00, $00
Bank04_L8E50:  .byte $00, $00, $00, $00, $80, $80, $80, $80, $00, $00, $00, $00, $80, $80, $80, $80
Bank04_L8E60:  .byte $03, $03, $03, $0F, $1F, $1F, $1F, $07, $00, $00, $00, $0F, $1F, $1F, $1F, $0E
Bank04_L8E70:  .byte $00, $81, $C3, $66, $A5, $DB, $FF, $FF, $7E, $3C, $18, $00, $C3, $A7, $44, $88
Bank04_L8E80:  .byte $03, $03, $02, $0F, $1F, $1F, $1F, $07, $1C, $0C, $00, $0F, $1F, $1F, $1F, $0F
Bank04_L8E90:  .byte $FF, $00, $FF, $FF, $FF, $FF, $FF, $FF, $00, $3C, $FF, $FF, $FF, $FF, $FF, $FF
Bank04_L8EA0:  .byte $D8, $D8, $78, $F0, $F0, $E0, $C0, $80, $18, $18, $38, $F0, $F0, $E0, $C0, $80
Bank04_L8EB0:  .byte $70, $F9, $F9, $D1, $71, $01, $00, $00, $40, $01, $01, $01, $01, $01, $00, $00
Bank04_L8EC0:  .byte $FF, $FF, $E7, $E7, $E7, $E7, $E7, $E7, $FF, $FF, $E7, $E7, $E7, $E7, $E7, $E7
Bank04_L8ED0:  .byte $00, $80, $80, $80, $80, $80, $00, $00, $00, $80, $80, $80, $80, $80, $00, $00
Bank04_L8EE0:  .byte $01, $01, $01, $03, $03, $01, $01, $00, $01, $01, $00, $00, $00, $02, $00, $00
Bank04_L8EF0:  .byte $E7, $E7, $E7, $E7, $E7, $C3, $C3, $00, $E7, $E7, $E7, $C3, $C3, $24, $00, $00
Bank04_L8F00:  .byte $0A, $0A, $02, $06, $06, $06, $0C, $0C, $09, $09, $00, $00, $00, $00, $00, $00
Bank04_L8F10:  .byte $38, $00, $10, $38, $7C, $7C, $38, $81, $C7, $EF, $C6, $00, $00, $00, $C6, $3C
Bank04_L8F20:  .byte $D8, $F8, $70, $30, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L8F30:  .byte $0E, $0D, $07, $0E, $1C, $18, $18, $18, $0E, $0D, $07, $0E, $1C, $19, $1B, $1A
Bank04_L8F40:  .byte $7C, $6D, $39, $10, $38, $7C, $7C, $38, $00, $11, $01, $00, $82, $83, $83, $C6
Bank04_L8F50:  .byte $88, $0C, $8C, $DC, $5C, $0C, $00, $00, $80, $00, $80, $C0, $40, $00, $80, $98
Bank04_L8F60:  .byte $0D, $1D, $1C, $39, $78, $08, $00, $10, $0C, $1C, $05, $31, $78, $78, $B8, $B8
Bank04_L8F70:  .byte $FF, $FF, $E7, $66, $99, $FF, $FF, $FF, $10, $00, $18, $99, $FF, $FF, $FF, $FF
Bank04_L8F80:  .byte $B0, $B8, $38, $9C, $1E, $1E, $1E, $3F, $30, $38, $B0, $8C, $1E, $1E, $1C, $00
Bank04_L8F90:  .byte $00, $00, $00, $18, $18, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L8FA0:  .byte $00, $00, $00, $00, $00, $00, $04, $00, $00, $40, $00, $00, $00, $00, $00, $00
Bank04_L8FB0:  .byte $00, $00, $00, $00, $10, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L8FC0:  .byte $00, $00, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $40, $00, $00, $00
Bank04_L8FD0:  .byte $00, $00, $00, $00, $81, $DB, $FF, $FF, $00, $00, $00, $00, $C3, $A7, $44, $88
Bank04_L8FE0:  .byte $00, $00, $00, $F0, $F8, $F8, $F8, $E0, $00, $00, $00, $F0, $F8, $F8, $F8, $70
Bank04_L8FF0:  .byte $80, $00, $80, $C0, $40, $00, $00, $00, $80, $00, $80, $C0, $40, $00, $80, $80
Bank04_L9000:  .byte $80, $00, $80, $C0, $40, $00, $01, $00, $80, $00, $80, $C0, $40, $00, $80, $C2
Bank04_L9010:  .byte $00, $00, $00, $00, $40, $F8, $F8, $70, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L9020:  .byte $80, $00, $80, $C0, $40, $00, $80, $80, $80, $00, $80, $C0, $40, $00, $00, $00
Bank04_L9030:  .byte $08, $08, $00, $00, $00, $00, $00, $00, $0B, $0B, $02, $06, $06, $06, $0C, $0C
Bank04_L9040:  .byte $10, $00, $00, $00, $00, $00, $00, $81, $EF, $EF, $D6, $38, $7C, $7C, $FE, $3C
Bank04_L9050:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $D8, $78, $70, $30, $00, $00, $00, $00
Bank04_L9060:  .byte $10, $00, $01, $01, $01, $01, $01, $01, $B8, $B8, $B9, $89, $89, $71, $01, $01
Bank04_L9070:  .byte $FF, $FF, $E7, $E7, $C3, $C3, $C3, $C3, $FF, $FF, $E7, $E7, $C3, $C3, $C3, $C3
Bank04_L9080:  .byte $1E, $0F, $9F, $9F, $96, $86, $8C, $80, $00, $00, $80, $80, $80, $80, $80, $80
Bank04_L9090:  .byte $C0, $80, $00, $80, $00, $00, $00, $00, $40, $00, $80, $80, $00, $00, $00, $00
Bank04_L90A0:  .byte $0E, $1F, $1F, $1B, $9F, $8F, $C7, $CE, $00, $00, $00, $00, $00, $00, $00, $02
Bank04_L90B0:  .byte $00, $00, $00, $0F, $1F, $1F, $1F, $07, $00, $00, $00, $0F, $1F, $1F, $1F, $0E
Bank04_L90C0:  .byte $00, $00, $01, $03, $03, $07, $07, $0F, $00, $00, $01, $03, $03, $07, $07, $0F
Bank04_L90D0:  .byte $1C, $7E, $FF, $FF, $FF, $FF, $FF, $FF, $1C, $7E, $FF, $FF, $E7, $C3, $83, $A9
Bank04_L90E0:  .byte $00, $00, $00, $00, $80, $80, $C0, $C0, $00, $00, $00, $00, $80, $80, $C0, $C0
Bank04_L90F0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $80, $80, $C0, $C0, $C0, $C0, $60, $70
Bank04_L9100:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $E7, $7E, $18, $00, $00, $00, $00, $00
Bank04_L9110:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $78, $38, $38, $30, $78, $78, $F8, $C0
Bank04_L9120:  .byte $80, $80, $80, $C0, $C0, $60, $60, $30, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L9130:  .byte $09, $0D, $0D, $09, $08, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L9140:  .byte $C3, $C3, $E7, $E7, $E7, $E7, $E7, $63, $18, $18, $00, $00, $00, $00, $00, $00
Bank04_L9150:  .byte $00, $80, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L9160:  .byte $01, $01, $01, $03, $03, $03, $07, $07, $01, $00, $01, $03, $03, $03, $07, $07
Bank04_L9170:  .byte $81, $81, $81, $00, $81, $81, $81, $81, $81, $81, $00, $00, $81, $81, $81, $81
Bank04_L9180:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L9190:  .byte $00, $00, $80, $80, $80, $80, $80, $80, $00, $00, $80, $80, $80, $80, $80, $80
Bank04_L91A0:  .byte $CF, $C7, $F7, $EF, $EF, $FF, $FE, $DE, $07, $07, $77, $EF, $EF, $FF, $FA, $5C
Bank04_L91B0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $03
Bank04_L91C0:  .byte $0F, $0F, $00, $00, $00, $00, $00, $00, $0F, $0F, $00, $00, $00, $00, $00, $00
Bank04_L91D0:  .byte $FF, $EF, $FF, $7C, $38, $00, $00, $00, $83, $93, $C7, $6C, $00, $00, $00, $00
Bank04_L91E0:  .byte $C0, $C0, $00, $00, $00, $00, $00, $00, $C0, $C0, $00, $00, $00, $00, $00, $00
Bank04_L91F0:  .byte $81, $81, $00, $81, $00, $81, $00, $00, $00, $00, $00, $00, $81, $00, $00, $00
Bank04_L9200:  .byte $80, $00, $80, $C0, $40, $00, $81, $C3, $80, $00, $80, $C0, $40, $00, $00, $00
Bank04_L9210:  .byte $00, $00, $00, $00, $40, $F8, $F8, $70, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L9220:  .byte $10, $B0, $B0, $90, $90, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L9230:  .byte $E7, $7E, $18, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L9240:  .byte $63, $31, $31, $39, $39, $39, $18, $00, $00, $00, $00, $00, $00, $00, $00, $60
Bank04_L9250:  .byte $00, $80, $80, $C0, $C0, $C0, $C0, $00, $00, $00, $00, $00, $00, $00, $00, $30
Bank04_L9260:  .byte $07, $07, $0F, $08, $07, $0F, $07, $00, $03, $00, $00, $07, $08, $00, $00, $00
Bank04_L9270:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $F0, $F0, $70, $78, $38, $78, $7C, $1E

;Misc. tile patterns.
GFXMiscTiles:
Bank04_L9360:  .byte $FF, $FF, $C0, $C0, $CF, $CB, $CC, $CC, $00, $00, $1F, $3F, $3F, $38, $3B, $3B
Bank04_L9370:  .byte $FC, $FC, $0C, $0C, $CC, $4C, $CC, $CC, $00, $04, $EC, $FC, $FC, $3C, $BC, $BC
Bank04_L9380:  .byte $CB, $CF, $C0, $C0, $FF, $FF, $00, $00, $3B, $30, $3F, $1F, $7F, $FF, $00, $00
Bank04_L9390:  .byte $4C, $CC, $0C, $0C, $FC, $FC, $00, $00, $3C, $3C, $FC, $EC, $FC, $FC, $00, $00
Bank04_L93A0:  .byte $FE, $02, $02, $02, $FE, $00, $00, $7F, $00, $FE, $0E, $FE, $FE, $00, $00, $00
Bank04_L93B0:  .byte $7F, $40, $40, $40, $7F, $00, $00, $FE, $00, $3F, $30, $3F, $7F, $00, $00, $00
Bank04_L93C0:  .byte $40, $40, $40, $7F, $00, $00, $00, $FF, $3F, $30, $3F, $7F, $00, $00, $FF, $FF
Bank04_L93D0:  .byte $02, $02, $02, $FE, $00, $00, $00, $FF, $FE, $0E, $FE, $FE, $00, $00, $FF, $FF
Bank04_L93E0:  .byte $FF, $FF, $C0, $D0, $C0, $C0, $C0, $C0, $00, $00, $3F, $27, $3F, $3F, $3F, $3F
Bank04_L93F0:  .byte $FC, $FC, $0C, $4C, $0C, $0C, $0C, $0C, $00, $04, $FC, $9C, $FC, $FC, $FC, $FC
Bank04_L9400:  .byte $C0, $C0, $D0, $C0, $FF, $FF, $00, $00, $3F, $3F, $27, $3F, $3F, $7F, $00, $00
Bank04_L9410:  .byte $0C, $0C, $4C, $0C, $FC, $FC, $00, $00, $FC, $FC, $9C, $FC, $FC, $FC, $00, $00
Bank04_L9420:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $20, $48, $30, $5A, $FC, $76, $BE, $2C
Bank04_L9430:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $7E, $75, $1C, $AA, $54, $30, $44, $10
Bank04_L9440:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $04, $12, $0C, $5A, $3F, $6E, $7D, $34
Bank04_L9450:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $7E, $AE, $38, $55, $2A, $0C, $22, $08
Bank04_L9460:  .byte $45, $D7, $FF, $FF, $FD, $FF, $BF, $FB, $00, $00, $00, $00, $02, $00, $40, $04
Bank04_L9470:  .byte $FF, $BB, $FF, $FF, $EF, $FF, $7F, $FD, $00, $44, $00, $00, $10, $00, $80, $02
Bank04_L9480:  .byte $7E, $42, $C2, $1E, $02, $06, $7C, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L9490:  .byte $00, $00, $00, $00, $04, $12, $08, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L94A0:  .byte $44, $FE, $44, $44, $04, $0C, $78, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L94B0:  .byte $06, $0C, $38, $F0, $10, $10, $10, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L94C0:  .byte $FE, $C0, $C0, $FC, $C0, $C0, $FE, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L94D0:  .byte $FC, $C6, $C6, $CE, $F8, $DC, $CE, $00, $00, $00, $00, $00, $00, $00, $00, $00

;Bank04_L94E0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
;Bank04_L94F0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
;Bank04_L9500:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
;Bank04_L9510:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

; STRANGE GRAPHICS BYTES
;Bank04_L9520:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
;Bank04_L9530:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
;Bank04_L9540:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00
;Bank04_L9550:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

;----------------------------------------------------------------------------------------------------
.scope

.advance PalPntrTbl_Hi

    .byte >_Palette00         ;($A155)
    .byte >_Palette01         ;($A179)
    .byte >_Palette02         ;($A185)
    .byte >_Palette03         ;($A17F)
    .byte >_Palette04         ;($A18B)
    .byte >_Palette05         ;($A191)
    .byte >_Palette05         ;($A191)
    .byte >_Palette05         ;($A191)
    .byte >_Palette05         ;($A191)
    .byte >_Palette05         ;($A191)
    .byte >_Palette05         ;($A191)
    .byte >_Palette05         ;($A191)
    .byte >_Palette05         ;($A191)
    .byte >_Palette05         ;($A191)
    .byte >_Palette05         ;($A191)
    .byte >_Palette05         ;($A191)
    .byte >_Palette05         ;($A191)
    .byte >_Palette05         ;($A191)
    .byte >_Palette05         ;($A191)
    .byte >_Palette05         ;($A191)
    .byte >_Palette06         ;($A198)
    .byte >_Palette07         ;($A19F)
    .byte >_Palette08         ;($A1A6)
    .byte >_Palette09         ;($A1AD)
    .byte >_Palette0A         ;($A1B5)
    .byte >_Palette0B         ;($A1BD)
    .byte >_Palette0C         ;($A1C5)
    .byte >_Palette0D         ;($A1CD)

.advance PalPntrTbl_Lo

    .byte <_Palette00         ;($A155)
    .byte <_Palette01         ;($A179)
    .byte <_Palette02         ;($A185)
    .byte <_Palette03         ;($A17F)
    .byte <_Palette04         ;($A18B)
    .byte <_Palette05         ;($A191)
    .byte <_Palette05         ;($A191)
    .byte <_Palette05         ;($A191)
    .byte <_Palette05         ;($A191)
    .byte <_Palette05         ;($A191)
    .byte <_Palette05         ;($A191)
    .byte <_Palette05         ;($A191)
    .byte <_Palette05         ;($A191)
    .byte <_Palette05         ;($A191)
    .byte <_Palette05         ;($A191)
    .byte <_Palette05         ;($A191)
    .byte <_Palette05         ;($A191)
    .byte <_Palette05         ;($A191)
    .byte <_Palette05         ;($A191)
    .byte <_Palette05         ;($A191)
    .byte <_Palette06         ;($A198)
    .byte <_Palette07         ;($A19F)
    .byte <_Palette08         ;($A1A6)
    .byte <_Palette09         ;($A1AD)
    .byte <_Palette0A         ;($A1B5)
    .byte <_Palette0B         ;($A1BD)
    .byte <_Palette0C         ;($A1C5)
    .byte <_Palette0D         ;($A1CD)

.advance SpecItmsTblPtr

Bank04_L9598:  .word _SpecItmsTbl       ;($A26D)Beginning of special items table.

.advance TourianBulletCheckSub
    rts

.advance AreaBossRoomNumber			; I think this is unsused but was previous $95CC
Bank04_L95CC:  .byte $1D           ;Kraid's room.

.advance AreaMusicFlag
Bank04_L95CD:  .byte $10           ;Kraid's hideout music init flag.

.advance AreaEnemyDmg_LowByte
Bank04_L95CE:  .byte $00           ;Base damage caused by area enemies to lower health byte.

.advance AreaEnemyDmg_HiByte
Bank04_L95CF:  .byte $02           ;Base damage caused by area enemies to upper health byte.

.advance MusicTriggerRoomTbl
;Special room numbers(used to start item room music).
Bank04_L95D0:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF

.advance StartingMapX
Bank04_L95D7:  .byte $07            ;Samus start x coord on world map.
.advance StartingMapY
Bank04_L95D8:  .byte $14            ;Samus start y coord on world map.
.advance StartingVertPosition
Bank04_L95D9:  .byte $6E            ;Samus start verticle screen position.

.advance StartingPalette
Bank04_L95DA:  .byte $06
Bank04_L95DB:  .byte $00, $03       ; unused ?

.advance $95DD
Bank04_L95DD:  .byte $43
Bank04_L95DE:  .byte $00, $00       ; unused ?

.advance $95E0                      ; used in Bank07
 Bank04_L95E0: .byte $00, $00, $00, $00

.advance MemuByte
    .byte $64

.advance HandleBankEnemies
Bank04_L95E5:  LDA EnDataIndex,X
Bank04_L95E8:  JSR ChooseRoutine

Bank04_L95EB:  .word $991C
Bank04_L95ED:  .word $9937
Bank04_L95EF:  .word ExitSub
Bank04_L95F1:  .word $993C
Bank04_L95F3:  .word $9949
Bank04_L95F5:  .word $999B
Bank04_L95F7:  .word ExitSub
Bank04_L95F9:  .word $9A44
Bank04_L95FB:  .word $9AB4
Bank04_L95FD:  .word $9AE4
Bank04_L95FF:  .word $9B2C
Bank04_L9601:  .word ExitSub
Bank04_L9603:  .word ExitSub
Bank04_L9605:  .word ExitSub
Bank04_L9607:  .word ExitSub
Bank04_L9609:  .word ExitSub

.advance $960B
Bank04_L960B:  .byte $27, $27, $29, $29, $2D, $2B, $31, $2F, $33, $33, $41, $41, $48, $48, $50, $4E

Bank04_L961B:  .byte $6D, $6F, $00, $00, $00, $00, $64, $64, $64, $64, $00, $00, $00, $00, $00, $00

.advance EnemyHitPointTbl
Bank04_L962B:  .byte $08, $08, $00, $FF, $02, $02, $00, $01, $60, $FF, $FF, $00, $00, $00, $00, $00

Bank04_L963B:  .byte $05, $05, $0B, $0B, $17, $13, $1B, $19, $23, $23, $35, $35, $48, $48, $54, $52

Bank04_L964B:  .byte $67, $6A, $56, $58, $5D, $62, $64, $64, $64, $64, $00, $00, $00, $00, $00, $00

.advance $965B
Bank04_L965B:  .byte $05, $05, $0B, $0B, $17, $13, $1B, $19, $23, $23, $35, $35, $48, $48, $4B, $48

Bank04_L966B:  .byte $67, $6A, $56, $58, $5A, $5F, $64, $64, $64, $64, $00, $00, $00, $00, $00, $00

.advance $967B
Bank04_L967B:  .byte $00, $00, $00, $80, $00, $00, $00, $00, $00, $00, $00, $00, $80, $00, $00, $00

.advance $968B
Bank04_L968B:  .byte $89, $89, $09, $00, $86, $04, $89, $80, $83, $00, $00, $00, $82, $00, $00, $00

Bank04_L969B:  .byte $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $40, $00, $00, $00

Bank04_L96AB:  .byte $00, $00, $06, $00, $83, $00, $84, $00, $00, $00, $00, $00, $00, $00, $00, $00

Bank04_L96BB:  .byte $08, $08, $01, $01, $01, $01, $10, $08, $10, $00, $00, $01, $01, $00, $00, $00

Bank04_L96CB:  .byte $00, $03, $00, $06, $08, $0C, $00, $0A, $0E, $11, $13, $00, $00, $00, $00, $00

.advance $96DB
Bank04_L96DB:  .word $97E9, $97EC, $97EF, $97EF, $97EF, $97EF, $97EF, $97EF
Bank04_L96EB:  .word $97EF, $97EF, $97EF, $97EF, $97EF, $97F2, $97F5, $9809
Bank04_L96FB:  .word $981D, $981D, $981D, $981D, $981D, $981D, $981D, $981D
Bank04_L970B:  .word $981D, $9824, $982B, $9832, $9839, $983C, $983F, $9856
Bank04_L971B:  .word $986D, $9884, $989B, $98B2

Bank04_L9723:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $7F, $70, $70, $90, $90, $00, $00, $7F
Bank04_L9733:  .byte $80, $00, $54, $70, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L9743:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L9753:  .byte $F6, $F6, $FC, $0A, $04, $00, $00, $00, $0C, $FC, $FC, $00, $00, $00, $00, $00
Bank04_L9763:  .byte $00, $00, $00, $00, $00, $02, $02, $02, $02, $00, $00, $00, $02, $00, $02, $02
Bank04_L9773:  .byte $00, $00, $00, $00, $00, $00, $00, $00

.advance $977B
Bank04_L977B:  .byte $64, $6C, $21, $01, $04, $00, $4C, $40, $04, $00, $00, $40, $40, $00, $00, $00

Bank04_L978B:  .byte $00, $00, $5F, $62, $64, $64, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L979B:  .byte $0C, $F4, $00, $00, $00, $00, $00, $00, $F4, $00, $00, $00

.advance $97A7
Bank04_L97A7:  .word Bank04_L98C9, Bank04_L98D8, Bank04_L98E7, Bank04_L98F6 

.advance TileFramePtrTbl_Hi
Bank04_L97AF:  .byte >Bank04_L9C4A, >Bank04_L9C4F, >Bank04_L9C54, >Bank04_L9C59, >Bank04_L9C5E,      >Bank04_L9C63,      >Bank04_L9C68,      >Bank04_L9C6D
Bank04_L97B7:  .byte >Bank04_L9C72, >Bank04_L9C77, >Bank04_L9C7C, >Bank04_L9C81, >EnemyAnimIndexTbl, >EnemyAnimIndexTbl, >EnemyAnimIndexTbl, >EnemyAnimIndexTbl
Bank04_L97BF:  .byte >EnemyAnimIndexTbl

.advance TileFramePtrTbl_Lo
Bank04_L97C0:  .byte <Bank04_L9C4A, <Bank04_L9C4F, <Bank04_L9C54, <Bank04_L9C59, <Bank04_L9C5E,      <Bank04_L9C63,      <Bank04_L9C68,      <Bank04_L9C6D
Bank04_L97C8:  .byte <Bank04_L9C72, <Bank04_L9C77, <Bank04_L9C7C, <Bank04_L9C81, <EnemyAnimIndexTbl, <EnemyAnimIndexTbl, <EnemyAnimIndexTbl, <EnemyAnimIndexTbl
Bank04_L97D0:  .byte <EnemyAnimIndexTbl

Bank04_L97D1:  .byte $01, $01, $02, $01, $03, $04, $00, $06, $00, $07, $00, $09, $00, $00, $01, $0C
Bank04_L97E1:  .byte $0D, $00, $0E, $03, $0F, $10, $11, $0F

Bank04_L97E9:  .byte $20, $22, $FE

Bank04_L97EC:  .byte $20, $2A, $FE

Bank04_L97EF:  .byte $01, $01, $FF

Bank04_L97F2:  .byte $01, $09, $FF

Bank04_L97F5:  .byte $04, $22, $01, $42, $01, $22, $01, $42, $01, $62, $01, $42, $04, $62, $FC, $01
Bank04_L9805:  .byte $00, $64, $00, $FB

Bank04_L9809:  .byte $04, $2A, $01, $4A, $01, $2A, $01, $4A, $01, $6A, $01, $4A, $04, $6A, $FC, $01
Bank04_L9819:  .byte $00, $64, $00, $FB

Bank04_L981D:  .byte $14, $11, $0A, $00, $14, $19, $FE

Bank04_L9824:  .byte $14, $19, $0A, $00, $14, $11, $FE

Bank04_L982B:  .byte $32, $11, $0A, $00, $32, $19, $FE

Bank04_L9832:  .byte $32, $19, $0A, $00, $32, $11, $FE

Bank04_L9839:  .byte $50, $04, $FF

Bank04_L983C:  .byte $50, $0C, $FF

Bank04_L983F:  .byte $02, $F3, $04, $E3, $04, $D3, $05, $B3, $03, $93, $04, $03, $05, $13, $03, $33
Bank04_L984F:  .byte $05, $53, $04, $63, $50, $73, $FF

Bank04_L9856:  .byte $02, $FB, $04, $EB, $04, $DB, $05, $BB, $03, $9B, $04, $0B, $05, $1B, $03, $3B
Bank04_L9866:  .byte $05, $5B, $04, $6B, $50, $7B, $FF

Bank04_L986D:  .byte $02, $F4, $04, $E4, $04, $D4, $05, $B4, $03, $94, $04, $04, $05, $14, $03, $34
Bank04_L987D:  .byte $05, $54, $04, $64, $50, $74, $FF

Bank04_L9884:  .byte $02, $FC, $04, $EC, $04, $DC, $05, $BC, $03, $9C, $04, $0C, $05, $1C, $03, $3C
Bank04_L9894:  .byte $05, $5C, $04, $6C, $50, $7C, $FF

Bank04_L989B:  .byte $02, $F2, $04, $E2, $04, $D2, $05, $B2, $03, $92, $04, $02, $05, $12, $03, $32
Bank04_L98AB:  .byte $05, $52, $04, $62, $50, $72, $FF

Bank04_L98B2:  .byte $02, $FA, $04, $EA, $04, $DA, $05, $BA, $03, $9A, $04, $0A, $05, $1A ,$03, $3A
Bank04_L98C2:  .byte $05, $5A, $04, $6A, $50, $7A, $FF

Bank04_L98C9:  .byte $04, $B3, $05, $A3, $06, $93, $07, $03, $06, $13, $05, $23, $50, $33, $FF

Bank04_L98D8:  .byte $09, $C2, $08, $A2, $07, $92, $07, $12, $08, $22, $09, $42, $50, $72, $FF

Bank04_L98E7:  .byte $07, $C2, $06, $A2, $05, $92, $05, $12, $06, $22, $07, $42, $50, $72, $FF

Bank04_L98F6:  .byte $05, $C2, $04, $A2, $03, $92, $03, $12, $04, $22, $05, $42, $50, $72, $FF

Bank04_L9905:  LDA $81
Bank04_L9907:  CMP #$01
Bank04_L9909:  BEQ Bank04_L9914
Bank04_L990B:  CMP #$03
Bank04_L990D:  BEQ Bank04_L9919
Bank04_L990F:  LDA $00
Bank04_L9911:  JMP StartUpdateEnemyAnimation
                ;safe

Bank04_L9914:  LDA $01
Bank04_L9916:  JSR UpdateEnemyAnim
Bank04_L9919:  JMP Start_Special_Attrs
                ;safe

Bank04_L991C:  LDA #$09

Bank04_L991E:  STA $85          ; 2 entry points    A == #$0F or #$09
Bank04_L9920:  STA $86
Bank04_L9922:  LDA Enstatus,X
Bank04_L9925:  CMP #$03
Bank04_L9927:  BEQ Bank04_L992C
                    JSR Bank07_LFB88

Bank04_L992C:  LDA #$06
Bank04_L992E:  STA $00
Bank04_L9930:  LDA #$08
Bank04_L9932:  STA $01
Bank04_L9934:  BNE Bank04_L9905     ; branch always
               nop 
                ; safe

Bank04_L9937:  LDA #$0F
Bank04_L9939:  JMP Bank04_L991E

Bank04_L993C:  LDA Enstatus,X
Bank04_L993F:  CMP #$03
Bank04_L9941:  BEQ Bank04_L992C
Bank04_L9943:  JSR BankEnemyCommonHelper
Bank04_L9946:  JMP Bank04_L992C

Bank04_L9949:  LDA $81
Bank04_L994B:  CMP #$01
Bank04_L994D:  BEQ Bank04_L9993
Bank04_L994F:  CMP #$03
Bank04_L9951:  BEQ Bank04_L9998
Bank04_L9953:  LDA $0406,X
Bank04_L9956:  CMP #$0F
Bank04_L9958:  BCC Bank04_L998E
Bank04_L995A:  CMP #$11
Bank04_L995C:  BCS Bank04_L9965
Bank04_L995E:  LDA #$3A
Bank04_L9960:  STA $6B01,X
Bank04_L9963:  BNE Bank04_L998E

Bank04_L9965:  DEC $6B01,X
Bank04_L9968:  BNE Bank04_L998E
Bank04_L996A:  LDA #$00
Bank04_L996C:  STA Enstatus,X

Bank04_L996F:  LDY #$18
Bank04_L9971:  
    lda #$0A
    sta SpinnerStatus,y 

    lda EnYRoomPos,x  
    sta SpinnerYPos,y 

    lda EnXRoomPos,x
    sta SpinnerXPos,y

    lda EnNameTable,x
    sta SpinnerNameTbl,y

    lda IdentityTable - $08, y
    tay 
    bpl Bank04_L9971

Bank04_L998E:  LDA #$02
Bank04_L9990:  JMP StartUpdateEnemyAnimation

Bank04_L9993:  LDA #$08
Bank04_L9995:  JSR UpdateEnemyAnim
Bank04_L9998:  JMP Start_Special_Attrs

.advance $999B
Bank04_L999B:  JSR DoSomethingToFrameCount
Bank04_L999E:  AND #$03
Bank04_L99A0:  BEQ $99D6
Bank04_L99A2:  LDA $81
Bank04_L99A4:  CMP #$01
Bank04_L99A6:  BEQ $9993
Bank04_L99A8:  CMP #$03
Bank04_L99AA:  BEQ $9998
Bank04_L99AC:  LDA $6AF4,X
Bank04_L99AF:  CMP #$03
Bank04_L99B1:  BEQ $99D6
Bank04_L99B3:  LDA $040A,X
Bank04_L99B6:  AND #$03
Bank04_L99B8:  CMP #$01
Bank04_L99BA:  BNE $99CD
Bank04_L99BC:  LDY $0400,X
Bank04_L99BF:  CPY #$E4
Bank04_L99C1:  BNE $99CD
Bank04_L99C3:  JSR $9A0C
Bank04_L99C6:  LDA #$03
Bank04_L99C8:  STA $040A,X
Bank04_L99CB:  BNE $99D3
Bank04_L99CD:  JSR $9A31
Bank04_L99D0:  JSR $99F7
Bank04_L99D3:  JSR $9A15
Bank04_L99D6:  LDA #$03
Bank04_L99D8:  JSR UpdateEnemyAnim
Bank04_L99DB:  JMP Start_Special_Attrs
Bank04_L99DE:  LDA $0405,X
Bank04_L99E1:  LSR 
Bank04_L99E2:  LDA $040A,X
Bank04_L99E5:  AND #$03
Bank04_L99E7:  ROL 
Bank04_L99E8:  TAY 
Bank04_L99E9:  LDA Bank04_L99EF,Y
Bank04_L99EC:  JMP SetAnimationIndex

Bank04_L99EF:  .byte $35, $35, $3E, $38, $3B, $3B, $38, $3E

Bank04_L99F7:  LDX $4B
Bank04_L99F9:  BCS $9A14
Bank04_L99FB:  LDA $00
Bank04_L99FD:  BNE $9A0C
Bank04_L99FF:  LDY $040A,X
Bank04_L9A02:  DEY 
Bank04_L9A03:  TYA 
Bank04_L9A04:  AND #$03
Bank04_L9A06:  STA $040A,X
Bank04_L9A09:  JMP $99DE
Bank04_L9A0C:  LDA $0405,X
Bank04_L9A0F:  EOR #$01
Bank04_L9A11:  STA $0405,X
Bank04_L9A14:  RTS

Bank04_L9A15:  JSR $9A29
Bank04_L9A18:  JSR $9A31
Bank04_L9A1B:  LDX $4B
Bank04_L9A1D:  BCC $9A28
Bank04_L9A1F:  JSR $9A29
Bank04_L9A22:  STA $040A,X
Bank04_L9A25:  JSR $99DE
Bank04_L9A28:  RTS

Bank04_L9A29:  LDY $040A,X
Bank04_L9A2C:  INY 
Bank04_L9A2D:  TYA 
Bank04_L9A2E:  AND #$03
Bank04_L9A30:  RTS

Bank04_L9A31:  LDY $0405,X
Bank04_L9A34:  STY $00
Bank04_L9A36:  LSR $00
Bank04_L9A38:  ROL 
;Bank04_L9A39:  ASL 
Bank04_L9A3A:  TAY 
Bank04_L9A3B:  LDA Bank_Enemy_Dispatch_Tbl_Hi,Y
Bank04_L9A3E:  PHA 
Bank04_L9A3F:  LDA Bank_Enemy_Dispatch_Tbl_Lo,Y
Bank04_L9A42:  PHA 
Bank04_L9A43:  RTS
               nop 

Bank04_L9A44:  LDA $6AF4,X
Bank04_L9A47:  CMP #$02
Bank04_L9A49:  BNE $9A83
Bank04_L9A4B:  LDA $0403,X
Bank04_L9A4E:  BNE $9A83
Bank04_L9A50:  LDA $6AFE,X
Bank04_L9A53:  BNE $9A67
Bank04_L9A55:  LDA SamusObjectY
               nop 
Bank04_L9A58:  SEC 
Bank04_L9A59:  SBC $0400,X
Bank04_L9A5C:  CMP #$40
Bank04_L9A5E:  BCS $9A83
Bank04_L9A60:  LDA #$7F
Bank04_L9A62:  STA $6AFE,X
Bank04_L9A65:  BNE $9A83
Bank04_L9A67:  LDA $0402,X
Bank04_L9A6A:  BMI $9A83
Bank04_L9A6C:  LDA #$00
Bank04_L9A6E:  STA $0402,X
Bank04_L9A71:  STA $0406,X
Bank04_L9A74:  STA $6AFE,X
Bank04_L9A77:  LDA $0405,X
Bank04_L9A7A:  AND #$01
Bank04_L9A7C:  TAY 
Bank04_L9A7D:  LDA $9AB2,Y
Bank04_L9A80:  STA $0403,X
Bank04_L9A83:  LDA $0405,X
Bank04_L9A86:  ASL 
Bank04_L9A87:  BMI $9AA7
Bank04_L9A89:  LDA $6AF4,X
Bank04_L9A8C:  CMP #$02
Bank04_L9A8E:  BNE $9AA7
Bank04_L9A90:  JSR $833F
Bank04_L9A93:  PHA 
Bank04_L9A94:  JSR Common_Collision_Func
Bank04_L9A97:  STA $05
Bank04_L9A99:  PLA 
Bank04_L9A9A:  STA $04
Bank04_L9A9C:  JSR $9BBC
Bank04_L9A9F:  JSR UpdateObjectLocation
Bank04_L9AA2:  BCC $9AAC
Bank04_L9AA4:  JSR $9BAA
Bank04_L9AA7:  LDA #$03
Bank04_L9AA9:  JMP StartUpdateEnemyAnimation_2
Bank04_L9AAC:  LDA #$00
Bank04_L9AAE:  STA $6AF4,X
Bank04_L9AB1:  RTS

Bank04_L9AB2:  PHP 
Bank04_L9AB3:  SED 
Bank04_L9AB4:  LDA $6AF4,X
Bank04_L9AB7:  CMP #$03
Bank04_L9AB9:  BCC $9AD4
Bank04_L9ABB:  BEQ $9AC1
Bank04_L9ABD:  CMP #$05
Bank04_L9ABF:  BNE $9ADD
Bank04_L9AC1:  LDA #$00
Bank04_L9AC3:  STA $6B04
Bank04_L9AC6:  STA $6B14
Bank04_L9AC9:  STA $6B24
Bank04_L9ACC:  STA $6B34
Bank04_L9ACF:  STA $6B44
Bank04_L9AD2:  BEQ $9ADD
Bank04_L9AD4:  JSR $9B2F
Bank04_L9AD7:  JSR $9BE0
Bank04_L9ADA:  JSR $9C19
Bank04_L9ADD:  LDA #$0A
Bank04_L9ADF:  STA $00
Bank04_L9AE1:  JMP $9930
Bank04_L9AE4:  LDA $0405,X
Bank04_L9AE7:  AND #$02
Bank04_L9AE9:  BEQ $9AF2
Bank04_L9AEB:  LDA $6AF4,X
Bank04_L9AEE:  CMP #$03
Bank04_L9AF0:  BNE $9AF9
Bank04_L9AF2:  LDA #$00
Bank04_L9AF4:  STA $6AF4,X
Bank04_L9AF7:  BEQ $9B24
Bank04_L9AF9:  LDA $0405,X
Bank04_L9AFC:  ASL 
Bank04_L9AFD:  BMI $9B24
Bank04_L9AFF:  LDA $6AF4,X
Bank04_L9B02:  CMP #$02
Bank04_L9B04:  BNE $9B24
Bank04_L9B06:  JSR $8244
Bank04_L9B09:  LDX $4B
Bank04_L9B0B:  LDA $00
Bank04_L9B0D:  STA $0402,X
Bank04_L9B10:  JSR $8318
Bank04_L9B13:  LDX $4B
Bank04_L9B15:  LDA $00
Bank04_L9B17:  STA $0403,X
Bank04_L9B1A:  JSR Bank07_LFA1E
Bank04_L9B1D:  BCS $9B24
Bank04_L9B1F:  LDA #$03
Bank04_L9B21:  STA $6AF4,X
Bank04_L9B24:  LDA #$01
Bank04_L9B26:  JSR UpdateEnemyAnim
Bank04_L9B29:  JMP Start_Special_Attrs
Bank04_L9B2C:  JMP $9AE4
Bank04_L9B2F:  LDX #$50
Bank04_L9B31:  JSR $9B3C
Bank04_L9B34:  TXA 
Bank04_L9B35:  SEC 
Bank04_L9B36:  SBC #$10
Bank04_L9B38:  TAX 
Bank04_L9B39:  BNE $9B31
Bank04_L9B3B:  RTS

Bank04_L9B3C:  LDY $6AF4,X
Bank04_L9B3F:  BEQ $9B67
Bank04_L9B41:  LDA EnDataIndex,X
Bank04_L9B44:  CMP #$0A
Bank04_L9B46:  BEQ $9B4C
Bank04_L9B48:  CMP #$09
Bank04_L9B4A:  BNE $9BBB
Bank04_L9B4C:  LDA $0405,X
Bank04_L9B4F:  AND #$02
Bank04_L9B51:  BEQ $9B67
Bank04_L9B53:  DEY 
Bank04_L9B54:  BEQ $9B72
Bank04_L9B56:  CPY #$02
Bank04_L9B58:  BEQ $9B67
Bank04_L9B5A:  CPY #$03
Bank04_L9B5C:  BNE $9BBB
Bank04_L9B5E:  LDA $040C,X
Bank04_L9B61:  CMP #$01
Bank04_L9B63:  BNE $9BBB
Bank04_L9B65:  BEQ $9B72
Bank04_L9B67:  LDA #$00
Bank04_L9B69:  STA $6AF4,X
Bank04_L9B6C:  STA $040F,X
Bank04_L9B6F:  JSR SetEnemyInitialHitpoints
Bank04_L9B72:  LDA $0405
Bank04_L9B75:  STA $0405,X
Bank04_L9B78:  LSR 
Bank04_L9B79:  PHP 
Bank04_L9B7A:  TXA 
Bank04_L9B7B:  LSR 
Bank04_L9B7C:  LSR 
Bank04_L9B7D:  LSR 
Bank04_L9B7E:  LSR 
Bank04_L9B7F:  TAY 
Bank04_L9B80:  LDA $9BCB,Y
Bank04_L9B83:  STA $04
Bank04_L9B85:  LDA $9BDA,Y
Bank04_L9B88:  STA EnDataIndex,X
Bank04_L9B8B:  TYA 
Bank04_L9B8C:  PLP 
Bank04_L9B8D:  ROL 
Bank04_L9B8E:  TAY 
Bank04_L9B8F:  LDA $9BCF,Y
Bank04_L9B92:  STA $05
Bank04_L9B94:  TXA 
Bank04_L9B95:  PHA 
Bank04_L9B96:  LDX #$00
Bank04_L9B98:  JSR $9BBC
Bank04_L9B9B:  PLA 
Bank04_L9B9C:  TAX 
Bank04_L9B9D:  JSR UpdateObjectLocation
Bank04_L9BA0:  BCC $9BBB
Bank04_L9BA2:  LDA $6AF4,X
Bank04_L9BA5:  BNE $9BAA
Bank04_L9BA7:  INC $6AF4,X
Bank04_L9BAA:  LDA $08
Bank04_L9BAC:  STA $0400,X
Bank04_L9BAF:  LDA $09
Bank04_L9BB1:  STA $0401,X
Bank04_L9BB4:  LDA $0B
Bank04_L9BB6:  AND #$01
Bank04_L9BB8:  STA EnNameTable,X
Bank04_L9BBB:  RTS

Bank04_L9BBC:  LDA $0400,X
Bank04_L9BBF:  STA $08
Bank04_L9BC1:  LDA $0401,X
Bank04_L9BC4:  STA $09
Bank04_L9BC6:  LDA EnNameTable,X
Bank04_L9BC9:  STA $0B
Bank04_L9BCB:  RTS

Bank04_L9BCC:  .byte $F5, $FD, $05, $F6, $FE, $0A, $F6, $0C, $F4, $0E, $F2, $F8, $08, $F4, $0C, $09
Bank04_L9BDC:  .byte $09, $09, $0A, $0A

Bank04_L9BE0:  LDY $7E
Bank04_L9BE2:  BNE $9BE6
Bank04_L9BE4:  LDY #$80
Bank04_L9BE6:  LDA FrameCount
Bank04_L9BE8:  AND #$02
Bank04_L9BEA:  BNE $9C18
Bank04_L9BEC:  DEY 
Bank04_L9BED:  STY $7E
Bank04_L9BEF:  TYA 
Bank04_L9BF0:  ASL 
Bank04_L9BF1:  BMI $9C18
Bank04_L9BF3:  AND #$0F
Bank04_L9BF5:  CMP #$0A
Bank04_L9BF7:  BNE $9C18
Bank04_L9BF9:  LDA #$01
Bank04_L9BFB:  LDX #$10
Bank04_L9BFD:  CMP $6AF4,X
Bank04_L9C00:  BEQ $9C13
Bank04_L9C02:  LDX #$20
Bank04_L9C04:  CMP $6AF4,X
Bank04_L9C07:  BEQ $9C13
Bank04_L9C09:  LDX #$30
Bank04_L9C0B:  CMP $6AF4,X
Bank04_L9C0E:  BEQ $9C13
Bank04_L9C10:  INC $7E
Bank04_L9C12:  RTS

Bank04_L9C13:  LDA #$08
Bank04_L9C15:  STA $0409,X
Bank04_L9C18:  RTS

Bank04_L9C19:  LDY $7F
Bank04_L9C1B:  BNE $9C1F
Bank04_L9C1D:  LDY #$60
Bank04_L9C1F:  LDA $2D
Bank04_L9C21:  AND #$02
Bank04_L9C23:  BNE $9C48
Bank04_L9C25:  DEY 
Bank04_L9C26:  STY $7F
Bank04_L9C28:  TYA 
Bank04_L9C29:  ASL 
Bank04_L9C2A:  BMI $9C48
Bank04_L9C2C:  AND #$0F
Bank04_L9C2E:  BNE $9C48
Bank04_L9C30:  LDA #$01
Bank04_L9C32:  LDX #$40
Bank04_L9C34:  CMP $6AF4,X
Bank04_L9C37:  BEQ $9C43
Bank04_L9C39:  LDX #$50
Bank04_L9C3B:  CMP $6AF4,X
Bank04_L9C3E:  BEQ $9C43
Bank04_L9C40:  INC $7F
Bank04_L9C42:  RTS

Bank04_L9C43:  LDA #$08
Bank04_L9C45:  STA $0409,X
Bank04_L9C48:  RTS 

Bank04_Area_Routine:
    RTS 

Bank04_L9C4A:  .byte $22, $FF, $FF, $FF, $FF

Bank04_L9C4F:  .byte $22, $80, $81, $82, $83

Bank04_L9C54:  .byte $22, $84, $85, $86, $87

Bank04_L9C59:  .byte $22, $88, $89, $8A, $8B

Bank04_L9C5E:  .byte $22, $8C, $8D, $8E, $8F

Bank04_L9C63:  .byte $22, $94, $95, $96, $97

Bank04_L9C68:  .byte $22, $9C, $9D, $9D, $9C

Bank04_L9C6D:  .byte $22, $9E, $9F, $9F, $9E

Bank04_L9C72:  .byte $22, $90, $91, $92, $93

Bank04_L9C77:  .byte $22, $70, $71, $72, $73

Bank04_L9C7C:  .byte $22, $74, $75, $76, $77

Bank04_L9C81:  .byte $22, $78, $79, $7A, $7B

;------------------------------[ Enemy sprite placement data tables ]--------------------------------

Bank04_L9E45:  .byte $FC, $FC

Bank04_L9E47:  .byte $80, $80, $81, $81, $82, $82, $83, $83, $84, $84, $85, $85, $F4, $F8, $F4, $00
Bank04_L9E57:  .byte $FC, $F8, $FC, $00, $04, $F8, $04, $00

Bank04_L9E5F:  .byte $F0, $F4, $F0, $FC, $F0, $04, $F8, $F4, $F8, $FC, $F8, $04, $00, $F4, $00, $FC
Bank04_L9E6F:  .byte $00, $04, $08, $F4, $08, $FC, $08, $04

Bank04_L9E77:  .byte $F8, $F4, $00, $F4, $F8, $FC, $00, $FC, $F4, $FC, $FC, $FC, $F8, $04, $00, $04

Bank04_L9E87:  .byte $02, $F4, $0A, $F4, $F8, $FC, $00, $FC, $02, $04, $0A, $04

Bank04_L9E93:  .byte $F8, $F8, $F8, $00, $00, $F8, $00, $00

Bank04_L9E9B:  .byte $F4, $FC, $FC, $FC, $04, $FC, $FC, $04, $04, $04, $0C, $FC

Bank04_L9EA7:  .byte $F8, $F8, $F8, $00, $00, $F8, $00, $00, $F0, $00, $F0, $08, $F8, $08, $F0, $F0
Bank04_L9EB7:  .byte $F0, $F8, $F8, $F0, $00, $F0, $08, $F0, $08, $F8, $00, $08, $08, $00, $08, $08

Bank04_L9EC7:  .byte $F8, $FC, $00, $F8, $F4, $F4, $FC, $F4, $00, $00, $F4, $04, $FC, $04

Bank04_L9ED5:  .byte $FC, $F8, $FC, $00

;Enemy frame drawing data.

Bank04_L9ED9:  .byte $00, $02, $02, $14, $FF

Bank04_L9EDE:  .byte $00, $02, $02, $24, $FF

Bank04_L9EE3:  .byte $00, $00, $00, $04, $FF

Bank04_L9EE8:  .byte $25, $08, $0A, $E2, $F2, $E3, $F3, $FE, $FE, $FD, $62, $E2, $F2, $FF

Bank04_L9EF6:  .byte $25, $08, $0A, $E4, $F2, $FE, $FE, $E3, $F3, $FD, $62, $E4, $F2, $FF

Bank04_L9F04:  .byte $26, $08, $0A, $F4, $F2, $E3, $F3, $FD, $62, $F4, $F2, $FF

Bank04_L9F10:  .byte $A5, $08, $0A, $E2, $F2, $E3, $F3, $FE, $FE, $FD, $E2, $E2, $F2, $FF

Bank04_L9F1E:  .byte $A5, $08, $0A, $E4, $F2, $FE, $FE, $E3, $F3, $FD, $E2, $E4, $F2, $FF

Bank04_L9F2C:  .byte $A6, $08, $0A, $F4, $F2, $E3, $F3, $FD, $E2, $F4, $F2, $FF

Bank04_L9F38:  .byte $27, $06, $08, $FC, $04, $00, $C0, $C1, $FF

Bank04_L9F41:  .byte $27, $06, $08, $E0, $E1, $FD, $A2, $E0, $E1, $FF

Bank04_L9F4B:  .byte $27, $06, $08, $F0, $F1, $FD, $A2, $F0, $F1, $FF

Bank04_L9F55:  .byte $67, $06, $08, $FC, $04, $00, $C0, $C1, $FF

Bank04_L9F5E:  .byte $67, $06, $08, $E0, $E1, $FD, $E2, $E0, $E1, $FF

Bank04_L9F68:  .byte $67, $06, $08, $F0, $F1, $FD, $E2, $F0, $F1, $FF

Bank04_L9F72:  .byte $28, $0C, $08, $CE, $FC, $00, $FC, $DE, $EE, $DF, $FD, $62, $EE, $FF

Bank04_L9F80:  .byte $28, $0C, $08, $CE, $CF, $EF, $FF

Bank04_L9F87:  .byte $28, $0C, $08, $CE, $FD, $62, $CF, $EF, $FF

Bank04_L9F90:  .byte $21, $00, $00, $FC, $08, $FC, $E2, $FC, $00, $08, $E2, $FC, $00, $F8, $F2, $FC
Bank04_L9FA0:  .byte $00, $08, $F2, $FF

Bank04_L9FA4:  .byte $21, $00, $00, $FC, $00, $FC, $F2, $FC, $00, $08, $F2, $FC, $00, $F8, $E2, $FC
Bank04_L9FB4:  .byte $00, $08, $E2, $FF

Bank04_L9FB8:  .byte $21, $00, $00, $FC, $04, $00, $F1, $F0, $F1, $F0, $FF

Bank04_L9FC3:  .byte $21, $00, $00, $FC, $04, $00, $F0, $F1, $F0, $F1, $FF

Bank04_L9FCE:  .byte $21, $00, $00, $FC, $08, $00, $D1, $D0, $FF

Bank04_L9FD7:  .byte $21, $00, $00, $FC, $08, $00, $D0, $D1, $FF

Bank04_L9FE0:  .byte $21, $00, $00, $FC, $08, $00, $DE, $DF, $EE, $EE, $FF

Bank04_L9FEB:  .byte $27, $08, $08, $CC, $CD, $DC, $DD, $FF

Bank04_L9FF3:  .byte $67, $08, $08, $CC, $CD, $DC, $DD, $FF

Bank04_L9FFB:  .byte $27, $08, $08, $CA, $CB, $DA, $DB, $FF

Bank04_LA003:  .byte $A7, $08, $08, $CA, $CB, $DA, $DB, $FF

Bank04_LA00B:  .byte $A7, $08, $08, $CC, $CD, $DC, $DD, $FF

Bank04_LA013:  .byte $E7, $08, $08, $CC, $CD, $DC, $DD, $FF

Bank04_LA01B:  .byte $67, $08, $08, $CA, $CB, $DA, $DB, $FF

Bank04_LA023:  .byte $E7, $08, $08, $CA, $CB, $DA, $DB, $FF

Bank04_LA02B:  .byte $21, $00, $00, $CC, $CD, $DC, $DD, $FF

Bank04_LA033:  .byte $0A, $00, $00, $75, $FD, $60, $75, $FD, $A0, $75, $FD, $E0, $75, $FF

Bank04_LA041:  .byte $0A, $00, $00, $FE, $FE, $FE, $FE, $3D, $3E, $4E, $FD, $60, $3E, $3D, $4E, $FD
Bank04_LA051:  .byte $E0, $4E, $3E, $3D, $FD, $A0, $4E, $3D, $3E, $FF

Bank04_LA05B:  .byte $2A, $08, $08, $C2, $C3, $D2, $D3, $FF

Bank04_LA063:  .byte $2A, $08, $08, $C2, $C4, $D2, $D4, $FF

Bank04_LA06B:  .byte $21, $08, $08, $C2, $C4, $D2, $D4, $FF

Bank04_LA073:  .byte $6A, $08, $08, $C2, $C3, $D2, $D3, $FF

Bank04_LA07B:  .byte $6A, $08, $08, $C2, $C4, $D2, $D4, $FF

Bank04_LA083:  .byte $61, $08, $08, $C2, $C4, $D2, $D4, $FF

Bank04_LA08B:  .byte $20, $02, $04, $FC, $FF

Bank04_LA090:  .byte $00, $F8, $FF

Bank04_LA093:  .byte $60, $02, $04, $FC, $FF

Bank04_LA098:  .byte $00, $F8, $FF

Bank04_LA09B:  .byte $20, $02, $02, $FC, $FE, $00, $D9, $FF

Bank04_LA0A3:  .byte $E0, $02, $02, $FC, $00, $02, $D8, $FF

Bank04_LA0AB:  .byte $E0, $02, $02, $FC, $02, $00, $D9, $FF

Bank04_LA0B3:  .byte $20, $02, $02, $FC, $00, $FE, $D8, $FF

Bank04_LA0BB:  .byte $60, $02, $02, $FC, $FE, $00, $D9, $FF

Bank04_LA0C3:  .byte $A0, $02, $02, $FC, $00, $FE, $D8, $FF

Bank04_LA0CB:  .byte $A0, $02, $02, $FC, $02, $00, $D9, $FF

Bank04_LA0D3:  .byte $60, $02, $02, $FC, $00, $02, $D8, $FF

Bank04_LA0DB:  .byte $06, $08, $04, $FE, $FE, $14, $24, $FF

Bank04_LA0E3:  .byte $00, $04, $04, $8A, $FF

Bank04_LA0E8:  .byte $00, $04, $04, $8A, $FF

Bank04_LA0ED:  .byte $3F, $04, $08, $FD, $03, $EC, $FD, $43, $EC, $FF

Bank04_LA0F7:  .byte $3F, $04, $08, $FD, $03, $ED, $FD, $43, $ED, $FF

Bank04_LA101:  .byte $22, $10, $0C, $C5, $C6, $C7, $D5, $D6, $D7, $E5, $E6, $E7, $F5, $F6, $F7, $FF

Bank04_LA111:  .byte $22, $10, $0C, $C5, $C6, $C7, $D5, $D6, $D7, $E5, $E6, $E7, $E8, $E9, $F9, $FF

Bank04_LA121:  .byte $62, $10, $0C, $C5, $C6, $C7, $D5, $D6, $D7, $E5, $E6, $E7, $F5, $F6, $F7, $FF

Bank04_LA131:  .byte $62, $10, $0C, $C5, $C6, $C7, $D5, $D6, $D7, $E5, $E6, $E7, $E8, $E9, $F9, $FF

Bank04_LA141:  .byte $21, $00, $00, $C5, $C7, $D5, $D7, $E5, $E7, $FF

Bank04_LA14B:  .byte $21, $00, $00, $C7, $C5, $D7, $D5, $E7, $E5, $FF

;----------------------------------------[ Palette data ]--------------------------------------------

_Palette00:
Bank04_LA155:  .byte $3F           ;Upper byte of PPU palette adress.
Bank04_LA156:  .byte $00           ;Lower byte of PPU palette adress.
Bank04_LA157:  .byte $20           ;Palette data length.
;The following values are written to the background palette:
Bank04_LA158:  .byte $0F, $20, $10, $00, $0F, $28, $19, $1A, $0F, $28, $16, $04, $0F, $23, $11, $02
;The following values are written to the sprite palette:
Bank04_LA168:  .byte $0F, $16, $19, $27, $0F, $12, $30, $21, $0F, $27, $1B, $36, $0F, $17, $22, $31

Bank04_LA178:  .byte $00           ;End Palette00 info.

_Palette01:
Bank04_LA179:  .byte $3F           ;Upper byte of PPU palette adress.
Bank04_LA17A:  .byte $12           ;Lower byte of PPU palette adress.
Bank04_LA17B:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank04_LA17C:  .byte $19, $27

Bank04_LA17E:  .byte $00           ;End Palette01 info.

_Palette03:
Bank04_LA17F:  .byte $3F           ;Upper byte of PPU palette adress.
Bank04_LA180:  .byte $12           ;Lower byte of PPU palette adress.
Bank04_LA181:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank04_LA182:  .byte $2C, $27

Bank04_LA184:  .byte $00           ;End Palette03 info.

_Palette02:
Bank04_LA185:  .byte $3F           ;Upper byte of PPU palette adress.
Bank04_LA186:  .byte $12           ;Lower byte of PPU palette adress.
Bank04_LA187:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank04_LA188:  .byte $19, $35

Bank04_LA18A:  .byte $00           ;End Palette02 info.

_Palette04:
Bank04_LA18B:  .byte $3F           ;Upper byte of PPU palette adress.
Bank04_LA18C:  .byte $12           ;Lower byte of PPU palette adress.
Bank04_LA18D:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank04_LA18E:  .byte $2C, $24

Bank04_LA190:  .byte $00           ;End Palette04 info.

_Palette05:
Bank04_LA191:  .byte $3F           ;Upper byte of PPU palette adress.
Bank04_LA192:  .byte $11           ;Lower byte of PPU palette adress.
Bank04_LA193:  .byte $03           ;Palette data length.
;The following values are written to the sprite palette:
Bank04_LA194:  .byte $04, $09, $07

Bank04_LA196:  .byte $00           ;End Palette05 info.

_Palette06:
Bank04_LA198:  .byte $3F           ;Upper byte of PPU palette adress.
Bank04_LA199:  .byte $11           ;Lower byte of PPU palette adress.
Bank04_LA19A:  .byte $03           ;Palette data length.
;The following values are written to the sprite palette:
Bank04_LA19B:  .byte $05, $09, $17

Bank04_LA19E:  .byte $00           ;End Palette06 info.

_Palette07:
Bank04_LA19F:  .byte $3F           ;Upper byte of PPU palette adress.
Bank04_LA1A0:  .byte $11           ;Lower byte of PPU palette adress.
Bank04_LA1A1:  .byte $03           ;Palette data length.
;The following values are written to the sprite palette:
Bank04_LA1A2:  .byte $06, $0A, $26

Bank04_LA1A5:  .byte $00           ;End Palette07 info.

_Palette08:
Bank04_LA1A6:  .byte $3F           ;Upper byte of PPU palette adress.
Bank04_LA1A7:  .byte $11           ;Lower byte of PPU palette adress.
Bank04_LA1A8:  .byte $03           ;Palette data length.
;The following values are written to the sprite palette:
Bank04_LA1A9:  .byte $16, $19, $27

Bank04_LA1AC:  .byte $00           ;End Palette08 info.

_Palette09:
Bank04_LA1AD:  .byte $3F           ;Upper byte of PPU palette adress.
Bank04_LA1AE:  .byte $00           ;Lower byte of PPU palette adress.
Bank04_LA1AF:  .byte $04           ;Palette data length.
;The following values are written to the background palette:
Bank04_LA1B0:  .byte $0F, $30, $30, $21

Bank04_LA1B4:  .byte $00           ;End Palette09 info.

_Palette0A:
Bank04_LA1B5:  .byte $3F           ;Upper byte of PPU palette adress.
Bank04_LA1B6:  .byte $10           ;Lower byte of PPU palette adress.
Bank04_LA1B7:  .byte $04           ;Palette data length.
;The following values are written to the sprite palette:
Bank04_LA1B8:  .byte $0F, $15, $34, $17

Bank04_LA1BC:  .byte $00           ;End Palette0A info.

_Palette0B:
Bank04_LA1BD:  .byte $3F           ;Upper byte of PPU palette adress.
Bank04_LA1BE:  .byte $10           ;Lower byte of PPU palette adress.
Bank04_LA1BF:  .byte $04           ;Palette data length.
;The following values are written to the sprite palette:
Bank04_LA1C0:  .byte $0F, $15, $34, $19

Bank04_LA1C4:  .byte $00           ;End Palette0B info.

_Palette0C:
Bank04_LA1C5:  .byte $3F           ;Upper byte of PPU palette adress.
Bank04_LA1C6:  .byte $10           ;Lower byte of PPU palette adress.
Bank04_LA1C7:  .byte $04           ;Palette data length.
;The following values are written to the sprite palette:
Bank04_LA1C8:  .byte $0F, $15, $34, $28

Bank04_LA1CC:  .byte $00           ;End Palette0C info.

_Palette0D:
Bank04_LA1CD:  .byte $3F           ;Upper byte of PPU palette adress.
Bank04_LA1CE:  .byte $10           ;Lower byte of PPU palette adress.
Bank04_LA1CF:  .byte $04           ;Palette data length.
;The following values are written to the sprite palette:
Bank04_LA1D0:  .byte $0F, $15, $34, $29

Bank04_LA1D4:  .byte $00           ;End Palette0D info.

;-----------------------------------[ Special items table ]-----------------------------------------

;The way the bytes work int the special items table is as follows:
;Long entry(one with a data word in it):
;Byte 0=Y coordinate of room on the world map.
;Word 0=Address of next entry in the table that has a different Y coordinate.--> 
;   $FFFF=No more items with different Y coordinates.
;Byte 1=X coordinate of room in the world map.
;Byte 2=byte offset-1 of next special item in the table that has the same-->
;   Y coordinate(short entry). $FF=No more items with different X-->
;   coordinates until next long entry.
;Byte 3=Item type. See list below for special item types.
;Bytes 4 to end of entry(ends with #$00)=Data bytes for special item(s).-->
;   It is possible to have multiple special items in one room.
;Short entry(one without a data word in it):
;Byte 0=X coordinate of room in the world map(Y coordinate is the same-->
;   as the last long item entry in the table).
;Byte 1=byte offset-1 of next special item in the table that has the same-->
;   Y coordinate(short entry). $FF=No more items with different X-->
;   coordinates until next long entry.
;Byte 2=Item type. See list below for special item types.
;Bytes 3 to end of entry(ends with #$00)=Data bytes for special item(s).-->
;   It is possible to have multiple special items in one room.
;
;Special item types:
;#$01=Squeept.
;#$02=Power up.
;#$03=Mellows, Memus or Melias.
;#$04=Elevator.
;#$05=Mother brain room cannon.
;#$06=Mother brain.
;#$07=Zeebetite.
;#$08=Rinka.
;#$09=Door.
;#$0A=Palette change room.

_SpecItmsTbl:

;Elevator from Brinstar.
Bank04_LA26D:  .byte $12
Bank04_LA26E:  .word Bank04_LA275
Bank04_LA270:  .byte $07, $FF, $04, $81, $00

;Elevator to Brinstar.
Bank04_LA275:  .byte $14
Bank04_LA276:  .word Bank04_LA27D
Bank04_LA278:  .byte $07, $FF, $04, $82, $00

;Missiles.
Bank04_LA27D:  .byte $15
Bank04_LA27E:  .word Bank04_LA28C
Bank04_LA27F:  .byte $04, $06, $02, $09, $47, $00

;Missiles.
Bank04_LA286:  .byte $09, $FF, $02, $09, $47, $00

;Energy tank.
Bank04_LA28C:  .byte $16
Bank04_LA28D:  .word Bank04_LA295
Bank04_LA28F:  .byte $0A, $FF, $02, $08, $66, $00

;Missiles.
Bank04_LA295:  .byte $19
Bank04_LA296:  .word Bank04_LA29E
Bank04_LA298:  .byte $0A, $FF, $02, $09, $47, $00

;Missiles.
Bank04_LA29E:  .byte $1B
Bank04_LA29F:  .word Bank04_LA2A7
Bank04_LA2A1:  .byte $05, $FF, $02, $09, $47, $00

;Memus.
Bank04_LA2A7:  .byte $1C
Bank04_LA2A8:  .word Bank04_LA2AE
Bank04_LA2A9:  .byte $07, $FF, $03, $00

;Energy tank.
Bank04_LA2AE:  .byte $1D
Bank04_LA2AF:  .word $FFFF
Bank04_LA2B1:  .byte $08, $FF, $02, $08, $BE, $00

;-----------------------------------------[ Room definitions ]---------------------------------------

;The first byte of the room definitions is attribute table data and is used to set the base color of
;the room. The object data is grouped into 3 byte segments and represents a structure in the room.
;The first byte of the structure data has the format yyyyxxxx and contains the y, x location of the
;structure in the room(measured in tiles). The second byte is an index into the _StrctPtrTbl and
;identifies which structure to use.  The third byte is an attribute table byte and determines the
;color of the structure.  Most of the time, this byte will have the same value as the attribute byte
;for the base color of the room. Having a room base color byte reduces the calculations required to
;find the proper color for each structure as the structure attribute byte is skipped if it is the same
;as the room attribute byte. #$FD marks the end of the room objects portion of the room definition.
;Using the byte #$FE can be used as an empty place holder in the room data.  For example, if you
;wanted to remove a structure from a room, simply replace the three bytes associated with the structure
;with #$FE. The next portion of the room definition describes the enemies and doors in the room. The
;number of data bytes and their functions vary depending on what type of item is being loaded.

; Room $00 (unused in original source)
Bank04_LA2B7:
; Room $01
Bank04_LA2C5:
    .byte $AA    ; original base $08 -> palette 2
    .word Bank04_Room_01_Top_Left
    .word Bank04_Room_01_Top_Right
    .word Bank04_Room_01_Bottom_Left
Bank04_Room_01_Bottom_Right:
    .byte $88, $5A
    .byte $B8, $5A
    .byte $E8, $4D
    .byte $FF
Bank04_Room_01_Top_Left:
    .byte $07, $5B
    .byte $27, $59
    .byte $57, $59
    .byte $FF
Bank04_Room_01_Top_Right:
    .byte $08, $5A
    .byte $38, $4D
    .byte $48, $5A
    .byte $78, $4D
    .byte $FF
Bank04_Room_01_Bottom_Left:
    .byte $87, $59
    .byte $B7, $5B
    .byte $D7, $5B
    .byte $FF

; Room $02
Bank04_LA2CD:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_02_Top_Left
    .word Bank04_Room_02_Top_Right
    .word Bank04_Room_02_Bottom_Left
Bank04_Room_02_Bottom_Right:
    .byte $8E, $27
    .byte $8A, $29
    .byte $98, $27
    .byte $9D, $0C
    .byte $9E, $06
    .byte $EB, $0D
    .byte $EE, $27
    .byte $FF
Bank04_Room_02_Top_Left:
    .byte $00, $10
    .byte $04, $10
    .byte $40, $2F
    .byte $60, $54
    .byte $42, $08
    .byte $75, $28
    .byte $FF
Bank04_Room_02_Top_Right:
    .byte $08, $10
    .byte $0C, $10
    .byte $4E, $2F
    .byte $6E, $54
    .byte $6D, $09
    .byte $7A, $28
    .byte $FF
Bank04_Room_02_Bottom_Left:
    .byte $80, $27
    .byte $85, $29
    .byte $90, $06
    .byte $92, $0C
    .byte $96, $27
    .byte $E0, $27
    .byte $E1, $0D
    .byte $FF

; Room $03
Bank04_LA308:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_03_Top_Left
    .word Bank04_Room_03_Top_Right
    .word Bank04_Room_03_Bottom_Left
Bank04_Room_03_Bottom_Right:
    .byte $8A, $06
    .byte $8C, $10
    .byte $C9, $0D
    .byte $CC, $2A
    .byte $DB, $09
    .byte $FF
Bank04_Room_03_Top_Left:
    .byte $00, $06
    .byte $22, $08
    .byte $45, $27
    .byte $47, $11
    .byte $50, $03
    .byte $FD
    .byte $02, $B1    ; Door
    .byte $31, $85, $37    ; Enemy
    .byte $FF
Bank04_Room_03_Top_Right:
    .byte $0A, $0D
    .byte $0E, $06
    .byte $2D, $09
    .byte $48, $11
    .byte $5F, $03
    .byte $FD
    .byte $02, $A0    ; Door
    .byte $FF
Bank04_Room_03_Bottom_Left:
    .byte $80, $10
    .byte $A4, $08
    .byte $C0, $2A
    .byte $E1, $2B
    .byte $FF

; Room $04
Bank04_LA345:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_04_Top_Left
    .word Bank04_Room_04_Top_Right
    .word Bank04_Room_04_Bottom_Left
Bank04_Room_04_Bottom_Right:
    .byte $88, $2E
    .byte $8C, $0D
    .byte $8E, $06
    .byte $BE, $2F
    .byte $DE, $54
    .byte $CD, $09
    .byte $FD
    .byte $21, $83, $C8    ; Enemy
    .byte $FF
Bank04_Room_04_Top_Left:
    .byte $00, $06
    .byte $07, $2E
    .byte $27, $11
    .byte $37, $2D
    .byte $22, $08
    .byte $35, $27
    .byte $37, $11
    .byte $50, $03
    .byte $57, $11
    .byte $67, $2E
    .byte $FD
    .byte $02, $B1    ; Door
    .byte $41, $85, $25    ; Enemy
    .byte $FF
Bank04_Room_04_Top_Right:
    .byte $08, $2C
    .byte $38, $2E
    .byte $0B, $10
    .byte $0E, $06
    .byte $2A, $09
    .byte $38, $11
    .byte $58, $2C
    .byte $5F, $03
    .byte $FD
    .byte $02, $A0    ; Door
    .byte $FF
Bank04_Room_04_Bottom_Left:
    .byte $87, $2D
    .byte $80, $0D
    .byte $90, $06
    .byte $92, $08
    .byte $D0, $2F
    .byte $FF

; Room $05
Bank04_LA388:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_05_Top_Left
    .word Bank04_Room_05_Top_Right
    .word Bank04_Room_05_Bottom_Left
Bank04_Room_05_Bottom_Right:
    .byte $8C, $55
    .byte $9C, $2D
    .byte $9D, $54
    .byte $9F, $2D
    .byte $BC, $10
    .byte $DB, $09
    .byte $FD
    .byte $11, $03, $CA    ; Enemy
    .byte $FF
Bank04_Room_05_Top_Left:
    .byte $00, $10
    .byte $14, $08
    .byte $40, $10
    .byte $FD
    .byte $51, $83, $57    ; Enemy
    .byte $FF
Bank04_Room_05_Top_Right:
    .byte $0C, $10
    .byte $4C, $10
    .byte $6B, $09
    .byte $7C, $2B
    .byte $FF
Bank04_Room_05_Bottom_Left:
    .byte $80, $10
    .byte $94, $08
    .byte $C0, $2A
    .byte $FD
    .byte $01, $03, $95    ; Enemy
    .byte $FF

; Room $06
Bank04_LA3B8:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_06_Top_Left
    .word Bank04_Room_06_Top_Right
    .word Bank04_Room_06_Bottom_Left
Bank04_Room_06_Bottom_Right:
    .byte $88, $10
    .byte $8C, $10
    .byte $C8, $2A
    .byte $CC, $2A
    .byte $FF
Bank04_Room_06_Top_Left:
    .byte $00, $06
    .byte $12, $08
    .byte $17, $11
    .byte $27, $0C
    .byte $31, $0E
    .byte $36, $11
    .byte $50, $03
    .byte $FD
    .byte $02, $B1    ; Door
    .byte $51, $85, $26    ; Enemy
    .byte $FF
Bank04_Room_06_Top_Right:
    .byte $0E, $06
    .byte $18, $30
    .byte $1A, $0D
    .byte $39, $07
    .byte $59, $0E
    .byte $5F, $03
    .byte $FD
    .byte $02, $A1    ; Door
    .byte $01, $85, $2A    ; Enemy
    .byte $FF
Bank04_Room_06_Bottom_Left:
    .byte $80, $10
    .byte $84, $10
    .byte $C0, $2A
    .byte $C4, $2A
    .byte $FF

; Room $07
Bank04_LA401:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_07_Top_Left
    .word Bank04_Room_07_Top_Right
    .word Bank04_Room_07_Bottom_Left
Bank04_Room_07_Bottom_Right:
    .byte $8B, $0E
    .byte $8E, $07
    .byte $9D, $09
    .byte $B8, $27
    .byte $CE, $32
    .byte $FD
    .byte $21, $85, $A8    ; Enemy
    .byte $FF
Bank04_Room_07_Top_Left:
    .byte $00, $10
    .byte $24, $08
    .byte $27, $11
    .byte $40, $32
    .byte $70, $27
    .byte $62, $2B
    .byte $72, $55
    .byte $FD
    .byte $01, $85, $17    ; Enemy
    .byte $FF
Bank04_Room_07_Top_Right:
    .byte $0A, $10
    .byte $0E, $07
    .byte $28, $30
    .byte $5F, $03
    .byte $FD
    .byte $02, $A1    ; Door
    .byte $FF
Bank04_Room_07_Bottom_Left:
    .byte $80, $31
    .byte $82, $2D
    .byte $83, $54
    .byte $85, $2D
    .byte $90, $07
    .byte $B0, $32
    .byte $E0, $27
    .byte $B2, $10
    .byte $B6, $27
    .byte $D6, $08
    .byte $FD
    .byte $31, $03, $87    ; Enemy
    .byte $FF

; Room $08
Bank04_LA442:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_08_Top_Left
    .word Bank04_Room_08_Top_Right
    .word Bank04_Room_08_Bottom_Left
Bank04_Room_08_Bottom_Right:
    .byte $8C, $10
    .byte $AB, $09
    .byte $CC, $2A
    .byte $FF
Bank04_Room_08_Top_Left:
    .byte $00, $10
    .byte $03, $10
    .byte $35, $0E
    .byte $40, $10
    .byte $44, $08
    .byte $FF
Bank04_Room_08_Top_Right:
    .byte $0A, $10
    .byte $0C, $10
    .byte $29, $09
    .byte $4C, $10
    .byte $79, $0E
    .byte $FD
    .byte $11, $85, $6A    ; Enemy
    .byte $FF
Bank04_Room_08_Bottom_Left:
    .byte $80, $10
    .byte $B0, $10
    .byte $B4, $0D
    .byte $D4, $08
    .byte $FD
    .byte $41, $85, $A6    ; Enemy
    .byte $FF

; Room $09
Bank04_LA47E:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_09_Top_Left
    .word Bank04_Room_09_Top_Right
    .word Bank04_Room_09_Bottom_Left
Bank04_Room_09_Bottom_Right:
    .byte $8B, $0E
    .byte $8E, $07
    .byte $9D, $09
    .byte $A8, $11
    .byte $DE, $35
    .byte $FF
Bank04_Room_09_Top_Left:
    .byte $00, $07
    .byte $42, $08
    .byte $50, $32
    .byte $FF
Bank04_Room_09_Top_Right:
    .byte $0D, $09
    .byte $0E, $07
    .byte $5F, $03
    .byte $FD
    .byte $02, $A1    ; Door
    .byte $FF
Bank04_Room_09_Bottom_Left:
    .byte $80, $33
    .byte $A0, $07
    .byte $A6, $34
    .byte $FD
    .byte $21, $85, $97    ; Enemy
    .byte $31, $03, $83    ; Enemy
    .byte $FF

; Room $0A
Bank04_LA4AD:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_0A_Top_Left
    .word Bank04_Room_0A_Top_Right
    .word Bank04_Room_0A_Bottom_Left
Bank04_Room_0A_Bottom_Right:
    .byte $88, $30
    .byte $8B, $0E
    .byte $8E, $07
    .byte $AD, $09
    .byte $CC, $2A
    .byte $D8, $37
    .byte $FF
Bank04_Room_0A_Top_Left:
    .byte $00, $07
    .byte $12, $08
    .byte $50, $32
    .byte $72, $36
    .byte $FF
Bank04_Room_0A_Top_Right:
    .byte $0E, $07
    .byte $5F, $03
    .byte $FD
    .byte $02, $A1    ; Door
    .byte $01, $85, $78    ; Enemy
    .byte $11, $03, $28    ; Enemy
    .byte $FF
Bank04_Room_0A_Bottom_Left:
    .byte $80, $33
    .byte $82, $36
    .byte $87, $11
    .byte $A0, $10
    .byte $D4, $37
    .byte $E0, $2B
    .byte $FF

; Room $0B
Bank04_LA4E2:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_0B_Top_Left
    .word Bank04_Room_0B_Top_Right
    .word Bank04_Room_0B_Bottom_Left
Bank04_Room_0B_Bottom_Right:
    .byte $88, $10
    .byte $8C, $10
    .byte $B8, $10
    .byte $BC, $10
    .byte $FF
Bank04_Room_0B_Top_Left:
    .byte $00, $10
    .byte $04, $10
    .byte $40, $10
    .byte $44, $10
    .byte $FF
Bank04_Room_0B_Top_Right:
    .byte $08, $10
    .byte $0C, $10
    .byte $48, $10
    .byte $4C, $10
    .byte $FF
Bank04_Room_0B_Bottom_Left:
    .byte $80, $10
    .byte $84, $10
    .byte $B0, $10
    .byte $B4, $10
    .byte $FF

; Room $0C
Bank04_LA514:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_0C_Top_Left
    .word Bank04_Room_0C_Top_Right
    .word Bank04_Room_0C_Bottom_Left
Bank04_Room_0C_Bottom_Right:
    .byte $8E, $33
    .byte $9C, $11
    .byte $AE, $07
    .byte $BD, $09
    .byte $C8, $11
    .byte $FF
Bank04_Room_0C_Top_Left:
    .byte $00, $07
    .byte $25, $11
    .byte $32, $08
    .byte $50, $03
    .byte $FD
    .byte $02, $B1    ; Door
    .byte $FF
Bank04_Room_0C_Top_Right:
    .byte $0A, $11
    .byte $0E, $07
    .byte $49, $11
    .byte $5D, $09
    .byte $5E, $32
    .byte $FD
    .byte $51, $85, $39    ; Enemy
    .byte $FF
Bank04_Room_0C_Bottom_Left:
    .byte $80, $07
    .byte $82, $11
    .byte $86, $11
    .byte $C2, $08
    .byte $D0, $35
    .byte $D4, $11
    .byte $FD
    .byte $41, $05, $C4    ; Enemy
    .byte $FF

; Room $0D
Bank04_LA558:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_0D_Top_Left
    .word Bank04_Room_0D_Top_Right
    .word Bank04_Room_0D_Bottom_Left
Bank04_Room_0D_Bottom_Right:
    .byte $8E, $33
    .byte $8A, $0F
    .byte $8C, $11
    .byte $9D, $09
    .byte $AE, $07
    .byte $CA, $38
    .byte $FF
Bank04_Room_0D_Top_Left:
    .byte $00, $07
    .byte $50, $03
    .byte $FD
    .byte $02, $B1    ; Door
    .byte $FF
Bank04_Room_0D_Top_Right:
    .byte $0A, $0F
    .byte $0E, $07
    .byte $1D, $09
    .byte $4A, $0F
    .byte $5E, $32
    .byte $FF
Bank04_Room_0D_Bottom_Left:
    .byte $80, $07
    .byte $86, $0F
    .byte $A2, $11
    .byte $C2, $08
    .byte $D0, $35
    .byte $FF

; Room $0E
Bank04_LA590:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_0E_Top_Left
    .word Bank04_Room_0E_Top_Right
    .word Bank04_Room_0E_Bottom_Left
Bank04_Room_0E_Bottom_Right:
    .byte $8E, $33
    .byte $8A, $0F
    .byte $AE, $07
    .byte $BD, $09
    .byte $CA, $38
    .byte $FF
Bank04_Room_0E_Top_Left:
    .byte $00, $07
    .byte $32, $08
    .byte $50, $32
    .byte $FF
Bank04_Room_0E_Top_Right:
    .byte $0A, $0F
    .byte $0E, $07
    .byte $2D, $09
    .byte $4A, $0F
    .byte $5E, $32
    .byte $78, $11
    .byte $FF
Bank04_Room_0E_Bottom_Left:
    .byte $80, $33
    .byte $92, $08
    .byte $A0, $07
    .byte $FF

; Room $0F
Bank04_LA5BF:
    .byte $55    ; original base $04 -> palette 1
    .word Bank04_Room_0F_Top_Left
    .word Bank04_Room_0F_Top_Right
    .word Bank04_Room_0F_Bottom_Left
Bank04_Room_0F_Bottom_Right:
    .byte $8C, $1F
    .byte $9B, $09
    .byte $C9, $53
    .byte $CA, $4E
    .byte $CD, $4E
    .byte $D8, $37
    .byte $FD
    .byte $07, $87, $D8    ; Zeb hole
    .byte $FF
Bank04_Room_0F_Top_Left:
    .byte $00, $1D
    .byte $FD
    .byte $41, $84, $31    ; Enemy
    .byte $FF
Bank04_Room_0F_Top_Right:
    .byte $08, $1D
    .byte $1E, $1E
    .byte $1F, $57
    .byte $5F, $03
    .byte $FD
    .byte $02, $A1    ; Door
    .byte $FF
Bank04_Room_0F_Bottom_Left:
    .byte $D0, $4F
    .byte $D2, $4F
    .byte $E0, $58
    .byte $D4, $37
    .byte $FD
    .byte $57, $87, $D5    ; Zeb hole
    .byte $FF

; Room $10
Bank04_LA5E8:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_10_Top_Left
    .word Bank04_Room_10_Top_Right
    .word Bank04_Room_10_Bottom_Left
Bank04_Room_10_Bottom_Right:
    .byte $89, $29
    .byte $9B, $0C
    .byte $BD, $3B
    .byte $CF, $39
    .byte $D8, $00
    .byte $FD
    .byte $17, $87, $DA    ; Zeb hole
    .byte $FF
Bank04_Room_10_Top_Left:
    .byte $00, $12
    .byte $57, $39
    .byte $75, $28
    .byte $FF
Bank04_Room_10_Top_Right:
    .byte $08, $12
    .byte $79, $28
    .byte $FD
    .byte $41, $81, $2D    ; Enemy
    .byte $FF
Bank04_Room_10_Bottom_Left:
    .byte $87, $3A
    .byte $85, $29
    .byte $93, $0C
    .byte $B1, $3B
    .byte $D0, $00
    .byte $FD
    .byte $27, $07, $D4    ; Zeb hole
    .byte $FF

; Room $11
Bank04_LA647:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_11_Top_Left
    .word Bank04_Room_11_Top_Right
    .word Bank04_Room_11_Bottom_Left
Bank04_Room_11_Bottom_Right:
    .byte $9B, $0E
    .byte $C9, $39
    .byte $CC, $3E
    .byte $D8, $37
    .byte $FD
    .byte $31, $85, $8C    ; Enemy
    .byte $FF
Bank04_Room_11_Top_Left:
    .byte $00, $12
    .byte $24, $11
    .byte $37, $0C
    .byte $45, $3B
    .byte $57, $39
    .byte $63, $3C
    .byte $65, $3C
    .byte $FF
Bank04_Room_11_Top_Right:
    .byte $08, $12
    .byte $48, $0E
    .byte $FD
    .byte $21, $85, $39    ; Enemy
    .byte $FF
Bank04_Room_11_Bottom_Left:
    .byte $87, $3A
    .byte $83, $3D
    .byte $85, $3D
    .byte $A2, $11
    .byte $C0, $3E
    .byte $C5, $0E
    .byte $D4, $37
    .byte $FD
    .byte $41, $85, $B6    ; Enemy
    .byte $FF

; Room $12 reuses Bank04_LA647 (same pointer as room $11).
; Room $13
Bank04_LA683:
    .byte $FF    ; original base $0C -> palette 3
    .word Bank04_Room_13_Top_Left
    .word Bank04_Room_13_Top_Right
    .word Bank04_Room_13_Bottom_Left
Bank04_Room_13_Bottom_Right:
    .byte $AB, $14
    .byte $BF, $3F
    .byte $D8, $40
    .byte $DA, $37
    .byte $DE, $40
    .byte $FD
    .byte $37, $87, $DD    ; Zeb hole
    .byte $FF
Bank04_Room_13_Top_Left:
    .byte $00, $15
    .byte $10, $16
    .byte $50, $03
    .byte $FD
    .byte $02, $B0    ; Door
    .byte $21, $81, $27    ; Enemy
    .byte $FF
Bank04_Room_13_Top_Right:
    .byte $08, $15
    .byte $68, $14
    .byte $FF
Bank04_Room_13_Bottom_Left:
    .byte $80, $16
    .byte $93, $14
    .byte $C0, $56
    .byte $D0, $56
    .byte $E0, $56
    .byte $D2, $37
    .byte $D6, $40
    .byte $FD
    .byte $41, $85, $84    ; Enemy
    .byte $FF

; Room $14
Bank04_LA6B5:
    .byte $FF    ; original base $0C -> palette 3
    .word Bank04_Room_14_Top_Left
    .word Bank04_Room_14_Top_Right
    .word Bank04_Room_14_Bottom_Left
Bank04_Room_14_Bottom_Right:
    .byte $8A, $14
    .byte $AF, $3F
    .byte $D8, $00
    .byte $FD
    .byte $57, $87, $DC    ; Zeb hole
    .byte $FF
Bank04_Room_14_Top_Left:
    .byte $00, $15
    .byte $FF
Bank04_Room_14_Top_Right:
    .byte $08, $15
    .byte $FF
Bank04_Room_14_Bottom_Left:
    .byte $A4, $14
    .byte $D0, $00
    .byte $FD
    .byte $37, $87, $D1    ; Zeb hole
    .byte $47, $87, $D7    ; Zeb hole
    .byte $01, $85, $95    ; Enemy
    .byte $FF

; Room $15
Bank04_LA6D9:
    .byte $55    ; original base $04 -> palette 1
    .word Bank04_Room_15_Top_Left
    .word Bank04_Room_15_Top_Right
    .word Bank04_Room_15_Bottom_Left
Bank04_Room_15_Bottom_Right:
    .byte $88, $1D
    .byte $B8, $1D
    .byte $C8, $1D
    .byte $FF
Bank04_Room_15_Top_Left:
    .byte $00, $1D
    .byte $20, $1D
    .byte $50, $03
    .byte $FD
    .byte $02, $B1    ; Door
    .byte $FF
Bank04_Room_15_Top_Right:
    .byte $08, $1D
    .byte $28, $1D
    .byte $5F, $03
    .byte $FD
    .byte $02, $A1    ; Door
    .byte $01, $80, $68    ; Enemy
    .byte $FF
Bank04_Room_15_Bottom_Left:
    .byte $80, $1D
    .byte $87, $20
    .byte $97, $21
    .byte $B0, $1D
    .byte $B7, $21
    .byte $C0, $1D
    .byte $C7, $41
    .byte $FF

; Room $16
Bank04_LA713:
    .byte $FF    ; original base $0C -> palette 3
    .word Bank04_Room_16_Top_Left
    .word Bank04_Room_16_Top_Right
    .word Bank04_Room_16_Bottom_Left
Bank04_Room_16_Bottom_Right:
    .byte $8C, $56
    .byte $9C, $56
    .byte $8E, $16
    .byte $BA, $14
    .byte $CE, $56
    .byte $DE, $56
    .byte $EE, $56
    .byte $D8, $37
    .byte $DC, $40
    .byte $FD
    .byte $17, $07, $D8    ; Zeb hole
    .byte $FF
Bank04_Room_16_Top_Left:
    .byte $00, $15
    .byte $61, $14
    .byte $FD
    .byte $21, $81, $27    ; Enemy
    .byte $FF
Bank04_Room_16_Top_Right:
    .byte $08, $15
    .byte $1E, $16
    .byte $5F, $03
    .byte $FD
    .byte $02, $A1    ; Door
    .byte $FF
Bank04_Room_16_Bottom_Left:
    .byte $85, $14
    .byte $D0, $00
    .byte $D6, $40
    .byte $FD
    .byte $07, $87, $D3    ; Zeb hole
    .byte $FF

; Room $17
Bank04_LA745:
    .byte $55    ; original base $04 -> palette 1
    .word Bank04_Room_17_Top_Left
    .word Bank04_Room_17_Top_Right
    .word Bank04_Room_17_Bottom_Left
Bank04_Room_17_Bottom_Right:
    .byte $AE, $0C
    .byte $D8, $00
    .byte $D9, $50
    .byte $DC, $42
    .byte $E9, $50
    .byte $DB, $05
    .byte $DF, $44
    .byte $FD
    .byte $57, $87, $DC    ; Zeb hole
    .byte $FF
Bank04_Room_17_Top_Left:
    .byte $00, $17
    .byte $10, $19
    .byte $24, $42
    .byte $36, $0C
    .byte $50, $03
    .byte $FD
    .byte $02, $B1    ; Door
    .byte $FF
Bank04_Room_17_Top_Right:
    .byte $08, $17
    .byte $28, $42
    .byte $3B, $0C
    .byte $FD
    .byte $31, $04, $48    ; Enemy
    .byte $FF
Bank04_Room_17_Bottom_Left:
    .byte $80, $19
    .byte $C0, $43
    .byte $D4, $42
    .byte $FD
    .byte $41, $80, $C5    ; Enemy
    .byte $FF

; Room $18
Bank04_LA780:
    .byte $55    ; original base $04 -> palette 1
    .word Bank04_Room_18_Top_Left
    .word Bank04_Room_18_Top_Right
    .word Bank04_Room_18_Bottom_Left
Bank04_Room_18_Bottom_Right:
    .byte $8C, $19
    .byte $CC, $43
    .byte $D8, $42
    .byte $FF
Bank04_Room_18_Top_Left:
    .byte $00, $17
    .byte $20, $19
    .byte $FD
    .byte $21, $84, $62    ; Enemy
    .byte $11, $84, $25    ; Enemy
    .byte $FF
Bank04_Room_18_Top_Right:
    .byte $08, $17
    .byte $1C, $19
    .byte $5F, $03
    .byte $FD
    .byte $02, $A1    ; Door
    .byte $01, $84, $29    ; Enemy
    .byte $FF
Bank04_Room_18_Bottom_Left:
    .byte $D0, $18
    .byte $D3, $44
    .byte $D4, $42
    .byte $D5, $05
    .byte $FD
    .byte $37, $87, $D6    ; Zeb hole
    .byte $FF

; Room $19
Bank04_LA7B2:
    .byte $FF    ; original base $0C -> palette 3
    .word Bank04_Room_19_Top_Left
    .word Bank04_Room_19_Top_Right
    .word Bank04_Room_19_Bottom_Left
Bank04_Room_19_Bottom_Right:
    .byte $88, $43
    .byte $8C, $43
    .byte $98, $1A
    .byte $9C, $46
    .byte $B8, $1A
    .byte $C8, $43
    .byte $CC, $43
    .byte $FF
Bank04_Room_19_Top_Left:
    .byte $00, $19
    .byte $04, $19
    .byte $40, $19
    .byte $44, $19
    .byte $70, $45
    .byte $74, $45
    .byte $FF
Bank04_Room_19_Top_Right:
    .byte $08, $19
    .byte $0C, $19
    .byte $48, $19
    .byte $4C, $19
    .byte $78, $45
    .byte $7C, $45
    .byte $FF
Bank04_Room_19_Bottom_Left:
    .byte $80, $43
    .byte $84, $43
    .byte $90, $1A
    .byte $94, $46
    .byte $B0, $1A
    .byte $C0, $43
    .byte $C4, $43
    .byte $FF

; Room $1A
Bank04_LA7F6:
    .byte $FF    ; original base $0C -> palette 3
    .word Bank04_Room_1A_Top_Left
    .word Bank04_Room_1A_Top_Right
    .word Bank04_Room_1A_Bottom_Left
Bank04_Room_1A_Bottom_Right:
    .byte $88, $13
    .byte $8C, $13
    .byte $C8, $3E
    .byte $CC, $3E
    .byte $FF
Bank04_Room_1A_Top_Left:
    .byte $00, $13
    .byte $04, $13
    .byte $10, $13
    .byte $14, $13
    .byte $50, $03
    .byte $FD
    .byte $02, $B1    ; Door
    .byte $FF
Bank04_Room_1A_Top_Right:
    .byte $08, $13
    .byte $0C, $13
    .byte $18, $13
    .byte $1C, $13
    .byte $5F, $03
    .byte $FD
    .byte $02, $A0    ; Door
    .byte $31, $81, $68    ; Enemy
    .byte $FF
Bank04_Room_1A_Bottom_Left:
    .byte $80, $13
    .byte $81, $1B
    .byte $84, $13
    .byte $91, $1C
    .byte $C0, $3E
    .byte $C1, $1C
    .byte $C4, $3E
    .byte $FF

; Room $1B
Bank04_LA83F:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_1B_Top_Left
    .word Bank04_Room_1B_Top_Right
    .word Bank04_Room_1B_Bottom_Left
Bank04_Room_1B_Bottom_Right:
    .byte $88, $14
    .byte $8A, $14
    .byte $8C, $14
    .byte $8E, $07
    .byte $9C, $16
    .byte $D8, $37
    .byte $DC, $4A
    .byte $DE, $4A
    .byte $FD
    .byte $27, $07, $D9    ; Zeb hole
    .byte $FF
Bank04_Room_1B_Top_Left:
    .byte $00, $1F
    .byte $04, $53
    .byte $05, $4E
    .byte $07, $21
    .byte $10, $0C
    .byte $14, $1F
    .byte $17, $21
    .byte $25, $0B
    .byte $41, $22
    .byte $50, $03
    .byte $54, $22
    .byte $FD
    .byte $02, $B0    ; Door
    .byte $FF
Bank04_Room_1B_Top_Right:
    .byte $08, $4E
    .byte $0B, $53
    .byte $0C, $1F
    .byte $18, $1F
    .byte $1F, $0C
    .byte $2A, $0B
    .byte $4C, $23
    .byte $59, $23
    .byte $5F, $03
    .byte $FD
    .byte $02, $A1    ; Door
    .byte $FF
Bank04_Room_1B_Bottom_Left:
    .byte $80, $07
    .byte $82, $14
    .byte $84, $14
    .byte $86, $14
    .byte $92, $16
    .byte $D0, $12
    .byte $D4, $37
    .byte $FF

; Room $1C
Bank04_LA8A3:
    .byte $FF    ; original base $0C -> palette 3
    .word Bank04_Room_1C_Top_Left
    .word Bank04_Room_1C_Top_Right
    .word Bank04_Room_1C_Bottom_Left
Bank04_Room_1C_Bottom_Right:
    .byte $B8, $18
    .byte $D8, $18
    .byte $FD
    .byte $21, $81, $9A    ; Enemy
    .byte $FF
Bank04_Room_1C_Top_Left:
    .byte $00, $17
    .byte $FD
    .byte $01, $80, $45    ; Enemy
    .byte $FF
Bank04_Room_1C_Top_Right:
    .byte $08, $17
    .byte $FD
    .byte $11, $00, $3B    ; Enemy
    .byte $FF
Bank04_Room_1C_Bottom_Left:
    .byte $B0, $18
    .byte $B6, $05
    .byte $D0, $18
    .byte $FD
    .byte $37, $87, $B7    ; Zeb hole
    .byte $FF

; Room $1D
Bank04_LA8C7:
    .byte $55    ; original base $04 -> palette 1
    .word Bank04_Room_1D_Top_Left
    .word Bank04_Room_1D_Top_Right
    .word Bank04_Room_1D_Bottom_Left
Bank04_Room_1D_Bottom_Right:
    .byte $8E, $25
    .byte $8F, $52
    .byte $AF, $52
    .byte $AC, $11
    .byte $B8, $28
    .byte $B9, $4A
    .byte $BB, $3B
    .byte $BE, $1B
    .byte $C8, $49
    .byte $CE, $4A
    .byte $D8, $49
    .byte $DC, $37
    .byte $DE, $4A
    .byte $E8, $4C
    .byte $FF
Bank04_Room_1D_Top_Left:
    .byte $00, $15
    .byte $10, $24
    .byte $13, $0B
    .byte $20, $25
    .byte $22, $22
    .byte $60, $4B
    .byte $70, $4B
    .byte $FF
Bank04_Room_1D_Top_Right:
    .byte $08, $15
    .byte $18, $24
    .byte $1C, $0B
    .byte $1F, $25
    .byte $2B, $23
    .byte $5F, $03
    .byte $FD
    .byte $02, $A0    ; Door
    .byte $FF
Bank04_Room_1D_Bottom_Left:
    .byte $80, $4B
    .byte $90, $4B
    .byte $A0, $25
    .byte $A2, $11
    .byte $B3, $28
    .byte $B4, $4A
    .byte $B6, $4A
    .byte $C3, $48
    .byte $D1, $40
    .byte $D3, $48
    .byte $E0, $4B
    .byte $E3, $56
    .byte $E5, $4C
    .byte $FD
    .byte $01, $48, $95    ; Enemy
    .byte $FF

; Room $1E
Bank04_LA923:
    .byte $55    ; original base $04 -> palette 1
    .word Bank04_Room_1E_Top_Left
    .word Bank04_Room_1E_Top_Right
    .word Bank04_Room_1E_Bottom_Left
Bank04_Room_1E_Bottom_Right:
    .byte $8D, $1E
    .byte $8E, $57
    .byte $8F, $57
    .byte $C8, $1D
    .byte $FF
Bank04_Room_1E_Top_Left:
    .byte $00, $1E
    .byte $02, $53
    .byte $03, $51
    .byte $04, $4E
    .byte $07, $51
    .byte $40, $1E
    .byte $77, $28
    .byte $FD
    .byte $11, $81, $35    ; Enemy
    .byte $FF
Bank04_Room_1E_Top_Right:
    .byte $08, $1D
    .byte $1F, $1E
    .byte $5F, $03
    .byte $FD
    .byte $02, $A1    ; Door
    .byte $FF
Bank04_Room_1E_Bottom_Left:
    .byte $80, $1E
    .byte $87, $1E
    .byte $C0, $1D
    .byte $FF

; Room $1F
Bank04_LA94F:
    .byte $55    ; original base $04 -> palette 1
    .word Bank04_Room_1F_Top_Left
    .word Bank04_Room_1F_Top_Right
    .word Bank04_Room_1F_Bottom_Left
Bank04_Room_1F_Bottom_Right:
    .byte $C8, $1D
    .byte $CC, $05
    .byte $FD
    .byte $01, $88, $AB    ; Enemy
    .byte $17, $07, $CD    ; Zeb hole
    .byte $FF
Bank04_Room_1F_Top_Left:
    .byte $00, $1D
    .byte $10, $1E
    .byte $50, $03
    .byte $FD
    .byte $02, $B1    ; Door
    .byte $FF
Bank04_Room_1F_Top_Right:
    .byte $08, $1D
    .byte $FF
Bank04_Room_1F_Bottom_Left:
    .byte $80, $1F
    .byte $C0, $1D
    .byte $FF

; Room $20
Bank04_LA972:
    .byte $55    ; original base $04 -> palette 1
    .word Bank04_Room_20_Top_Left
    .word Bank04_Room_20_Top_Right
    .word Bank04_Room_20_Bottom_Left
Bank04_Room_20_Bottom_Right:
    .byte $88, $21
    .byte $C8, $1D
    .byte $CD, $05
    .byte $FD
    .byte $27, $87, $CE    ; Zeb hole
    .byte $41, $80, $BC    ; Enemy
    .byte $FF
Bank04_Room_20_Top_Left:
    .byte $00, $1D
    .byte $FF
Bank04_Room_20_Top_Right:
    .byte $08, $1D
    .byte $78, $28
    .byte $FF
Bank04_Room_20_Bottom_Left:
    .byte $C0, $1D
    .byte $FF

; Room $21
Bank04_LA990:
    .byte $55    ; original base $04 -> palette 1
    .word Bank04_Room_15_Top_Left
    .word Bank04_Room_21_Top_Right
    .word Bank04_Room_21_Bottom_Left
Bank04_Room_21_Bottom_Right:
    .byte $88, $1D
    .byte $B8, $1D
    .byte $C8, $1D
    .byte $FF
Bank04_Room_21_Top_Right:
    .byte $08, $1D
    .byte $28, $1D
    .byte $5F, $03
    .byte $FD
    .byte $02, $A1    ; Door
    .byte $21, $81, $68    ; Enemy
    .byte $FF
Bank04_Room_21_Bottom_Left:
    .byte $80, $1D
    .byte $B0, $1D
    .byte $C0, $1D
    .byte $FF

; Room $22
Bank04_LA9BE:
    .byte $FF    ; original base $0C -> palette 3
    .word Bank04_Room_1A_Top_Left
    .word Bank04_Room_22_Top_Right
    .word Bank04_Room_22_Bottom_Left
Bank04_Room_22_Bottom_Right:
    .byte $88, $13
    .byte $8C, $13
    .byte $C8, $3E
    .byte $CC, $3E
    .byte $FF
Bank04_Room_22_Top_Right:
    .byte $08, $13
    .byte $0C, $13
    .byte $18, $13
    .byte $1C, $13
    .byte $5F, $03
    .byte $FD
    .byte $02, $A1    ; Door
    .byte $41, $81, $68    ; Enemy
    .byte $FF
Bank04_Room_22_Bottom_Left:
    .byte $80, $13
    .byte $84, $13
    .byte $C0, $3E
    .byte $C4, $3E
    .byte $FF

; Room $23
Bank04_LA9FE:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_23_Top_Left
    .word Bank04_Room_23_Top_Right
    .word Bank04_Room_23_Bottom_Left
Bank04_Room_23_Bottom_Right:
    .byte $88, $10
    .byte $8C, $10
    .byte $CC, $2A
    .byte $D8, $37
    .byte $FF
Bank04_Room_23_Top_Left:
    .byte $00, $10
    .byte $16, $27
    .byte $34, $08
    .byte $40, $10
    .byte $FF
Bank04_Room_23_Top_Right:
    .byte $0E, $06
    .byte $18, $27
    .byte $2D, $09
    .byte $4B, $0E
    .byte $5F, $03
    .byte $FD
    .byte $02, $A1    ; Door
    .byte $01, $03, $38    ; Enemy
    .byte $FF
Bank04_Room_23_Bottom_Left:
    .byte $80, $10
    .byte $84, $10
    .byte $C0, $2A
    .byte $D4, $37
    .byte $FF

; Room $24
Bank04_LAA33:
    .byte $00    ; original base $00 -> palette 0
    .word Bank04_Room_24_Top_Left
    .word Bank04_Room_24_Top_Right
    .word Bank04_Room_24_Bottom_Left
Bank04_Room_24_Bottom_Right:
    .byte $88, $10
    .byte $8C, $10
    .byte $CC, $2A
    .byte $FF
Bank04_Room_24_Top_Left:
    .byte $00, $07
    .byte $32, $08
    .byte $50, $03
    .byte $FD
    .byte $02, $B1    ; Door
    .byte $41, $80, $75    ; Enemy
    .byte $01, $83, $45    ; Enemy
    .byte $FF
Bank04_Room_24_Top_Right:
    .byte $0E, $07
    .byte $19, $11
    .byte $1D, $09
    .byte $4C, $11
    .byte $5E, $32
    .byte $FD
    .byte $51, $00, $7A    ; Enemy
    .byte $FF
Bank04_Room_24_Bottom_Left:
    .byte $80, $10
    .byte $84, $10
    .byte $C0, $2A
    .byte $FF

;---------------------------------------[ Structure definitions ]------------------------------------

;The first byte of the structure definition states how many macros are in the first row of the
;structure. The the number of bytes after the macro number byte is equal to the value of the macro
;number byte and those bytes define what each macro in the row are. For example, if the macro number
;byte is #$08, the next 8 bytes represent 8 macros. The macro description bytes are the macro numbers
;and are multiplied by 4 to find the index to the desired macro in MacroDefs.  Any further bytes in
;the structure definition represent the next rows.  #$FF marks the end of the structure definition.

;Structure #$00
;Moved to "Common_Struct_00" in Bank_07
Bank04_LAA7E:
    ; Unreferenced original index: zero-byte alias to the next structure.
; Structure $02
Bank04_LAA97:
    ; Unreferenced original index: zero-byte alias to the next structure.
; Structure $03
Bank04_LAAB0:
    .byte $01, $06
    .byte $01, $06
    .byte $01, $06
    .byte $FF

; Structure $04
Bank04_LAAB7:
    ; Unreferenced original index: zero-byte alias to the next structure.
; Structure $05
Bank04_LAABE:
    .byte $02, $14, $15
    .byte $FF

; Structure $06
Bank04_LAAC2:
    .byte $42, $17     ; repeat 2 macros
    .byte $02, $17, $1B
    .byte $02, $17, $1B
    .byte $02, $1B, $17
    .byte $42, $17     ; repeat 2 macros
    .byte $FF

; Structure $07
Bank04_LAAD2:
    .byte $02, $1A, $17
    .byte $42, $17     ; repeat 2 macros
    .byte $02, $1B, $1A
    .byte $42, $17     ; repeat 2 macros
    .byte $02, $1A, $1B
    .byte $FF

; Structure $08
Bank04_LAAE2:
    .byte $01, $18
    .byte $01, $18
    .byte $FF

; Structure $09
Bank04_LAAE7:
    .byte $01, $19
    .byte $01, $19
    .byte $FF

; Structure $0A
Bank04_LAAEC:
    ; Unreferenced original index: zero-byte alias to the next structure.
; Structure $0B
Bank04_LAAEF:
    .byte $01, $0A
    .byte $FF

; Structure $0C
Bank04_LAAF2:
    .byte $01, $1E
    .byte $01, $1A
    .byte $01, $1A
    .byte $01, $1A
    .byte $01, $1E
    .byte $FF

; Structure $0D
Bank04_LAAFD:
    .byte $44, $17     ; repeat 4 macros
    .byte $FF

; Structure $0E
Bank04_LAB03:
    .byte $03, $17, $1D, $17
    .byte $FF

; Structure $0F
Bank04_LAB08:
    .byte $01, $0B
    .byte $01, $0B
    .byte $01, $0B
    .byte $01, $0B
    .byte $FF

; Structure $10
Bank04_LAB11:
    .byte $04, $17, $17, $1B, $17
    .byte $04, $1B, $17, $17, $17
    .byte $04, $1B, $17, $1B, $1B
    .byte $04, $17, $1B, $17, $17
    .byte $FF

; Structure $11
Bank04_LAB26:
    .byte $01, $17
    .byte $FF

; Structure $12
Bank04_LAB29:
    .byte $48, $1E     ; repeat 8 macros
    .byte $48, $1E     ; repeat 8 macros
    .byte $FF

; Structure $13
Bank04_LAB3C:
    .byte $44, $0F     ; repeat 4 macros
    .byte $44, $0F     ; repeat 4 macros
    .byte $44, $0F     ; repeat 4 macros
    .byte $44, $0F     ; repeat 4 macros
    .byte $FF

; Structure $14
Bank04_LAB51:
    .byte $42, $12     ; repeat 2 macros
    .byte $FF

; Structure $15
Bank04_LAB55:
    .byte $48, $10     ; repeat 8 macros
    .byte $48, $10     ; repeat 8 macros
    .byte $FF

; Structure $16
Bank04_LAB68:
    .byte $42, $10     ; repeat 2 macros
    .byte $42, $10     ; repeat 2 macros
    .byte $42, $10     ; repeat 2 macros
    .byte $42, $10     ; repeat 2 macros
    .byte $FF

; Structure $17
Bank04_LAB75:
    .byte $08, $13, $0E, $13, $0E, $0E, $13, $0E, $0E
    .byte $08, $0E, $0E, $13, $13, $0E, $0E, $13, $13
    .byte $FF

; Structure $18
Bank04_LAB88:
    .byte $48, $11     ; repeat 8 macros
    .byte $48, $11     ; repeat 8 macros
    .byte $FF

; Structure $19
Bank04_LAB9B:
    .byte $44, $11     ; repeat 4 macros
    .byte $44, $11     ; repeat 4 macros
    .byte $44, $11     ; repeat 4 macros
    .byte $44, $11     ; repeat 4 macros
    .byte $FF

; Structure $1A
Bank04_LABB0:
    .byte $08, $20, $22, $22, $22, $22, $22, $22, $22
    .byte $FF

; Structure $1B
Bank04_LABBA:
    .byte $01, $1F
    .byte $FF

; Structure $1C
Bank04_LABBD:
    .byte $01, $21
    .byte $01, $21
    .byte $01, $21
    .byte $FF

; Structure $1D
Bank04_LABC4:
    .byte $48, $23     ; repeat 8 macros
    .byte $08, $23, $24, $24, $24, $24, $24, $24, $23
    .byte $48, $23     ; repeat 8 macros
    .byte $FF

; Structure $1E
Bank04_LABE0:
    .byte $01, $23
    .byte $01, $23
    .byte $01, $23
    .byte $01, $23
    .byte $FF

; Structure $1F
Bank04_LABE9:
    .byte $44, $23     ; repeat 4 macros
    .byte $04, $23, $24, $24, $23
    .byte $04, $23, $24, $24, $23
    .byte $44, $23     ; repeat 4 macros
    .byte $FF

; Structure $20
Bank04_LABFE:
    .byte $01, $25
    .byte $FF

; Structure $21
Bank04_LAC01:
    .byte $01, $26
    .byte $01, $26
    .byte $01, $26
    .byte $01, $26
    .byte $FF

; Structure $22
Bank04_LAC0A:
    .byte $43, $27     ; repeat 3 macros
    .byte $FF

; Structure $23
Bank04_LAC0F:
    .byte $43, $28     ; repeat 3 macros
    .byte $FF

; Structure $24
Bank04_LAC14:
    .byte $48, $13     ; repeat 8 macros
    .byte $FF

; Structure $25
Bank04_LAC1E:
    .byte $01, $13
    .byte $01, $13
    .byte $01, $13
    .byte $01, $13
    .byte $FF

; Structure $26
Bank04_LAC27:
    ; Unreferenced original index: zero-byte alias to the next structure.
; Structure $27 — shared cropped/rectangular pattern
Bank04_Struct_27:
    .byte $42, $17     ; repeat 2 macros
    .byte $FF

; Structure $28 — shared cropped/rectangular pattern
Bank04_Struct_28:
    .byte $01, $1E
    .byte $FF

; Structure $29 — shared cropped/rectangular pattern
Bank04_Struct_29:
    .byte $01, $1A
    .byte $01, $1A
    .byte $01, $1A
    .byte $01, $1E
    .byte $FF

; Structure $2A — shared cropped/rectangular pattern
Bank04_Struct_2A:
    .byte $04, $17, $17, $1B, $17
    .byte $04, $1B, $17, $17, $17
    .byte $04, $1B, $17, $1B, $1B
    .byte $FF

; Structure $2B — shared cropped/rectangular pattern
Bank04_Struct_2B:
    .byte $04, $17, $17, $1B, $17
    .byte $FF

; Structure $2C — shared cropped/rectangular pattern
Bank04_Struct_2C:
    .byte $01, $17
    .byte $01, $1B
    .byte $01, $1B
    .byte $FF

; Structure $2D — shared cropped/rectangular pattern
Bank04_Struct_2D:
    .byte $01, $1B
    .byte $01, $17
    .byte $FF

; Structure $2E — shared cropped/rectangular pattern
Bank04_Struct_2E:
    .byte $01, $17
    .byte $01, $17
    .byte $FF

; Structure $2F — shared cropped/rectangular pattern
Bank04_Struct_2F:
    .byte $42, $17     ; repeat 2 macros
    .byte $02, $17, $1B
    .byte $FF

; Structure $30 — shared cropped/rectangular pattern
Bank04_Struct_30:
    .byte $02, $1D, $17
    .byte $FF

; Structure $31 — shared cropped/rectangular pattern
Bank04_Struct_31:
    .byte $02, $1A, $1B
    .byte $FF

; Structure $32 — shared cropped/rectangular pattern
Bank04_Struct_32:
    .byte $02, $1A, $17
    .byte $42, $17     ; repeat 2 macros
    .byte $02, $1B, $1A
    .byte $FF

; Structure $33 — shared cropped/rectangular pattern
Bank04_Struct_33:
    .byte $42, $17     ; repeat 2 macros
    .byte $02, $1A, $1B
    .byte $FF

; Structure $34 — shared cropped/rectangular pattern
Bank04_Struct_34:
    .byte $02, $17, $1D
    .byte $FF

; Structure $35 — shared cropped/rectangular pattern
Bank04_Struct_35:
    .byte $02, $1A, $17
    .byte $42, $17     ; repeat 2 macros
    .byte $FF

; Structure $36 — shared cropped/rectangular pattern
Bank04_Struct_36:
    .byte $01, $18
    .byte $FF

; Structure $37 — shared cropped/rectangular pattern
Bank04_Struct_37:
    .byte $44, $01     ; repeat 4 macros
    .byte $44, $00     ; repeat 4 macros
    .byte $FF

; Structure $38 — shared cropped/rectangular pattern
Bank04_Struct_38:
    .byte $01, $0B
    .byte $01, $0B
    .byte $01, $0B
    .byte $FF

; Structure $39 — shared cropped/rectangular pattern
Bank04_Struct_39:
    .byte $01, $1E
    .byte $01, $1A
    .byte $01, $1A
    .byte $FF

; Structure $3A — shared cropped/rectangular pattern
Bank04_Struct_3A:
    .byte $01, $1A
    .byte $01, $1E
    .byte $FF

; Structure $3B — shared cropped/rectangular pattern
Bank04_Struct_3B:
    .byte $01, $1E
    .byte $01, $1A
    .byte $01, $1A
    .byte $01, $1A
    .byte $FF

; Structure $3C — shared cropped/rectangular pattern
Bank04_Struct_3C:
    .byte $01, $1E
    .byte $01, $1A
    .byte $FF

; Structure $3D — shared cropped/rectangular pattern
Bank04_Struct_3D:
    .byte $01, $1A
    .byte $01, $1A
    .byte $01, $1E
    .byte $FF

; Structure $3E — shared cropped/rectangular pattern
Bank04_Struct_3E:
    .byte $44, $0F     ; repeat 4 macros
    .byte $44, $0F     ; repeat 4 macros
    .byte $44, $0F     ; repeat 4 macros
    .byte $FF

; Structure $3F — shared cropped/rectangular pattern
Bank04_Struct_3F:
    .byte $01, $12
    .byte $FF

; Structure $40 — shared cropped/rectangular pattern
Bank04_Struct_40:
    .byte $42, $01     ; repeat 2 macros
    .byte $42, $00     ; repeat 2 macros
    .byte $FF

; Structure $41 — shared cropped/rectangular pattern
Bank04_Struct_41:
    .byte $01, $26
    .byte $01, $26
    .byte $01, $26
    .byte $FF

; Structure $42 — shared cropped/rectangular pattern
Bank04_Struct_42:
    .byte $44, $11     ; repeat 4 macros
    .byte $44, $11     ; repeat 4 macros
    .byte $FF

; Structure $43 — shared cropped/rectangular pattern
Bank04_Struct_43:
    .byte $44, $11     ; repeat 4 macros
    .byte $44, $11     ; repeat 4 macros
    .byte $44, $11     ; repeat 4 macros
    .byte $FF

; Structure $44 — shared cropped/rectangular pattern
Bank04_Struct_44:
    .byte $01, $01
    .byte $01, $00
    .byte $FF

; Structure $45 — shared cropped/rectangular pattern
Bank04_Struct_45:
    .byte $44, $11     ; repeat 4 macros
    .byte $FF

; Structure $46 — shared cropped/rectangular pattern
Bank04_Struct_46:
    .byte $04, $20, $22, $22, $22
    .byte $FF

; Structure $47 — shared cropped/rectangular pattern
Bank04_Struct_47:
    .byte $44, $22     ; repeat 4 macros
    .byte $FF

; Structure $48 — shared cropped/rectangular pattern
Bank04_Struct_48:
    .byte $45, $13     ; repeat 5 macros
    .byte $FF

; Structure $49 — shared cropped/rectangular pattern
Bank04_Struct_49:
    .byte $43, $13     ; repeat 3 macros
    .byte $FF

; Structure $4A — shared cropped/rectangular pattern
Bank04_Struct_4A:
    .byte $42, $1E     ; repeat 2 macros
    .byte $42, $1E     ; repeat 2 macros
    .byte $FF

; Structure $4B — shared cropped/rectangular pattern
Bank04_Struct_4B:
    .byte $01, $13
    .byte $FF

; Structure $4C — shared cropped/rectangular pattern
Bank04_Struct_4C:
    .byte $43, $10     ; repeat 3 macros
    .byte $FF

; Structure $4D — shared cropped/rectangular pattern
Bank04_Struct_4D:
    .byte $01, $05
    .byte $FF

; Structure $4E — shared cropped/rectangular pattern
Bank04_Struct_4E:
    .byte $43, $23     ; repeat 3 macros
    .byte $43, $24     ; repeat 3 macros
    .byte $43, $23     ; repeat 3 macros
    .byte $FF

; Structure $4F — shared cropped/rectangular pattern
Bank04_Struct_4F:
    .byte $42, $23     ; repeat 2 macros
    .byte $FF

; Structure $50 — shared cropped/rectangular pattern
Bank04_Struct_50:
    .byte $43, $11     ; repeat 3 macros
    .byte $FF

; Structure $51 — shared cropped/rectangular pattern
Bank04_Struct_51:
    .byte $01, $23
    .byte $01, $24
    .byte $01, $23
    .byte $FF

; Structure $52 — shared cropped/rectangular pattern
Bank04_Struct_52:
    .byte $01, $0F
    .byte $01, $0F
    .byte $FF

; Structure $53 — shared cropped/rectangular pattern
Bank04_Struct_53:
    .byte $01, $23
    .byte $01, $23
    .byte $01, $23
    .byte $FF

; Structure $54 — shared cropped/rectangular pattern
Bank04_Struct_54:
    .byte $02, $17, $1B
    .byte $02, $1B, $17
    .byte $FF

; Structure $55 — shared cropped/rectangular pattern
Bank04_Struct_55:
    .byte $04, $1B, $17, $17, $17
    .byte $FF

; Structure $56 — shared cropped/rectangular pattern
Bank04_Struct_56:
    .byte $42, $10     ; repeat 2 macros
    .byte $FF

; Structure $57 — shared cropped/rectangular pattern
Bank04_Struct_57:
    .byte $01, $23
    .byte $01, $24
    .byte $01, $24
    .byte $01, $23
    .byte $FF

; Structure $58 — shared cropped/rectangular pattern
Bank04_Struct_58:
    .byte $04, $23, $24, $24, $23
    .byte $FF

; Structure $59 — shared cropped/rectangular pattern
Bank04_Struct_59:
    .byte $01, $04
    .byte $01, $04
    .byte $01, $04
    .byte $FF

; Structure $5A — shared cropped/rectangular pattern
Bank04_Struct_5A:
    .byte $01, $05
    .byte $01, $05
    .byte $01, $05
    .byte $FF

; Structure $5B — shared cropped/rectangular pattern
Bank04_Struct_5B:
    .byte $01, $04
    .byte $01, $04
    .byte $FF

;==== Room Color Data ===

Bank04_DefaultAttrs:
    .byte $00

Bank04_Room_02_Attrs:
    .byte $D1, $11
    .byte $DE, $44
    .byte $00

Bank04_Room_03_Attrs:
    .byte $C9, $11
    .byte $EA, $11
    .byte $FD, $04
    .byte $D0, $20
    .byte $D8, $22
    .byte $F5, $40
    .byte $CE, $44
    .byte $D7, $80
    .byte $DF, $88
    .byte $00

Bank04_Room_04_Attrs:
    .byte $C9, $11
    .byte $CD, $11
    .byte $E9, $01
    .byte $E1, $10
    .byte $D0, $20
    .byte $D8, $22
    .byte $F6, $44
    .byte $D7, $80
    .byte $DF, $88
    .byte $00

Bank04_Room_05_Attrs:
    .byte $CA, $01
    .byte $EA, $01
    .byte $C2, $10
    .byte $E2, $10
    .byte $FD, $04
    .byte $F5, $40
    .byte $DD, $44
    .byte $00

Bank04_Room_06_Attrs:
    .byte $C9, $01
    .byte $C1, $10
    .byte $D0, $20
    .byte $D8, $22
    .byte $D7, $80
    .byte $DF, $88
    .byte $00

Bank04_Room_07_Attrs:
    .byte $FB, $01
    .byte $EE, $04
    .byte $F3, $10
    .byte $CA, $11
    .byte $E6, $40
    .byte $D7, $80
    .byte $DF, $88
    .byte $00

Bank04_Room_08_Attrs:
    .byte $CC, $44
    .byte $ED, $44
    .byte $FA, $01
    .byte $F2, $10
    .byte $D2, $11
    .byte $00

Bank04_Room_09_Attrs:
    .byte $EE, $04
    .byte $D1, $11
    .byte $E6, $40
    .byte $C6, $44
    .byte $D7, $80
    .byte $DF, $88
    .byte $00

Bank04_Room_0A_Attrs:
    .byte $04, $0A, $FA, $FB, $FC, $FD
    .byte $04, $A0, $F2, $F3, $F4, $F5
    .byte $C9, $01
    .byte $E1, $01
    .byte $C1, $10
    .byte $D9, $10
    .byte $EE, $44
    .byte $D7, $80
    .byte $DF, $88
    .byte $00

Bank04_Room_0C_Attrs:
    .byte $DE, $04
    .byte $F6, $04
    .byte $D6, $40
    .byte $EE, $40
    .byte $D1, $01
    .byte $C9, $10
    .byte $F1, $11
    .byte $D0, $20
    .byte $D8, $22
    .byte $00

Bank04_Room_0D_Attrs:
    .byte $0A, $22, $C5, $CD, $D5, $D8, $DD, $E3, $E5, $EB, $ED, $F5
    .byte $CE, $04
    .byte $EE, $04
    .byte $C6, $40
    .byte $E6, $40
    .byte $FD, $02
    .byte $F1, $11
    .byte $D0, $20
    .byte $00

Bank04_Room_0E_Attrs:
    .byte $07, $22, $C5, $CD, $D5, $DD, $E5, $ED, $F5
    .byte $D1, $01
    .byte $E9, $01
    .byte $C9, $10
    .byte $E1, $10
    .byte $FD, $02
    .byte $F6, $04
    .byte $EE, $40
    .byte $CE, $44
    .byte $00

Bank04_Room_0F_Attrs:
    .byte $04, $5A, $FA, $FB, $FC, $FD
    .byte $04, $A5, $F2, $F3, $F4, $F5
    .byte $D7, $95
    .byte $DF, $99
    .byte $00

Bank04_Room_10_Attrs:
    .byte $08, $0A, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF
    .byte $08, $A0, $F0, $F1, $F2, $F3, $F4, $F5, $F6, $F7
    .byte $00

Bank04_Room_11_Attrs:
    .byte $04, $0A, $FA, $FB, $FC, $FD
    .byte $04, $0F, $F8, $F9, $FE, $FF
    .byte $04, $A0, $F2, $F3, $F4, $F5
    .byte $04, $FF, $F0, $F1, $F6, $F7
    .byte $00

Bank04_Room_13_Attrs:
    .byte $07, $AF, $F1, $F2, $F3, $F4, $F5, $F6, $F7
    .byte $07, $FA, $F9, $FA, $FB, $FC, $FD, $FE, $FF
    .byte $D8, $EE
    .byte $D0, $EF
    .byte $00

Bank04_Room_14_Attrs:
    .byte $08, $AF, $F0, $F1, $F2, $F3, $F4, $F5, $F6, $F7
    .byte $08, $FA, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF
    .byte $00

Bank04_Room_15_Attrs:
    .byte $D0, $65
    .byte $D8, $66
    .byte $D7, $95
    .byte $DF, $99
    .byte $00

Bank04_Room_16_Attrs:
    .byte $07, $AF, $F0, $F1, $F2, $F3, $F4, $F5, $F6
    .byte $07, $FA, $F8, $F9, $FA, $FB, $FC, $FD, $FE
    .byte $DF, $BB
    .byte $D7, $BF
    .byte $00

Bank04_Room_17_Attrs:
    .byte $12, $FF, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CC, $E0, $E1, $E8, $E9, $F0, $F1
    .byte $07, $5F, $D1, $F8, $F9, $FA, $FB, $FD, $FE
    .byte $03, $44, $D3, $DB, $EF
    .byte $D5, $11
    .byte $DD, $11
    .byte $F4, $E5
    .byte $F6, $E5
    .byte $F2, $F5
    .byte $F3, $F5
    .byte $CD, $3F
    .byte $FF, $5B
    .byte $FC, $5E
    .byte $D8, $66
    .byte $D0, $6F
    .byte $F7, $B4
    .byte $F5, $B5
    .byte $CB, $CF
    .byte $00

Bank04_Room_18_Attrs:
    .byte $14, $FF, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CE, $CF, $D0, $D1, $E6, $E7, $EE, $EF, $F6, $F7
    .byte $08, $5F, $D6, $F8, $FA, $FB, $FC, $FD, $FE, $FF
    .byte $03, $F5, $F0, $F4, $F5
    .byte $F1, $B5
    .byte $F2, $B5
    .byte $F9, $5B
    .byte $DF, $99
    .byte $D7, $9F
    .byte $F3, $E5
    .byte $00

Bank04_Room_1A_Attrs:
    .byte $DF, $BB
    .byte $D7, $BF
    .byte $D8, $EE
    .byte $D0, $EF
    .byte $00

Bank04_Room_1B_Attrs:
    .byte $0E, $55, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CB, $CC, $CE, $CF
    .byte $06, $0F, $E2, $E3, $E4, $E5, $F1, $F6
    .byte $04, $05, $D2, $D3, $D4, $D5
    .byte $04, $0A, $FA, $FB, $FC, $FD
    .byte $04, $A0, $F2, $F3, $F4, $F5
    .byte $04, $FF, $E1, $E6, $E9, $EE
    .byte $D0, $20
    .byte $D8, $22
    .byte $CD, $56
    .byte $CA, $59
    .byte $D7, $80
    .byte $DF, $88
    .byte $00

Bank04_Room_1C_Attrs:
    .byte $EB, $AF
    .byte $00

Bank04_Room_1D_Attrs:
    .byte $0B, $FF, $C0, $C2, $C3, $C4, $C5, $C7, $E7, $EF, $F2, $F3, $F4
    .byte $05, $77, $C8, $D0, $D8, $E0, $E8
    .byte $04, $05, $EA, $EB, $EC, $ED
    .byte $03, $50, $C9, $CE, $FF
    .byte $03, $5F, $FA, $FB, $FC
    .byte $CA, $54
    .byte $EE, $54
    .byte $F7, $00
    .byte $E9, $14
    .byte $F5, $33
    .byte $CD, $51
    .byte $FD, $53
    .byte $FE, $5A
    .byte $F8, $5B
    .byte $F9, $5E
    .byte $DF, $99
    .byte $D7, $9D
    .byte $F6, $A5
    .byte $F0, $B7
    .byte $C1, $BF
    .byte $CF, $DD
    .byte $F1, $ED
    .byte $C6, $EF
    .byte $00

Bank04_Room_1E_Attrs:
    .byte $E3, $11
    .byte $EB, $11
    .byte $DB, $15
    .byte $D7, $95
    .byte $DF, $99
    .byte $00

Bank04_Room_1F_Attrs:
    .byte $F6, $5A
    .byte $D0, $65
    .byte $D8, $66
    .byte $00

; OUT OF ROOM

InitBank4:
    LDA #$00 
    STA GameMode 
    JSR ScreenNmiOff
    lda #$05
    sta SpareMemB7
KraidGFX_Loop:
        ldx SpareMemB7
        ldy KraidGFXTable, x
        JSR LoadGFX
        dec SpareMemB7
        bpl KraidGFX_Loop
        jsr LoadEntry_19_and_16_GFX
        JMP NmiOn

;-----------------------------------[ Enemy animation data tables ]----------------------------------

.advance RoomAttrTbl_Hi
    .byte >Bank04_DefaultAttrs     ; Room $00
    .byte >Bank04_DefaultAttrs     ; Room $01
    .byte >Bank04_Room_02_Attrs    ; Room $02
    .byte >Bank04_Room_03_Attrs    ; Room $03
    .byte >Bank04_Room_04_Attrs    ; Room $04
    .byte >Bank04_Room_05_Attrs    ; Room $05
    .byte >Bank04_Room_06_Attrs    ; Room $06
    .byte >Bank04_Room_07_Attrs    ; Room $07
    .byte >Bank04_Room_08_Attrs    ; Room $08
    .byte >Bank04_Room_09_Attrs    ; Room $09
    .byte >Bank04_Room_0A_Attrs    ; Room $0A
    .byte >Bank04_DefaultAttrs     ; Room $0B
    .byte >Bank04_Room_0C_Attrs    ; Room $0C
    .byte >Bank04_Room_0D_Attrs    ; Room $0D
    .byte >Bank04_Room_0E_Attrs    ; Room $0E
    .byte >Bank04_Room_0F_Attrs    ; Room $0F
    .byte >Bank04_Room_10_Attrs    ; Room $10
    .byte >Bank04_Room_11_Attrs    ; Room $11
    .byte >Bank04_Room_11_Attrs    ; Room $12
    .byte >Bank04_Room_13_Attrs    ; Room $13
    .byte >Bank04_Room_14_Attrs    ; Room $14
    .byte >Bank04_Room_15_Attrs    ; Room $15
    .byte >Bank04_Room_16_Attrs    ; Room $16
    .byte >Bank04_Room_17_Attrs    ; Room $17
    .byte >Bank04_Room_18_Attrs    ; Room $18
    .byte >Bank04_DefaultAttrs     ; Room $19
    .byte >Bank04_Room_1A_Attrs    ; Room $1A
    .byte >Bank04_Room_1B_Attrs    ; Room $1B
    .byte >Bank04_Room_1C_Attrs    ; Room $1C
    .byte >Bank04_Room_1D_Attrs    ; Room $1D
    .byte >Bank04_Room_1E_Attrs    ; Room $1E
    .byte >Bank04_Room_1F_Attrs    ; Room $1F
    .byte >Bank04_Room_20_Attrs    ; Room $20
    .byte >Bank04_Room_15_Attrs    ; Room $21
    .byte >Bank04_Room_1A_Attrs    ; Room $22
    .byte >Bank04_Room_23_Attrs    ; Room $23
    .byte >Bank04_Room_24_Attrs    ; Room $24

.advance RoomAttrTbl_Lo
    .byte <Bank04_DefaultAttrs     ; Room $00
    .byte <Bank04_DefaultAttrs     ; Room $01
    .byte <Bank04_Room_02_Attrs    ; Room $02
    .byte <Bank04_Room_03_Attrs    ; Room $03
    .byte <Bank04_Room_04_Attrs    ; Room $04
    .byte <Bank04_Room_05_Attrs    ; Room $05
    .byte <Bank04_Room_06_Attrs    ; Room $06
    .byte <Bank04_Room_07_Attrs    ; Room $07
    .byte <Bank04_Room_08_Attrs    ; Room $08
    .byte <Bank04_Room_09_Attrs    ; Room $09
    .byte <Bank04_Room_0A_Attrs    ; Room $0A
    .byte <Bank04_DefaultAttrs     ; Room $0B
    .byte <Bank04_Room_0C_Attrs    ; Room $0C
    .byte <Bank04_Room_0D_Attrs    ; Room $0D
    .byte <Bank04_Room_0E_Attrs    ; Room $0E
    .byte <Bank04_Room_0F_Attrs    ; Room $0F
    .byte <Bank04_Room_10_Attrs    ; Room $10
    .byte <Bank04_Room_11_Attrs    ; Room $11
    .byte <Bank04_Room_11_Attrs    ; Room $12
    .byte <Bank04_Room_13_Attrs    ; Room $13
    .byte <Bank04_Room_14_Attrs    ; Room $14
    .byte <Bank04_Room_15_Attrs    ; Room $15
    .byte <Bank04_Room_16_Attrs    ; Room $16
    .byte <Bank04_Room_17_Attrs    ; Room $17
    .byte <Bank04_Room_18_Attrs    ; Room $18
    .byte <Bank04_DefaultAttrs     ; Room $19
    .byte <Bank04_Room_1A_Attrs    ; Room $1A
    .byte <Bank04_Room_1B_Attrs    ; Room $1B
    .byte <Bank04_Room_1C_Attrs    ; Room $1C
    .byte <Bank04_Room_1D_Attrs    ; Room $1D
    .byte <Bank04_Room_1E_Attrs    ; Room $1E
    .byte <Bank04_Room_1F_Attrs    ; Room $1F
    .byte <Bank04_Room_20_Attrs    ; Room $20
    .byte <Bank04_Room_15_Attrs    ; Room $21
    .byte <Bank04_Room_1A_Attrs    ; Room $22
    .byte <Bank04_Room_23_Attrs    ; Room $23
    .byte <Bank04_Room_24_Attrs    ; Room $24

Kraid_DefaultAttrs:
    ; Will read a $00 and not change anything

.advance EnemyAnimIndexTbl
    .byte $00, $01, $FF 
    .byte $02, $FF  
    .byte $19, $1A, $FF 
    .byte $1A, $1B, $FF 
    .byte $1C, $1D, $FF 
    .byte $1D, $1E, $FF 
    .byte $22, $23, $24, $FF    
    .byte $1F, $20, $21, $FF    
    .byte $22, $FF  
    .byte $1F, $FF  
    .byte $23, $04, $FF 
    .byte $20, $03, $FF 
    .byte $27, $28, $29, $FF    
    .byte $37, $FF  
    .byte $38, $FF  
    .byte $39, $FF  
    .byte $3A, $FF  
    .byte $3B, $FF  
    .byte $3C, $FF  
    .byte $3D, $FF  
    .byte $58, $59, $FF 
    .byte $5A, $5B, $FF 
    .byte $5C, $5D, $FF 
    .byte $5E, $5F, $FF 
    .byte $60, $FF  
    .byte $61, $F7, $62, $F7, $FF   
    .byte $66, $67, $FF 
    .byte $69, $6A, $FF 
    .byte $68, $FF  
    .byte $6B, $FF  
    .byte $66, $FF  
    .byte $69, $FF  
    .byte $6C, $FF  
    .byte $6D, $FF  
    .byte $6F, $70, $71, $6E, $FF   
    .byte $73, $74, $75, $72, $FF   
    .byte $8F, $90, $FF 
    .byte $91, $92, $FF 
    .byte $93, $94, $FF 
    .byte $95, $FF  
    .byte $96, $FF

;----------------------------[ Enemy sprite drawing pointer tables ]---------------------------------

.advance EnemyFramePtrTbl_Hi

    .byte >Bank04_L9ED9, >Bank04_L9EDE, >Bank04_L9EE3, >Bank04_L9EE8, >Bank04_L9EE8, >Bank04_L9EE8, >Bank04_L9EE8, >Bank04_L9EE8
    .byte >Bank04_L9EE8, >Bank04_L9EE8, >Bank04_L9EE8, >Bank04_L9EE8, >Bank04_L9EE8, >Bank04_L9EE8, >Bank04_L9EE8, >Bank04_L9EE8
    .byte >Bank04_L9EE8, >Bank04_L9EE8, >Bank04_L9EE8, >Bank04_L9EE8, >Bank04_L9EE8, >Bank04_L9EE8, >Bank04_L9EE8, >Bank04_L9EE8 
    .byte >Bank04_L9EE8, >Bank04_L9EE8, >Bank04_L9EF6, >Bank04_L9F04, >Bank04_L9F10, >Bank04_L9F1E, >Bank04_L9F2C, >Bank04_L9F38 
    .byte >Bank04_L9F41, >Bank04_L9F4B, >Bank04_L9F55, >Bank04_L9F5E, >Bank04_L9F68, >Bank04_L9F72, >Bank04_L9F72, >Bank04_L9F72
    .byte >Bank04_L9F80, >Bank04_L9F87, >Bank04_L9F90, >Bank04_L9F90, >Bank04_L9F90, >Bank04_L9F90, >Bank04_L9F90, >Bank04_L9F90
    .byte >Bank04_L9F90, >Bank04_L9F90, >Bank04_L9F90, >Bank04_L9F90, >Bank04_L9F90, >Bank04_L9F90, >Bank04_L9F90, >Bank04_L9F90
    .byte >Bank04_L9FA4, >Bank04_L9FB8, >Bank04_L9FC3, >Bank04_L9FCE, >Bank04_L9FD7, >Bank04_L9FE0, >Bank04_L9FEB, >Bank04_L9FEB
    .byte >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB
    .byte >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB
    .byte >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB, >Bank04_L9FEB
    .byte >Bank04_L9FEB, >Bank04_L9FF3, >Bank04_L9FFB, >Bank04_LA003, >Bank04_LA00B, >Bank04_LA013, >Bank04_LA01B, >Bank04_LA023
    .byte >Bank04_LA02B, >Bank04_LA033, >Bank04_LA041, >Bank04_LA05B, >Bank04_LA05B, >Bank04_LA05B, >Bank04_LA05B, >Bank04_LA063
    .byte >Bank04_LA06B, >Bank04_LA073, >Bank04_LA07B, >Bank04_LA083, >Bank04_LA08B, >Bank04_LA093, >Bank04_LA09B, >Bank04_LA0A3
    .byte >Bank04_LA0AB, >Bank04_LA0B3, >Bank04_LA0BB, >Bank04_LA0C3, >Bank04_LA0CB, >Bank04_LA0D3, >Bank04_LA0DB, >Bank04_LA0DB
    .byte >Bank04_LA0DB, >Bank04_LA0DB, >Bank04_LA0DB, >Bank04_LA0DB, >Bank04_LA0DB, >Bank04_LA0DB, >Bank04_LA0DB, >Bank04_LA0DB
    .byte >Bank04_LA0DB, >Bank04_LA0E3, >Bank04_LA0E8, >Bank04_LA0E8, >Bank04_LA0E8, >Bank04_LA0E8, >Bank04_LA0E8, >Bank04_LA0E8
    .byte >Bank04_LA0E8, >Bank04_LA0E8, >Bank04_LA0ED, >Bank04_LA0ED, >Bank04_LA0ED, >Bank04_LA0ED, >Bank04_LA0ED, >Bank04_LA0ED
    .byte >Bank04_LA0F7, >Bank04_LA101, >Bank04_LA111, >Bank04_LA121, >Bank04_LA131, >Bank04_LA141, >Bank04_LA14B

.advance EnemyFramePtrTbl_Lo

    .byte <Bank04_L9ED9, <Bank04_L9EDE, <Bank04_L9EE3, <Bank04_L9EE8, <Bank04_L9EE8, <Bank04_L9EE8, <Bank04_L9EE8, <Bank04_L9EE8
    .byte <Bank04_L9EE8, <Bank04_L9EE8, <Bank04_L9EE8, <Bank04_L9EE8, <Bank04_L9EE8, <Bank04_L9EE8, <Bank04_L9EE8, <Bank04_L9EE8
    .byte <Bank04_L9EE8, <Bank04_L9EE8, <Bank04_L9EE8, <Bank04_L9EE8, <Bank04_L9EE8, <Bank04_L9EE8, <Bank04_L9EE8, <Bank04_L9EE8 
    .byte <Bank04_L9EE8, <Bank04_L9EE8, <Bank04_L9EF6, <Bank04_L9F04, <Bank04_L9F10, <Bank04_L9F1E, <Bank04_L9F2C, <Bank04_L9F38 
    .byte <Bank04_L9F41, <Bank04_L9F4B, <Bank04_L9F55, <Bank04_L9F5E, <Bank04_L9F68, <Bank04_L9F72, <Bank04_L9F72, <Bank04_L9F72
    .byte <Bank04_L9F80, <Bank04_L9F87, <Bank04_L9F90, <Bank04_L9F90, <Bank04_L9F90, <Bank04_L9F90, <Bank04_L9F90, <Bank04_L9F90
    .byte <Bank04_L9F90, <Bank04_L9F90, <Bank04_L9F90, <Bank04_L9F90, <Bank04_L9F90, <Bank04_L9F90, <Bank04_L9F90, <Bank04_L9F90
    .byte <Bank04_L9FA4, <Bank04_L9FB8, <Bank04_L9FC3, <Bank04_L9FCE, <Bank04_L9FD7, <Bank04_L9FE0, <Bank04_L9FEB, <Bank04_L9FEB
    .byte <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB
    .byte <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB
    .byte <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB, <Bank04_L9FEB
    .byte <Bank04_L9FEB, <Bank04_L9FF3, <Bank04_L9FFB, <Bank04_LA003, <Bank04_LA00B, <Bank04_LA013, <Bank04_LA01B, <Bank04_LA023
    .byte <Bank04_LA02B, <Bank04_LA033, <Bank04_LA041, <Bank04_LA05B, <Bank04_LA05B, <Bank04_LA05B, <Bank04_LA05B, <Bank04_LA063
    .byte <Bank04_LA06B, <Bank04_LA073, <Bank04_LA07B, <Bank04_LA083, <Bank04_LA08B, <Bank04_LA093, <Bank04_LA09B, <Bank04_LA0A3
    .byte <Bank04_LA0AB, <Bank04_LA0B3, <Bank04_LA0BB, <Bank04_LA0C3, <Bank04_LA0CB, <Bank04_LA0D3, <Bank04_LA0DB, <Bank04_LA0DB
    .byte <Bank04_LA0DB, <Bank04_LA0DB, <Bank04_LA0DB, <Bank04_LA0DB, <Bank04_LA0DB, <Bank04_LA0DB, <Bank04_LA0DB, <Bank04_LA0DB
    .byte <Bank04_LA0DB, <Bank04_LA0E3, <Bank04_LA0E8, <Bank04_LA0E8, <Bank04_LA0E8, <Bank04_LA0E8, <Bank04_LA0E8, <Bank04_LA0E8
    .byte <Bank04_LA0E8, <Bank04_LA0E8, <Bank04_LA0ED, <Bank04_LA0ED, <Bank04_LA0ED, <Bank04_LA0ED, <Bank04_LA0ED, <Bank04_LA0ED
    .byte <Bank04_LA0F7, <Bank04_LA101, <Bank04_LA111, <Bank04_LA121, <Bank04_LA131, <Bank04_LA141, <Bank04_LA14B

.advance EnemyPlacePtrTbl_Hi

    .byte >Bank04_L9E45, >Bank04_L9E47, >Bank04_L9E5F, >Bank04_L9E77, >Bank04_L9E77, >Bank04_L9E77, >Bank04_L9E87, >Bank04_L9E93
    .byte >Bank04_L9E9B, >Bank04_L9EA7, >Bank04_L9EA7, >Bank04_L9EC7, >Bank04_L9ED5, >Bank04_L9ED5, >Bank04_L9ED5, >Bank04_L9ED5

.advance EnemyPlacePtrTbl_Lo

    .byte <Bank04_L9E45, <Bank04_L9E47, <Bank04_L9E5F, <Bank04_L9E77, <Bank04_L9E77, <Bank04_L9E77, <Bank04_L9E87, <Bank04_L9E93
    .byte <Bank04_L9E9B, <Bank04_L9EA7, <Bank04_L9EA7, <Bank04_L9EC7, <Bank04_L9ED5, <Bank04_L9ED5, <Bank04_L9ED5, <Bank04_L9ED5

;-------------------------------------[ Room Pointer Table ]-----------------------------------------

.advance RoomPointerTable_Hi
    .byte >Bank04_LA2B7    ; Room $00
    .byte >Bank04_LA2C5    ; Room $01
    .byte >Bank04_LA2CD    ; Room $02
    .byte >Bank04_LA308    ; Room $03
    .byte >Bank04_LA345    ; Room $04
    .byte >Bank04_LA388    ; Room $05
    .byte >Bank04_LA3B8    ; Room $06
    .byte >Bank04_LA401    ; Room $07
    .byte >Bank04_LA442    ; Room $08
    .byte >Bank04_LA47E    ; Room $09
    .byte >Bank04_LA4AD    ; Room $0A
    .byte >Bank04_LA4E2    ; Room $0B
    .byte >Bank04_LA514    ; Room $0C
    .byte >Bank04_LA558    ; Room $0D
    .byte >Bank04_LA590    ; Room $0E
    .byte >Bank04_LA5BF    ; Room $0F
    .byte >Bank04_LA5E8    ; Room $10
    .byte >Bank04_LA647    ; Room $11
    .byte >Bank04_LA647    ; Room $12
    .byte >Bank04_LA683    ; Room $13
    .byte >Bank04_LA6B5    ; Room $14
    .byte >Bank04_LA6D9    ; Room $15
    .byte >Bank04_LA713    ; Room $16
    .byte >Bank04_LA745    ; Room $17
    .byte >Bank04_LA780    ; Room $18
    .byte >Bank04_LA7B2    ; Room $19
    .byte >Bank04_LA7F6    ; Room $1A
    .byte >Bank04_LA83F    ; Room $1B
    .byte >Bank04_LA8A3    ; Room $1C
    .byte >Bank04_LA8C7    ; Room $1D
    .byte >Bank04_LA923    ; Room $1E
    .byte >Bank04_LA94F    ; Room $1F
    .byte >Bank04_LA972    ; Room $20
    .byte >Bank04_LA990    ; Room $21
    .byte >Bank04_LA9BE    ; Room $22
    .byte >Bank04_LA9FE    ; Room $23
    .byte >Bank04_LAA33    ; Room $24

.advance RoomPointerTable_Lo
    .byte <Bank04_LA2B7    ; Room $00
    .byte <Bank04_LA2C5    ; Room $01
    .byte <Bank04_LA2CD    ; Room $02
    .byte <Bank04_LA308    ; Room $03
    .byte <Bank04_LA345    ; Room $04
    .byte <Bank04_LA388    ; Room $05
    .byte <Bank04_LA3B8    ; Room $06
    .byte <Bank04_LA401    ; Room $07
    .byte <Bank04_LA442    ; Room $08
    .byte <Bank04_LA47E    ; Room $09
    .byte <Bank04_LA4AD    ; Room $0A
    .byte <Bank04_LA4E2    ; Room $0B
    .byte <Bank04_LA514    ; Room $0C
    .byte <Bank04_LA558    ; Room $0D
    .byte <Bank04_LA590    ; Room $0E
    .byte <Bank04_LA5BF    ; Room $0F
    .byte <Bank04_LA5E8    ; Room $10
    .byte <Bank04_LA647    ; Room $11
    .byte <Bank04_LA647    ; Room $12
    .byte <Bank04_LA683    ; Room $13
    .byte <Bank04_LA6B5    ; Room $14
    .byte <Bank04_LA6D9    ; Room $15
    .byte <Bank04_LA713    ; Room $16
    .byte <Bank04_LA745    ; Room $17
    .byte <Bank04_LA780    ; Room $18
    .byte <Bank04_LA7B2    ; Room $19
    .byte <Bank04_LA7F6    ; Room $1A
    .byte <Bank04_LA83F    ; Room $1B
    .byte <Bank04_LA8A3    ; Room $1C
    .byte <Bank04_LA8C7    ; Room $1D
    .byte <Bank04_LA923    ; Room $1E
    .byte <Bank04_LA94F    ; Room $1F
    .byte <Bank04_LA972    ; Room $20
    .byte <Bank04_LA990    ; Room $21
    .byte <Bank04_LA9BE    ; Room $22
    .byte <Bank04_LA9FE    ; Room $23
    .byte <Bank04_LAA33    ; Room $24

;----------------------------------------[ Macro definitions ]---------------------------------------

;The macro definitions are simply index numbers into the pattern tables that represent the 4 quadrants
;of the macro definition. The bytes correspond to the following position in order: lower right tile,
;lower left tile, upper right tile, upper left tile. 

.advance MacroUpperRight
    .byte $F1, $FF, $64, $FF, $A4, $FF, $A0, $A1, $4F, $84, $88, $80, $FF, $BB, $10, $04
    .byte $14, $1C, $09, $0C, $FF, $FF, $51, $55, $EC, $FF, $45, $4B, $FF, $47, $08, $70
    .byte $74, $E0, $E4, $20, $25, $78, $E8, $26, $2A

.advance MacroUpperLeft
    .byte $F1, $FF, $64, $FF, $FF, $A5, $A0, $A1, $4F, $85, $89, $81, $FF, $BB, $11, $05
    .byte $15, $1D, $09, $0D, $FF, $FF, $52, $56, $FF, $EE, $46, $4C, $FF, $48, $08, $71
    .byte $75, $E1, $E5, $21, $25, $79, $E9, $27, $2B

.advance MacroLowerRight
    .byte $F1, $F0, $64, $64, $A4, $FF, $A0, $A1, $4F, $86, $8A, $82, $BA, $BB, $12, $06
    .byte $16, $1E, $09, $0E, $59, $5A, $53, $57, $ED, $FF, $45, $4D, $FF, $47, $08, $72
    .byte $76, $E2, $E6, $22, $24, $7A, $EA, $28, $2C

.advance MacroLowerLeft
    .byte $F1, $F0, $64, $64, $FF, $A5, $A0, $A1, $4F, $87, $8B, $83, $BA, $BB, $13, $07
    .byte $17, $1F, $09, $0F, $5A, $5B, $54, $58, $FF, $EF, $46, $50, $FF, $48, $08, $73
    .byte $77, $E3, $E7, $23, $24, $7B, $EB, $29, $2D

;------------------------------------------[ Area music data ]---------------------------------------

;There are 3 control bytes associated with the music data and the rest are musical note indexes.
;If the byte has the binary format 1011xxxx ($Bx), then the byte is an index into the corresponding
;musical notes table and is used to set the note length until it is set by another note length
;byte. The lower 4 bits are the index into the note length table. Another control byte is the loop
;and counter btye. The loop and counter byte has the format 11xxxxxx. Bits 0 thru 6 contain the
;number of times to loop.  The third control byte is #$FF. This control byte marks the end of a loop
;and decrements the loop counter. If #$00 is found in the music data, the music has reached the end.
;A #$00 in any of the different music channel data segments will mark the end of the music. The
;remaining bytes are indexes into the MusicNotesTbl_B4 and should only be even numbers as there are 2
;bytes of data per musical note.

RidleyTriangleIndexData_B4:
Bank04_LB000:  .byte $B6           ;1 3/16 seconds
Bank04_LB001:  .byte $20           ;E3
Bank04_LB002:  .byte $B2           ;3/8 seconds
Bank04_LB003:  .byte $28           ;Ab3
Bank04_LB004:  .byte $B3           ;3/4 seconds
Bank04_LB005:  .byte $2C           ;A#3
Bank04_LB006:  .byte $34           ;D4
Bank04_LB007:  .byte $B4           ;1 1/2 seconds
Bank04_LB008:  .byte $30           ;C4
Bank04_LB009:  .byte $30           ;C4
Bank04_LB00A:  .byte $B3           ;3/4 seconds
Bank04_LB00B:  .byte $3C           ;F#4
Bank04_LB00C:  .byte $38           ;E4
Bank04_LB00D:  .byte $30           ;C4
Bank04_LB00E:  .byte $28           ;Ab3
Bank04_LB00F:  .byte $B4           ;1 1/2 seconds
Bank04_LB010:  .byte $24           ;F#3
Bank04_LB011:  .byte $24           ;F#3
Bank04_LB012:  .byte $1E           ;D#3
Bank04_LB013:  .byte $B3           ;3/4 seconds
Bank04_LB014:  .byte $2A           ;A3
Bank04_LB015:  .byte $26           ;G3
Bank04_LB016:  .byte $B4           ;1 1/2 seconds
Bank04_LB017:  .byte $2E           ;B3
Bank04_LB018:  .byte $2E           ;B3
Bank04_LB019:  .byte $B3           ;3/4 seconds
Bank04_LB01A:  .byte $32           ;C#4
Bank04_LB01B:  .byte $36           ;D#4
Bank04_LB01C:  .byte $2E           ;B3
Bank04_LB01D:  .byte $32           ;C#4
Bank04_LB01E:  .byte $B4           ;1 1/2 seconds
Bank04_LB01F:  .byte $2A           ;A3
Bank04_LB020:  .byte $2A           ;A3
Bank04_LB021:  .byte $00           ;End Ridley area music.

RidleySQ1IndexData_B4:
Bank04_LB022:  .byte $BA           ;3/64 seconds
Bank04_LB023:  .byte $02           ;No sound
Bank04_LB024:  .byte $D0           ;
Bank04_LB025:  .byte $B1           ;3/16 seconds   +
Bank04_LB026:  .byte $3C           ;F#4        |
Bank04_LB027:  .byte $40           ;Ab4        | Repeat 16 times
Bank04_LB028:  .byte $44           ;A#4        |
Bank04_LB029:  .byte $40           ;Ab4        +
Bank04_LB02A:  .byte $FF           ;
Bank04_LB02B:  .byte $D0           ;
Bank04_LB02C:  .byte $42           ;A4     +
Bank04_LB02D:  .byte $46           ;B4     | Repeat 16 times
Bank04_LB02E:  .byte $4A           ;C#5        |
Bank04_LB02F:  .byte $46           ;B4     +
Bank04_LB030:  .byte $FF           ;

RidleySQ2IndexData_B4:
Bank04_LB031:  .byte $D0           ;
Bank04_LB032:  .byte $B1           ;3/16 seconds   +
Bank04_LB033:  .byte $44           ;A#4        |
Bank04_LB034:  .byte $48           ;C5     | Repeat 16 times
Bank04_LB035:  .byte $4C           ;D5     |
Bank04_LB036:  .byte $48           ;C5     +
Bank04_LB037:  .byte $FF           ;
Bank04_LB038:  .byte $D0           ;
Bank04_LB039:  .byte $4A           ;C#5        +
Bank04_LB03A:  .byte $4E           ;D#5        | Repeat 16 times
Bank04_LB03B:  .byte $52           ;F5     |
Bank04_LB03C:  .byte $4E           ;D#5        +
Bank04_LB03D:  .byte $FF           ;
Bank04_LB03E:  .byte $00           ;End Ridley area music.

KraidSQ1IndexData_B4:
Bank04_LB03F:  .byte $B8           ;11/64 seconds
Bank04_LB040:  .byte $02           ;No sound

;SQ1 music data runs down into the SQ2 music data.
KraidSQ2IndexData_B4:
Bank04_LB041:  .byte $C4           ;
Bank04_LB042:  .byte $B3           ;1/2 seconds    +
Bank04_LB043:  .byte $38           ;E4     |
Bank04_LB044:  .byte $B2           ;1/4 seconds    |
Bank04_LB045:  .byte $2E           ;B3     |
Bank04_LB046:  .byte $B3           ;1/2 seconds    |
Bank04_LB047:  .byte $42           ;A4     |
Bank04_LB048:  .byte $B2           ;1/4 seconds    |
Bank04_LB049:  .byte $30           ;C4     | Repeat 4 times
Bank04_LB04A:  .byte $B3           ;1/2 seconds    |
Bank04_LB04B:  .byte $3C           ;F#4        |
Bank04_LB04C:  .byte $B2           ;1/4 seconds    |
Bank04_LB04D:  .byte $34           ;D4     |
Bank04_LB04E:  .byte $B3           ;1/2 seconds    |
Bank04_LB04F:  .byte $2E           ;B3     |
Bank04_LB050:  .byte $B2           ;1/4 seconds    |
Bank04_LB051:  .byte $2C           ;A#3        +
Bank04_LB052:  .byte $FF           ;
Bank04_LB053:  .byte $C2           ;
Bank04_LB054:  .byte $B3           ;1/2 seconds    +
Bank04_LB055:  .byte $3E           ;G4     |
Bank04_LB056:  .byte $B2           ;1/4 seconds    |
Bank04_LB057:  .byte $34           ;D4     |
Bank04_LB058:  .byte $B3           ;1/2 seconds    |
Bank04_LB059:  .byte $38           ;E4     |
Bank04_LB05A:  .byte $B2           ;1/4 seconds    |
Bank04_LB05B:  .byte $2E           ;B3     | Repeat 2 times
Bank04_LB05C:  .byte $B3           ;1/2 seconds    |
Bank04_LB05D:  .byte $3C           ;F#4        |
Bank04_LB05E:  .byte $B2           ;1/4 seconds    |
Bank04_LB05F:  .byte $34           ;D4     |
Bank04_LB060:  .byte $B3           ;1/2 seconds    |
Bank04_LB061:  .byte $42           ;A4     |
Bank04_LB062:  .byte $B2           ;1/4 seconds    |
Bank04_LB063:  .byte $38           ;E4     +
Bank04_LB064:  .byte $FF           ;
Bank04_LB065:  .byte $C4           ;
Bank04_LB066:  .byte $B1           ;1/8 seconds    +
Bank04_LB067:  .byte $3E           ;G4     |
Bank04_LB068:  .byte $2E           ;B3     |
Bank04_LB069:  .byte $3E           ;G4     |
Bank04_LB06A:  .byte $2E           ;B3     |
Bank04_LB06B:  .byte $3E           ;G4     |
Bank04_LB06C:  .byte $2E           ;B3     |
Bank04_LB06D:  .byte $44           ;A#4        |
Bank04_LB06E:  .byte $38           ;E4     |
Bank04_LB06F:  .byte $44           ;A#4        |
Bank04_LB070:  .byte $38           ;E4     |
Bank04_LB071:  .byte $44           ;A#4        | Repeat 4 times
Bank04_LB072:  .byte $38           ;E4     |
Bank04_LB073:  .byte $42           ;A4     |
Bank04_LB074:  .byte $30           ;C4     |
Bank04_LB075:  .byte $42           ;A4     |
Bank04_LB076:  .byte $30           ;C4     |
Bank04_LB077:  .byte $42           ;A4     |
Bank04_LB078:  .byte $30           ;C4     |
Bank04_LB079:  .byte $42           ;A4     |
Bank04_LB07A:  .byte $36           ;D#4        |
Bank04_LB07B:  .byte $3C           ;F#4        |
Bank04_LB07C:  .byte $36           ;D#4        |
Bank04_LB07D:  .byte $46           ;B4     |
Bank04_LB07E:  .byte $36           ;D#4        +
Bank04_LB07F:  .byte $FF           ;
Bank04_LB080:  .byte $C2           ;
Bank04_LB081:  .byte $3C           ;F#4        +
Bank04_LB082:  .byte $3E           ;G4     |
Bank04_LB083:  .byte $42           ;A4     |
Bank04_LB084:  .byte $46           ;B4     |
Bank04_LB085:  .byte $4C           ;D5     |
Bank04_LB086:  .byte $46           ;B4     |
Bank04_LB087:  .byte $54           ;F#5        |
Bank04_LB088:  .byte $4C           ;D5     |
Bank04_LB089:  .byte $42           ;A4     |
Bank04_LB08A:  .byte $3E           ;G4     |
Bank04_LB08B:  .byte $3C           ;F#4        | Repeat 2 times
Bank04_LB08C:  .byte $46           ;B4     |
Bank04_LB08D:  .byte $5A           ;A5     |
Bank04_LB08E:  .byte $54           ;F#5        |
Bank04_LB08F:  .byte $4C           ;D5     |
Bank04_LB090:  .byte $42           ;A4     |
Bank04_LB091:  .byte $3E           ;G4     |
Bank04_LB092:  .byte $3C           ;F#4        |
Bank04_LB093:  .byte $38           ;E4     |
Bank04_LB094:  .byte $3E           ;G4     |
Bank04_LB095:  .byte $42           ;A4     |
Bank04_LB096:  .byte $4C           ;D5     |
Bank04_LB097:  .byte $50           ;E5     |
Bank04_LB098:  .byte $02           ;No sound   +
Bank04_LB099:  .byte $FF           ;
Bank04_LB09A:  .byte $C4           ;
Bank04_LB09B:  .byte $B1           ;1/8 seconds    +
Bank04_LB09C:  .byte $5A           ;A5     |
Bank04_LB09D:  .byte $02           ;No sound   |
Bank04_LB09E:  .byte $56           ;G5     |
Bank04_LB09F:  .byte $02           ;No sound   |
Bank04_LB0A0:  .byte $54           ;F#5        |
Bank04_LB0A1:  .byte $02           ;No sound   | Repeat 4 times
Bank04_LB0A2:  .byte $50           ;E5     |
Bank04_LB0A3:  .byte $02           ;No sound   |
Bank04_LB0A4:  .byte $54           ;F#5        |
Bank04_LB0A5:  .byte $02           ;No sound   |
Bank04_LB0A6:  .byte $56           ;G5     |
Bank04_LB0A7:  .byte $02           ;No sound   +
Bank04_LB0A8:  .byte $FF           ;
Bank04_LB0A9:  .byte $00           ;End Kraid area music.

KraidTriangleIndexData_B4:
Bank04_LB0AA:  .byte $D0           ;
Bank04_LB0AB:  .byte $B2           ;1/4 seconds    +
Bank04_LB0AC:  .byte $20           ;E3     | Repeat 16 times
Bank04_LB0AD:  .byte $B3           ;1/2 seconds    |
Bank04_LB0AE:  .byte $38           ;E4     +
Bank04_LB0AF:  .byte $FF           ;
Bank04_LB0B0:  .byte $C2           ;
Bank04_LB0B1:  .byte $B2           ;1/4 seconds    +
Bank04_LB0B2:  .byte $18           ;C3     |
Bank04_LB0B3:  .byte $B3           ;1/2 seconds    |
Bank04_LB0B4:  .byte $30           ;C4     |
Bank04_LB0B5:  .byte $B2           ;1/4 seconds    |
Bank04_LB0B6:  .byte $18           ;C3     |
Bank04_LB0B7:  .byte $B3           ;1/2 seconds    |
Bank04_LB0B8:  .byte $30           ;C4     | Repeat 2 times
Bank04_LB0B9:  .byte $B2           ;1/4 seconds    |
Bank04_LB0BA:  .byte $1C           ;D3     |
Bank04_LB0BB:  .byte $B3           ;1/2 seconds    |
Bank04_LB0BC:  .byte $34           ;D4     |
Bank04_LB0BD:  .byte $B2           ;1/4 seconds    |
Bank04_LB0BE:  .byte $1C           ;D3     |
Bank04_LB0BF:  .byte $B3           ;1/2 seconds    |
Bank04_LB0C0:  .byte $34           ;D4     +
Bank04_LB0C1:  .byte $FF           ;
Bank04_LB0C2:  .byte $C4           ;
Bank04_LB0C3:  .byte $B2           ;1/4 seconds    +
Bank04_LB0C4:  .byte $20           ;E3     |
Bank04_LB0C5:  .byte $38           ;E4     |
Bank04_LB0C6:  .byte $50           ;E5     |
Bank04_LB0C7:  .byte $24           ;F#3        |
Bank04_LB0C8:  .byte $3C           ;F#4        | Repeat 4 times
Bank04_LB0C9:  .byte $54           ;F#5        |
Bank04_LB0CA:  .byte $22           ;F3     |
Bank04_LB0CB:  .byte $3A           ;F4     |
Bank04_LB0CC:  .byte $52           ;F5     |
Bank04_LB0CD:  .byte $16           ;B2     |
Bank04_LB0CE:  .byte $2E           ;B3     |
Bank04_LB0CF:  .byte $46           ;B4     +
Bank04_LB0D0:  .byte $FF           ;
Bank04_LB0D1:  .byte $C2           ;
Bank04_LB0D2:  .byte $B3           ;1/2 seconds    +
Bank04_LB0D3:  .byte $20           ;E3     |
Bank04_LB0D4:  .byte $B2           ;1/4 seconds    |
Bank04_LB0D5:  .byte $2E           ;B3     |
Bank04_LB0D6:  .byte $B3           ;1/2 seconds    |
Bank04_LB0D7:  .byte $30           ;C4     |
Bank04_LB0D8:  .byte $B2           ;1/4 seconds    |
Bank04_LB0D9:  .byte $2E           ;B3     | Repeat 2 times
Bank04_LB0DA:  .byte $B3           ;1/2 seconds    |
Bank04_LB0DB:  .byte $18           ;C3     |
Bank04_LB0DC:  .byte $B2           ;1/4 seconds    |
Bank04_LB0DD:  .byte $26           ;G3     |
Bank04_LB0DE:  .byte $B3           ;1/2 seconds    |
Bank04_LB0DF:  .byte $2A           ;A3     |
Bank04_LB0E0:  .byte $B2           ;1/4 seconds    |
Bank04_LB0E1:  .byte $2E           ;B3     +
Bank04_LB0E2:  .byte $FF           ;
Bank04_LB0E3:  .byte $C8           ;
Bank04_LB0E4:  .byte $B4           ;1 second   + Repeat 8 times
Bank04_LB0E5:  .byte $08           ;E2     +
Bank04_LB0E6:  .byte $FF           ;

.scend

Bank04_Room_20_Attrs:
    .byte $E4, $44
    .byte $EC, $44
    .byte $DC, $45
    .byte $F7, $56
    .byte $F6, $59
    .byte $00

Bank04_Room_23_Attrs:
    .byte $04, $0A, $FA, $FB, $FC, $FD
    .byte $04, $A0, $F2, $F3, $F4, $F5
    .byte $D2, $01
    .byte $CA, $10
    .byte $CE, $44
    .byte $D7, $80
    .byte $DF, $88
    .byte $00

Bank04_Room_24_Attrs:
    .byte $D1, $01
    .byte $CE, $04
    .byte $C9, $10
    .byte $D0, $20
    .byte $D8, $22
    .byte $C6, $40
    .byte $00

;------------------------------------------[ Sound Engine ]------------------------------------------

.advance SoundEngineOrg

.scope
    .include "Sound_Engine_Common_1.asm"

    ;The init music table loads addresses $062B thru $0637 with the initial data needed to play the
    ;selected music.  The data for each entry in the table have the following format:
    ;.byte $xx, $xx, $xx, $xx, $xx : .word $xxxx, $xxxx, $xxxx, $xxxx.
    ;The first five bytes have the following functions:
    ;Byte 0=index to proper note length table.  Will be either #$00, #$0B or #$17.
    ;Byte 1=Repeat music byte. #$00=no repeat, any other value and the music repeats.
    ;Byte 2=Controls length counter for triangle channel.
    ;Byte 3=Volume control byte for SQ1.
    ;Byte 4=Volume control byte for SQ2.
    ;Address 0=Base address of SQ1 music data.
    ;Address 1=Base address of SQ2 music data.
    ;Address 2=Base address of triangle music data.
    ;Address 3=Base address of noise music data.

    _InitMusicTbl:

    ;Mother brain music(not used this memory page).
    _LBD31:  .byte $0B, $FF, $F5, $00, $00
    _LBD36:  .word $0100, $0300, $0500, $0000

    ;Escape music(not used this memory page).
    _LBD3E:  .byte $0B, $FF, $00, $02, $02
    _LBD43:  .word $0100, $0300, $0500, $0700

    ;Norfair music(not used this memory page).
    _LBD4B:  .byte $0B, $FF, $F0, $04, $04
    _LBD50:  .word $0100, $0300, $0500, $0700

    ;Kraid area music.
    _LBD58:  .byte $00, $FF, $F0, $00, $00
    _LBD5D:  .word KraidSQ1IndexData_B4, KraidSQ2IndexData_B4, KraidTriangleIndexData_B4, $0000

    ;Item room music.
    _LBD65:  .byte $0B, $FF, $03, $00, $00
    _LBD6A:  .word _ItmRmSQ1Data, _ItmRmSQ2Data, _ItmRmTriData, $0000

    ;Ridley area music.
    _LBD72:  .byte $0B, $FF, $F0, $01, $01
    _LBD77:  .word RidleySQ1IndexData_B4, RidleySQ2IndexData_B4, RidleyTriangleIndexData_B4, $0000

    ;End game music(not used this memory page).
    _LBD7F:  .byte $17, $00, $00, $02, $01
    _LBD84:  .word $0100, $0300, $0500, $0700

    ;Intro music(not used this memory page).
    _LBD8C:  .byte $17, $00, $F0, $02, $05
    _LBD91:  .word $0100, $0300, $0500, $0700

    ;Fade in music
    _LBD99:  .byte $0B, $00, $F0, $02, $00
    _LBD9E:  .word _FadeInSQ1Data, _FadeInSQ2Data, _FadeInTriData, $0000

    ;Power up music
    _LBDA6:  .byte $00, $00, $F0, $01, $00
    _LBDAB:  .word _PwrUpSQ1Data, _PwrUpSQ2Data, _PwrUpTriData, $0000

    ;Brinstar music(not used this memory page).
    _LBDB3:  .byte $0B, $FF, $00, $02, $03
    _LBDB8:  .word $0100, $0300, $0500, $0700

    ;Tourian music
    _LBDC0:  .byte $0B, $FF, $03, $00, $00
    _LBDC5:  .word _TourianSQ1Data, _TourianSQ2Data, _TourianTriData, $0000

    .include "Sound_Engine_Common_2.asm"
.scend

;--------------------------------- Struct Pointer Table ----------------------------------------------

.advance StructPointerTable_Hi
    .byte >Common_Struct_00    ; Struct $00
    .byte >Bank04_LAA7E    ; Struct $01
    .byte >Bank04_LAA97    ; Struct $02
    .byte >Bank04_LAAB0    ; Struct $03
    .byte >Bank04_LAAB7    ; Struct $04
    .byte >Bank04_LAABE    ; Struct $05
    .byte >Bank04_LAAC2    ; Struct $06
    .byte >Bank04_LAAD2    ; Struct $07
    .byte >Bank04_LAAE2    ; Struct $08
    .byte >Bank04_LAAE7    ; Struct $09
    .byte >Bank04_LAAEC    ; Struct $0A
    .byte >Bank04_LAAEF    ; Struct $0B
    .byte >Bank04_LAAF2    ; Struct $0C
    .byte >Bank04_LAAFD    ; Struct $0D
    .byte >Bank04_LAB03    ; Struct $0E
    .byte >Bank04_LAB08    ; Struct $0F
    .byte >Bank04_LAB11    ; Struct $10
    .byte >Bank04_LAB26    ; Struct $11
    .byte >Bank04_LAB29    ; Struct $12
    .byte >Bank04_LAB3C    ; Struct $13
    .byte >Bank04_LAB51    ; Struct $14
    .byte >Bank04_LAB55    ; Struct $15
    .byte >Bank04_LAB68    ; Struct $16
    .byte >Bank04_LAB75    ; Struct $17
    .byte >Bank04_LAB88    ; Struct $18
    .byte >Bank04_LAB9B    ; Struct $19
    .byte >Bank04_LABB0    ; Struct $1A
    .byte >Bank04_LABBA    ; Struct $1B
    .byte >Bank04_LABBD    ; Struct $1C
    .byte >Bank04_LABC4    ; Struct $1D
    .byte >Bank04_LABE0    ; Struct $1E
    .byte >Bank04_LABE9    ; Struct $1F
    .byte >Bank04_LABFE    ; Struct $20
    .byte >Bank04_LAC01    ; Struct $21
    .byte >Bank04_LAC0A    ; Struct $22
    .byte >Bank04_LAC0F    ; Struct $23
    .byte >Bank04_LAC14    ; Struct $24
    .byte >Bank04_LAC1E    ; Struct $25
    .byte >Bank04_LAC27    ; Struct $26
    .byte >Bank04_Struct_27    ; Struct $27
    .byte >Bank04_Struct_28    ; Struct $28
    .byte >Bank04_Struct_29    ; Struct $29
    .byte >Bank04_Struct_2A    ; Struct $2A
    .byte >Bank04_Struct_2B    ; Struct $2B
    .byte >Bank04_Struct_2C    ; Struct $2C
    .byte >Bank04_Struct_2D    ; Struct $2D
    .byte >Bank04_Struct_2E    ; Struct $2E
    .byte >Bank04_Struct_2F    ; Struct $2F
    .byte >Bank04_Struct_30    ; Struct $30
    .byte >Bank04_Struct_31    ; Struct $31
    .byte >Bank04_Struct_32    ; Struct $32
    .byte >Bank04_Struct_33    ; Struct $33
    .byte >Bank04_Struct_34    ; Struct $34
    .byte >Bank04_Struct_35    ; Struct $35
    .byte >Bank04_Struct_36    ; Struct $36
    .byte >Bank04_Struct_37    ; Struct $37
    .byte >Bank04_Struct_38    ; Struct $38
    .byte >Bank04_Struct_39    ; Struct $39
    .byte >Bank04_Struct_3A    ; Struct $3A
    .byte >Bank04_Struct_3B    ; Struct $3B
    .byte >Bank04_Struct_3C    ; Struct $3C
    .byte >Bank04_Struct_3D    ; Struct $3D
    .byte >Bank04_Struct_3E    ; Struct $3E
    .byte >Bank04_Struct_3F    ; Struct $3F
    .byte >Bank04_Struct_40    ; Struct $40
    .byte >Bank04_Struct_41    ; Struct $41
    .byte >Bank04_Struct_42    ; Struct $42
    .byte >Bank04_Struct_43    ; Struct $43
    .byte >Bank04_Struct_44    ; Struct $44
    .byte >Bank04_Struct_45    ; Struct $45
    .byte >Bank04_Struct_46    ; Struct $46
    .byte >Bank04_Struct_47    ; Struct $47
    .byte >Bank04_Struct_48    ; Struct $48
    .byte >Bank04_Struct_49    ; Struct $49
    .byte >Bank04_Struct_4A    ; Struct $4A
    .byte >Bank04_Struct_4B    ; Struct $4B
    .byte >Bank04_Struct_4C    ; Struct $4C
    .byte >Bank04_Struct_4D    ; Struct $4D
    .byte >Bank04_Struct_4E    ; Struct $4E
    .byte >Bank04_Struct_4F    ; Struct $4F
    .byte >Bank04_Struct_50    ; Struct $50
    .byte >Bank04_Struct_51    ; Struct $51
    .byte >Bank04_Struct_52    ; Struct $52
    .byte >Bank04_Struct_53    ; Struct $53
    .byte >Bank04_Struct_54    ; Struct $54
    .byte >Bank04_Struct_55    ; Struct $55
    .byte >Bank04_Struct_56    ; Struct $56
    .byte >Bank04_Struct_57    ; Struct $57
    .byte >Bank04_Struct_58    ; Struct $58
    .byte >Bank04_Struct_59    ; Struct $59
    .byte >Bank04_Struct_5A    ; Struct $5A
    .byte >Bank04_Struct_5B    ; Struct $5B

.advance StructPointerTable_Lo
    .byte <Common_Struct_00    ; Struct $00
    .byte <Bank04_LAA7E    ; Struct $01
    .byte <Bank04_LAA97    ; Struct $02
    .byte <Bank04_LAAB0    ; Struct $03
    .byte <Bank04_LAAB7    ; Struct $04
    .byte <Bank04_LAABE    ; Struct $05
    .byte <Bank04_LAAC2    ; Struct $06
    .byte <Bank04_LAAD2    ; Struct $07
    .byte <Bank04_LAAE2    ; Struct $08
    .byte <Bank04_LAAE7    ; Struct $09
    .byte <Bank04_LAAEC    ; Struct $0A
    .byte <Bank04_LAAEF    ; Struct $0B
    .byte <Bank04_LAAF2    ; Struct $0C
    .byte <Bank04_LAAFD    ; Struct $0D
    .byte <Bank04_LAB03    ; Struct $0E
    .byte <Bank04_LAB08    ; Struct $0F
    .byte <Bank04_LAB11    ; Struct $10
    .byte <Bank04_LAB26    ; Struct $11
    .byte <Bank04_LAB29    ; Struct $12
    .byte <Bank04_LAB3C    ; Struct $13
    .byte <Bank04_LAB51    ; Struct $14
    .byte <Bank04_LAB55    ; Struct $15
    .byte <Bank04_LAB68    ; Struct $16
    .byte <Bank04_LAB75    ; Struct $17
    .byte <Bank04_LAB88    ; Struct $18
    .byte <Bank04_LAB9B    ; Struct $19
    .byte <Bank04_LABB0    ; Struct $1A
    .byte <Bank04_LABBA    ; Struct $1B
    .byte <Bank04_LABBD    ; Struct $1C
    .byte <Bank04_LABC4    ; Struct $1D
    .byte <Bank04_LABE0    ; Struct $1E
    .byte <Bank04_LABE9    ; Struct $1F
    .byte <Bank04_LABFE    ; Struct $20
    .byte <Bank04_LAC01    ; Struct $21
    .byte <Bank04_LAC0A    ; Struct $22
    .byte <Bank04_LAC0F    ; Struct $23
    .byte <Bank04_LAC14    ; Struct $24
    .byte <Bank04_LAC1E    ; Struct $25
    .byte <Bank04_LAC27    ; Struct $26
    .byte <Bank04_Struct_27    ; Struct $27
    .byte <Bank04_Struct_28    ; Struct $28
    .byte <Bank04_Struct_29    ; Struct $29
    .byte <Bank04_Struct_2A    ; Struct $2A
    .byte <Bank04_Struct_2B    ; Struct $2B
    .byte <Bank04_Struct_2C    ; Struct $2C
    .byte <Bank04_Struct_2D    ; Struct $2D
    .byte <Bank04_Struct_2E    ; Struct $2E
    .byte <Bank04_Struct_2F    ; Struct $2F
    .byte <Bank04_Struct_30    ; Struct $30
    .byte <Bank04_Struct_31    ; Struct $31
    .byte <Bank04_Struct_32    ; Struct $32
    .byte <Bank04_Struct_33    ; Struct $33
    .byte <Bank04_Struct_34    ; Struct $34
    .byte <Bank04_Struct_35    ; Struct $35
    .byte <Bank04_Struct_36    ; Struct $36
    .byte <Bank04_Struct_37    ; Struct $37
    .byte <Bank04_Struct_38    ; Struct $38
    .byte <Bank04_Struct_39    ; Struct $39
    .byte <Bank04_Struct_3A    ; Struct $3A
    .byte <Bank04_Struct_3B    ; Struct $3B
    .byte <Bank04_Struct_3C    ; Struct $3C
    .byte <Bank04_Struct_3D    ; Struct $3D
    .byte <Bank04_Struct_3E    ; Struct $3E
    .byte <Bank04_Struct_3F    ; Struct $3F
    .byte <Bank04_Struct_40    ; Struct $40
    .byte <Bank04_Struct_41    ; Struct $41
    .byte <Bank04_Struct_42    ; Struct $42
    .byte <Bank04_Struct_43    ; Struct $43
    .byte <Bank04_Struct_44    ; Struct $44
    .byte <Bank04_Struct_45    ; Struct $45
    .byte <Bank04_Struct_46    ; Struct $46
    .byte <Bank04_Struct_47    ; Struct $47
    .byte <Bank04_Struct_48    ; Struct $48
    .byte <Bank04_Struct_49    ; Struct $49
    .byte <Bank04_Struct_4A    ; Struct $4A
    .byte <Bank04_Struct_4B    ; Struct $4B
    .byte <Bank04_Struct_4C    ; Struct $4C
    .byte <Bank04_Struct_4D    ; Struct $4D
    .byte <Bank04_Struct_4E    ; Struct $4E
    .byte <Bank04_Struct_4F    ; Struct $4F
    .byte <Bank04_Struct_50    ; Struct $50
    .byte <Bank04_Struct_51    ; Struct $51
    .byte <Bank04_Struct_52    ; Struct $52
    .byte <Bank04_Struct_53    ; Struct $53
    .byte <Bank04_Struct_54    ; Struct $54
    .byte <Bank04_Struct_55    ; Struct $55
    .byte <Bank04_Struct_56    ; Struct $56
    .byte <Bank04_Struct_57    ; Struct $57
    .byte <Bank04_Struct_58    ; Struct $58
    .byte <Bank04_Struct_59    ; Struct $59
    .byte <Bank04_Struct_5A    ; Struct $5A
    .byte <Bank04_Struct_5B    ; Struct $5B

;----------------------------------------------------------------------------------------------------

; CODE CAVE (82 x 16 bytes)

RESET_Bank04:
Bank04_LBFB0:  SEI                     ;Disables interrupt.
Bank04_LBFB1:  CLD                     ;Sets processor to binary mode.
Bank04_LBFB2:  LDX #$00                ;
Bank04_LBFB4:  STX PPUControl0         ;Clear PPU control registers.
Bank04_LBFB7:  STX PPUControl1         ;
Bank04_LBFBA:* LDA PPUStatus           ;
Bank04_LBFBD:  BPL -                   ;Wait for VBlank.
Bank04_LBFBF:* LDA PPUStatus           ;
Bank04_LBFC2:  BPL -                   ;
Bank04_LBFC4:  ORA #$FF                ;
Bank04_LBFC6:  STA MMC1Reg0            ;Reset MMC1 chip.
Bank04_LBFC9:  STA MMC1Reg1            ;(MSB is set).
Bank04_LBFCC:  STA MMC1Reg2            ;
Bank04_LBFCF:  STA MMC1Reg3            ;
Bank04_LBFD2:  JMP Startup             ;($C01A)Does preliminry housekeeping.

;----------------------------------------------------------------------------------------------------

.advance InterruptVectors

;Interrupt vectors.
.word NMI               ;($C0D9)NMI vector.
.word RESET_Bank04      ;($FFB0)Reset vector.
.word RESET_Bank04      ;($FFB0)IRQ vector.