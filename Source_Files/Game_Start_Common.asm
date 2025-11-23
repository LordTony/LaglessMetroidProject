;-----------------------------------------[ Start of code ]------------------------------------------
.scope

_L8000:  JMP StartUpdateEnemyAnimation
_L8003:  JMP StartUpdateEnemyAnimation_2
_L8006:  JMP Start_Special_Attrs
_L8009:  JMP DoSomethingToFrameCount
_L800C:  JMP UpdateEnemyAnim     ;($E094)
_L800F:  JMP DoSomethingToAnimationIndecies
_L8012:  JMP DoSomethingToEnDataIndex
_L8015:  JMP UpdateEnemyHitpoints
_L8018:  JMP Bank07_LFBB9
_L801B:  JMP Bank07_LFB88
_L801E:  JMP Bank07_LFBCA
_L8021:  JMP Bank07_LF870
_L8024:  JMP _ChooseRoutine
_L8027:  JMP Bank07_LFD8F
_L802A:  JMP Bank07_LEB6E
_L802D:  JMP $8244
_L8030:  JMP $8318
_L8033:  JMP Bank07_LFA1E
_L8036:  JMP $833F
_L8039:  JMP $8395
_L803C:  JMP SomethingAboutMovement
_L803F:  JMP DrawTileBlast
_L8042:  JMP SubtractHealth      ;($CE92)
_L8045:  JMP Base10Subtract      ;($C3FB)

.checkpc L8048_Ptr_Table
.advance L8048_Ptr_Table
    .word $84FD, $84A6, $844A, $844A, $84A6, $84FD, $83F4, $83F4

_L8058:  LDX PageIndex
_L805A:  LDA $0405,X
_L805D:  ASL 
_L805E:  BMI ++++++++
_L8060:  LDA EnStatus,X
_L8063:  CMP #$02
_L8065:  BNE ++++++++
_L8067:  JSR $8244
_L806A:  LDA $00
_L806C:  BPL ++
_L806E:  JSR TwosCompliment      ;($C3D4)
_L8071:  STA $66
_L8073:* JSR $83F5
_L8076:  JSR $80B8
_L8079:  DEC $66
_L807B:  BNE -
_L807D:* BEQ ++
_L807F:  STA $66
_L8081:* JSR $844B
_L8084:  JSR $80FB
_L8087:  DEC $66
_L8089:  BNE -
_L808B:* JSR $8318
_L808E:  LDA $00
_L8090:  BPL ++
_L8092:  JSR TwosCompliment      ;($C3D4)
_L8095:  STA $66
_L8097:* JSR $84A7
_L809A:  JSR $816E
_L809D:  DEC $66
_L809F:  BNE -
_L80A1:* BEQ ++
_L80A3:  STA $66
_L80A5:* JSR $84FE
_L80A8:  JSR $8134
_L80AB:  DEC $66
_L80AD:  BNE -
_L80AF:* RTS

; TODO: This is unsed in Bank07
_L80B0:  LDY EnDataIndex,X
_L80B3:  LDA $977B,Y
_L80B6:  ASL                     ;*2 
_L80B7:  RTS

_L80B8:  LDX PageIndex
_L80BA:  BCS $80FA
_L80BC:  LDA $0405,X
_L80BF:  BPL $80C7
_L80C1:  JSR $81FC
_L80C4:  JMP $80F6
_L80C7:  JSR $80B0
_L80CA:  BPL $80EA
_L80CC:  LDA $6B03,X
_L80CF:  BEQ $80C1
_L80D1:  BPL $80D8
_L80D3:  JSR $81B1
_L80D6:  BEQ $80E2
_L80D8:  SEC 
_L80D9:  ROR $0402,X
_L80DC:  ROR EnCounter,X
_L80DF:  JMP $80F6
_L80E2:  STA $0402,X
_L80E5:  STA EnCounter,X
_L80E8:  BEQ $80F6
_L80EA:  LDA $977B,Y
_L80ED:  LSR 
_L80EE:  LSR 
_L80EF:  BCC $80F6
_L80F1:  LDA #$04
_L80F3:  JSR $856B
_L80F6:  LDA #$01
_L80F8:  STA $66
_L80FA:  RTS

_L80FB:  LDX PageIndex
_L80FD:  BCS $8133
_L80FF:  LDA $0405,X
_L8102:  BPL $810A
_L8104:  JSR $81FC
_L8107:  JMP $812F
_L810A:  JSR $80B0
_L810D:  BPL $8123
_L810F:  LDA $6B03,X
_L8112:  BEQ $8104
_L8114:  BPL $8120
_L8116:  CLC 
_L8117:  ROR $0402,X
_L811A:  ROR EnCounter,X
_L811D:  JMP $812F
_L8120:  JSR $81B1
_L8123:  LDA $977B,Y
_L8126:  LSR 
_L8127:  LSR 
_L8128:  BCC $812F
_L812A:  LDA #$04
_L812C:  JSR $856B
_L812F:  LDA #$01
_L8131:  STA $66
_L8133:  RTS

_L8134:  LDX PageIndex
_L8136:  BCS $816D
_L8138:  JSR $80B0
_L813B:  BPL $815E
_L813D:  LDA $0405,X
_L8140:  BMI $8148
_L8142:  JSR $81C7
_L8145:  JMP $8169
_L8148:  LDA $6B03,X
_L814B:  BEQ $8142
_L814D:  BPL $8159
_L814F:  CLC 
_L8150:  ROR $0403,X
_L8153:  ROR $0407,X
_L8156:  JMP $8169
_L8159:  JSR $81C0
_L815C:  BEQ $8169
_L815E:  LDA $977B,Y
_L8161:  LSR 
_L8162:  BCC $8169
_L8164:  LDA #$01
_L8166:  JSR $856B
_L8169:  LDA #$01
_L816B:  STA $66
_L816D:  RTS

_L816E:  LDX PageIndex
_L8170:  BCS $81B0
_L8172:  JSR $80B0
_L8175:  BPL $81A0
_L8177:  LDA $0405,X
_L817A:  BMI $8182
_L817C:  JSR $81C7
_L817F:  JMP $81AC
_L8182:  LDA $6B03,X
_L8185:  BEQ $817C
_L8187:  BPL $818E
_L8189:  JSR $81C0
_L818C:  BEQ $8198
_L818E:  SEC 
_L818F:  ROR $0403,X
_L8192:  ROR $0407,X
_L8195:  JMP $81AC
_L8198:  STA $0403,X
_L819B:  STA $0407,X
_L819E:  BEQ $81AC
_L81A0:  JSR $80B0
_L81A3:  LSR 
_L81A4:  LSR 
_L81A5:  BCC $81AC
_L81A7:  LDA #$01
_L81A9:  JSR $856B
_L81AC:  LDA #$01
_L81AE:  STA $66
_L81B0:  RTS

_L81B1:  JSR $81B8
_L81B4:  STA $6AFE,X
_L81B7:  RTS

_L81B8:  LDA #$20
_L81BA:  JSR LF744
_L81BD:  LDA #$00
_L81BF:  RTS

_L81C0:  JSR $81B8
_L81C3:  STA $6AFF,X
_L81C6:  RTS

_L81C7:  JSR $81F6
_L81CA:  BNE $81F5
_L81CC:  LDA #$01
_L81CE:  JSR $856B
_L81D1:  LDA $6AFF,X
_L81D4:  JSR TwosCompliment
_L81D7:  STA $6AFF,X

_L81DA:  JSR $81F6
_L81DD:  BNE $81F5
_L81DF:  JSR $80B0
_L81E2:  SEC 
_L81E3:  BPL $81ED
_L81E5:  LDA #$00
_L81E7:  SBC $0407,X
_L81EA:  STA $0407,X
_L81ED:  LDA #$00
_L81EF:  SBC $0403,X
_L81F2:  STA $0403,X
_L81F5:  RTS

_L81F6:  JSR LF74B
_L81F9:  AND #$20
_L81FB:  RTS

_L81FC:  JSR $81F6
_L81FF:  BNE $81F5
_L8201:  LDA #$04
_L8203:  JSR $856B
_L8206:  LDA $6AFE,X
_L8209:  JSR TwosCompliment
_L820C:  STA $6AFE,X

_L820F:  JSR $81F6
_L8212:  BNE $822A
_L8214:  JSR $80B0
_L8217:  SEC 
_L8218:  BPL $8222
_L821A:  LDA #$00
_L821C:  SBC EnCounter,X
_L821F:  STA EnCounter,X
_L8222:  LDA #$00
_L8224:  SBC $0402,X
_L8227:  STA $0402,X
_L822A:  RTS 

_L822B:  LDA $0405,X
_L822E:  BPL $8232
_L8230:  LSR 
_L8231:  LSR 
_L8232:  LSR 
_L8233:  LDA $0408,X
_L8236:  ROL 
_L8237:  ASL 
_L8238:  TAY 
_L8239:  LDA $96DB,Y
_L823C:  STA $81
_L823E:  LDA $96DC,Y
_L8241:  STA $82
_L8243:  RTS

_L8244:  JSR $80B0
_L8247:  BPL $824C
_L8249:  JMP $833F
_L824C:  LDA $0405,X
_L824F:  AND #$20
_L8251:  EOR #$20
_L8253:  BEQ $82A2
_L8255:  JSR $822B
_L8258:  LDY EnCounter,X
_L825B:  LDA ($81),Y
_L825D:  CMP #$F0
_L825F:  BCC $827F
_L8261:  CMP #$FA
_L8263:  BEQ $827C
_L8265:  CMP #$FB
_L8267:  BEQ $82B0
_L8269:  CMP #$FC
_L826B:  BEQ $82B3
_L826D:  CMP #$FD
_L826F:  BEQ $82A5
_L8271:  CMP #$FE
_L8273:  BEQ $82DE
_L8275:  LDA #$00
_L8277:  STA EnCounter,X
_L827A:  BEQ $8258
_L827C:  JMP $8312
_L827F:  SEC 
_L8280:  SBC EnDelay,X
_L8283:  BNE $8290
_L8285:  STA EnDelay,X
_L8288:  INY 
_L8289:  INY 
_L828A:  TYA 
_L828B:  STA EnCounter,X
_L828E:  BNE $825B
_L8290:  INC EnDelay,X
_L8293:  INY 
_L8294:  LDA ($81),Y
_L8296:  ASL 
_L8297:  PHP 
_L8298:  JSR _Adiv32              ;($C2BE)Divide by 32.
_L829B:  PLP 
_L829C:  BCC $82A2
_L829E:  EOR #$FF
_L82A0:  ADC #$00
_L82A2:  STA $00
_L82A4:  RTS

_L82A5:  INC EnCounter,X
_L82A8:  INY 
_L82A9:  LDA #$00
_L82AB:  STA $6B01,X
_L82AE:  BEQ $825B
_L82B0:  PLA 
_L82B1:  PLA 
_L82B2:  RTS

_L82B3:  LDA $6B03,X
_L82B6:  BPL $82BE
_L82B8:  JSR GrowRadiusY
_L82BB:  JMP $82C3
_L82BE:  BEQ $82D2
_L82C0:  JSR ShrinkRadiusY
_L82C3:  LDX PageIndex
_L82C5:  BCS $82D2
_L82C7:  LDY EnCounter,X
_L82CA:  INY 
_L82CB:  LDA #$00
_L82CD:  STA $6B03,X
_L82D0:  BEQ $82D7
_L82D2:  LDY EnCounter,X
_L82D5:  DEY 
_L82D6:  DEY 
_L82D7:  TYA 
_L82D8:  STA EnCounter,X
_L82DB:  JMP $825B
_L82DE:  DEY 
_L82DF:  DEY 
_L82E0:  TYA 
_L82E1:  STA EnCounter,X
_L82E4:  LDA $6B03,X
_L82E7:  BPL $82EF
_L82E9:  JSR GrowRadiusY
_L82EC:  JMP $82F4
_L82EF:  BEQ $82FB
_L82F1:  JSR ShrinkRadiusY
_L82F4:  LDX PageIndex
_L82F6:  BCC $82FB
_L82F8:  JMP $8258
_L82FB:  LDY EnDataIndex,X
_L82FE:  LDA $968B,Y
_L8301:  AND #$20
_L8303:  BEQ $8312
_L8305:  LDA $0405,X
_L8308:  EOR #$05
_L830A:  ORA $968B,Y
_L830D:  AND #$1F
_L830F:  STA $0405,X
_L8312:  JSR $81B1
_L8315:  JMP $82A2
_L8318:  JSR $80B0
_L831B:  BPL $8320
_L831D:  JMP $8395
_L8320:  LDA $0405,X
_L8323:  AND #$20
_L8325:  EOR #$20
_L8327:  BEQ $833C
_L8329:  LDY EnCounter,X
_L832C:  INY 
_L832D:  LDA ($81),Y
_L832F:  TAX 
_L8330:  AND #$08
_L8332:  PHP 
_L8333:  TXA 
_L8334:  AND #$07
_L8336:  PLP 
_L8337:  BEQ $833C
_L8339:  JSR TwosCompliment
_L833C:  STA $00
_L833E:  RTS

_L833F:  LDY #$0E
_L8341:  LDA $6AFE,X
_L8344:  BMI $835E
_L8346:  CLC 
_L8347:  ADC EnCounter,X
_L834A:  STA EnCounter,X
_L834D:  LDA $0402,X
_L8350:  ADC #$00
_L8352:  STA $0402,X
_L8355:  BPL $8376
_L8357:  JSR TwosCompliment
_L835A:  LDY #$F2
_L835C:  BNE $8376
_L835E:  JSR TwosCompliment
_L8361:  SEC 
_L8362:  STA $00
_L8364:  LDA EnCounter,X
_L8367:  SBC $00
_L8369:  STA EnCounter,X
_L836C:  LDA $0402,X
_L836F:  SBC #$00
_L8371:  STA $0402,X
_L8374:  BMI $8357
_L8376:  CMP #$0E
_L8378:  BCC $8383
_L837A:  LDA #$00
_L837C:  STA EnCounter,X
_L837F:  TYA 
_L8380:  STA $0402,X
_L8383:  LDA $6AFC,X
_L8386:  CLC 
_L8387:  ADC EnCounter,X
_L838A:  STA $6AFC,X
_L838D:  LDA #$00
_L838F:  ADC $0402,X
_L8392:  STA $00
_L8394:  RTS

_L8395:  LDA #$00
_L8397:  STA $00
_L8399:  STA $02
_L839B:  LDA #$0E
_L839D:  STA $01
_L839F:  STA $03
_L83A1:  LDA $0407,X
_L83A4:  CLC 
_L83A5:  ADC $6AFF,X
_L83A8:  STA $0407,X
_L83AB:  STA $04
_L83AD:  LDA #$00
_L83AF:  LDY $6AFF,X
_L83B2:  BPL $83B6
_L83B4:  LDA #$FF
_L83B6:  ADC $0403,X
_L83B9:  STA $0403,X
_L83BC:  TAY 
_L83BD:  BPL $83D0
_L83BF:  LDA #$00
_L83C1:  SEC 
_L83C2:  SBC $0407,X
_L83C5:  STA $04
_L83C7:  LDA #$00
_L83C9:  SBC $0403,X
_L83CC:  TAY 
_L83CD:  JSR LE449
_L83D0:  LDA $04
_L83D2:  CMP $02
_L83D4:  TYA 
_L83D5:  SBC $03
_L83D7:  BCC $83E3
_L83D9:  LDA $00
_L83DB:  STA $0407,X
_L83DE:  LDA $01
_L83E0:  STA $0403,X
_L83E3:  LDA $6AFD,X
_L83E6:  CLC 
_L83E7:  ADC $0407,X
_L83EA:  STA $6AFD,X
_L83ED:  LDA #$00
_L83EF:  ADC $0403,X
_L83F2:  STA $00
_L83F4:  RTS

_L83F5:  LDX PageIndex
_L83F7:  LDA EnYRoomPos,X
_L83FA:  SEC 
_L83FB:  SBC EnRadY,X
_L83FE:  AND #$07
_L8400:  SEC 
_L8401:  BNE $8406
_L8403:  JSR GrowRadiusY
_L8406:  LDY #$00
_L8408:  STY $00
_L840A:  LDX PageIndex
_L840C:  BCC $844A
_L840E:  INC $00
_L8410:  LDY EnYRoomPos,X
_L8413:  BNE $8429
_L8415:  LDY #$F0
_L8417:  LDA $49
_L8419:  CMP #$02
_L841B:  BCS $8429
_L841D:  LDA $FC
_L841F:  BEQ $844A
_L8421:  JSR $8563
_L8424:  BEQ $844A
_L8426:  JSR $855A
_L8429:  DEY 
_L842A:  TYA 
_L842B:  STA EnYRoomPos,X
_L842E:  CMP EnRadY,X
_L8431:  BNE $8441
_L8433:  LDA $FC
_L8435:  BEQ $843C
_L8437:  JSR $8563
_L843A:  BNE $8441
_L843C:  INC EnYRoomPos,X
_L843F:  CLC 
_L8440:  RTS

_L8441:  LDA $0405,X
_L8444:  BMI $8449
_L8446:  INC $6B01,X
_L8449:  SEC 
_L844A:  RTS

_L844B:  LDX PageIndex
_L844D:  LDA EnYRoomPos,X
_L8450:  CLC 
_L8451:  ADC EnRadY,X
_L8454:  AND #$07
_L8456:  SEC 
_L8457:  BNE $845C
_L8459:  JSR ShrinkRadiusY
_L845C:  LDY #$00
_L845E:  STY $00
_L8460:  LDX PageIndex
_L8462:  BCC $84A6
_L8464:  INC $00
_L8466:  LDY EnYRoomPos,X
_L8469:  CPY #$EF
_L846B:  BNE $8481
_L846D:  LDY #$FF
_L846F:  LDA $49
_L8471:  CMP #$02
_L8473:  BCS $8481
_L8475:  LDA $FC
_L8477:  BEQ $84A6
_L8479:  JSR $8563
_L847C:  BNE $84A6
_L847E:  JSR $855A
_L8481:  INY 
_L8482:  TYA 
_L8483:  STA EnYRoomPos,X
_L8486:  CLC 
_L8487:  ADC EnRadY,X
_L848A:  CMP #$EF
_L848C:  BNE $849D
_L848E:  LDA $FC
_L8490:  BEQ $8497
_L8492:  JSR $8563
_L8495:  BEQ $849D
_L8497:  DEC EnYRoomPos,X
_L849A:  CLC 
_L849B:  BCC $84A6
_L849D:  LDA $0405,X
_L84A0:  BMI $84A5
_L84A2:  DEC $6B01,X
_L84A5:  SEC 
_L84A6:  RTS

_L84A7:  LDX PageIndex
_L84A9:  LDA EnXRoomPos,X
_L84AC:  SEC 
_L84AD:  SBC EnRadX,X
_L84B0:  AND #$07
_L84B2:  SEC 
_L84B3:  BNE $84B8
_L84B5:  JSR GrowRadiusX
_L84B8:  LDY #$00
_L84BA:  STY $00
_L84BC:  LDX PageIndex
_L84BE:  BCC $84FD
_L84C0:  INC $00
_L84C2:  LDY EnXRoomPos,X
_L84C5:  BNE $84DA
_L84C7:  LDA $49
_L84C9:  CMP #$02
_L84CB:  BCC $84DA
_L84CD:  LDA $FD
_L84CF:  BEQ $84D4
_L84D1:  JSR $8563
_L84D4:  CLC 
_L84D5:  BEQ $84FD
_L84D7:  JSR $855A
_L84DA:  DEC EnXRoomPos,X
_L84DD:  LDA EnXRoomPos,X
_L84E0:  CMP EnRadX,X
_L84E3:  BNE $84F4
_L84E5:  LDA $FD
_L84E7:  BEQ $84EE
_L84E9:  JSR $8563
_L84EC:  BNE $84F4
_L84EE:  INC EnXRoomPos,X
_L84F1:  CLC 
_L84F2:  BCC $84FD
_L84F4:  LDA $0405,X
_L84F7:  BPL $84FC
_L84F9:  INC $6B01,X
_L84FC:  SEC 
_L84FD:  RTS

_L84FE:  LDX PageIndex
_L8500:  LDA EnXRoomPos,X
_L8503:  CLC 
_L8504:  ADC EnRadX,X
_L8507:  AND #$07
_L8509:  SEC 
_L850A:  BNE $850F
_L850C:  JSR ShrinkRadiusX
_L850F:  LDY #$00
_L8511:  STY $00
_L8513:  LDX PageIndex
_L8515:  BCC $8559
_L8517:  INC $00
_L8519:  INC EnXRoomPos,X
_L851C:  BNE $8536
_L851E:  LDA $49
_L8520:  CMP #$02
_L8522:  BCC $8536
_L8524:  LDA $FD
_L8526:  BEQ $852D
_L8528:  JSR $8563
_L852B:  BEQ $8533
_L852D:  DEC EnXRoomPos,X
_L8530:  CLC 
_L8531:  BCC $8559
_L8533:  JSR $855A
_L8536:  LDA EnXRoomPos,X
_L8539:  CLC 
_L853A:  ADC EnRadX,X
_L853D:  CMP #$FF
_L853F:  BNE $8550
_L8541:  LDA $FD
_L8543:  BEQ $854A
_L8545:  JSR $8563
_L8548:  BEQ $8550
_L854A:  DEC EnXRoomPos,X
_L854D:  CLC 
_L854E:  BCC $8559
_L8550:  LDA $0405,X
_L8553:  BPL $8558
_L8555:  DEC $6B01,X
_L8558:  SEC 
_L8559:  RTS

_L855A:  LDA EnNameTable,X
_L855D:  EOR #$01
_L855F:  STA EnNameTable,X
_L8562:  RTS

_L8563:  LDA EnNameTable,X
_L8566:  EOR $FF
_L8568:  AND #$01
_L856A:  RTS

_L856B:  EOR $0405,X
_L856E:  STA $0405,X
_L8571:  RTS

;---------------------------------[ Object animation data tables ]----------------------------------

;The following tables are indices into the FramePtrTable that correspond to various animations. The
;FramePtrTable represents individual frames and the entries in ObjectAnimIdxTbl are the groups of
;frames responsible for animaton Samus, her weapons and other objects.

.checkpc ObjectAnimIdxTbl
.advance ObjectAnimIdxTbl

;Samus run animation.
_L8572:  .byte $03, $04, $05, $00

;Samus front animation.
_L8576:  .byte $07, $00

;Samus jump out of ball animation.
_L8578:  .byte $17

;Samus Stand animation.
_L8579:  .byte $08, $00

;Samus stand and fire animation.
_L857B:  .byte $22, $00

;Samus stand and jump animation.
_L857D:  .byte $04

;Samus Jump animation.
_L857E:  .byte $10, $00

;Samus summersault animation.
_L8580:  .byte $17, $18, $19, $1A, $00

;Samus run and jump animation.
_L8585:  .byte $03, $17, $00

;Samus roll animation.
_L8588:  .byte $1E, $1D, $1C, $1B, $00

;Bullet animation.
_L858D:  .byte $28, $00

;Bullet hit animation.
_L858F:  .byte $2A, $F7, $00

;Samus jump and fire animation.
_L8592:  .byte $12, $00

;Samus run and fire animation.
_L8594:  .byte $0C, $0D, $0E, $00

;Samus point up and shoot animation.
_L8598:  .byte $30 

;Samus point up animation.
_L8599:  .byte $2B, $00

;Door open animation.
_L859B:  .byte $31, $31, $33, $F7, $00

;Door close animation.
_L85A0:  .byte $33, $33, $31, $00

;Samus explode animation.
_L85A4: .byte $35, $00

;Samus jump and point up animation.
_L85A6: .byte $39, $38, $00

;Samus run and point up animation.
_L85A9:  .byte $40, $41, $42, $00

;Samus run, point up and shoot animation 1.
_L85AD:  .byte $46, $00

;Samus run, point up and shoot animation 2.
_L85AF:  .byte $47, $00

;Samus run, point up and shoot animation 3.
_L85B1:  .byte $48, $00

;Samus on elevator animation 1.
_L85B3:  .byte $07, $F7, $F7, $07, $F7, $F7, $F7, $07, $F7, $F7, $F7, $F7, $07, $F7, $00

;Samus on elevator animation 2.
_L85C2:  .byte $23, $F7, $F7, $23, $F7, $F7, $F7, $23, $F7, $F7, $F7, $F7, $23, $F7, $00

;Samus on elevator animation 3.
_L85D1:  .byte $07, $F7, $F7, $F7, $F7, $07, $F7, $F7, $F7, $07, $F7, $F7, $07, $F7, $00

;Samus on elevator animation 4.
_L85E0:  .byte $23, $F7, $F7, $F7, $F7, $23, $F7, $F7, $F7, $23, $F7, $F7, $23, $F7, $00

;Wave beam animation.
_L85EF:  .byte $4B, $00

;Bomb tick animation.
_L85F1:  .byte $4E, $4F, $00

;Bomb explode animation.
_L85F4:  .byte $3C, $4A, $49, $4A, $4D, $4A, $4D, $F7, $00

;Missile left animation.
_L85FD:  .byte $26, $00

;Missile right animation.
_L85FF:  .byte $25, $00

;Missile up animation.
_L8601:  .byte $27, $00

;Missile explode animation.
_L8603:  .byte $67, $67, $67, $68, $68, $69, $F7, $00

;----------------------------[ Sprite drawing pointer tables ]--------------------------------------

;The above animation pointers provide an index into the following table
;for the animation sequences.

.checkpc FramePtrTable
.advance FramePtrTable

_L860B:  .word $87CB, $87CB, $87CB, $87CB, $87DD, $87F0, $8802, $8802
_L861B:  .word $8818, $882C, $882C, $882C, $882C, $883E, $8851, $8863
_L862B:  .word $8863, $8874, $8874, $8885, $8885, $8885, $8885, $8885
_L863B:  .word $888F, $8899, $88A3, $88AD, $88B8, $88C3, $88CE, $88D9
_L864B:  .word $88D9, $88D9, $88D9, $88EE, $88F8, $88F8, $88FE, $8904
_L865B:  .word $890A, $890F, $890F, $8914, $8928, $8928, $8928, $8928
_L866B:  .word $8928, $893C, $8948, $8948, $8954, $8954, $8961, $8961
_L867B:  .word $8961, $8974, $8987, $8987, $8987, $8995, $8995, $8995
_L868B:  .word $8995, $89A9, $89BE, $89D2, $89D2, $89D2, $89D2, $89E6
_L869B:  .word $89FB, $8A0F, $8A1D, $8A21, $8A26, $8A26, $8A3C, $8A41
_L86AB:  .word $8A46, $8A4E, $8A56, $8A5E, $8A66, $8A6E, $8A76, $8A7E
_L86BB:  .word $8A86, $8A8E, $8A9C, $8AA1, $8AA6, $8AAE, $8ABA, $8AC4
_L86CB:  .word $8AC4, $8AC4, $8AC4, $8AC4, $8AC4, $8AC4, $8AD8, $8AE9
_L86DB:  .word $8AF3, $8B03

;The following table provides pointers to data used for the placement of the sprites that make up
;Samus and other non-enemy objects.

.checkpc PlacePtrTable
.advance PlacePtrTable

_L86DF:  .word $8701, $871F, $872B, $8737, $8747, $8751, $86FD, $875D
_L86EF:  .word $8775, $878D, $8791, $8799, $87A5, $8749, $87B1

;------------------------------[ Sprite placement data tables ]-------------------------------------

;Sprite placement data. The placement data is grouped into two byte segments. The first byte is the
;y placement byte and the second is the x placement byte.  If the MSB is set in the byte, the byte
;is in twos compliment format so when it is added to the object position, the end result is to
;decrease the x or y position of the sprite.  The Samus explode table is a special case with special
;data bytes. The format of those data bytes is listed just above the Samus explode data. Each data
;table has a graphical representation above it to show how the sprites are laid out with respect to
;the object position, which is represented by a * in the table. The numbers in the lower right corner
;of the boxes indicates which segment of the data table represents which box in the graphic. Each box
;is filled with an 8x8 sprite.

;Samus pointing up frames. Added to the main Samus animation table below.
;          +--------+ <----0
;          +--------+ <----1
;          |        |
;          |        |
;          |        |
;          +--------+
;          +--------+
;
;
;
;
;
;
;
;
;               *
;              +--0--+   +--1--+
_L86FD:  .byte $E8, $FC, $EA, $FC

;Several Samus frames.
;      +-------+ <---------------D
;      +-------+ <---------------E
;      |       |
;      |   +---+----+--------+
;      |   |   |    |        |
;      +-------+    |        |
;      +-------+    |        |
;          |       0|       1|
; +----+-+-+----+-+-+--------+
; |    | | |    | | |        |
; |    | | |    | | |        |
; |    | | |    | | |        |
; |    | |2|   B|C|3|       4|
; +----+-+-+----+-+-*--------+--------+
;          |        |        |        |
;          |        |        |        |
;          |        |        |        |
;          |       5|       6|       7|
;          +--------+--------+--------+
;          |        |        |        |
;          |        |        |        |
;          |        |        |        |
;          |       8|       9|       A|
;          +--------+--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+   +--4--+   +--5--+   +--6--+   +--7--+
_L8701:  .byte $F0, $F8, $F0, $00, $F8, $F0, $F8, $F8, $F8, $00, $00, $F8, $00, $00, $00, $08
;              +--8--+   +--9--+   +--A--+   +--B--+   +--C--+   +--D--+   +--E--+
_L8711:  .byte $08, $F8, $08, $00, $08, $08, $F8, $F4, $F8, $F6, $EC, $F4, $EE, $F4

;Samus summersault and roll frames.
;          +--------+--------+
;          |        |        |
;          |        |        |
;          |        |        |
;          |       0|       1|
;          +--------+--------+
;          |        |        |
;          +--------+--------+
;          |        *        |
;          |       2|       3|
;          +--------+--------+
;          |       4|       5|
;          +--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+   +--4--+   +--5--+
_L871F:  .byte $F3, $F8, $F3, $00, $FB, $F8, $FB, $00, $03, $F8, $03, $00 

;Samus summersault frame.
;          +--------+--------+--------+
;          |        |        |        |
;          |        |        |        |
;          |        |        |        |
;          |       0|       1|       2|
;          +--------+-*------+--------+
;          |        |        |        |
;          |        |        |        |
;          |        |        |        |
;          |       3|       4|       5|
;          +--------+--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+   +--4--+   +--5--+
_L872B:  .byte $F8, $F6, $F8, $FE, $F8, $06, $00, $F6, $00, $FE, $00, $06

;Elevator frame.
;          +--------+--------+--------+--------+--------+--------+--------+--------+
;          |        |        |        |        |        |        |        |        |
;          |        |        |        |        |        |        |        |        |
;          |        |        *        |        |        |        |        |        |
;          |       0|       1|       2|       3|       4|       5|       6|       7|
;          +--------+--------+--------+--------+--------+--------+--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+   +--4--+   +--5--+   +--6--+   +--7--+
_L8737:  .byte $FC, $F0, $FC, $F8, $FC, $00, $FC, $08, $FC, $10, $FC, $18, $FC, $20, $FC, $28

;Several projectile frames.
;          +--------+
;          |        |
;          |        |
;          |    *   |
;          |       0|
;          +--------+
;              +--0--+
_L8747:  .byte $FC, $FC

;Power-up items and bomb explode frames.
;          +--------+--------+
;          |        |        |
;          |        |        |
;          |        |        |
;          |       0|       1|
;          +--------*--------+
;          |        |        |
;          |        |        |
;          |        |        |
;          |       2|       3|
;          +--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+
_L8749:  .byte $F8, $F8, $F8, $00, $00, $F8, $00, $00

;Door frames.
;          +--------+
;          |        |
;          |        |
;          |        |
;          |       0|
;          +--------+
;          |        |
;          |        |
;          |        |
;          |       1|
;          +--------+
;          |        |
;          |        |
;          |        |
;          |       2|
;          *--------+
;          |        |
;          |        |
;          |        |
;          |       3|
;          +--------+
;          |        |
;          |        |
;          |        |
;          |       4|
;          +--------+
;          |        |
;          |        |
;          |        |
;          |       5|
;          +--------+
;              +--0--+   +--1--+   +--2--+   +--3--+   +--4--+   +--5--+
_L8751:  .byte $E8, $00, $F0, $00, $F8, $00, $00, $00, $08, $00, $10, $00 

;Samus explode. Special case. The bytes that are #$8X indicate displacement data will be loaded
;from a table for the y direction and from a counter for the x direction.  The initial displacement
;bytes start at $8769.  If the LSB is clear in the bytes where the upper nibble is #$8, those
;data bytes will be used to decrease the x position of the sprite each frame. If the LSB is set,
;the data bytes will increase the x position of the sprite each frame.
;          +--------+--------+
;          |        |        |
;          |        |        |
;          |        |        |
;          |       0|       1|
;          +--------+--------+
;          |        |        |
;          |        |        |
;          |        *        |
;          |       2|       3|
;          +--------+--------+
;          |        |        |
;          |        |        |
;          |        |        |
;          |       4|       5|
;          +--------+--------+
;                                                                          +--0--+   +--1--+
_L875D:  .byte $80, $80, $81, $81, $82, $82, $83, $83, $84, $84, $85, $85, $F4, $F8, $F4, $00
;              +--2--+   +--3--+   +--4--+   +--5--+
_L876D:  .byte $FC, $F8, $FC, $00, $04, $F8, $04, $00

;Bomb explode frame.
;          +--------+--------+--------+--------+
;          |        |        |        |        |
;          |        |        |        |        |
;          |        |        |        |        |
;          |       3|       4|       0|       1|
;          +--------+--------+--------+--------+
;          |        |                 |        |
;          |        |                 |        |
;          |        |                 |        |
;          |       5|                 |       2|
;          +--------+        *        +--------+
;          |        |                 |        |
;          |        |                 |        |
;          |        |                 |        |
;          |       6|                 |       9|
;          +--------+--------+--------+--------+
;          |        |        |        |        |
;          |        |        |        |        |
;          |        |        |        |        |
;          |       7|       8|       A|       B|
;          +--------+--------+--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+   +--4--+   +--5--+   +--6--+   +--7--+
_L8775:  .byte $F0, $00, $F0, $08, $F8, $08, $F0, $F0, $F0, $F8, $F8, $F0, $00, $F0, $08, $F0
;              +--8--+   +--9--+   +--A--+   +--B--+
_L8785:  .byte $08, $F8, $00, $08, $08, $00, $08, $08

;Missile up frame.
;          +--------+
;          |        |
;          |        |
;          |        |
;          |       0|
;          +----*---+
;          |        |
;          |        |
;          |        |
;          |       1|
;          +--------+
;              +--0--+   +--1--+
_L878D:  .byte $F8, $FC, $00, $FC

;Missile left/right and missile explode frames.
;          +--------+--------+        +--------+--------+
;          |        |        |        |        |        |
;          |        |        |        |        |        |
;          |        *        |        |        |        |
;          |       0|       1|        |       2|       3|
;          +--------+--------+        +--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+
_L8791:  .byte $FC, $F8, $FC, $00, $FC, $10, $FC, $18

;Missile explode frame.
;                   +--------+--------+
;                   |        |        |
;                   |        |        |
;                   |        |        |
;                   |       1|       2|
;          +--------+--------+--------+--------+
;          |        |                 |        |
;          |        |                 |        |
;          |        |        *        |        |
;          |       0|                 |       3|
;          +--------+--------+--------+--------+
;                   |        |        |
;                   |        |        |
;                   |        |        |
;                   |       4|       5|
;                   +--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+   +--4--+   +--5--+
_L8799:  .byte $FC, $F0, $F4, $F8, $F4, $00, $FC, $08, $04, $F8, $04, $00

;Missile explode frame.
;                    +--------+                 +--------+
;                    |        |                 |        |
;                    |        |                 |        |
;                    |        |                 |        |
;                    |       1|                 |       2|
;                    +--------+                 +--------+
;
;
;
;
;          +--------+                                     +--------+
;          |        |                                     |        |
;          |        |                                     |        |
;          |        |                  *                  |        |
;          |       0|                                     |       3|
;          +--------+                                     +--------+
;
;
;
;
;                    +--------+                 +--------+
;                    |        |                 |        |
;                    |        |                 |        |
;                    |        |                 |        |
;                    |       4|                 |       5|
;                    +--------+                 +--------+
;              +--0--+   +--1--+   +--2--+   +--3--+   +--4--+   +--5--+
_L87A5:  .byte $FC, $E8, $EC, $F0, $EC, $08, $FC, $10, $0C, $F0, $0C, $08

;Statue frames.
;          +--------+--------+--------+
;          |        |        |        |
;          |        |        |        |
;          |        |        |        |
;          |       4|       5|       6|
;          +--------+--------+--------+
;          |        |        |        |
;          |        |        |        |
;          |        |        |        |
;          |       7|       8|       9|
;          +--------+--------+--------+
;          |        |        |        |
;          |        |        |        |
;          |        |        |        |
;          |       A|       B|       C|
;          +--------+--------*--------+
;                   |        |        |
;                   |        |        |
;                   |        |        |
;                   |       0|       1|
;                   +--------+--------+
;                   |        |        |
;                   |        |        |
;                   |        |        |
;                   |       2|       3|
;                   +--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+   +--4--+   +--5--+   +--6--+   +--7--+
_L87B1:  .byte $00, $F8, $00, $00, $08, $F8, $08, $00, $E8, $F0, $E8, $F8, $E8, $00, $F0, $F0
;              +--8--+   +--9--+   +--A--+   +--B--+   +--C--+
_L87C1:  .byte $F0, $F8, $F0, $00, $F8, $F0, $F8, $F8, $F8, $00

;-------------------------------[ Sprite frame data tables ]---------------------------------------

;Frame drawing data. The format for the frame drawing data is as follows:
;There are 4 control bytes associated with the frame data and they are #$FC, #$FD, #$FE and #$FF.
;
;#$FC displaces the location of the object in the x and y direction.  The first byte following #$FC
;is the y displacement of the object and the second byte is the x displacement. any further bytes
;are pattern table index bytes until the next control byte is reached.
;
;#$FD tells the program to change the sprite control byte.  The next byte after #$FD is the new
;control byte.  Only the 4 upper bits are used. Any further bytes are pattern table index bytes
;until the next control byte is reached.
;
;#$FE causes the next placement position to be skipped.  Any further bytes are pattern table index
;bytes until the next control byte is reached.
;
;#$FF ends the frame drawing data segment. 
;
;The first 3 bytes are unique.  The first byte contains two parts: AAAABBBB. The upper 4 bits
;are sprite control data which control mirroring and color bits.  The lower 4 bits are multiplied
;by 2 and used as an index into the PlacePtrTable to find the proper placement data for the
;current frame.  The second byte is saved as the object's y radius and the third byte is saved
;as the object's x radius.

;Samus run.
_L87CB:  .byte $40, $0F, $04, $00, $01, $FD, $20, $FE, $41, $40, $FD, $60, $20, $21, $FE, $FE
_L87DB:  .byte $31, $FF

;Samus run.
_L87DD:  .byte $40, $0F, $04, $02, $03, $FD, $20, $FE, $43, $42, $FD, $60, $22, $23, $FE, $32
_L87ED:  .byte $33, $34, $FF

;Samus run.
_L87F0:  .byte $40, $0F, $04, $05, $06, $FD, $20, $FE, $45, $44, $FD, $60, $25, $26, $27, $35
_L8800:  .byte $36, $FF

;Samus facing forward.
_L8802:  .byte $00, $0F, $04, $09, $FD, $60, $09, $FD, $20, $FE, $19, $1A, $FD, $20, $29, $2A
_L8812:  .byte $FE, $39, $FD, $60, $39, $FF

;Samus stand.
_L8818:  .byte $40, $0F, $04, $FD, $20, $0E, $0D, $FE, $1E, $1D, $2E, $2D, $FE, $FD, $60, $3B
_L8828:  .byte $3C, $FE, $17, $FF

;Samus run and fire.
_L882C:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $20, $21, $FE, $FE
_L883C:  .byte $31, $FF

;Samus run and fire.
_L883E:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $22, $23, $FE, $32
_L884E:  .byte $33, $34, $FF

;Samus run and fire.
_L8851:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $25, $26, $27, $35
_L8861:  .byte $36, $FF

;Samus stand and jump.
_L8863:  .byte $40, $0F, $04, $00, $01, $FD, $20, $FE, $41, $40, $FD, $60, $22, $07, $08, $32
_L8873:  .byte $FF

;Samus jump and fire.
_L8874:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $22, $07, $08, $32
_L8884:  .byte $FF

;Samus summersault.
_L8885:  .byte $41, $0F, $04, $52, $53, $62, $63, $72, $73, $FF

;Samus summersault.
_L888F:  .byte $42, $0F, $04, $54, $55, $56, $64, $65, $66, $FF

;Samus summersault.
_L8899:  .byte $81, $0F, $04, $52, $53, $62, $63, $72, $73, $FF

;Samus summersault.
_L88A3:  .byte $82, $0F, $04, $54, $55, $56, $64, $65, $66, $FF

;Samus roll.
_L88AD:  .byte $01, $08, $04, $FC, $03, $00, $50, $51, $60, $61, $FF

;Samus roll.
_L88B8:  .byte $81, $08, $04, $FC, $FD, $00, $50, $51, $60, $61, $FF

;Samus roll.
_L88C3:  .byte $C1, $08, $04, $FC, $FD, $00, $50, $51, $60, $61, $FF

;Samus roll.
_L88CE:  .byte $41, $08, $04, $FC, $03, $00, $50, $51, $60, $61, $FF

;Samus stand and fire.
_L88D9:  .byte $40, $0F, $04, $FD, $20, $0E, $0D, $FE, $1E, $1D, $2E, $2D, $FE, $FD, $60, $3B
_L88E9:  .byte $3C, $FE, $FE, $17, $FF

;Elevator.
_L88EE:  .byte $03, $04, $10, $28, $38, $38, $FD, $60, $28, $FF

;Missile right.
_L88F8:  .byte $4A, $04, $08, $5E, $5F, $FF

;Missile left.
_L88FE:  .byte $0A, $04, $08, $5E, $5F, $FF

;Missile up.
_L8904:  .byte $09, $08, $04, $14, $24, $FF

;Bullet fire.
_L890A:  .byte $04, $02, $02, $30, $FF

;Bullet hit.
_L890F:  .byte $04, $00, $00, $04, $FF

;Samus stand and point up.
_L8914:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $2E, $2D, $FE, $FD
_L8924:  .byte $60, $3B, $3C, $FF

;Samus from ball to pointing up.
_L8928:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $2E, $2D, $FE, $FD
_L8938:  .byte $60, $3B, $3C, $FF

;Door closed.
_L893C:  .byte $35, $18, $08, $0F, $1F, $2F, $FD, $A3, $2F, $1F, $0F, $FF

;Door open/close.
_L8948:  .byte $35, $18, $04, $6A, $6B, $6C, $FD, $A3, $6C, $6B, $6A, $FF

;Samus explode.
_L8954:  .byte $07, $00, $00, $FC, $FC, $00, $0B, $0C, $1B, $1C, $2B, $2C, $FF

;Samus jump and point up.
_L8961:  .byte $46, $0F, $04, $69, $FD, $20, $FE, $7A, $79, $FE, $78, $77, $FD, $60, $22, $07
_L8971:  .byte $08, $32, $FF

;Samus jump and point up.
_L8974:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $07
_L8984:  .byte $08, $32, $FF

;Bomb explode.
_L8987:  .byte $0D, $0C, $0C, $74, $FD, $60, $74, $FD, $A0, $74, $FD, $E0, $74, $FF

;Samus run and point up.
_L8995:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $20, $21
_L89A5:  .byte $FE, $FE, $31, $FF

;Samus run and point up.
_L89A9:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $23
_L89B9:  .byte $FE, $32, $33, $34, $FF

;Samus run and point up.
_L89BE:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $25, $26
_L89CE:  .byte $27, $35, $36, $FF

;Samus run and point up.
_L89D2:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $20, $21
_L89E2:  .byte $FE, $FE, $31, $FF

;Samus point up, run and fire.
_L89E6:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $23
_L89F6:  .byte $FE, $32, $33, $34, $FF

;Samus point up, run and fire.
_L89FB:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $25, $26
_L8A0B:  .byte $27, $35, $36, $FF

;Bomb explode.
_L8A0F:  .byte $0D, $0C, $0C, $75, $FD, $60, $75, $FD, $A0, $75, $FD, $E0, $75, $FF

;Bomb explode.
_L8A1D:  .byte $00, $00, $00, $FF

;Wave beam.
_L8A21:  .byte $04, $04, $04, $4C, $FF

;Bomb explode.
_L8A26:  .byte $08, $10, $10, $3D, $3E, $4E, $FD, $60, $3E, $3D, $4E, $FD, $E0, $4E, $3E, $3D
_L8A36:  .byte $FD, $A0, $4E, $3D, $3E, $FF

;Bomb tick.
_L8A3C:  .byte $04, $04, $04, $70, $FF

;Bomb tick.
_L8A41:  .byte $04, $04, $04, $71, $FF

;Bomb item.
_L8A46:  .byte $0D, $03, $03, $86, $87, $96, $97, $FF

;High jump item.
_L8A4E:  .byte $0D, $03, $03, $7B, $7C, $8B, $8C, $FF

;Long beam item.
_L8A56:  .byte $0D, $03, $03, $88, $67, $98, $99, $FF

;Screw attack item.
_L8A5E:  .byte $0D, $03, $03, $80, $81, $90, $91, $FF

;Maru Mari item.
_L8A66:  .byte $0D, $03, $03, $7D, $7E, $8D, $8E, $FF

;Varia item.
_L8A6E:  .byte $0D, $03, $03, $82, $83, $92, $93, $FF

;Wave beam item.
_L8A76:  .byte $0D, $03, $03, $88, $89, $98, $99, $FF

;Ice beam item.
_L8A7E:  .byte $0D, $03, $03, $88, $68, $98, $99, $FF

;Energy tank item.
_L8A86:  .byte $0D, $03, $03, $84, $85, $94, $95, $FF

;Missile item.
_L8A8E:  .byte $0D, $03, $03, $3F, $FD, $40, $3F, $FD, $00, $4F, $FD, $40, $4F, $FF

;Skree burrow.
_L8A9C:  .byte $34, $04, $04, $F2, $FF

;-----------------------------------------[ Choose routine ]-----------------------------------------

;This is an indirect jump routine. A is used as an index into a code
;pointer table, and the routine at that position is executed. The programmers
;always put the pointer table itself directly after the JSR to _ChooseRoutine,
;meaning that its address can be popped from the stack.

_ChooseRoutine:
    ASL
    TAY
    INY
    PLA
    STA TempPtr
    PLA
    STA TempPtr+1
    LDA (TempPtr),Y
    STA CodePtr
    INY
    LDA (TempPtr),Y
    STA CodePtr+1
    JMP (CodePtr)

_Adiv32:
    lsr
_Adiv16:
    lsr
    lsr
    lsr
    lsr
    rts

_AMul16:
    asl
_AMul8:
    asl
    asl
    asl
    rts

.advance $8AC4

;Kraid statue.
_L8AC4:  .byte $1E, $00, $08, $FA, $FB, $FA, $FB, $FC, $00, $04, $C5, $C6, $C7, $D5, $D6, $D7
_L8AD4:  .byte $E5, $E6, $E7, $FF

;Ridley statue.
_L8AD8:  .byte $1E, $00, $08, $FA, $FB, $FA, $FB, $FE, $C8, $C9, $EB, $D8, $D9, $EA, $E8, $E9
_L8AE8:  .byte $FF

;Missile explode.
_L8AE9:  .byte $0A, $04, $08, $FD, $00, $57, $FD, $40, $57, $FF

;Missile explode.
_L8AF3:  .byte $0B, $04, $0C, $FD, $00, $57, $18, $FD, $40, $18, $57, $FD, $C0, $18, $18, $FF

;Missile explode.
_L8B03:  .byte $0C, $04, $10, $FD, $00, $57, $18, $FD, $40, $18, $57, $FD, $C0, $18, $18, $FF

;------------------------------------[ Samus enter door routines ]-----------------------------------

;This function is called once when Samus first enters a door.

.checkpc SamusEnterDoor
.advance SamusEnterDoor

_L8B13:  LDA DoorStatus          ;The code determines if Samus has entered a door if the-->
_L8B15:  BNE ++++                ;door status is 0, but door data information has been-->
_L8B17:  LDY SamusDoorData       ;written. If both conditions are met, Samus has just-->
_L8B19:  BEQ ++++                ;entered a door.
_L8B1B:  STA CrntMslePickups     ;
_L8B1D:  STA CrntEnrgyPickups    ;Reset current missile and energy power-up counters.
_L8B1F:  LDA RandomNumber1       ;
_L8B21:  AND #$0F                ;Randomly recalculate max missile pickups(16 max, 0 min).
_L8B23:  STA MaxMissilePickup    ;
_L8B25:  ASL                     ;
_L8B26:  ORA #$40                ;*2 for energy pickups and set bit 6(128 max, 64 min).
_L8B28:  STA MaxEnergyPickup     ;
_L8B2A:  LDA PPUCNT0ZP           ;
_L8B2C:  EOR #$01                ;
_L8B2E:  AND #$01                ;Erase name table door data for new room.
_L8B30:  TAY                     ;
_L8B31:  LSR                     ;
_L8B32:  STA $006C,Y             ;
_L8B35:  LDA ScrollDir           ;
_L8B37:  AND #$02                ;Is Samus scrolling horizontally?-->
_L8B39:  BNE +                   ;If so, branch.
_L8B3B:  LDX #$04                ;Samus currently scrolling vertically.
_L8B3D:  LDA ScrollY             ;Is room centered on screen?-->
_L8B3F:  BEQ +++++               ;If so, branch.
_L8B41:  LDA $FF                 ;
_L8B43:  EOR ObjectHi            ;Get inverse of Samus' current nametable.
_L8B46:  LSR                     ;
_L8B47:  BCC +++                 ;If Samus is on nametable 3, branch.
_L8B49:  BCS ++                  ;If Samus is on nametable 0, branch to decrement x.
_L8B4B:* LDX #$02                ;Samus is currently scrolling horizontally.
_L8B4D:  LDA ObjectX             ;Is Samus entering a left hand door?-->
_L8B50:  BPL ++                  ;If so, branch.
_L8B52:* DEX                     ;
_SetDoorEntryInfo:
_L8B53:* TXA                     ;X contains door scroll status and is transferred to A.
_L8B54:  STA DoorScrollStatus    ;Save door scroll status.
_L8B56:  JSR _SamusInDoor         ;($8B74)Indicate Samus just entered a door.
_L8B59:  LDA #$12                ;
_L8B5B:  STA DoorDelay           ;Set DoorDelay to 18 frames(going into door).
_L8B5D:  LDA SamusDoorData       ;
_L8B5F:  JSR _Amul16              ;($C2C5)*16. Move scroll toggle data to upper 4 bits.
_L8B62:  ORA ObjAction           ;Keep Samus action so she will appear the same comming-->
_L8B65:  STA SamusDoorData       ;out of the door as she did going in.
_L8B67:  LDA #$05                ;
_L8B69:  STA ObjAction           ;Indicate Samus is in a door.
_L8B6C:* RTS                     ;
_L8B6D:* JSR _SetDoorEntryInfo    ;($8B53)Save Samus action and set door entry timer.
_L8B70:  JSR VertRoomCentered    ;($E21B)Room is centered. Toggle scroll.
_L8B73:  TXA                     ;X=#$01 or #$02(depending on which door Samus is in).
_SamusInDoor:
_L8B74:  ORA #$80                ;Set MSB of DoorStatus to indicate Samus has just-->
_L8B76:  STA DoorStatus          ;entered a door.
_L8B78:  RTS                     ;

;----------------------------------------------------------------------------------------------------

.checkpc DoorHandler
.advance DoorHandler

_L8B79:  LDX #$B0
_L8B7B:* JSR _L8B87
_L8B7E:  LAX PageIndex
_L8B81:  SBX #$10
_L8B84:  BMI _L8B7B
_L8B86:  RTS

.advance $8B87

_L8B87:  STX PageIndex
_L8B89:  LDA ObjAction,X
_L8B8C:  JSR _ChooseRoutine       ;($C27C)
_L8B8F:  .word ExitSub
_L8B91:  .word _L8B9D
_L8B93:  .word _L8BD5
_L8B95:  .word _L8C01
_L8B97:  .word _L8C84
_L8B99:  .word _L8CC6
_L8B9B:  .word _L8CF0

_L8B9D:  INC $0300,X
_L8BA0:  LDA #$30
_L8BA2:  JSR SetProjectileAnim       ;($D2FA)
_L8BA5:  JSR $8CFB
_L8BA8:  LDY $0307,X
_L8BAB:  LDA $8BD1,Y
_L8BAE:  STA $030F,X
_L8BB1:  LDA $0307,X
_L8BB4:  CMP #$03
_L8BB6:  BNE $8BBA
_L8BB8:  LDA #$01
_L8BBA:  ORA #$A0
_L8BBC:  STA $6B
_L8BBE:  LDA #$00
_L8BC0:  STA $030A,X
_L8BC3:  TXA 
_L8BC4:  AND #$10
_L8BC6:  EOR #$10
_L8BC8:  ORA $6B
_L8BCA:  STA $6B
_L8BCC:  LDA #$06
_L8BCE:  JMP AnimDrawObject
_L8BD1:  .byte $05, $01, $0A, $01

_L8BD5:  LDA $030A,X
_L8BD8:  AND #$04
_L8BDA:  BEQ $8BB1
_L8BDC:  DEC $030F,X
_L8BDF:  BNE $8BB1
_L8BE1:  LDA #$03
_L8BE3:  CMP $0307,X
_L8BE6:  BNE $8BEE
_L8BE8:  LDY $010B
_L8BEB:  INY 
_L8BEC:  BNE $8BB1
_L8BEE:  STA $0300,X
_L8BF1:  LDA #$50
_L8BF3:  STA $030F,X
_L8BF6:  LDA #$2C
_L8BF8:  STA $0305,X
_L8BFB:  SEC 
_L8BFC:  SBC #$03
_L8BFE:  JMP $8C7E

_L8C01:  LDA DoorStatus
_L8C03:  BEQ $8C1D
_L8C05:  LDA $030C
_L8C08:  EOR $030C,X
_L8C0B:  LSR 
_L8C0C:  BCS $8C1D
_L8C0E:  LDA $030E
_L8C11:  EOR $030E,X
_L8C14:  BMI $8C1D
_L8C16:  LDA #$04
_L8C18:  STA $0300,X
_L8C1B:  BNE $8C73

_L8C1D:  LDA $0306,X
_L8C20:  CMP $0305,X
_L8C23:  BCC $8C73
_L8C25:  LDA $030F,X
_L8C28:  CMP #$50
_L8C2A:  BNE $8C57
_L8C2C:  JSR $8CF7
_L8C2F:  LDA $0307,X
_L8C32:  CMP #$01
_L8C34:  BEQ $8C57
_L8C36:  CMP #$03
_L8C38:  BEQ $8C57
_L8C3A:  LDA #$0A
_L8C3C:  STA $09
_L8C3E:  LDA $030C,X
_L8C41:  STA $08
_L8C43:  LDY $50
_L8C45:  TXA 
_L8C46:  JSR _Amul16
_L8C49:  BCC $8C4C
_L8C4B:  DEY 
_L8C4C:  TYA 
_L8C4D:  JSR LDC1E
_L8C50:  LDA #$00
_L8C52:  STA $0300,X
_L8C55:  BEQ $8C73
_L8C57:  LDA $2D
_L8C59:  LSR 
_L8C5A:  BCS $8C73
_L8C5C:  DEC $030F,X
_L8C5F:  BNE $8C73
_L8C61:  LDA #$01
_L8C63:  STA $030F,X
_L8C66:  JSR $8CFB
_L8C69:  LDA #$02
_L8C6B:  STA $0300,X
_L8C6E:  JSR $8C76
_L8C71:  LDX PageIndex

_L8C73:  JMP $8BB1
_L8C76:  LDA #$30
_L8C78:  STA $0305,X
_L8C7B:  SEC 
_L8C7C:  SBC #$02
_L8C7E:  JSR SetProjectileAnimWithoutReset
_L8C81:  JMP SFXDoor

_L8C84:  LDA DoorStatus
_L8C86:  CMP #$05
_L8C88:  BCS $8CC3
_L8C8A:  JSR $8CFB
_L8C8D:  JSR $8C76
_L8C90:  LDX PageIndex
_L8C92:  LDA $91
_L8C94:  BEQ $8CA7
_L8C96:  TXA 
_L8C97:  JSR _Adiv16
_L8C9A:  EOR $91
_L8C9C:  LSR 
_L8C9D:  BCC $8CA7
_L8C9F:  LDA $76
_L8CA1:  EOR #$07
_L8CA3:  STA $76
_L8CA5:  STA $1C
_L8CA7:  INC $0300,X
_L8CAA:  LDA #$00
_L8CAC:  STA $91
_L8CAE:  LDA $0307,X
_L8CB1:  CMP #$03
_L8CB3:  BNE $8CC3
_L8CB5:  TXA 
_L8CB6:  JSR _Amul16
_L8CB9:  BCS $8CC0
_L8CBB:  JSR TourianMusic
_L8CBE:  BNE $8CC3
_L8CC0:  JSR MotherBrainMusic
_L8CC3:  JMP $8C71

_L8CC6:  LDA DoorStatus
_L8CC8:  CMP #$05
_L8CCA:  BNE $8CED
_L8CCC:  TXA 
_L8CCD:  EOR #$10
_L8CCF:  TAX 
_L8CD0:  LDA #$06
_L8CD2:  STA $0300,X
_L8CD5:  LDA #$2C
_L8CD7:  STA $0305,X
_L8CDA:  SEC 
_L8CDB:  SBC #$03
_L8CDD:  JSR SetProjectileAnimWithoutReset
_L8CE0:  JSR SFXDoor
_L8CE3:  JSR SelectSamusPal
_L8CE6:  LDX PageIndex
_L8CE8:  LDA #$02
_L8CEA:  STA $0300,X
_L8CED:  JMP $8BB1

_L8CF0:  LDA DoorStatus
_L8CF2:  BNE $8CED
_L8CF4:  JMP $8C61
_L8CF7:  LDA #$FF
_L8CF9:  BNE $8CFD
_L8CFB:  LDA #$4E

_L8CFD:  PHA 
_L8CFE:  LDA #$50
_L8D00:  STA $02
_L8D02:  TXA 
_L8D03:  JSR _Adiv16
_L8D06:  AND #$01
_L8D08:  TAY 
_L8D09:  LDA $8D3A,Y
_L8D0C:  STA $03
_L8D0E:  LDA $030C,X
_L8D11:  STA $0B
_L8D13:  JSR MakeCartRAMPtr
_L8D16:  LDY #$00
_L8D18:  PLA 
_L8D19:  STA ($04),Y
_L8D1B:  TAX 
_L8D1C:  TYA 
_L8D1D:  CLC 
_L8D1E:  ADC #$20
_L8D20:  TAY 
_L8D21:  TXA 
_L8D22:  CPY #$C0
_L8D24:  BNE $8D19
_L8D26:  LDX PageIndex
_L8D28:  TXA 
_L8D29:  lsr
         lsr
         asr #$0C
_L8D2E:  TAY 
_L8D2F:  LDA $04
_L8D31:  STA $005C,Y
_L8D34:  LDA $05
_L8D36:  STA $005D,Y
_L8D39:  RTS

.advance $8D3A

_L8D3A:  .byte $E8, $10, $60, $AD, $91, $69, $8D, $78, $68, $AD, $92, $69, $8D, $79, $68, $A9 
_L8D4A:  .byte $00, $85, $00, $85, $02, $AD, $97, $69, $29, $80, $F0, $06, $A5, $00, $09, $80
_L8D5A:  .byte $85, $00, $AD, $97, $69, $29

.scend