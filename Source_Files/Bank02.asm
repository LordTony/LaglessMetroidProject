;Norfair bank.

;-----------------------------------------[ Start of code ]------------------------------------------

Bank02_L8000:  JMP StartUpdateEnemyAnimation
Bank02_L8003:  JMP StartUpdateEnemyAnimation_2
Bank02_L8006:  JMP Start_Special_Attrs
Bank02_L8009:  JMP DoSomethingToFrameCount
Bank02_L800C:  JMP UpdateEnemyAnim     ;($E094)
Bank02_L800F:  JMP DoSomethingToAnimationIndecies
Bank02_L8012:  JMP DoSomethingToEnDataIndex
Bank02_L8015:  JMP UpdateEnemyHitpoints
Bank02_L8018:  JMP Bank07_LFBB9
Bank02_L801B:  JMP Bank07_LFB88
Bank02_L801E:  JMP Bank07_LFBCA
Bank02_L8021:  JMP Bank07_LF870
Bank02_L8024:  JMP ChooseRoutine       ;($C27C)
Bank02_L8027:  JMP Bank07_LFD8F
Bank02_L802A:  JMP Bank07_LEB6E
Bank02_L802D:  JMP $8244
Bank02_L8030:  JMP $8318
Bank02_L8033:  JMP Bank07_LFA1E
Bank02_L8036:  JMP $833F
Bank02_L8039:  JMP $8395
Bank02_L803C:  JMP SomethingAboutMovement
Bank02_L803F:  JMP DrawTileBlast
Bank02_L8042:  JMP SubtractHealth      ;($CE92)
Bank02_L8045:  JMP Base10Subtract      ;($C3FB)

Bank02_L8048:  .word $84FD, $84A6, $844A, $844A, $84A6, $84FD, $83F4, $83F4

Bank02_L8058:  LDX PageIndex
Bank02_L805A:  LDA $0405,X
Bank02_L805D:  ASL 
Bank02_L805E:  BMI ++++++++
Bank02_L8060:  LDA EnStatus,X
Bank02_L8063:  CMP #$02
Bank02_L8065:  BNE ++++++++
Bank02_L8067:  JSR $8244
Bank02_L806A:  LDA $00
Bank02_L806C:  BPL ++
Bank02_L806E:  JSR TwosCompliment      ;($C3D4)
Bank02_L8071:  STA $66
Bank02_L8073:* JSR $83F5
Bank02_L8076:  JSR $80B8
Bank02_L8079:  DEC $66
Bank02_L807B:  BNE -
Bank02_L807D:* BEQ ++
Bank02_L807F:  STA $66
Bank02_L8081:* JSR $844B
Bank02_L8084:  JSR $80FB
Bank02_L8087:  DEC $66
Bank02_L8089:  BNE -
Bank02_L808B:* JSR $8318
Bank02_L808E:  LDA $00
Bank02_L8090:  BPL ++
Bank02_L8092:  JSR TwosCompliment      ;($C3D4)
Bank02_L8095:  STA $66
Bank02_L8097:* JSR $84A7
Bank02_L809A:  JSR $816E
Bank02_L809D:  DEC $66
Bank02_L809F:  BNE -
Bank02_L80A1:* BEQ ++
Bank02_L80A3:  STA $66
Bank02_L80A5:* JSR $84FE
Bank02_L80A8:  JSR $8134
Bank02_L80AB:  DEC $66
Bank02_L80AD:  BNE -
Bank02_L80AF:* RTS
 
Bank02_L80B0:  LDY EnDataIndex,X
Bank02_L80B3:  LDA $977B,Y
Bank02_L80B6:  ASL             ;*2 
Bank02_L80B7:  RTS

Bank02_L80B8:  LDX PageIndex
Bank02_L80BA:  BCS $80FA
Bank02_L80BC:  LDA $0405,X
Bank02_L80BF:  BPL $80C7
Bank02_L80C1:  JSR $81FC
Bank02_L80C4:  JMP $80F6
Bank02_L80C7:  JSR $80B0
Bank02_L80CA:  BPL $80EA
Bank02_L80CC:  LDA $6B03,X
Bank02_L80CF:  BEQ $80C1
Bank02_L80D1:  BPL $80D8
Bank02_L80D3:  JSR $81B1
Bank02_L80D6:  BEQ $80E2
Bank02_L80D8:  SEC 
Bank02_L80D9:  ROR $0402,X
Bank02_L80DC:  ROR EnCounter,X
Bank02_L80DF:  JMP $80F6
Bank02_L80E2:  STA $0402,X
Bank02_L80E5:  STA EnCounter,X
Bank02_L80E8:  BEQ $80F6
Bank02_L80EA:  LDA $977B,Y
Bank02_L80ED:  LSR 
Bank02_L80EE:  LSR 
Bank02_L80EF:  BCC $80F6
Bank02_L80F1:  LDA #$04
Bank02_L80F3:  JSR $856B
Bank02_L80F6:  LDA #$01
Bank02_L80F8:  STA $66
Bank02_L80FA:  RTS
 
Bank02_L80FB:  LDX PageIndex
Bank02_L80FD:  BCS $8133
Bank02_L80FF:  LDA $0405,X
Bank02_L8102:  BPL $810A
Bank02_L8104:  JSR $81FC
Bank02_L8107:  JMP $812F
Bank02_L810A:  JSR $80B0
Bank02_L810D:  BPL $8123
Bank02_L810F:  LDA $6B03,X
Bank02_L8112:  BEQ $8104
Bank02_L8114:  BPL $8120
Bank02_L8116:  CLC 
Bank02_L8117:  ROR $0402,X
Bank02_L811A:  ROR EnCounter,X
Bank02_L811D:  JMP $812F
Bank02_L8120:  JSR $81B1
Bank02_L8123:  LDA $977B,Y
Bank02_L8126:  LSR 
Bank02_L8127:  LSR 
Bank02_L8128:  BCC $812F
Bank02_L812A:  LDA #$04
Bank02_L812C:  JSR $856B
Bank02_L812F:  LDA #$01
Bank02_L8131:  STA $66
Bank02_L8133:  RTS
 
Bank02_L8134:  LDX PageIndex
Bank02_L8136:  BCS $816D
Bank02_L8138:  JSR $80B0
Bank02_L813B:  BPL $815E
Bank02_L813D:  LDA $0405,X
Bank02_L8140:  BMI $8148
Bank02_L8142:  JSR $81C7
Bank02_L8145:  JMP $8169
Bank02_L8148:  LDA $6B03,X
Bank02_L814B:  BEQ $8142
Bank02_L814D:  BPL $8159
Bank02_L814F:  CLC 
Bank02_L8150:  ROR $0403,X
Bank02_L8153:  ROR $0407,X
Bank02_L8156:  JMP $8169
Bank02_L8159:  JSR $81C0
Bank02_L815C:  BEQ $8169
Bank02_L815E:  LDA $977B,Y
Bank02_L8161:  LSR 
Bank02_L8162:  BCC $8169
Bank02_L8164:  LDA #$01
Bank02_L8166:  JSR $856B
Bank02_L8169:  LDA #$01
Bank02_L816B:  STA $66
Bank02_L816D:  RTS

Bank02_L816E:  LDX PageIndex
Bank02_L8170:  BCS $81B0
Bank02_L8172:  JSR $80B0
Bank02_L8175:  BPL $81A0
Bank02_L8177:  LDA $0405,X
Bank02_L817A:  BMI $8182
Bank02_L817C:  JSR $81C7
Bank02_L817F:  JMP $81AC
Bank02_L8182:  LDA $6B03,X
Bank02_L8185:  BEQ $817C
Bank02_L8187:  BPL $818E
Bank02_L8189:  JSR $81C0
Bank02_L818C:  BEQ $8198
Bank02_L818E:  SEC 
Bank02_L818F:  ROR $0403,X
Bank02_L8192:  ROR $0407,X
Bank02_L8195:  JMP $81AC
Bank02_L8198:  STA $0403,X
Bank02_L819B:  STA $0407,X
Bank02_L819E:  BEQ $81AC
Bank02_L81A0:  JSR $80B0
Bank02_L81A3:  LSR 
Bank02_L81A4:  LSR 
Bank02_L81A5:  BCC $81AC
Bank02_L81A7:  LDA #$01
Bank02_L81A9:  JSR $856B
Bank02_L81AC:  LDA #$01
Bank02_L81AE:  STA $66
Bank02_L81B0:  RTS
 
Bank02_L81B1:  JSR $81B8
Bank02_L81B4:  STA $6AFE,X
Bank02_L81B7:  RTS

Bank02_L81B8:  LDA #$20
Bank02_L81BA:  JSR LF744
Bank02_L81BD:  LDA #$00
Bank02_L81BF:  RTS

Bank02_L81C0:  JSR $81B8
Bank02_L81C3:  STA $6AFF,X
Bank02_L81C6:  RTS

Bank02_L81C7:  JSR $81F6
Bank02_L81CA:  BNE $81F5
Bank02_L81CC:  LDA #$01
Bank02_L81CE:  JSR $856B
Bank02_L81D1:  LDA $6AFF,X
Bank02_L81D4:  JSR TwosCompliment
Bank02_L81D7:  STA $6AFF,X

Bank02_L81DA:  JSR $81F6
Bank02_L81DD:  BNE $81F5
Bank02_L81DF:  JSR $80B0
Bank02_L81E2:  SEC 
Bank02_L81E3:  BPL $81ED
Bank02_L81E5:  LDA #$00
Bank02_L81E7:  SBC $0407,X
Bank02_L81EA:  STA $0407,X
Bank02_L81ED:  LDA #$00
Bank02_L81EF:  SBC $0403,X
Bank02_L81F2:  STA $0403,X
Bank02_L81F5:  RTS

Bank02_L81F6:  JSR LF74B
Bank02_L81F9:  AND #$20
Bank02_L81FB:  RTS

Bank02_L81FC:  JSR $81F6
Bank02_L81FF:  BNE $81F5
Bank02_L8201:  LDA #$04
Bank02_L8203:  JSR $856B
Bank02_L8206:  LDA $6AFE,X
Bank02_L8209:  JSR TwosCompliment
Bank02_L820C:  STA $6AFE,X

Bank02_L820F:  JSR $81F6
Bank02_L8212:  BNE $822A
Bank02_L8214:  JSR $80B0
Bank02_L8217:  SEC 
Bank02_L8218:  BPL $8222
Bank02_L821A:  LDA #$00
Bank02_L821C:  SBC EnCounter,X
Bank02_L821F:  STA EnCounter,X
Bank02_L8222:  LDA #$00
Bank02_L8224:  SBC $0402,X
Bank02_L8227:  STA $0402,X
Bank02_L822A:  RTS 

Bank02_L822B:  LDA $0405,X
Bank02_L822E:  BPL $8232
Bank02_L8230:  LSR 
Bank02_L8231:  LSR 
Bank02_L8232:  LSR 
Bank02_L8233:  LDA $0408,X
Bank02_L8236:  ROL 
Bank02_L8237:  ASL 
Bank02_L8238:  TAY 
Bank02_L8239:  LDA $96DB,Y
Bank02_L823C:  STA $81
Bank02_L823E:  LDA $96DC,Y
Bank02_L8241:  STA $82
Bank02_L8243:  RTS

Bank02_L8244:  JSR $80B0
Bank02_L8247:  BPL $824C
Bank02_L8249:  JMP $833F
Bank02_L824C:  LDA $0405,X
Bank02_L824F:  AND #$20
Bank02_L8251:  EOR #$20
Bank02_L8253:  BEQ $82A2
Bank02_L8255:  JSR $822B
Bank02_L8258:  LDY EnCounter,X
Bank02_L825B:  LDA ($81),Y
Bank02_L825D:  CMP #$F0
Bank02_L825F:  BCC $827F
Bank02_L8261:  CMP #$FA
Bank02_L8263:  BEQ $827C
Bank02_L8265:  CMP #$FB
Bank02_L8267:  BEQ $82B0
Bank02_L8269:  CMP #$FC
Bank02_L826B:  BEQ $82B3
Bank02_L826D:  CMP #$FD
Bank02_L826F:  BEQ $82A5
Bank02_L8271:  CMP #$FE
Bank02_L8273:  BEQ $82DE
Bank02_L8275:  LDA #$00
Bank02_L8277:  STA EnCounter,X
Bank02_L827A:  BEQ $8258
Bank02_L827C:  JMP $8312
Bank02_L827F:  SEC 
Bank02_L8280:  SBC EnDelay,X
Bank02_L8283:  BNE $8290
Bank02_L8285:  STA EnDelay,X
Bank02_L8288:  INY 
Bank02_L8289:  INY 
Bank02_L828A:  TYA 
Bank02_L828B:  STA EnCounter,X
Bank02_L828E:  BNE $825B
Bank02_L8290:  INC EnDelay,X
Bank02_L8293:  INY 
Bank02_L8294:  LDA ($81),Y
Bank02_L8296:  ASL 
Bank02_L8297:  PHP 
Bank02_L8298:  JSR Adiv32          ;($C2BE)Divide by 32.
Bank02_L829B:  PLP 
Bank02_L829C:  BCC $82A2
Bank02_L829E:  EOR #$FF
Bank02_L82A0:  ADC #$00
Bank02_L82A2:  STA $00
Bank02_L82A4:  RTS

Bank02_L82A5:  INC EnCounter,X
Bank02_L82A8:  INY 
Bank02_L82A9:  LDA #$00
Bank02_L82AB:  STA $6B01,X
Bank02_L82AE:  BEQ $825B
Bank02_L82B0:  PLA 
Bank02_L82B1:  PLA 
Bank02_L82B2:  RTS

Bank02_L82B3:  LDA $6B03,X
Bank02_L82B6:  BPL $82BE
Bank02_L82B8:  JSR GrowRadius
Bank02_L82BB:  JMP $82C3
Bank02_L82BE:  BEQ $82D2
Bank02_L82C0:  JSR ShrinkRadius
Bank02_L82C3:  LDX PageIndex
Bank02_L82C5:  BCS $82D2
Bank02_L82C7:  LDY EnCounter,X
Bank02_L82CA:  INY 
Bank02_L82CB:  LDA #$00
Bank02_L82CD:  STA $6B03,X
Bank02_L82D0:  BEQ $82D7
Bank02_L82D2:  LDY EnCounter,X
Bank02_L82D5:  DEY 
Bank02_L82D6:  DEY 
Bank02_L82D7:  TYA 
Bank02_L82D8:  STA EnCounter,X
Bank02_L82DB:  JMP $825B
Bank02_L82DE:  DEY 
Bank02_L82DF:  DEY 
Bank02_L82E0:  TYA 
Bank02_L82E1:  STA EnCounter,X
Bank02_L82E4:  LDA $6B03,X
Bank02_L82E7:  BPL $82EF
Bank02_L82E9:  JSR GrowRadius
Bank02_L82EC:  JMP $82F4
Bank02_L82EF:  BEQ $82FB
Bank02_L82F1:  JSR ShrinkRadius
Bank02_L82F4:  LDX PageIndex
Bank02_L82F6:  BCC $82FB
Bank02_L82F8:  JMP $8258
Bank02_L82FB:  LDY EnDataIndex,X
Bank02_L82FE:  LDA $968B,Y
Bank02_L8301:  AND #$20
Bank02_L8303:  BEQ $8312
Bank02_L8305:  LDA $0405,X
Bank02_L8308:  EOR #$05
Bank02_L830A:  ORA $968B,Y
Bank02_L830D:  AND #$1F
Bank02_L830F:  STA $0405,X
Bank02_L8312:  JSR $81B1
Bank02_L8315:  JMP $82A2
Bank02_L8318:  JSR $80B0
Bank02_L831B:  BPL $8320
Bank02_L831D:  JMP $8395
Bank02_L8320:  LDA $0405,X
Bank02_L8323:  AND #$20
Bank02_L8325:  EOR #$20
Bank02_L8327:  BEQ $833C
Bank02_L8329:  LDY EnCounter,X
Bank02_L832C:  INY 
Bank02_L832D:  LDA ($81),Y
Bank02_L832F:  TAX 
Bank02_L8330:  AND #$08
Bank02_L8332:  PHP 
Bank02_L8333:  TXA 
Bank02_L8334:  AND #$07
Bank02_L8336:  PLP 
Bank02_L8337:  BEQ $833C
Bank02_L8339:  JSR TwosCompliment
Bank02_L833C:  STA $00
Bank02_L833E:  RTS

Bank02_L833F:  LDY #$0E
Bank02_L8341:  LDA $6AFE,X
Bank02_L8344:  BMI $835E
Bank02_L8346:  CLC 
Bank02_L8347:  ADC EnCounter,X
Bank02_L834A:  STA EnCounter,X
Bank02_L834D:  LDA $0402,X
Bank02_L8350:  ADC #$00
Bank02_L8352:  STA $0402,X
Bank02_L8355:  BPL $8376
Bank02_L8357:  JSR TwosCompliment
Bank02_L835A:  LDY #$F2
Bank02_L835C:  BNE $8376
Bank02_L835E:  JSR TwosCompliment
Bank02_L8361:  SEC 
Bank02_L8362:  STA $00
Bank02_L8364:  LDA EnCounter,X
Bank02_L8367:  SBC $00
Bank02_L8369:  STA EnCounter,X
Bank02_L836C:  LDA $0402,X
Bank02_L836F:  SBC #$00
Bank02_L8371:  STA $0402,X
Bank02_L8374:  BMI $8357
Bank02_L8376:  CMP #$0E
Bank02_L8378:  BCC $8383
Bank02_L837A:  LDA #$00
Bank02_L837C:  STA EnCounter,X
Bank02_L837F:  TYA 
Bank02_L8380:  STA $0402,X
Bank02_L8383:  LDA $6AFC,X
Bank02_L8386:  CLC 
Bank02_L8387:  ADC EnCounter,X
Bank02_L838A:  STA $6AFC,X
Bank02_L838D:  LDA #$00
Bank02_L838F:  ADC $0402,X
Bank02_L8392:  STA $00
Bank02_L8394:  RTS

Bank02_L8395:  LDA #$00
Bank02_L8397:  STA $00
Bank02_L8399:  STA $02
Bank02_L839B:  LDA #$0E
Bank02_L839D:  STA $01
Bank02_L839F:  STA $03
Bank02_L83A1:  LDA $0407,X
Bank02_L83A4:  CLC 
Bank02_L83A5:  ADC $6AFF,X
Bank02_L83A8:  STA $0407,X
Bank02_L83AB:  STA $04
Bank02_L83AD:  LDA #$00
Bank02_L83AF:  LDY $6AFF,X
Bank02_L83B2:  BPL $83B6
Bank02_L83B4:  LDA #$FF
Bank02_L83B6:  ADC $0403,X
Bank02_L83B9:  STA $0403,X
Bank02_L83BC:  TAY 
Bank02_L83BD:  BPL $83D0
Bank02_L83BF:  LDA #$00
Bank02_L83C1:  SEC 
Bank02_L83C2:  SBC $0407,X
Bank02_L83C5:  STA $04
Bank02_L83C7:  LDA #$00
Bank02_L83C9:  SBC $0403,X
Bank02_L83CC:  TAY 
Bank02_L83CD:  JSR LE449
Bank02_L83D0:  LDA $04
Bank02_L83D2:  CMP $02
Bank02_L83D4:  TYA 
Bank02_L83D5:  SBC $03
Bank02_L83D7:  BCC $83E3
Bank02_L83D9:  LDA $00
Bank02_L83DB:  STA $0407,X
Bank02_L83DE:  LDA $01
Bank02_L83E0:  STA $0403,X
Bank02_L83E3:  LDA $6AFD,X
Bank02_L83E6:  CLC 
Bank02_L83E7:  ADC $0407,X
Bank02_L83EA:  STA $6AFD,X
Bank02_L83ED:  LDA #$00
Bank02_L83EF:  ADC $0403,X
Bank02_L83F2:  STA $00
Bank02_L83F4:  RTS

Bank02_L83F5:  LDX PageIndex
Bank02_L83F7:  LDA EnYRoomPos,X
Bank02_L83FA:  SEC 
Bank02_L83FB:  SBC EnRadY,X
Bank02_L83FE:  AND #$07
Bank02_L8400:  SEC 
Bank02_L8401:  BNE $8406
Bank02_L8403:  JSR GrowRadius
Bank02_L8406:  LDY #$00
Bank02_L8408:  STY $00
Bank02_L840A:  LDX PageIndex
Bank02_L840C:  BCC $844A
Bank02_L840E:  INC $00
Bank02_L8410:  LDY EnYRoomPos,X
Bank02_L8413:  BNE $8429
Bank02_L8415:  LDY #$F0
Bank02_L8417:  LDA $49
Bank02_L8419:  CMP #$02
Bank02_L841B:  BCS $8429
Bank02_L841D:  LDA $FC
Bank02_L841F:  BEQ $844A
Bank02_L8421:  JSR $8563
Bank02_L8424:  BEQ $844A
Bank02_L8426:  JSR $855A
Bank02_L8429:  DEY 
Bank02_L842A:  TYA 
Bank02_L842B:  STA EnYRoomPos,X
Bank02_L842E:  CMP EnRadY,X
Bank02_L8431:  BNE $8441
Bank02_L8433:  LDA $FC
Bank02_L8435:  BEQ $843C
Bank02_L8437:  JSR $8563
Bank02_L843A:  BNE $8441
Bank02_L843C:  INC EnYRoomPos,X
Bank02_L843F:  CLC 
Bank02_L8440:  RTS

Bank02_L8441:  LDA $0405,X
Bank02_L8444:  BMI $8449
Bank02_L8446:  INC $6B01,X
Bank02_L8449:  SEC 
Bank02_L844A:  RTS

Bank02_L844B:  LDX PageIndex
Bank02_L844D:  LDA EnYRoomPos,X
Bank02_L8450:  CLC 
Bank02_L8451:  ADC EnRadY,X
Bank02_L8454:  AND #$07
Bank02_L8456:  SEC 
Bank02_L8457:  BNE $845C
Bank02_L8459:  JSR ShrinkRadius
Bank02_L845C:  LDY #$00
Bank02_L845E:  STY $00
Bank02_L8460:  LDX PageIndex
Bank02_L8462:  BCC $84A6
Bank02_L8464:  INC $00
Bank02_L8466:  LDY EnYRoomPos,X
Bank02_L8469:  CPY #$EF
Bank02_L846B:  BNE $8481
Bank02_L846D:  LDY #$FF
Bank02_L846F:  LDA $49
Bank02_L8471:  CMP #$02
Bank02_L8473:  BCS $8481
Bank02_L8475:  LDA $FC
Bank02_L8477:  BEQ $84A6
Bank02_L8479:  JSR $8563
Bank02_L847C:  BNE $84A6
Bank02_L847E:  JSR $855A
Bank02_L8481:  INY 
Bank02_L8482:  TYA 
Bank02_L8483:  STA EnYRoomPos,X
Bank02_L8486:  CLC 
Bank02_L8487:  ADC EnRadY,X
Bank02_L848A:  CMP #$EF
Bank02_L848C:  BNE $849D
Bank02_L848E:  LDA $FC
Bank02_L8490:  BEQ $8497
Bank02_L8492:  JSR $8563
Bank02_L8495:  BEQ $849D
Bank02_L8497:  DEC EnYRoomPos,X
Bank02_L849A:  CLC 
Bank02_L849B:  BCC $84A6
Bank02_L849D:  LDA $0405,X
Bank02_L84A0:  BMI $84A5
Bank02_L84A2:  DEC $6B01,X
Bank02_L84A5:  SEC 
Bank02_L84A6:  RTS

Bank02_L84A7:  LDX PageIndex
Bank02_L84A9:  LDA EnXRoomPos,X
Bank02_L84AC:  SEC 
Bank02_L84AD:  SBC EnRadX,X
Bank02_L84B0:  AND #$07
Bank02_L84B2:  SEC 
Bank02_L84B3:  BNE $84B8
Bank02_L84B5:  JSR GrowRadiusX
Bank02_L84B8:  LDY #$00
Bank02_L84BA:  STY $00
Bank02_L84BC:  LDX PageIndex
Bank02_L84BE:  BCC $84FD
Bank02_L84C0:  INC $00
Bank02_L84C2:  LDY EnXRoomPos,X
Bank02_L84C5:  BNE $84DA
Bank02_L84C7:  LDA $49
Bank02_L84C9:  CMP #$02
Bank02_L84CB:  BCC $84DA
Bank02_L84CD:  LDA $FD
Bank02_L84CF:  BEQ $84D4
Bank02_L84D1:  JSR $8563
Bank02_L84D4:  CLC 
Bank02_L84D5:  BEQ $84FD
Bank02_L84D7:  JSR $855A
Bank02_L84DA:  DEC EnXRoomPos,X
Bank02_L84DD:  LDA EnXRoomPos,X
Bank02_L84E0:  CMP EnRadX,X
Bank02_L84E3:  BNE $84F4
Bank02_L84E5:  LDA $FD
Bank02_L84E7:  BEQ $84EE
Bank02_L84E9:  JSR $8563
Bank02_L84EC:  BNE $84F4
Bank02_L84EE:  INC EnXRoomPos,X
Bank02_L84F1:  CLC 
Bank02_L84F2:  BCC $84FD
Bank02_L84F4:  LDA $0405,X
Bank02_L84F7:  BPL $84FC
Bank02_L84F9:  INC $6B01,X
Bank02_L84FC:  SEC 
Bank02_L84FD:  RTS

Bank02_L84FE:  LDX PageIndex
Bank02_L8500:  LDA EnXRoomPos,X
Bank02_L8503:  CLC 
Bank02_L8504:  ADC EnRadX,X
Bank02_L8507:  AND #$07
Bank02_L8509:  SEC 
Bank02_L850A:  BNE $850F
Bank02_L850C:  JSR ShrinkRadiusX
Bank02_L850F:  LDY #$00
Bank02_L8511:  STY $00
Bank02_L8513:  LDX PageIndex
Bank02_L8515:  BCC $8559
Bank02_L8517:  INC $00
Bank02_L8519:  INC EnXRoomPos,X
Bank02_L851C:  BNE $8536
Bank02_L851E:  LDA $49
Bank02_L8520:  CMP #$02
Bank02_L8522:  BCC $8536
Bank02_L8524:  LDA $FD
Bank02_L8526:  BEQ $852D
Bank02_L8528:  JSR $8563
Bank02_L852B:  BEQ $8533
Bank02_L852D:  DEC EnXRoomPos,X
Bank02_L8530:  CLC 
Bank02_L8531:  BCC $8559
Bank02_L8533:  JSR $855A
Bank02_L8536:  LDA EnXRoomPos,X
Bank02_L8539:  CLC 
Bank02_L853A:  ADC EnRadX,X
Bank02_L853D:  CMP #$FF
Bank02_L853F:  BNE $8550
Bank02_L8541:  LDA $FD
Bank02_L8543:  BEQ $854A
Bank02_L8545:  JSR $8563
Bank02_L8548:  BEQ $8550
Bank02_L854A:  DEC EnXRoomPos,X
Bank02_L854D:  CLC 
Bank02_L854E:  BCC $8559
Bank02_L8550:  LDA $0405,X
Bank02_L8553:  BPL $8558
Bank02_L8555:  DEC $6B01,X
Bank02_L8558:  SEC 
Bank02_L8559:  RTS

Bank02_L855A:  LDA EnNameTable,X
Bank02_L855D:  EOR #$01
Bank02_L855F:  STA EnNameTable,X
Bank02_L8562:  RTS

Bank02_L8563:  LDA EnNameTable,X
Bank02_L8566:  EOR $FF
Bank02_L8568:  AND #$01
Bank02_L856A:  RTS

Bank02_L856B:  EOR $0405,X
Bank02_L856E:  STA $0405,X
Bank02_L8571:  RTS 

;---------------------------------[ Object animation data tables ]----------------------------------

;The following tables are indices into the FramePtrTable that correspond to various animations. The
;FramePtrTable represents individual frames and the entries in ObjectAnimIdxTbl are the groups of
;frames responsible for animaton Samus, her weapons and other objects.

.checkpc ObjectAnimIdxTbl
.advance ObjectAnimIdxTbl

;Samus run animation.
Bank02_L8572:  .byte $03, $04, $05, $FF

;Samus front animation.
Bank02_L8576:  .byte $07, $FF

;Samus jump out of ball animation.
Bank02_L8578:  .byte $17

;Samus Stand animation.
Bank02_L8579:  .byte $08, $FF

;Samus stand and fire animation.
Bank02_L857B:  .byte $22, $FF

;Samus stand and jump animation.
Bank02_L857D:  .byte $04

;Samus Jump animation.
Bank02_L857E:  .byte $10, $FF

;Samus summersault animation.
Bank02_L8580:  .byte $17, $18, $19, $1A, $FF

;Samus run and jump animation.
Bank02_L8585:  .byte $03, $17, $FF

;Samus roll animation.
Bank02_L8588:  .byte $1E, $1D, $1C, $1B, $FF

;Bullet animation.
Bank02_L858D:  .byte $28, $FF

;Bullet hit animation.
Bank02_L858F:  .byte $2A, $F7, $FF

;Samus jump and fire animation.
Bank02_L8592:  .byte $12, $FF

;Samus run and fire animation.
Bank02_L8594:  .byte $0C, $0D, $0E, $FF

;Samus point up and shoot animation.
Bank02_L8598:  .byte $30 

;Samus point up animation.
Bank02_L8599:  .byte $2B, $FF

;Door open animation.
Bank02_L859B:  .byte $31, $31, $33, $F7, $FF

;Door close animation.
Bank02_L85A0:  .byte $33, $33, $31, $FF

;Samus explode animation.
Bank02_L85A4: .byte $35, $FF

;Samus jump and point up animation.
Bank02_L85A6: .byte $39, $38, $FF

;Samus run and point up animation.
Bank02_L85A9:  .byte $40, $41, $42, $FF

;Samus run, point up and shoot animation 1.
Bank02_L85AD:  .byte $46, $FF

;Samus run, point up and shoot animation 2.
Bank02_L85AF:  .byte $47, $FF

;Samus run, point up and shoot animation 3.
Bank02_L85B1:  .byte $48, $FF

;Samus on elevator animation 1.
Bank02_L85B3:  .byte $07, $F7, $F7, $07, $F7, $F7, $F7, $07, $F7, $F7, $F7, $F7, $07, $F7, $FF

;Samus on elevator animation 2.
Bank02_L85C2:  .byte $23, $F7, $F7, $23, $F7, $F7, $F7, $23, $F7, $F7, $F7, $F7, $23, $F7, $FF

;Samus on elevator animation 3.
Bank02_L85D1:  .byte $07, $F7, $F7, $F7, $F7, $07, $F7, $F7, $F7, $07, $F7, $F7, $07, $F7, $FF

;Samus on elevator animation 4.
Bank02_L85E0:  .byte $23, $F7, $F7, $F7, $F7, $23, $F7, $F7, $F7, $23, $F7, $F7, $23, $F7, $FF

;Wave beam animation.
Bank02_L85EF:  .byte $4B, $FF

;Bomb tick animation.
Bank02_L85F1:  .byte $4E, $4F, $FF

;Bomb explode animation.
Bank02_L85F4:  .byte $3C, $4A, $49, $4A, $4D, $4A, $4D, $F7, $FF

;Missile left animation.
Bank02_L85FD:  .byte $26, $FF

;Missile right animation.
Bank02_L85FF:  .byte $25, $FF

;Missile up animation.
Bank02_L8601:  .byte $27, $FF

;Missile explode animation.
Bank02_L8603:  .byte $67, $67, $67, $68, $68, $69, $F7, $FF

;----------------------------[ Sprite drawing pointer tables ]--------------------------------------

;The above animation pointers provide an index into the following table
;for the animation sequences.

.checkpc FramePtrTable
.advance FramePtrTable

Bank02_L860B:  .word $87CB, $87CB, $87CB, $87CB, $87DD, $87F0, $8802, $8802
Bank02_L861B:  .word $8818, $882C, $882C, $882C, $882C, $883E, $8851, $8863
Bank02_L862B:  .word $8863, $8874, $8874, $8885, $8885, $8885, $8885, $8885
Bank02_L863B:  .word $888F, $8899, $88A3, $88AD, $88B8, $88C3, $88CE, $88D9
Bank02_L864B:  .word $88D9, $88D9, $88D9, $88EE, $88F8, $88F8, $88FE, $8904
Bank02_L865B:  .word $890A, $890F, $890F, $8914, $8928, $8928, $8928, $8928
Bank02_L866B:  .word $8928, $893C, $8948, $8948, $8954, $8954, $8961, $8961
Bank02_L867B:  .word $8961, $8974, $8987, $8987, $8987, $8995, $8995, $8995
Bank02_L868B:  .word $8995, $89A9, $89BE, $89D2, $89D2, $89D2, $89D2, $89E6
Bank02_L869B:  .word $89FB, $8A0F, $8A1D, $8A21, $8A26, $8A26, $8A3C, $8A41
Bank02_L86AB:  .word $8A46, $8A4E, $8A56, $8A5E, $8A66, $8A6E, $8A76, $8A7E
Bank02_L86BB:  .word $8A86, $8A8E, $8A9C, $8AA1, $8AA6, $8AAE, $8ABA, $8AC4
Bank02_L86CB:  .word $8AC4, $8AC4, $8AC4, $8AC4, $8AC4, $8AC4, $8AD8, $8AE9
Bank02_L86DB:  .word $8AF3, $8B03

;The following table provides pointers to data used for the placement of the sprites that make up
;Samus and other non-enemy objects.

.checkpc PlacePtrTable
.advance PlacePtrTable

Bank02_L86DF:  .word $8701, $871F, $872B, $8737, $8747, $8751, $86FD, $875D
Bank02_L86EF:  .word $8775, $878D, $8791, $8799, $87A5, $8749, $87B1

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
Bank02_L86FD:  .byte $E8, $FC, $EA, $FC

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
Bank02_L8701:  .byte $F0, $F8, $F0, $00, $F8, $F0, $F8, $F8, $F8, $00, $00, $F8, $00, $00, $00, $08
;              +--8--+   +--9--+   +--A--+   +--B--+   +--C--+   +--D--+   +--E--+
Bank02_L8711:  .byte $08, $F8, $08, $00, $08, $08, $F8, $F4, $F8, $F6, $EC, $F4, $EE, $F4

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
Bank02_L871F:  .byte $F3, $F8, $F3, $00, $FB, $F8, $FB, $00, $03, $F8, $03, $00 

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
Bank02_L872B:  .byte $F8, $F6, $F8, $FE, $F8, $06, $00, $F6, $00, $FE, $00, $06

;Elevator frame.
;          +--------+--------+--------+--------+--------+--------+--------+--------+
;          |        |        |        |        |        |        |        |        |
;          |        |        |        |        |        |        |        |        |
;          |        |        *        |        |        |        |        |        |
;          |       0|       1|       2|       3|       4|       5|       6|       7|
;          +--------+--------+--------+--------+--------+--------+--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+   +--4--+   +--5--+   +--6--+   +--7--+
Bank02_L8737:  .byte $FC, $F0, $FC, $F8, $FC, $00, $FC, $08, $FC, $10, $FC, $18, $FC, $20, $FC, $28

;Several projectile frames.
;          +--------+
;          |        |
;          |        |
;          |    *   |
;          |       0|
;          +--------+
;              +--0--+
Bank02_L8747:  .byte $FC, $FC

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
Bank02_L8749:  .byte $F8, $F8, $F8, $00, $00, $F8, $00, $00

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
Bank02_L8751:  .byte $E8, $00, $F0, $00, $F8, $00, $00, $00, $08, $00, $10, $00 

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
Bank02_L875D:  .byte $80, $80, $81, $81, $82, $82, $83, $83, $84, $84, $85, $85, $F4, $F8, $F4, $00
;              +--2--+   +--3--+   +--4--+   +--5--+
Bank02_L876D:  .byte $FC, $F8, $FC, $00, $04, $F8, $04, $00

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
Bank02_L8775:  .byte $F0, $00, $F0, $08, $F8, $08, $F0, $F0, $F0, $F8, $F8, $F0, $00, $F0, $08, $F0
;              +--8--+   +--9--+   +--A--+   +--B--+
Bank02_L8785:  .byte $08, $F8, $00, $08, $08, $00, $08, $08

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
Bank02_L878D:  .byte $F8, $FC, $00, $FC

;Missile left/right and missile explode frames.
;          +--------+--------+        +--------+--------+
;          |        |        |        |        |        |
;          |        |        |        |        |        |
;          |        *        |        |        |        |
;          |       0|       1|        |       2|       3|
;          +--------+--------+        +--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+
Bank02_L8791:  .byte $FC, $F8, $FC, $00, $FC, $10, $FC, $18

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
Bank02_L8799:  .byte $FC, $F0, $F4, $F8, $F4, $00, $FC, $08, $04, $F8, $04, $00

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
Bank02_L87A5:  .byte $FC, $E8, $EC, $F0, $EC, $08, $FC, $10, $0C, $F0, $0C, $08

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
Bank02_L87B1:  .byte $00, $F8, $00, $00, $08, $F8, $08, $00, $E8, $F0, $E8, $F8, $E8, $00, $F0, $F0
;              +--8--+   +--9--+   +--A--+   +--B--+   +--C--+
Bank02_L87C1:  .byte $F0, $F8, $F0, $00, $F8, $F0, $F8, $F8, $F8, $00

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
Bank02_L87CB:  .byte $40, $0F, $04, $00, $01, $FD, $20, $FE, $41, $40, $FD, $60, $20, $21, $FE, $FE
Bank02_L87DB:  .byte $31, $FF

;Samus run.
Bank02_L87DD:  .byte $40, $0F, $04, $02, $03, $FD, $20, $FE, $43, $42, $FD, $60, $22, $23, $FE, $32
Bank02_L87ED:  .byte $33, $34, $FF

;Samus run.
Bank02_L87F0:  .byte $40, $0F, $04, $05, $06, $FD, $20, $FE, $45, $44, $FD, $60, $25, $26, $27, $35
Bank02_L8800:  .byte $36, $FF

;Samus facing forward.
Bank02_L8802:  .byte $00, $0F, $04, $09, $FD, $60, $09, $FD, $20, $FE, $19, $1A, $FD, $20, $29, $2A
Bank02_L8812:  .byte $FE, $39, $FD, $60, $39, $FF

;Samus stand.
Bank02_L8818:  .byte $40, $0F, $04, $FD, $20, $0E, $0D, $FE, $1E, $1D, $2E, $2D, $FE, $FD, $60, $3B
Bank02_L8828:  .byte $3C, $FE, $17, $FF

;Samus run and fire.
Bank02_L882C:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $20, $21, $FE, $FE
Bank02_L883C:  .byte $31, $FF

;Samus run and fire.
Bank02_L883E:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $22, $23, $FE, $32
Bank02_L884E:  .byte $33, $34, $FF

;Samus run and fire.
Bank02_L8851:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $25, $26, $27, $35
Bank02_L8861:  .byte $36, $FF

;Samus stand and jump.
Bank02_L8863:  .byte $40, $0F, $04, $00, $01, $FD, $20, $FE, $41, $40, $FD, $60, $22, $07, $08, $32
Bank02_L8873:  .byte $FF

;Samus jump and fire.
Bank02_L8874:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $22, $07, $08, $32
Bank02_L8884:  .byte $FF

;Samus summersault.
Bank02_L8885:  .byte $41, $0F, $04, $52, $53, $62, $63, $72, $73, $FF

;Samus summersault.
Bank02_L888F:  .byte $42, $0F, $04, $54, $55, $56, $64, $65, $66, $FF

;Samus summersault.
Bank02_L8899:  .byte $81, $0F, $04, $52, $53, $62, $63, $72, $73, $FF

;Samus summersault.
Bank02_L88A3:  .byte $82, $0F, $04, $54, $55, $56, $64, $65, $66, $FF

;Samus roll.
Bank02_L88AD:  .byte $01, $08, $04, $FC, $03, $00, $50, $51, $60, $61, $FF

;Samus roll.
Bank02_L88B8:  .byte $81, $08, $04, $FC, $FD, $00, $50, $51, $60, $61, $FF

;Samus roll.
Bank02_L88C3:  .byte $C1, $08, $04, $FC, $FD, $00, $50, $51, $60, $61, $FF

;Samus roll.
Bank02_L88CE:  .byte $41, $08, $04, $FC, $03, $00, $50, $51, $60, $61, $FF

;Samus stand and fire.
Bank02_L88D9:  .byte $40, $0F, $04, $FD, $20, $0E, $0D, $FE, $1E, $1D, $2E, $2D, $FE, $FD, $60, $3B
Bank02_L88E9:  .byte $3C, $FE, $FE, $17, $FF

;Elevator.
Bank02_L88EE:  .byte $03, $04, $10, $28, $38, $38, $FD, $60, $28, $FF

;Missile right.
Bank02_L88F8:  .byte $4A, $04, $08, $5E, $5F, $FF

;Missile left.
Bank02_L88FE:  .byte $0A, $04, $08, $5E, $5F, $FF

;Missile up.
Bank02_L8904:  .byte $09, $08, $04, $14, $24, $FF

;Bullet fire.
Bank02_L890A:  .byte $04, $02, $02, $30, $FF

;Bullet hit.
Bank02_L890F:  .byte $04, $00, $00, $04, $FF

;Samus stand and point up.
Bank02_L8914:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $2E, $2D, $FE, $FD
Bank02_L8924:  .byte $60, $3B, $3C, $FF

;Samus from ball to pointing up.
Bank02_L8928:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $2E, $2D, $FE, $FD
Bank02_L8938:  .byte $60, $3B, $3C, $FF

;Door closed.
Bank02_L893C:  .byte $35, $18, $08, $0F, $1F, $2F, $FD, $A3, $2F, $1F, $0F, $FF

;Door open/close.
Bank02_L8948:  .byte $35, $18, $04, $6A, $6B, $6C, $FD, $A3, $6C, $6B, $6A, $FF

;Samus explode.
Bank02_L8954:  .byte $07, $00, $00, $FC, $FC, $00, $0B, $0C, $1B, $1C, $2B, $2C, $FF

;Samus jump and point up.
Bank02_L8961:  .byte $46, $0F, $04, $69, $FD, $20, $FE, $7A, $79, $FE, $78, $77, $FD, $60, $22, $07
Bank02_L8971:  .byte $08, $32, $FF

;Samus jump and point up.
Bank02_L8974:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $07
Bank02_L8984:  .byte $08, $32, $FF

;Bomb explode.
Bank02_L8987:  .byte $0D, $0C, $0C, $74, $FD, $60, $74, $FD, $A0, $74, $FD, $E0, $74, $FF

;Samus run and point up.
Bank02_L8995:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $20, $21
Bank02_L89A5:  .byte $FE, $FE, $31, $FF

;Samus run and point up.
Bank02_L89A9:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $23
Bank02_L89B9:  .byte $FE, $32, $33, $34, $FF

;Samus run and point up.
Bank02_L89BE:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $25, $26
Bank02_L89CE:  .byte $27, $35, $36, $FF

;Samus run and point up.
Bank02_L89D2:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $20, $21
Bank02_L89E2:  .byte $FE, $FE, $31, $FF

;Samus point up, run and fire.
Bank02_L89E6:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $23
Bank02_L89F6:  .byte $FE, $32, $33, $34, $FF

;Samus point up, run and fire.
Bank02_L89FB:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $25, $26
Bank02_L8A0B:  .byte $27, $35, $36, $FF

;Bomb explode.
Bank02_L8A0F:  .byte $0D, $0C, $0C, $75, $FD, $60, $75, $FD, $A0, $75, $FD, $E0, $75, $FF

;Bomb explode.
Bank02_L8A1D:  .byte $00, $00, $00, $FF

;Wave beam.
Bank02_L8A21:  .byte $04, $04, $04, $4C, $FF

;Bomb explode.
Bank02_L8A26:  .byte $08, $10, $10, $3D, $3E, $4E, $FD, $60, $3E, $3D, $4E, $FD, $E0, $4E, $3E, $3D
Bank02_L8A36:  .byte $FD, $A0, $4E, $3D, $3E, $FF

;Bomb tick.
Bank02_L8A3C:  .byte $04, $04, $04, $70, $FF

;Bomb tick.
Bank02_L8A41:  .byte $04, $04, $04, $71, $FF

;Bomb item.
Bank02_L8A46:  .byte $0D, $03, $03, $86, $87, $96, $97, $FF

;High jump item.
Bank02_L8A4E:  .byte $0D, $03, $03, $7B, $7C, $8B, $8C, $FF

;Long beam item.
Bank02_L8A56:  .byte $0D, $03, $03, $88, $67, $98, $99, $FF

;Screw attack item.
Bank02_L8A5E:  .byte $0D, $03, $03, $80, $81, $90, $91, $FF

;Maru Mari item.
Bank02_L8A66:  .byte $0D, $03, $03, $7D, $7E, $8D, $8E, $FF

;Varia item.
Bank02_L8A6E:  .byte $0D, $03, $03, $82, $83, $92, $93, $FF

;Wave beam item.
Bank02_L8A76:  .byte $0D, $03, $03, $88, $89, $98, $99, $FF

;Ice beam item.
Bank02_L8A7E:  .byte $0D, $03, $03, $88, $68, $98, $99, $FF

;Energy tank item.
Bank02_L8A86:  .byte $0D, $03, $03, $84, $85, $94, $95, $FF

;Missile item.
Bank02_L8A8E:  .byte $0D, $03, $03, $3F, $FD, $40, $3F, $FD, $00, $4F, $FD, $40, $4F, $FF

;Skree burrow.
Bank02_L8A9C:  .byte $34, $04, $04, $F2, $FF

;Not used.
Bank02_L8AA1:  .byte $04, $00, $00, $5A, $FF, $13, $00, $00, $B0, $B1, $B2, $B3, $FF, $13, $00, $00
Bank02_L8AB1:  .byte $B4, $B5, $B6, $B7, $B8, $B6, $B9, $B3, $FF, $13, $00, $00, $B3, $BA, $BA, $FE
Bank02_L8AC1:  .byte $80, $80, $FF

;Kraid statue.
Bank02_L8AC4:  .byte $1E, $00, $08, $FA, $FB, $FA, $FB, $FC, $00, $04, $C5, $C6, $C7, $D5, $D6, $D7
Bank02_L8AD4:  .byte $E5, $E6, $E7, $FF

;Ridley statue.
Bank02_L8AD8:  .byte $1E, $00, $08, $FA, $FB, $FA, $FB, $FE, $C8, $C9, $EB, $D8, $D9, $EA, $E8, $E9
Bank02_L8AE8:  .byte $FF

;Missile explode.
Bank02_L8AE9:  .byte $0A, $04, $08, $FD, $00, $57, $FD, $40, $57, $FF

;Missile explode.
Bank02_L8AF3:  .byte $0B, $04, $0C, $FD, $00, $57, $18, $FD, $40, $18, $57, $FD, $C0, $18, $18, $FF

;Missile explode.
Bank02_L8B03:  .byte $0C, $04, $10, $FD, $00, $57, $18, $FD, $40, $18, $57, $FD, $C0, $18, $18, $FF

;------------------------------------[ Samus enter door routines ]-----------------------------------

;This function is called once when Samus first enters a door.

.checkpc SamusEnterDoor
.advance SamusEnterDoor

Bank02_L8B13:  LDA DoorStatus          ;The code determines if Samus has entered a door if the-->
Bank02_L8B15:  BNE ++++                ;door status is 0, but door data information has been-->
Bank02_L8B17:  LDY SamusDoorData       ;written. If both conditions are met, Samus has just-->
Bank02_L8B19:  BEQ ++++                ;entered a door.
Bank02_L8B1B:  STA CrntMslePickups     ;
Bank02_L8B1D:  STA CrntEnrgyPickups    ;Reset current missile and energy power-up counters.
Bank02_L8B1F:  LDA RandomNumber1       ;
Bank02_L8B21:  AND #$0F                ;Randomly recalculate max missile pickups(16 max, 0 min).
Bank02_L8B23:  STA MaxMissilePickup    ;
Bank02_L8B25:  ASL                     ;
Bank02_L8B26:  ORA #$40                ;*2 for energy pickups and set bit 6(128 max, 64 min).
Bank02_L8B28:  STA MaxEnergyPickup     ;
Bank02_L8B2A:  LDA PPUCNT0ZP           ;
Bank02_L8B2C:  EOR #$01                ;
Bank02_L8B2E:  AND #$01                ;Erase name table door data for new room.
Bank02_L8B30:  TAY                     ;
Bank02_L8B31:  LSR                     ;
Bank02_L8B32:  STA $006C,Y             ;
Bank02_L8B35:  LDA ScrollDir           ;
Bank02_L8B37:  AND #$02                ;Is Samus scrolling horizontally?-->
Bank02_L8B39:  BNE +                   ;If so, branch.
Bank02_L8B3B:  LDX #$04                ;Samus currently scrolling vertically.
Bank02_L8B3D:  LDA ScrollY             ;Is room centered on screen?-->
Bank02_L8B3F:  BEQ +++++               ;If so, branch.
Bank02_L8B41:  LDA $FF                 ;
Bank02_L8B43:  EOR ObjectHi            ;Get inverse of Samus' current nametable.
Bank02_L8B46:  LSR                     ;
Bank02_L8B47:  BCC +++                 ;If Samus is on nametable 3, branch.
Bank02_L8B49:  BCS ++                  ;If Samus is on nametable 0, branch to decrement x.

Bank02_L8B4B:* LDX #$02                ;Samus is currently scrolling horizontally.
Bank02_L8B4D:  LDA ObjectX             ;Is Samus entering a left hand door?-->
Bank02_L8B50:  BPL ++                  ;If so, branch.
Bank02_L8B52:* DEX                     ;

Bank02_SetDoorEntryInfo:
Bank02_L8B53:* TXA                     ;X contains door scroll status and is transferred to A.
Bank02_L8B54:  STA DoorScrollStatus    ;Save door scroll status.
Bank02_L8B56:  JSR Bank02_SamusInDoor         ;($8B74)Indicate Samus just entered a door.
Bank02_L8B59:  LDA #$12                ;
Bank02_L8B5B:  STA DoorDelay           ;Set DoorDelay to 18 frames(going into door).
Bank02_L8B5D:  LDA SamusDoorData       ;
Bank02_L8B5F:  JSR Amul16              ;($C2C5)*16. Move scroll toggle data to upper 4 bits.
Bank02_L8B62:  ORA ObjAction           ;Keep Samus action so she will appear the same comming-->
Bank02_L8B65:  STA SamusDoorData       ;out of the door as she did going in.
Bank02_L8B67:  LDA #$05                ;
Bank02_L8B69:  STA ObjAction           ;Indicate Samus is in a door.
Bank02_L8B6C:* RTS                     ;

Bank02_L8B6D:* JSR Bank02_SetDoorEntryInfo    ;($8B53)Save Samus action and set door entry timer.
Bank02_L8B70:  JSR VertRoomCentered    ;($E21B)Room is centered. Toggle scroll.

Bank02_L8B73:  TXA                     ;X=#$01 or #$02(depending on which door Samus is in).

Bank02_SamusInDoor:
Bank02_L8B74:  ORA #$80                ;Set MSB of DoorStatus to indicate Samus has just-->
Bank02_L8B76:  STA DoorStatus          ;entered a door.
Bank02_L8B78:  RTS                     ;

;----------------------------------------------------------------------------------------------------

.checkpc DoorHandler
.advance DoorHandler

Bank02_L8B79:  LDX #$B0
Bank02_L8B7B:* JSR $8B87
Bank02_L8B7E:  LDA PageIndex
Bank02_L8B80:  SEC 
Bank02_L8B81:  SBC #$10
Bank02_L8B83:  TAX 
Bank02_L8B84:  BMI -
Bank02_L8B86:  RTS

Bank02_L8B87:  STX PageIndex
Bank02_L8B89:  LDA ObjAction,X
Bank02_L8B8C:  JSR ChooseRoutine       ;($C27C)

Bank02_L8B8F:  .word ExitSub
Bank02_L8B91:  .word $8B9D
Bank02_L8B93:  .word $8BD5
Bank02_L8B95:  .word $8C01
Bank02_L8B97:  .word $8C84
Bank02_L8B99:  .word $8CC6
Bank02_L8B9B:  .word $8CF0

Bank02_L8B9D:  INC $0300,X
Bank02_L8BA0:  LDA #$30
Bank02_L8BA2:  JSR SetProjectileAnim       ;($D2FA)
Bank02_L8BA5:  JSR $8CFB
Bank02_L8BA8:  LDY $0307,X
Bank02_L8BAB:  LDA $8BD1,Y
Bank02_L8BAE:  STA $030F,X
Bank02_L8BB1:  LDA $0307,X
Bank02_L8BB4:  CMP #$03
Bank02_L8BB6:  BNE $8BBA
Bank02_L8BB8:  LDA #$01
Bank02_L8BBA:  ORA #$A0
Bank02_L8BBC:  STA $6B
Bank02_L8BBE:  LDA #$00
Bank02_L8BC0:  STA $030A,X
Bank02_L8BC3:  TXA 
Bank02_L8BC4:  AND #$10
Bank02_L8BC6:  EOR #$10
Bank02_L8BC8:  ORA $6B
Bank02_L8BCA:  STA $6B
Bank02_L8BCC:  LDA #$06
Bank02_L8BCE:  JMP AnimDrawObject

Bank02_L8BD1:  .byte $05, $01, $0A, $01

Bank02_L8BD5:  LDA $030A,X
Bank02_L8BD8:  AND #$04
Bank02_L8BDA:  BEQ $8BB1
Bank02_L8BDC:  DEC $030F,X
Bank02_L8BDF:  BNE $8BB1
Bank02_L8BE1:  LDA #$03
Bank02_L8BE3:  CMP $0307,X
Bank02_L8BE6:  BNE $8BEE
Bank02_L8BE8:  LDY $010B
Bank02_L8BEB:  INY 
Bank02_L8BEC:  BNE $8BB1
Bank02_L8BEE:  STA $0300,X
Bank02_L8BF1:  LDA #$50
Bank02_L8BF3:  STA $030F,X
Bank02_L8BF6:  LDA #$2C
Bank02_L8BF8:  STA $0305,X
Bank02_L8BFB:  SEC 
Bank02_L8BFC:  SBC #$03
Bank02_L8BFE:  JMP $8C7E
Bank02_L8C01:  LDA DoorStatus
Bank02_L8C03:  BEQ $8C1D
Bank02_L8C05:  LDA $030C
Bank02_L8C08:  EOR $030C,X
Bank02_L8C0B:  LSR 
Bank02_L8C0C:  BCS $8C1D
Bank02_L8C0E:  LDA $030E
Bank02_L8C11:  EOR $030E,X
Bank02_L8C14:  BMI $8C1D
Bank02_L8C16:  LDA #$04
Bank02_L8C18:  STA $0300,X
Bank02_L8C1B:  BNE $8C73
Bank02_L8C1D:  LDA $0306,X
Bank02_L8C20:  CMP $0305,X
Bank02_L8C23:  BCC $8C73
Bank02_L8C25:  LDA $030F,X
Bank02_L8C28:  CMP #$50
Bank02_L8C2A:  BNE $8C57
Bank02_L8C2C:  JSR $8CF7
Bank02_L8C2F:  LDA $0307,X
Bank02_L8C32:  CMP #$01
Bank02_L8C34:  BEQ $8C57
Bank02_L8C36:  CMP #$03
Bank02_L8C38:  BEQ $8C57
Bank02_L8C3A:  LDA #$0A
Bank02_L8C3C:  STA $09
Bank02_L8C3E:  LDA $030C,X
Bank02_L8C41:  STA $08
Bank02_L8C43:  LDY $50
Bank02_L8C45:  TXA 
Bank02_L8C46:  JSR Amul16
Bank02_L8C49:  BCC $8C4C
Bank02_L8C4B:  DEY 
Bank02_L8C4C:  TYA 
Bank02_L8C4D:  JSR $DC1E
Bank02_L8C50:  LDA #$00
Bank02_L8C52:  STA $0300,X
Bank02_L8C55:  BEQ $8C73
Bank02_L8C57:  LDA $2D
Bank02_L8C59:  LSR 
Bank02_L8C5A:  BCS $8C73
Bank02_L8C5C:  DEC $030F,X
Bank02_L8C5F:  BNE $8C73
Bank02_L8C61:  LDA #$01
Bank02_L8C63:  STA $030F,X
Bank02_L8C66:  JSR $8CFB
Bank02_L8C69:  LDA #$02
Bank02_L8C6B:  STA $0300,X
Bank02_L8C6E:  JSR $8C76
Bank02_L8C71:  LDX PageIndex
Bank02_L8C73:  JMP $8BB1
Bank02_L8C76:  LDA #$30
Bank02_L8C78:  STA $0305,X
Bank02_L8C7B:  SEC 
Bank02_L8C7C:  SBC #$02
Bank02_L8C7E:  JSR SetProjectileAnimWithoutReset
Bank02_L8C81:  JMP SFXDoor
Bank02_L8C84:  LDA DoorStatus
Bank02_L8C86:  CMP #$05
Bank02_L8C88:  BCS $8CC3
Bank02_L8C8A:  JSR $8CFB
Bank02_L8C8D:  JSR $8C76
Bank02_L8C90:  LDX PageIndex
Bank02_L8C92:  LDA $91
Bank02_L8C94:  BEQ $8CA7
Bank02_L8C96:  TXA 
Bank02_L8C97:  JSR Adiv16
Bank02_L8C9A:  EOR $91
Bank02_L8C9C:  LSR 
Bank02_L8C9D:  BCC $8CA7
Bank02_L8C9F:  LDA $76
Bank02_L8CA1:  EOR #$07
Bank02_L8CA3:  STA $76
Bank02_L8CA5:  STA $1C
Bank02_L8CA7:  INC $0300,X
Bank02_L8CAA:  LDA #$00
Bank02_L8CAC:  STA $91
Bank02_L8CAE:  LDA $0307,X
Bank02_L8CB1:  CMP #$03
Bank02_L8CB3:  BNE $8CC3
Bank02_L8CB5:  TXA 
Bank02_L8CB6:  JSR Amul16
Bank02_L8CB9:  BCS $8CC0
Bank02_L8CBB:  JSR TourianMusic
Bank02_L8CBE:  BNE $8CC3
Bank02_L8CC0:  JSR MotherBrainMusic
Bank02_L8CC3:  JMP $8C71
Bank02_L8CC6:  LDA DoorStatus
Bank02_L8CC8:  CMP #$05
Bank02_L8CCA:  BNE $8CED
Bank02_L8CCC:  TXA 
Bank02_L8CCD:  EOR #$10
Bank02_L8CCF:  TAX 
Bank02_L8CD0:  LDA #$06
Bank02_L8CD2:  STA $0300,X
Bank02_L8CD5:  LDA #$2C
Bank02_L8CD7:  STA $0305,X
Bank02_L8CDA:  SEC 
Bank02_L8CDB:  SBC #$03
Bank02_L8CDD:  JSR SetProjectileAnimWithoutReset
Bank02_L8CE0:  JSR SFXDoor
Bank02_L8CE3:  JSR SelectSamusPal
Bank02_L8CE6:  LDX PageIndex
Bank02_L8CE8:  LDA #$02
Bank02_L8CEA:  STA $0300,X
Bank02_L8CED:  JMP $8BB1
Bank02_L8CF0:  LDA DoorStatus
Bank02_L8CF2:  BNE $8CED
Bank02_L8CF4:  JMP $8C61
Bank02_L8CF7:  LDA #$FF
Bank02_L8CF9:  BNE $8CFD
Bank02_L8CFB:  LDA #$4E
Bank02_L8CFD:  PHA 
Bank02_L8CFE:  LDA #$50
Bank02_L8D00:  STA $02
Bank02_L8D02:  TXA 
Bank02_L8D03:  JSR Adiv16
Bank02_L8D06:  AND #$01
Bank02_L8D08:  TAY 
Bank02_L8D09:  LDA $8D3A,Y
Bank02_L8D0C:  STA $03
Bank02_L8D0E:  LDA $030C,X
Bank02_L8D11:  STA $0B
Bank02_L8D13:  JSR MakeCartRAMPtr
Bank02_L8D16:  LDY #$00
Bank02_L8D18:  PLA 
Bank02_L8D19:  STA ($04),Y
Bank02_L8D1B:  TAX 
Bank02_L8D1C:  TYA 
Bank02_L8D1D:  CLC 
Bank02_L8D1E:  ADC #$20
Bank02_L8D20:  TAY 
Bank02_L8D21:  TXA 
Bank02_L8D22:  CPY #$C0
Bank02_L8D24:  BNE $8D19
Bank02_L8D26:  LDX PageIndex
Bank02_L8D28:  TXA 
Bank02_L8D29:  JSR Adiv8
Bank02_L8D2C:  AND #$06
Bank02_L8D2E:  TAY 
Bank02_L8D2F:  LDA $04
Bank02_L8D31:  STA $005C,Y
Bank02_L8D34:  LDA $05
Bank02_L8D36:  STA $005D,Y
Bank02_L8D39:  RTS

Bank02_L8D3A:  .byte $E8, $10, $60, $AD, $91, $69, $8D, $78, $68, $AD, $92, $69, $8D, $79, $68, $A9 
Bank02_L8D4A:  .byte $00, $85, $00, $85, $02, $AD, $97, $69, $29, $80, $F0, $06, $A5, $00, $09, $80
Bank02_L8D5A:  .byte $85, $00, $AD, $97, $69, $29

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

.checkpc PalPntrTbl
.advance PalPntrTbl

.scope
Bank02_L9560:  .word _Palette00         ;($A178)
Bank02_L9562:  .word _Palette01         ;($A19C)
Bank02_L9564:  .word _Palette02         ;($A1A8)
Bank02_L9566:  .word _Palette03         ;($A1A2)
Bank02_L9568:  .word _Palette04         ;($A1AE)
Bank02_L956A:  .word _Palette05         ;($A1B4)
Bank02_L956C:  .word _Palette06         ;($A1D7)
Bank02_L956E:  .word _Palette06         ;($A1D7)
Bank02_L9570:  .word _Palette06         ;($A1D7)
Bank02_L9572:  .word _Palette06         ;($A1D7)
Bank02_L9574:  .word _Palette06         ;($A1D7)
Bank02_L9576:  .word _Palette06         ;($A1D7)
Bank02_L9578:  .word _Palette06         ;($A1D7)
Bank02_L957A:  .word _Palette06         ;($A1D7)
Bank02_L957C:  .word _Palette06         ;($A1D7)
Bank02_L957E:  .word _Palette06         ;($A1D7)
Bank02_L9580:  .word _Palette06         ;($A1D7)
Bank02_L9582:  .word _Palette06         ;($A1D7)
Bank02_L9584:  .word _Palette06         ;($A1D7)
Bank02_L9586:  .word _Palette06         ;($A1D7)
Bank02_L9588:  .word _Palette07         ;($A1DE)
Bank02_L958A:  .word _Palette08         ;($A1E5)
Bank02_L958C:  .word _Palette09         ;($A1EC)
Bank02_L958E:  .word _Palette0A         ;($A1F3)
Bank02_L9590:  .word _Palette0B         ;($A1FB)
Bank02_L9592:  .word _Palette0C         ;($A203)
Bank02_L9594:  .word _Palette0D         ;($A20B)
Bank02_L9596:  .word _Palette0E         ;($A213)

.checkpc SpecItmsTblPtr
.advance SpecItmsTblPtr

Bank02_L9598:  .word _SpecItmsTbl       ;($A2D9)Beginning of special items table.
Bank02_L959A:  .word _RmPtrTbl          ;($A21B)Beginning of room pointer table.
Bank02_L959C:  .word _StrctPtrTbl       ;($A277)Beginning of structure pointer table.
Bank02_L959E:  .word _MacroDefs         ;($AEEC)Beginning of macro definitions.
Bank02_L95A0:  .word _EnemyFramePtrTbl1     ;($9C64)Address table into enemy animation data. Two-->
Bank02_L95A2:  .word _EnemyFramePtrTbl2     ;($9D64)tables needed to accommodate all entries.
Bank02_L95A4:  .word _EnemyPlacePtrTbl      ;($9D78)Pointers to enemy frame placement data.
Bank02_L95A6:  .word _EnemyAnimIndexTbl     ;($9BDA)Index to values in addr tables for enemy animations.

Bank02_L95A8:  .byte $60, $EA, $EA, $60, $EA, $EA, $60, $EA, $EA, $60, $EA, $EA, $60, $EA, $EA, $60 
Bank02_L95B8:  .byte $EA, $EA, $60, $EA, $EA, $60, $EA, $EA, $60, $EA, $EA

.checkpc AreaRoutine
.advance AreaRoutine

Bank02_L95C3:  JMP $9B9D           ;Area specific routine.

TwosCompliment_:
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

.checkpc MemuByte
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
Bank02_L993D:  JSR $95C6
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
Bank02_L9A39:  LDA $8049,Y
Bank02_L9A3C:  PHA 
Bank02_L9A3D:  LDA $8048,Y
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

;-----------------------------------[ Enemy animation data tables ]----------------------------------

_EnemyAnimIndexTbl:
Bank02_L9BDA:  .byte $00, $01, $FF

Bank02_L9BDD:  .byte $02, $FF

Bank02_L9BDF:  .byte $03, $04, $FF

Bank02_L9BE2:  .byte $07, $08, $FF

Bank02_L9BE5:  .byte $05, $06, $FF

Bank02_L9BE8:  .byte $09, $0A, $FF

Bank02_L9BEB:  .byte $0B, $FF

Bank02_L9BED:  .byte $0C, $0D, $0E, $0F, $FF

Bank02_L9BF2:  .byte $10, $11, $12, $13, $FF

Bank02_L9BF7:  .byte $15, $14, $FF

Bank02_L9BFA:  .byte $16, $FF

Bank02_L9BFC:  .byte $17, $18, $FF

Bank02_L9BFF:  .byte $19, $1A, $FF

Bank02_L9C02:  .byte $1B, $FF

Bank02_L9C04:  .byte $1C, $1D, $FF

Bank02_L9C07:  .byte $1E, $1F, $FF

Bank02_L9C0A:  .byte $20, $FF

Bank02_L9C0C:  .byte $21, $22, $FF

Bank02_L9C0F:  .byte $23, $FF

Bank02_L9C11:  .byte $27, $28, $29, $2A, $FF

Bank02_L9C16:  .byte $2B, $2C, $2D, $2E, $FF

Bank02_L9C1B:  .byte $2F, $FF

Bank02_L9C1D:  .byte $30, $FF

Bank02_L9C1F:  .byte $31, $FF

Bank02_L9C21:  .byte $32, $FF

Bank02_L9C23:  .byte $33, $FF

Bank02_L9C25:  .byte $34, $FF

Bank02_L9C27:  .byte $42, $FF

Bank02_L9C29:  .byte $43, $44, $F7, $FF

Bank02_L9C2D:  .byte $3B, $FF

Bank02_L9C2F:  .byte $3C, $FF

Bank02_L9C31:  .byte $3D, $FF, $3E, $FF

Bank02_L9C35:  .byte $3F, $3F, $3F, $3F, $3F, $41, $41, $41, $41, $40, $40, $40, $F7, $FF

Bank02_L9C43:  .byte $58, $59, $FF

Bank02_L9C46:  .byte $5A, $5B, $FF

Bank02_L9C49:  .byte $5C, $5D, $FF

Bank02_L9C4C:  .byte $5E, $5F, $FF

Bank02_L9C4F:  .byte $60, $FF

Bank02_L9C51:  .byte $61, $F7, $62, $F7, $FF

Bank02_L9C56:  .byte $66, $67, $FF

Bank02_L9C59:  .byte $69, $6A, $FF

Bank02_L9C5C:  .byte $68, $FF

Bank02_L9C5E:  .byte $6B, $FF

Bank02_L9C60:  .byte $66, $FF

Bank02_L9C62:  .byte $69, $FF

;----------------------------[ Enemy sprite drawing pointer tables ]---------------------------------

_EnemyFramePtrTbl1:
Bank02_L9C64:  .word $9E0A, $9E0F, $9E14, $9E19, $9E2C, $9E40, $9E56, $9E6C
Bank02_L9C74:  .word $9E7F, $9E93, $9EA9, $9EBF, $9EC9, $9ECE, $9ED3, $9ED8
Bank02_L9C84:  .word $9EDD, $9EE2, $9EE7, $9EEC, $9EF1, $9EFF, $9F0D, $9F1B
Bank02_L9C94:  .word $9F2A, $9F39, $9F4A, $9F5B, $9F63, $9F69, $9F6F, $9F75
Bank02_L9CA4:  .word $9F7B, $9F81, $9F89, $9F91, $9F99, $9F99, $9F99, $9F99
Bank02_L9CB4:  .word $9FA5, $9FB3, $9FC1, $9FCF, $9FDB, $9FE9, $9FF7, $A005
Bank02_L9CC4:  .word $A010, $A01F, $A02E, $A03D, $A04C, $A059, $A059, $A059
Bank02_L9CD4:  .word $A059, $A059, $A059, $A059, $A061, $A069, $A071, $A079
Bank02_L9CE4:  .word $A081, $A089, $A093, $A098, $A0A0, $A0A8, $A0A8, $A0A8
Bank02_L9CF4:  .word $A0A8, $A0A8, $A0A8, $A0A8, $A0A8, $A0A8, $A0A8, $A0A8
Bank02_L9D04:  .word $A0A8, $A0A8, $A0A8, $A0A8, $A0A8, $A0A8, $A0A8, $A0A8
Bank02_L9D14:  .word $A0A8, $A0B4, $A0C0, $A0CC, $A0D8, $A0E4, $A0F0, $A0FC
Bank02_L9D24:  .word $A108, $A110, $A11E, $A138, $A138, $A138, $A138, $A140
Bank02_L9D34:  .word $A148, $A150, $A158, $A160, $A168, $A168, $A168, $A168
Bank02_L9D44:  .word $A168, $A168, $A168, $A168, $A168, $A168, $A168, $A168
Bank02_L9D54:  .word $A168, $A168, $A168, $A168, $A168, $A168, $A168, $A168

_EnemyFramePtrTbl2:
Bank02_L9D64:  .word $A168, $A16E, $A173, $A173, $A173, $A173, $A173, $A173
Bank02_L9D74:  .word $A173, $A173

_EnemyPlacePtrTbl:
Bank02_L9D78:  .word $9D94, $9D96, $9DAE, $9DAE, $9DC0, $9DB2, $9DBC, $9DC4
Bank02_L9D88:  .word $9DD0, $9DD8, $9DD8, $9DF8, $9E06, $9E0A

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


;--------------------------[ Room and structure pointer tables ]-----------------------------------

_RmPtrTbl:
Bank02_LA21B:  .word $A3AB, $A3BE, $A3C6, $A3F8, $A42F, $A473, $A4AB, $A4F5
Bank02_LA22B:  .word $A527, $A55F, $A598, $A5D9, $A617, $A63E, $A678, $A6AA
Bank02_LA23B:  .word $A6DF, $A70E, $A749, $A77E, $A7B3, $A7E6, $A82B, $A852
Bank02_LA24B:  .word $A87F, $A8B2, $A8DC, $A909, $A947, $A979, $A9AB, $A9D5
Bank02_LA25B:  .word $A9FF, $AA3D, $AA6F, $AAA7, $AAD4, $AB0D, $AB34, $AB70
Bank02_LA26B:  .word $ABA5, $ABDA, $AC0D, $AC42, $AC72, $AC99

_StrctPtrTbl:
Bank02_LA277:  .word $ACB9, $ACCC, $ACE5, $ACFE, $AD05, $AD0C, $AD10, $AD16
Bank02_LA287:  .word $AD26, $AD2B, $AD31, $AD39, $AD4E, $AD57, $AD61, $AD6c
Bank02_LA297:  .word $AD78, $AD7B, $AD85, $AD88, $AD9C, $ADB1, $ADB7, $ADBD
Bank02_LA2A7:  .word $ADC6, $ADCF, $ADE2, $ADF7, $AE0C, $AE1D, $AE23, $AE26
Bank02_LA2B7:  .word $AE2F, $AE3A, $AE40, $AE55, $AE59, $AE64, $AE6D, $AE82
Bank02_LA2C7:  .word $AE85, $AE8E, $AE91, $AE94, $AE9A, $AEA7, $AEB1, $AEC6
Bank02_LA2D7:  .word $AED9

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
Bank02_LA2DA:  .word $A2E8
Bank02_LA2DC:  .byte $1B, $06, $02, $09, $34, $00

;Missiles.
Bank02_LA2E2:  .byte $1C, $FF, $02, $09, $34, $00

;Elevator from Brinstar.
Bank02_LA2E8:  .byte $0B
Bank02_LA2E9:  .word $A302
Bank02_LA2EB:  .byte $16, $05, $04, $81, $00

;Missiles.
Bank02_LA2F0:  .byte $1A, $06, $02, $09, $34, $00

;Missiles.
Bank02_LA2F6:  .byte $1B, $06, $02, $09, $34, $00

;Missiles.
Bank02_LA2FC:  .byte $1C, $FF, $02, $09, $34, $00

;Ice beam.
Bank02_LA302:  .byte $0C
Bank02_LA303:  .word $A30B
Bank02_LA305:  .byte $1A, $FF, $02, $07, $37, $00

;Elevator to Brinstar.
Bank02_LA30B:  .byte $0D
Bank02_LA30C:  .word $A313
Bank02_LA30E:  .byte $16, $FF, $04, $81, $00

;Missiles.
Bank02_LA313:  .byte $0E
Bank02_LA314:  .word $A31C
Bank02_LA316:  .byte $12, $FF, $02, $09, $34, $00

;Missiles and Melias.
Bank02_LA31C:  .byte $0F
Bank02_LA31D:  .word $A33B
Bank02_LA31F:  .byte $11, $07, $02, $09, $34, $03, $00

;Missiles.
Bank02_LA326:  .byte $13, $06, $02, $09, $34, $00

;Missiles.
Bank02_LA32C:  .byte $14, $06, $02, $09, $34, $00

;Squeept.
Bank02_LA332:  .byte $15, $FF, $41, $8B, $E9, $51, $02, $9B, $00

;Screw attack.
Bank02_LA33B:  .byte $10
Bank02_LA33C:  .word $A344
Bank02_LA33E:  .byte $0F, $FF, $02, $03, $37, $00

;Palette change room.
Bank02_LA344:  .byte $11
Bank02_LA345:  .word $A36D
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
Bank02_LA36E:  .word $A376
Bank02_LA370:  .byte $1A, $FF, $02, $08, $42, $00

;Right door.
Bank02_LA376:  .byte $14
Bank02_LA377:  .word $A389
Bank02_LA379:  .byte $0D, $05, $09, $A0, $00

;Left door.
Bank02_LA37E:  .byte $0E, $05, $09, $B0, $00

;Missiles.
Bank02_LA383:  .byte $1C, $FF, $02, $09, $34, $00

;Wave beam.
Bank02_LA389:  .byte $15
Bank02_LA38A:  .word $A397
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
Bank02_LA3AB:  .byte $02           ;Attribute table data.
;Room object data:
Bank02_LA3AC:  .byte $40, $01, $02, $48, $01, $02, $50, $04, $02, $5F, $04, $02, $FD, $02, $A1, $02
Bank02_LA3BC:  .byte $B1, $FF

;Room #$01
Bank02_LA3BE:  .byte $02           ;Attribute table data.
;Room object data:
Bank02_LA3BF:  .byte $07, $02, $02, $87, $02, $02, $FF

;Room #$02
Bank02_LA3C6:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LA3C7:  .byte $00, $0B, $03, $04, $06, $03, $08, $06, $03, $0C, $0B, $03, $40, $07, $03, $4E
Bank02_LA3D7:  .byte $07, $03, $76, $08, $01, $79, $08, $01, $90, $07, $03, $96, $09, $00, $9E, $07
Bank02_LA3E7:  .byte $03, $A4, $06, $03, $A8, $06, $03, $B7, $0A, $03, $E0, $06, $03, $EC, $06, $03
Bank02_LA3F7:  .byte $FF

;Room #$03
Bank02_LA3F8:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LA3F9:  .byte $00, $07, $03, $0E, $07, $03, $2B, $06, $03, $36, $06, $03, $50, $03, $02, $5F
Bank02_LA409:  .byte $03, $02, $80, $0B, $03, $84, $0B, $03, $88, $0B, $03, $8C, $0B, $03, $8D, $17
Bank02_LA419:  .byte $03, $C0, $0B, $03, $C4, $0B, $03, $C8, $0B, $03, $CC, $0B, $03, $CD, $17, $03
Bank02_LA429:  .byte $FD
;Enemy/door data.
Bank02_LA42A:  .byte $02, $A1, $02, $B1, $FF

;Room #$04
Bank02_LA42F:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LA430:  .byte $00, $0D, $00, $08, $0D, $00, $10, $0C, $00, $14, $0C, $00, $1F, $1F, $00, $25
Bank02_LA440:  .byte $0F, $02, $50, $0D, $00, $5F, $04, $02, $63, $0D, $00, $70, $0D, $00, $78, $12
Bank02_LA450:  .byte $00, $80, $11, $00, $88, $12, $00, $89, $0D, $00, $90, $0E, $00, $94, $0D, $00
Bank02_LA460:  .byte $9C, $0E, $00, $B0, $0C, $00, $BF, $0C, $00, $D1, $00, $02, $D7, $00, $02, $FD
;Enemy/door data.
Bank02_LA470:  .byte $02, $A0, $FF

;Room #$05
Bank02_LA473:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LA474:  .byte $00, $07, $03, $02, $06, $03, $06, $13, $02, $0A, $14, $02, $0E, $07, $03, $12
Bank02_LA484:  .byte $0A, $03, $2B, $0C, $00, $47, $13, $02, $4B, $14, $02, $4E, $0C, $00, $4F, $14
Bank02_LA494:  .byte $02, $50, $03, $02, $6B, $09, $00, $7A, $09, $00, $80, $0D, $00, $87, $02, $02
Bank02_LA4A4:  .byte $89, $0D, $00, $FD, $02, $B1, $FF

;Room #$06
Bank02_LA4AB:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LA4AC:  .byte $00, $0B, $03, $04, $0B, $03, $08, $0B, $03, $0C, $0B, $03, $30, $16, $03, $34
Bank02_LA4BC:  .byte $16, $03, $38, $16, $03, $3C, $16, $03, $40, $0B, $03, $44, $0B, $03, $48, $0B
Bank02_LA4CC:  .byte $03, $4C, $0B, $03, $80, $16, $03, $84, $16, $03, $88, $16, $03, $8C, $16, $03
Bank02_LA4DC:  .byte $90, $0B, $03, $94, $0B, $03, $98, $0B, $03, $9C, $0B, $03, $D0, $0B, $03, $D4
Bank02_LA4EC:  .byte $0B, $03, $D8, $0B, $03, $DC, $0B, $03, $FF

;Room #$07
Bank02_LA4F5:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LA4F6:  .byte $00, $0B, $03, $04, $0B, $03, $08, $0B, $03, $0C, $0B, $03, $40, $0B, $03, $44
Bank02_LA506:  .byte $0B, $03, $48, $0B, $03, $4C, $0B, $03, $74, $0B, $03, $80, $0B, $03, $88, $0B
Bank02_LA516:  .byte $03, $8C, $0B, $03, $B0, $0B, $03, $B4, $0B, $03, $BC, $0B, $03, $C8, $0B, $03
Bank02_LA526:  .byte $FF

;Room #$08
Bank02_LA527:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LA528:  .byte $00, $07, $03, $08, $06, $03, $0E, $07, $03, $1D, $18, $01, $32, $06, $03, $50
Bank02_LA538:  .byte $07, $03, $5F, $03, $02, $86, $10, $01, $8D, $18, $01, $8E, $07, $03, $A0, $07
Bank02_LA548:  .byte $03, $A9, $10, $01, $BE, $0B, $03, $CD, $18, $01, $FD
;Enemy/door data.
Bank02_LA553:  .byte $02, $A1, $41, $02, $8B, $51, $06, $76, $21, $82, $A3, $FF

;Room #$09
Bank02_LA55F:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LA560:  .byte $00, $07, $03, $0E, $0B, $03, $2A, $06, $03, $33, $06, $03, $35, $06, $03, $43
Bank02_LA570:  .byte $0A, $03, $4E, $0B, $03, $50, $07, $03, $6E, $07, $03, $80, $07, $03, $87, $06
Bank02_LA580:  .byte $03, $97, $0A, $03, $BE, $0B, $03, $C0, $07, $03, $D4, $06, $03, $FD
;Enemy/door data.
Bank02_LA58E:  .byte $01, $86, $25, $11, $82, $C5, $41, $06, $79, $FF

;Room #$0A
Bank02_LA598:  .byte $02           ;Attribute table data.
;Room object data:
Bank02_LA599:  .byte $00, $07, $03, $05, $06, $03, $0C, $18, $01, $0E, $07, $03, $40, $07, $03, $57
Bank02_LA5A9:  .byte $06, $03, $5F, $03, $02, $80, $0B, $03, $84, $00, $02, $8C, $0B, $03, $A4, $17
Bank02_LA5B9:  .byte $03, $A5, $0B, $03, $A9, $0B, $03, $C0, $0B, $03, $C9, $0B, $03, $CD, $0B, $03
Bank02_LA5C9:  .byte $D4, $17, $03, $E5, $0B, $03, $FD
;Enemy/door data.
Bank02_LA5D0:  .byte $02, $A1, $31, $02, $36, $41, $86, $48, $FF

;Room #$0B
Bank02_LA5D9:  .byte $01           ;Attribute table data.
;Room object data:
Bank02_LA5DA:  .byte $00, $07, $03, $0E, $07, $03, $12, $06, $03, $39, $06, $03, $50, $03, $02, $5E
Bank02_LA5EA:  .byte $0B, $03, $80, $0B, $03, $84, $0B, $03, $88, $0B, $03, $8C, $17, $03, $8D, $0B
Bank02_LA5FA:  .byte $03, $B0, $0B, $03, $B8, $0B, $03, $BC, $17, $03, $BD, $0B, $03, $C4, $0B, $03
Bank02_LA60A:  .byte $EC, $17, $03, $FD
;Enemy/door data.
Bank02_LA60E:  .byte $02, $B1, $41, $06, $2B, $51, $02, $1A, $FF

;Room #$0C
Bank02_LA617:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LA618:  .byte $00, $07, $03, $0D, $18, $01, $0E, $07, $03, $4D, $18, $01, $50, $07, $03, $5E
Bank02_LA628:  .byte $07, $03, $8D, $18, $01, $A0, $07, $03, $AE, $07, $03, $CD, $18, $01, $FD
;Enemy/door data.
Bank02_LA637:  .byte $01, $02, $33, $31, $82, $88, $FF

;Room #$0D
Bank02_LA63E:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LA63F:  .byte $10, $0B, $03, $14, $0B, $03, $18, $0B, $03, $1C, $0B, $03, $50, $03, $02, $5F
Bank02_LA64F:  .byte $03, $02, $80, $07, $03, $81, $17, $03, $82, $06, $03, $86, $06, $03, $8A, $06
Bank02_LA65F:  .byte $03, $8E, $07, $03, $97, $0A, $03, $C0, $0B, $03, $CC, $0B, $03, $D4, $19, $02
Bank02_LA66F:  .byte $FD
;Enemy/door data.
Bank02_LA670:  .byte $02, $A1, $02, $B1, $21, $0D, $E5, $FF

;Room #$0E
Bank02_LA678:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LA679:  .byte $00, $07, $03, $0E, $07, $03, $2B, $06, $03, $30, $06, $03, $4A, $06, $03, $50
Bank02_LA689:  .byte $03, $02, $5E, $07, $03, $80, $07, $03, $81, $06, $03, $AE, $07, $03, $B0, $07
Bank02_LA699:  .byte $03, $B5, $06, $03, $FD
;Enemy/door data.
Bank02_LA69E:  .byte $02, $B1, $11, $86, $A6, $31, $02, $EA, $21, $02, $39, $FF

;Room #$0F
Bank02_LA6A9:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LA6AB:  .byte $00, $0E, $00, $04, $0D, $00, $0C, $0D, $00, $10, $0C, $00, $50, $04, $02, $80
Bank02_LA6BB:  .byte $09, $00, $90, $0C, $00, $92, $09, $00, $AF, $09, $00, $B9, $09, $00, $D0, $0E
Bank02_LA6CB:  .byte $00, $D3, $00, $02, $DB, $00, $02, $FD
;Enemy/door data.
Bank02_LA6D3:  .byte $02, $B0, $01, $0D, $E7, $11, $8D, $ED, $31, $06, $AA, $FF

;Room #$10
Bank02_LA6DF:  .byte $01           ;Attribute table data.
;Room object data:
Bank02_LA6E0:  .byte $00, $0D, $00, $04, $0D, $00, $0C, $0E, $00, $1F, $0C, $00, $5F, $03, $02, $8C
Bank02_LA6F0:  .byte $09, $00, $94, $09, $00, $9F, $0C, $00, $D0, $00, $02, $D5, $00, $02, $DD, $0E
Bank02_LA700:  .byte $00, $FD
;Enemy/door data.
Bank02_LA702:  .byte $02, $A1, $21, $0D, $E2, $41, $0D, $EA, $31, $06, $85, $FF

;Room #$11
Bank02_LA70E:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LA70F:  .byte $10, $0B, $03, $14, $0B, $03, $18, $0B, $03, $1C, $0B, $03, $50, $03, $02, $5C
Bank02_LA71F:  .byte $0B, $03, $80, $07, $03, $81, $17, $03, $82, $06, $03, $86, $06, $03, $8A, $06
Bank02_LA72F:  .byte $03, $8C, $0B, $03, $B0, $0B, $03, $B4, $19, $02, $BC, $17, $03, $CD, $0B, $03
Bank02_LA73F:  .byte $D4, $0B, $03, $D8, $0B, $03, $FD
;Enemy/door data.
Bank02_LA746:  .byte $02, $B1, $FF

;Room #$12
Bank02_LA749:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LA74A:  .byte $00, $2D, $03, $08, $2D, $03, $10, $1B, $03, $14, $0A, $03, $50, $03, $02, $80
Bank02_LA75A:  .byte $1B, $03, $9A, $1C, $03, $B0, $1B, $03, $B6, $1C, $03, $BE, $1C, $03, $C4, $1C
Bank02_LA76A:  .byte $03, $D4, $00, $02, $D9, $00, $02, $FD
;Enemy/door data.
Bank02_LA772:  .byte $02, $B1, $01, $00, $1C, $41, $00, $18, $21, $0D, $EC, $FF

;Room #$13
Bank02_LA77E:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LA77F:  .byte $00, $2D, $03, $08, $2D, $03, $12, $0A, $03, $1E, $1B, $03, $5F, $03, $02, $69
Bank02_LA78F:  .byte $1C, $03, $8D, $1B, $03, $A3, $1D, $03, $B0, $1C, $03, $CE, $1B, $03, $D0, $00
Bank02_LA79F:  .byte $02, $D6, $00, $02, $FD
;Enemy/door data.
Bank02_LA7A4:  .byte $02, $A1, $51, $80, $24, $41, $0D, $E2, $31, $86, $94, $11, $86, $69, $FF

;Room #$14
Bank02_LA7B3:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LA7B4:  .byte $00, $2D, $03, $08, $2D, $03, $16, $0A, $03, $30, $1A, $01, $32, $1A, $01, $3A
Bank02_LA7C4:  .byte $1A, $01, $3E, $1A, $01, $50, $1A, $01, $52, $1A, $01, $5A, $1A, $01, $5E, $1A
Bank02_LA7D4:  .byte $01, $B7, $1C, $03, $D0, $00, $02, $D8, $00, $02, $FD
;Enemy/door data.
Bank02_LA7DF:  .byte $31, $0D, $E6, $51, $8D, $EB, $FF

;Room #$15
Bank02_LA7E6:  .byte $01           ;Attribute table data.
;Room object data:
Bank02_LA7E7:  .byte $00, $2D, $03, $08, $2D, $03, $1C, $0A, $03, $52, $1C, $03, $58, $1C, $03, $5A
Bank02_LA7F7:  .byte $1C, $03, $64, $1C, $03, $86, $1C, $03, $8C, $1C, $03, $8E, $1C, $03, $A0, $1C
Bank02_LA807:  .byte $03, $D0, $1B, $03, $D3, $00, $02, $D4, $1B, $03, $D7, $00, $02, $DA, $1B, $03
Bank02_LA817:  .byte $DD, $00, $02, $DE, $1B, $03, $FD
;Enemy/door data.
Bank02_LA81E:  .byte $31, $0C, $1B, $01, $86, $54, $21, $86, $48, $51, $06, $7C, $FF

;Room #$16
Bank02_LA82B:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LA82C:  .byte $00, $2D, $03, $08, $2D, $03, $12, $0A, $03, $1C, $0A, $03, $A2, $1D, $03, $AB
Bank02_LA83C:  .byte $1D, $03, $D0, $00, $02, $D8, $00, $02, $FD
;Enemy/door data.
Bank02_LA845:  .byte $01, $0D, $E8, $11, $86, $94, $21, $86, $9C, $51, $00, $18, $FF

;Room #$17
Bank02_LA852:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LA853:  .byte $00, $2D, $03, $08, $2D, $03, $16, $0A, $03, $80, $2D, $03, $8A, $2D, $03, $91
Bank02_LA863:  .byte $0A, $03, $B8, $05, $01, $C7, $1D, $03, $D0, $00, $02, $D8, $00, $02, $FD
;Enemy/door data.
Bank02_LA872:  .byte $41, $06, $73, $51, $86, $7C, $31, $00, $27, $27, $87, $B9, $FF

;Room #$18
Bank02_LA87F:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LA880:  .byte $00, $2D, $03, $08, $2D, $03, $1A, $0A, $03, $24, $1C, $03, $3E, $18, $01, $54
Bank02_LA890:  .byte $18, $01, $7E, $18, $01, $A2, $1C, $03, $A7, $1D, $03, $BE, $1C, $03, $D0, $00
Bank02_LA8A0:  .byte $02, $D8, $00, $02, $FD
;Enemy/door data.
Bank02_LA8A5:  .byte $31, $00, $17, $41, $06, $97, $21, $8B, $E6, $01, $0D, $EC, $FF

;Room #$19
Bank02_LA8B2:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LA8B3:  .byte $00, $0D, $00, $08, $0D, $00, $10, $1F, $00, $44, $1F, $00, $80, $12, $00, $81
Bank02_LA8C3:  .byte $0D, $00, $90, $1F, $00, $98, $1F, $00, $AE, $0D, $00, $BB, $1F, $00, $D0, $00
Bank02_LA8D3:  .byte $02, $D8, $00, $02, $FD
;Enemy/door data.
Bank02_LA8D8:  .byte $31, $80, $17, $FF

;Room #$1A
Bank02_LA8DC:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LA8DD:  .byte $00, $30, $01, $08, $30, $01, $80, $0D, $00, $84, $05, $02, $86, $05, $02, $88
Bank02_LA8ED:  .byte $0D, $00, $8C, $20, $01, $94, $20, $01, $D0, $00, $02, $D8, $00, $02, $FD
;Enemy/door data.
Bank02_LA8FC:  .byte $27, $87, $85, $37, $87, $87, $41, $00, $29, $51, $00, $2C, $FF

;Room #$1B
Bank02_LA909:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LA90A:  .byte $00, $20, $01, $04, $20, $01, $08, $20, $01, $0C, $2E, $01, $10, $2E, $01, $4C
Bank02_LA91A:  .byte $2E, $01, $50, $03, $02, $80, $2E, $01, $8C, $21, $01, $98, $20, $01, $9C, $2E
Bank02_LA92A:  .byte $01, $A2, $20, $01, $C0, $2E, $01, $D2, $00, $02, $DA, $00, $02, $FD
;Enemy/door data.
Bank02_LA938:  .byte $02, $B1, $01, $0C, $98, $31, $8C, $3A, $11, $0C, $38, $41, $8B, $E6, $FF

;Room #$1C
Bank02_LA947:  .byte $02           ;Attribute table data.
;Room object data:
Bank02_LA948:  .byte $00, $22, $02, $04, $22, $02, $08, $22, $02, $0C, $22, $02, $1C, $22, $02, $5F
Bank02_LA958:  .byte $03, $02, $8C, $22, $02, $A8, $22, $02, $B0, $22, $02, $B1, $23, $01, $B4, $22
Bank02_LA968:  .byte $02, $D0, $00, $02, $D8, $00, $02, $FD
;Enemy/door data.
Bank02_LA970:  .byte $02, $A1, $41, $0E, $B1, $31, $00, $49, $FF

;Room #$1D
Bank02_LA979:  .byte $02           ;Attribute table data.
;Room object data:
Bank02_LA97A:  .byte $00, $22, $02, $04, $22, $02, $08, $22, $02, $0C, $22, $02, $10, $22, $02, $50
Bank02_LA98A:  .byte $03, $02, $80, $22, $02, $B4, $22, $02, $B8, $22, $02, $BC, $22, $02, $BD, $23
Bank02_LA999:  .byte $01, $D0, $00, $02, $D8, $00, $02, $FD
;Enemy/door data.
Bank02_LA9A2:  .byte $02, $B1, $01, $0E, $BD, $21, $00, $49, $FF

;Room #$1E
Bank02_LA9AB:  .byte $02           ;Attribute table data.
;Room object data:
Bank02_LA9AC:  .byte $00, $22, $02, $04, $22, $02, $08, $22, $02, $0C, $22, $02, $B6, $22, $02, $B7
Bank02_LA9BC:  .byte $23, $01, $C1, $22, $02, $CB, $22, $02, $D0, $00, $02, $D8, $00, $02, $FD
;Enemy/door data.
Bank02_LA9CB:  .byte $51, $0E, $B7, $11, $06, $BD, $31, $86, $B3, $FF

;Room #$1F
Bank02_LA9D5:  .byte $02           ;Attribute table data.
;Room object data:
Bank02_LA9D6:  .byte $00, $22, $02, $04, $22, $02, $08, $22, $02, $0C, $22, $02, $90, $22, $02, $9C
Bank02_LA9E6:  .byte $22, $02, $A7, $23, $01, $B4, $22, $02, $B8, $22, $02, $D0, $00, $02, $D8, $00
Bank02_LA9F6:  .byte $02, $FD
;Enemy/door data.
Bank02_LA9F8:  .byte $41, $0E, $A7, $11, $02, $99, $FF

;Room #$20
Bank02_LA9FF:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LAA00:  .byte $00, $2F, $03, $08, $2F, $03, $0B, $06, $03, $1C, $26, $03, $21, $25, $03, $22
Bank02_LAA10:  .byte $06, $03, $5F, $04, $02, $8C, $26, $03, $B0, $25, $03, $B3, $23, $01, $B7, $24
Bank02_LAA20:  .byte $03, $C2, $26, $03, $CE, $26, $03, $D0, $00, $02, $D6, $00, $02, $FD
;Enemy/door data.
Bank02_LAA2E:  .byte $02, $A1, $41, $0E, $B3, $11, $86, $A9, $21, $0C, $43, $01, $0B, $EB, $FF

;Room #$21
Bank02_LAA3D:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LAA3E:  .byte $00, $2F, $03, $08, $2F, $03, $10, $26, $03, $19, $06, $03, $50, $03, $02, $80
Bank02_LAA4E:  .byte $26, $03, $AA, $25, $03, $B3, $24, $03, $CE, $24, $03, $D0, $00, $02, $D8, $00
Bank02_LAA5E:  .byte $02, $FD
;Enemy/door data.
Bank02_LAA60:  .byte $02, $B1, $31, $06, $BE, $51, $86, $9A, $41, $0C, $77, $21, $0C, $38, $FF

;Room #$22
Bank02_LAA6F:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LAA70:  .byte $00, $2F, $03, $08, $2F, $03, $14, $06, $03, $17, $24, $03, $1E, $26, $03, $23
Bank02_LAA80:  .byte $25, $03, $5F, $03, $02, $8D, $26, $03, $C2, $24, $03, $C7, $24, $03, $CC, $26
Bank02_LAA90:  .byte $03, $D0, $00, $02, $D6, $00, $02, $FD
;Enemy/door data.
Bank02_LAA98:  .byte $02, $A1, $01, $86, $B4, $11, $86, $B8, $21, $0C, $59, $31, $0C, $55, $FF

;Room #$23
Bank02_LAAA7:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LAAA8:  .byte $00, $2F, $03, $08, $2F, $03, $14, $06, $03, $8D, $24, $03, $8F, $29, $03, $97
Bank02_LAAB8:  .byte $24, $03, $B1, $24, $03, $B2, $05, $01, $D0, $00, $02, $D8, $00, $02, $FD
;Enemy/door data.
Bank02_LAAC7:  .byte $31, $86, $88, $41, $06, $7C, $51, $00, $29, $17, $87, $B3, $FF

;Room #$24
Bank02_LAAD4:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LAAD5:  .byte $00, $2F, $03, $08, $2F, $03, $50, $2A, $03, $56, $2A, $03, $63, $2A, $03, $6E
Bank02_LAAE5:  .byte $2A, $03, $78, $2A, $03, $8C, $2A, $03, $9F, $2A, $03, $A1, $2A, $03, $A5, $2A
Bank02_LAAF5:  .byte $03, $BA, $2A, $03, $C7, $2A, $03, $D0, $00, $02, $D8, $00, $02, $FD
;Enemy/door data.
Bank02_LAB03:  .byte $01, $0D, $E8, $21, $8B, $ED, $31, $0B, $E9, $FF

;Room #$25
Bank02_LAB0D:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LAB0E:  .byte $00, $2F, $03, $08, $2F, $03, $0A, $25, $03, $90, $2F, $03, $99, $05, $01, $9B
Bank02_LAB1E:  .byte $24, $03, $9F, $06, $03, $A7, $06, $03, $D0, $00, $02, $D8, $00, $02, $FD
;Enemy/door data.
Bank02_LAB2D:  .byte $01, $0C, $27, $37, $07, $9A, $FF

;Room #$26
Bank02_LAB34:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LAB35:  .byte $00, $0E, $00, $04, $0D, $00, $0C, $0E, $00, $20, $0C, $00, $2F, $0C, $00, $52
Bank02_LAB45:  .byte $1F, $00, $60, $28, $03, $64, $1F, $00, $6F, $25, $03, $7F, $29, $03, $8E, $1F
Bank02_LAB55:  .byte $00, $97, $1F, $00, $CB, $1F, $00, $D0, $00, $02, $D8, $00, $02, $FD
;Enemy/door data.
Bank02_LAB63:  .byte $31, $86, $54, $41, $86, $87, $51, $0D, $E9, $01, $8B, $E5, $FF

;Room #$27
Bank02_LAB70:  .byte $02           ;Attribute table data.
;Room object data:
Bank02_LAB71:  .byte $00, $20, $01, $04, $20, $01, $08, $20, $01, $0C, $20, $01, $10, $2C, $01, $50
Bank02_LAB81:  .byte $04, $02, $80, $2C, $01, $81, $15, $03, $87, $27, $03, $8A, $27, $03, $8C, $27
Bank02_LAB91:  .byte $03, $8E, $27, $03, $C0, $2C, $01, $D2, $00, $02, $DA, $00, $02, $FD
;Enemy/door data.
Bank02_LAB9F:  .byte $02, $B1, $51, $0D, $E9, $FF

;Room #$28
Bank02_LABA5:  .byte $02           ;Attribute table data.
;Room object data:
Bank02_LABA6:  .byte $00, $30, $01, $08, $30, $01, $10, $2C, $01, $17, $15, $03, $50, $03, $02, $80
Bank02_LABB6:  .byte $20, $01, $86, $2B, $00, $8A, $2B, $00, $A0, $2C, $01, $BC, $2B, $00, $D2, $00
Bank02_LABC6:  .byte $02, $DA, $00, $02, $E0, $2C, $01, $FD
;Enemy/door data.
Bank02_LABCE:  .byte $02, $B1, $01, $06, $77, $11, $86, $7C, $21, $00, $2A, $FF

;Room #$29
Bank02_LABDA:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LABDB:  .byte $00, $30, $01, $05, $15, $03, $08, $30, $01, $50, $2B, $00, $55, $2B, $00, $6B
Bank02_LABEB:  .byte $2B, $00, $91, $2B, $00, $A8, $2B, $00, $B3, $2B, $00, $CC, $2B, $00, $D0, $00
Bank02_LABFB:  .byte $02, $D8, $00, $02, $FD
;Enemy/door data.
Bank02_LAC00:  .byte $41, $06, $43, $51, $86, $47, $31, $06, $84, $21, $86, $99, $FF

;Room #$2A
Bank02_LAC0D:  .byte $02           ;Attribute table data.
;Room object data:
Bank02_LAC0E:  .byte $00, $30, $01, $08, $30, $01, $15, $15, $03, $1E, $2C, $01, $5F, $03, $02, $8C
Bank02_LAC1E:  .byte $20, $01, $97, $2B, $00, $AE, $2C, $01, $C2, $2B, $00, $D0, $00, $02, $D6, $00
Bank02_LAC2E:  .byte $02, $EE, $2C, $01, $FD
;Enemy/door data.
Bank02_LAC33:  .byte $02, $A1, $21, $86, $88, $31, $86, $B3, $41, $0B, $E0, $51, $8B, $EB, $FF

;Room #$2B
Bank02_LAC42:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LAC43:  .byte $00, $30, $01, $08, $30, $01, $2B, $18, $01, $55, $18, $01, $6B, $18, $01, $95
Bank02_LAC53:  .byte $18, $01, $A0, $2C, $01, $AE, $2C, $01, $B8, $2C, $01, $D0, $00, $02, $D8, $00
Bank02_LAC63:  .byte $02, $FD
;Enemy/door data.
Bank02_LAC65:  .byte $31, $86, $45, $21, $06, $A9, $11, $86, $9E, $01, $0B, $E3, $FF

;Room #$2C
Bank02_LAC72:  .byte $00           ;Attribute table data.
;Room object data:
Bank02_LAC73:  .byte $00, $30, $01, $08, $30, $01, $46, $2C, $01, $86, $2C, $01, $94, $20, $01, $AF
Bank02_LAC83:  .byte $20, $01, $C0, $30, $01, $CB, $20, $01, $D0, $00, $02, $D5, $20, $01, $D9, $00
Bank02_LAC93:  .byte $02, $FD
;Enemy/door data.
Bank02_LAC95:  .byte $01, $0C, $59, $FF

;Room #$2D
Bank02_LAC99:  .byte $03           ;Attribute table data.
;Room object data:
Bank02_LAC9A:  .byte $00, $07, $03, $0E, $07, $03, $19, $06, $03, $44, $06, $03, $50, $07, $03, $5E
Bank02_LACAA:  .byte $07, $03, $93, $06, $03, $A0, $07, $03, $AE, $07, $03, $C7, $06, $03, $FF

;---------------------------------------[ Structure definitions ]------------------------------------

;The first byte of the structure definition states how many macros are in the first row of the
;structure. The the number of bytes after the macro number byte is equal to the value of the macro
;number byte and those bytes define what each macro in the row are. For example, if the macro number
;byte is #$08, the next 8 bytes represent 8 macros. The macro description bytes are the macro numbers
;and are multiplied by 4 to find the index to the desired macro in _MacroDefs.  Any further bytes in
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

;----------------------------------------[ Macro definitions ]---------------------------------------

;The macro definitions are simply index numbers into the pattern tables that represent the 4 quadrants
;of the macro definition. The bytes correspond to the following position in order: lower right tile,
;lower left tile, upper right tile, upper left tile. 

_MacroDefs:

Bank02_LAEEC:  .byte $F1, $F1, $F1, $F1
Bank02_LAEF0:  .byte $FF, $FF, $F0, $F0
Bank02_LAEF4:  .byte $64, $64, $64, $64
Bank02_LAEF8:  .byte $FF, $FF, $64, $64
Bank02_LAEFC:  .byte $A4, $FF, $A4, $FF
Bank02_LAF00:  .byte $FF, $A5, $FF, $A5
Bank02_LAF04:  .byte $A0, $A0, $A0, $A0
Bank02_LAF08:  .byte $A1, $A1, $A1, $A1
Bank02_LAF0C:  .byte $FF, $FF, $59, $5A
Bank02_LAF10:  .byte $FF, $FF, $5A, $5B
Bank02_LAF14:  .byte $FF, $FF, $FF, $FF
Bank02_LAF18:  .byte $10, $10, $10, $10
Bank02_LAF1C:  .byte $23, $24, $25, $0B
Bank02_LAF20:  .byte $1B, $1C, $1D, $1E
Bank02_LAF24:  .byte $17, $18, $19, $1A
Bank02_LAF28:  .byte $1F, $20, $21, $22
Bank02_LAF2C:  .byte $60, $61, $62, $63
Bank02_LAF30:  .byte $0E, $0F, $FF, $FF
Bank02_LAF34:  .byte $0C, $0D, $0D, $0D
Bank02_LAF38:  .byte $10, $0D, $FF, $10
Bank02_LAF3C:  .byte $10, $FF, $FF, $FF
Bank02_LAF40:  .byte $FF, $FF, $FF, $30
Bank02_LAF44:  .byte $FF, $33, $FF, $36
Bank02_LAF48:  .byte $FF, $39, $FF, $3D
Bank02_LAF4C:  .byte $FF, $FF, $31, $32
Bank02_LAF50:  .byte $34, $35, $37, $38
Bank02_LAF54:  .byte $3A, $3B, $3E, $3F
Bank02_LAF58:  .byte $3C, $41, $40, $42
Bank02_LAF5C:  .byte $84, $85, $86, $87
Bank02_LAF60:  .byte $80, $81, $82, $83
Bank02_LAF64:  .byte $88, $89, $8A, $8B
Bank02_LAF68:  .byte $45, $46, $45, $46
Bank02_LAF6C:  .byte $47, $48, $48, $47
Bank02_LAF70:  .byte $5C, $5D, $5E, $5F
Bank02_LAF74:  .byte $B8, $B8, $B9, $B9
Bank02_LAF78:  .byte $74, $75, $75, $74
Bank02_LAF7C:  .byte $C1, $13, $13, $13
Bank02_LAF80:  .byte $36, $BE, $BC, $BD
Bank02_LAF84:  .byte $BF, $14, $15, $14
Bank02_LAF88:  .byte $C0, $14, $C0, $16
Bank02_LAF8C:  .byte $FF, $C1, $FF, $FF
Bank02_LAF90:  .byte $C2, $14, $FF, $FF
Bank02_LAF94:  .byte $30, $13, $BC, $BD
Bank02_LAF98:  .byte $13, $14, $15, $16
Bank02_LAF9C:  .byte $D7, $D7, $D7, $D7
Bank02_LAFA0:  .byte $76, $76, $76, $76
Bank02_LAFA4:  .byte $FF, $FF, $BA, $BA
Bank02_LAFA8:  .byte $BB, $BB, $BB, $BB
Bank02_LAFAC:  .byte $00, $01, $02, $03
Bank02_LAFB0:  .byte $04, $05, $06, $07
Bank02_LAFB4:  .byte $FF, $FF, $08, $09
Bank02_LAFB8:  .byte $FF, $FF, $09, $0A
Bank02_LAFBC:  .byte $55, $56, $57, $58
Bank02_LAFC0:  .byte $90, $91, $92, $93
Bank02_LAFC4:  .byte $4B, $4C, $4D, $50
Bank02_LAFC8:  .byte $51, $52, $53, $54
Bank02_LAFCC:  .byte $70, $71, $72, $73
Bank02_LAFD0:  .byte $8C, $8D, $8E, $8F
Bank02_LAFD4:  .byte $11, $12, $FF, $11
Bank02_LAFD8:  .byte $11, $12, $12, $11
Bank02_LAFDC:  .byte $11, $12, $12, $FF
Bank02_LAFE0:  .byte $C3, $C4, $C5, $C6

Bank02_LAFE4:  .byte $30, $00, $BC, $BD, $CD, $CE, $CF, $D0, $D1, $D2, $D3, $D4, $90, $91, $92, $93
Bank02_LAFF4:  .byte $20, $20, $20, $20, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0

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

;Unused.
B099:   .byte $B9, $30, $3A, $3E, $B6, $42, $B9, $42, $3E, $42, $B3, $44, $B2, $3A, $B9, $3A
B0A9:   .byte $44, $48, $B4, $4C, $B3, $48, $46, $B6, $48, $B9, $4E, $4C, $48, $B3, $4C, $B2
B0B9:   .byte $44, $B9, $44, $4C, $52, $B4, $54, $54, $C4, $B4, $02, $FF, $C3, $B2, $26, $B9
B0C9:   .byte $26, $3E, $34, $B2, $26, $B9, $26, $34, $26, $B2, $2C, $B9, $2C, $3A, $2C, $B2
B0D9:   .byte $2C, $B9, $2C, $3A, $2C, $FF, $C4, $B2, $26, $B9, $34, $26, $26, $FF, $D0, $B9
B0E9:   .byte $18, $26, $18, $B2, $18, $FF, $C2, $B2, $1E, $B9, $1E, $18, $1E, $B2, $1E, $B9
B0F9:   .byte $1E, $18, $1E, $B2, $1C, $B9, $1C, $14, $1C, $B2, $1C, $B9, $1C, $14, $1C, $FF
B109:   .byte $B2, $26, $12, $16, $18, $1C, $20, $24, $26, $B2, $28, $B9, $28, $1E, $18, $B2
B119:   .byte $10, $B9, $30, $2C, $28, $B2, $1E, $1C, $18, $14, $2A, $2A, $2A, $2A, $CC, $B9 
B129:   .byte $2A, $FF, $E8, $B2, $04, $04, $04, $B9, $04, $04, $04, $FF, $E0, $E0, $F0, $00
B139:   .byte $00, $00, $00, $00, $00, $00, $00, $21, $80, $40, $02, $05, $26, $52, $63, $00
B149:   .byte $00, $00, $06, $07, $67, $73, $73, $FF, $AF, $2F, $07, $0B, $8D, $A7, $B1, $00
B159:   .byte $00, $00, $00, $00, $80, $80, $80, $F8, $B8, $F8, $F8, $F0, $F0, $F8, $FC, $00
B169:   .byte $00, $00, $00, $00, $00, $00, $00, $07, $07, $07, $07, $07, $03, $03, $01, $00
B179:   .byte $00, $00, $00, $00, $00, $00, $80, $FF, $C7, $83, $03, $C7, $CF, $FE, $EC, $00
B189:   .byte $30, $78, $F8, $30, $00, $01, $12, $F5, $EA, $FB, $FD, $F9, $1E, $0E, $44, $07
B199:   .byte $03, $03, $01, $01, $E0, $10, $48, $2B, $3B, $1B, $5A, $D0, $D1, $C3, $C3, $3B
B1A9:   .byte $3B, $9B, $DA, $D0, $D0, $C0, $C0, $2C, $23, $20, $20, $30, $98, $CF, $C7, $00
B1B9:   .byte $00, $00, $00, $00, $00, $00, $30, $1F, $80, $C0, $C0, $60, $70, $FC, $C0, $00
B1C9:   .byte $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $80
B1D9:   .byte $80, $C0, $78, $4C, $C7, $80, $80, $C4, $A5, $45, $0B, $1B, $03, $03, $00, $3A
B1E9:   .byte $13, $31, $63, $C3, $83, $03, $04, $E6, $E6, $C4, $8E, $1C, $3C, $18, $30, $E8
B1F9:   .byte $E8, $C8, $90, $60, $00, $00, $00

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

    ;Norfair music.
    _LBD4B:  .byte $0B, $FF, $F0, $04, $04
    _LBD50:  .word $B000, $B026, $B057, $B08B

    ;Kraid area music(not used this memory page).
    _LBD58:  .byte $00, $FF, $F0, $00, $00
    _LBD5D:  .word $0100, $0300, $0500, $0000

    ;Item room music.
    _LBD65:  .byte $0B, $FF, $03, $00, $00
    _LBD6A:  .word $BDDA, $BDDC, $BDCD, $0000

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

;---------------------------------------- [ Not used ] ---------------------------------------------

Bank02_LBF56:  .byte $10, $07, $0E, $1C, $38, $70, $2A, $54, $15, $12, $02, $03, $20, $2C, $B4, $AD
Bank02_LBF66:  .byte $4D, $06, $8D, $8D, $06, $AD, $5E, $06, $A8, $B9, $2A, $BC, $A8, $A2, $00, $B9
Bank02_LBF76:  .byte $61, $BD, $9D, $2B, $06, $C8, $E8, $8A, $C9, $0D, $D0, $F3, $A9, $01, $8D, $40
Bank02_LBF86:  .byte $06, $8D, $41, $06, $8D, $42, $06, $8D, $43, $06, $A9, $00, $8D, $38, $06, $8D
Bank02_LBF96:  .byte $39, $06, $8D, $3A, $06, $8D, $3B, $06, $60, $FF, $00, $00, $00, $00, $00, $00
Bank02_LBFA6:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

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

;Not used.
Bank02_LBFD5:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00
Bank02_LBFE5:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank02_LBFF5:  .byte $00, $00, $00, $00, $00

;----------------------------------------------------------------------------------------------------

;Interrupt vectors.
.word NMI               ;($C0D9)NMI vector.
.word RESET_Bank02      ;($FFB0)Reset vector.
.word RESET_Bank02      ;($FFB0)IRQ vector.
