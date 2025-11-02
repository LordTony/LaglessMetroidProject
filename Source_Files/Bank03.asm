;Tourian bank.

;-----------------------------------------[ Start of code ]------------------------------------------

Bank03_L8000:  JMP StartUpdateEnemyAnimation
Bank03_L8003:  JMP StartUpdateEnemyAnimation_2
Bank03_L8006:  JMP Start_Special_Attrs
Bank03_L8009:  JMP DoSomethingToFrameCount
Bank03_L800C:  JMP UpdateEnemyAnim     ;($E094)
Bank03_L800F:  JMP DoSomethingToAnimationIndecies
Bank03_L8012:  JMP DoSomethingToEnDataIndex
Bank03_L8015:  JMP UpdateEnemyHitpoints
Bank03_L8018:  JMP Bank07_LFBB9
Bank03_L801B:  JMP Bank07_LFB88
Bank03_L801E:  JMP Bank07_LFBCA
Bank03_L8021:  JMP Bank07_LF870
Bank03_L8024:  JMP ChooseRoutine       ;($C27C)
Bank03_L8027:  JMP Bank07_LFD8F
Bank03_L802A:  JMP Bank07_LEB6E
Bank03_L802D:  JMP $8244
Bank03_L8030:  JMP $8318
Bank03_L8033:  JMP Bank07_LFA1E
Bank03_L8036:  JMP $833F
Bank03_L8039:  JMP $8395
Bank03_L803C:  JMP SomethingAboutMovement
Bank03_L803F:  JMP DrawTileBlast
Bank03_L8042:  JMP SubtractHealth      ;($CE92)
Bank03_L8045:  JMP Base10Subtract      ;($C3FB)

Bank03_L8048:  .word $84FD, $84A6, $844A, $844A, $84A6, $84FD, $83F4, $83F4

Bank03_L8058:  LDX PageIndex
Bank03_L805A:  LDA $0405,X
Bank03_L805D:  ASL 
Bank03_L805E:  BMI ++++++++
Bank03_L8060:  LDA EnStatus,X
Bank03_L8063:  CMP #$02
Bank03_L8065:  BNE ++++++++
Bank03_L8067:  JSR $8244
Bank03_L806A:  LDA $00
Bank03_L806C:  BPL ++
Bank03_L806E:  JSR TwosCompliment      ;($C3D4)
Bank03_L8071:  STA $66
Bank03_L8073:* JSR $83F5
Bank03_L8076:  JSR $80B8
Bank03_L8079:  DEC $66
Bank03_L807B:  BNE -
Bank03_L807D:* BEQ ++
Bank03_L807F:  STA $66
Bank03_L8081:* JSR $844B
Bank03_L8084:  JSR $80FB
Bank03_L8087:  DEC $66
Bank03_L8089:  BNE -
Bank03_L808B:* JSR $8318
Bank03_L808E:  LDA $00
Bank03_L8090:  BPL ++
Bank03_L8092:  JSR TwosCompliment      ;($C3D4)
Bank03_L8095:  STA $66
Bank03_L8097:* JSR $84A7
Bank03_L809A:  JSR $816E
Bank03_L809D:  DEC $66
Bank03_L809F:  BNE -
Bank03_L80A1:* BEQ ++
Bank03_L80A3:  STA $66
Bank03_L80A5:* JSR $84FE
Bank03_L80A8:  JSR $8134
Bank03_L80AB:  DEC $66
Bank03_L80AD:  BNE -
Bank03_L80AF:* RTS
 
Bank03_L80B0:  LDY EnDataIndex,X
Bank03_L80B3:  LDA $977B,Y
Bank03_L80B6:  ASL             ;*2 
Bank03_L80B7:  RTS

Bank03_L80B8:  LDX PageIndex
Bank03_L80BA:  BCS $80FA
Bank03_L80BC:  LDA $0405,X
Bank03_L80BF:  BPL $80C7
Bank03_L80C1:  JSR $81FC
Bank03_L80C4:  JMP $80F6
Bank03_L80C7:  JSR $80B0
Bank03_L80CA:  BPL $80EA
Bank03_L80CC:  LDA $6B03,X
Bank03_L80CF:  BEQ $80C1
Bank03_L80D1:  BPL $80D8
Bank03_L80D3:  JSR $81B1
Bank03_L80D6:  BEQ $80E2
Bank03_L80D8:  SEC 
Bank03_L80D9:  ROR $0402,X
Bank03_L80DC:  ROR EnCounter,X
Bank03_L80DF:  JMP $80F6
Bank03_L80E2:  STA $0402,X
Bank03_L80E5:  STA EnCounter,X
Bank03_L80E8:  BEQ $80F6
Bank03_L80EA:  LDA $977B,Y
Bank03_L80ED:  LSR 
Bank03_L80EE:  LSR 
Bank03_L80EF:  BCC $80F6
Bank03_L80F1:  LDA #$04
Bank03_L80F3:  JSR $856B
Bank03_L80F6:  LDA #$01
Bank03_L80F8:  STA $66
Bank03_L80FA:  RTS
 
Bank03_L80FB:  LDX PageIndex
Bank03_L80FD:  BCS $8133
Bank03_L80FF:  LDA $0405,X
Bank03_L8102:  BPL $810A
Bank03_L8104:  JSR $81FC
Bank03_L8107:  JMP $812F
Bank03_L810A:  JSR $80B0
Bank03_L810D:  BPL $8123
Bank03_L810F:  LDA $6B03,X
Bank03_L8112:  BEQ $8104
Bank03_L8114:  BPL $8120
Bank03_L8116:  CLC 
Bank03_L8117:  ROR $0402,X
Bank03_L811A:  ROR EnCounter,X
Bank03_L811D:  JMP $812F
Bank03_L8120:  JSR $81B1
Bank03_L8123:  LDA $977B,Y
Bank03_L8126:  LSR 
Bank03_L8127:  LSR 
Bank03_L8128:  BCC $812F
Bank03_L812A:  LDA #$04
Bank03_L812C:  JSR $856B
Bank03_L812F:  LDA #$01
Bank03_L8131:  STA $66
Bank03_L8133:  RTS
 
Bank03_L8134:  LDX PageIndex
Bank03_L8136:  BCS $816D
Bank03_L8138:  JSR $80B0
Bank03_L813B:  BPL $815E
Bank03_L813D:  LDA $0405,X
Bank03_L8140:  BMI $8148
Bank03_L8142:  JSR $81C7
Bank03_L8145:  JMP $8169
Bank03_L8148:  LDA $6B03,X
Bank03_L814B:  BEQ $8142
Bank03_L814D:  BPL $8159
Bank03_L814F:  CLC 
Bank03_L8150:  ROR $0403,X
Bank03_L8153:  ROR $0407,X
Bank03_L8156:  JMP $8169
Bank03_L8159:  JSR $81C0
Bank03_L815C:  BEQ $8169
Bank03_L815E:  LDA $977B,Y
Bank03_L8161:  LSR 
Bank03_L8162:  BCC $8169
Bank03_L8164:  LDA #$01
Bank03_L8166:  JSR $856B
Bank03_L8169:  LDA #$01
Bank03_L816B:  STA $66
Bank03_L816D:  RTS

Bank03_L816E:  LDX PageIndex
Bank03_L8170:  BCS $81B0
Bank03_L8172:  JSR $80B0
Bank03_L8175:  BPL $81A0
Bank03_L8177:  LDA $0405,X
Bank03_L817A:  BMI $8182
Bank03_L817C:  JSR $81C7
Bank03_L817F:  JMP $81AC
Bank03_L8182:  LDA $6B03,X
Bank03_L8185:  BEQ $817C
Bank03_L8187:  BPL $818E
Bank03_L8189:  JSR $81C0
Bank03_L818C:  BEQ $8198
Bank03_L818E:  SEC 
Bank03_L818F:  ROR $0403,X
Bank03_L8192:  ROR $0407,X
Bank03_L8195:  JMP $81AC
Bank03_L8198:  STA $0403,X
Bank03_L819B:  STA $0407,X
Bank03_L819E:  BEQ $81AC
Bank03_L81A0:  JSR $80B0
Bank03_L81A3:  LSR 
Bank03_L81A4:  LSR 
Bank03_L81A5:  BCC $81AC
Bank03_L81A7:  LDA #$01
Bank03_L81A9:  JSR $856B
Bank03_L81AC:  LDA #$01
Bank03_L81AE:  STA $66
Bank03_L81B0:  RTS
 
Bank03_L81B1:  JSR $81B8
Bank03_L81B4:  STA $6AFE,X
Bank03_L81B7:  RTS

Bank03_L81B8:  LDA #$20
Bank03_L81BA:  JSR LF744
Bank03_L81BD:  LDA #$00
Bank03_L81BF:  RTS

Bank03_L81C0:  JSR $81B8
Bank03_L81C3:  STA $6AFF,X
Bank03_L81C6:  RTS

Bank03_L81C7:  JSR $81F6
Bank03_L81CA:  BNE $81F5
Bank03_L81CC:  LDA #$01
Bank03_L81CE:  JSR $856B
Bank03_L81D1:  LDA $6AFF,X
Bank03_L81D4:  JSR TwosCompliment
Bank03_L81D7:  STA $6AFF,X

Bank03_L81DA:  JSR $81F6
Bank03_L81DD:  BNE $81F5
Bank03_L81DF:  JSR $80B0
Bank03_L81E2:  SEC 
Bank03_L81E3:  BPL $81ED
Bank03_L81E5:  LDA #$00
Bank03_L81E7:  SBC $0407,X
Bank03_L81EA:  STA $0407,X
Bank03_L81ED:  LDA #$00
Bank03_L81EF:  SBC $0403,X
Bank03_L81F2:  STA $0403,X
Bank03_L81F5:  RTS

Bank03_L81F6:  JSR LF74B
Bank03_L81F9:  AND #$20
Bank03_L81FB:  RTS

Bank03_L81FC:  JSR $81F6
Bank03_L81FF:  BNE $81F5
Bank03_L8201:  LDA #$04
Bank03_L8203:  JSR $856B
Bank03_L8206:  LDA $6AFE,X
Bank03_L8209:  JSR TwosCompliment
Bank03_L820C:  STA $6AFE,X

Bank03_L820F:  JSR $81F6
Bank03_L8212:  BNE $822A
Bank03_L8214:  JSR $80B0
Bank03_L8217:  SEC 
Bank03_L8218:  BPL $8222
Bank03_L821A:  LDA #$00
Bank03_L821C:  SBC EnCounter,X
Bank03_L821F:  STA EnCounter,X
Bank03_L8222:  LDA #$00
Bank03_L8224:  SBC $0402,X
Bank03_L8227:  STA $0402,X
Bank03_L822A:  RTS 

Bank03_L822B:  LDA $0405,X
Bank03_L822E:  BPL $8232
Bank03_L8230:  LSR 
Bank03_L8231:  LSR 
Bank03_L8232:  LSR 
Bank03_L8233:  LDA $0408,X
Bank03_L8236:  ROL 
Bank03_L8237:  ASL 
Bank03_L8238:  TAY 
Bank03_L8239:  LDA $96DB,Y
Bank03_L823C:  STA $81
Bank03_L823E:  LDA $96DC,Y
Bank03_L8241:  STA $82
Bank03_L8243:  RTS

Bank03_L8244:  JSR $80B0
Bank03_L8247:  BPL $824C
Bank03_L8249:  JMP $833F
Bank03_L824C:  LDA $0405,X
Bank03_L824F:  AND #$20
Bank03_L8251:  EOR #$20
Bank03_L8253:  BEQ $82A2
Bank03_L8255:  JSR $822B
Bank03_L8258:  LDY EnCounter,X
Bank03_L825B:  LDA ($81),Y
Bank03_L825D:  CMP #$F0
Bank03_L825F:  BCC $827F
Bank03_L8261:  CMP #$FA
Bank03_L8263:  BEQ $827C
Bank03_L8265:  CMP #$FB
Bank03_L8267:  BEQ $82B0
Bank03_L8269:  CMP #$FC
Bank03_L826B:  BEQ $82B3
Bank03_L826D:  CMP #$FD
Bank03_L826F:  BEQ $82A5
Bank03_L8271:  CMP #$FE
Bank03_L8273:  BEQ $82DE
Bank03_L8275:  LDA #$00
Bank03_L8277:  STA EnCounter,X
Bank03_L827A:  BEQ $8258
Bank03_L827C:  JMP $8312
Bank03_L827F:  SEC 
Bank03_L8280:  SBC EnDelay,X
Bank03_L8283:  BNE $8290
Bank03_L8285:  STA EnDelay,X
Bank03_L8288:  INY 
Bank03_L8289:  INY 
Bank03_L828A:  TYA 
Bank03_L828B:  STA EnCounter,X
Bank03_L828E:  BNE $825B
Bank03_L8290:  INC EnDelay,X
Bank03_L8293:  INY 
Bank03_L8294:  LDA ($81),Y
Bank03_L8296:  ASL 
Bank03_L8297:  PHP 
Bank03_L8298:  JSR Adiv32          ;($C2BE)Divide by 32.
Bank03_L829B:  PLP 
Bank03_L829C:  BCC $82A2
Bank03_L829E:  EOR #$FF
Bank03_L82A0:  ADC #$00
Bank03_L82A2:  STA $00
Bank03_L82A4:  RTS

Bank03_L82A5:  INC EnCounter,X
Bank03_L82A8:  INY 
Bank03_L82A9:  LDA #$00
Bank03_L82AB:  STA $6B01,X
Bank03_L82AE:  BEQ $825B
Bank03_L82B0:  PLA 
Bank03_L82B1:  PLA 
Bank03_L82B2:  RTS

Bank03_L82B3:  LDA $6B03,X
Bank03_L82B6:  BPL $82BE
Bank03_L82B8:  JSR GrowRadius
Bank03_L82BB:  JMP $82C3
Bank03_L82BE:  BEQ $82D2
Bank03_L82C0:  JSR ShrinkRadius
Bank03_L82C3:  LDX PageIndex
Bank03_L82C5:  BCS $82D2
Bank03_L82C7:  LDY EnCounter,X
Bank03_L82CA:  INY 
Bank03_L82CB:  LDA #$00
Bank03_L82CD:  STA $6B03,X
Bank03_L82D0:  BEQ $82D7
Bank03_L82D2:  LDY EnCounter,X
Bank03_L82D5:  DEY 
Bank03_L82D6:  DEY 
Bank03_L82D7:  TYA 
Bank03_L82D8:  STA EnCounter,X
Bank03_L82DB:  JMP $825B
Bank03_L82DE:  DEY 
Bank03_L82DF:  DEY 
Bank03_L82E0:  TYA 
Bank03_L82E1:  STA EnCounter,X
Bank03_L82E4:  LDA $6B03,X
Bank03_L82E7:  BPL $82EF
Bank03_L82E9:  JSR GrowRadius
Bank03_L82EC:  JMP $82F4
Bank03_L82EF:  BEQ $82FB
Bank03_L82F1:  JSR ShrinkRadius
Bank03_L82F4:  LDX PageIndex
Bank03_L82F6:  BCC $82FB
Bank03_L82F8:  JMP $8258
Bank03_L82FB:  LDY EnDataIndex,X
Bank03_L82FE:  LDA $968B,Y
Bank03_L8301:  AND #$20
Bank03_L8303:  BEQ $8312
Bank03_L8305:  LDA $0405,X
Bank03_L8308:  EOR #$05
Bank03_L830A:  ORA $968B,Y
Bank03_L830D:  AND #$1F
Bank03_L830F:  STA $0405,X
Bank03_L8312:  JSR $81B1
Bank03_L8315:  JMP $82A2
Bank03_L8318:  JSR $80B0
Bank03_L831B:  BPL $8320
Bank03_L831D:  JMP $8395
Bank03_L8320:  LDA $0405,X
Bank03_L8323:  AND #$20
Bank03_L8325:  EOR #$20
Bank03_L8327:  BEQ $833C
Bank03_L8329:  LDY EnCounter,X
Bank03_L832C:  INY 
Bank03_L832D:  LDA ($81),Y
Bank03_L832F:  TAX 
Bank03_L8330:  AND #$08
Bank03_L8332:  PHP 
Bank03_L8333:  TXA 
Bank03_L8334:  AND #$07
Bank03_L8336:  PLP 
Bank03_L8337:  BEQ $833C
Bank03_L8339:  JSR TwosCompliment
Bank03_L833C:  STA $00
Bank03_L833E:  RTS

Bank03_L833F:  LDY #$0E
Bank03_L8341:  LDA $6AFE,X
Bank03_L8344:  BMI $835E
Bank03_L8346:  CLC 
Bank03_L8347:  ADC EnCounter,X
Bank03_L834A:  STA EnCounter,X
Bank03_L834D:  LDA $0402,X
Bank03_L8350:  ADC #$00
Bank03_L8352:  STA $0402,X
Bank03_L8355:  BPL $8376
Bank03_L8357:  JSR TwosCompliment
Bank03_L835A:  LDY #$F2
Bank03_L835C:  BNE $8376
Bank03_L835E:  JSR TwosCompliment
Bank03_L8361:  SEC 
Bank03_L8362:  STA $00
Bank03_L8364:  LDA EnCounter,X
Bank03_L8367:  SBC $00
Bank03_L8369:  STA EnCounter,X
Bank03_L836C:  LDA $0402,X
Bank03_L836F:  SBC #$00
Bank03_L8371:  STA $0402,X
Bank03_L8374:  BMI $8357
Bank03_L8376:  CMP #$0E
Bank03_L8378:  BCC $8383
Bank03_L837A:  LDA #$00
Bank03_L837C:  STA EnCounter,X
Bank03_L837F:  TYA 
Bank03_L8380:  STA $0402,X
Bank03_L8383:  LDA $6AFC,X
Bank03_L8386:  CLC 
Bank03_L8387:  ADC EnCounter,X
Bank03_L838A:  STA $6AFC,X
Bank03_L838D:  LDA #$00
Bank03_L838F:  ADC $0402,X
Bank03_L8392:  STA $00
Bank03_L8394:  RTS

Bank03_L8395:  LDA #$00
Bank03_L8397:  STA $00
Bank03_L8399:  STA $02
Bank03_L839B:  LDA #$0E
Bank03_L839D:  STA $01
Bank03_L839F:  STA $03
Bank03_L83A1:  LDA $0407,X
Bank03_L83A4:  CLC 
Bank03_L83A5:  ADC $6AFF,X
Bank03_L83A8:  STA $0407,X
Bank03_L83AB:  STA $04
Bank03_L83AD:  LDA #$00
Bank03_L83AF:  LDY $6AFF,X
Bank03_L83B2:  BPL $83B6
Bank03_L83B4:  LDA #$FF
Bank03_L83B6:  ADC $0403,X
Bank03_L83B9:  STA $0403,X
Bank03_L83BC:  TAY 
Bank03_L83BD:  BPL $83D0
Bank03_L83BF:  LDA #$00
Bank03_L83C1:  SEC 
Bank03_L83C2:  SBC $0407,X
Bank03_L83C5:  STA $04
Bank03_L83C7:  LDA #$00
Bank03_L83C9:  SBC $0403,X
Bank03_L83CC:  TAY 
Bank03_L83CD:  JSR LE449
Bank03_L83D0:  LDA $04
Bank03_L83D2:  CMP $02
Bank03_L83D4:  TYA 
Bank03_L83D5:  SBC $03
Bank03_L83D7:  BCC $83E3
Bank03_L83D9:  LDA $00
Bank03_L83DB:  STA $0407,X
Bank03_L83DE:  LDA $01
Bank03_L83E0:  STA $0403,X
Bank03_L83E3:  LDA $6AFD,X
Bank03_L83E6:  CLC 
Bank03_L83E7:  ADC $0407,X
Bank03_L83EA:  STA $6AFD,X
Bank03_L83ED:  LDA #$00
Bank03_L83EF:  ADC $0403,X
Bank03_L83F2:  STA $00
Bank03_L83F4:  RTS

Bank03_L83F5:  LDX PageIndex
Bank03_L83F7:  LDA EnYRoomPos,X
Bank03_L83FA:  SEC 
Bank03_L83FB:  SBC EnRadY,X
Bank03_L83FE:  AND #$07
Bank03_L8400:  SEC 
Bank03_L8401:  BNE $8406
Bank03_L8403:  JSR GrowRadius
Bank03_L8406:  LDY #$00
Bank03_L8408:  STY $00
Bank03_L840A:  LDX PageIndex
Bank03_L840C:  BCC $844A
Bank03_L840E:  INC $00
Bank03_L8410:  LDY EnYRoomPos,X
Bank03_L8413:  BNE $8429
Bank03_L8415:  LDY #$F0
Bank03_L8417:  LDA $49
Bank03_L8419:  CMP #$02
Bank03_L841B:  BCS $8429
Bank03_L841D:  LDA $FC
Bank03_L841F:  BEQ $844A
Bank03_L8421:  JSR $8563
Bank03_L8424:  BEQ $844A
Bank03_L8426:  JSR $855A
Bank03_L8429:  DEY 
Bank03_L842A:  TYA 
Bank03_L842B:  STA EnYRoomPos,X
Bank03_L842E:  CMP EnRadY,X
Bank03_L8431:  BNE $8441
Bank03_L8433:  LDA $FC
Bank03_L8435:  BEQ $843C
Bank03_L8437:  JSR $8563
Bank03_L843A:  BNE $8441
Bank03_L843C:  INC EnYRoomPos,X
Bank03_L843F:  CLC 
Bank03_L8440:  RTS

Bank03_L8441:  LDA $0405,X
Bank03_L8444:  BMI $8449
Bank03_L8446:  INC $6B01,X
Bank03_L8449:  SEC 
Bank03_L844A:  RTS

Bank03_L844B:  LDX PageIndex
Bank03_L844D:  LDA EnYRoomPos,X
Bank03_L8450:  CLC 
Bank03_L8451:  ADC EnRadY,X
Bank03_L8454:  AND #$07
Bank03_L8456:  SEC 
Bank03_L8457:  BNE $845C
Bank03_L8459:  JSR ShrinkRadius
Bank03_L845C:  LDY #$00
Bank03_L845E:  STY $00
Bank03_L8460:  LDX PageIndex
Bank03_L8462:  BCC $84A6
Bank03_L8464:  INC $00
Bank03_L8466:  LDY EnYRoomPos,X
Bank03_L8469:  CPY #$EF
Bank03_L846B:  BNE $8481
Bank03_L846D:  LDY #$FF
Bank03_L846F:  LDA $49
Bank03_L8471:  CMP #$02
Bank03_L8473:  BCS $8481
Bank03_L8475:  LDA $FC
Bank03_L8477:  BEQ $84A6
Bank03_L8479:  JSR $8563
Bank03_L847C:  BNE $84A6
Bank03_L847E:  JSR $855A
Bank03_L8481:  INY 
Bank03_L8482:  TYA 
Bank03_L8483:  STA EnYRoomPos,X
Bank03_L8486:  CLC 
Bank03_L8487:  ADC EnRadY,X
Bank03_L848A:  CMP #$EF
Bank03_L848C:  BNE $849D
Bank03_L848E:  LDA $FC
Bank03_L8490:  BEQ $8497
Bank03_L8492:  JSR $8563
Bank03_L8495:  BEQ $849D
Bank03_L8497:  DEC EnYRoomPos,X
Bank03_L849A:  CLC 
Bank03_L849B:  BCC $84A6
Bank03_L849D:  LDA $0405,X
Bank03_L84A0:  BMI $84A5
Bank03_L84A2:  DEC $6B01,X
Bank03_L84A5:  SEC 
Bank03_L84A6:  RTS

Bank03_L84A7:  LDX PageIndex
Bank03_L84A9:  LDA EnXRoomPos,X
Bank03_L84AC:  SEC 
Bank03_L84AD:  SBC EnRadX,X
Bank03_L84B0:  AND #$07
Bank03_L84B2:  SEC 
Bank03_L84B3:  BNE $84B8
Bank03_L84B5:  JSR GrowRadiusX
Bank03_L84B8:  LDY #$00
Bank03_L84BA:  STY $00
Bank03_L84BC:  LDX PageIndex
Bank03_L84BE:  BCC $84FD
Bank03_L84C0:  INC $00
Bank03_L84C2:  LDY EnXRoomPos,X
Bank03_L84C5:  BNE $84DA
Bank03_L84C7:  LDA $49
Bank03_L84C9:  CMP #$02
Bank03_L84CB:  BCC $84DA
Bank03_L84CD:  LDA $FD
Bank03_L84CF:  BEQ $84D4
Bank03_L84D1:  JSR $8563
Bank03_L84D4:  CLC 
Bank03_L84D5:  BEQ $84FD
Bank03_L84D7:  JSR $855A
Bank03_L84DA:  DEC EnXRoomPos,X
Bank03_L84DD:  LDA EnXRoomPos,X
Bank03_L84E0:  CMP EnRadX,X
Bank03_L84E3:  BNE $84F4
Bank03_L84E5:  LDA $FD
Bank03_L84E7:  BEQ $84EE
Bank03_L84E9:  JSR $8563
Bank03_L84EC:  BNE $84F4
Bank03_L84EE:  INC EnXRoomPos,X
Bank03_L84F1:  CLC 
Bank03_L84F2:  BCC $84FD
Bank03_L84F4:  LDA $0405,X
Bank03_L84F7:  BPL $84FC
Bank03_L84F9:  INC $6B01,X
Bank03_L84FC:  SEC 
Bank03_L84FD:  RTS

Bank03_L84FE:  LDX PageIndex
Bank03_L8500:  LDA EnXRoomPos,X
Bank03_L8503:  CLC 
Bank03_L8504:  ADC EnRadX,X
Bank03_L8507:  AND #$07
Bank03_L8509:  SEC 
Bank03_L850A:  BNE $850F
Bank03_L850C:  JSR ShrinkRadiusX
Bank03_L850F:  LDY #$00
Bank03_L8511:  STY $00
Bank03_L8513:  LDX PageIndex
Bank03_L8515:  BCC $8559
Bank03_L8517:  INC $00
Bank03_L8519:  INC EnXRoomPos,X
Bank03_L851C:  BNE $8536
Bank03_L851E:  LDA $49
Bank03_L8520:  CMP #$02
Bank03_L8522:  BCC $8536
Bank03_L8524:  LDA $FD
Bank03_L8526:  BEQ $852D
Bank03_L8528:  JSR $8563
Bank03_L852B:  BEQ $8533
Bank03_L852D:  DEC EnXRoomPos,X
Bank03_L8530:  CLC 
Bank03_L8531:  BCC $8559
Bank03_L8533:  JSR $855A
Bank03_L8536:  LDA EnXRoomPos,X
Bank03_L8539:  CLC 
Bank03_L853A:  ADC EnRadX,X
Bank03_L853D:  CMP #$FF
Bank03_L853F:  BNE $8550
Bank03_L8541:  LDA $FD
Bank03_L8543:  BEQ $854A
Bank03_L8545:  JSR $8563
Bank03_L8548:  BEQ $8550
Bank03_L854A:  DEC EnXRoomPos,X
Bank03_L854D:  CLC 
Bank03_L854E:  BCC $8559
Bank03_L8550:  LDA $0405,X
Bank03_L8553:  BPL $8558
Bank03_L8555:  DEC $6B01,X
Bank03_L8558:  SEC 
Bank03_L8559:  RTS

Bank03_L855A:  LDA EnNameTable,X
Bank03_L855D:  EOR #$01
Bank03_L855F:  STA EnNameTable,X
Bank03_L8562:  RTS

Bank03_L8563:  LDA EnNameTable,X
Bank03_L8566:  EOR $FF
Bank03_L8568:  AND #$01
Bank03_L856A:  RTS

Bank03_L856B:  EOR $0405,X
Bank03_L856E:  STA $0405,X
Bank03_L8571:  RTS 

;---------------------------------[ Object animation data tables ]----------------------------------

;The following tables are indices into the FramePtrTable that correspond to various animations. The
;FramePtrTable represents individual frames and the entries in ObjectAnimIdxTbl are the groups of
;frames responsible for animaton Samus, her weapons and other objects.

.checkpc ObjectAnimIdxTbl
.advance ObjectAnimIdxTbl

;Samus run animation.
Bank03_L8572:  .byte $03, $04, $05, $FF

;Samus front animation.
Bank03_L8576:  .byte $07, $FF

;Samus jump out of ball animation.
Bank03_L8578:  .byte $17

;Samus Stand animation.
Bank03_L8579:  .byte $08, $FF

;Samus stand and fire animation.
Bank03_L857B:  .byte $22, $FF

;Samus stand and jump animation.
Bank03_L857D:  .byte $04

;Samus Jump animation.
Bank03_L857E:  .byte $10, $FF

;Samus summersault animation.
Bank03_L8580:  .byte $17, $18, $19, $1A, $FF

;Samus run and jump animation.
Bank03_L8585:  .byte $03, $17, $FF

;Samus roll animation.
Bank03_L8588:  .byte $1E, $1D, $1C, $1B, $FF

;Bullet animation.
Bank03_L858D:  .byte $28, $FF

;Bullet hit animation.
Bank03_L858F:  .byte $2A, $F7, $FF

;Samus jump and fire animation.
Bank03_L8592:  .byte $12, $FF

;Samus run and fire animation.
Bank03_L8594:  .byte $0C, $0D, $0E, $FF

;Samus point up and shoot animation.
Bank03_L8598:  .byte $30 

;Samus point up animation.
Bank03_L8599:  .byte $2B, $FF

;Door open animation.
Bank03_L859B:  .byte $31, $31, $33, $F7, $FF

;Door close animation.
Bank03_L85A0:  .byte $33, $33, $31, $FF

;Samus explode animation.
Bank03_L85A4: .byte $35, $FF

;Samus jump and point up animation.
Bank03_L85A6: .byte $39, $38, $FF

;Samus run and point up animation.
Bank03_L85A9:  .byte $40, $41, $42, $FF

;Samus run, point up and shoot animation 1.
Bank03_L85AD:  .byte $46, $FF

;Samus run, point up and shoot animation 2.
Bank03_L85AF:  .byte $47, $FF

;Samus run, point up and shoot animation 3.
Bank03_L85B1:  .byte $48, $FF

;Samus on elevator animation 1.
Bank03_L85B3:  .byte $07, $F7, $F7, $07, $F7, $F7, $F7, $07, $F7, $F7, $F7, $F7, $07, $F7, $FF

;Samus on elevator animation 2.
Bank03_L85C2:  .byte $23, $F7, $F7, $23, $F7, $F7, $F7, $23, $F7, $F7, $F7, $F7, $23, $F7, $FF

;Samus on elevator animation 3.
Bank03_L85D1:  .byte $07, $F7, $F7, $F7, $F7, $07, $F7, $F7, $F7, $07, $F7, $F7, $07, $F7, $FF

;Samus on elevator animation 4.
Bank03_L85E0:  .byte $23, $F7, $F7, $F7, $F7, $23, $F7, $F7, $F7, $23, $F7, $F7, $23, $F7, $FF

;Wave beam animation.
Bank03_L85EF:  .byte $4B, $FF

;Bomb tick animation.
Bank03_L85F1:  .byte $4E, $4F, $FF

;Bomb explode animation.
Bank03_L85F4:  .byte $3C, $4A, $49, $4A, $4D, $4A, $4D, $F7, $FF

;Missile left animation.
Bank03_L85FD:  .byte $26, $FF

;Missile right animation.
Bank03_L85FF:  .byte $25, $FF

;Missile up animation.
Bank03_L8601:  .byte $27, $FF

;Missile explode animation.
Bank03_L8603:  .byte $67, $67, $67, $68, $68, $69, $F7, $FF

;----------------------------[ Sprite drawing pointer tables ]--------------------------------------

;The above animation pointers provide an index into the following table
;for the animation sequences.

.checkpc FramePtrTable
.advance FramePtrTable

Bank03_L860B:  .word $87CB, $87CB, $87CB, $87CB, $87DD, $87F0, $8802, $8802
Bank03_L861B:  .word $8818, $882C, $882C, $882C, $882C, $883E, $8851, $8863
Bank03_L862B:  .word $8863, $8874, $8874, $8885, $8885, $8885, $8885, $8885
Bank03_L863B:  .word $888F, $8899, $88A3, $88AD, $88B8, $88C3, $88CE, $88D9
Bank03_L864B:  .word $88D9, $88D9, $88D9, $88EE, $88F8, $88F8, $88FE, $8904
Bank03_L865B:  .word $890A, $890F, $890F, $8914, $8928, $8928, $8928, $8928
Bank03_L866B:  .word $8928, $893C, $8948, $8948, $8954, $8954, $8961, $8961
Bank03_L867B:  .word $8961, $8974, $8987, $8987, $8987, $8995, $8995, $8995
Bank03_L868B:  .word $8995, $89A9, $89BE, $89D2, $89D2, $89D2, $89D2, $89E6
Bank03_L869B:  .word $89FB, $8A0F, $8A1D, $8A21, $8A26, $8A26, $8A3C, $8A41
Bank03_L86AB:  .word $8A46, $8A4E, $8A56, $8A5E, $8A66, $8A6E, $8A76, $8A7E
Bank03_L86BB:  .word $8A86, $8A8E, $8A9C, $8AA1, $8AA6, $8AAE, $8ABA, $8AC4
Bank03_L86CB:  .word $8AC4, $8AC4, $8AC4, $8AC4, $8AC4, $8AC4, $8AD8, $8AE9
Bank03_L86DB:  .word $8AF3, $8B03

;The following table provides pointers to data used for the placement of the sprites that make up
;Samus and other non-enemy objects.

.checkpc PlacePtrTable
.advance PlacePtrTable

Bank03_L86DF:  .word $8701, $871F, $872B, $8737, $8747, $8751, $86FD, $875D
Bank03_L86EF:  .word $8775, $878D, $8791, $8799, $87A5, $8749, $87B1

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
Bank03_L86FD:  .byte $E8, $FC, $EA, $FC

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
Bank03_L8701:  .byte $F0, $F8, $F0, $00, $F8, $F0, $F8, $F8, $F8, $00, $00, $F8, $00, $00, $00, $08
;              +--8--+   +--9--+   +--A--+   +--B--+   +--C--+   +--D--+   +--E--+
Bank03_L8711:  .byte $08, $F8, $08, $00, $08, $08, $F8, $F4, $F8, $F6, $EC, $F4, $EE, $F4

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
Bank03_L871F:  .byte $F3, $F8, $F3, $00, $FB, $F8, $FB, $00, $03, $F8, $03, $00 

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
Bank03_L872B:  .byte $F8, $F6, $F8, $FE, $F8, $06, $00, $F6, $00, $FE, $00, $06

;Elevator frame.
;          +--------+--------+--------+--------+--------+--------+--------+--------+
;          |        |        |        |        |        |        |        |        |
;          |        |        |        |        |        |        |        |        |
;          |        |        *        |        |        |        |        |        |
;          |       0|       1|       2|       3|       4|       5|       6|       7|
;          +--------+--------+--------+--------+--------+--------+--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+   +--4--+   +--5--+   +--6--+   +--7--+
Bank03_L8737:  .byte $FC, $F0, $FC, $F8, $FC, $00, $FC, $08, $FC, $10, $FC, $18, $FC, $20, $FC, $28

;Several projectile frames.
;          +--------+
;          |        |
;          |        |
;          |    *   |
;          |       0|
;          +--------+
;              +--0--+
Bank03_L8747:  .byte $FC, $FC

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
Bank03_L8749:  .byte $F8, $F8, $F8, $00, $00, $F8, $00, $00

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
Bank03_L8751:  .byte $E8, $00, $F0, $00, $F8, $00, $00, $00, $08, $00, $10, $00 

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
Bank03_L875D:  .byte $80, $80, $81, $81, $82, $82, $83, $83, $84, $84, $85, $85, $F4, $F8, $F4, $00
;              +--2--+   +--3--+   +--4--+   +--5--+
Bank03_L876D:  .byte $FC, $F8, $FC, $00, $04, $F8, $04, $00

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
Bank03_L8775:  .byte $F0, $00, $F0, $08, $F8, $08, $F0, $F0, $F0, $F8, $F8, $F0, $00, $F0, $08, $F0
;              +--8--+   +--9--+   +--A--+   +--B--+
Bank03_L8785:  .byte $08, $F8, $00, $08, $08, $00, $08, $08

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
Bank03_L878D:  .byte $F8, $FC, $00, $FC

;Missile left/right and missile explode frames.
;          +--------+--------+        +--------+--------+
;          |        |        |        |        |        |
;          |        |        |        |        |        |
;          |        *        |        |        |        |
;          |       0|       1|        |       2|       3|
;          +--------+--------+        +--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+
Bank03_L8791:  .byte $FC, $F8, $FC, $00, $FC, $10, $FC, $18

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
Bank03_L8799:  .byte $FC, $F0, $F4, $F8, $F4, $00, $FC, $08, $04, $F8, $04, $00

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
Bank03_L87A5:  .byte $FC, $E8, $EC, $F0, $EC, $08, $FC, $10, $0C, $F0, $0C, $08

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
Bank03_L87B1:  .byte $00, $F8, $00, $00, $08, $F8, $08, $00, $E8, $F0, $E8, $F8, $E8, $00, $F0, $F0
;              +--8--+   +--9--+   +--A--+   +--B--+   +--C--+
Bank03_L87C1:  .byte $F0, $F8, $F0, $00, $F8, $F0, $F8, $F8, $F8, $00

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
Bank03_L87CB:  .byte $40, $0F, $04, $00, $01, $FD, $20, $FE, $41, $40, $FD, $60, $20, $21, $FE, $FE
Bank03_L87DB:  .byte $31, $FF

;Samus run.
Bank03_L87DD:  .byte $40, $0F, $04, $02, $03, $FD, $20, $FE, $43, $42, $FD, $60, $22, $23, $FE, $32
Bank03_L87ED:  .byte $33, $34, $FF

;Samus run.
Bank03_L87F0:  .byte $40, $0F, $04, $05, $06, $FD, $20, $FE, $45, $44, $FD, $60, $25, $26, $27, $35
Bank03_L8800:  .byte $36, $FF

;Samus facing forward.
Bank03_L8802:  .byte $00, $0F, $04, $09, $FD, $60, $09, $FD, $20, $FE, $19, $1A, $FD, $20, $29, $2A
Bank03_L8812:  .byte $FE, $39, $FD, $60, $39, $FF

;Samus stand.
Bank03_L8818:  .byte $40, $0F, $04, $FD, $20, $0E, $0D, $FE, $1E, $1D, $2E, $2D, $FE, $FD, $60, $3B
Bank03_L8828:  .byte $3C, $FE, $17, $FF

;Samus run and fire.
Bank03_L882C:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $20, $21, $FE, $FE
Bank03_L883C:  .byte $31, $FF

;Samus run and fire.
Bank03_L883E:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $22, $23, $FE, $32
Bank03_L884E:  .byte $33, $34, $FF

;Samus run and fire.
Bank03_L8851:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $25, $26, $27, $35
Bank03_L8861:  .byte $36, $FF

;Samus stand and jump.
Bank03_L8863:  .byte $40, $0F, $04, $00, $01, $FD, $20, $FE, $41, $40, $FD, $60, $22, $07, $08, $32
Bank03_L8873:  .byte $FF

;Samus jump and fire.
Bank03_L8874:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $22, $07, $08, $32
Bank03_L8884:  .byte $FF

;Samus summersault.
Bank03_L8885:  .byte $41, $0F, $04, $52, $53, $62, $63, $72, $73, $FF

;Samus summersault.
Bank03_L888F:  .byte $42, $0F, $04, $54, $55, $56, $64, $65, $66, $FF

;Samus summersault.
Bank03_L8899:  .byte $81, $0F, $04, $52, $53, $62, $63, $72, $73, $FF

;Samus summersault.
Bank03_L88A3:  .byte $82, $0F, $04, $54, $55, $56, $64, $65, $66, $FF

;Samus roll.
Bank03_L88AD:  .byte $01, $08, $04, $FC, $03, $00, $50, $51, $60, $61, $FF

;Samus roll.
Bank03_L88B8:  .byte $81, $08, $04, $FC, $FD, $00, $50, $51, $60, $61, $FF

;Samus roll.
Bank03_L88C3:  .byte $C1, $08, $04, $FC, $FD, $00, $50, $51, $60, $61, $FF

;Samus roll.
Bank03_L88CE:  .byte $41, $08, $04, $FC, $03, $00, $50, $51, $60, $61, $FF

;Samus stand and fire.
Bank03_L88D9:  .byte $40, $0F, $04, $FD, $20, $0E, $0D, $FE, $1E, $1D, $2E, $2D, $FE, $FD, $60, $3B
Bank03_L88E9:  .byte $3C, $FE, $FE, $17, $FF

;Elevator.
Bank03_L88EE:  .byte $03, $04, $10, $28, $38, $38, $FD, $60, $28, $FF

;Missile right.
Bank03_L88F8:  .byte $4A, $04, $08, $5E, $5F, $FF

;Missile left.
Bank03_L88FE:  .byte $0A, $04, $08, $5E, $5F, $FF

;Missile up.
Bank03_L8904:  .byte $09, $08, $04, $14, $24, $FF

;Bullet fire.
Bank03_L890A:  .byte $04, $02, $02, $30, $FF

;Bullet hit.
Bank03_L890F:  .byte $04, $00, $00, $04, $FF

;Samus stand and point up.
Bank03_L8914:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $2E, $2D, $FE, $FD
Bank03_L8924:  .byte $60, $3B, $3C, $FF

;Samus from ball to pointing up.
Bank03_L8928:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $2E, $2D, $FE, $FD
Bank03_L8938:  .byte $60, $3B, $3C, $FF

;Door closed.
Bank03_L893C:  .byte $35, $18, $08, $0F, $1F, $2F, $FD, $A3, $2F, $1F, $0F, $FF

;Door open/close.
Bank03_L8948:  .byte $35, $18, $04, $6A, $6B, $6C, $FD, $A3, $6C, $6B, $6A, $FF

;Samus explode.
Bank03_L8954:  .byte $07, $00, $00, $FC, $FC, $00, $0B, $0C, $1B, $1C, $2B, $2C, $FF

;Samus jump and point up.
Bank03_L8961:  .byte $46, $0F, $04, $69, $FD, $20, $FE, $7A, $79, $FE, $78, $77, $FD, $60, $22, $07
Bank03_L8971:  .byte $08, $32, $FF

;Samus jump and point up.
Bank03_L8974:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $07
Bank03_L8984:  .byte $08, $32, $FF

;Bomb explode.
Bank03_L8987:  .byte $0D, $0C, $0C, $74, $FD, $60, $74, $FD, $A0, $74, $FD, $E0, $74, $FF

;Samus run and point up.
Bank03_L8995:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $20, $21
Bank03_L89A5:  .byte $FE, $FE, $31, $FF

;Samus run and point up.
Bank03_L89A9:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $23
Bank03_L89B9:  .byte $FE, $32, $33, $34, $FF

;Samus run and point up.
Bank03_L89BE:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $25, $26
Bank03_L89CE:  .byte $27, $35, $36, $FF

;Samus run and point up.
Bank03_L89D2:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $20, $21
Bank03_L89E2:  .byte $FE, $FE, $31, $FF

;Samus point up, run and fire.
Bank03_L89E6:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $23
Bank03_L89F6:  .byte $FE, $32, $33, $34, $FF

;Samus point up, run and fire.
Bank03_L89FB:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $25, $26
Bank03_L8A0B:  .byte $27, $35, $36, $FF

;Bomb explode.
Bank03_L8A0F:  .byte $0D, $0C, $0C, $75, $FD, $60, $75, $FD, $A0, $75, $FD, $E0, $75, $FF

;Bomb explode.
Bank03_L8A1D:  .byte $00, $00, $00, $FF

;Wave beam.
Bank03_L8A21:  .byte $04, $04, $04, $4C, $FF

;Bomb explode.
Bank03_L8A26:  .byte $08, $10, $10, $3D, $3E, $4E, $FD, $60, $3E, $3D, $4E, $FD, $E0, $4E, $3E, $3D
Bank03_L8A36:  .byte $FD, $A0, $4E, $3D, $3E, $FF

;Bomb tick.
Bank03_L8A3C:  .byte $04, $04, $04, $70, $FF

;Bomb tick.
Bank03_L8A41:  .byte $04, $04, $04, $71, $FF

;Bomb item.
Bank03_L8A46:  .byte $0D, $03, $03, $86, $87, $96, $97, $FF

;High jump item.
Bank03_L8A4E:  .byte $0D, $03, $03, $7B, $7C, $8B, $8C, $FF

;Long beam item.
Bank03_L8A56:  .byte $0D, $03, $03, $88, $67, $98, $99, $FF

;Screw attack item.
Bank03_L8A5E:  .byte $0D, $03, $03, $80, $81, $90, $91, $FF

;Maru Mari item.
Bank03_L8A66:  .byte $0D, $03, $03, $7D, $7E, $8D, $8E, $FF

;Varia item.
Bank03_L8A6E:  .byte $0D, $03, $03, $82, $83, $92, $93, $FF

;Wave beam item.
Bank03_L8A76:  .byte $0D, $03, $03, $88, $89, $98, $99, $FF

;Ice beam item.
Bank03_L8A7E:  .byte $0D, $03, $03, $88, $68, $98, $99, $FF

;Energy tank item.
Bank03_L8A86:  .byte $0D, $03, $03, $84, $85, $94, $95, $FF

;Missile item.
Bank03_L8A8E:  .byte $0D, $03, $03, $3F, $FD, $40, $3F, $FD, $00, $4F, $FD, $40, $4F, $FF

;Skree burrow.
Bank03_L8A9C:  .byte $34, $04, $04, $F2, $FF

;Not used.
Bank03_L8AA1:  .byte $04, $00, $00, $5A, $FF, $13, $00, $00, $B0, $B1, $B2, $B3, $FF, $13, $00, $00
Bank03_L8AB1:  .byte $B4, $B5, $B6, $B7, $B8, $B6, $B9, $B3, $FF, $13, $00, $00, $B3, $BA, $BA, $FE
Bank03_L8AC1:  .byte $80, $80, $FF

;Kraid statue.
Bank03_L8AC4:  .byte $1E, $00, $08, $FA, $FB, $FA, $FB, $FC, $00, $04, $C5, $C6, $C7, $D5, $D6, $D7
Bank03_L8AD4:  .byte $E5, $E6, $E7, $FF

;Ridley statue.
Bank03_L8AD8:  .byte $1E, $00, $08, $FA, $FB, $FA, $FB, $FE, $C8, $C9, $EB, $D8, $D9, $EA, $E8, $E9
Bank03_L8AE8:  .byte $FF

;Missile explode.
Bank03_L8AE9:  .byte $0A, $04, $08, $FD, $00, $57, $FD, $40, $57, $FF

;Missile explode.
Bank03_L8AF3:  .byte $0B, $04, $0C, $FD, $00, $57, $18, $FD, $40, $18, $57, $FD, $C0, $18, $18, $FF

;Missile explode.
Bank03_L8B03:  .byte $0C, $04, $10, $FD, $00, $57, $18, $FD, $40, $18, $57, $FD, $C0, $18, $18, $FF

;------------------------------------[ Samus enter door routines ]-----------------------------------

;This function is called once when Samus first enters a door.

.checkpc SamusEnterDoor
.advance SamusEnterDoor

Bank03_L8B13:  LDA DoorStatus          ;The code determines if Samus has entered a door if the-->
Bank03_L8B15:  BNE ++++                ;door status is 0, but door data information has been-->
Bank03_L8B17:  LDY SamusDoorData       ;written. If both conditions are met, Samus has just-->
Bank03_L8B19:  BEQ ++++                ;entered a door.
Bank03_L8B1B:  STA CrntMslePickups     ;
Bank03_L8B1D:  STA CrntEnrgyPickups    ;Reset current missile and energy power-up counters.
Bank03_L8B1F:  LDA RandomNumber1       ;
Bank03_L8B21:  AND #$0F                ;Randomly recalculate max missile pickups(16 max, 0 min).
Bank03_L8B23:  STA MaxMissilePickup    ;
Bank03_L8B25:  ASL                     ;
Bank03_L8B26:  ORA #$40                ;*2 for energy pickups and set bit 6(128 max, 64 min).
Bank03_L8B28:  STA MaxEnergyPickup     ;
Bank03_L8B2A:  LDA PPUCNT0ZP           ;
Bank03_L8B2C:  EOR #$01                ;
Bank03_L8B2E:  AND #$01                ;Erase name table door data for new room.
Bank03_L8B30:  TAY                     ;
Bank03_L8B31:  LSR                     ;
Bank03_L8B32:  STA $006C,Y             ;
Bank03_L8B35:  LDA ScrollDir           ;
Bank03_L8B37:  AND #$02                ;Is Samus scrolling horizontally?-->
Bank03_L8B39:  BNE +                   ;If so, branch.
Bank03_L8B3B:  LDX #$04                ;Samus currently scrolling vertically.
Bank03_L8B3D:  LDA ScrollY             ;Is room centered on screen?-->
Bank03_L8B3F:  BEQ +++++               ;If so, branch.
Bank03_L8B41:  LDA $FF                 ;
Bank03_L8B43:  EOR ObjectHi            ;Get inverse of Samus' current nametable.
Bank03_L8B46:  LSR                     ;
Bank03_L8B47:  BCC +++                 ;If Samus is on nametable 3, branch.
Bank03_L8B49:  BCS ++                  ;If Samus is on nametable 0, branch to decrement x.

Bank03_L8B4B:* LDX #$02                ;Samus is currently scrolling horizontally.
Bank03_L8B4D:  LDA ObjectX             ;Is Samus entering a left hand door?-->
Bank03_L8B50:  BPL ++                  ;If so, branch.
Bank03_L8B52:* DEX                     ;

Bank03_SetDoorEntryInfo:
Bank03_L8B53:* TXA                     ;X contains door scroll status and is transferred to A.
Bank03_L8B54:  STA DoorScrollStatus    ;Save door scroll status.
Bank03_L8B56:  JSR Bank03_SamusInDoor         ;($8B74)Indicate Samus just entered a door.
Bank03_L8B59:  LDA #$12                ;
Bank03_L8B5B:  STA DoorDelay           ;Set DoorDelay to 18 frames(going into door).
Bank03_L8B5D:  LDA SamusDoorData       ;
Bank03_L8B5F:  JSR Amul16              ;($C2C5)*16. Move scroll toggle data to upper 4 bits.
Bank03_L8B62:  ORA ObjAction           ;Keep Samus action so she will appear the same comming-->
Bank03_L8B65:  STA SamusDoorData       ;out of the door as she did going in.
Bank03_L8B67:  LDA #$05                ;
Bank03_L8B69:  STA ObjAction           ;Indicate Samus is in a door.
Bank03_L8B6C:* RTS                     ;

Bank03_L8B6D:* JSR Bank03_SetDoorEntryInfo    ;($8B53)Save Samus action and set door entry timer.
Bank03_L8B70:  JSR VertRoomCentered    ;($E21B)Room is centered. Toggle scroll.

Bank03_L8B73:  TXA                     ;X=#$01 or #$02(depending on which door Samus is in).

Bank03_SamusInDoor:
Bank03_L8B74:  ORA #$80                ;Set MSB of DoorStatus to indicate Samus has just-->
Bank03_L8B76:  STA DoorStatus          ;entered a door.
Bank03_L8B78:  RTS                     ;

;----------------------------------------------------------------------------------------------------

.checkpc DoorHandler
.advance DoorHandler

Bank03_L8B79:  LDX #$B0
Bank03_L8B7B:* JSR $8B87
Bank03_L8B7E:  LDA PageIndex
Bank03_L8B80:  SEC 
Bank03_L8B81:  SBC #$10
Bank03_L8B83:  TAX 
Bank03_L8B84:  BMI -
Bank03_L8B86:  RTS

Bank03_L8B87:  STX PageIndex
Bank03_L8B89:  LDA ObjAction,X
Bank03_L8B8C:  JSR ChooseRoutine       ;($C27C)

Bank03_L8B8F:  .word ExitSub
Bank03_L8B91:  .word $8B9D
Bank03_L8B93:  .word $8BD5
Bank03_L8B95:  .word $8C01
Bank03_L8B97:  .word $8C84
Bank03_L8B99:  .word $8CC6
Bank03_L8B9B:  .word $8CF0

Bank03_L8B9D:  INC $0300,X
Bank03_L8BA0:  LDA #$30
Bank03_L8BA2:  JSR SetProjectileAnim       ;($D2FA)
Bank03_L8BA5:  JSR $8CFB
Bank03_L8BA8:  LDY $0307,X
Bank03_L8BAB:  LDA $8BD1,Y
Bank03_L8BAE:  STA $030F,X
Bank03_L8BB1:  LDA $0307,X
Bank03_L8BB4:  CMP #$03
Bank03_L8BB6:  BNE $8BBA
Bank03_L8BB8:  LDA #$01
Bank03_L8BBA:  ORA #$A0
Bank03_L8BBC:  STA $6B
Bank03_L8BBE:  LDA #$00
Bank03_L8BC0:  STA $030A,X
Bank03_L8BC3:  TXA 
Bank03_L8BC4:  AND #$10
Bank03_L8BC6:  EOR #$10
Bank03_L8BC8:  ORA $6B
Bank03_L8BCA:  STA $6B
Bank03_L8BCC:  LDA #$06
Bank03_L8BCE:  JMP AnimDrawObject

Bank03_L8BD1:  .byte $05, $01, $0A, $01

Bank03_L8BD5:  LDA $030A,X
Bank03_L8BD8:  AND #$04
Bank03_L8BDA:  BEQ $8BB1
Bank03_L8BDC:  DEC $030F,X
Bank03_L8BDF:  BNE $8BB1
Bank03_L8BE1:  LDA #$03
Bank03_L8BE3:  CMP $0307,X
Bank03_L8BE6:  BNE $8BEE
Bank03_L8BE8:  LDY $010B
Bank03_L8BEB:  INY 
Bank03_L8BEC:  BNE $8BB1
Bank03_L8BEE:  STA $0300,X
Bank03_L8BF1:  LDA #$50
Bank03_L8BF3:  STA $030F,X
Bank03_L8BF6:  LDA #$2C
Bank03_L8BF8:  STA $0305,X
Bank03_L8BFB:  SEC 
Bank03_L8BFC:  SBC #$03
Bank03_L8BFE:  JMP $8C7E
Bank03_L8C01:  LDA DoorStatus
Bank03_L8C03:  BEQ $8C1D
Bank03_L8C05:  LDA $030C
Bank03_L8C08:  EOR $030C,X
Bank03_L8C0B:  LSR 
Bank03_L8C0C:  BCS $8C1D
Bank03_L8C0E:  LDA $030E
Bank03_L8C11:  EOR $030E,X
Bank03_L8C14:  BMI $8C1D
Bank03_L8C16:  LDA #$04
Bank03_L8C18:  STA $0300,X
Bank03_L8C1B:  BNE $8C73
Bank03_L8C1D:  LDA $0306,X
Bank03_L8C20:  CMP $0305,X
Bank03_L8C23:  BCC $8C73
Bank03_L8C25:  LDA $030F,X
Bank03_L8C28:  CMP #$50
Bank03_L8C2A:  BNE $8C57
Bank03_L8C2C:  JSR $8CF7
Bank03_L8C2F:  LDA $0307,X
Bank03_L8C32:  CMP #$01
Bank03_L8C34:  BEQ $8C57
Bank03_L8C36:  CMP #$03
Bank03_L8C38:  BEQ $8C57
Bank03_L8C3A:  LDA #$0A
Bank03_L8C3C:  STA $09
Bank03_L8C3E:  LDA $030C,X
Bank03_L8C41:  STA $08
Bank03_L8C43:  LDY $50
Bank03_L8C45:  TXA 
Bank03_L8C46:  JSR Amul16
Bank03_L8C49:  BCC $8C4C
Bank03_L8C4B:  DEY 
Bank03_L8C4C:  TYA 
Bank03_L8C4D:  JSR $DC1E
Bank03_L8C50:  LDA #$00
Bank03_L8C52:  STA $0300,X
Bank03_L8C55:  BEQ $8C73
Bank03_L8C57:  LDA $2D
Bank03_L8C59:  LSR 
Bank03_L8C5A:  BCS $8C73
Bank03_L8C5C:  DEC $030F,X
Bank03_L8C5F:  BNE $8C73
Bank03_L8C61:  LDA #$01
Bank03_L8C63:  STA $030F,X
Bank03_L8C66:  JSR $8CFB
Bank03_L8C69:  LDA #$02
Bank03_L8C6B:  STA $0300,X
Bank03_L8C6E:  JSR $8C76
Bank03_L8C71:  LDX PageIndex
Bank03_L8C73:  JMP $8BB1
Bank03_L8C76:  LDA #$30
Bank03_L8C78:  STA $0305,X
Bank03_L8C7B:  SEC 
Bank03_L8C7C:  SBC #$02
Bank03_L8C7E:  JSR SetProjectileAnimWithoutReset
Bank03_L8C81:  JMP SFXDoor
Bank03_L8C84:  LDA DoorStatus
Bank03_L8C86:  CMP #$05
Bank03_L8C88:  BCS $8CC3
Bank03_L8C8A:  JSR $8CFB
Bank03_L8C8D:  JSR $8C76
Bank03_L8C90:  LDX PageIndex
Bank03_L8C92:  LDA $91
Bank03_L8C94:  BEQ $8CA7
Bank03_L8C96:  TXA 
Bank03_L8C97:  JSR Adiv16
Bank03_L8C9A:  EOR $91
Bank03_L8C9C:  LSR 
Bank03_L8C9D:  BCC $8CA7
Bank03_L8C9F:  LDA $76
Bank03_L8CA1:  EOR #$07
Bank03_L8CA3:  STA $76
Bank03_L8CA5:  STA $1C
Bank03_L8CA7:  INC $0300,X
Bank03_L8CAA:  LDA #$00
Bank03_L8CAC:  STA $91
Bank03_L8CAE:  LDA $0307,X
Bank03_L8CB1:  CMP #$03
Bank03_L8CB3:  BNE $8CC3
Bank03_L8CB5:  TXA 
Bank03_L8CB6:  JSR Amul16
Bank03_L8CB9:  BCS $8CC0
Bank03_L8CBB:  JSR TourianMusic
Bank03_L8CBE:  BNE $8CC3
Bank03_L8CC0:  JSR MotherBrainMusic
Bank03_L8CC3:  JMP $8C71
Bank03_L8CC6:  LDA DoorStatus
Bank03_L8CC8:  CMP #$05
Bank03_L8CCA:  BNE $8CED
Bank03_L8CCC:  TXA 
Bank03_L8CCD:  EOR #$10
Bank03_L8CCF:  TAX 
Bank03_L8CD0:  LDA #$06
Bank03_L8CD2:  STA $0300,X
Bank03_L8CD5:  LDA #$2C
Bank03_L8CD7:  STA $0305,X
Bank03_L8CDA:  SEC 
Bank03_L8CDB:  SBC #$03
Bank03_L8CDD:  JSR SetProjectileAnimWithoutReset
Bank03_L8CE0:  JSR SFXDoor
Bank03_L8CE3:  JSR SelectSamusPal
Bank03_L8CE6:  LDX PageIndex
Bank03_L8CE8:  LDA #$02
Bank03_L8CEA:  STA $0300,X
Bank03_L8CED:  JMP $8BB1
Bank03_L8CF0:  LDA DoorStatus
Bank03_L8CF2:  BNE $8CED
Bank03_L8CF4:  JMP $8C61
Bank03_L8CF7:  LDA #$FF
Bank03_L8CF9:  BNE $8CFD
Bank03_L8CFB:  LDA #$4E
Bank03_L8CFD:  PHA 
Bank03_L8CFE:  LDA #$50
Bank03_L8D00:  STA $02
Bank03_L8D02:  TXA 
Bank03_L8D03:  JSR Adiv16
Bank03_L8D06:  AND #$01
Bank03_L8D08:  TAY 
Bank03_L8D09:  LDA $8D3A,Y
Bank03_L8D0C:  STA $03
Bank03_L8D0E:  LDA $030C,X
Bank03_L8D11:  STA $0B
Bank03_L8D13:  JSR MakeCartRAMPtr
Bank03_L8D16:  LDY #$00
Bank03_L8D18:  PLA 
Bank03_L8D19:  STA ($04),Y
Bank03_L8D1B:  TAX 
Bank03_L8D1C:  TYA 
Bank03_L8D1D:  CLC 
Bank03_L8D1E:  ADC #$20
Bank03_L8D20:  TAY 
Bank03_L8D21:  TXA 
Bank03_L8D22:  CPY #$C0
Bank03_L8D24:  BNE $8D19
Bank03_L8D26:  LDX PageIndex
Bank03_L8D28:  TXA 
Bank03_L8D29:  JSR Adiv8
Bank03_L8D2C:  AND #$06
Bank03_L8D2E:  TAY 
Bank03_L8D2F:  LDA $04
Bank03_L8D31:  STA $005C,Y
Bank03_L8D34:  LDA $05
Bank03_L8D36:  STA $005D,Y
Bank03_L8D39:  RTS

Bank03_L8D3A:  .byte $E8, $10, $60, $AD, $91, $69, $8D, $78, $68, $AD, $92, $69, $8D, $79, $68, $A9 
Bank03_L8D4A:  .byte $00, $85, $00, $85, $02, $AD, $97, $69, $29, $80, $F0, $06, $A5, $00, $09, $80
Bank03_L8D5A:  .byte $85, $00, $AD, $97, $69, $29

;------------------------------------------[ Graphics data ]-----------------------------------------

;Kraid hideout enemy tile patterns.
Bank03_L8D60:  .byte $03, $0F, $05, $32, $D1, $48, $12, $24, $01, $02, $02, $11, $48, $20, $00, $00
Bank03_L8D70:  .byte $E0, $F0, $EC, $DE, $92, $8D, $A0, $3C, $C0, $00, $0C, $02, $01, $0C, $02, $00
Bank03_L8D80:  .byte $00, $80, $58, $38, $70, $23, $83, $CD, $00, $00, $18, $3C, $7C, $38, $30, $00
Bank03_L8D90:  .byte $0E, $59, $B0, $60, $C0, $00, $00, $80, $0E, $59, $B7, $6C, $DE, $2F, $56, $28
Bank03_L8DA0:  .byte $00, $00, $00, $00, $00, $38, $48, $90, $00, $00, $00, $00, $00, $38, $7C, $FA
Bank03_L8DB0:  .byte $00, $01, $00, $03, $0C, $08, $10, $03, $00, $00, $00, $03, $0F, $0C, $58, $3F
Bank03_L8DC0:  .byte $48, $28, $AF, $3D, $78, $CD, $B6, $6F, $00, $07, $1C, $70, $4A, $01, $32, $00
Bank03_L8DD0:  .byte $00, $00, $B0, $E8, $74, $BC, $18, $18, $00, $50, $B0, $20, $00, $88, $88, $20
Bank03_L8DE0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_L8DF0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_L8E00:  .byte $00, $07, $0F, $0A, $00, $02, $00, $38, $00, $07, $0F, $1A, $18, $1F, $0F, $3B
Bank03_L8E10:  .byte $24, $18, $95, $95, $39, $31, $29, $24, $24, $1C, $9C, $D8, $F4, $EC, $B4, $38
Bank03_L8E20:  .byte $38, $7C, $D4, $C4, $78, $00, $00, $00, $38, $7C, $D6, $C6, $FE, $7C, $38, $00
Bank03_L8E30:  .byte $00, $00, $38, $7C, $D6, $44, $38, $00, $00, $00, $38, $7C, $D6, $C6, $FE, $7C
Bank03_L8E40:  .byte $81, $A5, $E7, $24, $00, $24, $18, $24, $81, $A5, $E7, $66, $66, $C3, $66, $18
Bank03_L8E50:  .byte $00, $24, $1B, $1F, $3B, $44, $5B, $3F, $BD, $9B, $E4, $C0, $C4, $98, $83, $C7
Bank03_L8E60:  .byte $00, $20, $60, $D1, $D4, $60, $20, $00, $02, $17, $1F, $1F, $1F, $1F, $17, $02
Bank03_L8E70:  .byte $00, $00, $00, $00, $60, $00, $00, $00, $80, $D0, $F4, $FE, $FE, $F4, $D0, $80
Bank03_L8E80:  .byte $76, $02, $02, $04, $38, $00, $00, $00, $00, $50, $00, $28, $00, $01, $02, $00
Bank03_L8E90:  .byte $C4, $CE, $7F, $7B, $79, $02, $02, $00, $10, $00, $80, $00, $00, $50, $A4, $00
Bank03_L8EA0:  .byte $60, $A0, $C2, $E7, $71, $46, $98, $20, $6E, $3C, $18, $08, $00, $50, $D0, $04
Bank03_L8EB0:  .byte $04, $30, $48, $00, $80, $11, $30, $21, $07, $32, $78, $7E, $F0, $C1, $5C, $3C
Bank03_L8EC0:  .byte $61, $32, $1E, $81, $F8, $FF, $FF, $F9, $00, $02, $00, $00, $D0, $00, $00, $08
Bank03_L8ED0:  .byte $FC, $FC, $7E, $36, $BE, $0C, $E0, $F8, $44, $2C, $12, $00, $20, $00, $20, $10
Bank03_L8EE0:  .byte $00, $80, $C2, $E7, $7F, $7F, $3E, $0C, $00, $00, $80, $C1, $43, $77, $3E, $0C
Bank03_L8EF0:  .byte $0E, $3C, $78, $70, $F0, $F8, $7C, $38, $0C, $38, $60, $60, $C0, $E0, $70, $38
Bank03_L8F00:  .byte $7C, $7C, $38, $10, $00, $00, $00, $00, $7C, $FE, $FE, $D6, $46, $3C, $00, $00
Bank03_L8F10:  .byte $28, $30, $E8, $E4, $14, $30, $28, $44, $34, $2C, $F4, $38, $1C, $3C, $2C, $44
Bank03_L8F20:  .byte $8C, $6C, $2F, $35, $4A, $91, $00, $3E, $88, $68, $2F, $7B, $75, $CE, $00, $00
Bank03_L8F30:  .byte $00, $17, $FC, $5E, $A2, $53, $00, $00, $38, $07, $E4, $BE, $5E, $E7, $00, $00
Bank03_L8F40:  .byte $00, $02, $0D, $17, $2D, $62, $6D, $2E, $83, $C5, $F2, $E0, $C2, $81, $8C, $CE
Bank03_L8F50:  .byte $00, $40, $B0, $E8, $B4, $46, $B6, $74, $C1, $A3, $4F, $07, $43, $81, $31, $73
Bank03_L8F60:  .byte $00, $00, $00, $00, $00, $20, $73, $DF, $00, $00, $02, $17, $1F, $14, $11, $18
Bank03_L8F70:  .byte $00, $00, $00, $00, $00, $00, $12, $C0, $00, $00, $80, $D0, $F4, $FE, $70, $00
Bank03_L8F80:  .byte $00, $00, $00, $00, $18, $3C, $3A, $17, $00, $00, $00, $00, $00, $10, $02, $07
Bank03_L8F90:  .byte $00, $00, $08, $00, $00, $81, $81, $DB, $00, $00, $24, $76, $6E, $76, $24, $00
Bank03_L8FA0:  .byte $00, $00, $00, $18, $3D, $3B, $10, $00, $00, $00, $00, $00, $11, $03, $00, $00
Bank03_L8FB0:  .byte $40, $82, $05, $23, $40, $03, $1E, $10, $78, $F0, $C0, $50, $30, $68, $3C, $5E
Bank03_L8FC0:  .byte $E3, $F0, $7E, $09, $05, $E8, $31, $9E, $20, $10, $02, $00, $06, $0C, $01, $00
Bank03_L8FD0:  .byte $F0, $E8, $1C, $9E, $42, $9A, $3C, $7E, $00, $00, $00, $02, $42, $C2, $80, $00
Bank03_L8FE0:  .byte $01, $03, $0D, $09, $13, $07, $03, $00, $38, $10, $10, $36, $24, $40, $00, $00
Bank03_L8FF0:  .byte $F8, $EE, $9F, $7F, $9F, $E0, $80, $00, $00, $0E, $00, $70, $10, $00, $00, $00
Bank03_L9000:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_L9010:  .byte $00, $00, $80, $80, $0C, $0E, $13, $10, $C0, $20, $90, $90, $3C, $E2, $D1, $90
Bank03_L9020:  .byte $F0, $38, $11, $01, $00, $00, $08, $08, $F3, $0C, $09, $09, $0C, $07, $0B, $09
Bank03_L9030:  .byte $00, $00, $01, $01, $30, $70, $C8, $08, $03, $04, $09, $09, $3C, $47, $8B, $09
Bank03_L9040:  .byte $26, $31, $10, $1C, $18, $0C, $00, $00, $C6, $C0, $60, $60, $20, $30, $18, $08
Bank03_L9050:  .byte $5E, $2C, $20, $3C, $24, $18, $00, $00, $87, $C3, $42, $42, $42, $66, $24, $24
Bank03_L9060:  .byte $00, $00, $00, $00, $0B, $27, $73, $DF, $02, $17, $1F, $34, $0B, $07, $11, $18
Bank03_L9070:  .byte $00, $00, $00, $00, $00, $8C, $F2, $E0, $80, $D0, $F4, $FE, $60, $80, $30, $00
Bank03_L9080:  .byte $18, $18, $98, $98, $64, $18, $7E, $E6, $18, $18, $18, $00, $00, $00, $00, $E6
Bank03_L9090:  .byte $BD, $DB, $18, $24, $3C, $66, $66, $24, $00, $00, $00, $42, $00, $00, $42, $24
Bank03_L90A0:  .byte $03, $1A, $3C, $38, $10, $08, $18, $18, $03, $02, $10, $00, $00, $08, $18, $18
Bank03_L90B0:  .byte $20, $01, $03, $07, $01, $03, $07, $02, $38, $10, $B0, $60, $7C, $28, $00, $00
Bank03_L90C0:  .byte $EF, $F7, $C5, $90, $FC, $FF, $3E, $E3, $00, $00, $00, $20, $0C, $03, $00, $E0
Bank03_L90D0:  .byte $FC, $F8, $F2, $C0, $01, $60, $90, $D0, $00, $00, $02, $0E, $01, $60, $F0, $10
Bank03_L90E0:  .byte $00, $00, $00, $F8, $00, $F8, $00, $00, $00, $00, $00, $F8, $07, $00, $00, $00
Bank03_L90F0:  .byte $7C, $F8, $10, $84, $3E, $7F, $19, $00, $60, $F0, $10, $00, $02, $07, $01, $00
Bank03_L9100:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_L9110:  .byte $0F, $1C, $88, $80, $00, $00, $10, $10, $CF, $30, $90, $90, $30, $E0, $D0, $90
Bank03_L9120:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank03_L9130:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank03_L9140:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_L9150:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

;Ridley hideout enemy tile patterns.
Bank03_L9160:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_L9170:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_L9180:  .byte $00, $00, $08, $31, $7A, $DA, $19, $FD, $00, $00, $00, $21, $5A, $DA, $99, $FD
Bank03_L9190:  .byte $8C, $9C, $BC, $78, $E0, $D8, $A2, $48, $8C, $98, $B0, $60, $C0, $9E, $3D, $77
Bank03_L91A0:  .byte $00, $00, $00, $40, $E0, $E0, $F0, $78, $00, $00, $00, $40, $E0, $C0, $40, $60
Bank03_L91B0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_L91C0:  .byte $18, $0C, $04, $02, $01, $0E, $18, $2C, $06, $02, $03, $01, $00, $00, $07, $13
Bank03_L91D0:  .byte $19, $00, $40, $18, $0C, $96, $56, $00, $DE, $6E, $DE, $C6, $E3, $61, $25, $B9
Bank03_L91E0:  .byte $00, $00, $00, $03, $2E, $2E, $12, $33, $3C, $7F, $FF, $FC, $D1, $50, $69, $0E
Bank03_L91F0:  .byte $00, $00, $00, $80, $40, $70, $7C, $35, $00, $00, $C0, $60, $B0, $68, $73, $B2
Bank03_L9200:  .byte $00, $05, $0C, $5F, $34, $19, $33, $BE, $00, $05, $0C, $5F, $34, $19, $31, $B6
Bank03_L9210:  .byte $40, $20, $B4, $48, $DA, $66, $63, $03, $40, $20, $B4, $48, $9A, $66, $4B, $11
Bank03_L9220:  .byte $00, $09, $02, $1A, $3D, $6F, $55, $2A, $00, $09, $02, $1A, $3D, $6F, $55, $2E
Bank03_L9230:  .byte $40, $40, $20, $E8, $A4, $9C, $D6, $CA, $40, $40, $20, $E8, $A4, $1C, $96, $CA
Bank03_L9240:  .byte $80, $C1, $63, $78, $3E, $3E, $1E, $0E, $80, $40, $20, $18, $04, $00, $00, $00
Bank03_L9250:  .byte $5A, $DB, $DB, $FF, $7E, $18, $81, $81, $50, $00, $00, $00, $00, $00, $00, $24
Bank03_L9260:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_L9270:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_L9280:  .byte $F2, $64, $0F, $DA, $8D, $5B, $10, $10, $FB, $70, $01, $C0, $8D, $58, $10, $10
Bank03_L9290:  .byte $90, $40, $20, $80, $B0, $70, $5C, $60, $EF, $3E, $18, $80, $00, $10, $5C, $60
Bank03_L92A0:  .byte $B8, $38, $30, $80, $80, $60, $20, $18, $A0, $A4, $66, $C6, $3E, $0C, $20, $18
Bank03_L92B0:  .byte $30, $27, $2D, $38, $2A, $5E, $70, $40, $10, $00, $01, $00, $12, $20, $00, $00
Bank03_L92C0:  .byte $0A, $40, $40, $51, $78, $C4, $C2, $90, $31, $3D, $3B, $2C, $06, $3B, $3D, $6F
Bank03_L92D0:  .byte $00, $08, $10, $80, $42, $00, $2E, $5A, $F9, $B1, $40, $60, $3E, $0E, $82, $92
Bank03_L92E0:  .byte $00, $00, $00, $00, $00, $0C, $0E, $0C, $00, $00, $00, $0C, $1E, $13, $15, $16
Bank03_L92F0:  .byte $00, $01, $01, $00, $00, $08, $04, $12, $00, $00, $00, $06, $0F, $07, $03, $09
Bank03_L9300:  .byte $5D, $23, $54, $2B, $24, $1E, $0F, $04, $5D, $23, $55, $2B, $20, $1C, $0F, $04
Bank03_L9310:  .byte $01, $A7, $06, $0B, $4A, $D6, $2C, $F0, $59, $F1, $52, $FB, $6A, $D6, $2C, $F0
Bank03_L9320:  .byte $EC, $F5, $7C, $99, $42, $60, $38, $0F, $CE, $D5, $70, $9D, $47, $68, $38, $0F
Bank03_L9330:  .byte $AF, $73, $36, $26, $0C, $1C, $78, $C0, $AF, $73, $76, $A6, $4C, $1C, $78, $C0
Bank03_L9340:  .byte $69, $2C, $0E, $77, $D4, $B4, $E2, $00, $03, $01, $00, $70, $F0, $F0, $E0, $00
Bank03_L9350:  .byte $69, $2C, $0E, $37, $14, $04, $02, $00, $03, $01, $00, $30, $10, $00, $00, $00
Bank03_L9360:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_L9370:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_L9380:  .byte $00, $00, $00, $00, $10, $20, $00, $00, $00, $00, $18, $3C, $3C, $FE, $7D, $FF
Bank03_L9390:  .byte $81, $42, $24, $24, $3C, $7E, $C3, $A5, $00, $00, $00, $00, $00, $00, $00, $24
Bank03_L93A0:  .byte $00, $00, $00, $00, $10, $20, $00, $00, $00, $00, $18, $3C, $3F, $FF, $7C, $FE
Bank03_L93B0:  .byte $00, $00, $80, $00, $00, $08, $04, $82, $00, $00, $00, $86, $8F, $87, $83, $41
Bank03_L93C0:  .byte $D1, $E4, $88, $00, $00, $30, $88, $70, $2E, $18, $73, $FF, $7F, $8F, $47, $8F
Bank03_L93D0:  .byte $80, $00, $00, $20, $00, $10, $30, $70, $00, $00, $C0, $C0, $F0, $E0, $C0, $80
Bank03_L93E0:  .byte $0C, $0C, $0C, $18, $18, $10, $10, $00, $30, $34, $3C, $28, $38, $30, $30, $20
Bank03_L93F0:  .byte $01, $05, $1D, $20, $01, $00, $00, $00, $3C, $38, $20, $40, $40, $40, $40, $80
Bank03_L9400:  .byte $00, $03, $1C, $90, $80, $80, $40, $20, $FF, $FC, $E0, $60, $78, $7C, $3C, $1E
Bank03_L9410:  .byte $20, $C0, $00, $00, $00, $00, $00, $00, $C0, $00, $00, $00, $00, $00, $00, $00
Bank03_L9420:  .byte $38, $4C, $86, $36, $7E, $7E, $6C, $38, $00, $08, $04, $14, $3C, $38, $00, $00
Bank03_L9430:  .byte $9E, $7F, $3F, $07, $4E, $3D, $03, $0A, $F0, $68, $30, $3C, $5A, $3F, $07, $0B
Bank03_L9440:  .byte $12, $04, $2F, $2F, $3F, $3F, $5F, $2F, $13, $0F, $3D, $3E, $34, $78, $70, $68
Bank03_L9450:  .byte $00, $80, $60, $F0, $E8, $F8, $F0, $FC, $C0, $70, $98, $0C, $14, $06, $0E, $02
Bank03_L9460:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_L9470:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_L9480:  .byte $00, $18, $20, $00, $00, $00, $00, $00, $64, $C0, $1C, $78, $3C, $12, $22, $20
Bank03_L9490:  .byte $E7, $5A, $3C, $5A, $81, $81, $42, $00, $66, $42, $00, $00, $00, $00, $00, $00
Bank03_L94A0:  .byte $00, $00, $00, $00, $10, $20, $00, $00, $01, $03, $1B, $3E, $3C, $FE, $7C, $FE
Bank03_L94B0:  .byte $41, $21, $10, $04, $00, $00, $00, $00, $20, $1C, $0E, $03, $00, $00, $00, $00
Bank03_L94C0:  .byte $00, $00, $00, $00, $00, $01, $3E, $00, $FF, $FC, $F8, $73, $7F, $7E, $00, $00
Bank03_L94D0:  .byte $00, $00, $00, $00, $08, $97, $59, $08, $E0, $00, $00, $EC, $F6, $73, $39, $08
Bank03_L94E0:  .byte $00, $00, $01, $07, $0F, $0D, $1B, $10, $00, $01, $06, $09, $15, $1F, $2B, $30
Bank03_L94F0:  .byte $00, $40, $E0, $D8, $D8, $BC, $3E, $0C, $60, $B0, $D8, $E4, $F6, $FB, $39, $0A
Bank03_L9500:  .byte $30, $26, $08, $18, $33, $06, $00, $00, $0E, $19, $13, $1B, $32, $06, $00, $00
Bank03_L9510:  .byte $04, $02, $31, $5B, $7B, $7E, $3E, $18, $00, $00, $00, $1A, $3A, $1C, $00, $00
Bank03_L9520:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank03_L9530:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank03_L9540:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_L9550:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

;----------------------------------------------------------------------------------------------------

.checkpc PalPntrTbl
.advance PalPntrTbl

.scope
Bank03_L9560:  .word _Palette00         ;($A718)
Bank03_L9562:  .word _Palette01         ;($A73C)
Bank03_L9564:  .word _Palette02         ;($A748)
Bank03_L9566:  .word _Palette03         ;($A742)
Bank03_L9568:  .word _Palette04         ;($A74E)
Bank03_L956A:  .word _Palette05         ;($A754)
Bank03_L956C:  .word _Palette05         ;($A754)
Bank03_L956E:  .word _Palette06         ;($A759)
Bank03_L9570:  .word _Palette07         ;($A75E)
Bank03_L9572:  .word _Palette08         ;($A773)
Bank03_L9574:  .word _Palette09         ;($A788)
Bank03_L9576:  .word _Palette0A         ;($A78D)
Bank03_L9578:  .word _Palette0A         ;($A78D)
Bank03_L957A:  .word _Palette0A         ;($A78D)
Bank03_L957C:  .word _Palette0A         ;($A78D)
Bank03_L957E:  .word _Palette0A         ;($A78D)
Bank03_L9580:  .word _Palette0A         ;($A78D)
Bank03_L9582:  .word _Palette0A         ;($A78D)
Bank03_L9584:  .word _Palette0A         ;($A78D)
Bank03_L9586:  .word _Palette0A         ;($A78D)
Bank03_L9588:  .word _Palette0B         ;($A794)
Bank03_L958A:  .word _Palette0C         ;($A79B)
Bank03_L958C:  .word _Palette0D         ;($A7A2)
Bank03_L958E:  .word _Palette0E         ;($A7A9)
Bank03_L9590:  .word _Palette0F         ;($A7B1)
Bank03_L9592:  .word _Palette10         ;($A7B9)
Bank03_L9594:  .word _Palette11         ;($A7C1)
Bank03_L9596:  .word _Palette12         ;($A7C9)

.checkpc SpecItmsTblPtr
.advance SpecItmsTblPtr

Bank03_L9598:  .word _SpecItmsTbl       ;($A83B)Beginning of special items table.
Bank03_L959A:  .word _RmPtrTbl          ;($A7D1)Beginning of room pointer table.
Bank03_L959C:  .word _StrctPtrTbl       ;($A7FB)Beginning of structure pointer table.
Bank03_L959E:  .word _MacroDefs         ;($AE49)Beginning of macro definitions.
Bank03_L95A0:  .word _EnemyFramePtrTbl1     ;($A42C)Address table into enemy animation data. Two-->
Bank03_L95A2:  .word _EnemyFramePtrTbl2     ;($A52C)tables needed to accommodate all entries.
Bank03_L95A4:  .word _EnemyPlacePtrTbl      ;($A540)Pointers to enemy frame placement data.
Bank03_L95A6:  .word _EnemyAnimIndexTbl     ;($A406)Index to values in addr tables for enemy animations.

Bank03_L95A8:  JMP $A320 
Bank03_L95AB:  JMP $A315
Bank03_L95AE:  JMP $9C6F
Bank03_L95B1:  JMP $9CE6
Bank03_L95B4:  JMP $9D21
Bank03_L95B7:  JMP $9D3D
Bank03_L95BA:  JMP $9D6C
Bank03_L95BD:  JMP $A0C6
Bank03_L95C0:  JMP $A142

.checkpc AreaRoutine
.advance AreaRoutine
Bank03_L95C3:  JMP $9B25           ;Area specific routine.

TwosCompliment_:
Bank03_L95C6:  EOR #$FF            ;
Bank03_L95C8:  CLC             ;The following routine returns the twos-->
Bank03_L95C9:  ADC #$01            ;compliment of the value stored in A.
Bank03_L95CB:  RTS             ;

Bank03_L95CC:  .byte $FF           ;Not used.

Bank03_L95CD:  .byte $40           ;Tourian music init flag.

Bank03_L95CE:  .byte $00           ;Base damage caused by area enemies to lower health byte.
Bank03_L95CF:  .byte $03           ;Base damage caused by area enemies to upper health byte.

;Special room numbers(used to start item room music).
Bank03_L95D0:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF

Bank03_L95D7:  .byte $03           ;Samus start x coord on world map.
Bank03_L95D8:  .byte $04           ;Samus start y coord on world map.
Bank03_L95D9:  .byte $6E           ;Samus start verticle screen position.

Bank03_L95DA:  .byte $06, $00, $03, $21, $00, $00, $00, $00, $00, $10, $00

Bank03_L95E5:  LDA $6B02,X
Bank03_L95E8:  JSR $8024

Bank03_L95EB:  .word $97F9
Bank03_L95ED:  .word $97F9
Bank03_L95EF:  .word $9A27
Bank03_L95F1:  .word $97DC
Bank03_L95F3:  .word $9A2C
Bank03_L95F5:  .word $97DC
Bank03_L95F7:  .word $97DC
Bank03_L95F9:  .word $97DC
Bank03_L95FB:  .word $97DC
Bank03_L95FD:  .word $97DC
Bank03_L95FF:  .word $97DC
Bank03_L9601:  .word $97DC
Bank03_L9603:  .word $97DC
Bank03_L9605:  .word $97DC
Bank03_L9607:  .word $97DC
Bank03_L9609:  .word $97DC


Bank03_L960B:  .byte $08, $08, $08, $08, $16, $16, $18, $18, $1F, $1F, $00, $00, $00, $00, $00, $00

Bank03_L961B:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Bank03_L962B:  .byte $FF, $FF, $01, $FF, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Bank03_L963B:  .byte $05, $05, $05, $05, $16, $16, $18, $18, $1B, $1B, $00, $00, $00, $00, $00, $00

Bank03_L964B:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Bank03_L965B:  .byte $05, $05, $05, $05, $16, $16, $18, $18, $1D, $1D, $00, $00, $00, $00, $00, $00

Bank03_L966B:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Bank03_L967B:  .byte $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Bank03_L968B:  .byte $FE, $FE, $00, $00, $C0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Bank03_L969B:  .byte $01, $01, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Bank03_L96AB:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Bank03_L96BB:  .byte $01, $01, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Bank03_L96CB:  .byte $00, $02, $00, $00, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Bank03_L96DB:  .word $97D5, $97D5, $97D5, $97D5, $97D5, $97D5, $97D5, $97D5
Bank03_L96EB:  .word $97D5, $97D5, $97D5, $97D5, $97D5, $97D5, $97D5, $97D5
Bank03_L96FB:  .word $97D5, $97D5, $97D5, $97D5, $97D5, $97D5, $97D5, $97D5
Bank03_L970B:  .word $97D5, $97D5, $97D5, $97D5, $97D5, $97D5, $97D5, $97D5
Bank03_L971B:  .word $97D5, $97D5, $97D5, $97D5

Bank03_L9723:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $18, $30, $00, $C0, $D0, $00, $00, $7F
Bank03_L9733:  .byte $80, $58, $54, $70, $00, $00, $00, $00, $00, $00, $00, $00, $18, $30, $00, $00
Bank03_L9743:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_L9753:  .byte $00, $00, $00, $04, $02, $00, $00, $00, $0C, $FC, $FC, $00, $00, $00, $00, $00
Bank03_L9763:  .byte $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $02, $02, $02, $02
Bank03_L9773:  .byte $00, $00, $00, $00, $00, $00, $00, $00

Bank03_L977B:  .byte $50, $50, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Bank03_L978B:  .byte $00, $00, $26, $26, $26, $26, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_L979B:  .byte $0C, $F4, $00, $00, $00, $00, $00, $00, $F4, $00, $00, $00

Bank03_L97A7:  .word $97D5, $97D5, $97D8, $97DB, $A32B, $A330, $A337, $A348
Bank03_L97B7:  .word $A359, $A36A, $A37B, $A388, $A391, $A3A2, $A3B3, $A3C4
Bank03_L97C7:  .word $A3D5, $A3DE, $A3E7, $A3F0, $A3F9

Bank03_L97D1:  .byte $00, $00, $00, $01

Bank03_L97D5:  .byte $50, $22, $FF

Bank03_L97D8:  .byte $50, $30, $FF

Bank03_L97DB:  .byte $FF

Bank03_L97DC:  LDA #$00
Bank03_L97DE:  STA $6AF4,X
Bank03_L97E1:  RTS

Bank03_L97E2:  LDA $81
Bank03_L97E4:  CMP #$01
Bank03_L97E6:  BEQ $97F1
Bank03_L97E8:  CMP #$03
Bank03_L97EA:  BEQ $97F6
Bank03_L97EC:  LDA $00
Bank03_L97EE:  JMP $8000
Bank03_L97F1:  LDA $01
Bank03_L97F3:  JMP $8003
Bank03_L97F6:  JMP $8006
Bank03_L97F9:  LDY $010B
Bank03_L97FC:  INY 
Bank03_L97FD:  BEQ $9804
Bank03_L97FF:  LDA #$00
Bank03_L9801:  STA $6AF4,X
Bank03_L9804:  LDA #$0F
Bank03_L9806:  STA $00
Bank03_L9808:  STA $01
Bank03_L980A:  LDA $0405,X
Bank03_L980D:  ASL 
Bank03_L980E:  BMI $97E2
Bank03_L9810:  LDA $6AF4,X
Bank03_L9813:  CMP #$03
Bank03_L9815:  BEQ $97E2
Bank03_L9817:  JSR $99B7
Bank03_L981A:  LDA $77F8,Y
Bank03_L981D:  BEQ $9822
Bank03_L981F:  JMP $9899
Bank03_L9822:  LDY $0408,X
Bank03_L9825:  LDA $77F6,Y
Bank03_L9828:  PHA 
Bank03_L9829:  LDA $0402,X
Bank03_L982C:  BPL $983B
Bank03_L982E:  PLA 
Bank03_L982F:  JSR $95C6
Bank03_L9832:  PHA 
Bank03_L9833:  LDA #$00
Bank03_L9835:  CMP $0406,X
Bank03_L9838:  SBC $0402,X
Bank03_L983B:  CMP $77F6,Y
Bank03_L983E:  PLA 
Bank03_L983F:  BCC $9849
Bank03_L9841:  STA $0402,X
Bank03_L9844:  LDA #$00
Bank03_L9846:  STA $0406,X
Bank03_L9849:  LDA $77F6,Y
Bank03_L984C:  PHA 
Bank03_L984D:  LDA $0403,X
Bank03_L9850:  BPL $985F
Bank03_L9852:  PLA 
Bank03_L9853:  JSR $95C6
Bank03_L9856:  PHA 
Bank03_L9857:  LDA #$00
Bank03_L9859:  CMP $0407,X
Bank03_L985C:  SBC $0403,X
Bank03_L985F:  CMP $77F6,Y
Bank03_L9862:  PLA 
Bank03_L9863:  BCC $986D
Bank03_L9865:  STA $0403,X
Bank03_L9868:  LDA #$00
Bank03_L986A:  STA $0407,X
Bank03_L986D:  LDA $0405,X
Bank03_L9870:  PHA 
Bank03_L9871:  JSR $9A06
Bank03_L9874:  STA $6AFF,X
Bank03_L9877:  PLA 
Bank03_L9878:  LSR 
Bank03_L9879:  LSR 
Bank03_L987A:  JSR $9A06
Bank03_L987D:  STA $6AFE,X
Bank03_L9880:  LDA $6AF4,X
Bank03_L9883:  CMP #$04
Bank03_L9885:  BNE $9894
Bank03_L9887:  LDY $040B,X
Bank03_L988A:  INY 
Bank03_L988B:  BNE $9899
Bank03_L988D:  LDA #$05
Bank03_L988F:  STA $040B,X
Bank03_L9892:  BNE $9899
Bank03_L9894:  LDA #$FF
Bank03_L9896:  STA $040B,X
Bank03_L9899:  LDA $81
Bank03_L989B:  CMP #$06
Bank03_L989D:  BNE $98A9
Bank03_L989F:  CMP $6AF4,X
Bank03_L98A2:  BEQ $98A9
Bank03_L98A4:  LDA #$04
Bank03_L98A6:  STA $6AF4,X
Bank03_L98A9:  LDA $0404,X
Bank03_L98AC:  AND #$20
Bank03_L98AE:  BEQ $990F
Bank03_L98B0:  JSR $99B7
Bank03_L98B3:  LDA $77F8,Y
Bank03_L98B6:  BEQ $98EF
Bank03_L98B8:  LDA $040E,X
Bank03_L98BB:  CMP #$07
Bank03_L98BD:  BEQ $98C3
Bank03_L98BF:  CMP #$0A
Bank03_L98C1:  BNE $9932
Bank03_L98C3:  LDA $2D
Bank03_L98C5:  AND #$02
Bank03_L98C7:  BNE $9932
Bank03_L98C9:  LDA $77F8,Y
Bank03_L98CC:  CLC 
Bank03_L98CD:  ADC #$10
Bank03_L98CF:  STA $77F8,Y
Bank03_L98D2:  AND #$70
Bank03_L98D4:  CMP #$50
Bank03_L98D6:  BNE $9932
Bank03_L98D8:  LDA #$02
Bank03_L98DA:  ORA $040F,X
Bank03_L98DD:  STA $040C,X
Bank03_L98E0:  LDA #$06
Bank03_L98E2:  STA $6AF4,X
Bank03_L98E5:  LDA #$20
Bank03_L98E7:  STA $040F,X
Bank03_L98EA:  LDA #$01
Bank03_L98EC:  STA $040D,X
Bank03_L98EF:  LDA #$00
Bank03_L98F1:  STA $0404,X
Bank03_L98F4:  STA $77F8,Y
Bank03_L98F7:  STA $0406,X
Bank03_L98FA:  STA $0407,X
Bank03_L98FD:  LDA $6AFE,X
Bank03_L9900:  JSR $9A10
Bank03_L9903:  STA $0402,X
Bank03_L9906:  LDA $6AFF,X
Bank03_L9909:  JSR $9A10
Bank03_L990C:  STA $0403,X
Bank03_L990F:  JSR $99B7
Bank03_L9912:  LDA $77F8,Y
Bank03_L9915:  BNE $9932
Bank03_L9917:  LDA $0404,X
Bank03_L991A:  AND #$04
Bank03_L991C:  BEQ $9964
Bank03_L991E:  LDA $0403,X
Bank03_L9921:  AND #$80
Bank03_L9923:  ORA #$01
Bank03_L9925:  TAY 
Bank03_L9926:  JSR $99C3
Bank03_L9929:  JSR $99BD
Bank03_L992C:  TYA 
Bank03_L992D:  STA $77F8,X
Bank03_L9930:  TXA 
Bank03_L9931:  TAY 
Bank03_L9932:  TYA 
Bank03_L9933:  TAX 
Bank03_L9934:  LDA $77F8,X
Bank03_L9937:  PHP 
Bank03_L9938:  AND #$0F
Bank03_L993A:  CMP #$0C
Bank03_L993C:  BEQ $9941
Bank03_L993E:  INC $77F8,X
Bank03_L9941:  TAY 
Bank03_L9942:  LDA $99D7,Y
Bank03_L9945:  STA $04
Bank03_L9947:  STY $05
Bank03_L9949:  LDA #$0C
Bank03_L994B:  SEC 
Bank03_L994C:  SBC $05
Bank03_L994E:  LDX $4B
Bank03_L9950:  PLP 
Bank03_L9951:  BMI $9956
Bank03_L9953:  JSR $95C6
Bank03_L9956:  STA $05
Bank03_L9958:  JSR $99E4
Bank03_L995B:  JSR $8027
Bank03_L995E:  JSR $99F4
Bank03_L9961:  JMP $9967
Bank03_L9964:  JSR $99AE
Bank03_L9967:  LDA $6AF4,X
Bank03_L996A:  CMP #$03
Bank03_L996C:  BNE $9971
Bank03_L996E:  JSR $99AE
Bank03_L9971:  LDY #$00
Bank03_L9973:  LDA $77F8
Bank03_L9976:  ORA $77F9
Bank03_L9979:  ORA $77FA
Bank03_L997C:  ORA $77FB
Bank03_L997F:  ORA $77FC
Bank03_L9982:  ORA $77FD
Bank03_L9985:  AND #$0C
Bank03_L9987:  CMP #$0C
Bank03_L9989:  BNE $999E
Bank03_L998B:  LDA $0106
Bank03_L998E:  ORA $0107
Bank03_L9991:  BEQ $999E
Bank03_L9993:  STY $6F
Bank03_L9995:  LDY #$04
Bank03_L9997:  STY $6E
Bank03_L9999:  JSR $8042
Bank03_L999C:  LDY #$01
Bank03_L999E:  STY $92
Bank03_L99A0:  LDA $6B
Bank03_L99A2:  BMI $99AB
Bank03_L99A4:  LDA $6B02,X
Bank03_L99A7:  ORA #$A2
Bank03_L99A9:  STA $6B
Bank03_L99AB:  JMP $97E2
Bank03_L99AE:  JSR $99B7
Bank03_L99B1:  LDA #$00
Bank03_L99B3:  STA $77F8,Y
Bank03_L99B6:  RTS

Bank03_L99B7:  TXA 
Bank03_L99B8:  JSR $9B1B
Bank03_L99BB:  TAY 
Bank03_L99BC:  RTS 
Bank03_L99BD:  TXA 
Bank03_L99BE:  JSR $9B1B
Bank03_L99C1:  TAX 
Bank03_L99C2:  RTS

Bank03_L99C3:  LDA #$00
Bank03_L99C5:  STA $0402,X
Bank03_L99C8:  STA $0403,X
Bank03_L99CB:  STA $0407,X
Bank03_L99CE:  STA $0406,X
Bank03_L99D1:  STA $6AFF,X
Bank03_L99D4:  STA $6AFE,X
Bank03_L99D7:  RTS

Bank03_L99D8:  .byte $00, $FC, $F9, $F7, $F6, $F6, $F5, $F5, $F5, $F6, $F6, $F8
 
Bank03_L99E4:  LDA $030E
Bank03_L99E7:  STA $09
Bank03_L99E9:  LDA $030D
Bank03_L99EC:  STA $08
Bank03_L99EE:  LDA $030C
Bank03_L99F1:  STA $0B
Bank03_L99F3:  RTS

Bank03_L99F4:  LDA $09
Bank03_L99F6:  STA $0401,X
Bank03_L99F9:  LDA $08
Bank03_L99FB:  STA $0400,X
Bank03_L99FE:  LDA $0B
Bank03_L9A00:  AND #$01
Bank03_L9A02:  STA $6AFB,X
Bank03_L9A05:  RTS

Bank03_L9A06:  LSR 
Bank03_L9A07:  LDA $0408,X
Bank03_L9A0A:  ROL 
Bank03_L9A0B:  TAY 
Bank03_L9A0C:  LDA $77F2,Y
Bank03_L9A0F:  RTS

Bank03_L9A10:  ASL 
Bank03_L9A11:  ROL 
Bank03_L9A12:  AND #$01
Bank03_L9A14:  TAY 
Bank03_L9A15:  LDA $77F0,Y
Bank03_L9A18:  RTS

Bank03_L9A19:  .byte $F8, $08, $30, $D0, $60, $A0, $02, $04, $00, $00, $00, $00, $00, $00

Bank03_L9A27:  LDA #$01
Bank03_L9A29:  JMP $8003
Bank03_L9A2C:  LDY $6AF4,X
Bank03_L9A2F:  CPY #$02
Bank03_L9A31:  BNE $9AB0
Bank03_L9A33:  DEY 
Bank03_L9A34:  CPY $81
Bank03_L9A36:  BNE $9AB0
Bank03_L9A38:  LDA #$00
Bank03_L9A3A:  JSR $99D1
Bank03_L9A3D:  STA $6AFC,X
Bank03_L9A40:  STA $6AFD,X
Bank03_L9A43:  LDA $030E
Bank03_L9A46:  SEC 
Bank03_L9A47:  SBC $0401,X
Bank03_L9A4A:  STA $01
Bank03_L9A4C:  LDA $0405,X
Bank03_L9A4F:  PHA 
Bank03_L9A50:  LSR 
Bank03_L9A51:  PHA 
Bank03_L9A52:  BCC $9A5A
Bank03_L9A54:  LDA #$00
Bank03_L9A56:  SBC $01
Bank03_L9A58:  STA $01
Bank03_L9A5A:  LDA $030D
Bank03_L9A5D:  SEC 
Bank03_L9A5E:  SBC $0400,X
Bank03_L9A61:  STA $00
Bank03_L9A63:  PLA 
Bank03_L9A64:  LSR 
Bank03_L9A65:  LSR 
Bank03_L9A66:  BCC $9A6E
Bank03_L9A68:  LDA #$00
Bank03_L9A6A:  SBC $00
Bank03_L9A6C:  STA $00
Bank03_L9A6E:  LDA $00
Bank03_L9A70:  ORA $01
Bank03_L9A72:  LDY #$03
Bank03_L9A74:  ASL 
Bank03_L9A75:  BCS $9A7A
Bank03_L9A77:  DEY 
Bank03_L9A78:  BNE $9A74
Bank03_L9A7A:  DEY 
Bank03_L9A7B:  BMI $9A83
Bank03_L9A7D:  LSR $00
Bank03_L9A7F:  LSR $01
Bank03_L9A81:  BPL $9A7A
Bank03_L9A83:  JSR $9AF9
Bank03_L9A86:  PLA 
Bank03_L9A87:  LSR 
Bank03_L9A88:  PHA 
Bank03_L9A89:  BCC $9A9B
Bank03_L9A8B:  LDA #$00
Bank03_L9A8D:  SBC $0407,X
Bank03_L9A90:  STA $0407,X
Bank03_L9A93:  LDA #$00
Bank03_L9A95:  SBC $0403,X
Bank03_L9A98:  STA $0403,X
Bank03_L9A9B:  PLA 
Bank03_L9A9C:  LSR 
Bank03_L9A9D:  LSR 
Bank03_L9A9E:  BCC $9AB0
Bank03_L9AA0:  LDA #$00
Bank03_L9AA2:  SBC $0406,X
Bank03_L9AA5:  STA $0406,X
Bank03_L9AA8:  LDA #$00
Bank03_L9AAA:  SBC $0402,X
Bank03_L9AAD:  STA $0402,X
Bank03_L9AB0:  LDA $0405,X
Bank03_L9AB3:  ASL 
Bank03_L9AB4:  BMI $9AF4
Bank03_L9AB6:  LDA $0406,X
Bank03_L9AB9:  CLC 
Bank03_L9ABA:  ADC $6AFC,X
Bank03_L9ABD:  STA $6AFC,X
Bank03_L9AC0:  LDA $0402,X
Bank03_L9AC3:  ADC #$00
Bank03_L9AC5:  STA $04
Bank03_L9AC7:  LDA $0407,X
Bank03_L9ACA:  CLC 
Bank03_L9ACB:  ADC $6AFD,X
Bank03_L9ACE:  STA $6AFD,X
Bank03_L9AD1:  LDA $0403,X
Bank03_L9AD4:  ADC #$00
Bank03_L9AD6:  STA $05
Bank03_L9AD8:  LDA $0400,X
Bank03_L9ADB:  STA $08
Bank03_L9ADD:  LDA $0401,X
Bank03_L9AE0:  STA $09
Bank03_L9AE2:  LDA $6AFB,X
Bank03_L9AE5:  STA $0B
Bank03_L9AE7:  JSR $8027
Bank03_L9AEA:  BCS $9AF1
Bank03_L9AEC:  LDA #$00
Bank03_L9AEE:  STA $6AF4,X
Bank03_L9AF1:  JSR $99F4
Bank03_L9AF4:  LDA #$08
Bank03_L9AF6:  JMP $8003
Bank03_L9AF9:  LDA $00
Bank03_L9AFB:  PHA 
Bank03_L9AFC:  JSR $9B1B
Bank03_L9AFF:  STA $0402,X
Bank03_L9B02:  PLA 
Bank03_L9B03:  JSR $9B20
Bank03_L9B06:  STA $0406,X
Bank03_L9B09:  LDA $01
Bank03_L9B0B:  PHA 
Bank03_L9B0C:  JSR $9B1B
Bank03_L9B0F:  STA $0403,X
Bank03_L9B12:  PLA 
Bank03_L9B13:  JSR $9B20
Bank03_L9B16:  STA $0407,X
Bank03_L9B19:  RTS

Bank03_L9B1A:  LSR 
Bank03_L9B1B:  LSR 
Bank03_L9B1C:  LSR 
Bank03_L9B1D:  LSR 
Bank03_L9B1E:  LSR 
Bank03_L9B1F:  RTS

Bank03_L9B20:  ASL 
Bank03_L9B21:  ASL 
Bank03_L9B22:  ASL 
Bank03_L9B23:  ASL 
Bank03_L9B24:  RTS

Bank03_L9B25:  JSR $9B37
Bank03_L9B28:  JSR $9DD4
Bank03_L9B2B:  JSR $A1E7
Bank03_L9B2E:  JSR $A238
Bank03_L9B31:  JSR $A28B
Bank03_L9B34:  JMP $A15E
Bank03_L9B37:  LDX #$78
Bank03_L9B39:  JSR $9B44
Bank03_L9B3C:  LDA $97
Bank03_L9B3E:  SEC 
Bank03_L9B3F:  SBC #$08
Bank03_L9B41:  TAX 
Bank03_L9B42:  BNE $9B39
Bank03_L9B44:  STX $97
Bank03_L9B46:  LDY $6BF4,X
Bank03_L9B49:  BNE $9B4C
Bank03_L9B4B:  RTS

Bank03_L9B4C:  JSR $9C4D
Bank03_L9B4F:  TYA 
Bank03_L9B50:  BNE $9B4B
Bank03_L9B52:  LDY $010B
Bank03_L9B55:  INY 
Bank03_L9B56:  BNE $9B65
Bank03_L9B58:  LDA $6BF8,X
Bank03_L9B5B:  CMP #$05
Bank03_L9B5D:  BEQ $9B4B
Bank03_L9B5F:  JSR $9B70
Bank03_L9B62:  JMP $9C2B
Bank03_L9B65:  LDA $2D
Bank03_L9B67:  AND #$02
Bank03_L9B69:  BNE $9B4B
Bank03_L9B6B:  LDA #$19
Bank03_L9B6D:  JMP $9C31
Bank03_L9B70:  LDY $6BF8,X
Bank03_L9B73:  LDA $6BFA,X
Bank03_L9B76:  BNE $9B81
Bank03_L9B78:  LDA $9D8F,Y
Bank03_L9B7B:  STA $6BFA,X
Bank03_L9B7E:  INC $6BFB,X
Bank03_L9B81:  DEC $6BFA,X
Bank03_L9B84:  LDA $9D94,Y
Bank03_L9B87:  CLC 
Bank03_L9B88:  ADC $6BFB,X
Bank03_L9B8B:  TAY 
Bank03_L9B8C:  LDA $9D99,Y
Bank03_L9B8F:  BPL $9BAB
Bank03_L9B91:  CMP #$FF
Bank03_L9B93:  BNE $9B9F
Bank03_L9B95:  LDY $6BF8,X
Bank03_L9B98:  LDA #$00
Bank03_L9B9A:  STA $6BFB,X
Bank03_L9B9D:  BEQ $9B84
Bank03_L9B9F:  INC $6BFB,X
Bank03_L9BA2:  JSR $9BAF
Bank03_L9BA5:  LDY $6BF8,X
Bank03_L9BA8:  JMP $9B84
Bank03_L9BAB:  STA $6BF9,X
Bank03_L9BAE:  RTS

Bank03_L9BAF:  PHA 
Bank03_L9BB0:  LDA MthrBrainStatus
Bank03_L9BB2:  CMP #$04
Bank03_L9BB4:  BCS $9BC6
Bank03_L9BB6:  LDY #$60
Bank03_L9BB8:  LDA $6AF4,Y
Bank03_L9BBB:  BEQ $9BC8
Bank03_L9BBD:  TYA 
Bank03_L9BBE:  CLC 
Bank03_L9BBF:  ADC #$10
Bank03_L9BC1:  TAY 
Bank03_L9BC2:  CMP #$A0
Bank03_L9BC4:  BNE $9BB8
Bank03_L9BC6:  PLA 
Bank03_L9BC7:  RTS

Bank03_L9BC8:  STY $4B
Bank03_L9BCA:  LDA $6BF5,X
Bank03_L9BCD:  STA $0400,Y
Bank03_L9BD0:  LDA $6BF6,X
Bank03_L9BD3:  STA $0401,Y
Bank03_L9BD6:  LDA $6BF7,X
Bank03_L9BD9:  STA $6AFB,Y
Bank03_L9BDC:  LDA #$02
Bank03_L9BDE:  STA $6AF4,Y
Bank03_L9BE1:  LDA #$00
Bank03_L9BE3:  STA $0409,Y
Bank03_L9BE6:  STA $6AF8,Y
Bank03_L9BE9:  STA $0408,Y
Bank03_L9BEC:  PLA 
Bank03_L9BED:  JSR $95C6
Bank03_L9BF0:  TAX 
Bank03_L9BF1:  STA $040A,Y
Bank03_L9BF4:  ORA #$02
Bank03_L9BF6:  STA $0405,Y
Bank03_L9BF9:  LDA $9C26,X
Bank03_L9BFC:  STA $6AF9,Y
Bank03_L9BFF:  STA $6AFA,Y
Bank03_L9C02:  LDA $9DCC,X
Bank03_L9C05:  STA $05
Bank03_L9C07:  LDA $9DCF,X
Bank03_L9C0A:  STA $04
Bank03_L9C0C:  LDX $97
Bank03_L9C0E:  LDA $6BF5,X
Bank03_L9C11:  STA $08
Bank03_L9C13:  LDA $6BF6,X
Bank03_L9C16:  STA $09
Bank03_L9C18:  LDA $6BF7,X
Bank03_L9C1B:  STA $0B
Bank03_L9C1D:  TYA 
Bank03_L9C1E:  TAX 
Bank03_L9C1F:  JSR $8027
Bank03_L9C22:  JSR $99F4
Bank03_L9C25:  LDX $97
Bank03_L9C27:  RTS

Bank03_L9C28:  .byte $0C, $0A, $0E

Bank03_L9c2B:  LDY $6BF9,X
Bank03_L9C2E:  LDA $9DC6,Y
Bank03_L9C31:  STA $6BD7
Bank03_L9C34:  LDA $6BF5,X
Bank03_L9C37:  STA $04E0
Bank03_L9C3A:  LDA $6BF6,X
Bank03_L9C3D:  STA $04E1
Bank03_L9C40:  LDA $6BF7,X
Bank03_L9C43:  STA $6BDB
Bank03_L9C46:  LDA #$E0
Bank03_L9C48:  STA $4B
Bank03_L9C4A:  JMP $803C
Bank03_L9C4D:  LDY #$00
Bank03_L9C4F:  LDA $6BF6,X
Bank03_L9C52:  CMP $FD
Bank03_L9C54:  LDA $49
Bank03_L9C56:  AND #$02
Bank03_L9C58:  BNE $9C5F
Bank03_L9C5A:  LDA $6BF5,X
Bank03_L9C5D:  CMP $FC
Bank03_L9C5F:  LDA $6BF7,X
Bank03_L9C62:  EOR $FF
Bank03_L9C64:  AND #$01
Bank03_L9C66:  BEQ $9C6B
Bank03_L9C68:  BCS $9C6D
Bank03_L9C6A:  SEC 
Bank03_L9C6B:  BCS $9C6E
Bank03_L9C6D:  INY 
Bank03_L9C6E:  RTS

Bank03_L9C6F:  STY $02
Bank03_L9C71:  LDY #$00
Bank03_L9C73:  LDA $6BF7,Y
Bank03_L9C76:  EOR $02
Bank03_L9C78:  LSR 
Bank03_L9C79:  BCS $9C80
Bank03_L9C7B:  LDA #$00
Bank03_L9C7D:  STA $6BF4,Y
Bank03_L9C80:  TYA 
Bank03_L9C81:  CLC 
Bank03_L9C82:  ADC #$08
Bank03_L9C84:  TAY 
Bank03_L9C85:  BPL $9C73
Bank03_L9C87:  LDX #$00
Bank03_L9C89:  LDA $0758,X
Bank03_L9C8C:  BEQ $9C99
Bank03_L9C8E:  JSR $9D64
Bank03_L9C91:  EOR $075A,X
Bank03_L9C94:  BNE $9C99
Bank03_L9C96:  STA $0758,X
Bank03_L9C99:  TXA 
Bank03_L9C9A:  CLC 
Bank03_L9C9B:  ADC #$08
Bank03_L9C9D:  TAX 
Bank03_L9C9E:  CMP #$28
Bank03_L9CA0:  BNE $9C89
Bank03_L9CA2:  LDX #$00
Bank03_L9CA4:  JSR $9CD6
Bank03_L9CA7:  LDX #$03
Bank03_L9CA9:  JSR $9CD6
Bank03_L9CAC:  LDA MthrBrainStatus
Bank03_L9CAE:  BEQ $9CC3
Bank03_L9CB0:  CMP #$07
Bank03_L9CB2:  BEQ $9CC3
Bank03_L9CB4:  CMP #$0A
Bank03_L9CB6:  BEQ $9CC3
Bank03_L9CB8:  LDA $9D
Bank03_L9CBA:  EOR $02
Bank03_L9CBC:  LSR 
Bank03_L9CBD:  BCS $9CC3
Bank03_L9CBF:  LDA #$00
Bank03_L9CC1:  STA MthrBrainStatus
Bank03_L9CC3:  LDA $010D
Bank03_L9CC6:  BEQ $9CD5
Bank03_L9CC8:  LDA $010C
Bank03_L9CCB:  EOR $02
Bank03_L9CCD:  LSR 
Bank03_L9CCE:  BCS $9CD5
Bank03_L9CD0:  LDA #$00
Bank03_L9CD2:  STA $010D
Bank03_L9CD5:  RTS

Bank03_L9CD6:  LDA $8B,X
Bank03_L9CD8:  BMI $9CE5
Bank03_L9CDA:  LDA $8C,X
Bank03_L9CDC:  EOR $02
Bank03_L9CDE:  LSR 
Bank03_L9CDF:  BCS $9CE5
Bank03_L9CE1:  LDA #$FF
Bank03_L9CE3:  STA $8B,X
Bank03_L9CE5:  RTS

Bank03_L9CE6:  LDX #$00
Bank03_L9CE8:  LDA $6BF4,X
Bank03_L9CEB:  BEQ $9CF6
Bank03_L9CED:  TXA 
Bank03_L9CEE:  CLC 
Bank03_L9CEF:  ADC #$08
Bank03_L9CF1:  TAX 
Bank03_L9CF2:  BPL $9CE8
Bank03_L9CF4:  BMI $9D20
Bank03_L9CF6:  LDA ($00),Y
Bank03_L9CF8:  JSR $9B1B
Bank03_L9CFB:  STA $6BF8,X
Bank03_L9CFE:  LDA #$01
Bank03_L9D00:  STA $6BF4,X
Bank03_L9D03:  STA $6BFB,X
Bank03_L9D06:  INY 
Bank03_L9D07:  LDA ($00),Y
Bank03_L9D09:  PHA 
Bank03_L9D0A:  AND #$F0
Bank03_L9D0C:  ORA #$07
Bank03_L9D0E:  STA $6BF5,X
Bank03_L9D11:  PLA 
Bank03_L9D12:  JSR $9B20
Bank03_L9D15:  ORA #$07
Bank03_L9D17:  STA $6BF6,X
Bank03_L9D1A:  JSR $9D88
Bank03_L9D1D:  STA $6BF7,X
Bank03_L9D20:  RTS
 
Bank03_L9D21:  LDA #$01
Bank03_L9D23:  STA MthrBrainStatus
Bank03_L9D25:  JSR $9D88
Bank03_L9D28:  STA $9D
Bank03_L9D2A:  EOR #$01
Bank03_L9D2C:  TAX 
Bank03_L9D2D:  LDA $9D3C
Bank03_L9D30:  ORA $6C,X
Bank03_L9D32:  STA $6C,X
Bank03_L9D34:  LDA #$20
Bank03_L9D36:  STA $9A
Bank03_L9D38:  STA $9B
Bank03_L9D3A:  RTS 

Bank03_L9D3B:  .byte $02, $01 

Bank03_L9D3D:  LDA ($00),Y
Bank03_L9D3F:  AND #$F0
Bank03_L9D41:  LSR
Bank03_L9D42:  TAX 
Bank03_L9D43:  ASL 
Bank03_L9D44:  AND #$10
Bank03_L9D46:  EOR #$10
Bank03_L9D48:  ORA #$84
Bank03_L9D4A:  STA $0759,X
Bank03_L9D4D:  JSR $9D64
Bank03_L9D50:  STA $075A,X
Bank03_L9D53:  LDA #$01
Bank03_L9D55:  STA $0758,X
Bank03_L9D58:  LDA #$00
Bank03_L9D5A:  STA $075B,X
Bank03_L9D5D:  STA $075C,X
Bank03_L9D60:  STA $075D,X
Bank03_L9D63:  RTS

Bank03_L9D64:  JSR $9D88
Bank03_L9D67:  ASL 
Bank03_L9D68:  ASL 
Bank03_L9D69:  ORA #$61
Bank03_L9D6B:  RTS

Bank03_L9D6C:  LDX #$03
Bank03_L9D6E:  JSR $9D75
Bank03_L9D71:  BMI $9D87
Bank03_L9D73:  LDX #$00
Bank03_L9D75:  LDA $8B,X
Bank03_L9D77:  BPL $9D87
Bank03_L9D79:  LDA ($00),Y
Bank03_L9D7B:  JSR $9B1B
Bank03_L9D7E:  STA $8B,X
Bank03_L9D80:  JSR $9D88
Bank03_L9D83:  STA $8C,X
Bank03_L9D85:  LDA #$FF
Bank03_L9D87:  RTS

Bank03_L9D88:  LDA $FF
Bank03_L9D8A:  EOR $49
Bank03_L9D8C:  AND #$01
Bank03_L9D8E:  RTS

Bank03_L9D8F:  .byte $28, $28, $28, $28, $28, $00, $0B, $16, $21, $27, $00, $01, $02, $FD, $03, $04
Bank03_L9D9F:  .byte $FD, $03, $02, $01, $FF, $00, $07, $06, $FE, $05, $04, $FE, $05, $06, $07, $FF
Bank03_L9DAF:  .byte $02, $03, $FC, $04, $05, $06, $05, $FC, $04, $03, $FF, $02, $03, $FC, $04, $03
Bank03_L9DBF:  .byte $FF, $06, $05, $FC, $04, $05, $FF, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $09

Bank03_L9DCF:  .byte $F7, $00, $09, $09, $0B, $A5, $98, $F0, $19, $20, $24, $80, $CB, $95, $22, $9E
Bank03_L9DDF:  .byte $36, $9E, $52, $9E, $86, $9E, $02, $9F, $49, $9F, $C0, $9F, $02, $9F, $DA, $9F
Bank03_L9DEF:  .byte $CB, $95, $60

Bank03_L9DF2:  LDA $030C
Bank03_L9DF5:  EOR $9D
Bank03_L9DF7:  BNE $9DF1
Bank03_L9DF9:  LDA $030E
Bank03_L9DFC:  SEC 
Bank03_L9DFD:  SBC #$48
Bank03_L9DFF:  CMP #$2F
Bank03_L9E01:  BCS $9DF1
Bank03_L9E03:  LDA $030D
Bank03_L9E06:  SEC 
Bank03_L9E07:  SBC #$80
Bank03_L9E09:  BPL $9E0E
Bank03_L9E0B:  JSR $95C6
Bank03_L9E0E:  CMP #$20
Bank03_L9E10:  BCS $9DF1
Bank03_L9E12:  LDA #$00
Bank03_L9E14:  STA $6E
Bank03_L9E16:  LDA #$02
Bank03_L9E18:  STA $6F
Bank03_L9E1A:  LDA #$38
Bank03_L9E1C:  STA $030A
Bank03_L9E1F:  JMP $8042
Bank03_L9E22:  JSR $9DF2
Bank03_L9E25:  JSR $9FED
Bank03_L9E28:  JSR $A01B
Bank03_L9E2B:  JSR $A02E
Bank03_L9E2E:  JSR $A041
Bank03_L9E31:  LDA #$00
Bank03_L9E33:  STA $9E
Bank03_L9E35:  RTS

Bank03_L9E36:  JSR $9E43
Bank03_L9E39:  LDA $9E41,Y
Bank03_L9E3C:  STA $1C
Bank03_L9E3E:  JMP $9E31

Bank03_L9E41:  .byte $08, $07

Bank03_L9E43:  DEC $9F
Bank03_L9E45:  BNE $9E4B
Bank03_L9E47:  LDA #$01
Bank03_L9E49:  STA MthrBrainStatus
Bank03_L9E4B:  LDA $9F
Bank03_L9E4D:  AND #$02
Bank03_L9E4F:  LSR 
Bank03_L9E50:  TAY 
Bank03_L9E51:  RTS

Bank03_L9E52:  JSR $9E43
Bank03_L9E55:  LDA $9E41,Y
Bank03_L9E58:  STA $1C
Bank03_L9E5A:  TYA 
Bank03_L9E5B:  ASL 
Bank03_L9E5C:  ASL 
Bank03_L9E5D:  STA $FC
Bank03_L9E5F:  LDY MthrBrainStatus
Bank03_L9E61:  DEY 
Bank03_L9E62:  BNE $9E83
Bank03_L9E64:  STY MotherBrainHits
Bank03_L9E66:  TYA 
Bank03_L9E67:  TAX 
Bank03_L9E68:  TYA 
Bank03_L9E69:  STA $6AF4,X
Bank03_L9E6C:  JSR $9EF9
Bank03_L9E6F:  CPX #$C0
Bank03_L9E71:  BNE $9E68
Bank03_L9E73:  LDA #$04
Bank03_L9E75:  STA MthrBrainStatus
Bank03_L9E77:  LDA #$28
Bank03_L9E79:  STA $9F
Bank03_L9E7B:  LDA $0680
Bank03_L9E7E:  ORA #$01
Bank03_L9E80:  STA $0680
Bank03_L9E83:  JMP $9E2E
Bank03_L9E86:  LDA #$10
Bank03_L9E88:  ORA $0680
Bank03_L9E8B:  STA $0680
Bank03_L9E8E:  JSR $A072
Bank03_L9E91:  INC $9A
Bank03_L9E93:  JSR $9E43
Bank03_L9E96:  LDX #$00
Bank03_L9E98:  LDA $6AF4,X
Bank03_L9E9B:  CMP #$05
Bank03_L9E9D:  BNE $9EA4
Bank03_L9E9F:  LDA #$00
Bank03_L9EA1:  STA $6AF4,X
Bank03_L9EA4:  JSR $9EF9
Bank03_L9EA7:  CMP #$40
Bank03_L9EA9:  BNE $9E98
Bank03_L9EAB:  LDA $07A0
Bank03_L9EAE:  BNE $9EB5
Bank03_L9EB0:  LDA $9F00,Y
Bank03_L9EB3:  STA $1C
Bank03_L9EB5:  LDY MthrBrainStatus
Bank03_L9EB7:  DEY 
Bank03_L9EB8:  BNE $9ED5
Bank03_L9EBA:  STY $9A
Bank03_L9EBC:  LDA #$04
Bank03_L9EBE:  STA MthrBrainStatus
Bank03_L9EC0:  LDA #$1C
Bank03_L9EC2:  STA $9F
Bank03_L9EC4:  LDY MotherBrainHits
Bank03_L9EC6:  INC MotherBrainHits
Bank03_L9EC8:  CPY #$04
Bank03_L9ECA:  BEQ $9ED3
Bank03_L9ECC:  LDX #$00
Bank03_L9ECE:  BCC $9ED5
Bank03_L9ED0:  JMP $9ED6
Bank03_L9ED3:  LSR $9F
Bank03_L9ED5:  RTS

Bank03_L9ED6:  LDA $0685
Bank03_L9ED9:  ORA #$04
Bank03_L9EDB:  STA $0685
Bank03_L9EDE:  LDA #$05
Bank03_L9EE0:  STA MthrBrainStatus
Bank03_L9EE2:  LDA #$80
Bank03_L9EE4:  STA MotherBrainHits
Bank03_L9EE6:  RTS

Bank03_L9EE7:  PHA 
Bank03_L9EE8:  AND #$F0
Bank03_L9EEA:  ORA #$07
Bank03_L9EEC:  STA $0400,X
Bank03_L9EEF:  PLA 
Bank03_L9EF0:  JSR $9B20
Bank03_L9EF3:  ORA #$07
Bank03_L9EF5:  STA $0401,X
Bank03_L9EF8:  RTS

Bank03_L9EF9:  TXA 
Bank03_L9EFA:  CLC 
Bank03_L9EFB:  ADC #$10
Bank03_L9EFD:  TAX 
Bank03_L9EFE:  RTS

Bank03_L9EFF:  .byte $60

Bank03_L9F00:  ORA #$0A
Bank03_L9F02:  LDA MotherBrainHits
Bank03_L9F04:  BMI $9F33
Bank03_L9F06:  CMP #$08
Bank03_L9F08:  BEQ $9F36
Bank03_L9F0A:  TAY 
Bank03_L9F0B:  LDA $9F41,Y
Bank03_L9F0E:  STA $0503
Bank03_L9F11:  LDA $9F39,Y
Bank03_L9F14:  CLC 
Bank03_L9F15:  ADC #$42
Bank03_L9F17:  STA $0508
Bank03_L9F1A:  PHP 
Bank03_L9F1B:  LDA $9D
Bank03_L9F1D:  ASL 
Bank03_L9F1E:  ASL 
Bank03_L9F1F:  PLP 
Bank03_L9F20:  ADC #$61
Bank03_L9F22:  STA $0509
Bank03_L9F25:  LDA #$00
Bank03_L9F27:  STA $4B
Bank03_L9F29:  LDA $07A0
Bank03_L9F2C:  BNE $9F38
Bank03_L9F2E:  JSR $803F
Bank03_L9F31:  BCS $9F38
Bank03_L9F33:  INC MotherBrainHits
Bank03_L9F35:  RTS

Bank03_L9F36:  INC MthrBrainStatus
Bank03_L9F38:  RTS

Bank03_L9F39:  .byte $00, $40, $08, $48, $80, $C0, $88, $C8, $08, $02, $09, $03, $0A, $04, $0B

Bank03_L9F48:  ORA $20
Bank03_L9F4A:  ADC #$9F
Bank03_L9F4C:  BCS $9F64
Bank03_L9F4E:  LDA #$00
Bank03_L9F50:  STA MthrBrainStatus
Bank03_L9F52:  LDA #$99
Bank03_L9F54:  STA $010A
Bank03_L9F57:  STA $010B
Bank03_L9F5A:  LDA #$01
Bank03_L9F5C:  STA $010D
Bank03_L9F5F:  LDA $9D
Bank03_L9F61:  STA $010C
Bank03_L9F64:  RTS 

Bank03_L9F65:  .byte $80, $B0, $A0, $90

Bank03_L9F69:  LDA $50 
Bank03_L9F6B:  CLC
Bank03_L9F6C:  ADC $4F
Bank03_L9F6E:  SEC 
Bank03_L9F6F:  ROL 
Bank03_L9F70:  AND #$03
Bank03_L9F72:  TAY 
Bank03_L9F73:  LDX $9F65,Y
Bank03_L9F76:  LDA #$01
Bank03_L9F78:  STA $030F,X
Bank03_L9F7B:  LDA #$01
Bank03_L9F7D:  STA $0307,X
Bank03_L9F80:  LDA #$03
Bank03_L9F82:  STA $0300,X
Bank03_L9F85:  LDA $9D
Bank03_L9F87:  STA $030C,X
Bank03_L9F8A:  LDA #$10
Bank03_L9F8C:  STA $030E,X
Bank03_L9F8F:  LDA #$68
Bank03_L9F91:  STA $030D,X
Bank03_L9F94:  LDA #$55
Bank03_L9F96:  STA $0305,X
Bank03_L9F99:  STA $0306,X
Bank03_L9F9C:  LDA #$00
Bank03_L9F9E:  STA $0304,X
Bank03_L9FA1:  LDA #$F7
Bank03_L9FA3:  STA $0303,X
Bank03_L9FA6:  LDA #$10
Bank03_L9FA8:  STA $0503
Bank03_L9FAB:  LDA #$40
Bank03_L9FAD:  STA $0508
Bank03_L9FB0:  LDA $9D
Bank03_L9FB2:  ASL 
Bank03_L9FB3:  ASL 
Bank03_L9FB4:  ORA #$61
Bank03_L9FB6:  STA $0509
Bank03_L9FB9:  LDA #$00
Bank03_L9FBB:  STA $4B
Bank03_L9FBD:  JMP $803F
Bank03_L9FC0:  LDA #$10
Bank03_L9FC2:  ORA $0680
Bank03_L9FC5:  STA $0680
Bank03_L9FC8:  LDA $2C
Bank03_L9FCA:  BNE $9FD9
Bank03_L9FCC:  LDA #$08
Bank03_L9FCE:  STA $0300
Bank03_L9FD1:  LDA #$0A
Bank03_L9FD3:  STA MthrBrainStatus
Bank03_L9FD5:  LDA #$01
Bank03_L9FD7:  STA $1C
Bank03_L9FD9:  RTS

Bank03_L9FDA:  JSR $9F69
Bank03_L9FDD:  BCS $9FEC
Bank03_L9FDF:  LDA $9D
Bank03_L9FE1:  STA $010C
Bank03_L9FE4:  LDY #$01
Bank03_L9FE6:  STY $010D
Bank03_L9FE9:  DEY 
Bank03_L9FEA:  STY MthrBrainStatus
Bank03_L9FEC:  RTS

Bank03_L9FED:  LDA $9E
Bank03_L9FEF:  BEQ $A01A
Bank03_L9FF1:  LDA $0684
Bank03_L9FF4:  ORA #$02
Bank03_L9FF6:  STA $0684
Bank03_L9FF9:  INC MotherBrainHits
Bank03_L9FFB:  LDA MotherBrainHits
Bank03_L9FFD:  CMP #$20
Bank03_L9FFF:  LDY #$02
Bank03_LA001:  LDA #$10
Bank03_LA003:  BCC $A016
Bank03_LA005:  LDX #$00
Bank03_LA007:  LDA #$00
Bank03_LA009:  STA $0500,X
Bank03_LA00C:  JSR $9EF9
Bank03_LA00F:  CMP #$D0
Bank03_LA011:  BNE $A007
Bank03_LA013:  INY 
Bank03_LA014:  LDA #$80
Bank03_LA016:  STY MthrBrainStatus
Bank03_LA018:  STA $9F
Bank03_LA01A:  RTS

Bank03_LA01B:  DEC $9A
Bank03_LA01D:  BNE $A02D
Bank03_LA01F:  LDA $2E
Bank03_LA021:  AND #$03
Bank03_LA023:  STA $9C
Bank03_LA025:  LDA #$20
Bank03_LA027:  SEC 
Bank03_LA028:  SBC MotherBrainHits
Bank03_LA02A:  LSR 
Bank03_LA02B:  STA $9A
Bank03_LA02D:  RTS

Bank03_LA02E:  DEC $9B
Bank03_LA030:  LDA $9B
Bank03_LA032:  ASL 
Bank03_LA033:  BNE $A040
Bank03_LA035:  LDA #$20
Bank03_LA037:  SEC 
Bank03_LA038:  SBC MotherBrainHits
Bank03_LA03A:  ORA #$80
Bank03_LA03C:  EOR $9B
Bank03_LA03E:  STA $9B
Bank03_LA040:  RTS

Bank03_LA041:  LDA #$E0
Bank03_LA043:  STA $4B
Bank03_LA045:  LDA $9D
Bank03_LA047:  STA $6BDB
Bank03_LA04A:  LDA #$70
Bank03_LA04C:  STA $04E0
Bank03_LA04F:  LDA #$48
Bank03_LA051:  STA $04E1
Bank03_LA054:  LDY $9C
Bank03_LA056:  LDA $A06D,Y
Bank03_LA059:  STA $6BD7
Bank03_LA05C:  JSR $803C
Bank03_LA05F:  LDA $9B
Bank03_LA061:  BMI $A06C
Bank03_LA063:  LDA $A071
Bank03_LA066:  STA $6BD7
Bank03_LA069:  JSR $803C
Bank03_LA06C:  RTS

Bank03_LA06D:  .byte $13, $14, $15, $16, $17

Bank03_LA072:  LDY MotherBrainHits
Bank03_LA074:  BEQ $A086
Bank03_LA076:  LDA $A0C0,Y
Bank03_LA079:  CLC 
Bank03_LA07A:  ADC $9A
Bank03_LA07C:  TAY 
Bank03_LA07D:  LDA $A0A3,Y
Bank03_LA080:  CMP #$FF
Bank03_LA082:  BNE $A087
Bank03_LA084:  DEC $9A
Bank03_LA086:  RTS

Bank03_LA087:  ADC #$44
Bank03_LA089:  STA $0508
Bank03_LA08C:  PHP 
Bank03_LA08D:  LDA $9D
Bank03_LA08F:  ASL 
Bank03_LA090:  ASL 
Bank03_LA091:  ORA #$61
Bank03_LA093:  PLP 
Bank03_LA094:  ADC #$00
Bank03_LA096:  STA $0509
Bank03_LA099:  LDA #$00
Bank03_LA09B:  STA $0503
Bank03_LA09E:  STA $4B
Bank03_LA0A0:  JMP $803F

Bank03_LA0A3:  .byte $00, $02, $04, $06, $08, $40, $80, $C0, $48, $88, $C8, $FF, $42, $81, $C1, $27
Bank03_LA0B3:  .byte $FF, $82, $43, $25, $47, $FF, $C2, $C4, $C6, $FF, $84, $45, $86, $FF, $00, $0C
Bank03_LA0C3:  .byte $11, $16, $1A

Bank03_LA0C6:  LDA $71
Bank03_LA0C8:  BEQ $A13E
Bank03_LA0CA:  LDX $4B
Bank03_LA0CC:  LDA $0300,X
Bank03_LA0CF:  CMP #$0B
Bank03_LA0D1:  BNE $A13E
Bank03_LA0D3:  CPY #$98
Bank03_LA0D5:  BNE $A103
Bank03_LA0D7:  LDX #$00
Bank03_LA0D9:  LDA $0500,X
Bank03_LA0DC:  BEQ $A0E7
Bank03_LA0DE:  JSR $9EF9
Bank03_LA0E1:  CMP #$D0
Bank03_LA0E3:  BNE $A0D9
Bank03_LA0E5:  BEQ $A13E
Bank03_LA0E7:  LDA #$8C
Bank03_LA0E9:  STA $0508,X
Bank03_LA0EC:  LDA $05
Bank03_LA0EE:  STA $0509,X
Bank03_LA0F1:  LDA #$01
Bank03_LA0F3:  STA $0503,X
Bank03_LA0F6:  LDA $4B
Bank03_LA0F8:  PHA 
Bank03_LA0F9:  STX $4B
Bank03_LA0FB:  JSR $803F
Bank03_LA0FE:  PLA 
Bank03_LA0FF:  STA $4B
Bank03_LA101:  BNE $A13E
Bank03_LA103:  LDA $04
Bank03_LA105:  LSR 
Bank03_LA106:  BCC $A10A
Bank03_LA108:  DEC $04
Bank03_LA10A:  LDY #$00
Bank03_LA10C:  LDA ($04),Y
Bank03_LA10E:  LSR 
Bank03_LA10F:  BCS $A13E
Bank03_LA111:  CMP #$48
Bank03_LA113:  BCC $A13E
Bank03_LA115:  CMP #$4C
Bank03_LA117:  BCS $A13E
Bank03_LA119:  LDA $0758,Y
Bank03_LA11C:  BEQ $A12E
Bank03_LA11E:  LDA $04
Bank03_LA120:  AND #$9E
Bank03_LA122:  CMP $0759,Y
Bank03_LA125:  BNE $A12E
Bank03_LA127:  LDA $05
Bank03_LA129:  CMP $075A,Y
Bank03_LA12C:  BEQ $A139
Bank03_LA12E:  TYA 
Bank03_LA12F:  CLC 
Bank03_LA130:  ADC #$08
Bank03_LA132:  TAY 
Bank03_LA133:  CMP #$28
Bank03_LA135:  BNE $A119
Bank03_LA137:  BEQ $A13E
Bank03_LA139:  LDA #$01
Bank03_LA13B:  STA $075D,Y
Bank03_LA13E:  PLA 
Bank03_LA13F:  PLA 
Bank03_LA140:  CLC 
Bank03_LA141:  RTS

Bank03_LA142:  TAY 
Bank03_LA143:  LDA $71
Bank03_LA145:  BEQ $A15C
Bank03_LA147:  LDX $4B
Bank03_LA149:  LDA $0300,X
Bank03_LA14C:  CMP #$0B
Bank03_LA14E:  BNE $A15C
Bank03_LA150:  CPY #$5E
Bank03_LA152:  BCC $A15C
Bank03_LA154:  CPY #$72
Bank03_LA156:  BCS $A15C
Bank03_LA158:  LDA #$01
Bank03_LA15A:  STA $9E
Bank03_LA15C:  TYA 
Bank03_LA15D:  RTS

Bank03_LA15E:  LDY $010B
Bank03_LA161:  INY 
Bank03_LA162:  BNE $A1DA
Bank03_LA164:  LDY #$03
Bank03_LA166:  JSR $A16B
Bank03_LA169:  LDY #$00
Bank03_LA16B:  STY $4B
Bank03_LA16D:  LDA $008B,Y
Bank03_LA170:  BMI $A15D
Bank03_LA172:  LDA $008C,Y
Bank03_LA175:  EOR $2D
Bank03_LA177:  LSR 
Bank03_LA178:  BCC $A15D
Bank03_LA17A:  LDA MthrBrainStatus
Bank03_LA17C:  CMP #$04
Bank03_LA17E:  BCS $A15D
Bank03_LA180:  LDA $2D
Bank03_LA182:  AND #$06
Bank03_LA184:  BNE $A15D
Bank03_LA186:  LDX #$20
Bank03_LA188:  LDA $6AF4,X
Bank03_LA18B:  BEQ $A19C
Bank03_LA18D:  LDA $0405,X
Bank03_LA190:  AND #$02
Bank03_LA192:  BEQ $A19C
Bank03_LA194:  TXA 
Bank03_LA195:  SEC 
Bank03_LA196:  SBC #$10
Bank03_LA198:  TAX 
Bank03_LA199:  BPL $A188
Bank03_LA19B:  RTS

Bank03_LA19C:  LDA #$01
Bank03_LA19E:  STA $6AF4,X
Bank03_LA1A1:  LDA #$04
Bank03_LA1A3:  STA $6B02,X
Bank03_LA1A6:  LDA #$00
Bank03_LA1A8:  STA $040F,X
Bank03_LA1AB:  STA $0404,X
Bank03_LA1AE:  JSR $802A
Bank03_LA1B1:  LDA #$F7
Bank03_LA1B3:  STA $6AF7,X
Bank03_LA1B6:  LDY $4B
Bank03_LA1B8:  LDA $008C,Y
Bank03_LA1BB:  STA $6AFB,X
Bank03_LA1BE:  LDA $008D,Y
Bank03_LA1C1:  ASL 
Bank03_LA1C2:  ORA $008B,Y
Bank03_LA1C5:  TAY 
Bank03_LA1C6:  LDA $A1DB,Y
Bank03_LA1C9:  JSR $9EE7
Bank03_LA1CC:  LDX $4B
Bank03_LA1CE:  INC $8D,X
Bank03_LA1D0:  LDA $8D,X
Bank03_LA1D2:  CMP #$06
Bank03_LA1D4:  BNE $A1DA
Bank03_LA1D6:  LDA #$00
Bank03_LA1D8:  STA $8D,X
Bank03_LA1DA:  RTS

Bank03_LA1DB:  .byte $22, $2A, $2A, $BA, $B2, $2A, $C4, $2A, $C8, $BA, $BA, $BA

Bank03_LA1E7:  LDY $010B
Bank03_LA1EA:  INY 
Bank03_LA1EB:  BEQ $A237
Bank03_LA1ED:  LDA $010A
Bank03_LA1F0:  STA $03
Bank03_LA1F2:  LDA #$01
Bank03_LA1F4:  SEC 
Bank03_LA1F5:  JSR $8045
Bank03_LA1F8:  STA $010A
Bank03_LA1FB:  LDA $010B
Bank03_LA1FE:  STA $03
Bank03_LA200:  LDA #$00
Bank03_LA202:  JSR $8045
Bank03_LA205:  STA $010B
Bank03_LA208:  LDA $2D
Bank03_LA20A:  AND #$1F
Bank03_LA20C:  BNE $A216
Bank03_LA20E:  LDA $0681
Bank03_LA211:  ORA #$08
Bank03_LA213:  STA $0681
Bank03_LA216:  LDA $010A
Bank03_LA219:  ORA $010B
Bank03_LA21C:  BNE $A237
Bank03_LA21E:  DEC $010B
Bank03_LA221:  STA MotherBrainHits
Bank03_LA223:  LDA #$07
Bank03_LA225:  STA MthrBrainStatus
Bank03_LA227:  LDA $0680
Bank03_LA22A:  ORA #$01
Bank03_LA22C:  STA $0680
Bank03_LA22F:  LDA #$0C
Bank03_LA231:  STA $2C
Bank03_LA233:  LDA #$0B
Bank03_LA235:  STA $1C
Bank03_LA237:  RTS

Bank03_LA238:  LDA $010D
Bank03_LA23B:  BEQ $A28A
Bank03_LA23D:  LDA $010C
Bank03_LA240:  STA $6BDB
Bank03_LA243:  LDA #$84
Bank03_LA245:  STA $04E0
Bank03_LA248:  LDA #$64
Bank03_LA24A:  STA $04E1
Bank03_LA24D:  LDA #$1A
Bank03_LA24F:  STA $6BD7
Bank03_LA252:  LDA #$E0
Bank03_LA254:  STA $4B
Bank03_LA256:  LDA $5B
Bank03_LA258:  PHA 
Bank03_LA259:  JSR $803C
Bank03_LA25C:  PLA 
Bank03_LA25D:  CMP $5B
Bank03_LA25F:  BEQ $A28A
Bank03_LA261:  TAX 
Bank03_LA262:  LDA $010B
Bank03_LA265:  LSR 
Bank03_LA266:  LSR 
Bank03_LA267:  LSR 
Bank03_LA268:  SEC 
Bank03_LA269:  ROR 
Bank03_LA26A:  AND #$0F
Bank03_LA26C:  ORA #$A0
Bank03_LA26E:  STA $0201,X
Bank03_LA271:  LDA $010B
Bank03_LA274:  AND #$0F
Bank03_LA276:  ORA #$A0
Bank03_LA278:  STA $0205,X
Bank03_LA27B:  LDA $010A
Bank03_LA27E:  LSR 
Bank03_LA27F:  LSR 
Bank03_LA280:  LSR 
Bank03_LA281:  SEC 
Bank03_LA282:  ROR 
Bank03_LA283:  AND #$0F
Bank03_LA285:  ORA #$A0
Bank03_LA287:  STA $0209,X
Bank03_LA28A:  RTS

Bank03_LA28B:  LDA #$10
Bank03_LA28D:  STA $4B
Bank03_LA28F:  LDX #$20
Bank03_LA291:  JSR $A29B
Bank03_LA294:  TXA 
Bank03_LA295:  SEC 
Bank03_LA296:  SBC #$08
Bank03_LA298:  TAX 
Bank03_LA299:  BNE $A291
Bank03_LA29B:  LDA $0758,X
Bank03_LA29E:  AND #$0F
Bank03_LA2A0:  CMP #$01
Bank03_LA2A2:  BNE $A28A
Bank03_LA2A4:  LDA $075D,X
Bank03_LA2A7:  BEQ $A2F2
Bank03_LA2A9:  INC $075B,X
Bank03_LA2AC:  LDA $075B,X
Bank03_LA2AF:  LSR 
Bank03_LA2B0:  BCS $A2F2
Bank03_LA2B2:  TAY 
Bank03_LA2B3:  SBC #$03
Bank03_LA2B5:  BNE $A2BA
Bank03_LA2B7:  INC $0758,X
Bank03_LA2BA:  LDA $A310,Y
Bank03_LA2BD:  STA $0513
Bank03_LA2C0:  LDA $0759,X
Bank03_LA2C3:  STA $0518
Bank03_LA2C6:  LDA $075A,X
Bank03_LA2C9:  STA $0519
Bank03_LA2CC:  LDA $07A0
Bank03_LA2CF:  BNE $A2DA
Bank03_LA2D1:  TXA 
Bank03_LA2D2:  PHA 
Bank03_LA2D3:  JSR $803F
Bank03_LA2D6:  PLA 
Bank03_LA2D7:  TAX 
Bank03_LA2D8:  BCC $A2EB
Bank03_LA2DA:  LDA $0758,X
Bank03_LA2DD:  AND #$80
Bank03_LA2DF:  ORA #$01
Bank03_LA2E1:  STA $0758,X
Bank03_LA2E4:  STA $075D,X
Bank03_LA2E7:  DEC $075B,X
Bank03_LA2EA:  RTS

Bank03_LA2EB:  LDA #$40
Bank03_LA2ED:  STA $075C,X
Bank03_LA2F0:  BNE $A30A
Bank03_LA2F2:  LDY $075B,X
Bank03_LA2F5:  BEQ $A30A
Bank03_LA2F7:  DEC $075C,X
Bank03_LA2FA:  BNE $A30A
Bank03_LA2FC:  LDA #$40
Bank03_LA2FE:  STA $075C,X
Bank03_LA301:  DEY 
Bank03_LA302:  TYA 
Bank03_LA303:  STA $075B,X
Bank03_LA306:  LSR 
Bank03_LA307:  TAY 
Bank03_LA308:  BCC $A2BA
Bank03_LA30A:  LDA #$00
Bank03_LA30C:  STA $075D,X
Bank03_LA30F:  RTS

Bank03_LA310:  .byte $0C, $0D, $0E, $0F, $07

Bank03_LA315:  LDY #$05
Bank03_LA317:  JSR $99B1
Bank03_LA31A:  DEY 
Bank03_LA31B:  BPL $A317
Bank03_LA31D:  STA $92
Bank03_LA31F:  RTS

Bank03_LA320:  TXA 
Bank03_LA321:  JSR $9B1B
Bank03_LA324:  TAY 
Bank03_LA325:  JSR $99B1
Bank03_LA328:  STA $92
Bank03_LA32A:  RTS

Bank03_LA32B:  .byte $22, $FF, $FF, $FF, $FF

Bank03_LA330:  .byte $32, $FF, $FF, $FF, $FF, $FF, $FF

Bank03_LA337:  .byte $28, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $E0, $DE, $ED, $FF, $E8
Bank03_LA347:  .byte $EE 

Bank03_LA348:  .byte $28, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $ED, $FF, $DF, $DA, $EC, $ED, $F4
Bank03_LA358:  .byte $FF

Bank03_LA359:  .byte $28, $FF, $FF, $FF, $FF, $ED, $E2, $E6, $DE, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank03_LA369:  .byte $FF

Bank03_LA36A:  .byte $28, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank03_LA37A:  .byte $FF

Bank03_LA37B:  .byte $62, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

Bank03_LA388:  .byte $42, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

Bank03_LA391:  .byte $28, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $ED, $E2, $E6, $DE, $FF
Bank03_LA3A1:  .byte $DB

Bank03_LA3A2:  .byte $28, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $E8, $E6, $DB, $FF, $EC, $DE, $ED
Bank03_LA3B2:  .byte $FF

Bank03_LA3B3:  .byte $28, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank03_LA3C3:  .byte $FF

Bank03_LA3C4:  .byte $28, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank03_LA3D4:  .byte $FF

Bank03_LA3D5:  .byte $42, $90, $91, $90, $91, $90, $91, $90, $91

Bank03_LA3DE:  .byte $42, $92, $93, $92, $93, $92, $93, $92, $93

Bank03_LA3E7:  .byte $42, $94, $95, $94, $95, $94, $95, $94, $95

Bank03_LA3F0:  .byte $42, $96, $97, $96, $97, $96, $97, $96, $97

Bank03_LA3F9:  .byte $62, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0

;-----------------------------------[ Enemy animation data tables ]----------------------------------

_EnemyAnimIndexTbl:
Bank03_LA406:  .byte $00, $01, $FF

Bank03_LA409:  .byte $02, $FF

Bank03_LA40B:  .byte $03, $04, $FF

Bank03_LA40E:  .byte $05, $FF

Bank03_LA410:  .byte $0E, $FF

Bank03_LA412:  .byte $0F, $FF

Bank03_LA414:  .byte $10, $FF

Bank03_LA416:  .byte $11, $11, $12, $12, $F7, $FF

Bank03_LA41C:  .byte $18, $FF

Bank03_LA41E:  .byte $19, $F7, $FF

Bank03_LA421:  .byte $1B, $1C, $1D, $FF

Bank03_LA425:  .byte $1E, $FF

Bank03_LA427:  .byte $61, $F7, $62, $F7, $FF

;----------------------------[ Enemy sprite drawing pointer tables ]---------------------------------

_EnemyFramePtrTbl1:
Bank03_LA42C:  .word $A5C8, $A5CD, $A5D2, $A5D7, $A5E4, $A5F1, $A5FB, $A600
Bank03_LA43C:  .word $A606, $A60D, $A613, $A618, $A61E, $A625, $A62B, $A630
Bank03_LA44C:  .word $A635, $A63A, $A641, $A651, $A65F, $A66B, $A678, $A687
Bank03_LA45C:  .word $A691, $A69C, $A6A3, $A6AC, $A6BC, $A6CC, $A6DC, $A6E0
Bank03_LA46C:  .word $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0
Bank03_LA47C:  .word $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0
Bank03_LA48C:  .word $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0
Bank03_LA49C:  .word $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0
Bank03_LA4AC:  .word $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0
Bank03_LA4BC:  .word $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0
Bank03_LA4CC:  .word $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0
Bank03_LA4DC:  .word $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0, $A6E0
Bank03_LA4EC:  .word $A6E0, $A6E0, $A6EE, $A708, $A708, $A708, $A708, $A708
Bank03_LA4FC:  .word $A708, $A708, $A708, $A708, $A708, $A708, $A708, $A708
Bank03_LA50C:  .word $A708, $A708, $A708, $A708, $A708, $A708, $A708, $A708
Bank03_LA51C:  .word $A708, $A708, $A708, $A708, $A708, $A708, $A708, $A708

_EnemyFramePtrTbl2:
Bank03_LA52C:  .word $A708, $A70E, $A713, $A713, $A713, $A713, $A713, $A713
Bank03_LA53C:  .word $A713, $A713

_EnemyPlacePtrTbl:
Bank03_LA540:  .word $A560, $A562, $A57A, $A58C, $A592, $A59E, $A5A4, $A5A4
Bank03_LA550:  .word $A5A4, $A5A4, $A5A4, $A5C4, $A5C4, $A5C8, $A5C8, $A5C8

;------------------------------[ Enemy sprite placement data tables ]--------------------------------

Bank03_LA560:  .byte $FC, $FC

Bank03_LA562:  .byte $80, $80, $81, $81, $82, $82, $83, $83, $84, $84, $85, $85, $F4, $F8, $F4, $00
Bank03_LA572:  .byte $FC, $F8, $FC, $00, $04, $F8, $04, $00

Bank03_LA57A:  .byte $F4, $F4, $F4, $FC, $F4, $04, $FC, $F4, $FC, $FC, $FC, $04, $04, $F4, $04, $FC
Bank03_LA58A:  .byte $04, $04

Bank03_LA58C:  .byte $F1, $FC, $F3, $F3, $FC, $F1

Bank03_LA592:  .byte $F4, $F8, $F4, $00, $FC, $F8, $FC, $00, $04, $F8, $04, $00

Bank03_LA59E:  .byte $FC, $F4, $FC, $FC, $FC, $04

Bank03_LA5A4:  .byte $F8, $F8, $F8, $00, $00, $F8, $00, $00, $F0, $00, $F0, $08, $F8, $08, $F0, $F0
Bank03_LA5B4:  .byte $F0, $F8, $F8, $F0, $00, $F0, $08, $F0, $08, $F8, $00, $08, $08, $00, $08, $08

Bank03_LA5C4:  .byte $F8, $FC, $00, $FC

;Enemy frame drawing data.

Bank03_LA5C8:  .byte $00, $02, $02, $14, $FF

Bank03_LA5CD:  .byte $00, $02, $02, $24, $FF

Bank03_LA5D2:  .byte $00, $00, $00, $04, $FF

Bank03_LA5D7:  .byte $32, $0C, $0C, $C0, $C1, $C2, $D0, $D1, $D2, $E0, $E1, $E2, $FF

Bank03_LA5E4:  .byte $32, $0C, $0C, $C3, $C4, $C5, $D3, $D4, $D5, $E3, $E4, $E5, $FF

Bank03_LA5F1:  .byte $31, $00, $00, $C0, $C2, $D0, $D2, $E0, $E2, $FF

Bank03_LA5FB:  .byte $23, $07, $07, $EA, $FF

Bank03_LA600:  .byte $23, $07, $07, $FE, $EB, $FF

Bank03_LA606:  .byte $23, $07, $07, $FE, $FE, $EC, $FF

Bank03_LA60D:  .byte $A3, $07, $07, $FE, $EB, $FF

Bank03_LA613:  .byte $A3, $07, $07, $EA, $FF

Bank03_LA618:  .byte $E3, $07, $07, $FE, $EB, $FF

Bank03_LA61E:  .byte $63, $07, $07, $FE, $FE, $EC, $FF

Bank03_LA625:  .byte $63, $07, $07, $FE, $EB, $FF

Bank03_LA62B:  .byte $30, $04, $04, $F1, $FF

Bank03_LA630:  .byte $70, $04, $04, $F1, $FF

Bank03_LA635:  .byte $30, $04, $04, $F2, $FF

Bank03_LA63A:  .byte $30, $00, $00, $FD, $03, $F3, $FF

Bank03_LA641:  .byte $0A, $00, $00, $FD, $00, $F4, $FD, $40, $F4, $FD, $80, $F4, $FD, $C0, $F4, $FF

Bank03_LA651:  .byte $24, $08, $14, $FD, $02, $FC, $04, $F0, $D8, $D9, $E8, $E9, $F8, $FF

Bank03_LA65F:  .byte $24, $14, $0C, $FD, $02, $FC, $F4, $F8, $DA, $FE, $C9, $FF

Bank03_LA66B:  .byte $24, $20, $04, $FD, $02, $FC, $EC, $00, $CB, $CC, $DB, $DC, $FF

Bank03_LA678:  .byte $24, $18, $14, $FD, $02, $FC, $F4, $10, $DD, $CE, $FE, $DE, $FE, $DD, $FF

Bank03_LA687:  .byte $24, $08, $0C, $FD, $02, $FC, $0C, $10, $CD, $FF

Bank03_LA691:  .byte $21, $00, $00, $FE, $F5, $F5, $F5, $F5, $F5, $F5, $FF

Bank03_LA69C:  .byte $30, $00, $00, $FD, $03, $ED, $FF

Bank03_LA6A3:  .byte $05, $04, $08, $FD, $00, $00, $00, $00, $FF

Bank03_LA6AC:  .byte $3A, $08, $08, $FD, $03, $EF, $FD, $43, $EF, $FD, $83, $EF, $FD, $C3, $EF, $FF

Bank03_LA6BC:  .byte $3A, $08, $08, $FD, $03, $DF, $FD, $43, $DF, $FD, $83, $DF, $FD, $C3, $DF, $FF

Bank03_LA6CC:  .byte $2A, $08, $08, $FD, $03, $CF, $FD, $43, $CF, $FD, $83, $CF, $FD, $C3, $CF, $FF

Bank03_LA6DC:  .byte $01, $00, $00, $FF

Bank03_LA6E0:  .byte $0A, $00, $00, $75, $FD, $60, $75, $FD, $A0, $75, $FD, $E0, $75, $FF

Bank03_LA6EE:  .byte $0A, $00, $00, $FE, $FE, $FE, $FE, $3D, $3E, $4E, $FD, $60, $3E, $3D, $4E, $FD
Bank03_LA6FE:  .byte $E0, $4E, $3E, $3D, $FD, $A0, $4E, $3D, $3E, $FF

Bank03_LA708:  .byte $0C, $08, $04, $14, $24, $FF

Bank03_LA70E:  .byte $00, $04, $04, $8A, $FF

Bank03_LA713:  .byte $00, $04, $04, $8A, $FF

;-----------------------------------------[ Palette data ]-------------------------------------------

_Palette00:
Bank03_LA718:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA719:  .byte $00           ;Lower byte of PPU palette adress.
Bank03_LA71A:  .byte $20           ;Palette data length.
;The following values are written to the background palette:
Bank03_LA71B:  .byte $0F, $20, $16, $00, $0F, $20, $11, $00, $0F, $16, $20, $00, $0F, $20, $10, $00
;The following values are written to the sprite palette:
Bank03_LA72B:  .byte $0F, $16, $19, $27, $0F, $12, $30, $21, $0F, $27, $16, $30, $0F, $16, $2A, $37

Bank03_LA73B:  .byte $00           ;End Palette00 info.

_Palette01:
Bank03_LA73C:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA73D:  .byte $12           ;Lower byte of PPU palette adress.
Bank03_LA73E:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank03_LA73F:  .byte $19, $27

Bank03_LA741:  .byte $00           ;End Palette01 info.

_Palette03:
Bank03_LA742:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA743:  .byte $12           ;Lower byte of PPU palette adress.
Bank03_LA744:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank03_LA745:  .byte $2C, $27

Bank03_LA747:  .byte $00           ;End Palette03 info.

_Palette02:
Bank03_LA748:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA749:  .byte $12           ;Lower byte of PPU palette adress.
Bank03_LA74A:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank03_LA74B:  .byte $19, $35

Bank03_LA74D:  .byte $00           ;End Palette02 info.

_Palette04:
Bank03_LA74E:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA74F:  .byte $12           ;Lower byte of PPU palette adress.
Bank03_LA750:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank03_LA751:  .byte $2C, $24

Bank03_LA753:  .byte $00           ;End Palette04 info.

_Palette05:
Bank03_LA754:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA755:  .byte $0A           ;Lower byte of PPU palette adress.
Bank03_LA756:  .byte $01           ;Palette data length.
;The following values are written to the background palette:
Bank03_LA757:  .byte $27

Bank03_LA758:  .byte $00           ;End Palette05 info.

_Palette06:
Bank03_LA759:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA75A:  .byte $0A           ;Lower byte of PPU palette adress.
Bank03_LA75B:  .byte $01           ;Palette data length.
;The following values are written to the background palette:
Bank03_LA75C:  .byte $20

Bank03_LA75D:  .byte $00           ;End Palette06 info.

_Palette07:
Bank03_LA75E:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA75F:  .byte $00           ;Lower byte of PPU palette adress.
Bank03_LA760:  .byte $11           ;Palette data length.
;The following values are written to the background palette:
Bank03_LA761:  .byte $0F, $20, $16, $00, $0F, $20, $11, $00, $0F, $20, $16, $00, $0F, $20, $10, $00
Bank03_LA771:  .byte $0F

Bank03_LA772:  .byte $00           ;End Palette07 info.

_Palette08:
Bank03_LA773:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA774:  .byte $00           ;Lower byte of PPU palette adress.
Bank03_LA775:  .byte $11           ;Palette data length.
;The following values are written to the background palette:
Bank03_LA776:  .byte $20, $02, $16, $00, $20, $02, $11, $00, $20, $02, $16, $00, $20, $02, $10, $00
Bank03_LA786:  .byte $20

Bank03_LA787:  .byte $00           ;End Palette08 info.

_Palette09:
Bank03_LA788:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA789:  .byte $00           ;Lower byte of PPU palette adress.
Bank03_LA78A:  .byte $60           ;Lower byte of PPU palette adress.
Bank03_LA78B:  .byte $20           ;Repeat bit set. Fill sprite and background palette with #$20.

Bank03_LA78C:  .byte $00           ;End Palette09 info.

_Palette0A:
Bank03_LA78D:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA78E:  .byte $11           ;Lower byte of PPU palette adress.
Bank03_LA78F:  .byte $03
;The following values are written to the sprite palette:
Bank03_LA790:  .byte $04, $09, $07

Bank03_LA793:  .byte $00           ;End Palette0A info.

_Palette0B:
Bank03_LA794:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA795:  .byte $11           ;Lower byte of PPU palette adress.
Bank03_LA796:  .byte $03           ;Lower byte of PPU palette adress.
;The following values are written to the sprite palette:
Bank03_LA797:  .byte $05, $09, $17

Bank03_LA79A:  .byte $00           ;End Palette0B info.

_Palette0C:
Bank03_LA79B:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA79C:  .byte $11           ;Lower byte of PPU palette adress.
Bank03_LA79D:  .byte $03           ;Lower byte of PPU palette adress.
;The following values are written to the sprite palette:
Bank03_LA79E:  .byte $06, $0A, $26

Bank03_LA7A1:  .byte $00           ;End Palette0C info.

_Palette0D:
Bank03_LA7A2:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA7A3:  .byte $11           ;Lower byte of PPU palette adress.
Bank03_LA7A4:  .byte $03           ;Lower byte of PPU palette adress.
;The following values are written to the sprite palette:
Bank03_LA7A5:  .byte $16, $19, $27

Bank03_LA7A8:  .byte $00           ;End Palette0D info.

_Palette0E:
Bank03_LA7A9:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA7AA:  .byte $00           ;Lower byte of PPU palette adress.
Bank03_LA7AB:  .byte $04           ;Lower byte of PPU palette adress.
;The following values are written to the background palette:
Bank03_LA7AC:  .byte $0F, $30, $30, $21

Bank03_LA7B0:  .byte $00           ;End Palette0E info.

_Palette0F:
Bank03_LA7B1:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA7B2:  .byte $10           ;Lower byte of PPU palette adress.
Bank03_LA7B3:  .byte $04           ;Lower byte of PPU palette adress.
;The following values are written to the sprite palette:
Bank03_LA7B4:  .byte $0F, $15, $34, $17

Bank03_LA7B8:  .byte $00           ;End Palette0F info.

_Palette10:
Bank03_LA7B9:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA7BA:  .byte $10           ;Lower byte of PPU palette adress.
Bank03_LA7BB:  .byte $04           ;Lower byte of PPU palette adress.
;The following values are written to the sprite palette:
Bank03_LA7BC:  .byte $0F, $15, $34, $19

Bank03_LA7C0:  .byte $00           ;End Palette10 info.

_Palette11:
Bank03_LA7C1:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA7C2:  .byte $10           ;Lower byte of PPU palette adress.
Bank03_LA7C3:  .byte $04           ;Lower byte of PPU palette adress.
;The following values are written to the sprite palette:
Bank03_LA7C4:  .byte $0F, $15, $34, $28

Bank03_LA7C8:  .byte $00           ;End Palette11 info.

_Palette12:
Bank03_LA7C9:  .byte $3F           ;Upper byte of PPU palette adress.
Bank03_LA7CA:  .byte $10           ;Lower byte of PPU palette adress.
Bank03_LA7CB:  .byte $04           ;Palette data length.
;The following values are written to the sprite palette:
Bank03_LA7CC:  .byte $0F, $15, $34, $29

Bank03_LA7D0:  .byte $00           ;End Palette12 info.

;----------------------------[ Room and structure pointer tables ]-----------------------------------

_RmPtrTbl:
Bank03_LA7D1:  .word $A8AF, $A8BD, $A8C5, $A8FA, $A929, $A95E, $A975, $A990
Bank03_LA7E1:  .word $A9AB, $A9CF, $A9F2, $AA33, $AA75, $AAAE, $AAE3, $AB12
Bank03_LA7F1:  .word $AB4A, $AB7C, $ABA5, $ABCE, $ABEF

_StrctPtrTbl:
Bank03_LA7FB:  .word $AC16, $AC29, $AC50, $AC69, $AC70, $AC77, $AC7A, $AC8B
Bank03_LA80B:  .word $ACA4, $ACB5, $ACC6, $ACD0, $ACF9, $AD26, $AD2D, $AD3C
Bank03_LA81B:  .word $AD3F, $AD48, $AD61, $AD66, $AD6B, $AD99, $ADAC, $ADC8
Bank03_LA82B:  .word $ADDD, $ADFE, $AE0F, $AE1A, $AE1E, $AE21, $AE2C, $AE36

;------------------------------------[ Special items table ]-----------------------------------------

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

;Elevator to end.
Bank03_LA83B:  .byte $03
Bank03_LA83C:  .word $A843
Bank03_LA83E:  .byte $01, $FF, $04, $8F, $00 

;Elevator to Brinstar.
Bank03_LA843:  .byte $04
Bank03_LA844:  .word $A84B
Bank03_LA846:  .byte $03, $FF, $04, $83, $00

;10 missile door.
Bank03_LA84B:  .byte $07
Bank03_LA84C:  .word $A85B
Bank03_LA84E:  .byte $03, $05, $09, $A2, $00

;Rinkas
Bank03_LA853:  .byte $04, $04, $08, $00

;Rinkas
Bank03_LA857:  .byte $09, $FF, $08, $00

;Rinkas
Bank03_LA85B:  .byte $08
Bank03_LA85C:  .word $A862
Bank03_LA85E:  .byte $0A, $FF, $18, $00

;Rinkas
Bank03_LA862:  .byte $09
Bank03_LA863:  .word $A869
Bank03_LA865:  .byte $0A, $FF, $08, $00

;Rinkas
Bank03_LA869:  .byte $0A
Bank03_LA86A:  .word $A870
Bank03_LA86C:  .byte $0A, $FF, $18, $00

;Door at bottom of escape shaft.
Bank03_LA870:  .byte $0B
Bank03_LA871:  .word $FFFF
Bank03_LA873:  .byte $01, $05, $09, $A3, $00

;Mother brain, Zeebetite, 3 cannons and Rinkas.
Bank03_LA878:  .byte $02, $0C, $06, $47, $18, $05, $49, $15, $4B, $25, $3E, $00

;2 Zeebetites, 6 cannons and Rinkas.
Bank03_LA884:  .byte $03, $12, $37, $27, $08, $05, $41, $15, $43, $25, $36, $05, $49, $15, $4B, $35
Bank03_LA894:  .byte $3E, $00

;Right door, 2 Zeebetites, 6 cannons and Rinkas.
Bank03_LA896:  .byte $04, $14, $09, $A3, $17, $07, $08, $05, $41, $15, $43, $25, $36, $05, $49, $15
Bank03_LA8A6:  .byte $4B, $35, $3E, $00

;Left door.
Bank03_LA8AA:  .byte $05, $FF, $09, $B3, $00 

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
Bank03_LA8AF:  .byte $02           ;Attribute table data.
;Room object data:
Bank03_LA8B0:  .byte $40, $01, $03, $48, $01, $03, $50, $03, $02, $5F, $03, $02, $FF

;Room #$01
Bank03_LA8BD:  .byte $02           ;Attribute table data.
;Room object data:
Bank03_LA8BE:  .byte $07, $02, $02, $87, $02, $02, $FF

;Room #$02
Bank03_LA8C5:  .byte $03           ;Attribute table data.
;Room object data:
Bank03_LA8C6:  .byte $00, $0C, $03, $08, $0C, $03, $0F, $09, $03, $5F, $04, $02, $62, $13, $02, $6A
Bank03_LA8D6:  .byte $13, $02, $82, $0E, $02, $85, $12, $01, $8A, $0E, $02, $8D, $12, $01, $8F, $09
Bank03_LA8E6:  .byte $03, $C4, $0F, $03, $C8, $0F, $03, $D3, $10, $03, $DB, $0A, $03, $E0, $0A, $03
Bank03_LA8F6:  .byte $E8, $0A, $03, $FF

;Room #$03
Bank03_LA8FA:  .byte $00           ;Attribute table data.
;Room object data:
Bank03_LA8FB:  .byte $00, $0C, $03, $08, $0C, $03, $62, $13, $02, $6A, $13, $02, $82, $0E, $02, $85
Bank03_LA90B:  .byte $12, $01, $8A, $0E, $02, $8D, $12, $01, $C4, $0F, $03, $C8, $0F, $03, $D0, $0D
Bank03_LA91B:  .byte $02, $D3, $10, $03, $DB, $0A, $03, $E2, $0A, $03, $EA, $0A, $03, $FF

;Room #$04
Bank03_LA929:  .byte $03           ;Attribute table data.
;Room object data:
Bank03_LA92A:  .byte $00, $09, $03, $01, $0A, $03, $03, $11, $03, $08, $0C, $03, $0E, $1C, $03, $52
Bank03_LA93A:  .byte $07, $01, $53, $08, $02, $6A, $13, $02, $80, $09, $03, $8A, $0E, $02, $8D, $12
Bank03_LA94A:  .byte $01, $91, $0B, $03, $CB, $1C, $03, $CC, $1C, $03, $D8, $0D, $02, $DB, $00, $02
Bank03_LA95A:  .byte $E0, $0A, $03, $FF

;Room #$05
Bank03_LA95E:  .byte $03           ;Attribute table data.
;Room object data:
Bank03_LA95F:  .byte $00, $14, $03, $08, $14, $03, $50, $04, $02, $80, $14, $03, $88, $14, $03, $D0
Bank03_LA96F:  .byte $14, $03, $D8, $14, $03, $FF

;Room #$06
Bank03_LA975:  .byte $03           ;Attribute table data.
;Room object data:
Bank03_LA976:  .byte $00, $14, $03, $08, $14, $03, $95, $14, $03, $D0, $14, $03, $D8, $14, $03, $FD
;Room enemy/door data:
Bank03_LA986:  .byte $01, $01, $45, $11, $00, $89, $21, $01, $B3, $FF

;Room #$07
Bank03_LA990:  .byte $03           ;Attribute table data.
;Room object data:
Bank03_LA991:  .byte $00, $16, $03, $08, $16, $03, $30, $15, $03, $38, $15, $03, $D0, $15, $03, $D8
Bank03_LA9A1:  .byte $15, $03, $FD
;Room enemy/door data:
Bank03_LA9A4:  .byte $31, $01, $69, $41, $00, $B5, $FF

;Room #$08
Bank03_LA9AB:  .byte $01           ;Attribute table data.
;Room object data:
Bank03_LA9AC:  .byte $00, $16, $03, $08, $16, $03, $30, $15, $03, $38, $15, $03, $D0, $17, $03, $D4
Bank03_LA9BC:  .byte $00, $02, $D7, $17, $03, $DC, $17, $03, $FD
;Room enemy/door data:
Bank03_LA9C5:  .byte $01, $01, $45, $11, $00, $89, $21, $01, $D4, $FF

;Room #$09
Bank03_LA9CF:  .byte $01           ;Attribute table data.
;Room object data:
Bank03_LA9D0:  .byte $00, $16, $03, $08, $16, $03, $30, $15, $03, $38, $15, $03, $5F, $03, $02, $8C
Bank03_LA9E0:  .byte $17, $03, $B8, $17, $03, $CC, $17, $03, $D0, $00, $02, $D2, $17, $03, $FD
;Room enemy/door data:
Bank03_LA9EF:  .byte $02, $A0, $FF

;Room #$0A
Bank03_LA9F2:  .byte $03           ;Attribute table data.
;Room object data:
Bank03_LA9F3:  .byte $00, $19, $03, $01, $1A, $03, $04, $1B, $01, $09, $12, $01, $0E, $1A, $03, $0F
Bank03_LAA03:  .byte $19, $03, $34, $12, $01, $4B, $1B, $01, $50, $03, $02, $5E, $1A, $03, $80, $19
Bank03_LAA13:  .byte $03, $81, $1A, $03, $82, $1B, $01, $88, $18, $03, $8F, $19, $03, $B1, $18, $03
Bank03_LAA23:  .byte $B8, $18, $03, $FD
;Room enemy/door data:
Bank03_LAA27:  .byte $02, $B0, $31, $01, $A5, $41, $00, $48, $51, $01, $6A, $FF

;Room #$0B
Bank03_LAA33:  .byte $03           ;Attribute table data.
;Room object data:
Bank03_LAA34:  .byte $00, $19, $03, $01, $1A, $03, $09, $12, $01, $0E, $1A, $03, $0F, $19, $03, $23
Bank03_LAA44:  .byte $12, $01, $4B, $12, $01, $51, $1A, $03, $5E, $1A, $03, $66, $1B, $01, $80, $19
Bank03_LAA54:  .byte $03, $82, $12, $01, $8F, $19, $03, $98, $12, $01, $A1, $1A, $03, $AE, $1A, $03
Bank03_LAA64:  .byte $CB, $1B, $01, $D5, $12, $01, $FD
;Room enemy/door data:
Bank03_LAA6B:  .byte $01, $01, $45, $11, $00, $89, $21, $01, $D4, $FF

;Room #$0C
Bank03_LAA75:  .byte $03           ;Attribute table data.
;Room object data:
Bank03_LAA76:  .byte $00, $19, $03, $01, $1A, $03, $02, $1E, $03, $0E, $1A, $03, $0F, $19, $03, $36
Bank03_LAA86:  .byte $1E, $03, $3E, $1C, $03, $51, $1A, $03, $5E, $1A, $03, $71, $1C, $03, $72, $1E
Bank03_LAA96:  .byte $03, $80, $19, $03, $8F, $19, $03, $A1, $1A, $03, $A6, $1E, $03, $AE, $1A, $03
Bank03_LAAA6:  .byte $FD
;Room enemy/door data:
Bank03_LAAA7:  .byte $01, $01, $45, $51, $00, $CB, $FF

;Room #$0D
Bank03_LAAAE:  .byte $03           ;Attribute table data.
;Room object data:
Bank03_LAAAF:  .byte $00, $19, $03, $01, $18, $03, $08, $18, $03, $0F, $19, $03, $11, $18, $03, $18
Bank03_LAABF:  .byte $18, $03, $50, $03, $02, $5E, $1A, $03, $80, $19, $03, $81, $1A, $03, $82, $1E
Bank03_LAACF:  .byte $03, $8F, $19, $03, $AE, $1A, $03, $B6, $1E, $03, $BE, $1C, $03, $D1, $1A, $03
Bank03_LAADF:  .byte $FD
;Room enemy/door data:
Bank03_LAAE0:  .byte $02, $B0, $FF

;Room #$0E
Bank03_LAAE3:  .byte $03           ;Attribute table data.
;Room object data:
Bank03_LAAE4:  .byte $00, $19, $03, $01, $18, $03, $08, $18, $03, $0F, $19, $03, $41, $1A, $03, $4E
Bank03_LAAF4:  .byte $1A, $03, $80, $19, $03, $86, $1D, $03, $8F, $19, $03, $91, $1A, $03, $9E, $1A
Bank03_LAB04:  .byte $03, $BB, $1B, $01, $C3, $1B, $01, $E1, $1A, $03, $EE, $1A, $03, $FF

;Room #$0F
Bank03_LAB12:  .byte $03           ;Attribute table data.
;Room object data:
Bank03_LAB13:  .byte $00, $19, $03, $01, $1A, $03, $0E, $1A, $03, $0F, $19, $03, $12, $12, $01, $28
Bank03_LAB23:  .byte $12, $01, $4C, $1B, $01, $51, $1A, $03, $55, $1B, $01, $5F, $03, $02, $80, $19
Bank03_LAB33:  .byte $03, $83, $1B, $01, $8B, $12, $01, $8E, $1A, $03, $8F, $19, $03, $A1, $1A, $03
Bank03_LAB43:  .byte $B1, $18, $03, $B8, $18, $03, $FF

;Room #$10
Bank03_LAB4A:  .byte $03           ;Attribute table data.
;Room object data:
Bank03_LAB4B:  .byte $00, $19, $03, $01, $1A, $03, $0E, $1A, $03, $0F, $19, $03, $1A, $05, $01, $4D
Bank03_LAB5B:  .byte $05, $01, $51, $1A, $03, $5E, $1A, $03, $80, $19, $03, $8A, $05, $01, $8F, $19
Bank03_LAB6B:  .byte $03, $95, $05, $01, $A1, $1A, $03, $AE, $1A, $03, $CA, $05, $01, $E7, $05, $01
Bank03_LAB7B:  .byte $FF

;Room #$11
Bank03_LAB7C:  .byte $03           ;Attribute table data.
;Room object data:
Bank03_LAB7D:  .byte $00, $19, $03, $01, $1F, $01, $09, $1F, $01, $11, $1E, $03, $19, $1E, $03, $50
Bank03_LAB8D:  .byte $03, $02, $80, $19, $03, $81, $1F, $01, $A1, $1E, $03, $B8, $1A, $03, $D1, $1F
Bank03_LAB9D:  .byte $01, $D9, $1F, $01, $FD
;Room enemy/door data:
Bank03_LABA2:  .byte $02, $B2, $FF

;Room #$12
Bank03_LABA5:  .byte $01           ;Attribute table data.
;Room object data:
Bank03_LABA6:  .byte $00, $1F, $01, $08, $1F, $01, $0F, $19, $03, $10, $1E, $03, $17, $1E, $03, $5F
Bank03_LABB6:  .byte $03, $02, $87, $1F, $01, $8F, $19, $03, $A7, $1A, $03, $C5, $1F, $01, $D0, $1F
Bank03_LABC6:  .byte $01, $D7, $1F, $01, $FD
;Room enemy/door data:
Bank03_LABCB:  .byte $02, $A0, $FF

;Room #$13
Bank03_LABCE:  .byte $00           ;Attribute table data.
;Room object data:
Bank03_LABCF:  .byte $00, $1F, $01, $08, $1F, $01, $10, $1E, $03, $18, $1E, $03, $D0, $00, $02, $D3
Bank03_LABDF:  .byte $1F, $01, $D8, $00, $02, $DC, $1F, $01, $FD
;Room enemy/door data:
Bank03_LABE8:  .byte $01, $01, $45, $11, $00, $89, $FF

;Room #$14
Bank03_LABEF:  .byte $00           ;Attribute table data.
;Room object data:
Bank03_LABF0:  .byte $00, $1F, $01, $08, $1F, $01, $10, $1E, $03, $18, $1E, $03, $94, $06, $03, $98
Bank03_LAC00:  .byte $06, $03, $9C, $06, $03, $D0, $1F, $01, $D3, $00, $02, $DB, $00, $02, $FD
;Room enemy/door data:
Bank03_LAC0F:  .byte $21, $00, $47, $31, $01, $6A, $FF

;---------------------------------------[ Structure definitions ]------------------------------------

;The first byte of the structure definition states how many macros are in the first row of the
;structure. The the number of bytes after the macro number byte is equal to the value of the macro
;number byte and those bytes define what each macro in the row are. For example, if the macro number
;byte is #$08, the next 8 bytes represent 8 macros. The macro description bytes are the macro numbers
;and are multiplied by 4 to find the index to the desired macro in _MacroDefs.  Any further bytes in
;the structure definition represent the next rows.  #$FF marks the end of the structure definition.

;Structure #$00
Bank03_LAC16:  .byte $08, $01, $01, $01, $01, $01, $01, $01, $01, $08, $00, $00, $00, $00, $00, $00
Bank03_LAC26:  .byte $00, $00, $FF

;Structure #$01
Bank03_LAC29:  .byte $08, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $08, $02, $02, $02, $02, $02, $02
Bank03_LAC39:  .byte $02, $02, $01, $1C, $08, $03, $03, $03, $03, $03, $03, $03, $03, $08, $0A, $0A
Bank03_LAC49:  .byte $0A, $0A, $0A, $0A, $0A, $0A, $FF

;Structure #$02
Bank03_LAC50:  .byte $02, $04, $05, $02, $04, $05, $02, $04, $05, $02, $04, $05, $02, $04, $05, $02
Bank03_LAC60:  .byte $04, $05, $02, $04, $05, $02, $04, $05, $FF

;Structure #$03
Bank03_LAC69:  .byte $01, $08, $01, $08, $01, $08, $FF

;Structure #$04
Bank03_LAC70:  .byte $01, $09, $01, $09, $01, $09, $FF

;Structure #$05
Bank03_LAC77:  .byte $01, $13, $FF

;Structure #$06
Bank03_LAC7A:  .byte $03, $1D, $17, $1E, $03, $21, $1C, $21, $03, $21, $1C, $21, $03, $1F, $17, $20
Bank03_LAC8A:  .byte $FF

;Structure #$07
Bank03_LAC8B:  .byte $05, $25, $1C, $1C, $1C, $31, $05, $26, $1C, $1C, $1C, $32, $05, $26, $1C, $1C
Bank03_LAC9B:  .byte $1C, $32, $05, $27, $1C, $1C, $1C, $33, $FF

;Structure #$08
Bank03_LACA4:  .byte $03, $28, $29, $2A, $03, $2B, $2C, $2D, $03, $2E, $2F, $30, $03, $06, $12, $35
Bank03_LACB4:  .byte $FF

;Structure #$09
Bank03_LACB5:  .byte $01, $0B, $01, $0B, $01, $0B, $01, $0B, $01, $0B, $01, $0B, $01, $0B, $01, $0B
Bank03_LACC5:  .byte $FF

;Structure #$0A
Bank03_LACC6:  .byte $08, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $FF

;Structure #$0B
Bank03_LACD0:  .byte $07, $1D, $0D, $16, $16, $16, $0D, $1E, $07, $21, $1D, $0D, $0D, $0D, $1E, $21
Bank03_LACE0:  .byte $07, $21, $21, $15, $14, $15, $21, $21, $07, $0D, $21, $16, $10, $16, $21, $0D
Bank03_LACF0:  .byte $07, $1F, $0D, $20, $10, $1F, $0D, $20, $FF

;Structure #$0C
Bank03_LACF9:  .byte $08, $22, $22, $0D, $22, $22, $1E, $1C, $1D, $08, $1C, $1C, $21, $1C, $1C, $21
Bank03_LAD09:  .byte $1C, $21, $08, $1C, $1C, $0C, $1C, $1C, $1F, $0D, $20, $07, $1C, $1C, $21, $1C
Bank03_LAD19:  .byte $1C, $1C, $14, $04, $1C, $14, $0D, $14, $03, $1C, $1C, $15, $FF

;Structure #$0D
Bank03_LAD26:  .byte $02, $01, $01, $02, $00, $00, $FF

;Structure #$0E
Bank03_LAD2D:  .byte $01, $16, $01, $21, $01, $21, $01, $0C, $01, $21, $01, $0D, $01, $21, $FF

;Structure #$0F
Bank03_LAD3C:  .byte $01, $0C, $FF

;Structure #$10
Bank03_LAD3F:  .byte $07, $22, $22, $22, $22, $22, $22, $22, $FF

;Structure #$11
Bank03_LAD48:  .byte $05, $0B, $1D, $22, $0D, $22, $04, $11, $21, $11, $21, $04, $11, $21, $11, $0D
Bank03_LAD58:  .byte $03, $11, $21, $11, $03, $23, $23, $23, $FF

;Structure #$12
Bank03_LAD61:  .byte $03, $19, $1B, $1A, $FF

;Structure #$13
Bank03_LAD66:  .byte $01, $34, $01, $34, $FF

;Structure #$14
Bank03_LAD6B:  .byte $08, $1D, $22, $17, $0D, $1E, $0D, $17, $0D, $08, $0D, $22, $17, $20, $21, $14
Bank03_LAD7B:  .byte $0D, $11, $08, $21, $1D, $22, $17, $20, $10, $10, $21, $08, $21, $1F, $17, $0D
Bank03_LAD8B:  .byte $22, $0D, $1E, $11, $08, $0D, $14, $10, $1F, $22, $22, $20, $11, $FF

;Structure #$15
Bank03_LAD99:  .byte $08, $17, $17, $0D, $17, $17, $0D, $17, $17, $08, $0D, $17, $17, $17, $17, $17
Bank03_LADA9:  .byte $17, $0D, $FF

;Structure #$16
Bank03_LADAC:  .byte $08, $18, $1D, $17, $1E, $1D, $17, $17, $1E, $08, $18, $21, $1C, $21, $21, $1C
Bank03_LADBC:  .byte $1C, $21, $08, $0D, $20, $1C, $1F, $20, $1C, $1C, $1F, $FF

;Structure #$17
Bank03_LADC8:  .byte $04, $0D, $0D, $0D, $0D, $04, $18, $18, $18, $18, $04, $18, $18, $18, $18, $04
Bank03_LADD8:  .byte $18, $18, $18, $18, $FF

;Structure #$18
Bank03_LADDD:  .byte $07, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $07, $0D, $17, $17, $17, $17, $17, $0D
Bank03_LADED:  .byte $07, $18, $0A, $10, $0A, $0A, $10, $18, $07, $0D, $17, $17, $17, $17, $17, $0D
Bank03_LADFD:  .byte $FF

;Structure #$19
Bank03_LADFE:  .byte $01, $0A, $01, $0A, $01, $0A, $01, $0A, $01, $0A, $01, $0A, $01, $0A, $01, $0A
Bank03_LAE0E:  .byte $FF

;Structure #$1A
Bank03_LAE0F:  .byte $01, $0D, $01, $18, $01, $18, $01, $18, $01, $18, $FF

;Structure #$1B
Bank03_LAE1A:  .byte $02, $19, $1A, $FF

;Structure #$1C
Bank03_LAE1E:  .byte $01, $0D, $FF

;Structure #$1D
Bank03_LAE21:  .byte $04, $14, $1C, $1C, $14, $04, $0A, $0A, $0A, $0A, $FF

;Structure #$1E
Bank03_LAE2C:  .byte $08, $0D, $22, $22, $22, $22, $22, $22, $0D, $FF

;Structure #$1F
Bank03_LAE36:  .byte $08, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $08, $0E, $10, $0E, $0E, $10, $10
Bank03_LAE46:  .byte $0E, $10, $FF

;----------------------------------------[ Macro definitions ]---------------------------------------

;The macro definitions are simply index numbers into the pattern tables that represent the 4 quadrants
;of the macro definition. The bytes correspond to the following position in order: lower right tile,
;lower left tile, upper right tile, upper left tile. 

_MacroDefs:

Bank03_LAE49:  .byte $A7, $A7, $A7, $A7
Bank03_LAE4D:  .byte $FF, $FF, $A6, $A6
Bank03_LAE51:  .byte $A2, $A2, $FF, $FF
Bank03_LAE55:  .byte $FF, $FF, $A3, $A3
Bank03_LAE59:  .byte $A4, $FF, $A4, $FF
Bank03_LAE5D:  .byte $FF, $A5, $FF, $A5
Bank03_LAE61:  .byte $FF, $79, $FF, $7E
Bank03_LAE65:  .byte $4F, $4F, $4F, $4F
Bank03_LAE69:  .byte $A0, $A0, $A0, $A0
Bank03_LAE6D:  .byte $A1, $A1, $A1, $A1
Bank03_LAE71:  .byte $04, $05, $06, $07
Bank03_LAE75:  .byte $10, $11, $12, $13
Bank03_LAE79:  .byte $00, $01, $02, $03
Bank03_LAE7D:  .byte $08, $08, $08, $08
Bank03_LAE81:  .byte $18, $19, $1A, $1B
Bank03_LAE85:  .byte $1C, $1D, $1E, $1F
Bank03_LAE89:  .byte $0C, $0D, $0E, $0F
Bank03_LAE8D:  .byte $09, $09, $09, $09
Bank03_LAE91:  .byte $7A, $7B, $7F, $5A
Bank03_LAE95:  .byte $2A, $2C, $FF, $FF
Bank03_LAE99:  .byte $14, $15, $16, $17
Bank03_LAE9D:  .byte $20, $21, $22, $23
Bank03_LAEA1:  .byte $24, $25, $20, $21
Bank03_LAEA5:  .byte $28, $28, $29, $29
Bank03_LAEA9:  .byte $26, $27, $26, $27
Bank03_LAEAD:  .byte $2A, $2B, $FF, $FF
Bank03_LAEB1:  .byte $2B, $2C, $FF, $FF
Bank03_LAEB5:  .byte $2B, $2B, $FF, $FF
Bank03_LAEB9:  .byte $FF, $FF, $FF, $FF
Bank03_LAEBD:  .byte $31, $32, $33, $34
Bank03_LAEC1:  .byte $35, $36, $37, $38
Bank03_LAEC5:  .byte $3D, $3E, $3F, $40
Bank03_LAEC9:  .byte $41, $42, $43, $44
Bank03_LAECD:  .byte $39, $3A, $39, $3A
Bank03_LAED1:  .byte $3B, $3B, $3C, $3C
Bank03_LAED5:  .byte $0B, $0B, $2D, $2E
Bank03_LAED9:  .byte $2F, $30, $0B, $0B
Bank03_LAEDD:  .byte $50, $51, $52, $53
Bank03_LAEE1:  .byte $54, $55, $54, $55
Bank03_LAEE5:  .byte $56, $57, $58, $59
Bank03_LAEE9:  .byte $FF, $FF, $FF, $5E
Bank03_LAEED:  .byte $5B, $5C, $5F, $60
Bank03_LAEF1:  .byte $FF, $FF, $61, $FF
Bank03_LAEF5:  .byte $5D, $62, $67, $68
Bank03_LAEF9:  .byte $63, $64, $69, $6A
Bank03_LAEFD:  .byte $65, $66, $6B, $6C
Bank03_LAF01:  .byte $6D, $6E, $73, $74
Bank03_LAF05:  .byte $6F, $70, $75, $76
Bank03_LAF09:  .byte $71, $72, $77, $78
Bank03_LAF0D:  .byte $45, $46, $47, $48
Bank03_LAF11:  .byte $FF, $98, $FF, $98
Bank03_LAF15:  .byte $49, $4A, $4B, $4C
Bank03_LAF19:  .byte $90, $91, $90, $91
Bank03_LAF1D:  .byte $7C, $7D, $4D, $FF

.scend

;Not used.
Bank03_LAF21:  .byte $1C, $1D, $1E, $17, $18, $19, $1A, $1F, $20, $21, $22, $60, $61, $62, $63, $0E
Bank03_LAF31:  .byte $0F, $FF, $FF, $0C, $0D, $0D, $0D, $10, $0D, $FF, $10, $10, $FF, $FF, $FF, $FF
Bank03_LAF41:  .byte $FF, $FF, $30, $FF, $33, $FF, $36, $FF, $39, $FF, $3D, $FF, $FF, $31, $32, $34
Bank03_LAF51:  .byte $35, $37, $38, $3A, $3B, $3E, $3F, $3C, $41, $40, $42, $84, $85, $86, $87, $80
Bank03_LAF61:  .byte $81, $82, $83, $88, $89, $8A, $8B, $45, $46, $45, $46, $47, $48, $48, $47, $5C
Bank03_LAF71:  .byte $5D, $5E, $5F, $B8, $B8, $B9, $B9, $74, $75, $75, $74, $C1, $13, $13, $13, $36
Bank03_LAF81:  .byte $BE, $BC, $BD, $BF, $14, $15, $14, $C0, $14, $C0, $16, $FF, $C1, $FF, $FF, $C2
Bank03_LAF91:  .byte $14, $FF, $FF, $30, $13, $BC, $BD, $13, $14, $15, $16, $D7, $D7, $D7, $D7, $76
Bank03_LAFA1:  .byte $76, $76, $76, $FF, $FF, $BA, $BA, $BB, $BB, $BB, $BB, $00, $01, $02, $03, $04
Bank03_LAFB1:  .byte $05, $06, $07, $FF, $FF, $08, $09, $FF, $FF, $09, $0A, $55, $56, $57, $58, $90
Bank03_LAFC1:  .byte $91, $92, $93, $4B, $4C, $4D, $50, $51, $52, $53, $54, $70, $71, $72, $73, $8C
Bank03_LAFD1:  .byte $8D, $8E, $8F, $11, $12, $FF, $11, $11, $12, $12, $11, $11, $12, $12, $FF, $C3
Bank03_LAFE1:  .byte $C4, $C5, $C6, $30, $00, $BC, $BD, $CD, $CE, $CF, $D0, $D1, $D2, $D3, $D4, $90
Bank03_LAFF1:  .byte $91, $92, $93, $20, $20, $20, $20, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0

;------------------------------------------[ Area music data ]---------------------------------------

;There are 3 control bytes associated with the music data and the rest are musical note indexes.
;If the byte has the binary format 1011xxxx ($Bx), then the byte is an index into the corresponding
;musical notes table and is used to set the note length until it is set by another note length
;byte. The lower 4 bits are the index into the note length table. Another control byte is the loop
;and counter btye. The loop and counter byte has the format 11xxxxxx. Bits 0 thru 6 contain the
;number of times to loop.  The third control byte is #$FF. This control byte marks the end of a loop
;and decrements the loop counter. If #$00 is found in the music data, the music has reached the end.
;A #$00 in any of the different music channel data segments will mark the end of the music. The
;remaining bytes are indexes into the MusicNotesTbl_B3 and should only be even numbers as there are 2
;bytes of data per musical note.

EscapeSQ2Data:
Bank03_LB000:  .byte $C4               ;
Bank03_LB001:  .byte $B3               ;3/4 seconds    +
Bank03_LB002:  .byte $3E               ;G4     |
Bank03_LB003:  .byte $44               ;A#4        | Repeat 4 times
Bank03_LB004:  .byte $B4               ;1 1/2 seconds  |
Bank03_LB005:  .byte $42               ;A4     +
Bank03_LB006:  .byte $FF               ;
Bank03_LB007:  .byte $C2               ;
Bank03_LB008:  .byte $B6               ;1 3/16 seconds +
Bank03_LB009:  .byte $30               ;C4     |
Bank03_LB00A:  .byte $B9               ;1/8 seconds    |
Bank03_LB00B:  .byte $26               ;G3     |
Bank03_LB00C:  .byte $30               ;C4     |
Bank03_LB00D:  .byte $36               ;D#4        |
Bank03_LB00E:  .byte $B4               ;1 1/2 seconds  |
Bank03_LB00F:  .byte $34               ;D4     |
Bank03_LB010:  .byte $B6               ;1 3/16 seconds |
Bank03_LB011:  .byte $30               ;C4     |
Bank03_LB012:  .byte $B9               ;1/8 seconds    |
Bank03_LB013:  .byte $26               ;G3     |
Bank03_LB014:  .byte $30               ;C4     |
Bank03_LB015:  .byte $36               ;D#4        |
Bank03_LB016:  .byte $B4               ;1 1/2 seconds  | Repeat 2 times
Bank03_LB017:  .byte $34               ;D4     |
Bank03_LB018:  .byte $B6               ;1 3/16 seconds |
Bank03_LB019:  .byte $30               ;C4     |
Bank03_LB01A:  .byte $B9               ;1/8 seconds    |
Bank03_LB01B:  .byte $26               ;G3     |
Bank03_LB01C:  .byte $30               ;C4     |
Bank03_LB01D:  .byte $38               ;E4     |
Bank03_LB01E:  .byte $B4               ;1 1/2 seconds  |
Bank03_LB01F:  .byte $34               ;D4     |
Bank03_LB020:  .byte $B6               ;1 3/16 seconds |
Bank03_LB021:  .byte $30               ;C4     |
Bank03_LB022:  .byte $B9               ;1/8 seconds    |
Bank03_LB023:  .byte $26               ;G3     |
Bank03_LB024:  .byte $30               ;C4     |
Bank03_LB025:  .byte $38               ;E4     |
Bank03_LB026:  .byte $B4               ;1 1/2 seconds  |
Bank03_LB027:  .byte $34               ;D4     +
Bank03_LB028:  .byte $FF               ;
Bank03_LB029:  .byte $C2               ;
Bank03_LB02A:  .byte $B6               ;1 3/16 seconds +
Bank03_LB02B:  .byte $48               ;C5     |
Bank03_LB02C:  .byte $B9               ;1/8 seconds    |
Bank03_LB02D:  .byte $46               ;B4     |
Bank03_LB02E:  .byte $02               ;No sound   |
Bank03_LB02F:  .byte $48               ;C5     |
Bank03_LB030:  .byte $B6               ;1 3/16 seconds |
Bank03_LB031:  .byte $4C               ;D5     |
Bank03_LB032:  .byte $B2               ;3/8 seconds    |
Bank03_LB033:  .byte $48               ;C5     |
Bank03_LB034:  .byte $B6               ;1 3/16 seconds |
Bank03_LB035:  .byte $46               ;B4     |
Bank03_LB036:  .byte $B9               ;1/8 second |
Bank03_LB037:  .byte $42               ;A4     |
Bank03_LB038:  .byte $02               ;No sound   |
Bank03_LB039:  .byte $46               ;B4     | Repeat 2 times
Bank03_LB03A:  .byte $B3               ;3/4 seconds    |
Bank03_LB03B:  .byte $48               ;C5     |
Bank03_LB03C:  .byte $3E               ;G4     |
Bank03_LB03D:  .byte $B6               ;1 3/16 seconds |
Bank03_LB03E:  .byte $3A               ;F4     |
Bank03_LB03F:  .byte $B9               ;1/8 seconds    |
Bank03_LB040:  .byte $3E               ;G4     |
Bank03_LB041:  .byte $02               ;No sound   |
Bank03_LB042:  .byte $3A               ;F4     |
Bank03_LB043:  .byte $B3               ;3/4 seconds    |
Bank03_LB044:  .byte $38               ;E4     |
Bank03_LB045:  .byte $30               ;C4     |
Bank03_LB046:  .byte $B4               ;1 1/2 seconds  |
Bank03_LB047:  .byte $36               ;D#4        |
Bank03_LB048:  .byte $B3               ;3/4 seconds    |
Bank03_LB049:  .byte $30               ;C4     |
Bank03_LB04A:  .byte $2E               ;B3     +
Bank03_LB04B:  .byte $FF               ;
Bank03_LB04C:  .byte $00               ;End escape music.

EscapeSQ1Data:
Bank03_LB04D:  .byte $C4               ;
Bank03_LB04E:  .byte $B3               ;3/4 seconds    +
Bank03_LB04F:  .byte $34               ;D4     |
Bank03_LB050:  .byte $3A               ;F4     | Repeat 4 times
Bank03_LB051:  .byte $B4               ;1 1/2 seconds  |
Bank03_LB052:  .byte $32               ;C#4        +
Bank03_LB053:  .byte $FF               ;
Bank03_LB054:  .byte $C2               ;
Bank03_LB055:  .byte $B4               ;1 1/2 seconds  +
Bank03_LB056:  .byte $2A               ;A3     |
Bank03_LB057:  .byte $28               ;Ab3        |
Bank03_LB058:  .byte $2A               ;A3     |
Bank03_LB059:  .byte $B6               ;1 3/16 seconds |
Bank03_LB05A:  .byte $28               ;Ab3        |
Bank03_LB05B:  .byte $B9               ;1/8 seconds    |
Bank03_LB05C:  .byte $26               ;G3     |
Bank03_LB05D:  .byte $24               ;F#3        |
Bank03_LB05E:  .byte $22               ;F3     |
Bank03_LB05F:  .byte $B6               ;1 3/16 seconds |
Bank03_LB060:  .byte $20               ;E3     |
Bank03_LB061:  .byte $B2               ;3/8 seconds    |
Bank03_LB062:  .byte $22               ;F3     |
Bank03_LB063:  .byte $B6               ;1 3/16 seconds | Repeat 2 times
Bank03_LB064:  .byte $28               ;Ab3        |
Bank03_LB065:  .byte $B9               ;1/8 seconds    |
Bank03_LB066:  .byte $26               ;G3     |
Bank03_LB067:  .byte $24               ;F#3        |
Bank03_LB068:  .byte $22               ;F3     |
Bank03_LB069:  .byte $B4               ;1 1/2 seconds  |
Bank03_LB06A:  .byte $26               ;G3     |
Bank03_LB06B:  .byte $B9               ;1/8 seconds    |
Bank03_LB06C:  .byte $22               ;F3     |
Bank03_LB06D:  .byte $20               ;E3     |
Bank03_LB06E:  .byte $22               ;F3     |
Bank03_LB06F:  .byte $26               ;G3     |
Bank03_LB070:  .byte $22               ;F3     |
Bank03_LB071:  .byte $26               ;G3     |
Bank03_LB072:  .byte $2A               ;A3     |
Bank03_LB073:  .byte $26               ;G3     |
Bank03_LB074:  .byte $2A               ;A3     |
Bank03_LB075:  .byte $2E               ;B3     |
Bank03_LB076:  .byte $2A               ;A3     |
Bank03_LB077:  .byte $2E               ;B3     +
Bank03_LB078:  .byte $FF               ;
Bank03_LB079:  .byte $C2               ;
Bank03_LB07A:  .byte $B9               ;1/8 seconds    +
Bank03_LB07B:  .byte $20               ;E3     |
Bank03_LB07C:  .byte $1E               ;D#3        |
Bank03_LB07D:  .byte $20               ;E3     |
Bank03_LB07E:  .byte $26               ;G3     |
Bank03_LB07F:  .byte $30               ;C4     |
Bank03_LB080:  .byte $38               ;E4     |
Bank03_LB081:  .byte $B2               ;3/8 seconds    |
Bank03_LB082:  .byte $3E               ;G4     |
Bank03_LB083:  .byte $38               ;E4     |
Bank03_LB084:  .byte $B0               ;3/32 seconds   |
Bank03_LB085:  .byte $24               ;F#3        |
Bank03_LB086:  .byte $20               ;E3     |
Bank03_LB087:  .byte $24               ;F#3        |
Bank03_LB088:  .byte $2A               ;A3     |
Bank03_LB089:  .byte $B9               ;1/8 seconds    |
Bank03_LB08A:  .byte $34               ;D4     |
Bank03_LB08B:  .byte $3A               ;F4     |
Bank03_LB08C:  .byte $3C               ;F#4        |
Bank03_LB08D:  .byte $B2               ;3/8 seconds    |
Bank03_LB08E:  .byte $42               ;A4     |
Bank03_LB08F:  .byte $3C               ;F#4        |
Bank03_LB090:  .byte $B2               ;3/8 seconds    |
Bank03_LB091:  .byte $3E               ;G4     |
Bank03_LB092:  .byte $B9               ;1/8 seconds    |
Bank03_LB093:  .byte $34               ;D4     |
Bank03_LB094:  .byte $02               ;No sound   |
Bank03_LB095:  .byte $2E               ;B3     |
Bank03_LB096:  .byte $B3               ;3/4 seconds    |
Bank03_LB097:  .byte $34               ;D4     |
Bank03_LB098:  .byte $B2               ;3/8 seconds    |
Bank03_LB099:  .byte $3E               ;G4     |
Bank03_LB09A:  .byte $3A               ;F4     |
Bank03_LB09B:  .byte $38               ;E4     |
Bank03_LB09C:  .byte $34               ;D4     |
Bank03_LB09D:  .byte $B9               ;1/8 seconds    |
Bank03_LB09E:  .byte $30               ;C4     |
Bank03_LB09F:  .byte $26               ;G3     |
Bank03_LB0A0:  .byte $30               ;C4     |
Bank03_LB0A1:  .byte $B9               ;1/8 seconds    |
Bank03_LB0A2:  .byte $34               ;D4     |
Bank03_LB0A3:  .byte $02               ;No sound   |
Bank03_LB0A4:  .byte $26               ;G3     |
Bank03_LB0A5:  .byte $B3               ;3/4 seconds    | Repeat 2 times
Bank03_LB0A6:  .byte $30               ;C4     |
Bank03_LB0A7:  .byte $B9               ;1/8 seconds    |
Bank03_LB0A8:  .byte $30               ;C4     |
Bank03_LB0A9:  .byte $20               ;E3     |
Bank03_LB0AA:  .byte $3E               ;G4     |
Bank03_LB0AB:  .byte $B9               ;1/8 seconds    |
Bank03_LB0AC:  .byte $34               ;D4     |
Bank03_LB0AD:  .byte $02               ;No sound   |
Bank03_LB0AE:  .byte $26               ;G3     |
Bank03_LB0AF:  .byte $3A               ;F4     |
Bank03_LB0B0:  .byte $38               ;E4     |
Bank03_LB0B1:  .byte $34               ;D4     |
Bank03_LB0B2:  .byte $30               ;C4     |
Bank03_LB0B3:  .byte $26               ;G3     |
Bank03_LB0B4:  .byte $24               ;F#3        |
Bank03_LB0B5:  .byte $22               ;F3     |
Bank03_LB0B6:  .byte $20               ;E3     |
Bank03_LB0B7:  .byte $22               ;F3     |
Bank03_LB0B8:  .byte $26               ;G3     |
Bank03_LB0B9:  .byte $22               ;F3     |
Bank03_LB0BA:  .byte $26               ;G3     |
Bank03_LB0BB:  .byte $28               ;Ab3        |
Bank03_LB0BC:  .byte $26               ;G3     |
Bank03_LB0BD:  .byte $28               ;Ab3        |
Bank03_LB0BE:  .byte $2C               ;A#3        |
Bank03_LB0BF:  .byte $28               ;Ab3        |
Bank03_LB0C0:  .byte $2C               ;A#3        |
Bank03_LB0C1:  .byte $B9               ;1/8 seconds    |
Bank03_LB0C2:  .byte $22               ;F3     |
Bank03_LB0C3:  .byte $20               ;E3     |
Bank03_LB0C4:  .byte $22               ;F3     |
Bank03_LB0C5:  .byte $20               ;E3     |
Bank03_LB0C6:  .byte $22               ;F3     |
Bank03_LB0C7:  .byte $20               ;E3     |
Bank03_LB0C8:  .byte $22               ;F3     |
Bank03_LB0C9:  .byte $1C               ;D3     |
Bank03_LB0CA:  .byte $22               ;F3     |
Bank03_LB0CB:  .byte $1C               ;D3     |
Bank03_LB0CC:  .byte $22               ;F3     |
Bank03_LB0CD:  .byte $1C               ;D3     +
Bank03_LB0CE:  .byte $FF               ;

EscapeTriData:
Bank03_LB0CF:  .byte $D0               ;
Bank03_LB0D0:  .byte $B2               ;3/8 seconds    +
Bank03_LB0D1:  .byte $3E               ;G4     |
Bank03_LB0D2:  .byte $B9               ;1/8 seconds    | Repeat 16 times
Bank03_LB0D3:  .byte $3E               ;G4     |
Bank03_LB0D4:  .byte $3E               ;G4     |
Bank03_LB0D5:  .byte $3E               ;G4     +
Bank03_LB0D6:  .byte $FF               ;
Bank03_LB0D7:  .byte $C2               ;
Bank03_LB0D8:  .byte $B2               ;3/8 seconds    +
Bank03_LB0D9:  .byte $2A               ;A3     |
Bank03_LB0DA:  .byte $B9               ;1/8 seconds    |
Bank03_LB0DB:  .byte $2A               ;A3     |
Bank03_LB0DC:  .byte $12               ;A2     |
Bank03_LB0DD:  .byte $2A               ;A3     |
Bank03_LB0DE:  .byte $B2               ;3/8 seconds    |
Bank03_LB0DF:  .byte $2A               ;A3     |
Bank03_LB0E0:  .byte $2A               ;A3     |
Bank03_LB0E1:  .byte $2A               ;A3     |
Bank03_LB0E2:  .byte $B9               ;1/8 seconds    |
Bank03_LB0E3:  .byte $2A               ;A3     |
Bank03_LB0E4:  .byte $2A               ;A3     |
Bank03_LB0E5:  .byte $2A               ;A3     |
Bank03_LB0E6:  .byte $B2               ;3/8 seconds    |
Bank03_LB0E7:  .byte $2A               ;A3     |
Bank03_LB0E8:  .byte $2A               ;A3     |
Bank03_LB0E9:  .byte $2A               ;A3     |
Bank03_LB0EA:  .byte $B9               ;1/8 seconds    |
Bank03_LB0EB:  .byte $2A               ;A3     |
Bank03_LB0EC:  .byte $2A               ;A3     |
Bank03_LB0ED:  .byte $2A               ;A3     |
Bank03_LB0EE:  .byte $B2               ;3/8 seconds    |
Bank03_LB0EF:  .byte $2A               ;A3     |
Bank03_LB0F0:  .byte $2A               ;A3     |
Bank03_LB0F1:  .byte $2A               ;A3     |
Bank03_LB0F2:  .byte $2A               ;A3     |
Bank03_LB0F3:  .byte $2A               ;A3     |
Bank03_LB0F4:  .byte $B9               ;1/8 seconds    |
Bank03_LB0F5:  .byte $2A               ;A3     |
Bank03_LB0F6:  .byte $12               ;A2     |
Bank03_LB0F7:  .byte $2A               ;A3     |
Bank03_LB0F8:  .byte $B2               ;3/8 seconds    |
Bank03_LB0F9:  .byte $26               ;G3     |
Bank03_LB0FA:  .byte $B9               ;1/8 seconds    | Repeat 2 times
Bank03_LB0FB:  .byte $0E               ;G2     |
Bank03_LB0FC:  .byte $26               ;G3     |
Bank03_LB0FD:  .byte $26               ;G3     |
Bank03_LB0FE:  .byte $B2               ;3/8 seconds    |
Bank03_LB0FF:  .byte $26               ;G3     |
Bank03_LB100:  .byte $B9               ;1/8 seconds    |
Bank03_LB101:  .byte $0E               ;G2     |
Bank03_LB102:  .byte $26               ;G3     |
Bank03_LB103:  .byte $26               ;G3     |
Bank03_LB104:  .byte $B2               ;3/8 seconds    |
Bank03_LB105:  .byte $22               ;F3     |
Bank03_LB106:  .byte $B9               ;1/8 seconds    |
Bank03_LB107:  .byte $0A               ;F2     |
Bank03_LB108:  .byte $22               ;F3     |
Bank03_LB109:  .byte $22               ;F3     |
Bank03_LB10A:  .byte $B2               ;3/8 seconds    |
Bank03_LB10B:  .byte $22               ;F3     |
Bank03_LB10C:  .byte $B9               ;1/8 seconds    |
Bank03_LB10D:  .byte $0A               ;F2     |
Bank03_LB10E:  .byte $22               ;F3     |
Bank03_LB10F:  .byte $22               ;F3     |
Bank03_LB110:  .byte $B2               ;3/8 seconds    |
Bank03_LB111:  .byte $20               ;E3     |
Bank03_LB112:  .byte $20               ;E3     |
Bank03_LB113:  .byte $B9               ;1/8 seconds    |
Bank03_LB114:  .byte $20               ;E3     |
Bank03_LB115:  .byte $20               ;E3     |
Bank03_LB116:  .byte $20               ;E3     |
Bank03_LB117:  .byte $B2               ;3/8 seconds    |
Bank03_LB118:  .byte $20               ;E3     |
Bank03_LB119:  .byte $B9               ;1/8 seconds    |
Bank03_LB11A:  .byte $34               ;D4     |
Bank03_LB11B:  .byte $30               ;C4     |
Bank03_LB11C:  .byte $34               ;D4     |
Bank03_LB11D:  .byte $38               ;E4     |
Bank03_LB11E:  .byte $34               ;D4     |
Bank03_LB11F:  .byte $38               ;E4     |
Bank03_LB120:  .byte $3A               ;F4     |
Bank03_LB121:  .byte $38               ;E4     |
Bank03_LB122:  .byte $3A               ;F4     |
Bank03_LB123:  .byte $3E               ;G4     |
Bank03_LB124:  .byte $3A               ;F4     |
Bank03_LB125:  .byte $3E               ;G4     +
Bank03_LB126:  .byte $FF               ;
Bank03_LB127:  .byte $C2               ;
Bank03_LB128:  .byte $B2               ;3/8 seconds    +
Bank03_LB129:  .byte $18               ;C3     |
Bank03_LB12A:  .byte $30               ;C4     |
Bank03_LB12B:  .byte $18               ;C3     |
Bank03_LB12C:  .byte $30               ;C4     |
Bank03_LB12D:  .byte $18               ;C3     |
Bank03_LB12E:  .byte $30               ;C4     |
Bank03_LB12F:  .byte $18               ;C3     |
Bank03_LB130:  .byte $30               ;C4     |
Bank03_LB131:  .byte $22               ;F3     |
Bank03_LB132:  .byte $22               ;F3     |
Bank03_LB133:  .byte $B1               ;3/16 seconds   |
Bank03_LB134:  .byte $22               ;F3     |
Bank03_LB135:  .byte $22               ;F3     |
Bank03_LB136:  .byte $B2               ;3/8 seconds    |
Bank03_LB137:  .byte $22               ;F3     |
Bank03_LB138:  .byte $20               ;E3     |
Bank03_LB139:  .byte $1C               ;D3     |
Bank03_LB13A:  .byte $18               ;C3     |
Bank03_LB13B:  .byte $16               ;B2     |
Bank03_LB13C:  .byte $14               ;A#2        |
Bank03_LB13D:  .byte $14               ;A#2        |
Bank03_LB13E:  .byte $14               ;A#2        |
Bank03_LB13F:  .byte $2C               ;A#3        | Repeat 2 times
Bank03_LB140:  .byte $2A               ;A3     |
Bank03_LB141:  .byte $2A               ;A3     |
Bank03_LB142:  .byte $B9               ;1/8 seconds    |
Bank03_LB143:  .byte $2A               ;A3     |
Bank03_LB144:  .byte $2A               ;A3     |
Bank03_LB145:  .byte $2A               ;A3     |
Bank03_LB146:  .byte $B2               ;3/8 seconds    |
Bank03_LB147:  .byte $2A               ;A3     |
Bank03_LB148:  .byte $28               ;Ab3        |
Bank03_LB149:  .byte $28               ;Ab3        |
Bank03_LB14A:  .byte $B9               ;1/8 seconds    |
Bank03_LB14B:  .byte $28               ;Ab3        |
Bank03_LB14C:  .byte $28               ;Ab3        |
Bank03_LB14D:  .byte $28               ;Ab3        |
Bank03_LB14E:  .byte $B2               ;3/8 seconds    |
Bank03_LB14F:  .byte $28               ;Ab3        |
Bank03_LB150:  .byte $26               ;G3     |
Bank03_LB151:  .byte $26               ;G3     |
Bank03_LB152:  .byte $B9               ;1/8 seconds    |
Bank03_LB153:  .byte $26               ;G3     |
Bank03_LB154:  .byte $26               ;G3     |
Bank03_LB155:  .byte $3E               ;G4     |
Bank03_LB156:  .byte $26               ;G3     |
Bank03_LB157:  .byte $26               ;G3     |
Bank03_LB158:  .byte $3E               ;G4     +
Bank03_LB159:  .byte $FF               ;

EscapeNoiseData:
Bank03_LB15A:  .byte $F0               ;
Bank03_LB15B:  .byte $B2               ;3/8 seconds    +
Bank03_LB15C:  .byte $01               ;Drumbeat 00    |
Bank03_LB15D:  .byte $04               ;Drumbeat 01    | Repeat 48 times
Bank03_LB15E:  .byte $01               ;Drumbeat 00    |
Bank03_LB15F:  .byte $04               ;Drumbeat 01    +
Bank03_LB160:  .byte $FF               ;

MthrBrnRoomTriData:
Bank03_LB161:  .byte $E0               ;
Bank03_LB162:  .byte $BA               ;3/64 seconds   +
Bank03_LB163:  .byte $2A               ;A3     |
Bank03_LB164:  .byte $1A               ;C#3        |
Bank03_LB165:  .byte $02               ;No sound   |
Bank03_LB166:  .byte $3A               ;F4     |
Bank03_LB167:  .byte $40               ;Ab4        |
Bank03_LB168:  .byte $02               ;No sound   |
Bank03_LB169:  .byte $1C               ;D3     |
Bank03_LB16A:  .byte $2E               ;B3     |
Bank03_LB16B:  .byte $38               ;E4     |
Bank03_LB16C:  .byte $2C               ;A#3        |
Bank03_LB16D:  .byte $3C               ;F#4        |
Bank03_LB16E:  .byte $38               ;E4     |
Bank03_LB16F:  .byte $02               ;No sound   |
Bank03_LB170:  .byte $40               ;Ab4        |
Bank03_LB171:  .byte $44               ;A#4        |
Bank03_LB172:  .byte $46               ;B4     |
Bank03_LB173:  .byte $02               ;No sound   |
Bank03_LB174:  .byte $1E               ;D#3        |
Bank03_LB175:  .byte $02               ;No sound   | Repeat 32 times
Bank03_LB176:  .byte $2C               ;A#3        |
Bank03_LB177:  .byte $38               ;E4     |
Bank03_LB178:  .byte $46               ;B4     |
Bank03_LB179:  .byte $26               ;G3     |
Bank03_LB17A:  .byte $02               ;No sound   |
Bank03_LB17B:  .byte $3A               ;F4     |
Bank03_LB17C:  .byte $20               ;E3     |
Bank03_LB17D:  .byte $02               ;No sound   |
Bank03_LB17E:  .byte $28               ;Ab3        |
Bank03_LB17F:  .byte $2E               ;B3     |
Bank03_LB180:  .byte $02               ;No sound   |
Bank03_LB181:  .byte $18               ;C3     |
Bank03_LB182:  .byte $44               ;A#4        |
Bank03_LB183:  .byte $02               ;No sound   |
Bank03_LB184:  .byte $46               ;B4     |
Bank03_LB185:  .byte $48               ;C5     |
Bank03_LB186:  .byte $4A               ;C#5        |
Bank03_LB187:  .byte $4C               ;D5     |
Bank03_LB188:  .byte $02               ;No sound   |
Bank03_LB189:  .byte $18               ;C3     |
Bank03_LB18A:  .byte $1E               ;D#3        +
Bank03_LB18B:  .byte $FF               ;

MthrBrnRoomSQ1Data:
Bank03_LB18C:  .byte $B8               ;1/4 seconds
Bank03_LB18D:  .byte $02               ;No sound

;SQ1 music data runs down into the SQ2 music data.
MthrBrnRoomSQ2Data:
Bank03_LB18E:  .byte $C8               ;
Bank03_LB18F:  .byte $B0               ;3/32 seconds   +
Bank03_LB190:  .byte $0A               ;F2     | Repeat 8 times
Bank03_LB191:  .byte $0C               ;F#2        +
Bank03_LB192:  .byte $FF               ;
Bank03_LB193:  .byte $C8               ;
Bank03_LB194:  .byte $0E               ;G2     + Repeat 8 times
Bank03_LB195:  .byte $0C               ;F#2        +
Bank03_LB196:  .byte $FF               ;
Bank03_LB197:  .byte $C8               ;
Bank03_LB198:  .byte $10               ;Ab2        + Repeat 8 times
Bank03_LB199:  .byte $0E               ;G2     +
Bank03_LB19A:  .byte $FF               ;
Bank03_LB19B:  .byte $C8               ;
Bank03_LB19C:  .byte $0E               ;G2     + Repeat 8 times
Bank03_LB19D:  .byte $0C               ;F#2        +
Bank03_LB19E:  .byte $FF               ;
Bank03_LB19F:  .byte $00               ;End mother brain room music.

;Unused tile patterns.
Bank03_LB1A0:  .byte $2B, $3B, $1B, $5A, $D0, $D1, $C3, $C3, $3B, $3B, $9B, $DA, $D0, $D0, $C0, $C0
Bank03_LB1B0:  .byte $2C, $23, $20, $20, $30, $98, $CF, $C7, $00, $00, $00, $00, $00, $00, $00, $30
Bank03_LB1C0:  .byte $1F, $80, $C0, $C0, $60, $70, $FC, $C0, $00, $00, $00, $00, $00, $00, $00, $00 
Bank03_LB1D0:  .byte $01, $00, $00, $00, $00, $00, $00, $00, $80, $80, $C0, $78, $4C, $C7, $80, $80
Bank03_LB1E0:  .byte $C4, $A5, $45, $0B, $1B, $03, $03, $00, $3A, $13, $31, $63, $C3, $83, $03, $04
Bank03_LB1F0:  .byte $E6, $E6, $C4, $8E, $1C, $3C, $18, $30, $E8, $E8, $C8, $90, $60, $00, $00, $00 

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
    _LBD36:  .word $B18C, $B18E, $B161, $0000

    ;Escape music(not used this memory page).
    _LBD3E:  .byte $0B, $FF, $00, $02, $02
    _LBD43:  .word $B04D, $B000, $B0CF, $B15A

    ;Norfair music.
    _LBD4B:  .byte $0B, $FF, $F0, $04, $04
    _LBD50:  .word $0100, $0300, $0500, $0700

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

;Not used.
Bank03_LBF56:  .byte $10, $07, $0E, $1C, $38, $70, $2A, $54, $15, $12, $02, $03, $20, $2C, $B4, $AD
Bank03_LBF66:  .byte $4D, $06, $8D, $8D, $06, $AD, $5E, $06, $A8, $B9, $2A, $BC, $A8, $A2, $00, $B9
Bank03_LBF76:  .byte $61, $BD, $9D, $2B, $06, $C8, $E8, $8A, $C9, $0D, $D0, $F3, $A9, $01, $8D, $40
Bank03_LBF86:  .byte $06, $8D, $41, $06, $8D, $42, $06, $8D, $43, $06, $A9, $00, $8D, $38, $06, $8D
Bank03_LBF96:  .byte $39, $06, $8D, $3A, $06, $8D, $3B, $06, $60, $FF, $00, $00, $00, $00, $00, $00
Bank03_LBFA6:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

;----------------------------------------------------------------------------------------------------

RESET_Bank03:
Bank03_LBFB0:  SEI                     ;Disables interrupt.
Bank03_LBFB1:  CLD                     ;Sets processor to binary mode.
Bank03_LBFB2:  LDX #$00                ;
Bank03_LBFB4:  STX PPUControl0         ;Clear PPU control registers.
Bank03_LBFB7:  STX PPUControl1         ;
Bank03_LBFBA:* LDA PPUStatus           ;
Bank03_LBFBD:  BPL -                   ;Wait for VBlank.
Bank03_LBFBF:* LDA PPUStatus           ;
Bank03_LBFC2:  BPL -                   ;
Bank03_LBFC4:  ORA #$FF                ;
Bank03_LBFC6:  STA MMC1Reg0            ;Reset MMC1 chip.
Bank03_LBFC9:  STA MMC1Reg1            ;(MSB is set).
Bank03_LBFCC:  STA MMC1Reg2            ;
Bank03_LBFCF:  STA MMC1Reg3            ;
Bank03_LBFD2:  JMP Startup             ;($C01A)Does preliminry housekeeping.

;----------------------------------------------------------------------------------------------------

;Not used.
Bank03_LBFD5:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00
Bank03_LBFE5:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank03_LBFF5:  .byte $00, $00, $00, $00, $00

;----------------------------------------------------------------------------------------------------

;Interrupt vectors.
.word NMI               ;($C0D9)NMI vector.
.word RESET_Bank03      ;($FFB0)Reset vector.
.word RESET_Bank03      ;($FFB0)IRQ vector.