;Norfair bank.

.include "Game_Start_Common.asm"

;------------------------------------------[ Graphics data ]-----------------------------------------

;Norfair enemy tile patterns.
Bank02_L8D60:  .byte $38, $7C, $A6, $FA, $BE, $FA, $6C, $38, $30, $6C, $06, $FA, $BA, $D2, $0C, $38
Bank02_L8D70:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L8D80:  .byte $03, $FF, $1F, $3F, $3F, $7F, $7F, $FF, $00, $00, $04, $08, $00, $00, $00, $00
Bank02_L8D90:  .byte $C0, $F0, $FE, $FE, $FE, $FF, $BF, $2C, $00, $00, $0E, $1E, $1E, $1C, $38, $20
Bank02_L8DA0:  .byte $C0, $F0, $F8, $FC, $FE, $FF, $9F, $0C, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L8DB0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L8DC0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L8DD0:  .byte $00, $08, $10, $60, $80, $80, $00, $00, $04, $04, $06, $0E, $9C, $BC, $7C, $7C
Bank02_L8DE0:  .byte $00, $0C, $02, $03, $1C, $29, $41, $08, $00, $00, $00, $00, $02, $05, $05, $04
Bank02_L8DF0:  .byte $00, $08, $10, $60, $80, $80, $00, $00, $04, $04, $06, $0E, $9C, $B8, $70, $70
Bank02_L8E00:  .byte $01, $2B, $0D, $27, $5B, $07, $5B, $2F, $01, $2B, $0D, $27, $5B, $07, $5B, $2F
Bank02_L8E10:  .byte $00, $46, $69, $B8, $E4, $E8, $8C, $66, $00, $40, $60, $B8, $E4, $E0, $80, $06
Bank02_L8E20:  .byte $00, $00, $00, $02, $51, $0B, $2D, $1F, $00, $00, $00, $02, $51, $0B, $2D, $1F
Bank02_L8E30:  .byte $20, $48, $62, $AC, $F9, $EF, $FA, $FF, $20, $48, $62, $AC, $F9, $EF, $FA, $FF
Bank02_L8E40:  .byte $1C, $78, $FE, $FF, $E5, $CC, $C8, $40, $00, $00, $40, $40, $00, $80, $C8, $40
Bank02_L8E50:  .byte $3C, $7E, $FF, $3C, $DB, $E7, $5A, $3C, $00, $20, $00, $00, $C3, $E7, $42, $00
Bank02_L8E60:  .byte $00, $00, $00, $08, $5A, $A3, $DB, $5A, $00, $00, $00, $10, $24, $6E, $68, $04
Bank02_L8E70:  .byte $00, $00, $00, $00, $10, $28, $3E, $18, $00, $00, $00, $00, $08, $1C, $06, $08
Bank02_L8E80:  .byte $03, $01, $20, $0C, $1E, $7F, $3F, $0E, $00, $00, $20, $00, $00, $00, $08, $00
Bank02_L8E90:  .byte $08, $90, $F8, $E0, $60, $60, $60, $30, $00, $02, $02, $06, $0E, $0A, $03, $00
Bank02_L8EA0:  .byte $28, $B8, $FC, $DE, $5E, $4E, $60, $30, $20, $3A, $1E, $1E, $1E, $0E, $03, $00
Bank02_L8EB0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L8EC0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L8ED0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $FC, $F8, $F8, $F8, $B8, $7C, $DC, $3C
Bank02_L8EE0:  .byte $18, $30, $24, $20, $22, $01, $00, $06, $06, $06, $03, $01, $01, $00, $00, $00
Bank02_L8EF0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $E0, $F0, $F8, $F8, $B8, $7C, $DC, $3C
Bank02_L8F00:  .byte $07, $0A, $01, $03, $04, $01, $00, $00, $07, $0A, $01, $03, $04, $01, $00, $00
Bank02_L8F10:  .byte $66, $8C, $E8, $E6, $FA, $55, $64, $1A, $06, $80, $E0, $E6, $FA, $45, $40, $02
Bank02_L8F20:  .byte $7E, $7D, $7D, $B0, $B6, $6B, $99, $24, $7E, $7C, $3C, $10, $30, $29, $99, $24
Bank02_L8F30:  .byte $7A, $BE, $BC, $08, $6C, $D2, $82, $04, $7A, $3E, $3C, $08, $08, $90, $80, $00
Bank02_L8F40:  .byte $3C, $F0, $98, $68, $90, $B0, $E0, $40, $00, $00, $00, $60, $F0, $F0, $E0, $40
Bank02_L8F50:  .byte $3C, $F0, $98, $68, $00, $00, $00, $00, $00, $00, $00, $60, $00, $00, $00, $00
Bank02_L8F60:  .byte $00, $00, $02, $0D, $06, $2A, $1B, $0F, $00, $00, $00, $00, $00, $03, $07, $1F
Bank02_L8F70:  .byte $00, $00, $80, $20, $C0, $B0, $E8, $A0, $00, $00, $00, $00, $00, $C0, $C0, $90
Bank02_L8F80:  .byte $00, $00, $28, $5B, $FB, $BF, $7F, $2E, $00, $00, $00, $14, $2B, $3D, $1A, $04
Bank02_L8F90:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L8FA0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L8FB0:  .byte $09, $A7, $5F, $BF, $33, $ED, $76, $C9, $00, $00, $00, $00, $00, $6C, $46, $C0
Bank02_L8FC0:  .byte $00, $00, $0A, $1F, $33, $6D, $46, $C1, $00, $00, $00, $00, $00, $6C, $46, $C0
Bank02_L8FD0:  .byte $03, $5F, $3F, $B3, $FD, $7E, $DF, $37, $00, $50, $3A, $99, $74, $3E, $DC, $30
Bank02_L8FE0:  .byte $10, $10, $00, $00, $40, $00, $00, $40, $0B, $0D, $2F, $36, $3C, $18, $78, $30
Bank02_L8FF0:  .byte $40, $00, $00, $00, $00, $00, $00, $00, $34, $F8, $B8, $D0, $00, $00, $00, $00
Bank02_L9000:  .byte $00, $01, $71, $13, $FF, $3C, $F3, $2F, $03, $0E, $0C, $00, $00, $00, $00, $00
Bank02_L9010:  .byte $08, $07, $06, $0D, $1C, $1C, $0E, $06, $00, $00, $00, $00, $04, $00, $02, $00
Bank02_L9020:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L9030:  .byte $9E, $7F, $3F, $07, $4E, $3D, $03, $0A, $F0, $68, $30, $3C, $5A, $3F, $07, $0B
Bank02_L9040:  .byte $12, $04, $2F, $2F, $3F, $3F, $5F, $2F, $13, $0F, $3D, $3E, $34, $78, $70, $68
Bank02_L9050:  .byte $00, $80, $60, $F0, $E8, $F8, $F0, $FC, $C0, $70, $98, $0C, $14, $06, $0E, $02
Bank02_L9060:  .byte $37, $3F, $4A, $B6, $7F, $25, $58, $00, $0F, $0F, $1E, $1D, $00, $00, $00, $00
Bank02_L9070:  .byte $C8, $F0, $C0, $D0, $40, $00, $00, $00, $E0, $C0, $A0, $00, $80, $00, $00, $00
Bank02_L9080:  .byte $00, $00, $14, $1A, $5F, $BD, $FE, $74, $00, $00, $00, $28, $54, $BC, $58, $20
Bank02_L9090:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L90A0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L90B0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L90C0:  .byte $03, $0F, $17, $3B, $9D, $6A, $1F, $07, $00, $00, $12, $09, $54, $26, $0C, $00
Bank02_L90D0:  .byte $E0, $F0, $E4, $CE, $D1, $C0, $A6, $30, $00, $00, $08, $10, $00, $0E, $1F, $41
Bank02_L90E0:  .byte $00, $00, $40, $00, $00, $10, $00, $00, $10, $71, $32, $3A, $18, $0C, $0F, $03
Bank02_L90F0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $C0, $20, $20, $20, $60, $C0, $80
Bank02_L9100:  .byte $08, $27, $7C, $F3, $C7, $87, $05, $02, $04, $00, $00, $13, $42, $05, $05, $02
Bank02_L9110:  .byte $08, $27, $7C, $F1, $C3, $81, $00, $00, $04, $00, $00, $11, $43, $01, $00, $00
Bank02_L9120:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank02_L9130:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank02_L9140:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L9150:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

;Tourian enemy tile patterns.
Bank02_L9160:  .byte $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $01, $03, $06, $0D
Bank02_L9170:  .byte $00, $00, $00, $00, $00, $00, $98, $64, $00, $00, $00, $7E, $C3, $00, $00, $00
Bank02_L9180:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $C0, $60, $30
Bank02_L9190:  .byte $00, $00, $00, $00, $00, $02, $06, $0C, $00, $00, $03, $04, $08, $12, $16, $2C
Bank02_L91A0:  .byte $00, $00, $00, $00, $80, $78, $04, $04, $00, $FF, $00, $00, $00, $00, $00, $00
Bank02_L91B0:  .byte $00, $00, $00, $00, $00, $00, $10, $20, $00, $00, $C0, $20, $10, $08, $04, $04
Bank02_L91C0:  .byte $00, $15, $0F, $05, $3F, $2F, $7E, $3D, $00, $00, $00, $00, $01, $07, $06, $0D
Bank02_L91D0:  .byte $03, $07, $17, $13, $0F, $1F, $1D, $1F, $01, $04, $03, $03, $07, $06, $05, $1D
Bank02_L91E0:  .byte $E0, $A0, $B0, $18, $0F, $00, $00, $00, $A0, $00, $80, $10, $02, $00, $00, $00
Bank02_L91F0:  .byte $00, $00, $00, $00, $80, $00, $00, $00, $7F, $7F, $7F, $7F, $FF, $3F, $3F, $3F
Bank02_L9200:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L9210:  .byte $F0, $20, $40, $80, $80, $C0, $70, $10, $A0, $00, $00, $00, $87, $1F, $2E, $EF
Bank02_L9220:  .byte $00, $00, $10, $30, $60, $60, $F0, $60, $00, $00, $10, $30, $E0, $68, $F4, $66
Bank02_L9230:  .byte $00, $00, $0C, $06, $03, $00, $10, $30, $2C, $27, $3D, $56, $5B, $CC, $D7, $F0
Bank02_L9240:  .byte $00, $00, $00, $03, $1E, $0C, $08, $00, $00, $00, $00, $03, $9E, $EC, $F8, $F0
Bank02_L9250:  .byte $00, $00, $00, $07, $0F, $1F, $1E, $1C, $00, $00, $00, $00, $03, $04, $08, $08
Bank02_L9260:  .byte $03, $02, $04, $0A, $09, $13, $03, $01, $1B, $1A, $30, $30, $60, $60, $60, $78
Bank02_L9270:  .byte $18, $3C, $3C, $3C, $DB, $E7, $E7, $E7, $00, $00, $00, $18, $00, $00, $81, $00
Bank02_L9280:  .byte $40, $80, $80, $40, $88, $D0, $C0, $80, $10, $18, $0C, $0C, $06, $06, $06, $1E
Bank02_L9290:  .byte $08, $00, $00, $00, $0D, $33, $03, $01, $28, $40, $40, $40, $80, $81, $81, $F0
Bank02_L92A0:  .byte $18, $3C, $3C, $3C, $DB, $E7, $E7, $E7, $00, $18, $3C, $18, $81, $C3, $E7, $C3
Bank02_L92B0:  .byte $20, $20, $40, $4C, $90, $C0, $C0, $80, $02, $02, $02, $01, $01, $81, $81, $0F
Bank02_L92C0:  .byte $3F, $5E, $5B, $3B, $37, $0B, $01, $00, $0F, $0E, $03, $09, $01, $00, $00, $00
Bank02_L92D0:  .byte $1F, $0B, $0F, $1C, $06, $0F, $07, $02, $07, $03, $07, $00, $02, $01, $00, $00
Bank02_L92E0:  .byte $00, $00, $E0, $70, $20, $00, $00, $00, $03, $07, $E7, $7F, $2F, $1F, $1F, $1F
Bank02_L92F0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $F1, $FE, $FF, $FF, $FF, $FF, $FF, $FF
Bank02_L9300:  .byte $80, $C0, $60, $70, $78, $38, $30, $00, $80, $C0, $60, $76, $7B, $3B, $77, $47
Bank02_L9310:  .byte $18, $08, $08, $1C, $08, $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank02_L9320:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $8F, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank02_L9330:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $F0, $FE, $FF, $FF, $FF, $FF
Bank02_L9340:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $F8, $F8, $F4, $FC, $FE, $FE, $FA, $FE
Bank02_L9350:  .byte $00, $00, $00, $01, $07, $0E, $0C, $18, $00, $00, $00, $00, $03, $04, $08, $08
Bank02_L9360:  .byte $00, $30, $38, $38, $30, $10, $08, $00, $4E, $03, $00, $20, $20, $10, $08, $00
Bank02_L9370:  .byte $C3, $00, $00, $00, $81, $C3, $C3, $66, $00, $C3, $FF, $3C, $99, $C3, $C3, $66
Bank02_L9380:  .byte $00, $0C, $1C, $1C, $0C, $08, $10, $00, $72, $C0, $00, $04, $04, $08, $10, $00
Bank02_L9390:  .byte $00, $30, $38, $38, $31, $11, $09, $00, $8C, $87, $41, $20, $21, $11, $09, $00
Bank02_L93A0:  .byte $C3, $00, $00, $00, $00, $81, $00, $81, $00, $00, $C3, $7E, $3C, $99, $00, $81
Bank02_L93B0:  .byte $00, $0C, $1C, $1C, $8C, $88, $90, $00, $31, $E1, $82, $04, $84, $88, $90, $00
Bank02_L93C0:  .byte $4A, $BE, $7A, $34, $58, $3C, $3C, $14, $08, $1C, $38, $34, $18, $18, $18, $14
Bank02_L93D0:  .byte $18, $18, $18, $10, $18, $18, $10, $10, $18, $18, $18, $10, $18, $18, $10, $10
Bank02_L93E0:  .byte $00, $00, $03, $07, $01, $00, $00, $80, $1F, $1F, $1F, $1F, $1F, $1F, $0F, $8F
Bank02_L93F0:  .byte $00, $C0, $E0, $E0, $C2, $03, $01, $41, $FF, $DF, $EF, $EF, $CD, $1C, $FE, $FE
Bank02_L9400:  .byte $00, $10, $10, $18, $10, $10, $10, $00, $00, $08, $08, $18, $08, $08, $08, $00
Bank02_L9410:  .byte $00, $00, $00, $10, $1C, $0C, $07, $02, $00, $00, $00, $08, $0C, $0A, $01, $02
Bank02_L9420:  .byte $00, $00, $00, $3E, $08, $00, $00, $00, $00, $00, $00, $08, $3E, $00, $00, $00
Bank02_L9430:  .byte $3C, $7E, $FF, $FF, $FF, $FF, $7E, $3C, $00, $20, $40, $00, $00, $00, $00, $00
Bank02_L9440:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $DE, $FE, $FC, $FC, $FC, $F8, $F8, $F8
Bank02_L9450:  .byte $00, $00, $00, $00, $01, $04, $00, $08, $00, $00, $00, $00, $01, $04, $00, $08
Bank02_L9460:  .byte $00, $3D, $4A, $81, $4A, $3D, $00, $00, $00, $3D, $7A, $FF, $7A, $3D, $00, $00
Bank02_L9470:  .byte $05, $18, $39, $66, $46, $4C, $78, $00, $05, $1A, $3D, $7E, $7E, $7C, $78, $00
Bank02_L9480:  .byte $15, $0A, $11, $1B, $11, $11, $0A, $04, $15, $0E, $15, $1F, $1F, $1F, $0E, $04
Bank02_L9490:  .byte $00, $00, $00, $18, $3C, $10, $0A, $00, $81, $4A, $28, $3C, $FD, $34, $4A, $89
Bank02_L94A0:  .byte $00, $00, $30, $4A, $68, $1D, $20, $08, $00, $00, $30, $7A, $78, $15, $22, $08
Bank02_L94B0:  .byte $00, $10, $00, $00, $0C, $12, $00, $00, $3C, $DF, $E6, $BD, $DF, $DF, $72, $1C
Bank02_L94C0:  .byte $34, $18, $18, $30, $14, $00, $08, $00, $10, $18, $00, $10, $00, $00, $08, $00
Bank02_L94D0:  .byte $18, $10, $10, $10, $00, $10, $00, $10, $18, $10, $10, $10, $00, $10, $00, $10
Bank02_L94E0:  .byte $80, $80, $C0, $70, $59, $CF, $80, $80, $8F, $05, $43, $13, $41, $04, $80, $80
Bank02_L94F0:  .byte $E1, $41, $41, $C2, $83, $03, $03, $04, $BD, $9C, $9E, $1E, $3D, $7C, $B8, $2C
Bank02_L9500:  .byte $00, $42, $3C, $3C, $3C, $3C, $42, $00, $00, $00, $18, $24, $24, $18, $00, $00
Bank02_L9510:  .byte $10, $52, $24, $03, $C0, $24, $4A, $08, $34, $5E, $E5, $43, $C2, $A7, $7A, $2C
Bank02_L9520:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank02_L9530:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank02_L9540:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L9550:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

;----------------------------------------------------------------------------------------------------
.scope

.advance PalPntrTbl_Hi

    .byte >_Palette00         ;($A178)
    .byte >_Palette01         ;($A19C)
    .byte >_Palette02         ;($A1A8)
    .byte >_Palette03         ;($A1A2)
    .byte >_Palette04         ;($A1AE)
    .byte >_Palette05         ;($A1B4)
    .byte >_Palette06         ;($A1D7)
    .byte >_Palette06         ;($A1D7)
    .byte >_Palette06         ;($A1D7)
    .byte >_Palette06         ;($A1D7)
    .byte >_Palette06         ;($A1D7)
    .byte >_Palette06         ;($A1D7)
    .byte >_Palette06         ;($A1D7)
    .byte >_Palette06         ;($A1D7)
    .byte >_Palette06         ;($A1D7)
    .byte >_Palette06         ;($A1D7)
    .byte >_Palette06         ;($A1D7)
    .byte >_Palette06         ;($A1D7)
    .byte >_Palette06         ;($A1D7)
    .byte >_Palette06         ;($A1D7)
    .byte >_Palette07         ;($A1DE)
    .byte >_Palette08         ;($A1E5)
    .byte >_Palette09         ;($A1EC)
    .byte >_Palette0A         ;($A1F3)
    .byte >_Palette0B         ;($A1FB)
    .byte >_Palette0C         ;($A203)
    .byte >_Palette0D         ;($A20B)
    .byte >_Palette0E         ;($A213)

.advance PalPntrTbl_Lo

    .byte <_Palette00         ;($A178)
    .byte <_Palette01         ;($A19C)
    .byte <_Palette02         ;($A1A8)
    .byte <_Palette03         ;($A1A2)
    .byte <_Palette04         ;($A1AE)
    .byte <_Palette05         ;($A1B4)
    .byte <_Palette06         ;($A1D7)
    .byte <_Palette06         ;($A1D7)
    .byte <_Palette06         ;($A1D7)
    .byte <_Palette06         ;($A1D7)
    .byte <_Palette06         ;($A1D7)
    .byte <_Palette06         ;($A1D7)
    .byte <_Palette06         ;($A1D7)
    .byte <_Palette06         ;($A1D7)
    .byte <_Palette06         ;($A1D7)
    .byte <_Palette06         ;($A1D7)
    .byte <_Palette06         ;($A1D7)
    .byte <_Palette06         ;($A1D7)
    .byte <_Palette06         ;($A1D7)
    .byte <_Palette06         ;($A1D7)
    .byte <_Palette07         ;($A1DE)
    .byte <_Palette08         ;($A1E5)
    .byte <_Palette09         ;($A1EC)
    .byte <_Palette0A         ;($A1F3)
    .byte <_Palette0B         ;($A1FB)
    .byte <_Palette0C         ;($A203)
    .byte <_Palette0D         ;($A20B)
    .byte <_Palette0E         ;($A213)

.advance SpecItmsTblPtr

Bank02_L9598:  .word _SpecItmsTbl       ;($A2D9)Beginning of special items table.

; TODO: Figure out how to .advnace by 14 bytes without the need for manual junk
; Not used / Unused

Bank02_L959A: .word $BBBB
Bank02_L959C: .word $0000
Bank02_L959E: .word $0000
Bank02_L95A0: .word $0000
Bank02_L95A2: .word $0000
Bank02_L95A4: .word $0000
Bank02_L95A6: .word $0000

Bank02_L95A8: 
    rts 
    nop 
    nop 
Bank02_L95AB:
    rts 
    nop 
    nop 
Bank02_L95AE:
    rts 
    nop 
    nop 
Bank02_L95B1:
    rts 
    nop 
    nop 
Bank02_L95B4:
    rts 
    nop 
    nop 
Bank02_L95B7:
    rts 
    nop 
    nop 
Bank02_L95BA:
    rts 
    nop 
    nop 
Bank02_L95BD:
    rts 
    nop 
    nop 
Bank02_L95C0:
    rts 
    nop 
    nop 

.advance AreaRoutine

Bank02_L95C3:  JMP $9B9D           ;Area specific routine.

TwosCompliment:
Bank02_L95C6:  EOR #$FF            ;
Bank02_L95C8:  CLC             ;The following routine returns the twos-->
Bank02_L95C9:  ADC #$01            ;compliment of the value stored in A.
Bank02_L95CB:  RTS             ;

Bank02_L95CC:  .byte $FF           ;Not used.

Bank02_L95CD:  .byte $08           ;Norfair music init flag.

Bank02_L95CE:  .byte $00           ;Base damage caused by area enemies to lower health byte.
Bank02_L95CF:  .byte $01           ;Base damage caused by area enemies to upper health byte.

;Special room numbers(used to start item room music).
Bank02_L95D0:  .byte $10, $05, $27, $04, $0F, $FF, $FF

Bank02_L95D7:  .byte $16           ;Samus start x coord on world map.
Bank02_L95D8:  .byte $0D           ;Samus start y coord on world map.
Bank02_L95D9:  .byte $6E           ;Samus start verticle screen position.

Bank02_L95DA:  .byte $01, $00, $03, $77, $53, $57, $55, $59, $5B, $4F

.advance MemuByte
    .byte $32

Bank02_L95E5:  LDA $6B02,X
Bank02_L95E8:  JSR $8024

Bank02_L95EB:  .word $98D3
Bank02_L95ED:  .word $9908
Bank02_L95EF:  .word $98C0
Bank02_L95F1:  .word $9833
Bank02_L95F3:  .word $9833
Bank02_L95F5:  .word $9833
Bank02_L95F7:  .word $9996
Bank02_L95F9:  .word $9850
Bank02_L95FB:  .word $9833
Bank02_L95FD:  .word $9833
Bank02_L95FF:  .word $9833
Bank02_L9601:  .word $9A64
Bank02_L9603:  .word $9AD6
Bank02_L9605:  .word $9AE9
Bank02_L9607:  .word $9B64
Bank02_L9609:  .word $9833

Bank02_L960B:  .byte $28, $28, $28, $28, $30, $30, $00, $00, $00, $00, $00, $00, $75, $75, $84, $82

Bank02_L961B:  .byte $00, $00, $11, $11, $13, $18, $35, $35, $41, $41, $4B, $4B, $00, $00, $00, $00

Bank02_L962B:  .byte $08, $08, $FF, $01, $01, $01, $02, $01, $01, $20, $FF, $FF, $08, $06, $FF, $00

Bank02_L963B:  .byte $22, $22, $22, $22, $2A, $2D, $00, $00, $00, $00, $00, $00, $69, $69, $88, $86

Bank02_L964B:  .byte $00, $00, $05, $08, $13, $18, $20, $20, $3C, $37, $43, $47, $00, $00, $00, $00

Bank02_L965B:  .byte $25, $25, $25, $25, $2A, $2D, $00, $00, $00, $00, $00, $00, $69, $69, $7F, $7C

Bank02_L966B:  .byte $00, $00, $05, $08, $13, $18, $1D, $1D, $3C, $37, $43, $47, $00, $00, $00, $00

Bank02_L967B:  .byte $00, $00, $80, $82, $00, $00, $00, $00, $80, $00, $00, $00, $82, $00, $00, $00

Bank02_L968B:  .byte $89, $89, $00, $42, $00, $00, $04, $80, $80, $81, $00, $00, $05, $89, $00, $00

Bank02_L969B:  .byte $01, $01, $01, $01, $01, $01, $01, $01, $28, $10, $00, $00, $00, $01, $00, $00

Bank02_L96AB:  .byte $05, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $8C, $00, $00

Bank02_L96BB:  .byte $10, $01, $01, $01, $10, $10, $01, $08, $09, $10, $01, $10, $01, $20, $00, $00

Bank02_L96CB:  .byte $12, $14, $00, $00, $00, $00, $02, $02, $00, $04, $06, $09, $0E, $10, $12, $00

Bank02_L96DB:  .word $97E7, $97E7, $97E7, $97E7, $97E7, $97EA, $97ED, $97ED
Bank02_L96EB:  .word $97ED, $97ED, $97ED, $97ED, $97ED, $97ED, $97ED, $97ED
Bank02_L96FB:  .word $97ED, $97ED, $97ED, $97ED, $97ED, $97ED, $97ED, $97ED
Bank02_L970B:  .word $97ED, $97ED, $97ED, $97ED, $97ED, $97ED, $97ED, $97ED
Bank02_L971B:  .word $97ED, $97ED, $97ED, $97ED

Bank02_L9723:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $80, $80, $00, $00, $00, $00, $00, $00
Bank02_L9733:  .byte $00, $00, $E0, $16, $15, $7F, $7F, $7F, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L9743:  .byte $00, $00, $38, $38, $C8, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L9753:  .byte $0C, $0C, $02, $01, $00, $00, $01, $01, $01, $FC, $06, $FE, $FE, $F8, $F9, $FB
Bank02_L9763:  .byte $FD, $00, $00, $00, $00, $02, $01, $01, $00, $00, $FA, $FC, $06, $00, $01, $01
Bank02_L9773:  .byte $01, $00, $01, $01, $03, $00, $00, $00

Bank02_L977B:  .byte $4C, $4C, $01, $00, $00, $00, $00, $40, $00, $64, $44, $44, $40, $00, $00, $00

Bank02_L978B:  .byte $00, $00, $00, $00, $4D, $4D, $53, $57, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_L979B:  .byte $08, $F8, $00, $00, $00, $00, $08, $F8, $00, $00, $00, $F8 

Bank02_L97A7:  .word $97F7, $9806, $9815, $9824, $9B9E, $9BA3, $9BA8, $9BAD
Bank02_L97B7:  .word $9BB2, $9BB7, $9BBC, $9BC1, $9BC6, $9BCB, $9BD0, $9BD5
Bank02_L97C7:  .word $9BDA, $9BDA, $9BDA, $9BDA, $9BDA

Bank02_L97D1:  .byte $00, $02, $00, $09, $00, $0D, $01, $0E, $0F, $03, $00, $01, $02, $03, $00, $10
Bank02_L97E1:  .byte $00, $11, $00, $00, $00, $01

Bank02_L97E7:  .byte $01, $03, $FF

Bank02_L97EA:  .byte $01, $0B, $FF

Bank02_L97ED:  .byte $14, $90, $0A, $00, $FD, $30, $00, $14, $10, $FA

Bank02_L97F7:  .byte $0A, $D3, $07, $B3, $07, $93, $07, $03, $07, $13, $07, $23, $50, $33, $FF

Bank02_L9806:  .byte $09, $C2, $08, $A2, $07, $92, $07, $12, $08, $22, $09, $42, $50, $72, $FF

Bank02_L9815:  .byte $07, $C2, $06, $A2, $05, $92, $05, $12, $06, $22, $07, $42, $50, $72, $FF

Bank02_L9824:  .byte $05, $C2, $04, $A2, $03, $92, $03, $12, $04, $22, $05, $42, $50, $72, $FF

Bank02_L9833:  LDA #$00
Bank02_L9835:  STA $6AF4,X
Bank02_L9838:  RTS

Bank02_L9839:  LDA $81
Bank02_L983B:  CMP #$01
Bank02_L983D:  BEQ $9848
Bank02_L983F:  CMP #$03
Bank02_L9841:  BEQ $984D
Bank02_L9843:  LDA $00
Bank02_L9845:  JMP $8000
Bank02_L9848:  LDA $01
Bank02_L984A:  JMP $8003
Bank02_L984D:  JMP $8006
Bank02_L9850:  LDA $6AF4,X
Bank02_L9853:  CMP #$02
Bank02_L9855:  BNE $988F
Bank02_L9857:  LDA $0403,X
Bank02_L985A:  BNE $988F
Bank02_L985C:  LDA $6AFE,X
Bank02_L985F:  BNE $9873
Bank02_L9861:  LDA $030D
Bank02_L9864:  SEC 
Bank02_L9865:  SBC $0400,X
Bank02_L9868:  CMP #$40
Bank02_L986A:  BCS $988F
Bank02_L986C:  LDA #$7F
Bank02_L986E:  STA $6AFE,X
Bank02_L9871:  BNE $988F
Bank02_L9873:  LDA $0402,X
Bank02_L9876:  BMI $988F
Bank02_L9878:  LDA #$00
Bank02_L987A:  STA $0402,X
Bank02_L987D:  STA $0406,X
Bank02_L9880:  STA $6AFE,X
Bank02_L9883:  LDA $0405,X
Bank02_L9886:  AND #$01
Bank02_L9888:  TAY 
Bank02_L9889:  LDA $98BE,Y
Bank02_L988C:  STA $0403,X
Bank02_L988F:  LDA $0405,X
Bank02_L9892:  ASL 
Bank02_L9893:  BMI $98B3
Bank02_L9895:  LDA $6AF4,X
Bank02_L9898:  CMP #$02
Bank02_L989A:  BNE $98B3
Bank02_L989C:  JSR $8036
Bank02_L989F:  PHA 
Bank02_L98A0:  JSR $8039
Bank02_L98A3:  STA $05
Bank02_L98A5:  PLA 
Bank02_L98A6:  STA $04
Bank02_L98A8:  JSR $9A42
Bank02_L98AB:  JSR $8027
Bank02_L98AE:  BCC $98B8
Bank02_L98B0:  JSR $9A52
Bank02_L98B3:  LDA #$03
Bank02_L98B5:  JMP $8003
Bank02_L98B8:  LDA #$00
Bank02_L98BA:  STA $6AF4,X
Bank02_L98BD:  RTS

Bank02_L98BE:  PHP 
Bank02_L98BF:  SED 
Bank02_L98C0:  LDA $6AF4,X
Bank02_L98C3:  CMP #$03
Bank02_L98C5:  BEQ $98CA
Bank02_L98C7:  JSR $801E
Bank02_L98CA:  LDA #$03
Bank02_L98CC:  STA $00
Bank02_L98CE:  STA $01
Bank02_L98D0:  JMP $9839
Bank02_L98D3:  LDA #$03
Bank02_L98D5:  STA $00
Bank02_L98D7:  LDA #$08
Bank02_L98D9:  STA $01
Bank02_L98DB:  LDA $6AF4,X
Bank02_L98DE:  CMP #$01
Bank02_L98E0:  BNE $98EE
Bank02_L98E2:  LDA $0405,X
Bank02_L98E5:  AND #$10
Bank02_L98E7:  BEQ $98EE
Bank02_L98E9:  LDA #$01
Bank02_L98EB:  JSR $9954
Bank02_L98EE:  JSR $98F4
Bank02_L98F1:  JMP $9839
Bank02_L98F4:  LDA $6AF4,X
Bank02_L98F7:  CMP #$02
Bank02_L98F9:  BNE $9907
Bank02_L98FB:  LDA #$25
Bank02_L98FD:  LDY $0402,X
Bank02_L9900:  BPL $9904
Bank02_L9902:  LDA #$22
Bank02_L9904:  STA $6AF9,X
Bank02_L9907:  RTS

Bank02_L9908:  LDA $81
Bank02_L990A:  CMP #$01
Bank02_L990C:  BEQ $991E
Bank02_L990E:  CMP #$03
Bank02_L9910:  BEQ $9951
Bank02_L9912:  LDA $6AF4,X
Bank02_L9915:  CMP #$01
Bank02_L9917:  BNE $9923
Bank02_L9919:  LDA #$00
Bank02_L991B:  JSR $9954
Bank02_L991E:  LDA #$08
Bank02_L9920:  JMP $8003
Bank02_L9923:  LDA #$80
Bank02_L9925:  STA $6AFE,X
Bank02_L9928:  LDA $0402,X
Bank02_L992B:  BMI $9949
Bank02_L992D:  LDA $0405,X
Bank02_L9930:  AND #$10
Bank02_L9932:  BEQ $9949
Bank02_L9934:  LDA $0400,X
Bank02_L9937:  SEC 
Bank02_L9938:  SBC $030D
Bank02_L993B:  BPL $9940
Bank02_L993D:  JSR TwosCompliment
Bank02_L9940:  CMP #$10
Bank02_L9942:  BCS $9949
Bank02_L9944:  LDA #$00
Bank02_L9946:  STA $6AFE,X
Bank02_L9949:  JSR $98F4
Bank02_L994C:  LDA #$03
Bank02_L994E:  JMP $8000
Bank02_L9951:  JMP $8006
Bank02_L9954:  STA $6B02,X
Bank02_L9957:  LDA $040B,X
Bank02_L995A:  PHA 
Bank02_L995B:  JSR $802A
Bank02_L995E:  PLA 
Bank02_L995F:  STA $040B,X
Bank02_L9962:  RTS

Bank02_L9963:  JSR $801B
Bank02_L9966:  LDA #$06
Bank02_L9968:  STA $00
Bank02_L996A:  JMP $9839
Bank02_L996D:  JSR $801B
Bank02_L9970:  LDA #$06
Bank02_L9972:  STA $00
Bank02_L9974:  JMP $9839
Bank02_L9977:  JSR $801B
Bank02_L997A:  LDA #$06
Bank02_L997C:  STA $00
Bank02_L997E:  LDA $81
Bank02_L9980:  CMP #$02
Bank02_L9982:  BNE $9993
Bank02_L9984:  CMP $6AF4,X
Bank02_L9987:  BNE $9993
Bank02_L9989:  JSR $8009
Bank02_L998C:  AND #$03
Bank02_L998E:  BNE $9993
Bank02_L9990:  JMP $984D
Bank02_L9993:  JMP $9839
Bank02_L9996:  JSR $8009
Bank02_L9999:  AND #$03
Bank02_L999B:  BEQ $99D1
Bank02_L999D:  LDA $81
Bank02_L999F:  CMP #$01
Bank02_L99A1:  BEQ $99D9
Bank02_L99A3:  CMP #$03
Bank02_L99A5:  BEQ $99D6
Bank02_L99A7:  LDA $6AF4,X
Bank02_L99AA:  CMP #$03
Bank02_L99AC:  BEQ $99D1
Bank02_L99AE:  LDA $040A,X
Bank02_L99B1:  AND #$03
Bank02_L99B3:  CMP #$01
Bank02_L99B5:  BNE $99C8
Bank02_L99B7:  LDY $0400,X
Bank02_L99BA:  CPY #$EB
Bank02_L99BC:  BNE $99C8
Bank02_L99BE:  JSR $9A0A
Bank02_L99C1:  LDA #$03
Bank02_L99C3:  STA $040A,X
Bank02_L99C6:  BNE $99CE
Bank02_L99C8:  JSR $9A2F
Bank02_L99CB:  JSR $99F5
Bank02_L99CE:  JSR $9A13
Bank02_L99D1:  LDA #$03
Bank02_L99D3:  JSR $800C
Bank02_L99D6:  JMP $8006
Bank02_L99D9:  JMP $8003
Bank02_L99DC:  LDA $0405,X
Bank02_L99DF:  LSR 
Bank02_L99E0:  LDA $040A,X
Bank02_L99E3:  AND #$03
Bank02_L99E5:  ROL 
Bank02_L99E6:  TAY 
Bank02_L99E7:  LDA $99ED,Y
Bank02_L99EA:  JMP $800F

Bank02_L99ED:  .byte $69, $69, $72, $6C, $6F, $6F, $6C, $72

Bank02_L99F5:  LDX $4B
Bank02_L99F7:  BCS $9A12
Bank02_L99F9:  LDA $00
Bank02_L99FB:  BNE $9A0A
Bank02_L99FD:  LDY $040A,X
Bank02_L9A00:  DEY 
Bank02_L9A01:  TYA 
Bank02_L9A02:  AND #$03
Bank02_L9A04:  STA $040A,X
Bank02_L9A07:  JMP $99DC
Bank02_L9A0A:  LDA $0405,X
Bank02_L9A0D:  EOR #$01
Bank02_L9A0F:  STA $0405,X
Bank02_L9A12:  RTS

Bank02_L9A13:  JSR $9A27
Bank02_L9A16:  JSR $9A2F
Bank02_L9A19:  LDX $4B
Bank02_L9A1B:  BCC $9A26
Bank02_L9A1D:  JSR $9A27
Bank02_L9A20:  STA $040A,X
Bank02_L9A23:  JSR $99DC
Bank02_L9A26:  RTS

Bank02_L9A27:  LDY $040A,X
Bank02_L9A2A:  INY 
Bank02_L9A2B:  TYA 
Bank02_L9A2C:  AND #$03
Bank02_L9A2E:  RTS

Bank02_L9A2F:  LDY $0405,X
Bank02_L9A32:  STY $00
Bank02_L9A34:  LSR $00
Bank02_L9A36:  ROL 
Bank02_L9A37:  ASL 
Bank02_L9A38:  TAY 
Bank02_L9A39:  LDA L8048_Ptr_Table+1,Y
Bank02_L9A3C:  PHA 
Bank02_L9A3D:  LDA L8048_Ptr_Table,Y
Bank02_L9A40:  PHA 
Bank02_L9A41:  RTS

Bank02_L9A42:  LDA $0400,X
Bank02_L9A45:  STA $08
Bank02_L9A47:  LDA $0401,X
Bank02_L9A4A:  STA $09
Bank02_L9A4C:  LDA $6AFB,X
Bank02_L9A4F:  STA $0B
Bank02_L9A51:  RTS

Bank02_L9A52:  LDA $0B
Bank02_L9A54:  AND #$01
Bank02_L9A56:  STA $6AFB,X
Bank02_L9A59:  LDA $08
Bank02_L9A5B:  STA $0400,X
Bank02_L9A5E:  LDA $09
Bank02_L9A60:  STA $0401,X
Bank02_L9A63:  RTS

Bank02_L9A64:  LDA $81
Bank02_L9A66:  CMP #$01
Bank02_L9A68:  BNE $9A88
Bank02_L9A6A:  LDA $6AF4,X
Bank02_L9A6D:  CMP #$03
Bank02_L9A6F:  BEQ $9ACA
Bank02_L9A71:  CMP #$02
Bank02_L9A73:  BNE $9A88
Bank02_L9A75:  LDY $0408,X
Bank02_L9A78:  LDA $9AD2,Y
Bank02_L9A7B:  STA $0402,X
Bank02_L9A7E:  LDA #$40
Bank02_L9A80:  STA $6AFE,X
Bank02_L9A83:  LDA #$00
Bank02_L9A85:  STA $0406,X
Bank02_L9A88:  LDA $6AF4,X
Bank02_L9A8B:  CMP #$03
Bank02_L9A8D:  BEQ $9ACA
Bank02_L9A8F:  LDA $81
Bank02_L9A91:  CMP #$01
Bank02_L9A93:  BEQ $9ACA
Bank02_L9A95:  CMP #$03
Bank02_L9A97:  BEQ $9ACF
Bank02_L9A99:  JSR $8036
Bank02_L9A9C:  LDX $4B
Bank02_L9A9E:  LDA #$00
Bank02_L9AA0:  STA $05
Bank02_L9AA2:  LDA #$1D
Bank02_L9AA4:  LDY $00
Bank02_L9AA6:  STY $04
Bank02_L9AA8:  BMI $9AAC
Bank02_L9AAA:  LDA #$20
Bank02_L9AAC:  STA $6AF9,X
Bank02_L9AAF:  JSR $9A42
Bank02_L9AB2:  JSR $8027
Bank02_L9AB5:  LDA #$E8
Bank02_L9AB7:  BCC $9ABD
Bank02_L9AB9:  CMP $08
Bank02_L9ABB:  BCS $9AC7
Bank02_L9ABD:  STA $08
Bank02_L9ABF:  LDA $0405,X
Bank02_L9AC2:  ORA #$20
Bank02_L9AC4:  STA $0405,X
Bank02_L9AC7:  JSR $9A52
Bank02_L9ACA:  LDA #$02
Bank02_L9ACC:  JMP $8003
Bank02_L9ACF:  JMP $8006
Bank02_L9AD2:  INC $F8,X
Bank02_L9AD4:  INC $FA,X
Bank02_L9AD6:  LDA $6AF4,X
Bank02_L9AD9:  CMP #$02
Bank02_L9ADB:  BNE $9AE0
Bank02_L9ADD:  JSR $801E
Bank02_L9AE0:  LDA #$02
Bank02_L9AE2:  STA $00
Bank02_L9AE4:  STA $01
Bank02_L9AE6:  JMP $9839
Bank02_L9AE9:  LDA $6AF4,X
Bank02_L9AEC:  CMP #$01
Bank02_L9AEE:  BNE $9AF5
Bank02_L9AF0:  LDA #$E8
Bank02_L9AF2:  STA $0400,X
Bank02_L9AF5:  CMP #$02
Bank02_L9AF7:  BNE $9B4F
Bank02_L9AF9:  LDA $0406,X
Bank02_L9AFC:  BEQ $9B4F
Bank02_L9AFE:  LDA $6B01,X
Bank02_L9B01:  BNE $9B4F
Bank02_L9B03:  LDA $2D
Bank02_L9B05:  AND #$1F
Bank02_L9B07:  BNE $9B3C
Bank02_L9B09:  LDA $2E
Bank02_L9B0B:  AND #$03
Bank02_L9B0D:  BEQ $9B59
Bank02_L9B0F:  LDA #$02
Bank02_L9B11:  STA $87
Bank02_L9B13:  LDA #$00
Bank02_L9B15:  STA $88
Bank02_L9B17:  LDA #$43
Bank02_L9B19:  STA $83
Bank02_L9B1B:  LDA #$47
Bank02_L9B1D:  STA $84
Bank02_L9B1F:  LDA #$03
Bank02_L9B21:  STA $85
Bank02_L9B23:  JSR $8021
Bank02_L9B26:  LDA $0680
Bank02_L9B29:  ORA #$04
Bank02_L9B2B:  STA $0680
Bank02_L9B2E:  LDA $0405,X
Bank02_L9B31:  AND #$01
Bank02_L9B33:  TAY 
Bank02_L9B34:  LDA $0083,Y
Bank02_L9B37:  JSR $800F
Bank02_L9B3A:  BEQ $9B59
Bank02_L9B3C:  CMP #$0F
Bank02_L9B3E:  BCC $9B59
Bank02_L9B40:  LDA $0405,X
Bank02_L9B43:  AND #$01
Bank02_L9B45:  TAY 
Bank02_L9B46:  LDA $9B62,Y
Bank02_L9B49:  JSR $800F
Bank02_L9B4C:  JMP $9B59
Bank02_L9B4F:  LDA $6AF4,X
Bank02_L9B52:  CMP #$03
Bank02_L9B54:  BEQ $9B59
Bank02_L9B56:  JSR $801E
Bank02_L9B59:  LDA #$01
Bank02_L9B5B:  STA $00
Bank02_L9B5D:  STA $01
Bank02_L9B5F:  JMP $9839
Bank02_L9B62:  EOR $49
Bank02_L9B64:  LDA #$00
Bank02_L9B66:  STA $6AF5,X
Bank02_L9B69:  STA $6AF6,X
Bank02_L9B6C:  LDA #$10
Bank02_L9B6E:  STA $0405,X
Bank02_L9B71:  TXA 
Bank02_L9B72:  ASL 
Bank02_L9B73:  ASL 
Bank02_L9B74:  STA $00
Bank02_L9B76:  TXA 
Bank02_L9B77:  LSR 
Bank02_L9B78:  LSR 
Bank02_L9B79:  LSR 
Bank02_L9B7A:  LSR 
Bank02_L9B7B:  ADC $2D
Bank02_L9B7D:  ADC $00
Bank02_L9B7F:  AND #$47
Bank02_L9B81:  BNE $9B9D
Bank02_L9B83:  LSR $0405,X
Bank02_L9B86:  LDA #$03
Bank02_L9B88:  STA $87
Bank02_L9B8A:  LDA $2E
Bank02_L9B8C:  LSR 
Bank02_L9B8D:  ROL $0405,X
Bank02_L9B90:  AND #$03
Bank02_L9B92:  BEQ $9B9D
Bank02_L9B94:  STA $88
Bank02_L9B96:  LDA #$02
Bank02_L9B98:  STA $85
Bank02_L9B9A:  JMP $8021
Bank02_L9B9D:  RTS

Bank02_L9B9E:  .byte $22, $FF, $FF, $FF, $FF

Bank02_L9BA3:  .byte $22, $80, $81, $82, $83

Bank02_L9BA8:  .byte $22, $84, $85, $86, $87

Bank02_L9BAD:  .byte $22, $88, $89, $8A, $8B

Bank02_L9BB2:  .byte $22, $8C, $8D, $8E, $8F

Bank02_L9BB7:  .byte $22, $94, $95, $96, $97

Bank02_L9BBC:  .byte $22, $9C, $9D, $9D, $9C

Bank02_L9BC1:  .byte $22, $9E, $9F, $9F, $9E

Bank02_L9BC6:  .byte $22, $90, $91, $92, $93

Bank02_L9BCB:  .byte $22, $70, $71, $72, $73

Bank02_L9BD0:  .byte $22, $74, $75, $75, $74

Bank02_L9BD5:  .byte $22, $76, $76, $76, $76

;------------------------------[ Enemy sprite placement data tables ]--------------------------------

Bank02_L9D94:  .byte $FC, $FC

Bank02_L9D96:  .byte $80, $80, $81, $81, $82, $82, $83, $83, $84, $84, $85, $85, $F4, $F8, $F4, $00
Bank02_L9DA6:  .byte $FC, $F8, $FC, $00, $04, $F8, $04, $00

Bank02_L9DAE:  .byte $F4, $F4, $F4, $04

Bank02_L9DB2:  .byte $F8, $F4, $F8, $FC, $F8, $04, $00, $F8, $00, $00

Bank02_L9DBC:  .byte $FC, $F8, $FC, $00

Bank02_L9DC0:  .byte $F0, $F8, $F0, $00

Bank02_L9DC4:  .byte $F8, $F8, $F8, $00, $00, $F8, $00, $00, $08, $F8, $08, $00

Bank02_L9DD0:  .byte $F8, $E8, $F8, $10, $F8, $F0, $F8, $08

Bank02_L9DD8:  .byte $F8, $F8, $F8, $00, $00, $F8, $00, $00, $F0, $00, $F0, $08, $F8, $08, $F0, $F0
Bank02_L9DE8:  .byte $F0, $F8, $F8, $F0, $00, $F0, $08, $F0, $08, $F8, $00, $08, $08, $00, $08, $08

Bank02_L9DF8:  .byte $F8, $FC, $00, $F8, $F4, $F4, $FC, $F4, $00, $00, $F4, $04, $FC, $04

Bank02_L9E06:  .byte $F8, $FC, $00, $FC

;Enemy frame drawing data.

Bank02_L9E0A:  .byte $00, $02, $02, $14, $FF

Bank02_L9E0F:  .byte $00, $02, $02, $24, $FF

Bank02_L9E14:  .byte $00, $00, $00, $04, $FF

Bank02_L9E19:  .byte $22, $13, $08, $C8, $C9, $C6, $C7, $D6, $D7, $D5, $E5, $E6, $E7, $F5, $F6, $F7
Bank02_L9E29:  .byte $F9, $F8, $FF

Bank02_L9E2C:  .byte $22, $13, $08, $C8, $C9, $C6, $C7, $D6, $D7, $D5, $E5, $E6, $E7, $F5, $F6, $F7
Bank02_L9E3C:  .byte $D8, $FE, $E8, $FF

Bank02_L9E40:  .byte $22, $13, $08, $C8, $C9, $C6, $C7, $D6, $D7, $FE, $D9, $E6, $E7, $E9, $EA, $EB
Bank02_L9E50:  .byte $F9, $F8, $FE, $D5, $FA, $FF

Bank02_L9E56:  .byte $22, $13, $08, $C8, $C9, $C6, $C7, $D6, $D7, $FE, $D9, $E6, $E7, $E9, $EA, $EB
Bank02_L9E66:  .byte $D8, $FE, $E8, $D5, $FA, $FF

Bank02_L9E6C:  .byte $62, $13, $08, $C8, $C9, $C6, $C7, $D6, $D7, $D5, $E5, $E6, $E7, $F5, $F6, $F7
Bank02_L9E7C:  .byte $F9, $F8, $FF

Bank02_L9E7F:  .byte $62, $13, $08, $C8, $C9, $C6, $C7, $D6, $D7, $D5, $E5, $E6, $E7, $F5, $F6, $F7
Bank02_L9E8F:  .byte $D8, $FE, $E8, $FF

Bank02_L9E93:  .byte $62, $13, $08, $C8, $C9, $C6, $C7, $D6, $D7, $FE, $D9, $E6, $E7, $E9, $EA, $EB
Bank02_L9EA3:  .byte $F9, $F8, $FE, $D5, $FA, $FF

Bank02_L9EA9:  .byte $62, $13, $08, $C8, $C9, $C6, $C7, $D6, $D7, $FE, $D9, $E6, $E7, $E9, $EA, $EB
Bank02_L9EB9:  .byte $D8, $FE, $E8, $D5, $FA, $FF

Bank02_L9EBF:  .byte $21, $00, $00, $C6, $C7, $D6, $D7, $E6, $E7, $FF

Bank02_L9EC9:  .byte $20, $04, $04, $EC, $FF

Bank02_L9ECE:  .byte $20, $04, $04, $FB, $FF

Bank02_L9ED3:  .byte $E0, $04, $04, $EC, $FF

Bank02_L9ED8:  .byte $E0, $04, $04, $FB, $FF

Bank02_L9EDD:  .byte $60, $04, $04, $EC, $FF

Bank02_L9EE2:  .byte $60, $04, $04, $FB, $FF

Bank02_L9EE7:  .byte $A0, $04, $04, $EC, $FF

Bank02_L9EEC:  .byte $A0, $04, $04, $FB, $FF

Bank02_L9EF1:  .byte $27, $08, $08, $EA, $FD, $62, $EA, $FD, $22, $FB, $FD, $62, $FB, $FF

Bank02_L9EFF:  .byte $27, $08, $08, $EA, $FD, $62, $EA, $FD, $22, $FA, $FD, $62, $FA, $FF

Bank02_L9F0D:  .byte $27, $08, $08, $EA, $FD, $62, $EA, $FD, $22, $EB, $FD, $62, $EB, $FF

Bank02_L9F1B:  .byte $25, $08, $08, $CE, $CF, $FD, $62, $CE, $FD, $22, $DF, $FD, $62, $DF, $FF

Bank02_L9F2A:  .byte $25, $08, $08, $CE, $CF, $FD, $62, $CE, $FD, $22, $DE, $FD, $62, $DE, $FF

Bank02_L9F39:  .byte $A5, $08, $08, $FD, $22, $CE, $CF, $FD, $62, $CE, $FD, $A2, $DF, $FD, $E2, $DF
Bank02_L9F49:  .byte $FF

Bank02_L9F4A:  .byte $A5, $08, $08, $FD, $22, $CE, $CF, $FD, $62, $CE, $FD, $A2, $DE, $FD, $E2, $DE
Bank02_L9F5A:  .byte $FF

Bank02_L9F5B:  .byte $21, $00, $00, $CE, $CE, $DF, $DF, $FF

Bank02_L9F63:  .byte $39, $04, $08, $F6, $F7, $FF

Bank02_L9F69:  .byte $39, $04, $08, $E7, $F7, $FF

Bank02_L9F6F:  .byte $79, $04, $08, $F6, $F7, $FF

Bank02_L9F75:  .byte $79, $04, $08, $E7, $F7, $FF

Bank02_L9F7B:  .byte $31, $00, $00, $F6, $F7, $FF

Bank02_L9F81:  .byte $29, $04, $08, $E6, $FD, $62, $E6, $FF

Bank02_L9F89:  .byte $29, $04, $08, $E5, $FD, $62, $E5, $FF

Bank02_L9F91:  .byte $21, $00, $00, $EA, $EA, $EB, $EB, $FF

Bank02_L9F99:  .byte $27, $08, $08, $EE, $EF, $FD, $E2, $EF, $FD, $A2, $EF, $FF

Bank02_L9FA5:  .byte $27, $08, $08, $FD, $62, $EF, $FD, $22, $EF, $ED, $FD, $A2, $EF, $FF

Bank02_L9FB3:  .byte $27, $08, $08, $FD, $62, $EF, $FD, $22, $EF, $FD, $E2, $EF, $EE, $FF

Bank02_L9FC1:  .byte $27, $08, $08, $FD, $62, $EF, $FD, $E2, $ED, $EF, $FD, $A2, $EF, $FF

Bank02_L9FCF:  .byte $67, $08, $08, $EE, $EF, $FD, $A2, $EF, $FD, $E2, $EF, $FF

Bank02_L9FDB:  .byte $67, $08, $08, $FD, $22, $EF, $FD, $62, $EF, $ED, $FD, $E2, $EF, $FF

Bank02_L9FE9:  .byte $67, $08, $08, $FD, $22, $EF, $FD, $62, $EF, $FD, $A2, $EF, $EE, $FF

Bank02_L9FF7:  .byte $67, $08, $08, $FD, $22, $EF, $FD, $A2, $ED, $EF, $FD, $E2, $EF, $FF

Bank02_LA005:  .byte $21, $00, $00, $FC, $04, $00, $EE, $EF, $EF, $EF, $FF

Bank02_LA010:  .byte $24, $08, $08, $FC, $08, $00, $C8, $C9, $D8, $D9, $E8, $E9, $F8, $F9, $FF

Bank02_LA01F:  .byte $24, $08, $08, $FC, $08, $00, $C8, $C7, $D8, $D7, $E8, $E9, $F8, $F9, $FF

Bank02_LA02E:  .byte $64, $08, $08, $FC, $08, $00, $C8, $C9, $D8, $D9, $E8, $E9, $F8, $F9, $FF

Bank02_LA03D:  .byte $64, $08, $08, $FC, $08, $00, $C8, $C7, $D8, $D7, $E8, $E9, $F8, $F9, $FF

Bank02_LA04C:  .byte $21, $00, $00, $FC, $FC, $00, $C8, $C9, $D8, $D9, $E8, $E9, $FF

Bank02_LA059:  .byte $37, $04, $04, $E0, $E1, $F0, $F1, $FF

Bank02_LA061:  .byte $B7, $04, $04, $E0, $E1, $F0, $F1, $FF

Bank02_LA069:  .byte $77, $04, $04, $E0, $E1, $F0, $F1, $FF

Bank02_LA071:  .byte $F7, $04, $04, $E0, $E1, $F0, $F1, $FF

Bank02_LA079:  .byte $37, $00, $00, $E2, $FD, $63, $E2, $FF

Bank02_LA081:  .byte $38, $00, $00, $E2, $FD, $62, $E2, $FF

Bank02_LA089:  .byte $38, $00, $00, $FE, $FE, $E2, $FD, $62, $E2, $FF

Bank02_LA093:  .byte $30, $04, $04, $C0, $FF

Bank02_LA098:  .byte $30, $00, $00, $FC, $F8, $00, $D0, $FF

Bank02_LA0A0:  .byte $33, $00, $00, $D1, $FD, $63, $D1, $FF

Bank02_LA0A8:  .byte $27, $08, $08, $CC, $FD, $62, $CC, $FD, $22, $DC, $DD, $FF

Bank02_LA0B4:  .byte $67, $08, $08, $FD, $22, $CD, $FD, $62, $CD, $DC, $DD, $FF

Bank02_LA0C0:  .byte $27, $08, $08, $FD, $A2, $DA, $FD, $22, $CB, $DA, $DB, $FF

Bank02_LA0CC:  .byte $A7, $08, $08, $CA, $CB, $FD, $22, $CA, $FD, $A2, $DB, $FF

Bank02_LA0D8:  .byte $A7, $08, $08, $CC, $FD, $E2, $CC, $FD, $A2, $DC, $DD, $FF

Bank02_LA0E4:  .byte $E7, $08, $08, $FD, $A2, $CD, $FD, $E2, $CD, $DC, $DD, $FF

Bank02_LA0F0:  .byte $67, $08, $08, $FD, $E2, $DA, $FD, $62, $CB, $DA, $DB, $FF

Bank02_LA0FC:  .byte $E7, $08, $08, $CA, $CB, $FD, $62, $CA, $FD, $E2, $DB, $FF

Bank02_LA108:  .byte $21, $00, $00, $CC, $CD, $DC, $DD, $FF

Bank02_LA110:  .byte $0A, $00, $00, $75, $FD, $60, $75, $FD, $A0, $75, $FD, $E0, $75, $FF

Bank02_LA11E:  .byte $0A, $00, $00, $FE, $FE, $FE, $FE, $3D, $3E, $4E, $FD, $60, $3E, $3D, $4E, $FD
Bank02_LA12E:  .byte $E0, $4E, $3E, $3D, $FD, $A0, $4E, $3D, $3E, $FF

Bank02_LA138:  .byte $2A, $08, $08, $C2, $C3, $D2, $D3, $FF

Bank02_LA140:  .byte $2A, $08, $08, $C2, $C4, $D2, $D4, $FF

Bank02_LA148:  .byte $21, $08, $08, $C2, $C4, $D2, $D4, $FF

Bank02_LA150:  .byte $6A, $08, $08, $C2, $C3, $D2, $D3, $FF

Bank02_LA158:  .byte $6A, $08, $08, $C2, $C4, $D2, $D4, $FF

Bank02_LA160:  .byte $61, $08, $08, $C2, $C4, $D2, $D4, $FF

Bank02_LA168:  .byte $0C, $08, $04, $14, $24, $FF

Bank02_LA16E:  .byte $00, $04, $04, $8A, $FF

Bank02_LA173:  .byte $00, $04, $04, $8A, $FF

;-----------------------------------------[ Palette data ]-------------------------------------------

_Palette00:
Bank02_LA178:  .byte $3F           ;Upper byte of PPU palette adress.
Bank02_LA179:  .byte $00           ;Lower byte of PPU palette adress.
Bank02_LA17A:  .byte $20           ;Palette data length.
;The following values are written to the background palette:
Bank02_LA17B:  .byte $0F, $20, $10, $00, $0F, $28, $16, $04, $0F, $16, $11, $04, $0F, $31, $13, $15
;The following values are written to the sprite palette:
Bank02_LA18B:  .byte $0F, $16, $19, $27, $0F, $12, $30, $21, $0F, $14, $23, $2C, $0F, $16, $24, $37

Bank02_LA19B:  .byte $00           ;End Palette00 info.

_Palette01:
Bank02_LA19C:  .byte $3F           ;Upper byte of PPU palette adress.
Bank02_LA19D:  .byte $12           ;Lower byte of PPU palette adress.
Bank02_LA19E:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank02_LA19F:  .byte $19, $27

Bank02_LA1A0:  .byte $00           ;End Palette01 info.

_Palette03:
Bank02_LA1A2:  .byte $3F           ;Upper byte of PPU palette adress.
Bank02_LA1A3:  .byte $12           ;Lower byte of PPU palette adress.
Bank02_LA1A4:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank02_LA1A5:  .byte $2C, $27

Bank02_LA1A7:  .byte $00           ;End Palette02 info.

_Palette02:
Bank02_LA1A8:  .byte $3F           ;Upper byte of PPU palette adress.
Bank02_LA1A9:  .byte $12           ;Lower byte of PPU palette adress.
Bank02_LA1AA:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank02_LA1AB:  .byte $19, $35

Bank02_LA1AD:  .byte $00           ;End Palette03 info.

_Palette04:
Bank02_LA1AE:  .byte $3F           ;Upper byte of PPU palette adress.
Bank02_LA1AF:  .byte $12           ;Lower byte of PPU palette adress.
Bank02_LA1B0:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank02_LA1B1:  .byte $2C, $24

Bank02_LA1B3:  .byte $00           ;End Palette04 info.

_Palette05:
Bank02_LA1B4:  .byte $3F           ;Upper byte of PPU palette adress.
Bank02_LA1B5:  .byte $00           ;Lower byte of PPU palette adress.
Bank02_LA1B6:  .byte $10           ;Palette data length.
;The following values are written to the background palette:
Bank02_LA1B7:  .byte $0F, $20, $10, $00, $0F, $28, $16, $04, $0F, $16, $11, $04, $0F, $35, $1B, $16
Bank02_LAC17:  .byte $3F           ;Upper byte of PPU palette adress.
Bank02_LA1C8:  .byte $14           ;Lower byte of PPU palette adress.
Bank02_LA1C9:  .byte $0C           ;Palette data length.
;The following values are written to the sprite palette:
Bank02_LA1CA:  .byte $0F, $12, $30, $21, $0F, $14, $23, $2C, $0F, $16, $24, $37

Bank02_LA1D6:  .byte $00           ;End Palette05 info.

_Palette06:
Bank02_LA1D7:  .byte $3F           ;Upper byte of PPU palette adress.
Bank02_LA1D8:  .byte $11           ;Lower byte of PPU palette adress.
Bank02_LA1D9:  .byte $03           ;Palette data length.
;The following values are written to the sprite palette:
Bank02_LA1DA:  .byte $04, $09, $07

Bank02_LA1DD:  .byte $00           ;End Palette06 info.

_Palette07:
Bank02_LA1DE:  .byte $3F           ;Upper byte of PPU palette adress.
Bank02_LA1DF:  .byte $11           ;Lower byte of PPU palette adress.
Bank02_LA1E0:  .byte $03           ;Palette data length.
;The following values are written to the sprite palette:
Bank02_LA1E1:  .byte $05, $09, $17

Bank02_LA1E4:  .byte $00           ;End Palette07 info.

_Palette08:
Bank02_LA1E5:  .byte $3F           ;Upper byte of PPU palette adress.
Bank02_LA1E6:  .byte $11           ;Lower byte of PPU palette adress.
Bank02_LA1E7:  .byte $03           ;Palette data length.
;The following values are written to the sprite palette:
Bank02_LA1E8:  .byte $06, $0A, $26

Bank02_LA1EB:  .byte $00           ;End Palette08 info.

_Palette09:
Bank02_LA1EC:  .byte $3F           ;Upper byte of PPU palette adress.
Bank02_LA1ED:  .byte $11           ;Lower byte of PPU palette adress.
Bank02_LA1EE:  .byte $03           ;Palette data length.
;The following values are written to the sprite palette:
Bank02_LA1EF:  .byte $16, $19, $27

Bank02_LA1F2:  .byte $00           ;End Palette09 info.

_Palette0A:
Bank02_LA1F3:  .byte $3F           ;Upper byte of PPU palette adress.
Bank02_LA1F4:  .byte $00           ;Lower byte of PPU palette adress.
Bank02_LA1F5:  .byte $04           ;Palette data length.
;The following values are written to the background palette:
Bank02_LA1F6:  .byte $0F, $30, $30, $21

Bank02_LA1FA:  .byte $00           ;End Palette0A info.

_Palette0B:
Bank02_LA1FB:  .byte $3F           ;Upper byte of PPU palette adress.
Bank02_LA1FC:  .byte $10           ;Lower byte of PPU palette adress.
Bank02_LA1FD:  .byte $04           ;Palette data length.
;The following values are written to the sprite palette:
Bank02_LA1FE:  .byte $0F, $15, $34, $17

Bank02_LA202:  .byte $00           ;End Palette0B info.

_Palette0C:
Bank02_LA203:  .byte $3F           ;Upper byte of PPU palette adress.
Bank02_LA204:  .byte $10           ;Lower byte of PPU palette adress.
Bank02_LA205:  .byte $04           ;Palette data length.
;The following values are written to the sprite palette:
Bank02_LA206:  .byte $0F, $15, $34, $19

Bank02_LA20A:  .byte $00           ;End Palette0C info.

_Palette0D:
Bank02_LA20B:  .byte $3F           ;Upper byte of PPU palette adress.
Bank02_LA20C:  .byte $10           ;Lower byte of PPU palette adress.
Bank02_LA20D:  .byte $04           ;Palette data length.
;The following values are written to the sprite palette:
Bank02_LA20E:  .byte $0F, $15, $34, $28

Bank02_LA212:  .byte $00           ;End Palette0D info.

_Palette0E:
Bank02_LA213:  .byte $3F           ;Upper byte of PPU palette adress.
Bank02_LA214:  .byte $10           ;Lower byte of PPU palette adress.
Bank02_LA215:  .byte $04           ;Palette data length.
;The following values are written to the sprite palette:
Bank02_LA216:  .byte $0F, $15, $34, $29

Bank02_LA21A:  .byte $00           ;End Palette0E info.

;---------------------------------[ Special items table ]-----------------------------------------

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
;
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

;Missiles.
Bank02_LA2D9:  .byte $0A
Bank02_LA2DA:  .word Bank02_LA2E8
Bank02_LA2DC:  .byte $1B, $06, $02, $09, $34, $00

;Missiles.
Bank02_LA2E2:  .byte $1C, $FF, $02, $09, $34, $00

;Elevator from Brinstar.
Bank02_LA2E8:  .byte $0B
Bank02_LA2E9:  .word Bank02_LA302
Bank02_LA2EB:  .byte $16, $05, $04, $81, $00

;Missiles.
Bank02_LA2F0:  .byte $1A, $06, $02, $09, $34, $00

;Missiles.
Bank02_LA2F6:  .byte $1B, $06, $02, $09, $34, $00

;Missiles.
Bank02_LA2FC:  .byte $1C, $FF, $02, $09, $34, $00

;Ice beam.
Bank02_LA302:  .byte $0C
Bank02_LA303:  .word Bank02_LA30B
Bank02_LA305:  .byte $1A, $FF, $02, $07, $37, $00

;Elevator to Brinstar.
Bank02_LA30B:  .byte $0D
Bank02_LA30C:  .word Bank02_LA313
Bank02_LA30E:  .byte $16, $FF, $04, $81, $00

;Missiles.
Bank02_LA313:  .byte $0E
Bank02_LA314:  .word Bank02_LA31C
Bank02_LA316:  .byte $12, $FF, $02, $09, $34, $00

;Missiles and Melias.
Bank02_LA31C:  .byte $0F
Bank02_LA31D:  .word Bank02_LA33B
Bank02_LA31F:  .byte $11, $07, $02, $09, $34, $03, $00

;Missiles.
Bank02_LA326:  .byte $13, $06, $02, $09, $34, $00

;Missiles.
Bank02_LA32C:  .byte $14, $06, $02, $09, $34, $00

;Squeept.
Bank02_LA332:  .byte $15, $FF, $41, $8B, $E9, $51, $02, $9B, $00

;Screw attack.
Bank02_LA33B:  .byte $10
Bank02_LA33C:  .word Bank02_LA344
Bank02_LA33E:  .byte $0F, $FF, $02, $03, $37, $00

;Palette change room.
Bank02_LA344:  .byte $11
Bank02_LA345:  .word Bank02_LA36D
Bank02_LA347:  .byte $16, $04, $0A, $00

;Squeept.
Bank02_LA34B:  .byte $18, $09, $31, $0B, $E9, $41, $02, $9A, $00

;Squeept.
Bank02_LA354:  .byte $19, $09, $21, $8B, $E9, $51, $02, $9A, $00

;High jump.
Bank02_LA35D:  .byte $1B, $06, $02, $01, $37, $00

;Right door.
Bank02_LA363:  .byte $1D, $05, $09, $A0, $00

;Left door.
Bank02_LA368:  .byte $1E, $FF, $09, $B0, $00

;Energy tank.
Bank02_LA36D:  .byte $13
Bank02_LA36E:  .word Bank02_LA376
Bank02_LA370:  .byte $1A, $FF, $02, $08, $42, $00

;Right door.
Bank02_LA376:  .byte $14
Bank02_LA377:  .word Bank02_LA389
Bank02_LA379:  .byte $0D, $05, $09, $A0, $00

;Left door.
Bank02_LA37E:  .byte $0E, $05, $09, $B0, $00

;Missiles.
Bank02_LA383:  .byte $1C, $FF, $02, $09, $34, $00

;Wave beam.
Bank02_LA389:  .byte $15
Bank02_LA38A:  .word Bank02_LA397
Bank02_LA38C:  .byte $12, $06, $02, $06, $37, $00

;Right door(undefined room).
Bank02_LA392:  .byte $17, $FF, $09, $A0, $00

;Missiles.
Bank02_LA397:  .byte $16
Bank02_LA398:  .word $FFFF
Bank02_LA39A:  .byte $13, $06, $02, $09, $34, $00

;Missiles.
Bank02_LA3A0:  .byte $14, $06, $02, $09, $34, $00

;Elevator to Ridley hideout.
Bank02_LA3A6:  .byte $19, $FF, $04, $04, $00

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
Bank02_LA3AB:  .byte $08           ;Attribute table data.
;Room object data:
Bank02_LA3AC:  .byte $40, $01, $08, $48, $01, $08, $50, $04, $08, $5F, $04, $08, $FD
;Enemy/door data.
.byte $02, $A1, $02, $B1, $FF

;Room #$01
Bank02_LA3BE:  .byte $08           ;Attribute table data.
;Room object data:
Bank02_LA3BF:  .byte $07, $02, $08, $87, $02, $08, $FF

;Room #$02
Bank02_LA3C6:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LA3C7:  .byte $00, $0B, $0C, $04, $06, $0C, $08, $06, $0C, $0C, $0B, $0C, $40, $07, $0C, $4E
Bank02_LA3D7:  .byte $07, $0C, $76, $08, $04, $79, $08, $04, $90, $07, $0C, $96, $09, $00, $9E, $07
Bank02_LA3E7:  .byte $0C, $A4, $06, $0C, $A8, $06, $0C, $B7, $0A, $0C, $E0, $06, $0C, $EC, $06, $0C
Bank02_LA3F7:  .byte $FF

;Room #$03
Bank02_LA3F8:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LA3F9:  .byte $00, $07, $0C, $0E, $07, $0C, $2B, $06, $0C, $36, $06, $0C, $50, $03, $08, $5F
Bank02_LA409:  .byte $03, $08, $80, $0B, $0C, $84, $0B, $0C, $88, $0B, $0C, $8C, $0B, $0C, $8D, $17
Bank02_LA419:  .byte $0C, $C0, $0B, $0C, $C4, $0B, $0C, $C8, $0B, $0C, $CC, $0B, $0C, $CD, $17, $0C
Bank02_LA429:  .byte $FD
;Enemy/door data.
Bank02_LA42A:  .byte $02, $A1, $02, $B1, $FF

;Room #$04
Bank02_LA42F:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LA430:  .byte $00, $0D, $00, $08, $0D, $00, $10, $0C, $00, $14, $0C, $00, $1F, $1F, $00, $25
Bank02_LA440:  .byte $0F, $08, $50, $0D, $00, $5F, $04, $08, $63, $0D, $00, $70, $0D, $00, $78, $12
Bank02_LA450:  .byte $00, $80, $11, $00, $88, $12, $00, $89, $0D, $00, $90, $0E, $00, $94, $0D, $00
Bank02_LA460:  .byte $9C, $0E, $00, $B0, $0C, $00, $BF, $0C, $00, $D1, $00, $08, $D7, $00, $08, $FD
;Enemy/door data.
Bank02_LA470:  .byte $02, $A0, $FF

;Room #$05
Bank02_LA473:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LA474:  .byte $00, $07, $0C, $02, $06, $0C, $06, $13, $08, $0A, $14, $08, $0E, $07, $0C, $12
Bank02_LA484:  .byte $0A, $0C, $2B, $0C, $00, $47, $13, $08, $4B, $14, $08, $4E, $0C, $00, $4F, $14
Bank02_LA494:  .byte $08, $50, $03, $08, $6B, $09, $00, $7A, $09, $00, $80, $0D, $00, $87, $02, $08
Bank02_LA4A4:  .byte $89, $0D, $00, $FD
;Enemy/door data.
.byte $02, $B1, $FF

;Room #$06
Bank02_LA4AB:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LA4AC:  .byte $00, $0B, $0C, $04, $0B, $0C, $08, $0B, $0C, $0C, $0B, $0C, $30, $16, $0C, $34
Bank02_LA4BC:  .byte $16, $0C, $38, $16, $0C, $3C, $16, $0C, $40, $0B, $0C, $44, $0B, $0C, $48, $0B
Bank02_LA4CC:  .byte $0C, $4C, $0B, $0C, $80, $16, $0C, $84, $16, $0C, $88, $16, $0C, $8C, $16, $0C
Bank02_LA4DC:  .byte $90, $0B, $0C, $94, $0B, $0C, $98, $0B, $0C, $9C, $0B, $0C, $D0, $0B, $0C, $D4
Bank02_LA4EC:  .byte $0B, $0C, $D8, $0B, $0C, $DC, $0B, $0C, $FF

;Room #$07
Bank02_LA4F5:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LA4F6:  .byte $00, $0B, $0C, $04, $0B, $0C, $08, $0B, $0C, $0C, $0B, $0C, $40, $0B, $0C, $44
Bank02_LA506:  .byte $0B, $0C, $48, $0B, $0C, $4C, $0B, $0C, $74, $0B, $0C, $80, $0B, $0C, $88, $0B
Bank02_LA516:  .byte $0C, $8C, $0B, $0C, $B0, $0B, $0C, $B4, $0B, $0C, $BC, $0B, $0C, $C8, $0B, $0C
Bank02_LA526:  .byte $FF

;Room #$08
Bank02_LA527:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LA528:  .byte $00, $07, $0C, $08, $06, $0C, $0E, $07, $0C, $1D, $18, $04, $32, $06, $0C, $50
Bank02_LA538:  .byte $07, $0C, $5F, $03, $08, $86, $10, $04, $8D, $18, $04, $8E, $07, $0C, $A0, $07
Bank02_LA548:  .byte $0C, $A9, $10, $04, $BE, $0B, $0C, $CD, $18, $04, $FD
;Enemy/door data.
Bank02_LA553:  .byte $02, $A1, $41, $02, $8B, $51, $06, $76, $21, $82, $A3, $FF

;Room #$09
Bank02_LA55F:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LA560:  .byte $00, $07, $0C, $0E, $0B, $0C, $2A, $06, $0C, $33, $06, $0C, $35, $06, $0C, $43
Bank02_LA570:  .byte $0A, $0C, $4E, $0B, $0C, $50, $07, $0C, $6E, $07, $0C, $80, $07, $0C, $87, $06
Bank02_LA580:  .byte $0C, $97, $0A, $0C, $BE, $0B, $0C, $C0, $07, $0C, $D4, $06, $0C, $FD
;Enemy/door data.
Bank02_LA58E:  .byte $01, $86, $25, $11, $82, $C5, $41, $06, $79, $FF

;Room #$0A
Bank02_LA598:  .byte $08           ;Attribute table data.
;Room object data:
Bank02_LA599:  .byte $00, $07, $0C, $05, $06, $0C, $0C, $18, $04, $0E, $07, $0C, $40, $07, $0C, $57
Bank02_LA5A9:  .byte $06, $0C, $5F, $03, $08, $80, $0B, $0C, $84, $00, $08, $8C, $0B, $0C, $A4, $17
Bank02_LA5B9:  .byte $0C, $A5, $0B, $0C, $A9, $0B, $0C, $C0, $0B, $0C, $C9, $0B, $0C, $CD, $0B, $0C
Bank02_LA5C9:  .byte $D4, $17, $0C, $E5, $0B, $0C, $FD
;Enemy/door data.
Bank02_LA5D0:  .byte $02, $A1, $31, $02, $36, $41, $86, $48, $FF

;Room #$0B
Bank02_LA5D9:  .byte $04           ;Attribute table data.
;Room object data:
Bank02_LA5DA:  .byte $00, $07, $0C, $0E, $07, $0C, $12, $06, $0C, $39, $06, $0C, $50, $03, $08, $5E
Bank02_LA5EA:  .byte $0B, $0C, $80, $0B, $0C, $84, $0B, $0C, $88, $0B, $0C, $8C, $17, $0C, $8D, $0B
Bank02_LA5FA:  .byte $0C, $B0, $0B, $0C, $B8, $0B, $0C, $BC, $17, $0C, $BD, $0B, $0C, $C4, $0B, $0C
Bank02_LA60A:  .byte $EC, $17, $0C, $FD
;Enemy/door data.
Bank02_LA60E:  .byte $02, $B1, $41, $06, $2B, $51, $02, $1A, $FF

;Room #$0C
Bank02_LA617:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LA618:  .byte $00, $07, $0C, $0D, $18, $04, $0E, $07, $0C, $4D, $18, $04, $50, $07, $0C, $5E
Bank02_LA628:  .byte $07, $0C, $8D, $18, $04, $A0, $07, $0C, $AE, $07, $0C, $CD, $18, $04, $FD
;Enemy/door data.
Bank02_LA637:  .byte $01, $02, $33, $31, $82, $88, $FF

;Room #$0D
Bank02_LA63E:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LA63F:  .byte $10, $0B, $0C, $14, $0B, $0C, $18, $0B, $0C, $1C, $0B, $0C, $50, $03, $08, $5F
Bank02_LA64F:  .byte $03, $08, $80, $07, $0C, $81, $17, $0C, $82, $06, $0C, $86, $06, $0C, $8A, $06
Bank02_LA65F:  .byte $0C, $8E, $07, $0C, $97, $0A, $0C, $C0, $0B, $0C, $CC, $0B, $0C, $D4, $19, $08
Bank02_LA66F:  .byte $FD
;Enemy/door data.
Bank02_LA670:  .byte $02, $A1, $02, $B1, $21, $0D, $E5, $FF

;Room #$0E
Bank02_LA678:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LA679:  .byte $00, $07, $0C, $0E, $07, $0C, $2B, $06, $0C, $30, $06, $0C, $4A, $06, $0C, $50
Bank02_LA689:  .byte $03, $08, $5E, $07, $0C, $80, $07, $0C, $81, $06, $0C, $AE, $07, $0C, $B0, $07
Bank02_LA699:  .byte $0C, $B5, $06, $0C, $FD
;Enemy/door data.
Bank02_LA69E:  .byte $02, $B1, $11, $86, $A6, $31, $02, $EA, $21, $02, $39, $FF

;Room #$0F
Bank02_LA6AA:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LA6AB:  .byte $00, $0E, $00, $04, $0D, $00, $0C, $0D, $00, $10, $0C, $00, $50, $04, $08, $80
Bank02_LA6BB:  .byte $09, $00, $90, $0C, $00, $92, $09, $00, $AF, $09, $00, $B9, $09, $00, $D0, $0E
Bank02_LA6CB:  .byte $00, $D3, $00, $08, $DB, $00, $08, $FD
;Enemy/door data.
Bank02_LA6D3:  .byte $02, $B0, $01, $0D, $E7, $11, $8D, $ED, $31, $06, $AA, $FF

;Room #$10
Bank02_LA6DF:  .byte $04           ;Attribute table data.
;Room object data:
Bank02_LA6E0:  .byte $00, $0D, $00, $04, $0D, $00, $0C, $0E, $00, $1F, $0C, $00, $5F, $03, $08, $8C
Bank02_LA6F0:  .byte $09, $00, $94, $09, $00, $9F, $0C, $00, $D0, $00, $08, $D5, $00, $08, $DD, $0E
Bank02_LA700:  .byte $00, $FD
;Enemy/door data.
Bank02_LA702:  .byte $02, $A1, $21, $0D, $E2, $41, $0D, $EA, $31, $06, $85, $FF

;Room #$11
Bank02_LA70E:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LA70F:  .byte $10, $0B, $0C, $14, $0B, $0C, $18, $0B, $0C, $1C, $0B, $0C, $50, $03, $08, $5C
Bank02_LA71F:  .byte $0B, $0C, $80, $07, $0C, $81, $17, $0C, $82, $06, $0C, $86, $06, $0C, $8A, $06
Bank02_LA72F:  .byte $0C, $8C, $0B, $0C, $B0, $0B, $0C, $B4, $19, $08, $BC, $17, $0C, $CD, $0B, $0C
Bank02_LA73F:  .byte $D4, $0B, $0C, $D8, $0B, $0C, $FD
;Enemy/door data.
Bank02_LA746:  .byte $02, $B1, $FF

;Room #$12
Bank02_LA749:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LA74A:  .byte $00, $2D, $0C, $08, $2D, $0C, $10, $1B, $0C, $14, $0A, $0C, $50, $03, $08, $80
Bank02_LA75A:  .byte $1B, $0C, $9A, $1C, $0C, $B0, $1B, $0C, $B6, $1C, $0C, $BE, $1C, $0C, $C4, $1C
Bank02_LA76A:  .byte $0C, $D4, $00, $08, $D9, $00, $08, $FD
;Enemy/door data.
Bank02_LA772:  .byte $02, $B1, $01, $00, $1C, $41, $00, $18, $21, $0D, $EC, $FF

;Room #$13
Bank02_LA77E:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LA77F:  .byte $00, $2D, $0C, $08, $2D, $0C, $12, $0A, $0C, $1E, $1B, $0C, $5F, $03, $08, $69
Bank02_LA78F:  .byte $1C, $0C, $8D, $1B, $0C, $A3, $1D, $0C, $B0, $1C, $0C, $CE, $1B, $0C, $D0, $00
Bank02_LA79F:  .byte $08, $D6, $00, $08, $FD
;Enemy/door data.
Bank02_LA7A4:  .byte $02, $A1, $51, $80, $24, $41, $0D, $E2, $31, $86, $94, $11, $86, $69, $FF

;Room #$14
Bank02_LA7B3:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LA7B4:  .byte $00, $2D, $0C, $08, $2D, $0C, $16, $0A, $0C, $30, $1A, $04, $32, $1A, $04, $3A
Bank02_LA7C4:  .byte $1A, $04, $3E, $1A, $04, $50, $1A, $04, $52, $1A, $04, $5A, $1A, $04, $5E, $1A
Bank02_LA7D4:  .byte $04, $B7, $1C, $0C, $D0, $00, $08, $D8, $00, $08, $FD
;Enemy/door data.
Bank02_LA7DF:  .byte $31, $0D, $E6, $51, $8D, $EB, $FF

;Room #$15
Bank02_LA7E6:  .byte $04           ;Attribute table data.
;Room object data:
Bank02_LA7E7:  .byte $00, $2D, $0C, $08, $2D, $0C, $1C, $0A, $0C, $52, $1C, $0C, $58, $1C, $0C, $5A
Bank02_LA7F7:  .byte $1C, $0C, $64, $1C, $0C, $86, $1C, $0C, $8C, $1C, $0C, $8E, $1C, $0C, $A0, $1C
Bank02_LA807:  .byte $0C, $D0, $1B, $0C, $D3, $00, $08, $D4, $1B, $0C, $D7, $00, $08, $DA, $1B, $0C
Bank02_LA817:  .byte $DD, $00, $08, $DE, $1B, $0C, $FD
;Enemy/door data.
Bank02_LA81E:  .byte $31, $0C, $1B, $01, $86, $54, $21, $86, $48, $51, $06, $7C, $FF

;Room #$16
Bank02_LA82B:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LA82C:  .byte $00, $2D, $0C, $08, $2D, $0C, $12, $0A, $0C, $1C, $0A, $0C, $A2, $1D, $0C, $AB
Bank02_LA83C:  .byte $1D, $0C, $D0, $00, $08, $D8, $00, $08, $FD
;Enemy/door data.
Bank02_LA845:  .byte $01, $0D, $E8, $11, $86, $94, $21, $86, $9C, $51, $00, $18, $FF

;Room #$17
Bank02_LA852:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LA853:  .byte $00, $2D, $0C, $08, $2D, $0C, $16, $0A, $0C, $80, $2D, $0C, $8A, $2D, $0C, $91
Bank02_LA863:  .byte $0A, $0C, $B8, $05, $04, $C7, $1D, $0C, $D0, $00, $08, $D8, $00, $08, $FD
;Enemy/door data.
Bank02_LA872:  .byte $41, $06, $73, $51, $86, $7C, $31, $00, $27, $27, $87, $B9, $FF

;Room #$18
Bank02_LA87F:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LA880:  .byte $00, $2D, $0C, $08, $2D, $0C, $1A, $0A, $0C, $24, $1C, $0C, $3E, $18, $04, $54
Bank02_LA890:  .byte $18, $04, $7E, $18, $04, $A2, $1C, $0C, $A7, $1D, $0C, $BE, $1C, $0C, $D0, $00
Bank02_LA8A0:  .byte $08, $D8, $00, $08, $FD
;Enemy/door data.
Bank02_LA8A5:  .byte $31, $00, $17, $41, $06, $97, $21, $8B, $E6, $01, $0D, $EC, $FF

;Room #$19
Bank02_LA8B2:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LA8B3:  .byte $00, $0D, $00, $08, $0D, $00, $10, $1F, $00, $44, $1F, $00, $80, $12, $00, $81
Bank02_LA8C3:  .byte $0D, $00, $90, $1F, $00, $98, $1F, $00, $AE, $0D, $00, $BB, $1F, $00, $D0, $00
Bank02_LA8D3:  .byte $08, $D8, $00, $08, $FD
;Enemy/door data.
Bank02_LA8D8:  .byte $31, $80, $17, $FF

;Room #$1A
Bank02_LA8DC:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LA8DD:  .byte $00, $30, $04, $08, $30, $04, $80, $0D, $00, $84, $05, $08, $86, $05, $08, $88
Bank02_LA8ED:  .byte $0D, $00, $8C, $20, $04, $94, $20, $04, $D0, $00, $08, $D8, $00, $08, $FD
;Enemy/door data.
Bank02_LA8FC:  .byte $27, $87, $85, $37, $87, $87, $41, $00, $29, $51, $00, $2C, $FF

;Room #$1B
Bank02_LA909:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LA90A:  .byte $00, $20, $04, $04, $20, $04, $08, $20, $04, $0C, $2E, $04, $10, $2E, $04, $4C
Bank02_LA91A:  .byte $2E, $04, $50, $03, $08, $80, $2E, $04, $8C, $21, $04, $98, $20, $04, $9C, $2E
Bank02_LA92A:  .byte $04, $A2, $20, $04, $C0, $2E, $04, $D2, $00, $08, $DA, $00, $08, $FD
;Enemy/door data.
Bank02_LA938:  .byte $02, $B1, $01, $0C, $98, $31, $8C, $3A, $11, $0C, $38, $41, $8B, $E6, $FF

;Room #$1C
Bank02_LA947:  .byte $08           ;Attribute table data.
;Room object data:
Bank02_LA948:  .byte $00, $22, $08, $04, $22, $08, $08, $22, $08, $0C, $22, $08, $1C, $22, $08, $5F
Bank02_LA958:  .byte $03, $08, $8C, $22, $08, $A8, $22, $08, $B0, $22, $08, $B1, $23, $04, $B4, $22
Bank02_LA968:  .byte $08, $D0, $00, $08, $D8, $00, $08, $FD
;Enemy/door data.
Bank02_LA970:  .byte $02, $A1, $41, $0E, $B1, $31, $00, $49, $FF

;Room #$1D
Bank02_LA979:  .byte $08           ;Attribute table data.
;Room object data:
Bank02_LA97A:  .byte $00, $22, $08, $04, $22, $08, $08, $22, $08, $0C, $22, $08, $10, $22, $08, $50
Bank02_LA98A:  .byte $03, $08, $80, $22, $08, $B4, $22, $08, $B8, $22, $08, $BC, $22, $08, $BD, $23
Bank02_LA999:  .byte $04, $D0, $00, $08, $D8, $00, $08, $FD
;Enemy/door data.
Bank02_LA9A2:  .byte $02, $B1, $01, $0E, $BD, $21, $00, $49, $FF

;Room #$1E
Bank02_LA9AB:  .byte $08           ;Attribute table data.
;Room object data:
Bank02_LA9AC:  .byte $00, $22, $08, $04, $22, $08, $08, $22, $08, $0C, $22, $08, $B6, $22, $08, $B7
Bank02_LA9BC:  .byte $23, $04, $C1, $22, $08, $CB, $22, $08, $D0, $00, $08, $D8, $00, $08, $FD
;Enemy/door data.
Bank02_LA9CB:  .byte $51, $0E, $B7, $11, $06, $BD, $31, $86, $B3, $FF

;Room #$1F
Bank02_LA9D5:  .byte $08           ;Attribute table data.
;Room object data:
Bank02_LA9D6:  .byte $00, $22, $08, $04, $22, $08, $08, $22, $08, $0C, $22, $08, $90, $22, $08, $9C
Bank02_LA9E6:  .byte $22, $08, $A7, $23, $04, $B4, $22, $08, $B8, $22, $08, $D0, $00, $08, $D8, $00
Bank02_LA9F6:  .byte $08, $FD
;Enemy/door data.
Bank02_LA9F8:  .byte $41, $0E, $A7, $11, $02, $99, $FF

;Room #$20
Bank02_LA9FF:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LAA00:  .byte $00, $2F, $0C, $08, $2F, $0C, $0B, $06, $0C, $1C, $26, $0C, $21, $25, $0C, $22
Bank02_LAA10:  .byte $06, $0C, $5F, $04, $08, $8C, $26, $0C, $B0, $25, $0C, $B3, $23, $04, $B7, $24
Bank02_LAA20:  .byte $0C, $C2, $26, $0C, $CE, $26, $0C, $D0, $00, $08, $D6, $00, $08, $FD
;Enemy/door data.
Bank02_LAA2E:  .byte $02, $A1, $41, $0E, $B3, $11, $86, $A9, $21, $0C, $43, $01, $0B, $EB, $FF

;Room #$21
Bank02_LAA3D:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LAA3E:  .byte $00, $2F, $0C, $08, $2F, $0C, $10, $26, $0C, $19, $06, $0C, $50, $03, $08, $80
Bank02_LAA4E:  .byte $26, $0C, $AA, $25, $0C, $B3, $24, $0C, $CE, $24, $0C, $D0, $00, $08, $D8, $00
Bank02_LAA5E:  .byte $08, $FD
;Enemy/door data.
Bank02_LAA60:  .byte $02, $B1, $31, $06, $BE, $51, $86, $9A, $41, $0C, $77, $21, $0C, $38, $FF

;Room #$22
Bank02_LAA6F:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LAA70:  .byte $00, $2F, $0C, $08, $2F, $0C, $14, $06, $0C, $17, $24, $0C, $1E, $26, $0C, $23
Bank02_LAA80:  .byte $25, $0C, $5F, $03, $08, $8D, $26, $0C, $C2, $24, $0C, $C7, $24, $0C, $CC, $26
Bank02_LAA90:  .byte $0C, $D0, $00, $08, $D6, $00, $08, $FD
;Enemy/door data.
Bank02_LAA98:  .byte $02, $A1, $01, $86, $B4, $11, $86, $B8, $21, $0C, $59, $31, $0C, $55, $FF

;Room #$23
Bank02_LAAA7:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LAAA8:  .byte $00, $2F, $0C, $08, $2F, $0C, $14, $06, $0C, $8D, $24, $0C, $8F, $29, $0C, $97
Bank02_LAAB8:  .byte $24, $0C, $B1, $24, $0C, $B2, $05, $04, $D0, $00, $08, $D8, $00, $08, $FD
;Enemy/door data.
Bank02_LAAC7:  .byte $31, $86, $88, $41, $06, $7C, $51, $00, $29, $17, $87, $B3, $FF

;Room #$24
Bank02_LAAD4:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LAAD5:  .byte $00, $2F, $0C, $08, $2F, $0C, $50, $2A, $0C, $56, $2A, $0C, $63, $2A, $0C, $6E
Bank02_LAAE5:  .byte $2A, $0C, $78, $2A, $0C, $8C, $2A, $0C, $9F, $2A, $0C, $A1, $2A, $0C, $A5, $2A
Bank02_LAAF5:  .byte $0C, $BA, $2A, $0C, $C7, $2A, $0C, $D0, $00, $08, $D8, $00, $08, $FD
;Enemy/door data.
Bank02_LAB03:  .byte $01, $0D, $E8, $21, $8B, $ED, $31, $0B, $E9, $FF

;Room #$25
Bank02_LAB0D:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LAB0E:  .byte $00, $2F, $0C, $08, $2F, $0C, $0A, $25, $0C, $90, $2F, $0C, $99, $05, $04, $9B
Bank02_LAB1E:  .byte $24, $0C, $9F, $06, $0C, $A7, $06, $0C, $D0, $00, $08, $D8, $00, $08, $FD
;Enemy/door data.
Bank02_LAB2D:  .byte $01, $0C, $27, $37, $07, $9A, $FF

;Room #$26
Bank02_LAB34:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LAB35:  .byte $00, $0E, $00, $04, $0D, $00, $0C, $0E, $00, $20, $0C, $00, $2F, $0C, $00, $52
Bank02_LAB45:  .byte $1F, $00, $60, $28, $0C, $64, $1F, $00, $6F, $25, $0C, $7F, $29, $0C, $8E, $1F
Bank02_LAB55:  .byte $00, $97, $1F, $00, $CB, $1F, $00, $D0, $00, $08, $D8, $00, $08, $FD
;Enemy/door data.
Bank02_LAB63:  .byte $31, $86, $54, $41, $86, $87, $51, $0D, $E9, $01, $8B, $E5, $FF

;Room #$27
Bank02_LAB70:  .byte $08           ;Attribute table data.
;Room object data:
Bank02_LAB71:  .byte $00, $20, $04, $04, $20, $04, $08, $20, $04, $0C, $20, $04, $10, $2C, $04, $50
Bank02_LAB81:  .byte $04, $08, $80, $2C, $04, $81, $15, $0C, $87, $27, $0C, $8A, $27, $0C, $8C, $27
Bank02_LAB91:  .byte $0C, $8E, $27, $0C, $C0, $2C, $04, $D2, $00, $08, $DA, $00, $08, $FD
;Enemy/door data.
Bank02_LAB9F:  .byte $02, $B1, $51, $0D, $E9, $FF

;Room #$28
Bank02_LABA5:  .byte $08           ;Attribute table data.
;Room object data:
Bank02_LABA6:  .byte $00, $30, $04, $08, $30, $04, $10, $2C, $04, $17, $15, $0C, $50, $03, $08, $80
Bank02_LABB6:  .byte $20, $04, $86, $2B, $00, $8A, $2B, $00, $A0, $2C, $04, $BC, $2B, $00, $D2, $00
Bank02_LABC6:  .byte $08, $DA, $00, $08, $E0, $2C, $04, $FD
;Enemy/door data.
Bank02_LABCE:  .byte $02, $B1, $01, $06, $77, $11, $86, $7C, $21, $00, $2A, $FF

;Room #$29
Bank02_LABDA:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LABDB:  .byte $00, $30, $04, $05, $15, $0C, $08, $30, $04, $50, $2B, $00, $55, $2B, $00, $6B
Bank02_LABEB:  .byte $2B, $00, $91, $2B, $00, $A8, $2B, $00, $B3, $2B, $00, $CC, $2B, $00, $D0, $00
Bank02_LABFB:  .byte $08, $D8, $00, $08, $FD
;Enemy/door data.
Bank02_LAC00:  .byte $41, $06, $43, $51, $86, $47, $31, $06, $84, $21, $86, $99, $FF

;Room #$2A
Bank02_LAC0D:  .byte $08           ;Attribute table data.
;Room object data:
Bank02_LAC0E:  .byte $00, $30, $04, $08, $30, $04, $15, $15, $0C, $1E, $2C, $04, $5F, $03, $08, $8C
Bank02_LAC1E:  .byte $20, $04, $97, $2B, $00, $AE, $2C, $04, $C2, $2B, $00, $D0, $00, $08, $D6, $00
Bank02_LAC2E:  .byte $08, $EE, $2C, $04, $FD
;Enemy/door data.
Bank02_LAC33:  .byte $02, $A1, $21, $86, $88, $31, $86, $B3, $41, $0B, $E0, $51, $8B, $EB, $FF

;Room #$2B
Bank02_LAC42:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LAC43:  .byte $00, $30, $04, $08, $30, $04, $2B, $18, $04, $55, $18, $04, $6B, $18, $04, $95
Bank02_LAC53:  .byte $18, $04, $A0, $2C, $04, $AE, $2C, $04, $B8, $2C, $04, $D0, $00, $08, $D8, $00
Bank02_LAC63:  .byte $08, $FD
;Enemy/door data.
Bank02_LAC65:  .byte $31, $86, $45, $21, $06, $A9, $11, $86, $9E, $01, $0B, $E3, $FF

;Room #$2C
Bank02_LAC72:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LAC73:  .byte $00, $30, $04, $08, $30, $04, $46, $2C, $04, $86, $2C, $04, $94, $20, $04, $AF
Bank02_LAC83:  .byte $20, $04, $C0, $30, $04, $CB, $20, $04, $D0, $00, $08, $D5, $20, $04, $D9, $00
Bank02_LAC93:  .byte $08, $FD
;Enemy/door data.
Bank02_LAC95:  .byte $01, $0C, $59, $FF

;Room #$2D
Bank02_LAC99:  .byte $0C           ;Attribute table data.
;Room object data:
Bank02_LAC9A:  .byte $00, $07, $0C, $0E, $07, $0C, $19, $06, $0C, $44, $06, $0C, $50, $07, $0C, $5E
Bank02_LACAA:  .byte $07, $0C, $93, $06, $0C, $A0, $07, $0C, $AE, $07, $0C, $C7, $06, $0C, $FF

;---------------------------------------[ Structure definitions ]------------------------------------

;The first byte of the structure definition states how many macros are in the first row of the
;structure. The the number of bytes after the macro number byte is equal to the value of the macro
;number byte and those bytes define what each macro in the row are. For example, if the macro number
;byte is #$08, the next 8 bytes represent 8 macros. The macro description bytes are the macro numbers
;and are multiplied by 4 to find the index to the desired macro in MacroDefs.  Any further bytes in
;the structure definition represent the next rows.  #$FF marks the end of the structure definition.

;Structure #$00
Bank02_LACB9:  .byte $08, $01, $01, $01, $01, $01, $01, $01, $01, $08, $00, $00, $00, $00, $00, $00
Bank02_LACC9:  .byte $00, $00, $FF

;Structure #$01
Bank02_LACCC:  .byte $08, $02, $02, $02, $02, $02, $02, $02, $02, $01, $0A, $01, $0A, $01, $0A, $08
Bank02_LACDC:  .byte $02, $02, $02, $02, $02, $02, $02, $02, $FF

;Structure #$02
Bank02_LACE5:  .byte $02, $04, $05, $02, $04, $05, $02, $04, $05, $02, $04, $05, $02, $04, $05, $02
Bank02_LACF5:  .byte $04, $05, $02, $04, $05, $02, $04, $05, $FF

;Structure #$03
Bank02_LACFE:  .byte $01, $06, $01, $06, $01, $06, $FF

;Structure #$04
Bank02_LAD05:  .byte $01, $07, $01, $07, $01, $07, $FF

;Structure #$05
Bank02_LAD0C:  .byte $02, $08, $09, $FF

;Structure #$06
Bank02_LAD10:  .byte $04, $0B, $0B, $0B, $0B, $FF

;Structure #$07
Bank02_LAD16:  .byte $02, $0B, $0F, $02, $0C, $0B, $02, $0F, $0C, $02, $0B, $0B, $02, $0C, $0F, $FF 

;Structure #$08
Bank02_LAD26:  .byte $01, $0D, $01, $0E, $FF

;Structure #$09
Bank02_LAD2B:  .byte $04, $10, $10, $10, $10, $FF

;Structure #$0A
Bank02_LAD31:  .byte $04, $12, $13, $11, $13, $01, $13, $FF

;Structure #$0B
Bank02_LAD39:  .byte $04, $0F, $0C, $0C, $0B, $04, $0B, $0F, $0B, $0C, $04, $0C, $0F, $0C, $0B, $04
Bank02_LAD49:  .byte $0F, $0B, $0F, $0C, $FF

;Structure #$0C
Bank02_LAD4E:  .byte $01, $1F, $01, $1F, $01, $1F, $01, $1F, $FF

;Structure #$0D
Bank02_LAD57:  .byte $08, $20, $20, $20, $20, $20, $20, $20, $20, $FF

;Structure #$0E
Bank02_LAD61:  .byte $04, $21, $21, $21, $21, $04, $21, $21, $21, $21, $FF

;Structure #$0F
Bank02_LAD6C:  .byte $02, $15, $18, $03, $16, $19, $1E, $03, $17, $1A, $1B, $FF

;Structure #$10
Bank02_LAD78:  .byte $01, $1E, $FF

;Structure #$11
Bank02_LAD7B:  .byte $08, $22, $22, $22, $22, $22, $22, $22, $22, $FF

;Structure #$12
Bank02_LAD85:  .byte $01, $23, $FF

;Structure #$13
Bank02_LAD88:  .byte $04, $24, $26, $26, $26, $04, $25, $26, $26, $26, $13, $27, $26, $26, $04, $28
Bank02_LAD98:  .byte $29, $26, $2A, $FF

;Structure #$14
Bank02_LAD9C:  .byte $04, $26, $26, $26, $26, $04, $26, $26, $26, $26, $04, $26, $26, $26, $26, $04
Bank02_LADAC:  .byte $26, $26, $26, $26, $FF

;Structure #$15
Bank02_LADB1:  .byte $04, $0F, $0F, $0F, $0F, $FF

;Structure #$16
Bank02_LADB7:  .byte $04, $2D, $3D, $2C, $3D, $FF

;Structure #$17
Bank02_LADBD:  .byte $01, $2D, $01, $3D, $01, $2C, $01, $3D, $FF

;Structure #$18
Bank02_LADC6:  .byte $01, $1D, $01, $1D, $01, $1D, $01, $1D, $FF

;Structure #$19
Bank02_LADCF:  .byte $08, $2E, $2E, $2E, $2E, $2E, $2E, $2E, $2E, $08, $2F, $2F, $2F, $2F, $2F, $2F
Bank02_LADDF:  .byte $2F, $2F, $FF

;Structure #$1A
Bank02_LADE2:  .byte $04, $1D, $1D, $1D, $1D, $04, $1D, $1D, $1D, $1D, $04, $1D, $1D, $1D, $1D, $04
Bank02_LADF2:  .byte $1D, $1D, $1D, $1D, $FF

;Structure #$1B
Bank02_LADF7:  .byte $04, $31, $30, $31, $30, $04, $30, $30, $30, $30, $04, $31, $30, $31, $31, $04
Bank02_LAE07:  .byte $30, $31, $30, $30, $FF

;Structure #$1C
Bank02_LAE0C:  .byte $01, $30, $01, $31, $01, $30, $01, $30, $01, $31, $01, $31, $01, $30, $01, $30
Bank02_LAE1C:  .byte $FF

;Structure #$1D
Bank02_LAE1D:  .byte $04, $30, $31, $30, $30, $FF

;Structure #$1E
Bank02_LAE23:  .byte $01, $1C, $FF

;Structure #$1F
Bank02_LAE26:  .byte $01, $21, $01, $1F, $01, $1F, $01, $21, $FF

;Structure #$20
Bank02_LAE2F:  .byte $04, $34, $34, $34, $34, $04, $34, $34, $34, $34, $FF

;Structure #$21
Bank02_LAE3A:  .byte $04, $35, $35, $35, $35, $FF

;Structure #$22
Bank02_LAE40:  .byte $04, $37, $37, $37, $37, $04, $37, $36, $37, $36, $04, $36, $37, $36, $37, $04
Bank02_LAE50:  .byte $37, $37, $36, $37, $FF

;Structure #$23
Bank02_LAE55:  .byte $02, $32, $33, $FF

;Structure #$24
Bank02_LAE59:  .byte $04, $2B, $2B, $2B, $2B, $04, $2B, $2B, $2B, $2B, $FF

;Structure #$25
Bank02_LAE64:  .byte $01, $2B, $01, $2B, $01, $2B, $01, $2B, $FF

;Structure #$26
Bank02_LAE6D:  .byte $04, $2B, $2B, $2B, $2B, $04, $2B, $2B, $2B, $2B, $04, $2B, $2B, $2B, $2B, $04
Bank02_LAE7D:  .byte $2B, $2B, $2B, $2B, $FF

;Structure #$27
Bank02_LAE82:  .byte $01, $14, $FF

;Structure #$28
Bank02_LAE85:  .byte $01, $2B, $01, $2B, $01, $2B, $01, $2B, $FF

;Structure #$29
Bank02_LAE8E:  .byte $01, $39, $FF

;Structure #$2A
Bank02_LAE91:  .byte $01, $38, $FF

;Structure #$2B
Bank02_LAE94:  .byte $04, $3A, $3B, $3B, $3C, $FF

;Structure #$2C
Bank02_LAE9A:  .byte $02, $34, $34, $02, $34, $34, $02, $34, $34, $02, $34, $34, $FF

;Structure #$2D
Bank02_LAEA7:  .byte $08, $30, $31, $30, $31, $30, $30, $31, $30, $FF

;Structure #$2E
Bank02_LAEB1:  .byte $04, $34, $34, $34, $34, $04, $34, $34, $34, $34, $04, $34, $34, $34, $34, $04
Bank02_LAEC1:  .byte $34, $34, $34, $34, $FF

;Structure #$2F
Bank02_LAEC6:  .byte $08, $2B, $2B, $2B, $2B, $2B, $2B, $2B, $2B, $08, $2B, $2B, $2B, $2B, $2B, $2B
Bank02_LAED6:  .byte $2B, $2B, $FF

;Structure #$30
Bank02_LAED9:  .byte $08, $34, $34, $34, $34, $34, $34, $34, $34, $08, $34, $34, $34, $34, $34, $34
Bank02_LAEE9:  .byte $34, $34, $FF

;-----------------------------------[ Enemy animation data tables ]----------------------------------

.advance EnemyAnimIndexTbl

    .byte $00, $01, $FF
    .byte $02, $FF
    .byte $03, $04, $FF
    .byte $07, $08, $FF
    .byte $05, $06, $FF
    .byte $09, $0A, $FF
    .byte $0B, $FF
    .byte $0C, $0D, $0E, $0F, $FF
    .byte $10, $11, $12, $13, $FF
    .byte $15, $14, $FF
    .byte $16, $FF
    .byte $17, $18, $FF
    .byte $19, $1A, $FF
    .byte $1B, $FF
    .byte $1C, $1D, $FF
    .byte $1E, $1F, $FF
    .byte $20, $FF
    .byte $21, $22, $FF
    .byte $23, $FF
    .byte $27, $28, $29, $2A, $FF
    .byte $2B, $2C, $2D, $2E, $FF
    .byte $2F, $FF
    .byte $30, $FF
    .byte $31, $FF
    .byte $32, $FF
    .byte $33, $FF
    .byte $34, $FF
    .byte $42, $FF
    .byte $43, $44, $F7, $FF
    .byte $3B, $FF
    .byte $3C, $FF
    .byte $3D, $FF, $3E, $FF
    .byte $3F, $3F, $3F, $3F, $3F, $41, $41, $41, $41, $40, $40, $40, $F7, $FF
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

;----------------------------[ Enemy sprite drawing pointer tables ]---------------------------------

.advance EnemyFramePtrTbl_Hi

    .byte >Bank02_L9E0A, >Bank02_L9E0F, >Bank02_L9E14, >Bank02_L9E19, >Bank02_L9E2C, >Bank02_L9E40, >Bank02_L9E56, >Bank02_L9E6C
    .byte >Bank02_L9E7F, >Bank02_L9E93, >Bank02_L9EA9, >Bank02_L9EBF, >Bank02_L9EC9, >Bank02_L9ECE, >Bank02_L9ED3, >Bank02_L9ED8
    .byte >Bank02_L9EDD, >Bank02_L9EE2, >Bank02_L9EE7, >Bank02_L9EEC, >Bank02_L9EF1, >Bank02_L9EFF, >Bank02_L9F0D, >Bank02_L9F1B
    .byte >Bank02_L9F2A, >Bank02_L9F39, >Bank02_L9F4A, >Bank02_L9F5B, >Bank02_L9F63, >Bank02_L9F69, >Bank02_L9F6F, >Bank02_L9F75
    .byte >Bank02_L9F7B, >Bank02_L9F81, >Bank02_L9F89, >Bank02_L9F91, >Bank02_L9F99, >Bank02_L9F99, >Bank02_L9F99, >Bank02_L9F99
    .byte >Bank02_L9FA5, >Bank02_L9FB3, >Bank02_L9FC1, >Bank02_L9FCF, >Bank02_L9FDB, >Bank02_L9FE9, >Bank02_L9FF7, >Bank02_LA005
    .byte >Bank02_LA010, >Bank02_LA01F, >Bank02_LA02E, >Bank02_LA03D, >Bank02_LA04C, >Bank02_LA059, >Bank02_LA059, >Bank02_LA059
    .byte >Bank02_LA059, >Bank02_LA059, >Bank02_LA059, >Bank02_LA059, >Bank02_LA061, >Bank02_LA069, >Bank02_LA071, >Bank02_LA079
    .byte >Bank02_LA081, >Bank02_LA089, >Bank02_LA093, >Bank02_LA098, >Bank02_LA0A0, >Bank02_LA0A8, >Bank02_LA0A8, >Bank02_LA0A8
    .byte >Bank02_LA0A8, >Bank02_LA0A8, >Bank02_LA0A8, >Bank02_LA0A8, >Bank02_LA0A8, >Bank02_LA0A8, >Bank02_LA0A8, >Bank02_LA0A8
    .byte >Bank02_LA0A8, >Bank02_LA0A8, >Bank02_LA0A8, >Bank02_LA0A8, >Bank02_LA0A8, >Bank02_LA0A8, >Bank02_LA0A8, >Bank02_LA0A8
    .byte >Bank02_LA0A8, >Bank02_LA0B4, >Bank02_LA0C0, >Bank02_LA0CC, >Bank02_LA0D8, >Bank02_LA0E4, >Bank02_LA0F0, >Bank02_LA0FC
    .byte >Bank02_LA108, >Bank02_LA110, >Bank02_LA11E, >Bank02_LA138, >Bank02_LA138, >Bank02_LA138, >Bank02_LA138, >Bank02_LA140
    .byte >Bank02_LA148, >Bank02_LA150, >Bank02_LA158, >Bank02_LA160, >Bank02_LA168, >Bank02_LA168, >Bank02_LA168, >Bank02_LA168
    .byte >Bank02_LA168, >Bank02_LA168, >Bank02_LA168, >Bank02_LA168, >Bank02_LA168, >Bank02_LA168, >Bank02_LA168, >Bank02_LA168
    .byte >Bank02_LA168, >Bank02_LA168, >Bank02_LA168, >Bank02_LA168, >Bank02_LA168, >Bank02_LA168, >Bank02_LA168, >Bank02_LA168
    .byte >Bank02_LA168, >Bank02_LA16E, >Bank02_LA173, >Bank02_LA173, >Bank02_LA173, >Bank02_LA173, >Bank02_LA173, >Bank02_LA173
    .byte >Bank02_LA173, >Bank02_LA173

.advance EnemyFramePtrTbl_Lo

    .byte <Bank02_L9E0A, <Bank02_L9E0F, <Bank02_L9E14, <Bank02_L9E19, <Bank02_L9E2C, <Bank02_L9E40, <Bank02_L9E56, <Bank02_L9E6C
    .byte <Bank02_L9E7F, <Bank02_L9E93, <Bank02_L9EA9, <Bank02_L9EBF, <Bank02_L9EC9, <Bank02_L9ECE, <Bank02_L9ED3, <Bank02_L9ED8
    .byte <Bank02_L9EDD, <Bank02_L9EE2, <Bank02_L9EE7, <Bank02_L9EEC, <Bank02_L9EF1, <Bank02_L9EFF, <Bank02_L9F0D, <Bank02_L9F1B
    .byte <Bank02_L9F2A, <Bank02_L9F39, <Bank02_L9F4A, <Bank02_L9F5B, <Bank02_L9F63, <Bank02_L9F69, <Bank02_L9F6F, <Bank02_L9F75
    .byte <Bank02_L9F7B, <Bank02_L9F81, <Bank02_L9F89, <Bank02_L9F91, <Bank02_L9F99, <Bank02_L9F99, <Bank02_L9F99, <Bank02_L9F99
    .byte <Bank02_L9FA5, <Bank02_L9FB3, <Bank02_L9FC1, <Bank02_L9FCF, <Bank02_L9FDB, <Bank02_L9FE9, <Bank02_L9FF7, <Bank02_LA005
    .byte <Bank02_LA010, <Bank02_LA01F, <Bank02_LA02E, <Bank02_LA03D, <Bank02_LA04C, <Bank02_LA059, <Bank02_LA059, <Bank02_LA059
    .byte <Bank02_LA059, <Bank02_LA059, <Bank02_LA059, <Bank02_LA059, <Bank02_LA061, <Bank02_LA069, <Bank02_LA071, <Bank02_LA079
    .byte <Bank02_LA081, <Bank02_LA089, <Bank02_LA093, <Bank02_LA098, <Bank02_LA0A0, <Bank02_LA0A8, <Bank02_LA0A8, <Bank02_LA0A8
    .byte <Bank02_LA0A8, <Bank02_LA0A8, <Bank02_LA0A8, <Bank02_LA0A8, <Bank02_LA0A8, <Bank02_LA0A8, <Bank02_LA0A8, <Bank02_LA0A8
    .byte <Bank02_LA0A8, <Bank02_LA0A8, <Bank02_LA0A8, <Bank02_LA0A8, <Bank02_LA0A8, <Bank02_LA0A8, <Bank02_LA0A8, <Bank02_LA0A8
    .byte <Bank02_LA0A8, <Bank02_LA0B4, <Bank02_LA0C0, <Bank02_LA0CC, <Bank02_LA0D8, <Bank02_LA0E4, <Bank02_LA0F0, <Bank02_LA0FC
    .byte <Bank02_LA108, <Bank02_LA110, <Bank02_LA11E, <Bank02_LA138, <Bank02_LA138, <Bank02_LA138, <Bank02_LA138, <Bank02_LA140
    .byte <Bank02_LA148, <Bank02_LA150, <Bank02_LA158, <Bank02_LA160, <Bank02_LA168, <Bank02_LA168, <Bank02_LA168, <Bank02_LA168
    .byte <Bank02_LA168, <Bank02_LA168, <Bank02_LA168, <Bank02_LA168, <Bank02_LA168, <Bank02_LA168, <Bank02_LA168, <Bank02_LA168
    .byte <Bank02_LA168, <Bank02_LA168, <Bank02_LA168, <Bank02_LA168, <Bank02_LA168, <Bank02_LA168, <Bank02_LA168, <Bank02_LA168
    .byte <Bank02_LA168, <Bank02_LA16E, <Bank02_LA173, <Bank02_LA173, <Bank02_LA173, <Bank02_LA173, <Bank02_LA173, <Bank02_LA173
    .byte <Bank02_LA173, <Bank02_LA173

.advance EnemyPlacePtrTbl_Hi

    .byte >Bank02_L9D94, >Bank02_L9D96, >Bank02_L9DAE, >Bank02_L9DAE, >Bank02_L9DC0, >Bank02_L9DB2, >Bank02_L9DBC, >Bank02_L9DC4
    .byte >Bank02_L9DD0, >Bank02_L9DD8, >Bank02_L9DD8, >Bank02_L9DF8, >Bank02_L9E06, >Bank02_L9E0A

.advance EnemyPlacePtrTbl_Lo

    .byte <Bank02_L9D94, <Bank02_L9D96, <Bank02_L9DAE, <Bank02_L9DAE, <Bank02_L9DC0, <Bank02_L9DB2, <Bank02_L9DBC, <Bank02_L9DC4
    .byte <Bank02_L9DD0, <Bank02_L9DD8, <Bank02_L9DD8, <Bank02_L9DF8, <Bank02_L9E06, <Bank02_L9E0A

;-------------------------------------[ Room Pointer Table ]-----------------------------------------

.advance RoomPointerTable_Hi

    .byte >Bank02_LA3AB, >Bank02_LA3BE, >Bank02_LA3C6, >Bank02_LA3F8, >Bank02_LA42F, >Bank02_LA473, >Bank02_LA4AB, >Bank02_LA4F5
    .byte >Bank02_LA527, >Bank02_LA55F, >Bank02_LA598, >Bank02_LA5D9, >Bank02_LA617, >Bank02_LA63E, >Bank02_LA678, >Bank02_LA6AA
    .byte >Bank02_LA6DF, >Bank02_LA70E, >Bank02_LA749, >Bank02_LA77E, >Bank02_LA7B3, >Bank02_LA7E6, >Bank02_LA82B, >Bank02_LA852
    .byte >Bank02_LA87F, >Bank02_LA8B2, >Bank02_LA8DC, >Bank02_LA909, >Bank02_LA947, >Bank02_LA979, >Bank02_LA9AB, >Bank02_LA9D5
    .byte >Bank02_LA9FF, >Bank02_LAA3D, >Bank02_LAA6F, >Bank02_LAAA7, >Bank02_LAAD4, >Bank02_LAB0D, >Bank02_LAB34, >Bank02_LAB70
    .byte >Bank02_LABA5, >Bank02_LABDA, >Bank02_LAC0D, >Bank02_LAC42, >Bank02_LAC72, >Bank02_LAC99

.advance RoomPointerTable_Lo

    .byte <Bank02_LA3AB, <Bank02_LA3BE, <Bank02_LA3C6, <Bank02_LA3F8, <Bank02_LA42F, <Bank02_LA473, <Bank02_LA4AB, <Bank02_LA4F5
    .byte <Bank02_LA527, <Bank02_LA55F, <Bank02_LA598, <Bank02_LA5D9, <Bank02_LA617, <Bank02_LA63E, <Bank02_LA678, <Bank02_LA6AA
    .byte <Bank02_LA6DF, <Bank02_LA70E, <Bank02_LA749, <Bank02_LA77E, <Bank02_LA7B3, <Bank02_LA7E6, <Bank02_LA82B, <Bank02_LA852
    .byte <Bank02_LA87F, <Bank02_LA8B2, <Bank02_LA8DC, <Bank02_LA909, <Bank02_LA947, <Bank02_LA979, <Bank02_LA9AB, <Bank02_LA9D5
    .byte <Bank02_LA9FF, <Bank02_LAA3D, <Bank02_LAA6F, <Bank02_LAAA7, <Bank02_LAAD4, <Bank02_LAB0D, <Bank02_LAB34, <Bank02_LAB70
    .byte <Bank02_LABA5, <Bank02_LABDA, <Bank02_LAC0D, <Bank02_LAC42, <Bank02_LAC72, <Bank02_LAC99

;----------------------------------------[ Macro definitions ]---------------------------------------

;The macro definitions are simply index numbers into the pattern tables that represent the 4 quadrants
;of the macro definition. The bytes correspond to the following position in order: lower right tile,
;lower left tile, upper right tile, upper left tile.

.advance MacroLowerRight
         .byte $F1, $FF, $64, $FF, $A4, $FF, $A0, $A1, $FF, $FF, $FF, $10, $23, $1B, $17, $1F
         .byte $60, $0E, $0C, $10, $10, $FF, $FF, $FF, $FF, $34, $3A, $3C, $84, $80, $88, $45
         .byte $47, $5C, $B8, $74, $C1, $36, $BF, $C0, $FF, $C2, $30, $13, $D7, $76, $FF, $BB
         .byte $00, $04, $FF, $FF, $55, $90, $4B, $51, $70, $8C, $11, $11, $11, $C3, $30, $CD
         .byte $D1, $90, $20, $C0, $C0

.advance MacroLowerLeft
         .byte $F1, $FF, $64, $FF, $FF, $A5, $A0, $A1, $FF, $FF, $FF, $10, $24, $1C, $18, $20
         .byte $61, $0F, $0D, $0D, $FF, $FF, $33, $39, $FF, $35, $3B, $41, $85, $81, $89, $46
         .byte $48, $5D, $B8, $75, $13, $BE, $14, $14, $C1, $14, $13, $14, $D7, $76, $FF, $BB
         .byte $01, $05, $FF, $FF, $56, $91, $4C, $52, $71, $8D, $12, $12, $12, $C4, $00, $CE
         .byte $D2, $91, $20, $C0, $C0

.advance MacroUpperRight
         .byte $F1, $F0, $64, $64, $A4, $FF, $A0, $A1, $59, $5A, $FF, $10, $25, $1D, $19, $21
         .byte $62, $FF, $0D, $FF, $FF, $FF, $FF, $FF, $31, $37, $3E, $40, $86, $82, $8A, $45
         .byte $48, $5E, $B9, $75, $13, $BC, $15, $C0, $FF, $FF, $BC, $15, $D7, $76, $BA, $BB
         .byte $02, $06, $08, $09, $57, $92, $4D, $53, $72, $8E, $FF, $12, $12, $C5, $BC, $CF
         .byte $D3, $92, $20, $C0, $C0
         
.advance MacroUpperLeft
         .byte $F1, $F0, $64, $64, $FF, $A5, $A0, $A1, $5A, $5B, $FF, $10, $0B, $1E, $1A, $22
         .byte $63, $FF, $0D, $10, $FF, $30, $36, $3D, $32, $38, $3F, $42, $87, $83, $8B, $46
         .byte $47, $5F, $B9, $74, $13, $BD, $14, $16, $FF, $FF, $BD, $16, $D7, $76, $BA, $BB
         .byte $03, $07, $09, $0A, $58, $93, $50, $54, $73, $8F, $11, $11, $FF, $C6, $BD, $D0
         .byte $D4, $93, $20, $C0, $C0

;------------------------------------------[ Area music data ]---------------------------------------

;There are 3 control bytes associated with the music data and the rest are musical note indexes.
;If the byte has the binary format 1011xxxx ($Bx), then the byte is an index into the corresponding
;musical notes table and is used to set the note length until it is set by another note length
;byte. The lower 4 bits are the index into the note length table. Another control byte is the loop
;and counter btye. The loop and counter byte has the format 11xxxxxx. Bits 0 thru 6 contain the
;number of times to loop.  The third control byte is #$FF. This control byte marks the end of a loop
;and decrements the loop counter. If #$00 is found in the music data, the music has reached the end.
;A #$00 in any of the different music channel data segments will mark the end of the music. The
;remaining bytes are indexes into the MusicNotesTbl_B2 and should only be even numbers as there are 2
;bytes of data per musical note.

NorfairSQ1IndexData_B2:
Bank02_LB000:  .byte $C3               ;
Bank02_LB001:  .byte $B6               ;1 3/16 seconds +
Bank02_LB002:  .byte $26               ;G3     |
Bank02_LB003:  .byte $B3               ;3/4 seconds    |
Bank02_LB004:  .byte $22               ;F3     |
Bank02_LB005:  .byte $B2               ;3/8 seconds    | Repeat 3 times
Bank02_LB006:  .byte $2C               ;A#3        |
Bank02_LB007:  .byte $B6               ;1 3/16 seconds |
Bank02_LB008:  .byte $26               ;G3     |
Bank02_LB009:  .byte $B4               ;1 1/2 seconds  |
Bank02_LB00A:  .byte $22               ;F3     +
Bank02_LB00B:  .byte $FF               ;
Bank02_LB00C:  .byte $C2               ;
Bank02_LB00D:  .byte $B6               ;1 3/16 seconds +
Bank02_LB00E:  .byte $30               ;C4     |
Bank02_LB00F:  .byte $34               ;D4     |
Bank02_LB010:  .byte $B3               ;3/4 seconds    |
Bank02_LB011:  .byte $3A               ;F4     | Repeat 2 times
Bank02_LB012:  .byte $B1               ;3/16 seconds   |
Bank02_LB013:  .byte $38               ;E4     |
Bank02_LB014:  .byte $34               ;D4     |
Bank02_LB015:  .byte $B4               ;1 1/2 seconds  |
Bank02_LB016:  .byte $2A               ;A3     +
Bank02_LB017:  .byte $FF               ;
Bank02_LB018:  .byte $C2               ;
Bank02_LB019:  .byte $B3               ;3/4 seconds    +
Bank02_LB01A:  .byte $2A               ;A3     |
Bank02_LB01B:  .byte $B2               ;3/8 seconds    |
Bank02_LB01C:  .byte $2E               ;B3     |
Bank02_LB01D:  .byte $B3               ;3/4 seconds    |
Bank02_LB01E:  .byte $26               ;G3     | Repeat 2 times
Bank02_LB01F:  .byte $B2               ;3/8 seconds    |
Bank02_LB020:  .byte $2A               ;A3     |
Bank02_LB021:  .byte $B6               ;1 3/16 seconds |
Bank02_LB022:  .byte $22               ;F3     |
Bank02_LB023:  .byte $02               ;No sound   +
Bank02_LB024:  .byte $FF               ;
Bank02_LB025:  .byte $00               ;End Norfair music

NorfairSQ2IndexData_B2:
Bank02_LB026:  .byte $C3               ;
Bank02_LB027:  .byte $B6               ;1 3/16 seconds +
Bank02_LB028:  .byte $1E               ;D#3        |
Bank02_LB029:  .byte $B3               ;3/4 seconds    |
Bank02_LB02A:  .byte $1A               ;C#3        |
Bank02_LB02B:  .byte $B2               ;3/8 seconds    | Repeat 3 times
Bank02_LB02C:  .byte $24               ;F#3        |
Bank02_LB02D:  .byte $B6               ;1 3/16 seconds |
Bank02_LB02E:  .byte $1E               ;D#3        |
Bank02_LB02F:  .byte $B4               ;1 1/2 seconds  |
Bank02_LB030:  .byte $1A               ;C#3        +
Bank02_LB031:  .byte $FF               ;
Bank02_LB032:  .byte $C2               ;
Bank02_LB033:  .byte $B6               ;1 3/16 seconds +
Bank02_LB034:  .byte $26               ;G3     |
Bank02_LB035:  .byte $2A               ;A3     |
Bank02_LB036:  .byte $30               ;C4     |
Bank02_LB037:  .byte $B1               ;3/16 seconds   |
Bank02_LB038:  .byte $20               ;E3     |
Bank02_LB039:  .byte $1C               ;D3     |
Bank02_LB03A:  .byte $B6               ;1 3/16 seconds |
Bank02_LB03B:  .byte $20               ;E3     +
Bank02_LB03C:  .byte $FF               ;
Bank02_LB03D:  .byte $C2               ;
Bank02_LB03E:  .byte $B1               ;3/16 seconds   +
Bank02_LB03F:  .byte $20               ;E3     |
Bank02_LB040:  .byte $12               ;A2     |
Bank02_LB041:  .byte $16               ;B2     |
Bank02_LB042:  .byte $20               ;E3     |
Bank02_LB043:  .byte $B2               ;3/8 seconds    |
Bank02_LB044:  .byte $24               ;F#3        |
Bank02_LB045:  .byte $B1               ;3/16 seconds   |
Bank02_LB046:  .byte $1C               ;D3     |
Bank02_LB047:  .byte $0E               ;G2     |
Bank02_LB048:  .byte $12               ;A2     | Repeat 2 times
Bank02_LB049:  .byte $1C               ;D3     |
Bank02_LB04A:  .byte $B2               ;3/8 seconds    |
Bank02_LB04B:  .byte $20               ;E3     |
Bank02_LB04c:  .byte $B1               ;3/16 seconds   |
Bank02_LB04D:  .byte $18               ;C3     |
Bank02_LB04E:  .byte $12               ;A2     |
Bank02_LB04F:  .byte $14               ;A#2        |
Bank02_LB050:  .byte $18               ;C3     |
Bank02_LB051:  .byte $14               ;A#2        |
Bank02_LB052:  .byte $B6               ;1 3/16 seconds |
Bank02_LB053:  .byte $12               ;A2     |
Bank02_LB054:  .byte $B1               ;3/16 seconds   |
Bank02_LB055:  .byte $02               ;No sound   +
Bank02_LB056:  .byte $FF               ;

NorfairTriangleIndexData_B2:
Bank02_LB057:  .byte $C3               ;
Bank02_LB058:  .byte $B1               ;3/16 seconds   +
Bank02_LB059:  .byte $34               ;D4     |
Bank02_LB05A:  .byte $02               ;No sound   |
Bank02_LB05B:  .byte $3E               ;G4     |
Bank02_LB05C:  .byte $02               ;No sound   |
Bank02_LB05D:  .byte $42               ;A4     |
Bank02_LB05E:  .byte $02               ;No sound   |
Bank02_LB05F:  .byte $B3               ;3/4 seconds    |
Bank02_LB060:  .byte $30               ;C4     | Repeat 3 times
Bank02_LB061:  .byte $B1               ;3/16 seconds   |
Bank02_LB062:  .byte $3A               ;F4     |
Bank02_LB063:  .byte $02               ;No sound   |
Bank02_LB064:  .byte $B2               ;3/8 seconds    |
Bank02_LB065:  .byte $34               ;D4     |
Bank02_LB066:  .byte $B3               ;3/4 seconds    |
Bank02_LB067:  .byte $02               ;No sound   |
Bank02_LB068:  .byte $30               ;C4     |
Bank02_LB069:  .byte $02               ;No sound   +
Bank02_LB06A:  .byte $FF               ;
Bank02_LB06B:  .byte $C2               ;
Bank02_LB06C:  .byte $B2               ;3/8 seconds    +
Bank02_LB06D:  .byte $22               ;F3     |
Bank02_LB06E:  .byte $30               ;C4     |
Bank02_LB06F:  .byte $34               ;D4     |
Bank02_LB070:  .byte $26               ;G3     |
Bank02_LB071:  .byte $34               ;D4     |
Bank02_LB072:  .byte $38               ;E4     |
Bank02_LB073:  .byte $2C               ;A#3        | Repeat 2 times
Bank02_LB074:  .byte $34               ;D4     |
Bank02_LB075:  .byte $3A               ;F4     |
Bank02_LB076:  .byte $B3               ;3/4 seconds    |
Bank02_LB077:  .byte $18               ;C3     |
Bank02_LB078:  .byte $B2               ;3/8 seconds    |
Bank02_LB079:  .byte $2A               ;A3     |
Bank02_LB07A:  .byte $02               ;No sound   +
Bank02_LB07B:  .byte $FF               ;
Bank02_LB07C:  .byte $C2               ;
Bank02_LB07D:  .byte $B3               ;3/4 seconds    +
Bank02_LB07E:  .byte $1C               ;D3     |
Bank02_LB07F:  .byte $B2               ;3/8 seconds    |
Bank02_LB080:  .byte $20               ;E3     |
Bank02_LB081:  .byte $B3               ;3/4 seconds    |
Bank02_LB082:  .byte $18               ;C3     | Repeat 2 times
Bank02_LB083:  .byte $B2               ;3/8 seconds    |
Bank02_LB084:  .byte $1C               ;D3     |
Bank02_LB085:  .byte $14               ;A#2        |
Bank02_LB086:  .byte $14               ;A#2        |
Bank02_LB087:  .byte $02               ;No sound   |
Bank02_LB088:  .byte $B6               ;1 3/16 seconds |
Bank02_LB089:  .byte $02               ;No sound   +
Bank02_LB08A:  .byte $FF               ;

NorfairNoiseIndexData_B2:
Bank02_LB08B:  .byte $E0               ;
Bank02_LB08C:  .byte $B2               ;3/8 seconds    +
Bank02_LB08D:  .byte $01               ;Drumbeat 00    |
Bank02_LB08E:  .byte $04               ;Drumbeat 01    |
Bank02_LB08F:  .byte $04               ;Drumbeat 01    |
Bank02_LB090:  .byte $01               ;Drumbeat 00    |
Bank02_LB091:  .byte $04               ;Drumbeat 01    | Repeat 32 times
Bank02_LB092:  .byte $04               ;Drumbeat 01    |
Bank02_LB093:  .byte $B6               ;1 3/16 seconds |
Bank02_LB094:  .byte $04               ;Drumbeat 01    |
Bank02_LB095:  .byte $04               ;Drumbeat 01    |
Bank02_LB096:  .byte $B2               ;3/8 seconds    |
Bank02_LB097:  .byte $01               ;Drumbeat 00    +
Bank02_LB098:  .byte $FF               ;

.scend

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

    ;Norfair music.
    _LBD4B:  .byte $0B, $FF, $F0, $04, $04
    _LBD50:  .word NorfairSQ1IndexData_B2, NorfairSQ2IndexData_B2, NorfairTriangleIndexData_B2, NorfairNoiseIndexData_B2

    ;Kraid area music(not used this memory page).
    _LBD58:  .byte $00, $FF, $F0, $00, $00
    _LBD5D:  .word $0100, $0300, $0500, $0000

    ;Item room music.
    _LBD65:  .byte $0B, $FF, $03, $00, $00
    _LBD6A:  .word _ItmRmSQ1Data, _ItmRmSQ2Data, _ItmRmTriData, $0000

    ;Ridley area music(not used this memory page).
    _LBD72:  .byte $0B, $FF, $F0, $01, $01
    _LBD77:  .word $0100, $0300, $0500, $0000

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

;----------------------------------- Struct Pointer Table ----------------------------------------

.advance StructPointerTable_Hi
    .byte >Bank02_LACB9, >Bank02_LACCC, >Bank02_LACE5, >Bank02_LACFE, >Bank02_LAD05, >Bank02_LAD0C, >Bank02_LAD10, >Bank02_LAD16
    .byte >Bank02_LAD26, >Bank02_LAD2B, >Bank02_LAD31, >Bank02_LAD39, >Bank02_LAD4E, >Bank02_LAD57, >Bank02_LAD61, >Bank02_LAD6c
    .byte >Bank02_LAD78, >Bank02_LAD7B, >Bank02_LAD85, >Bank02_LAD88, >Bank02_LAD9C, >Bank02_LADB1, >Bank02_LADB7, >Bank02_LADBD
    .byte >Bank02_LADC6, >Bank02_LADCF, >Bank02_LADE2, >Bank02_LADF7, >Bank02_LAE0C, >Bank02_LAE1D, >Bank02_LAE23, >Bank02_LAE26
    .byte >Bank02_LAE2F, >Bank02_LAE3A, >Bank02_LAE40, >Bank02_LAE55, >Bank02_LAE59, >Bank02_LAE64, >Bank02_LAE6D, >Bank02_LAE82
    .byte >Bank02_LAE85, >Bank02_LAE8E, >Bank02_LAE91, >Bank02_LAE94, >Bank02_LAE9A, >Bank02_LAEA7, >Bank02_LAEB1, >Bank02_LAEC6
    .byte >Bank02_LAED9

.advance StructPointerTable_Lo
    .byte <Bank02_LACB9, <Bank02_LACCC, <Bank02_LACE5, <Bank02_LACFE, <Bank02_LAD05, <Bank02_LAD0C, <Bank02_LAD10, <Bank02_LAD16
    .byte <Bank02_LAD26, <Bank02_LAD2B, <Bank02_LAD31, <Bank02_LAD39, <Bank02_LAD4E, <Bank02_LAD57, <Bank02_LAD61, <Bank02_LAD6c
    .byte <Bank02_LAD78, <Bank02_LAD7B, <Bank02_LAD85, <Bank02_LAD88, <Bank02_LAD9C, <Bank02_LADB1, <Bank02_LADB7, <Bank02_LADBD
    .byte <Bank02_LADC6, <Bank02_LADCF, <Bank02_LADE2, <Bank02_LADF7, <Bank02_LAE0C, <Bank02_LAE1D, <Bank02_LAE23, <Bank02_LAE26
    .byte <Bank02_LAE2F, <Bank02_LAE3A, <Bank02_LAE40, <Bank02_LAE55, <Bank02_LAE59, <Bank02_LAE64, <Bank02_LAE6D, <Bank02_LAE82
    .byte <Bank02_LAE85, <Bank02_LAE8E, <Bank02_LAE91, <Bank02_LAE94, <Bank02_LAE9A, <Bank02_LAEA7, <Bank02_LAEB1, <Bank02_LAEC6
    .byte <Bank02_LAED9

;----------------------------------------------------------------------------------------------------

RESET_Bank02:
Bank02_LBFB0:  SEI                     ;Disables interrupt.
Bank02_LBFB1:  CLD                     ;Sets processor to binary mode.
Bank02_LBFB2:  LDX #$00                ;
Bank02_LBFB4:  STX PPUControl0         ;Clear PPU control registers.
Bank02_LBFB7:  STX PPUControl1         ;
Bank02_LBFBA:* LDA PPUStatus           ;
Bank02_LBFBD:  BPL -                   ;Wait for VBlank.
Bank02_LBFBF:* LDA PPUStatus           ;
Bank02_LBFC2:  BPL -                   ;
Bank02_LBFC4:  ORA #$FF                ;
Bank02_LBFC6:  STA MMC1Reg0            ;Reset MMC1 chip.
Bank02_LBFC9:  STA MMC1Reg1            ;(MSB is set).
Bank02_LBFCC:  STA MMC1Reg2            ;
Bank02_LBFCF:  STA MMC1Reg3            ;
Bank02_LBFD2:  JMP Startup             ;($C01A)Does preliminry housekeeping.

;----------------------------------------------------------------------------------------------------

.advance InterruptVectors

;Interrupt vectors.
.word NMI               ;($C0D9)NMI vector.
.word RESET_Bank02      ;($FFB0)Reset vector.
.word RESET_Bank02      ;($FFB0)IRQ vector.
