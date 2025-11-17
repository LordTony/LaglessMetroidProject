;Kraid hideout bank.

.include "Game_Start_Common.asm"

.checkpc $8D60
.advance $8D60

;------------------------------------------[ Graphics data ]-----------------------------------------

;Samus end tile patterns.
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

;Unused tile patterns.
Bank04_L9280:  .byte $F2, $64, $0F, $DA, $8D, $5B, $10, $10, $FB, $70, $01, $C0, $8D, $58, $10, $10
Bank04_L9290:  .byte $90, $40, $20, $80, $B0, $70, $5C, $60, $EF, $3E, $18, $80, $00, $10, $5C, $60
Bank04_L92A0:  .byte $B8, $38, $30, $80, $80, $60, $20, $18, $A0, $A4, $66, $C6, $3E, $0C, $20, $18
Bank04_L92B0:  .byte $30, $27, $2D, $38, $2A, $5E, $70, $40, $10, $00, $01, $00, $12, $20, $00, $00
Bank04_L92C0:  .byte $0A, $40, $40, $51, $78, $C4, $C2, $90, $31, $3D, $3B, $2C, $06, $3B, $3D, $6F
Bank04_L92D0:  .byte $00, $08, $10, $80, $42, $00, $2E, $5A, $F9, $B1, $40, $60, $3E, $0E, $82, $92
Bank04_L92E0:  .byte $00, $00, $00, $00, $00, $0C, $0E, $0C, $00, $00, $00, $0C, $1E, $13, $15, $16
Bank04_L92F0:  .byte $00, $01, $01, $00, $00, $08, $04, $12, $00, $00, $00, $06, $0F, $07, $03, $09
Bank04_L9300:  .byte $5D, $23, $54, $2B, $24, $1E, $0F, $04, $5D, $23, $55, $2B, $20, $1C, $0F, $04
Bank04_L9310:  .byte $01, $A7, $06, $0B, $4A, $D6, $2C, $F0, $59, $F1, $52, $FB, $6A, $D6, $2C, $F0
Bank04_L9320:  .byte $EC, $F5, $7C, $99, $42, $60, $38, $0F, $CE, $D5, $70, $9D, $47, $68, $38, $0F
Bank04_L9330:  .byte $AF, $73, $36, $26, $0C, $1C, $78, $C0, $AF, $73, $76, $A6, $4C, $1C, $78, $C0
Bank04_L9340:  .byte $69, $2C, $0E, $77, $D4, $B4, $E2, $00, $03, $01, $00, $70, $F0, $F0, $E0, $00
Bank04_L9350:  .byte $69, $2C, $0E, $37, $14, $04, $02, $00, $03, $01, $00, $30, $10, $00, $00, $00

;Misc. tile patterns.
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
Bank04_L94E0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L94F0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L9500:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L9510:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L9520:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank04_L9530:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank04_L9540:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L9550:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

;----------------------------------------------------------------------------------------------------

.checkpc PalPntrTbl
.advance PalPntrTbl

.scope
Bank04_L9560:  .word _Palette00         ;($A155)
Bank04_L9562:  .word _Palette01         ;($A179)
Bank04_L9564:  .word _Palette02         ;($A185)
Bank04_L9566:  .word _Palette03         ;($A17F)
Bank04_L9668:  .word _Palette04         ;($A18B)
Bank04_L966A:  .word _Palette05         ;($A191)
Bank04_L956C:  .word _Palette05         ;($A191)
Bank04_L956E:  .word _Palette05         ;($A191)
Bank04_L9570:  .word _Palette05         ;($A191)
Bank04_L9572:  .word _Palette05         ;($A191)
Bank04_L9574:  .word _Palette05         ;($A191)
Bank04_L9576:  .word _Palette05         ;($A191)
Bank04_L9578:  .word _Palette05         ;($A191)
Bank04_L957A:  .word _Palette05         ;($A191)
Bank04_L957C:  .word _Palette05         ;($A191)
Bank04_L957E:  .word _Palette05         ;($A191)
Bank04_L9580:  .word _Palette05         ;($A191)
Bank04_L9582:  .word _Palette05         ;($A191)
Bank04_L9584:  .word _Palette05         ;($A191)
Bank04_L9586:  .word _Palette05         ;($A191)
Bank04_L9588:  .word _Palette06         ;($A198)
Bank04_L958A:  .word _Palette07         ;($A19F)
Bank04_L958C:  .word _Palette08         ;($A1A6)
Bank04_L958E:  .word _Palette09         ;($A1AD)
Bank04_L9590:  .word _Palette0A         ;($A1B5)
Bank04_L9592:  .word _Palette0B         ;($A1BD)
Bank04_L9594:  .word _Palette0C         ;($A1C5)
Bank04_L9596:  .word _Palette0D         ;($A1CD)

.checkpc SpecItmsTblPtr
.advance SpecItmsTblPtr

Bank04_L9598:  .word _SpecItmsTbl       ;($A26D)Beginning of special items table.
Bank04_L959A:  .word _RmPtrTbl          ;($A1D5)Beginning of room pointer table.
Bank04_L959C:  .word _StrctPtrTbl       ;($A21F)Beginning of structure pointer table.
Bank04_L959E:  .word _MacroDefs         ;($AC32)Beginning of macro definitions.
Bank04_L95A0:  .word _EnemyFramePtrTbl1     ;($9CF7)Address table into enemy animation data. Two-->
Bank04_L95A2:  .word _EnemyFramePtrTbl2     ;($9DF7)tables needed to accommodate all entries.
Bank04_L95A4:  .word _EnemyPlacePtrTbl      ;($9E25)Pointers to enemy frame placement data.
Bank04_L95A6:  .word _EnemyAnimIndexTbl     ;($9C86)Index to values in addr tables for enemy animations.

Bank04_L95A8:  .byte $60, $EA, $EA, $60, $EA, $EA, $60, $EA, $EA, $60, $EA, $EA, $60, $EA, $EA, $60
Bank04_L95B8:  .byte $EA, $EA, $60, $EA, $EA, $60, $EA, $EA, $60, $EA, $EA

.checkpc AreaRoutine
.advance AreaRoutine

Bank04_L95C3:  JMP $9C49           ;Area specific routine.

TwosCompliment_:
Bank04_L95C6:  EOR #$FF            ;
Bank04_L95C8:  CLC             ;The following routine returns the twos-->
Bank04_L95C9:  ADC #$01            ;compliment of the value stored in A.
Bank04_L95CB:  RTS             ;

Bank04_L95CC:  .byte $1D           ;Kraid's room.

Bank04_L95CD:  .byte $10           ;Kraid's hideout music init flag.

Bank04_L95CE:  .byte $00           ;Base damage caused by area enemies to lower health byte.
Bank04_L95CF:  .byte $02           ;Base damage caused by area enemies to upper health byte.

;Special room numbers(used to start item room music).
Bank04_L95D0:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF

Bank04_L95D7:  .byte $07           ;Samus start x coord on world map.
Bank04_L95D8:  .byte $14           ;Samus start y coord on world map.
Bank04_L95D9:  .byte $6E           ;Samus start verticle screen position.

Bank04_L95DA:  .byte $06, $00, $03, $43, $00, $00, $00, $00, $00, $00

.checkpc MemuByte
.advance MemuByte
    .byte $64

Bank04_L95E5:  LDA $6B02,X
Bank04_L95E8:  JSR $8024

Bank04_L95EB:  .word $991C
Bank04_L95ED:  .word $9937
Bank04_L95EF:  .word $95CB
Bank04_L95F1:  .word $993C
Bank04_L95F3:  .word $9949
Bank04_L95F5:  .word $999B
Bank04_L95F7:  .word $95CB
Bank04_L95F9:  .word $9A44
Bank04_L95FB:  .word $9AB4
Bank04_L95FD:  .word $9AE4
Bank04_L95FF:  .word $9B2C
Bank04_L9601:  .word $95CB
Bank04_L9603:  .word $95CB
Bank04_L9605:  .word $95CB
Bank04_L9607:  .word $95CB
Bank04_L9609:  .word $95CB

Bank04_L960B:  .byte $27, $27, $29, $29, $2D, $2B, $31, $2F, $33, $33, $41, $41, $48, $48, $50, $4E

Bank04_L961B:  .byte $6D, $6F, $00, $00, $00, $00, $64, $64, $64, $64, $00, $00, $00, $00, $00, $00

Bank04_L962B:  .byte $08, $08, $00, $FF, $02, $02, $00, $01, $60, $FF, $FF, $00, $00, $00, $00, $00

Bank04_L963B:  .byte $05, $05, $0B, $0B, $17, $13, $1B, $19, $23, $23, $35, $35, $48, $48, $54, $52

Bank04_L964B:  .byte $67, $6A, $56, $58, $5D, $62, $64, $64, $64, $64, $00, $00, $00, $00, $00, $00

Bank04_L965B:  .byte $05, $05, $0B, $0B, $17, $13, $1B, $19, $23, $23, $35, $35, $48, $48, $4B, $48

Bank04_L966B:  .byte $67, $6A, $56, $58, $5A, $5F, $64, $64, $64, $64, $00, $00, $00, $00, $00, $00

Bank04_L967B:  .byte $00, $00, $00, $80, $00, $00, $00, $00, $00, $00, $00, $00, $80, $00, $00, $00

Bank04_L968B:  .byte $89, $89, $09, $00, $86, $04, $89, $80, $83, $00, $00, $00, $82, $00, $00, $00

Bank04_L969B:  .byte $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $40, $00, $00, $00

Bank04_L96AB:  .byte $00, $00, $06, $00, $83, $00, $84, $00, $00, $00, $00, $00, $00, $00, $00, $00

Bank04_L96BB:  .byte $08, $08, $01, $01, $01, $01, $10, $08, $10, $00, $00, $01, $01, $00, $00, $00

Bank04_L96CB:  .byte $00, $03, $00, $06, $08, $0C, $00, $0A, $0E, $11, $13, $00, $00, $00, $00, $00


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

Bank04_L977B:  .byte $64, $6C, $21, $01, $04, $00, $4C, $40, $04, $00, $00, $40, $40, $00, $00, $00

Bank04_L978B:  .byte $00, $00, $5F, $62, $64, $64, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_L979B:  .byte $0C, $F4, $00, $00, $00, $00, $00, $00, $F4, $00, $00, $00

Bank04_L97A7:  .word $98C9, $98D8, $98E7, $98F6, $9C4A, $9C4F, $9C54, $9C59
Bank04_L97B7:  .word $9C5E, $9C63, $9C68, $9C6D, $9C72, $9C77, $9C7C, $9C81
Bank04_L97C7:  .word $9C86, $9C86, $9C86, $9C86, $9C86

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
Bank04_L9909:  BEQ $9914
Bank04_L990B:  CMP #$03
Bank04_L990D:  BEQ $9919
Bank04_L990F:  LDA $00
Bank04_L9911:  JMP $8000
Bank04_L9914:  LDA $01
Bank04_L9916:  JMP $8003
Bank04_L9919:  JMP $8006
Bank04_L991C:  LDA #$09
Bank04_L991E:  STA $85
Bank04_L9920:  STA $86
Bank04_L9922:  LDA $6AF4,X
Bank04_L9925:  CMP #$03
Bank04_L9927:  BEQ $992C
Bank04_L9929:  JSR $801B
Bank04_L992C:  LDA #$06
Bank04_L992E:  STA $00
Bank04_L9930:  LDA #$08
Bank04_L9932:  STA $01
Bank04_L9934:  JMP $9905
Bank04_L9937:  LDA #$0F
Bank04_L9939:  JMP $991E
Bank04_L993C:  LDA $6AF4,X
Bank04_L993F:  CMP #$03
Bank04_L9941:  BEQ $9946
Bank04_L9943:  JSR $801E
Bank04_L9946:  JMP $992C
Bank04_L9949:  LDA $81
Bank04_L994B:  CMP #$01
Bank04_L994D:  BEQ $9993
Bank04_L994F:  CMP #$03
Bank04_L9951:  BEQ $9998
Bank04_L9953:  LDA $0406,X
Bank04_L9956:  CMP #$0F
Bank04_L9958:  BCC $998E
Bank04_L995A:  CMP #$11
Bank04_L995C:  BCS $9965
Bank04_L995E:  LDA #$3A
Bank04_L9960:  STA $6B01,X
Bank04_L9963:  BNE $998E
Bank04_L9965:  DEC $6B01,X
Bank04_L9968:  BNE $998E
Bank04_L996A:  LDA #$00
Bank04_L996C:  STA $6AF4,X
Bank04_L996F:  LDY #$0C
Bank04_L9971:  LDA #$0A
Bank04_L9973:  STA $00A0,Y
Bank04_L9976:  LDA $0400,X
Bank04_L9979:  STA $00A1,Y
Bank04_L997C:  LDA $0401,X
Bank04_L997F:  STA $00A2,Y
Bank04_L9982:  LDA $6AFB,X
Bank04_L9985:  STA $00A3,Y
Bank04_L9988:  DEY
Bank04_L9989:  DEY
Bank04_L998A:  DEY
Bank04_L998B:  DEY
Bank04_L998C:  BPL $9971
Bank04_L998E:  LDA #$02
Bank04_L9990:  JMP $8000
Bank04_L9993:  LDA #$08
Bank04_L9995:  JMP $8003
Bank04_L9998:  JMP $8006
Bank04_L999B:  JSR $8009
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
Bank04_L99D8:  JSR $800C
Bank04_L99DB:  JMP $8006
Bank04_L99DE:  LDA $0405,X
Bank04_L99E1:  LSR 
Bank04_L99E2:  LDA $040A,X
Bank04_L99E5:  AND #$03
Bank04_L99E7:  ROL 
Bank04_L99E8:  TAY 
Bank04_L99E9:  LDA $99EF,Y
Bank04_L99EC:  JMP $800F

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
Bank04_L9A39:  ASL 
Bank04_L9A3A:  TAY 
Bank04_L9A3B:  LDA $8049,Y
Bank04_L9A3E:  PHA 
Bank04_L9A3F:  LDA $8048,Y
Bank04_L9A42:  PHA 
Bank04_L9A43:  RTS

Bank04_L9A44:  LDA $6AF4,X
Bank04_L9A47:  CMP #$02
Bank04_L9A49:  BNE $9A83
Bank04_L9A4B:  LDA $0403,X
Bank04_L9A4E:  BNE $9A83
Bank04_L9A50:  LDA $6AFE,X
Bank04_L9A53:  BNE $9A67
Bank04_L9A55:  LDA $030D
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
Bank04_L9A90:  JSR $8036
Bank04_L9A93:  PHA 
Bank04_L9A94:  JSR $8039
Bank04_L9A97:  STA $05
Bank04_L9A99:  PLA 
Bank04_L9A9A:  STA $04
Bank04_L9A9C:  JSR $9BBC
Bank04_L9A9F:  JSR $8027
Bank04_L9AA2:  BCC $9AAC
Bank04_L9AA4:  JSR $9BAA
Bank04_L9AA7:  LDA #$03
Bank04_L9AA9:  JMP $8003
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
Bank04_L9B06:  JSR $802D
Bank04_L9B09:  LDX $4B
Bank04_L9B0B:  LDA $00
Bank04_L9B0D:  STA $0402,X
Bank04_L9B10:  JSR $8030
Bank04_L9B13:  LDX $4B
Bank04_L9B15:  LDA $00
Bank04_L9B17:  STA $0403,X
Bank04_L9B1A:  JSR $8033
Bank04_L9B1D:  BCS $9B24
Bank04_L9B1F:  LDA #$03
Bank04_L9B21:  STA $6AF4,X
Bank04_L9B24:  LDA #$01
Bank04_L9B26:  JSR $800C
Bank04_L9B29:  JMP $8006
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
Bank04_L9B41:  LDA $6B02,X
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
Bank04_L9B6F:  JSR $802A
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
Bank04_L9B88:  STA $6B02,X
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
Bank04_L9B9D:  JSR $8027
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
Bank04_L9BB8:  STA $6AFB,X
Bank04_L9BBB:  RTS

Bank04_L9BBC:  LDA $0400,X
Bank04_L9BBF:  STA $08
Bank04_L9BC1:  LDA $0401,X
Bank04_L9BC4:  STA $09
Bank04_L9BC6:  LDA $6AFB,X
Bank04_L9BC9:  STA $0B
Bank04_L9BCB:  RTS

Bank04_L9BCC:  .byte $F5, $FD, $05, $F6, $FE, $0A, $F6, $0C, $F4, $0E, $F2, $F8, $08, $F4, $0C, $09
Bank04_L9BDC:  .byte $09, $09, $0A, $0A

Bank04_L9BE0:  LDY $7E
Bank04_L9BE2:  BNE $9BE6
Bank04_L9BE4:  LDY #$80
Bank04_L9BE6:  LDA $2D
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

Bank04_L9C49:  .byte $60

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

;-----------------------------------[ Enemy animation data tables ]----------------------------------

_EnemyAnimIndexTbl:
Bank04_L9C86:  .byte $00, $01, $FF

Bank04_L9C89:  .byte $02, $FF

Bank04_L9C8B:  .byte $19, $1A, $FF

Bank04_L9C8E:  .byte $1A, $1B, $FF

Bank04_L9C91:  .byte $1C, $1D, $FF

Bank04_L9C94:  .byte $1D, $1E, $FF

Bank04_L9C97:  .byte $22, $23, $24, $FF

Bank04_L9C9B:  .byte $1F, $20, $21, $FF

Bank04_L9C9F:  .byte $22, $FF

Bank04_L9CA1:  .byte $1F, $FF

Bank04_L9CA3:  .byte $23, $04, $FF

Bank04_L9CA6:  .byte $20, $03, $FF

Bank04_L9CA9:  .byte $27, $28, $29, $FF

Bank04_L9CAD:  .byte $37, $FF

Bank04_L9CAF:  .byte $38, $FF

Bank04_L9CB1:  .byte $39, $FF

Bank04_L9CB3:  .byte $3A, $FF

Bank04_L9CB5:  .byte $3B, $FF

Bank04_L9CB7:  .byte $3C, $FF

Bank04_L9CB9:  .byte $3D, $FF

Bank04_L9CBB:  .byte $58, $59, $FF

Bank04_L9CBE:  .byte $5A, $5B, $FF

Bank04_L9CC1:  .byte $5C, $5D, $FF

Bank04_L9CC4:  .byte $5E, $5F, $FF

Bank04_L9CC7:  .byte $60, $FF

Bank04_L9CC9:  .byte $61, $F7, $62, $F7, $FF

Bank04_L9CCE:  .byte $66, $67, $FF

Bank04_L9CD1:  .byte $69, $6A, $FF

Bank04_L9CD4:  .byte $68, $FF

Bank04_L9CD6:  .byte $6B, $FF

Bank04_L9CD8:  .byte $66, $FF

Bank04_L9CDA:  .byte $69, $FF

Bank04_L9CDC:  .byte $6C, $FF

Bank04_L9CDE:  .byte $6D, $FF

Bank04_L9CE0:  .byte $6F, $70, $71, $6E, $FF

Bank04_L9CE5:  .byte $73, $74, $75, $72, $FF

Bank04_L9CEA:  .byte $8F, $90, $FF

Bank04_L9CED:  .byte $91, $92, $FF

Bank04_L9CF0:  .byte $93, $94, $FF

Bank04_L9CF3:  .byte $95, $FF

Bank04_L9CF5:  .byte $96, $FF

;----------------------------[ Enemy sprite drawing pointer tables ]---------------------------------

_EnemyFramePtrTbl1:
Bank04_L9CF7:  .word $9ED9, $9EDE, $9EE3, $9EE8, $9EE8, $9EE8, $9EE8, $9EE8
Bank04_L9D07:  .word $9EE8, $9EE8, $9EE8, $9EE8, $9EE8, $9EE8, $9EE8, $9EE8
Bank04_L9D17:  .word $9EE8, $9EE8, $9EE8, $9EE8, $9EE8, $9EE8, $9EE8, $9EE8 
Bank04_L9D27:  .word $9EE8, $9EE8, $9EF6, $9F04, $9F10, $9F1E, $9F2C, $9F38 
Bank04_L9D37:  .word $9F41, $9F4B, $9F55, $9F5E, $9F68, $9F72, $9F72, $9F72
Bank04_L9D47:  .word $9F80, $9F87, $9F90, $9F90, $9F90, $9F90, $9F90, $9F90
Bank04_L9D57:  .word $9F90, $9F90, $9F90, $9F90, $9F90, $9F90, $9F90, $9F90
Bank04_L9D67:  .word $9FA4, $9FB8, $9FC3, $9FCE, $9FD7, $9FE0, $9FEB, $9FEB
Bank04_L9D77:  .word $9FEB, $9FEB, $9FEB, $9FEB, $9FEB, $9FEB, $9FEB, $9FEB
Bank04_L9D87:  .word $9FEB, $9FEB, $9FEB, $9FEB, $9FEB, $9FEB, $9FEB, $9FEB
Bank04_L9D97:  .word $9FEB, $9FEB, $9FEB, $9FEB, $9FEB, $9FEB, $9FEB, $9FEB
Bank04_L9DA7:  .word $9FEB, $9FF3, $9FFB, $A003, $A00B, $A013, $A01B, $A023
Bank04_L9DB7:  .word $A02B, $A033, $A041, $A05B, $A05B, $A05B, $A05B, $A063
Bank04_L9BC7:  .word $A06B, $A073, $A07B, $A083, $A08B, $A093, $A09B, $A0A3
Bank04_L9BD7:  .word $A0AB, $A0B3, $A0BB, $A0C3, $A0CB, $A0D3, $A0DB, $A0DB
Bank04_L9BE7:  .word $A0DB, $A0DB, $A0DB, $A0DB, $A0DB, $A0DB, $A0DB, $A0DB

_EnemyFramePtrTbl2:
Bank04_L9DF7:  .word $A0DB, $A0E3, $A0E8, $A0E8, $A0E8, $A0E8, $A0E8, $A0E8
Bank04_L9E07:  .word $A0E8, $A0E8, $A0ED, $A0ED, $A0ED, $A0ED, $A0ED, $A0ED
Bank04_L9E17:  .word $A0F7, $A101, $A111, $A121, $A131, $A141, $A14B

_EnemyPlacePtrTbl:
Bank04_L9E25:  .word $9E45, $9E47, $9E5F, $9E77, $9E77, $9E77, $9E87, $9E93
Bank04_L9E35:  .word $9E9B, $9EA7, $9EA7, $9EC7, $9ED5, $9ED5, $9ED5, $9ED5

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
La198:  .byte $3F           ;Upper byte of PPU palette adress.
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

;----------------------------[ Room and structure pointer tables ]-----------------------------------

_RmPtrTbl:
Bank04_LA1D5:  .word $A2B7, $A2C5, $A2CD, $A308, $A345, $A388, $A3B8, $A401
Bank04_LA1E5:  .word $A442, $A47E, $A4AD, $A4E2, $A514, $A558, $A590, $A5BF
Bank04_LA1F5:  .word $A5E8, $A647, $A647, $A683, $A6B5, $A6D9, $A713, $A745
Bank04_LA205:  .word $A780, $A7B2, $A7F6, $A83F, $A8A3, $A8C7, $A923, $A94F
Bank04_LA215:  .word $A972, $A990, $A9BE, $A9FE, $AA33

_StrctPtrTbl:
Bank04_LA21F:  .word $AA6B, $AA7E, $AA97, $AAB0, $AAB7, $AABE, $AAC2, $AAD2
Bank04_LA22F:  .word $AAE2, $AAE7, $AAEC, $AAEF, $AAF2, $AAFD, $AB03, $AB08
Bank04_LA23F:  .word $AB11, $AB26, $AB29, $AB3C, $AB51, $AB55, $AB68, $AB75
Bank04_LA24F:  .word $AB88, $AB9B, $ABB0, $ABBA, $ABBD, $ABC4, $ABE0, $ABE9
Bank04_LA25F:  .word $ABFE, $AC01, $AC0A, $AC0F, $AC14, $AC1E, $AC27

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
Bank04_LA26E:  .word $A275
Bank04_LA270:  .byte $07, $FF, $04, $81, $00

;Elevator to Brinstar.
Bank04_LA275:  .byte $14
Bank04_LA276:  .word $A27D
Bank04_LA278:  .byte $07, $FF, $04, $82, $00

;Missiles.
Bank04_LA27D:  .byte $15
Bank04_LA27E:  .word $A28C
Bank04_LA27F:  .byte $04, $06, $02, $09, $47, $00

;Missiles.
Bank04_LA286:  .byte $09, $FF, $02, $09, $47, $00

;Energy tank.
Bank04_LA28C:  .byte $16
Bank04_LA28D:  .word $A295
Bank04_LA28F:  .byte $0A, $FF, $02, $08, $66, $00

;Missiles.
Bank04_LA295:  .byte $19
Bank04_LA296:  .word $A29E
Bank04_LA298:  .byte $0A, $FF, $02, $09, $47, $00

;Missiles.
Bank04_LA29E:  .byte $1B
Bank04_LA29F:  .word $A2A7
Bank04_LA2A1:  .byte $05, $FF, $02, $09, $47, $00

;Memus.
Bank04_LA2A7:  .byte $1C
Bank04_LA2A8:  .word $A2AE
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

;Room #$00
Bank04_LA2B7:  .byte $02           ;Attribute table data.
;Room object data:
Bank04_LA2B8:  .byte $40, $01, $03, $48, $01, $03, $50, $04, $02, $5F, $04, $02, $FF

;Room #$01
Bank04_LA2C5:  .byte $02           ;Attribute table data.
;Room object data:
Bank04_LA2C6:  .byte $07, $02, $02, $87, $02, $02, $FF

;Room #$02
Bank04_LA2CD:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA2CE:  .byte $00, $10, $00, $04, $10, $00, $08, $10, $00, $0C, $10, $00, $40, $06, $00, $42
Bank04_LA2DE:  .byte $08, $01, $4E, $06, $00, $6D, $09, $01, $75, $0C, $00, $7A, $0C, $00, $90, $06
Bank04_LA2EE:  .byte $00, $92, $0C, $00, $96, $0D, $00, $9D, $0C, $00, $9E, $06, $00, $E0, $06, $00
Bank04_LA2FE:  .byte $E1, $0D, $00, $EB, $0D, $00, $EE, $06, $00, $FF

;Room #$03
Bank04_LA308:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA309:  .byte $00, $06, $00, $0A, $0D, $00, $0E, $06, $00, $22, $08, $01, $2D, $09, $01, $45
Bank04_LA319:  .byte $0D, $00, $50, $03, $02, $5F, $03, $02, $80, $10, $00, $8A, $06, $00, $8C, $10
Bank04_LA329:  .byte $00, $A4, $08, $01, $C0, $10, $00, $C9, $0D, $00, $CC, $10, $00, $DB, $09, $01
Bank04_LA339:  .byte $E1, $10, $00, $FD
;Room enemy/door data:
Bank04_LA33D:  .byte $02, $A0, $02, $B1, $31, $85, $37, $FF

;Room #$04
Bank04_LA345:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA346:  .byte $00, $06, $00, $07, $06, $00, $0B, $10, $00, $0E, $06, $00, $22, $08, $01, $2A
Bank04_LA356:  .byte $09, $01, $35, $0D, $00, $50, $03, $02, $57, $06, $00, $5F, $03, $02, $80, $0D
Bank04_LA366:  .byte $00, $8C, $0D, $00, $8E, $06, $00, $90, $06, $00, $92, $08, $01, $BE, $06, $00
Bank04_LA376:  .byte $CD, $09, $01, $D0, $06, $00, $FD
;Room enemy/door data:
Bank04_LA37D:  .byte $02, $A0, $02, $B1, $41, $85, $25, $21, $83, $C8, $FF

;Room #$05
Bank04_LA388:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA389:  .byte $00, $10, $00, $0C, $10, $00, $14, $08, $01, $40, $10, $00, $4C, $10, $00, $6B
Bank04_LA399:  .byte $09, $01, $7C, $10, $00, $80, $10, $00, $94, $08, $01, $BC, $10, $00, $C0, $10
Bank04_LA3A9:  .byte $00, $DB, $09, $01, $FD
;Room enemy/door data:
Bank04_LA3AE:  .byte $51, $83, $57, $01, $03, $95, $11, $03, $CA, $FF

;Room #$06
Bank04_LA3B8:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA3B9:  .byte $00, $06, $00, $0E, $06, $00, $12, $08, $01, $17, $0E, $00, $1A, $0D, $00, $27
Bank04_LA3C9:  .byte $0C, $00, $31, $0E, $00, $36, $11, $00, $39, $07, $00, $50, $03, $02, $59, $0E
Bank04_LA3D9:  .byte $00, $5F, $03, $02, $80, $10, $00, $84, $10, $00, $88, $10, $00, $8C, $10, $00
Bank04_LA3E9:  .byte $C0, $10, $00, $C4, $10, $00, $C8, $10, $00, $CC, $10, $00, $FD
;Room enemy/door data:
Bank04_LA3F6:  .byte $02, $A1, $02, $B1, $01, $85, $2A, $51, $85, $26, $FF

;Room #$07
Bank04_LA401:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA402:  .byte $00, $10, $00, $0A, $10, $00, $0E, $07, $00, $24, $08, $01, $27, $0E, $00, $40
Bank04_LA412:  .byte $07, $00, $5F, $03, $02, $62, $10, $00, $8B, $0E, $00, $8E, $07, $00, $90, $07
Bank04_LA422:  .byte $00, $9D, $09, $01, $B0, $07, $00, $B2, $10, $00, $B6, $0D, $00, $CE, $07, $00
Bank04_LA432:  .byte $D6, $08, $01, $FD
;Room enemy/door data:
Bank04_LA436:  .byte $02, $A1, $01, $85, $17, $21, $85, $A8, $31, $03, $87, $FF

;Room #$08
Bank04_LA442:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA443:  .byte $00, $10, $00, $03, $10, $00, $0A, $10, $00, $0C, $10, $00, $29, $09, $01, $35
Bank04_LA453:  .byte $0E, $00, $40, $10, $00, $44, $08, $01, $4C, $10, $00, $79, $0E, $00, $80, $10
Bank04_LA463:  .byte $00, $8C, $10, $00, $AB, $09, $01, $B0, $10, $00, $B4, $0D, $00, $CC, $10, $00
Bank04_LA473:  .byte $D4, $08, $01, $FD
;Room enemy/door data:
Bank04_LA477:  .byte $11, $85, $6A, $41, $85, $A6, $FF

;Room #$09
Bank04_LA47E:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA47F:  .byte $00, $07, $00, $0D, $09, $01, $0E, $07, $00, $42, $08, $01, $50, $07, $00, $5F
Bank04_LA48F:  .byte $03, $02, $8B, $0E, $00, $8E, $07, $00, $9D, $09, $01, $A0, $07, $00, $A6, $0E
Bank04_LA49F:  .byte $00, $DE, $07, $00, $FD
;Room enemy/door data:
Bank04_LA4A4:  .byte $02, $A1, $21, $85, $97, $31, $03, $83, $FF

;Room #$0A
Bank04_LA4AD:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA4AE:  .byte $00, $07, $00, $0E, $07, $00, $12, $08, $01, $50, $07, $00, $5F, $03, $02, $72
Bank04_LA4BE:  .byte $08, $01, $87, $0E, $00, $8B, $0E, $00, $8E, $07, $00, $A0, $10, $00, $AD, $09
Bank04_LA4CE:  .byte $01, $CC, $10, $00, $D4, $00, $02, $E0, $10, $00, $FD
;Room enemy/door data:
Bank04_LA4D9:  .byte $02, $A1, $01, $85, $78, $11, $03, $28, $FF

;Room #$0B
Bank04_LA4E2:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA4E3:  .byte $00, $10, $00, $04, $10, $00, $08, $10, $00, $0C, $10, $00, $40, $10, $00, $44
Bank04_LA4F3:  .byte $10, $00, $48, $10, $00, $4C, $10, $00, $80, $10, $00, $84, $10, $00, $88, $10
Bank04_LA503:  .byte $00, $8C, $10, $00, $B0, $10, $00, $B4, $10, $00, $B8, $10, $00, $BC, $10, $00
Bank04_LA513:  .byte $FF

;Room #$0C
Bank04_LA514:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA515:  .byte $00, $07, $00, $0A, $11, $00, $0E, $07, $00, $25, $11, $00, $32, $08, $01, $49
Bank04_LA525:  .byte $11, $00, $50, $03, $02, $5D, $09, $01, $5E, $07, $00, $80, $07, $00, $82, $11
Bank04_LA535:  .byte $00, $86, $11, $00, $9C, $11, $00, $AE, $07, $00, $BD, $09, $01, $C2, $08, $01
Bank04_LA545:  .byte $C8, $11, $00, $D0, $07, $00, $D4, $11, $00, $FD
;Room enemy/door data:
Bank04_LA54F:  .byte $02, $B1, $51, $85, $39, $41, $05, $C4, $FF

;Room #$0D
Bank04_LA558:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA559:  .byte $00, $07, $00, $0A, $0F, $02, $0E, $07, $00, $1D, $09, $01, $4A, $0F, $02, $50
Bank04_LA569:  .byte $03, $02, $5E, $07, $00, $80, $07, $00, $86, $0F, $02, $8A, $0F, $02, $8C, $11
Bank04_LA579:  .byte $00, $9D, $09, $01, $A2, $11, $00, $AE, $07, $00, $C2, $08, $01, $CA, $0F, $02
Bank04_LA589:  .byte $D0, $07, $00, $FD
;Room enemy/door data:
Bank04_LA58D:  .byte $02, $B1, $FF

;Room #$0E
Bank04_LA590:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA591:  .byte $00, $07, $00, $0A, $0F, $02, $0E, $07, $00, $2D, $09, $01, $32, $08, $01, $4A
Bank04_LA5A1:  .byte $0F, $02, $50, $07, $00, $5E, $07, $00, $78, $11, $00, $8A, $0F, $02, $92, $08
Bank04_LA5B1:  .byte $01, $A0, $07, $00, $AE, $07, $00, $BD, $09, $01, $CA, $0F, $02, $FF

;Room #$0F
Bank04_LA5BF:  .byte $01           ;Attribute table data.
;Room object data:
Bank04_LA5C0:  .byte $00, $1D, $01, $08, $1D, $01, $1E, $1F, $01, $5F, $03, $02, $8C, $1F, $01, $9B
Bank04_LA5D0:  .byte $09, $01, $C9, $1D, $01, $D0, $1F, $01, $D4, $00, $02, $FD
;Room enemy/door data:
Bank04_LA5DC:  .byte $02, $A1, $41, $84, $31, $57, $87, $D5, $07, $87, $D8, $FF

;Room #$10
Bank04_LA5E8:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA5E9:  .byte $00, $12, $00, $08, $12, $00, $57, $0C, $00, $75, $0C, $00, $79, $0C, $00, $93
Bank04_LA5F9:  .byte $0C, $00, $9B, $0C, $00, $B1, $0C, $00, $BD, $0C, $00, $CF, $0C, $00, $D0, $00
Bank04_LA609:  .byte $02, $D8, $00, $02, $FD
;Room enemy/door data:
Bank04_LA60E:  .byte $41, $81, $2D, $27, $07, $D4, $17, $87, $DA, $FF

;Room #$11 (not used).
Bank04_LA618:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA619:  .byte $00, $07, $00, $02, $08, $01, $0E, $07, $00, $2D, $09, $01, $32, $0E, $00, $50
Bank04_LA629:  .byte $03, $02, $5F, $03, $02, $80, $10, $00, $84, $10, $00, $88, $10, $00, $8C, $10
Bank04_LA639:  .byte $00, $C0, $10, $00, $C4, $10, $00, $C8, $10, $00, $CC, $10, $00, $FF

;Room #$12
Bank04_LA647:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA648:  .byte $00, $12, $00, $08, $12, $00, $24, $11, $00, $37, $0C, $00, $45, $0C, $00, $48
Bank04_LA658:  .byte $0E, $00, $57, $0C, $00, $63, $0C, $00, $65, $0C, $00, $9B, $0E, $00, $A2, $11
Bank04_LA668:  .byte $00, $C0, $13, $03, $C5, $0E, $00, $C9, $0C, $00, $CC, $13, $03, $D4, $00, $02
Bank04_LA678:  .byte $FD
;Room enemy/door data:
Bank04_LA679:  .byte $21, $85, $39, $31, $85, $8C, $41, $85, $B6, $FF

;Room #$13
Bank04_LA683:  .byte $03           ;Attribute table data.
;Room object data:
Bank04_LA684:  .byte $00, $15, $03, $08, $15, $03, $10, $16, $03, $50, $03, $02, $68, $14, $03, $80
Bank04_LA694:  .byte $16, $03, $93, $14, $03, $AB, $14, $03, $BF, $14, $03, $C0, $16, $03, $D2, $00
Bank04_LA6A4:  .byte $02, $DA, $00, $02, $FD
;Room enemy/door data:
Bank04_LA6A9:  .byte $02, $B0, $21, $81, $27, $41, $85, $84, $37, $87, $DD, $FF

;Room #$14
Bank04_LA6B5:  .byte $03           ;Attribute table data.
;Room object data:
Bank04_LA6B6:  .byte $00, $15, $03, $08, $15, $03, $8A, $14, $03, $A4, $14, $03, $AF, $14, $03, $D0
Bank04_LA6C6:  .byte $00, $02, $D8, $00, $02, $FD
;Room enemy/door data:
Bank04_LA6CC:  .byte $37, $87, $D1, $47, $87, $D7, $57, $87, $DC, $01, $85, $95, $FF

;Room #$15
Bank04_LA6D9:  .byte $01           ;Attribute table data.
;Room object data:
Bank04_LA6DA:  .byte $00, $1D, $01, $08, $1D, $01, $20, $1D, $01, $28, $1D, $01, $50, $03, $02, $5F
Bank04_LA6EA:  .byte $03, $02, $80, $1D, $01, $87, $20, $01, $88, $1D, $01, $97, $21, $01, $B0, $1D
Bank04_LA6FA:  .byte $01, $B7, $21, $01, $B8, $1D, $01, $C0, $1D, $01, $C7, $21, $01, $C8, $1D, $01
Bank04_LA70A:  .byte $FD
;Room enemy/door data:
Bank04_LA70B:  .byte $02, $A1, $02, $B1, $01, $80, $68, $FF

;Room #$16
Bank04_LA713:  .byte $03           ;Attribute table data.
;Room object data:
Bank04_LA714:  .byte $00, $15, $03, $08, $15, $03, $1E, $16, $03, $5F, $03, $02, $61, $14, $03, $85
Bank04_LA724:  .byte $14, $03, $8C, $15, $03, $8E, $16, $03, $BA, $14, $03, $CE, $16, $03, $D0, $00
Bank04_LA734:  .byte $02, $D6, $00, $02, $FD
;Room enemy/door data:
Bank04_LA739:  .byte $02, $A1, $07, $87, $D3, $17, $07, $D8, $21, $81, $27, $FF

;Room #$17
Bank04_LA745:  .byte $01           ;Attribute table data.
;Room object data:
Bank04_LA746:  .byte $00, $17, $03, $08, $17, $03, $10, $19, $03, $24, $18, $03, $36, $0C, $00, $3B
Bank04_LA756:  .byte $0C, $00, $50, $03, $02, $80, $19, $03, $AE, $0C, $00, $C0, $19, $03, $D4, $18
Bank04_LA766:  .byte $03, $D8, $00, $02, $D9, $18, $03, $DB, $05, $02, $DF, $00, $02, $FD, $02, $B1
Bank04_LA776:  .byte $41, $80, $C5, $57, $87, $DC, $31, $04, $48, $FF

;Room #$18
Bank04_LA780:  .byte $01           ;Attribute table data.
;Room object data:
Bank04_LA781:  .byte $00, $17, $03, $08, $17, $03, $1C, $19, $03, $20, $19, $03, $5F, $03, $02, $8C
Bank04_LA791:  .byte $19, $03, $CC, $19, $03, $D0, $18, $03, $D3, $00, $02, $D4, $18, $03, $D5, $05
Bank04_LA7A1:  .byte $02, $FD
;Room enemy/door data:
Bank04_LA7A3:  .byte $02, $A1, $37, $87, $D6, $21, $84, $62, $11, $84, $25, $01, $84, $29, $FF

;Room #$19
Bank04_LA7B2:  .byte $03           ;Attribute table data.
;Room object data:
Bank04_LA7B3:  .byte $00, $19, $03, $04, $19, $03, $08, $19, $03, $0C, $19, $03, $40, $19, $03, $44
Bank04_LA7C3:  .byte $19, $03, $48, $19, $03, $4C, $19, $03, $70, $19, $03, $74, $19, $03, $78, $19
Bank04_LA7D3:  .byte $03, $7C, $19, $03, $90, $1A, $03, $94, $1A, $03, $98, $1A, $03, $9C, $1A, $03
Bank04_LA7E3:  .byte $B0, $1A, $03, $B8, $1A, $03, $C0, $19, $03, $C4, $19, $03, $C8, $19, $03, $CC
Bank04_LA7F3:  .byte $19, $03, $FF

;Room #$1A
Bank04_LA7F6:  .byte $03           ;Attribute table data.
;Room object data:
Bank04_LA7F7:  .byte $00, $13, $03, $04, $13, $03, $08, $13, $03, $0C, $13, $03, $10, $13, $03, $14
Bank04_LA807:  .byte $13, $03, $18, $13, $03, $1C, $13, $03, $50, $03, $02, $5F, $03, $02, $80, $13
Bank04_LA817:  .byte $03, $81, $1B, $03, $84, $13, $03, $88, $13, $03, $8C, $13, $03, $91, $1C, $03
Bank04_LA827:  .byte $C0, $13, $03, $C1, $1C, $03, $C4, $13, $03, $C8, $13, $03, $CC, $13, $03, $FD
;Room enemy/door data:
Bank04_LA837:  .byte $02, $A0, $02, $B1, $31, $81, $68, $FF

;Room #$1B
Bank04_LA83F:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA840:  .byte $00, $1F, $01, $04, $1D, $01, $07, $21, $01, $0C, $1F, $01, $10, $0C, $00, $14
Bank04_LA850:  .byte $1F, $01, $17, $21, $01, $18, $1F, $01, $1F, $0C, $00, $25, $0B, $02, $2A, $0B
Bank04_LA860:  .byte $02, $41, $22, $00, $4C, $23, $00, $50, $03, $02, $54, $22, $00, $59, $23, $00
Bank04_LA870:  .byte $5F, $03, $02, $80, $07, $00, $82, $14, $03, $84, $14, $03, $86, $14, $03, $88
Bank04_LA880:  .byte $14, $03, $8A, $14, $03, $8C, $14, $03, $8E, $07, $00, $92, $16, $03, $9C, $16
Bank04_LA890:  .byte $03, $D0, $12, $00, $D4, $00, $02, $DC, $12, $00, $FD
;Room enemy/door data:
Bank04_LA89B:  .byte $02, $A1, $02, $B0, $27, $07, $D9, $FF

;Room #$1C
Bank04_LA8A3:  .byte $03           ;Attribute table data.
;Room object data:
Bank04_LA8A4:  .byte $00, $17, $03, $08, $17, $03, $B0, $18, $03, $B6, $05, $02, $B8, $18, $03, $D0
Bank04_LA8B4:  .byte $18, $03, $D8, $18, $03, $FD
;Room enemy/door data:
Bank04_LA8BA:  .byte $37, $87, $B7, $01, $80, $45, $11, $00, $3B, $21, $81, $9A, $FF

;Room #$1D
Bank04_LA8C7:  .byte $01           ;Attribute table data.
;Room object data:
Bank04_LA8C8:  .byte $00, $15, $03, $08, $15, $03, $10, $24, $03, $13, $0B, $02, $18, $24, $03, $1C
Bank04_LA8D8:  .byte $0B, $02, $1F, $25, $03, $20, $25, $03, $22, $22, $00, $2B, $23, $00, $5F, $03
Bank04_LA8E8:  .byte $02, $60, $25, $03, $8E, $25, $03, $8F, $13, $03, $A0, $25, $03, $A2, $11, $00
Bank04_LA8F8:  .byte $AC, $11, $00, $B3, $12, $00, $BB, $0C, $00, $BE, $1B, $03, $C3, $24, $03, $CE
Bank04_LA908:  .byte $12, $00, $D1, $00, $02, $D3, $24, $03, $DC, $00, $02, $DE, $12, $00, $E0, $25
Bank04_LA918:  .byte $03, $E3, $15, $03, $FD
;Room enemy/door data:
Bank04_LA91D:  .byte $02, $A0, $01, $48, $95, $FF

;Room #$1E
Bank04_LA923:  .byte $01           ;Attribute table data.
;Room object data:
Bank04_LA924:  .byte $00, $1E, $01, $02, $1D, $01, $08, $1D, $01, $1F, $1F, $01, $40, $1E, $01, $5F
Bank04_LA934:  .byte $03, $02, $77, $0C, $00, $80, $1E, $01, $87, $1E, $01, $8D, $1F, $01, $C0, $1D
Bank04_LA944:  .byte $01, $C8, $1D, $01, $FD
;Room enemy/door data:
Bank04_LA949:  .byte $02, $A1, $11, $81, $35, $FF

;Room #$1F
Bank04_LA94F:  .byte $01           ;Attribute table data.
;Room object data:
Bank04_LA950:  .byte $00, $1D, $01, $08, $1D, $01, $10, $1E, $01, $50, $03, $02, $80, $1F, $01, $C0
Bank04_LA960:  .byte $1D, $01, $C8, $1D, $01, $CC, $05, $02, $FD
;Room enemy/door data:
Bank04_LA969:  .byte $02, $B1, $01, $88, $AB, $17, $07, $CD, $FF

;Room #$20
Bank04_LA972:  .byte $01           ;Attribute table data.
;Room object data:
Bank04_LA973:  .byte $00, $1D, $01, $08, $1D, $01, $78, $0C, $00, $88, $21, $01, $C0, $1D, $01, $C8
Bank04_LA983:  .byte $1D, $01, $CD, $05, $02, $FD
;Room enemy/door data:
Bank04_LA989:  .byte $27, $87, $CE, $41, $80, $BC, $FF

;Room #$21
Bank04_LA990:  .byte $01           ;Attribute table data.
;Room object data:
Bank04_LA991:  .byte $00, $1D, $01, $08, $1D, $01, $20, $1D, $01, $28, $1D, $01, $50, $03, $02, $5F
Bank04_LA9A1:  .byte $03, $02, $80, $1D, $01, $88, $1D, $01, $B0, $1D, $01, $B8, $1D, $01, $C0, $1D
Bank04_LA9B1:  .byte $01, $C8, $1D, $01, $FD
;Room enemy/door data:
Bank04_LA9B6:  .byte $02, $A1, $02, $B1, $21, $81, $68, $FF

;Room #$22
Bank04_LA9BE:  .byte $03           ;Attribute table data.
;Room object data:
Bank04_LA9BF:  .byte $00, $13, $03, $04, $13, $03, $08, $13, $03, $0C, $13, $03, $10, $13, $03, $14
Bank04_LA9CF:  .byte $13, $03, $18, $13, $03, $1C, $13, $03, $50, $03, $02, $5F, $03, $02, $80, $13
Bank04_LA9DF:  .byte $03, $84, $13, $03, $88, $13, $03, $8C, $13, $03, $C0, $13, $03, $C4, $13, $03
Bank04_LA9EF:  .byte $C8, $13, $03, $CC, $13, $03, $FD
;Room enemy/door data:
Bank04_LA9F6:  .byte $02, $A1, $02, $B1, $41, $81, $68, $FF

;Room #$23
Bank04_LA9FE:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LA9FF:  .byte $00, $10, $00, $0E, $06, $00, $16, $0D, $00, $2D, $09, $01, $34, $08, $01, $40
Bank04_LAA0F:  .byte $10, $00, $4B, $0E, $00, $5F, $03, $02, $80, $10, $00, $84, $10, $00, $88, $10
Bank04_LAA1F:  .byte $00, $8C, $10, $00, $C0, $10, $00, $CC, $10, $00, $D4, $00, $02, $FD
;Room enemy/door data:
Bank04_LAA2D:  .byte $02, $A1, $01, $03, $38, $FF

;Room #$24
Bank04_LAA33:  .byte $00           ;Attribute table data.
;Room object data:
Bank04_LAA34:  .byte $00, $07, $00, $0E, $07, $00, $19, $11, $00, $1D, $09, $01, $32, $08, $01, $4C
Bank04_LAA44:  .byte $11, $00, $50, $03, $02, $5E, $07, $00, $80, $10, $00, $84, $10, $00, $88, $10
Bank04_LAA54:  .byte $00, $8C, $10, $00, $C0, $10, $00, $CC, $10, $00, $FD
;Room enemy/door data:
Bank04_LAA5F:  .byte $02, $B1, $41, $80, $75, $51, $00, $7A, $01, $83, $45, $FF

;---------------------------------------[ Structure definitions ]------------------------------------

;The first byte of the structure definition states how many macros are in the first row of the
;structure. The the number of bytes after the macro number byte is equal to the value of the macro
;number byte and those bytes define what each macro in the row are. For example, if the macro number
;byte is #$08, the next 8 bytes represent 8 macros. The macro description bytes are the macro numbers
;and are multiplied by 4 to find the index to the desired macro in _MacroDefs.  Any further bytes in
;the structure definition represent the next rows.  #$FF marks the end of the structure definition.

;Structure #$00
Bank04_LAA6B:  .byte $08, $01, $01, $01, $01, $01, $01, $01, $01, $08, $00, $00, $00, $00, $00, $00
Bank04_LAA7B:  .byte $00, $00, $FF

;Structure #$01
Bank04_LAA7E:  .byte $08, $02, $02, $02, $02, $02, $02, $02, $02, $01, $1C, $01, $1C, $01, $1C, $08
Bank04_LAA8E:  .byte $02, $02, $02, $02, $02, $02, $02, $02, $FF

;Structure #$02
Bank04_LAA97:  .byte $02, $04, $05, $02, $04, $05, $02, $04, $05, $02, $04, $05, $02, $04, $05, $02
Bank04_LAAA7:  .byte $04, $05, $02, $04, $05, $02, $04, $05, $FF

;Structure #$03
Bank04_LAAB0:  .byte $01, $06, $01, $06, $01, $06, $FF

;Structure #$04
Bank04_LAAB7:  .byte $01, $07, $01, $07, $01, $07, $FF

;Structure #$05
Bank04_LAABE:  .byte $02, $14, $15, $FF

;Structure #$06
Bank04_LAAC2:  .byte $02, $17, $17, $02, $17, $1B, $02, $17, $1B, $02, $1B, $17, $02, $17, $17, $FF

;Structure #$07
Bank04_LAAD2:  .byte $02, $1A, $17, $02, $17, $17, $02, $1B, $1A, $02, $17, $17, $02, $1A, $1B, $FF

;Structure #$08
Bank04_LAAE2:  .byte $01, $18, $01, $18, $FF

;Structure #$09
Bank04_LAAE7:  .byte $01, $19, $01, $19, $FF

;Structure #$0A
Bank04_LAAEC:  .byte $01, $09, $FF

;Structure #$0B
Bank04_LAAEF:  .byte $01, $0A, $FF

;Structure #$0C
Bank04_LAAF2:  .byte $01, $1E, $01, $1A, $01, $1A, $01, $1A, $01, $1E, $FF

;Structure #$0D
Bank04_LAAFD:  .byte $04, $17, $17, $17, $17, $FF

;Structure #$0E
Bank04_LAB03:  .byte $03, $17, $1D, $17, $FF

;Structure #$0F
Bank04_LAB08:  .byte $01, $0B, $01, $0B, $01, $0B, $01, $0B, $FF

;Structure #$10
Bank04_LAB11:  .byte $04, $17, $17, $1B, $17, $04, $1B, $17, $17, $17, $04, $1B, $17, $1B, $1B, $04
Bank04_LAB21:  .byte $17, $1B, $17, $17, $FF

;Structure #$11
Bank04_LAB26:  .byte $01, $17, $FF

;Structure #$12
Bank04_LAB29:  .byte $08, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $08, $1E, $1E, $1E, $1E, $1E, $1E
Bank04_LAB39:  .byte $1E, $1E, $FF

;Structure #$13
Bank04_LAB3C:  .byte $04, $0F, $0F, $0F, $0F, $04, $0F, $0F, $0F, $0F, $04, $0F, $0F, $0F, $0F, $04
Bank04_LAB4C:  .byte $0F, $0F, $0F, $0F, $FF

;Structure #$14
Bank04_LAB51:  .byte $02, $12, $12, $FF

;Structure #$15
Bank04_LAB55:  .byte $08, $10, $10, $10, $10, $10, $10, $10, $10, $08, $10, $10, $10, $10, $10, $10
Bank04_LAB65:  .byte $10, $10, $FF

;Structure #$16
Bank04_LAB68:  .byte $02, $10, $10, $02, $10, $10, $02, $10, $10, $02, $10, $10, $FF

;Structure #$17
Bank04_LAB75:  .byte $08, $13, $0E, $13, $0E, $0E, $13, $0E, $0E, $08, $0E, $0E, $13, $13, $0E, $0E
Bank04_LAB85:  .byte $13, $13, $FF

;Structure #$18
Bank04_LAB88:  .byte $08, $11, $11, $11, $11, $11, $11, $11, $11, $08, $11, $11, $11, $11, $11, $11
Bank04_LAB98:  .byte $11, $11, $FF

;Structure #$19
Bank04_LAB9B:  .byte $04, $11, $11, $11, $11, $04, $11, $11, $11, $11, $04, $11, $11, $11, $11, $04
Bank04_LABAB:  .byte $11, $11, $11, $11, $FF

;Structure #$1A
Bank04_LABB0:  .byte $08, $20, $22, $22, $22, $22, $22, $22, $22, $FF

;Structure #$1B
Bank04_LABBA:  .byte $01, $1F, $FF

;Structure #$1C
Bank04_LABBD:  .byte $01, $21, $01, $21, $01, $21, $FF

;Structure #$1D
Bank04_LABC4:  .byte $08, $23, $23, $23, $23, $23, $23, $23, $23, $08, $23, $24, $24, $24, $24, $24
Bank04_LABD4:  .byte $24, $23, $08, $23, $23, $23, $23, $23, $23, $23, $23, $FF

;Structure #$1E
Bank04_LABE0:  .byte $01, $23, $01, $23, $01, $23, $01, $23, $FF

;Structure #$1F
Bank04_LABE9:  .byte $04, $23, $23, $23, $23, $04, $23, $24, $24, $23, $04, $23, $24, $24, $23, $04
Bank04_LABF9:  .byte $23, $23, $23, $23, $FF

;Structure #$20
Bank04_LABFE:  .byte $01, $25, $FF

;Structure #$21
Bank04_LAC01:  .byte $01, $26, $01, $26, $01, $26, $01, $26, $FF

;Structure #$22
Bank04_LAC0A:  .byte $03, $27, $27, $27, $FF

;Structure #$23
Bank04_LAC0F:  .byte $03, $28, $28, $28, $FF

;Structure #$24
Bank04_LAC14:  .byte $08, $13, $13, $13, $13, $13, $13, $13, $13, $FF

;Structure #$25
Bank04_LAC1E:  .byte $01, $13, $01, $13, $01, $13, $01, $13, $FF

;Structure #$26
Bank04_LAC27:  .byte $04, $0C, $0C, $0C, $0C, $04, $0D, $0D, $0D, $0D, $FF

.checkpc MacroDefs
.advance MacroDefs

;----------------------------------------[ Macro definitions ]---------------------------------------

;The macro definitions are simply index numbers into the pattern tables that represent the 4 quadrants
;of the macro definition. The bytes correspond to the following position in order: lower right tile,
;lower left tile, upper right tile, upper left tile. 

_MacroDefs:

Bank04_LAC32:  .byte $F1, $F1, $F1, $F1
Bank04_LAC36:  .byte $FF, $FF, $F0, $F0
Bank04_LAC3A:  .byte $64, $64, $64, $64
Bank04_LAC3E:  .byte $FF, $FF, $64, $64
Bank04_LAC42:  .byte $A4, $FF, $A4, $FF
Bank04_LAC46:  .byte $FF, $A5, $FF, $A5
Bank04_LAC4A:  .byte $A0, $A0, $A0, $A0
Bank04_LAC4E:  .byte $A1, $A1, $A1, $A1
Bank04_LAC52:  .byte $4F, $4F, $4F, $4F
Bank04_LAC56:  .byte $84, $85, $86, $87
Bank04_LAC5A:  .byte $88, $89, $8A, $8B
Bank04_LAC5E:  .byte $80, $81, $82, $83
Bank04_LAC62:  .byte $FF, $FF, $BA, $BA
Bank04_LAC66:  .byte $BB, $BB, $BB, $BB
Bank04_LAC6A:  .byte $10, $11, $12, $13
Bank04_LAC6E:  .byte $04, $05, $06, $07
Bank04_LAC72:  .byte $14, $15, $16, $17
Bank04_LAC76:  .byte $1C, $1D, $1E, $1F
Bank04_LAC7A:  .byte $09, $09, $09, $09
Bank04_LAC7E:  .byte $0C, $0D, $0E, $0F
Bank04_LAC82:  .byte $FF, $FF, $59, $5A
Bank04_LAC86:  .byte $FF, $FF, $5A, $5B
Bank04_LAC8A:  .byte $51, $52, $53, $54
Bank04_LAC8E:  .byte $55, $56, $57, $58
Bank04_LAC92:  .byte $EC, $FF, $ED, $FF
Bank04_LAC96:  .byte $FF, $EE, $FF, $EF
Bank04_LAC9A:  .byte $45, $46, $45, $46
Bank04_LAC9E:  .byte $4B, $4C, $4D, $50
Bank04_LACA2:  .byte $FF, $FF, $FF, $FF
Bank04_LACA6:  .byte $47, $48, $47, $48
Bank04_LACAA:  .byte $08, $08, $08, $08
Bank04_LACAE:  .byte $70, $71, $72, $73
Bank04_LACB2:  .byte $74, $75, $76, $77
Bank04_LACB6:  .byte $E0, $E1, $E2, $E3
Bank04_LACBA:  .byte $E4, $E5, $E6, $E7
Bank04_LACBE:  .byte $20, $21, $22, $23
Bank04_LACC2:  .byte $25, $25, $24, $24
Bank04_LACC6:  .byte $78, $79, $7A, $7B
Bank04_LACCA:  .byte $E8, $E9, $EA, $EB
Bank04_LACCE:  .byte $26, $27, $28, $29
Bank04_LACD2:  .byte $2A, $2B, $2C, $2D

.advance $B000

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

;Not used.
Bank04_LB0E7:  .byte $2A, $2A, $2A, $B9, $2A, $2A, $2A, $B2, $2A, $2A, $2A, $2A, $2A, $B9, $2A, $12
Bank04_LB0F7:  .byte $2A, $B2, $26, $B9, $0E, $26, $26, $B2, $26, $B9, $0E, $26, $26, $B2, $22, $B9
Bank04_LB107:  .byte $0A, $22, $22, $B2, $22, $B9, $0A, $22, $22, $B2, $20, $20, $B9, $20, $20, $20
Bank04_LB117:  .byte $B2, $20, $B9, $34, $30, $34, $38, $34, $38, $3A, $38, $3A, $3E, $3A, $3E, $FF
Bank04_LB127:  .byte $C2, $B2, $18, $30, $18, $30, $18, $30, $18, $30, $22, $22, $B1, $22, $22, $B2
Bank04_LB137:  .byte $22, $20, $1C, $18, $16, $14, $14, $14, $2C, $2A, $2A, $B9, $2A, $2A, $2A, $B2
Bank04_LB147:  .byte $2A, $28, $28, $B9, $28, $28, $28, $B2, $28, $26, $26, $B9, $26, $26, $3E, $26
Bank04_LB157:  .byte $26, $3E, $FF, $F0, $B2, $01, $04, $01, $04, $FF, $E0, $BA, $2A, $1A, $02, $3A
Bank04_LB167:  .byte $40, $02, $1C, $2E, $38, $2C, $3C, $38, $02, $40, $44, $46, $02, $1E, $02, $2C
Bank04_LB177:  .byte $38, $46, $26, $02, $3A, $20, $02, $28, $2E, $02, $18, $44, $02, $46, $48, $4A
Bank04_LB187:  .byte $4C, $02, $18, $1E, $FF, $B8, $02, $C8, $B0, $0A, $0C, $FF, $C8, $0E, $0C, $FF
Bank04_LB197:  .byte $C8, $10, $0E, $FF, $C8, $0E, $0C, $FF, $00, $2B, $3B, $1B, $5A, $D0, $D1, $C3
Bank04_LB1A7:  .byte $C3, $3B, $3B, $9B, $DA, $D0, $D0, $C0, $C0, $2C, $23, $20, $20, $30, $98, $CF
Bank04_LB1B7:  .byte $C7, $00, $00, $00, $00, $00, $00, $00, $30, $1F, $80, $C0, $C0, $60, $70, $FC
Bank04_LB1C7:  .byte $C0, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00
Bank04_LB1D7:  .byte $00, $80, $80, $C0, $78, $4C, $C7, $80, $80, $C4, $A5, $45, $0B, $1B, $03, $03
Bank04_LB1E7:  .byte $00, $3A, $13, $31, $63, $C3, $83, $03, $04, $E6, $E6, $C4, $8E, $1C, $3C, $18
Bank04_LB1F7:  .byte $30, $E8, $E8, $C8, $90, $60, $00, $00, $00

;------------------------------------------[ Sound Engine ]------------------------------------------

.checkpc SoundEngineOrg
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
    _LBD5D:  .word $B03F, $B041, $B0AA, $0000

    ;Item room music.
    _LBD65:  .byte $0B, $FF, $03, $00, $00
    _LBD6A:  .word $BDDA, $BDDC, $BDCD, $0000

    ;Ridley area music.
    _LBD72:  .byte $0B, $FF, $F0, $01, $01
    _LBD77:  .word $B022, $B031, $B000, $0000

    ;End game music(not used this memory page).
    _LBD7F:  .byte $17, $00, $00, $02, $01
    _LBD84:  .word $0100, $0300, $0500, $0700

    ;Intro music(not used this memory page).
    _LBD8C:  .byte $17, $00, $F0, $02, $05
    _LBD91:  .word $0100, $0300, $0500, $0700

    ;Fade in music
    _LBD99:  .byte $0B, $00, $F0, $02, $00
    _LBD9E:  .word $BE3E, $BE1D, $BE36, $0000

    ;Power up music
    _LBDA6:  .byte $00, $00, $F0, $01, $00
    _LBDAB:  .word $BDF7, $BE0D, $BE08, $0000

    ;Brinstar music(not used this memory page).
    _LBDB3:  .byte $0B, $FF, $00, $02, $03
    _LBDB8:  .word $0100, $0300, $0500, $0700

    ;Tourian music
    _LBDC0:  .byte $0B, $FF, $03, $00, $00
    _LBDC5:  .word $BE59, $BE47, $BE62, $0000

    .include "Sound_Engine_Common_2.asm"
.scend

;---------------------------------------- [ Not used ] ----------------------------------------------

;Not used.
Bank04_LBF56:  .byte $10, $07, $0E, $1C, $38, $70, $2A, $54, $15, $12, $02, $03, $20, $2C, $B4, $AD
Bank04_LBF66:  .byte $4D, $06, $8D, $8D, $06, $AD, $5E, $06, $A8, $B9, $2A, $BC, $A8, $A2, $00, $B9
Bank04_LBF76:  .byte $61, $BD, $9D, $2B, $06, $C8, $E8, $8A, $C9, $0D, $D0, $F3, $A9, $01, $8D, $40
Bank04_LBF86:  .byte $06, $8D, $41, $06, $8D, $42, $06, $8D, $43, $06, $A9, $00, $8D, $38, $06, $8D
Bank04_LBF96:  .byte $39, $06, $8D, $3A, $06, $8D, $3B, $06, $60, $FF, $00, $00, $00, $00, $00, $00
Bank04_LBFA6:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

;----------------------------------------------------------------------------------------------------

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

;Not used.
Bank04_LBFD5:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00
Bank04_LBFE5:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank04_LBFF5:  .byte $00, $00, $00, $00, $00

;----------------------------------------------------------------------------------------------------

;Interrupt vectors.
.word NMI               ;($C0D9)NMI vector.
.word RESET_Bank04      ;($FFB0)Reset vector.
.word RESET_Bank04      ;($FFB0)IRQ vector.