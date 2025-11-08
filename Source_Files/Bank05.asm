;Ridley hideout bank.

;-----------------------------------------[ Start of code ]------------------------------------------

Bank05_L8000:  JMP StartUpdateEnemyAnimation
Bank05_L8003:  JMP StartUpdateEnemyAnimation_2
Bank05_L8006:  JMP Start_Special_Attrs
Bank05_L8009:  JMP DoSomethingToFrameCount
Bank05_L800C:  JMP UpdateEnemyAnim     ;($E094)
Bank05_L800F:  JMP DoSomethingToAnimationIndecies
Bank05_L8012:  JMP DoSomethingToEnDataIndex
Bank05_L8015:  JMP UpdateEnemyHitpoints
Bank05_L8018:  JMP Bank07_LFBB9
Bank05_L801B:  JMP Bank07_LFB88
Bank05_L801E:  JMP Bank07_LFBCA
Bank05_L8021:  JMP Bank07_LF870
Bank05_L8024:  JMP ChooseRoutine       ;($C27C)
Bank05_L8027:  JMP Bank07_LFD8F
Bank05_L802A:  JMP Bank07_LEB6E
Bank05_L802D:  JMP $8244
Bank05_L8030:  JMP $8318
Bank05_L8033:  JMP Bank07_LFA1E
Bank05_L8036:  JMP $833F
Bank05_L8039:  JMP $8395
Bank05_L803C:  JMP SomethingAboutMovement
Bank05_L803F:  JMP DrawTileBlast
Bank05_L8042:  JMP SubtractHealth      ;($CE92)
Bank05_L8045:  JMP Base10Subtract      ;($C3FB)

Bank05_L8048:  .word $84FD, $84A6, $844A, $844A, $84A6, $84FD, $83F4, $83F4

Bank05_L8058:  LDX PageIndex
Bank05_L805A:  LDA $0405,X
Bank05_L805D:  ASL 
Bank05_L805E:  BMI ++++++++
Bank05_L8060:  LDA EnStatus,X
Bank05_L8063:  CMP #$02
Bank05_L8065:  BNE ++++++++
Bank05_L8067:  JSR $8244
Bank05_L806A:  LDA $00
Bank05_L806C:  BPL ++
Bank05_L806E:  JSR TwosCompliment      ;($C3D4)
Bank05_L8071:  STA $66
Bank05_L8073:* JSR $83F5
Bank05_L8076:  JSR $80B8
Bank05_L8079:  DEC $66
Bank05_L807B:  BNE -
Bank05_L807D:* BEQ ++
Bank05_L807F:  STA $66
Bank05_L8081:* JSR $844B
Bank05_L8084:  JSR $80FB
Bank05_L8087:  DEC $66
Bank05_L8089:  BNE -
Bank05_L808B:* JSR $8318
Bank05_L808E:  LDA $00
Bank05_L8090:  BPL ++
Bank05_L8092:  JSR TwosCompliment      ;($C3D4)
Bank05_L8095:  STA $66
Bank05_L8097:* JSR $84A7
Bank05_L809A:  JSR $816E
Bank05_L809D:  DEC $66
Bank05_L809F:  BNE -
Bank05_L80A1:* BEQ ++
Bank05_L80A3:  STA $66
Bank05_L80A5:* JSR $84FE
Bank05_L80A8:  JSR $8134
Bank05_L80AB:  DEC $66
Bank05_L80AD:  BNE -
Bank05_L80AF:* RTS
 
Bank05_L80B0:  LDY EnDataIndex,X
Bank05_L80B3:  LDA $977B,Y
Bank05_L80B6:  ASL             ;*2 
Bank05_L80B7:  RTS

Bank05_L80B8:  LDX PageIndex
Bank05_L80BA:  BCS $80FA
Bank05_L80BC:  LDA $0405,X
Bank05_L80BF:  BPL $80C7
Bank05_L80C1:  JSR $81FC
Bank05_L80C4:  JMP $80F6
Bank05_L80C7:  JSR $80B0
Bank05_L80CA:  BPL $80EA
Bank05_L80CC:  LDA $6B03,X
Bank05_L80CF:  BEQ $80C1
Bank05_L80D1:  BPL $80D8
Bank05_L80D3:  JSR $81B1
Bank05_L80D6:  BEQ $80E2
Bank05_L80D8:  SEC 
Bank05_L80D9:  ROR $0402,X
Bank05_L80DC:  ROR EnCounter,X
Bank05_L80DF:  JMP $80F6
Bank05_L80E2:  STA $0402,X
Bank05_L80E5:  STA EnCounter,X
Bank05_L80E8:  BEQ $80F6
Bank05_L80EA:  LDA $977B,Y
Bank05_L80ED:  LSR 
Bank05_L80EE:  LSR 
Bank05_L80EF:  BCC $80F6
Bank05_L80F1:  LDA #$04
Bank05_L80F3:  JSR $856B
Bank05_L80F6:  LDA #$01
Bank05_L80F8:  STA $66
Bank05_L80FA:  RTS
 
Bank05_L80FB:  LDX PageIndex
Bank05_L80FD:  BCS $8133
Bank05_L80FF:  LDA $0405,X
Bank05_L8102:  BPL $810A
Bank05_L8104:  JSR $81FC
Bank05_L8107:  JMP $812F
Bank05_L810A:  JSR $80B0
Bank05_L810D:  BPL $8123
Bank05_L810F:  LDA $6B03,X
Bank05_L8112:  BEQ $8104
Bank05_L8114:  BPL $8120
Bank05_L8116:  CLC 
Bank05_L8117:  ROR $0402,X
Bank05_L811A:  ROR EnCounter,X
Bank05_L811D:  JMP $812F
Bank05_L8120:  JSR $81B1
Bank05_L8123:  LDA $977B,Y
Bank05_L8126:  LSR 
Bank05_L8127:  LSR 
Bank05_L8128:  BCC $812F
Bank05_L812A:  LDA #$04
Bank05_L812C:  JSR $856B
Bank05_L812F:  LDA #$01
Bank05_L8131:  STA $66
Bank05_L8133:  RTS
 
Bank05_L8134:  LDX PageIndex
Bank05_L8136:  BCS $816D
Bank05_L8138:  JSR $80B0
Bank05_L813B:  BPL $815E
Bank05_L813D:  LDA $0405,X
Bank05_L8140:  BMI $8148
Bank05_L8142:  JSR $81C7
Bank05_L8145:  JMP $8169
Bank05_L8148:  LDA $6B03,X
Bank05_L814B:  BEQ $8142
Bank05_L814D:  BPL $8159
Bank05_L814F:  CLC 
Bank05_L8150:  ROR $0403,X
Bank05_L8153:  ROR $0407,X
Bank05_L8156:  JMP $8169
Bank05_L8159:  JSR $81C0
Bank05_L815C:  BEQ $8169
Bank05_L815E:  LDA $977B,Y
Bank05_L8161:  LSR 
Bank05_L8162:  BCC $8169
Bank05_L8164:  LDA #$01
Bank05_L8166:  JSR $856B
Bank05_L8169:  LDA #$01
Bank05_L816B:  STA $66
Bank05_L816D:  RTS

Bank05_L816E:  LDX PageIndex
Bank05_L8170:  BCS $81B0
Bank05_L8172:  JSR $80B0
Bank05_L8175:  BPL $81A0
Bank05_L8177:  LDA $0405,X
Bank05_L817A:  BMI $8182
Bank05_L817C:  JSR $81C7
Bank05_L817F:  JMP $81AC
Bank05_L8182:  LDA $6B03,X
Bank05_L8185:  BEQ $817C
Bank05_L8187:  BPL $818E
Bank05_L8189:  JSR $81C0
Bank05_L818C:  BEQ $8198
Bank05_L818E:  SEC 
Bank05_L818F:  ROR $0403,X
Bank05_L8192:  ROR $0407,X
Bank05_L8195:  JMP $81AC
Bank05_L8198:  STA $0403,X
Bank05_L819B:  STA $0407,X
Bank05_L819E:  BEQ $81AC
Bank05_L81A0:  JSR $80B0
Bank05_L81A3:  LSR 
Bank05_L81A4:  LSR 
Bank05_L81A5:  BCC $81AC
Bank05_L81A7:  LDA #$01
Bank05_L81A9:  JSR $856B
Bank05_L81AC:  LDA #$01
Bank05_L81AE:  STA $66
Bank05_L81B0:  RTS
 
Bank05_L81B1:  JSR $81B8
Bank05_L81B4:  STA $6AFE,X
Bank05_L81B7:  RTS

Bank05_L81B8:  LDA #$20
Bank05_L81BA:  JSR LF744
Bank05_L81BD:  LDA #$00
Bank05_L81BF:  RTS

Bank05_L81C0:  JSR $81B8
Bank05_L81C3:  STA $6AFF,X
Bank05_L81C6:  RTS

Bank05_L81C7:  JSR $81F6
Bank05_L81CA:  BNE $81F5
Bank05_L81CC:  LDA #$01
Bank05_L81CE:  JSR $856B
Bank05_L81D1:  LDA $6AFF,X
Bank05_L81D4:  JSR TwosCompliment
Bank05_L81D7:  STA $6AFF,X

Bank05_L81DA:  JSR $81F6
Bank05_L81DD:  BNE $81F5
Bank05_L81DF:  JSR $80B0
Bank05_L81E2:  SEC 
Bank05_L81E3:  BPL $81ED
Bank05_L81E5:  LDA #$00
Bank05_L81E7:  SBC $0407,X
Bank05_L81EA:  STA $0407,X
Bank05_L81ED:  LDA #$00
Bank05_L81EF:  SBC $0403,X
Bank05_L81F2:  STA $0403,X
Bank05_L81F5:  RTS

Bank05_L81F6:  JSR LF74B
Bank05_L81F9:  AND #$20
Bank05_L81FB:  RTS

Bank05_L81FC:  JSR $81F6
Bank05_L81FF:  BNE $81F5
Bank05_L8201:  LDA #$04
Bank05_L8203:  JSR $856B
Bank05_L8206:  LDA $6AFE,X
Bank05_L8209:  JSR TwosCompliment
Bank05_L820C:  STA $6AFE,X

Bank05_L820F:  JSR $81F6
Bank05_L8212:  BNE $822A
Bank05_L8214:  JSR $80B0
Bank05_L8217:  SEC 
Bank05_L8218:  BPL $8222
Bank05_L821A:  LDA #$00
Bank05_L821C:  SBC EnCounter,X
Bank05_L821F:  STA EnCounter,X
Bank05_L8222:  LDA #$00
Bank05_L8224:  SBC $0402,X
Bank05_L8227:  STA $0402,X
Bank05_L822A:  RTS 

Bank05_L822B:  LDA $0405,X
Bank05_L822E:  BPL $8232
Bank05_L8230:  LSR 
Bank05_L8231:  LSR 
Bank05_L8232:  LSR 
Bank05_L8233:  LDA $0408,X
Bank05_L8236:  ROL 
Bank05_L8237:  ASL 
Bank05_L8238:  TAY 
Bank05_L8239:  LDA $96DB,Y
Bank05_L823C:  STA $81
Bank05_L823E:  LDA $96DC,Y
Bank05_L8241:  STA $82
Bank05_L8243:  RTS

Bank05_L8244:  JSR $80B0
Bank05_L8247:  BPL $824C
Bank05_L8249:  JMP $833F
Bank05_L824C:  LDA $0405,X
Bank05_L824F:  AND #$20
Bank05_L8251:  EOR #$20
Bank05_L8253:  BEQ $82A2
Bank05_L8255:  JSR $822B
Bank05_L8258:  LDY EnCounter,X
Bank05_L825B:  LDA ($81),Y
Bank05_L825D:  CMP #$F0
Bank05_L825F:  BCC $827F
Bank05_L8261:  CMP #$FA
Bank05_L8263:  BEQ $827C
Bank05_L8265:  CMP #$FB
Bank05_L8267:  BEQ $82B0
Bank05_L8269:  CMP #$FC
Bank05_L826B:  BEQ $82B3
Bank05_L826D:  CMP #$FD
Bank05_L826F:  BEQ $82A5
Bank05_L8271:  CMP #$FE
Bank05_L8273:  BEQ $82DE
Bank05_L8275:  LDA #$00
Bank05_L8277:  STA EnCounter,X
Bank05_L827A:  BEQ $8258
Bank05_L827C:  JMP $8312
Bank05_L827F:  SEC 
Bank05_L8280:  SBC EnDelay,X
Bank05_L8283:  BNE $8290
Bank05_L8285:  STA EnDelay,X
Bank05_L8288:  INY 
Bank05_L8289:  INY 
Bank05_L828A:  TYA 
Bank05_L828B:  STA EnCounter,X
Bank05_L828E:  BNE $825B
Bank05_L8290:  INC EnDelay,X
Bank05_L8293:  INY 
Bank05_L8294:  LDA ($81),Y
Bank05_L8296:  ASL 
Bank05_L8297:  PHP 
Bank05_L8298:  JSR Adiv32          ;($C2BE)Divide by 32.
Bank05_L829B:  PLP 
Bank05_L829C:  BCC $82A2
Bank05_L829E:  EOR #$FF
Bank05_L82A0:  ADC #$00
Bank05_L82A2:  STA $00
Bank05_L82A4:  RTS

Bank05_L82A5:  INC EnCounter,X
Bank05_L82A8:  INY 
Bank05_L82A9:  LDA #$00
Bank05_L82AB:  STA $6B01,X
Bank05_L82AE:  BEQ $825B
Bank05_L82B0:  PLA 
Bank05_L82B1:  PLA 
Bank05_L82B2:  RTS

Bank05_L82B3:  LDA $6B03,X
Bank05_L82B6:  BPL $82BE
Bank05_L82B8:  JSR GrowRadiusY
Bank05_L82BB:  JMP $82C3
Bank05_L82BE:  BEQ $82D2
Bank05_L82C0:  JSR ShrinkRadiusY
Bank05_L82C3:  LDX PageIndex
Bank05_L82C5:  BCS $82D2
Bank05_L82C7:  LDY EnCounter,X
Bank05_L82CA:  INY 
Bank05_L82CB:  LDA #$00
Bank05_L82CD:  STA $6B03,X
Bank05_L82D0:  BEQ $82D7
Bank05_L82D2:  LDY EnCounter,X
Bank05_L82D5:  DEY 
Bank05_L82D6:  DEY 
Bank05_L82D7:  TYA 
Bank05_L82D8:  STA EnCounter,X
Bank05_L82DB:  JMP $825B
Bank05_L82DE:  DEY 
Bank05_L82DF:  DEY 
Bank05_L82E0:  TYA 
Bank05_L82E1:  STA EnCounter,X
Bank05_L82E4:  LDA $6B03,X
Bank05_L82E7:  BPL $82EF
Bank05_L82E9:  JSR GrowRadiusY
Bank05_L82EC:  JMP $82F4
Bank05_L82EF:  BEQ $82FB
Bank05_L82F1:  JSR ShrinkRadiusY
Bank05_L82F4:  LDX PageIndex
Bank05_L82F6:  BCC $82FB
Bank05_L82F8:  JMP $8258
Bank05_L82FB:  LDY EnDataIndex,X
Bank05_L82FE:  LDA $968B,Y
Bank05_L8301:  AND #$20
Bank05_L8303:  BEQ $8312
Bank05_L8305:  LDA $0405,X
Bank05_L8308:  EOR #$05
Bank05_L830A:  ORA $968B,Y
Bank05_L830D:  AND #$1F
Bank05_L830F:  STA $0405,X
Bank05_L8312:  JSR $81B1
Bank05_L8315:  JMP $82A2
Bank05_L8318:  JSR $80B0
Bank05_L831B:  BPL $8320
Bank05_L831D:  JMP $8395
Bank05_L8320:  LDA $0405,X
Bank05_L8323:  AND #$20
Bank05_L8325:  EOR #$20
Bank05_L8327:  BEQ $833C
Bank05_L8329:  LDY EnCounter,X
Bank05_L832C:  INY 
Bank05_L832D:  LDA ($81),Y
Bank05_L832F:  TAX 
Bank05_L8330:  AND #$08
Bank05_L8332:  PHP 
Bank05_L8333:  TXA 
Bank05_L8334:  AND #$07
Bank05_L8336:  PLP 
Bank05_L8337:  BEQ $833C
Bank05_L8339:  JSR TwosCompliment
Bank05_L833C:  STA $00
Bank05_L833E:  RTS

Bank05_L833F:  LDY #$0E
Bank05_L8341:  LDA $6AFE,X
Bank05_L8344:  BMI $835E
Bank05_L8346:  CLC 
Bank05_L8347:  ADC EnCounter,X
Bank05_L834A:  STA EnCounter,X
Bank05_L834D:  LDA $0402,X
Bank05_L8350:  ADC #$00
Bank05_L8352:  STA $0402,X
Bank05_L8355:  BPL $8376
Bank05_L8357:  JSR TwosCompliment
Bank05_L835A:  LDY #$F2
Bank05_L835C:  BNE $8376
Bank05_L835E:  JSR TwosCompliment
Bank05_L8361:  SEC 
Bank05_L8362:  STA $00
Bank05_L8364:  LDA EnCounter,X
Bank05_L8367:  SBC $00
Bank05_L8369:  STA EnCounter,X
Bank05_L836C:  LDA $0402,X
Bank05_L836F:  SBC #$00
Bank05_L8371:  STA $0402,X
Bank05_L8374:  BMI $8357
Bank05_L8376:  CMP #$0E
Bank05_L8378:  BCC $8383
Bank05_L837A:  LDA #$00
Bank05_L837C:  STA EnCounter,X
Bank05_L837F:  TYA 
Bank05_L8380:  STA $0402,X
Bank05_L8383:  LDA $6AFC,X
Bank05_L8386:  CLC 
Bank05_L8387:  ADC EnCounter,X
Bank05_L838A:  STA $6AFC,X
Bank05_L838D:  LDA #$00
Bank05_L838F:  ADC $0402,X
Bank05_L8392:  STA $00
Bank05_L8394:  RTS

Bank05_L8395:  LDA #$00
Bank05_L8397:  STA $00
Bank05_L8399:  STA $02
Bank05_L839B:  LDA #$0E
Bank05_L839D:  STA $01
Bank05_L839F:  STA $03
Bank05_L83A1:  LDA $0407,X
Bank05_L83A4:  CLC 
Bank05_L83A5:  ADC $6AFF,X
Bank05_L83A8:  STA $0407,X
Bank05_L83AB:  STA $04
Bank05_L83AD:  LDA #$00
Bank05_L83AF:  LDY $6AFF,X
Bank05_L83B2:  BPL $83B6
Bank05_L83B4:  LDA #$FF
Bank05_L83B6:  ADC $0403,X
Bank05_L83B9:  STA $0403,X
Bank05_L83BC:  TAY 
Bank05_L83BD:  BPL $83D0
Bank05_L83BF:  LDA #$00
Bank05_L83C1:  SEC 
Bank05_L83C2:  SBC $0407,X
Bank05_L83C5:  STA $04
Bank05_L83C7:  LDA #$00
Bank05_L83C9:  SBC $0403,X
Bank05_L83CC:  TAY 
Bank05_L83CD:  JSR LE449
Bank05_L83D0:  LDA $04
Bank05_L83D2:  CMP $02
Bank05_L83D4:  TYA 
Bank05_L83D5:  SBC $03
Bank05_L83D7:  BCC $83E3
Bank05_L83D9:  LDA $00
Bank05_L83DB:  STA $0407,X
Bank05_L83DE:  LDA $01
Bank05_L83E0:  STA $0403,X
Bank05_L83E3:  LDA $6AFD,X
Bank05_L83E6:  CLC 
Bank05_L83E7:  ADC $0407,X
Bank05_L83EA:  STA $6AFD,X
Bank05_L83ED:  LDA #$00
Bank05_L83EF:  ADC $0403,X
Bank05_L83F2:  STA $00
Bank05_L83F4:  RTS

Bank05_L83F5:  LDX PageIndex
Bank05_L83F7:  LDA EnYRoomPos,X
Bank05_L83FA:  SEC 
Bank05_L83FB:  SBC EnRadY,X
Bank05_L83FE:  AND #$07
Bank05_L8400:  SEC 
Bank05_L8401:  BNE $8406
Bank05_L8403:  JSR GrowRadiusY
Bank05_L8406:  LDY #$00
Bank05_L8408:  STY $00
Bank05_L840A:  LDX PageIndex
Bank05_L840C:  BCC $844A
Bank05_L840E:  INC $00
Bank05_L8410:  LDY EnYRoomPos,X
Bank05_L8413:  BNE $8429
Bank05_L8415:  LDY #$F0
Bank05_L8417:  LDA $49
Bank05_L8419:  CMP #$02
Bank05_L841B:  BCS $8429
Bank05_L841D:  LDA $FC
Bank05_L841F:  BEQ $844A
Bank05_L8421:  JSR $8563
Bank05_L8424:  BEQ $844A
Bank05_L8426:  JSR $855A
Bank05_L8429:  DEY 
Bank05_L842A:  TYA 
Bank05_L842B:  STA EnYRoomPos,X
Bank05_L842E:  CMP EnRadY,X
Bank05_L8431:  BNE $8441
Bank05_L8433:  LDA $FC
Bank05_L8435:  BEQ $843C
Bank05_L8437:  JSR $8563
Bank05_L843A:  BNE $8441
Bank05_L843C:  INC EnYRoomPos,X
Bank05_L843F:  CLC 
Bank05_L8440:  RTS

Bank05_L8441:  LDA $0405,X
Bank05_L8444:  BMI $8449
Bank05_L8446:  INC $6B01,X
Bank05_L8449:  SEC 
Bank05_L844A:  RTS

Bank05_L844B:  LDX PageIndex
Bank05_L844D:  LDA EnYRoomPos,X
Bank05_L8450:  CLC 
Bank05_L8451:  ADC EnRadY,X
Bank05_L8454:  AND #$07
Bank05_L8456:  SEC 
Bank05_L8457:  BNE $845C
Bank05_L8459:  JSR ShrinkRadiusY
Bank05_L845C:  LDY #$00
Bank05_L845E:  STY $00
Bank05_L8460:  LDX PageIndex
Bank05_L8462:  BCC $84A6
Bank05_L8464:  INC $00
Bank05_L8466:  LDY EnYRoomPos,X
Bank05_L8469:  CPY #$EF
Bank05_L846B:  BNE $8481
Bank05_L846D:  LDY #$FF
Bank05_L846F:  LDA $49
Bank05_L8471:  CMP #$02
Bank05_L8473:  BCS $8481
Bank05_L8475:  LDA $FC
Bank05_L8477:  BEQ $84A6
Bank05_L8479:  JSR $8563
Bank05_L847C:  BNE $84A6
Bank05_L847E:  JSR $855A
Bank05_L8481:  INY 
Bank05_L8482:  TYA 
Bank05_L8483:  STA EnYRoomPos,X
Bank05_L8486:  CLC 
Bank05_L8487:  ADC EnRadY,X
Bank05_L848A:  CMP #$EF
Bank05_L848C:  BNE $849D
Bank05_L848E:  LDA $FC
Bank05_L8490:  BEQ $8497
Bank05_L8492:  JSR $8563
Bank05_L8495:  BEQ $849D
Bank05_L8497:  DEC EnYRoomPos,X
Bank05_L849A:  CLC 
Bank05_L849B:  BCC $84A6
Bank05_L849D:  LDA $0405,X
Bank05_L84A0:  BMI $84A5
Bank05_L84A2:  DEC $6B01,X
Bank05_L84A5:  SEC 
Bank05_L84A6:  RTS

Bank05_L84A7:  LDX PageIndex
Bank05_L84A9:  LDA EnXRoomPos,X
Bank05_L84AC:  SEC 
Bank05_L84AD:  SBC EnRadX,X
Bank05_L84B0:  AND #$07
Bank05_L84B2:  SEC 
Bank05_L84B3:  BNE $84B8
Bank05_L84B5:  JSR GrowRadiusX
Bank05_L84B8:  LDY #$00
Bank05_L84BA:  STY $00
Bank05_L84BC:  LDX PageIndex
Bank05_L84BE:  BCC $84FD
Bank05_L84C0:  INC $00
Bank05_L84C2:  LDY EnXRoomPos,X
Bank05_L84C5:  BNE $84DA
Bank05_L84C7:  LDA $49
Bank05_L84C9:  CMP #$02
Bank05_L84CB:  BCC $84DA
Bank05_L84CD:  LDA $FD
Bank05_L84CF:  BEQ $84D4
Bank05_L84D1:  JSR $8563
Bank05_L84D4:  CLC 
Bank05_L84D5:  BEQ $84FD
Bank05_L84D7:  JSR $855A
Bank05_L84DA:  DEC EnXRoomPos,X
Bank05_L84DD:  LDA EnXRoomPos,X
Bank05_L84E0:  CMP EnRadX,X
Bank05_L84E3:  BNE $84F4
Bank05_L84E5:  LDA $FD
Bank05_L84E7:  BEQ $84EE
Bank05_L84E9:  JSR $8563
Bank05_L84EC:  BNE $84F4
Bank05_L84EE:  INC EnXRoomPos,X
Bank05_L84F1:  CLC 
Bank05_L84F2:  BCC $84FD
Bank05_L84F4:  LDA $0405,X
Bank05_L84F7:  BPL $84FC
Bank05_L84F9:  INC $6B01,X
Bank05_L84FC:  SEC 
Bank05_L84FD:  RTS

Bank05_L84FE:  LDX PageIndex
Bank05_L8500:  LDA EnXRoomPos,X
Bank05_L8503:  CLC 
Bank05_L8504:  ADC EnRadX,X
Bank05_L8507:  AND #$07
Bank05_L8509:  SEC 
Bank05_L850A:  BNE $850F
Bank05_L850C:  JSR ShrinkRadiusX
Bank05_L850F:  LDY #$00
Bank05_L8511:  STY $00
Bank05_L8513:  LDX PageIndex
Bank05_L8515:  BCC $8559
Bank05_L8517:  INC $00
Bank05_L8519:  INC EnXRoomPos,X
Bank05_L851C:  BNE $8536
Bank05_L851E:  LDA $49
Bank05_L8520:  CMP #$02
Bank05_L8522:  BCC $8536
Bank05_L8524:  LDA $FD
Bank05_L8526:  BEQ $852D
Bank05_L8528:  JSR $8563
Bank05_L852B:  BEQ $8533
Bank05_L852D:  DEC EnXRoomPos,X
Bank05_L8530:  CLC 
Bank05_L8531:  BCC $8559
Bank05_L8533:  JSR $855A
Bank05_L8536:  LDA EnXRoomPos,X
Bank05_L8539:  CLC 
Bank05_L853A:  ADC EnRadX,X
Bank05_L853D:  CMP #$FF
Bank05_L853F:  BNE $8550
Bank05_L8541:  LDA $FD
Bank05_L8543:  BEQ $854A
Bank05_L8545:  JSR $8563
Bank05_L8548:  BEQ $8550
Bank05_L854A:  DEC EnXRoomPos,X
Bank05_L854D:  CLC 
Bank05_L854E:  BCC $8559
Bank05_L8550:  LDA $0405,X
Bank05_L8553:  BPL $8558
Bank05_L8555:  DEC $6B01,X
Bank05_L8558:  SEC 
Bank05_L8559:  RTS

Bank05_L855A:  LDA EnNameTable,X
Bank05_L855D:  EOR #$01
Bank05_L855F:  STA EnNameTable,X
Bank05_L8562:  RTS

Bank05_L8563:  LDA EnNameTable,X
Bank05_L8566:  EOR $FF
Bank05_L8568:  AND #$01
Bank05_L856A:  RTS

Bank05_L856B:  EOR $0405,X
Bank05_L856E:  STA $0405,X
Bank05_L8571:  RTS 

;---------------------------------[ Object animation data tables ]----------------------------------

;The following tables are indices into the FramePtrTable that correspond to various animations. The
;FramePtrTable represents individual frames and the entries in ObjectAnimIdxTbl are the groups of
;frames responsible for animaton Samus, her weapons and other objects.

.checkpc ObjectAnimIdxTbl
.advance ObjectAnimIdxTbl

;Samus run animation.
Bank05_L8572:  .byte $03, $04, $05, $00

;Samus front animation.
Bank05_L8576:  .byte $07, $00

;Samus jump out of ball animation.
Bank05_L8578:  .byte $17

;Samus Stand animation.
Bank05_L8579:  .byte $08, $00

;Samus stand and fire animation.
Bank05_L857B:  .byte $22, $00

;Samus stand and jump animation.
Bank05_L857D:  .byte $04

;Samus Jump animation.
Bank05_L857E:  .byte $10, $00

;Samus summersault animation.
Bank05_L8580:  .byte $17, $18, $19, $1A, $00

;Samus run and jump animation.
Bank05_L8585:  .byte $03, $17, $00

;Samus roll animation.
Bank05_L8588:  .byte $1E, $1D, $1C, $1B, $00

;Bullet animation.
Bank05_L858D:  .byte $28, $00

;Bullet hit animation.
Bank05_L858F:  .byte $2A, $F7, $00

;Samus jump and fire animation.
Bank05_L8592:  .byte $12, $00

;Samus run and fire animation.
Bank05_L8594:  .byte $0C, $0D, $0E, $00

;Samus point up and shoot animation.
Bank05_L8598:  .byte $30 

;Samus point up animation.
Bank05_L8599:  .byte $2B, $00

;Door open animation.
Bank05_L859B:  .byte $31, $31, $33, $F7, $00

;Door close animation.
Bank05_L85A0:  .byte $33, $33, $31, $00

;Samus explode animation.
Bank05_L85A4: .byte $35, $00

;Samus jump and point up animation.
Bank05_L85A6: .byte $39, $38, $00

;Samus run and point up animation.
Bank05_L85A9:  .byte $40, $41, $42, $00

;Samus run, point up and shoot animation 1.
Bank05_L85AD:  .byte $46, $00

;Samus run, point up and shoot animation 2.
Bank05_L85AF:  .byte $47, $00

;Samus run, point up and shoot animation 3.
Bank05_L85B1:  .byte $48, $00

;Samus on elevator animation 1.
Bank05_L85B3:  .byte $07, $F7, $F7, $07, $F7, $F7, $F7, $07, $F7, $F7, $F7, $F7, $07, $F7, $00

;Samus on elevator animation 2.
Bank05_L85C2:  .byte $23, $F7, $F7, $23, $F7, $F7, $F7, $23, $F7, $F7, $F7, $F7, $23, $F7, $00

;Samus on elevator animation 3.
Bank05_L85D1:  .byte $07, $F7, $F7, $F7, $F7, $07, $F7, $F7, $F7, $07, $F7, $F7, $07, $F7, $00

;Samus on elevator animation 4.
Bank05_L85E0:  .byte $23, $F7, $F7, $F7, $F7, $23, $F7, $F7, $F7, $23, $F7, $F7, $23, $F7, $00

;Wave beam animation.
Bank05_L85EF:  .byte $4B, $00

;Bomb tick animation.
Bank05_L85F1:  .byte $4E, $4F, $00

;Bomb explode animation.
Bank05_L85F4:  .byte $3C, $4A, $49, $4A, $4D, $4A, $4D, $F7, $00

;Missile left animation.
Bank05_L85FD:  .byte $26, $00

;Missile right animation.
Bank05_L85FF:  .byte $25, $00

;Missile up animation.
Bank05_L8601:  .byte $27, $00

;Missile explode animation.
Bank05_L8603:  .byte $67, $67, $67, $68, $68, $69, $F7, $00

;----------------------------[ Sprite drawing pointer tables ]--------------------------------------

;The above animation pointers provide an index into the following table
;for the animation sequences.

.checkpc FramePtrTable
.advance FramePtrTable

Bank05_L860B:  .word $87CB, $87CB, $87CB, $87CB, $87DD, $87F0, $8802, $8802
Bank05_L861B:  .word $8818, $882C, $882C, $882C, $882C, $883E, $8851, $8863
Bank05_L862B:  .word $8863, $8874, $8874, $8885, $8885, $8885, $8885, $8885
Bank05_L863B:  .word $888F, $8899, $88A3, $88AD, $88B8, $88C3, $88CE, $88D9
Bank05_L864B:  .word $88D9, $88D9, $88D9, $88EE, $88F8, $88F8, $88FE, $8904
Bank05_L865B:  .word $890A, $890F, $890F, $8914, $8928, $8928, $8928, $8928
Bank05_L866B:  .word $8928, $893C, $8948, $8948, $8954, $8954, $8961, $8961
Bank05_L867B:  .word $8961, $8974, $8987, $8987, $8987, $8995, $8995, $8995
Bank05_L868B:  .word $8995, $89A9, $89BE, $89D2, $89D2, $89D2, $89D2, $89E6
Bank05_L869B:  .word $89FB, $8A0F, $8A1D, $8A21, $8A26, $8A26, $8A3C, $8A41
Bank05_L86AB:  .word $8A46, $8A4E, $8A56, $8A5E, $8A66, $8A6E, $8A76, $8A7E
Bank05_L86BB:  .word $8A86, $8A8E, $8A9C, $8AA1, $8AA6, $8AAE, $8ABA, $8AC4
Bank05_L86CB:  .word $8AC4, $8AC4, $8AC4, $8AC4, $8AC4, $8AC4, $8AD8, $8AE9
Bank05_L86DB:  .word $8AF3, $8B03

;The following table provides pointers to data used for the placement of the sprites that make up
;Samus and other non-enemy objects.

.checkpc PlacePtrTable
.advance PlacePtrTable

Bank05_L86DF:  .word $8701, $871F, $872B, $8737, $8747, $8751, $86FD, $875D
Bank05_L86EF:  .word $8775, $878D, $8791, $8799, $87A5, $8749, $87B1

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
Bank05_L86FD:  .byte $E8, $FC, $EA, $FC

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
Bank05_L8701:  .byte $F0, $F8, $F0, $00, $F8, $F0, $F8, $F8, $F8, $00, $00, $F8, $00, $00, $00, $08
;              +--8--+   +--9--+   +--A--+   +--B--+   +--C--+   +--D--+   +--E--+
Bank05_L8711:  .byte $08, $F8, $08, $00, $08, $08, $F8, $F4, $F8, $F6, $EC, $F4, $EE, $F4

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
Bank05_L871F:  .byte $F3, $F8, $F3, $00, $FB, $F8, $FB, $00, $03, $F8, $03, $00 

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
Bank05_L872B:  .byte $F8, $F6, $F8, $FE, $F8, $06, $00, $F6, $00, $FE, $00, $06

;Elevator frame.
;          +--------+--------+--------+--------+--------+--------+--------+--------+
;          |        |        |        |        |        |        |        |        |
;          |        |        |        |        |        |        |        |        |
;          |        |        *        |        |        |        |        |        |
;          |       0|       1|       2|       3|       4|       5|       6|       7|
;          +--------+--------+--------+--------+--------+--------+--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+   +--4--+   +--5--+   +--6--+   +--7--+
Bank05_L8737:  .byte $FC, $F0, $FC, $F8, $FC, $00, $FC, $08, $FC, $10, $FC, $18, $FC, $20, $FC, $28

;Several projectile frames.
;          +--------+
;          |        |
;          |        |
;          |    *   |
;          |       0|
;          +--------+
;              +--0--+
Bank05_L8747:  .byte $FC, $FC

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
Bank05_L8749:  .byte $F8, $F8, $F8, $00, $00, $F8, $00, $00

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
Bank05_L8751:  .byte $E8, $00, $F0, $00, $F8, $00, $00, $00, $08, $00, $10, $00 

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
Bank05_L875D:  .byte $80, $80, $81, $81, $82, $82, $83, $83, $84, $84, $85, $85, $F4, $F8, $F4, $00
;              +--2--+   +--3--+   +--4--+   +--5--+
Bank05_L876D:  .byte $FC, $F8, $FC, $00, $04, $F8, $04, $00

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
Bank05_L8775:  .byte $F0, $00, $F0, $08, $F8, $08, $F0, $F0, $F0, $F8, $F8, $F0, $00, $F0, $08, $F0
;              +--8--+   +--9--+   +--A--+   +--B--+
Bank05_L8785:  .byte $08, $F8, $00, $08, $08, $00, $08, $08

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
Bank05_L878D:  .byte $F8, $FC, $00, $FC

;Missile left/right and missile explode frames.
;          +--------+--------+        +--------+--------+
;          |        |        |        |        |        |
;          |        |        |        |        |        |
;          |        *        |        |        |        |
;          |       0|       1|        |       2|       3|
;          +--------+--------+        +--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+
Bank05_L8791:  .byte $FC, $F8, $FC, $00, $FC, $10, $FC, $18

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
Bank05_L8799:  .byte $FC, $F0, $F4, $F8, $F4, $00, $FC, $08, $04, $F8, $04, $00

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
Bank05_L87A5:  .byte $FC, $E8, $EC, $F0, $EC, $08, $FC, $10, $0C, $F0, $0C, $08

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
Bank05_L87B1:  .byte $00, $F8, $00, $00, $08, $F8, $08, $00, $E8, $F0, $E8, $F8, $E8, $00, $F0, $F0
;              +--8--+   +--9--+   +--A--+   +--B--+   +--C--+
Bank05_L87C1:  .byte $F0, $F8, $F0, $00, $F8, $F0, $F8, $F8, $F8, $00

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
Bank05_L87CB:  .byte $40, $0F, $04, $00, $01, $FD, $20, $FE, $41, $40, $FD, $60, $20, $21, $FE, $FE
Bank05_L87DB:  .byte $31, $FF

;Samus run.
Bank05_L87DD:  .byte $40, $0F, $04, $02, $03, $FD, $20, $FE, $43, $42, $FD, $60, $22, $23, $FE, $32
Bank05_L87ED:  .byte $33, $34, $FF

;Samus run.
Bank05_L87F0:  .byte $40, $0F, $04, $05, $06, $FD, $20, $FE, $45, $44, $FD, $60, $25, $26, $27, $35
Bank05_L8800:  .byte $36, $FF

;Samus facing forward.
Bank05_L8802:  .byte $00, $0F, $04, $09, $FD, $60, $09, $FD, $20, $FE, $19, $1A, $FD, $20, $29, $2A
Bank05_L8812:  .byte $FE, $39, $FD, $60, $39, $FF

;Samus stand.
Bank05_L8818:  .byte $40, $0F, $04, $FD, $20, $0E, $0D, $FE, $1E, $1D, $2E, $2D, $FE, $FD, $60, $3B
Bank05_L8828:  .byte $3C, $FE, $17, $FF

;Samus run and fire.
Bank05_L882C:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $20, $21, $FE, $FE
Bank05_L883C:  .byte $31, $FF

;Samus run and fire.
Bank05_L883E:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $22, $23, $FE, $32
Bank05_L884E:  .byte $33, $34, $FF

;Samus run and fire.
Bank05_L8851:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $25, $26, $27, $35
Bank05_L8861:  .byte $36, $FF

;Samus stand and jump.
Bank05_L8863:  .byte $40, $0F, $04, $00, $01, $FD, $20, $FE, $41, $40, $FD, $60, $22, $07, $08, $32
Bank05_L8873:  .byte $FF

;Samus jump and fire.
Bank05_L8874:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $22, $07, $08, $32
Bank05_L8884:  .byte $FF

;Samus summersault.
Bank05_L8885:  .byte $41, $0F, $04, $52, $53, $62, $63, $72, $73, $FF

;Samus summersault.
Bank05_L888F:  .byte $42, $0F, $04, $54, $55, $56, $64, $65, $66, $FF

;Samus summersault.
Bank05_L8899:  .byte $81, $0F, $04, $52, $53, $62, $63, $72, $73, $FF

;Samus summersault.
Bank05_L88A3:  .byte $82, $0F, $04, $54, $55, $56, $64, $65, $66, $FF

;Samus roll.
Bank05_L88AD:  .byte $01, $08, $04, $FC, $03, $00, $50, $51, $60, $61, $FF

;Samus roll.
Bank05_L88B8:  .byte $81, $08, $04, $FC, $FD, $00, $50, $51, $60, $61, $FF

;Samus roll.
Bank05_L88C3:  .byte $C1, $08, $04, $FC, $FD, $00, $50, $51, $60, $61, $FF

;Samus roll.
Bank05_L88CE:  .byte $41, $08, $04, $FC, $03, $00, $50, $51, $60, $61, $FF

;Samus stand and fire.
Bank05_L88D9:  .byte $40, $0F, $04, $FD, $20, $0E, $0D, $FE, $1E, $1D, $2E, $2D, $FE, $FD, $60, $3B
Bank05_L88E9:  .byte $3C, $FE, $FE, $17, $FF

;Elevator.
Bank05_L88EE:  .byte $03, $04, $10, $28, $38, $38, $FD, $60, $28, $FF

;Missile right.
Bank05_L88F8:  .byte $4A, $04, $08, $5E, $5F, $FF

;Missile left.
Bank05_L88FE:  .byte $0A, $04, $08, $5E, $5F, $FF

;Missile up.
Bank05_L8904:  .byte $09, $08, $04, $14, $24, $FF

;Bullet fire.
Bank05_L890A:  .byte $04, $02, $02, $30, $FF

;Bullet hit.
Bank05_L890F:  .byte $04, $00, $00, $04, $FF

;Samus stand and point up.
Bank05_L8914:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $2E, $2D, $FE, $FD
Bank05_L8924:  .byte $60, $3B, $3C, $FF

;Samus from ball to pointing up.
Bank05_L8928:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $2E, $2D, $FE, $FD
Bank05_L8938:  .byte $60, $3B, $3C, $FF

;Door closed.
Bank05_L893C:  .byte $35, $18, $08, $0F, $1F, $2F, $FD, $A3, $2F, $1F, $0F, $FF

;Door open/close.
Bank05_L8948:  .byte $35, $18, $04, $6A, $6B, $6C, $FD, $A3, $6C, $6B, $6A, $FF

;Samus explode.
Bank05_L8954:  .byte $07, $00, $00, $FC, $FC, $00, $0B, $0C, $1B, $1C, $2B, $2C, $FF

;Samus jump and point up.
Bank05_L8961:  .byte $46, $0F, $04, $69, $FD, $20, $FE, $7A, $79, $FE, $78, $77, $FD, $60, $22, $07
Bank05_L8971:  .byte $08, $32, $FF

;Samus jump and point up.
Bank05_L8974:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $07
Bank05_L8984:  .byte $08, $32, $FF

;Bomb explode.
Bank05_L8987:  .byte $0D, $0C, $0C, $74, $FD, $60, $74, $FD, $A0, $74, $FD, $E0, $74, $FF

;Samus run and point up.
Bank05_L8995:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $20, $21
Bank05_L89A5:  .byte $FE, $FE, $31, $FF

;Samus run and point up.
Bank05_L89A9:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $23
Bank05_L89B9:  .byte $FE, $32, $33, $34, $FF

;Samus run and point up.
Bank05_L89BE:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $25, $26
Bank05_L89CE:  .byte $27, $35, $36, $FF

;Samus run and point up.
Bank05_L89D2:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $20, $21
Bank05_L89E2:  .byte $FE, $FE, $31, $FF

;Samus point up, run and fire.
Bank05_L89E6:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $23
Bank05_L89F6:  .byte $FE, $32, $33, $34, $FF

;Samus point up, run and fire.
Bank05_L89FB:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $25, $26
Bank05_L8A0B:  .byte $27, $35, $36, $FF

;Bomb explode.
Bank05_L8A0F:  .byte $0D, $0C, $0C, $75, $FD, $60, $75, $FD, $A0, $75, $FD, $E0, $75, $FF

;Bomb explode.
Bank05_L8A1D:  .byte $00, $00, $00, $FF

;Wave beam.
Bank05_L8A21:  .byte $04, $04, $04, $4C, $FF

;Bomb explode.
Bank05_L8A26:  .byte $08, $10, $10, $3D, $3E, $4E, $FD, $60, $3E, $3D, $4E, $FD, $E0, $4E, $3E, $3D
Bank05_L8A36:  .byte $FD, $A0, $4E, $3D, $3E, $FF

;Bomb tick.
Bank05_L8A3C:  .byte $04, $04, $04, $70, $FF

;Bomb tick.
Bank05_L8A41:  .byte $04, $04, $04, $71, $FF

;Bomb item.
Bank05_L8A46:  .byte $0D, $03, $03, $86, $87, $96, $97, $FF

;High jump item.
Bank05_L8A4E:  .byte $0D, $03, $03, $7B, $7C, $8B, $8C, $FF

;Long beam item.
Bank05_L8A56:  .byte $0D, $03, $03, $88, $67, $98, $99, $FF

;Screw attack item.
Bank05_L8A5E:  .byte $0D, $03, $03, $80, $81, $90, $91, $FF

;Maru Mari item.
Bank05_L8A66:  .byte $0D, $03, $03, $7D, $7E, $8D, $8E, $FF

;Varia item.
Bank05_L8A6E:  .byte $0D, $03, $03, $82, $83, $92, $93, $FF

;Wave beam item.
Bank05_L8A76:  .byte $0D, $03, $03, $88, $89, $98, $99, $FF

;Ice beam item.
Bank05_L8A7E:  .byte $0D, $03, $03, $88, $68, $98, $99, $FF

;Energy tank item.
Bank05_L8A86:  .byte $0D, $03, $03, $84, $85, $94, $95, $FF

;Missile item.
Bank05_L8A8E:  .byte $0D, $03, $03, $3F, $FD, $40, $3F, $FD, $00, $4F, $FD, $40, $4F, $FF

;Skree burrow.
Bank05_L8A9C:  .byte $34, $04, $04, $F2, $FF

;Not used.
Bank05_L8AA1:  .byte $04, $00, $00, $5A, $FF, $13, $00, $00, $B0, $B1, $B2, $B3, $FF, $13, $00, $00
Bank05_L8AB1:  .byte $B4, $B5, $B6, $B7, $B8, $B6, $B9, $B3, $FF, $13, $00, $00, $B3, $BA, $BA, $FE
Bank05_L8AC1:  .byte $80, $80, $FF

;Kraid statue.
Bank05_L8AC4:  .byte $1E, $00, $08, $FA, $FB, $FA, $FB, $FC, $00, $04, $C5, $C6, $C7, $D5, $D6, $D7
Bank05_L8AD4:  .byte $E5, $E6, $E7, $FF

;Ridley statue.
Bank05_L8AD8:  .byte $1E, $00, $08, $FA, $FB, $FA, $FB, $FE, $C8, $C9, $EB, $D8, $D9, $EA, $E8, $E9
Bank05_L8AE8:  .byte $FF

;Missile explode.
Bank05_L8AE9:  .byte $0A, $04, $08, $FD, $00, $57, $FD, $40, $57, $FF

;Missile explode.
Bank05_L8AF3:  .byte $0B, $04, $0C, $FD, $00, $57, $18, $FD, $40, $18, $57, $FD, $C0, $18, $18, $FF

;Missile explode.
Bank05_L8B03:  .byte $0C, $04, $10, $FD, $00, $57, $18, $FD, $40, $18, $57, $FD, $C0, $18, $18, $FF

;------------------------------------[ Samus enter door routines ]-----------------------------------

;This function is called once when Samus first enters a door.

.checkpc SamusEnterDoor
.advance SamusEnterDoor

Bank05_L8B13:  LDA DoorStatus          ;The code determines if Samus has entered a door if the-->
Bank05_L8B15:  BNE ++++                ;door status is 0, but door data information has been-->
Bank05_L8B17:  LDY SamusDoorData       ;written. If both conditions are met, Samus has just-->
Bank05_L8B19:  BEQ ++++                ;entered a door.
Bank05_L8B1B:  STA CrntMslePickups     ;
Bank05_L8B1D:  STA CrntEnrgyPickups    ;Reset current missile and energy power-up counters.
Bank05_L8B1F:  LDA RandomNumber1       ;
Bank05_L8B21:  AND #$0F                ;Randomly recalculate max missile pickups(16 max, 0 min).
Bank05_L8B23:  STA MaxMissilePickup    ;
Bank05_L8B25:  ASL                     ;
Bank05_L8B26:  ORA #$40                ;*2 for energy pickups and set bit 6(128 max, 64 min).
Bank05_L8B28:  STA MaxEnergyPickup     ;
Bank05_L8B2A:  LDA PPUCNT0ZP           ;
Bank05_L8B2C:  EOR #$01                ;
Bank05_L8B2E:  AND #$01                ;Erase name table door data for new room.
Bank05_L8B30:  TAY                     ;
Bank05_L8B31:  LSR                     ;
Bank05_L8B32:  STA $006C,Y             ;
Bank05_L8B35:  LDA ScrollDir           ;
Bank05_L8B37:  AND #$02                ;Is Samus scrolling horizontally?-->
Bank05_L8B39:  BNE +                   ;If so, branch.
Bank05_L8B3B:  LDX #$04                ;Samus currently scrolling vertically.
Bank05_L8B3D:  LDA ScrollY             ;Is room centered on screen?-->
Bank05_L8B3F:  BEQ +++++               ;If so, branch.
Bank05_L8B41:  LDA $FF                 ;
Bank05_L8B43:  EOR ObjectHi            ;Get inverse of Samus' current nametable.
Bank05_L8B46:  LSR                     ;
Bank05_L8B47:  BCC +++                 ;If Samus is on nametable 3, branch.
Bank05_L8B49:  BCS ++                  ;If Samus is on nametable 0, branch to decrement x.

Bank05_L8B4B:* LDX #$02                ;Samus is currently scrolling horizontally.
Bank05_L8B4D:  LDA ObjectX             ;Is Samus entering a left hand door?-->
Bank05_L8B50:  BPL ++                  ;If so, branch.
Bank05_L8B52:* DEX                     ;

Bank05_SetDoorEntryInfo:
Bank05_L8B53:* TXA                     ;X contains door scroll status and is transferred to A.
Bank05_L8B54:  STA DoorScrollStatus    ;Save door scroll status.
Bank05_L8B56:  JSR Bank05_SamusInDoor         ;($8B74)Indicate Samus just entered a door.
Bank05_L8B59:  LDA #$12                ;
Bank05_L8B5B:  STA DoorDelay           ;Set DoorDelay to 18 frames(going into door).
Bank05_L8B5D:  LDA SamusDoorData       ;
Bank05_L8B5F:  JSR Amul16              ;($C2C5)*16. Move scroll toggle data to upper 4 bits.
Bank05_L8B62:  ORA ObjAction           ;Keep Samus action so she will appear the same comming-->
Bank05_L8B65:  STA SamusDoorData       ;out of the door as she did going in.
Bank05_L8B67:  LDA #$05                ;
Bank05_L8B69:  STA ObjAction           ;Indicate Samus is in a door.
Bank05_L8B6C:* RTS                     ;

Bank05_L8B6D:* JSR Bank05_SetDoorEntryInfo    ;($8B53)Save Samus action and set door entry timer.
Bank05_L8B70:  JSR VertRoomCentered    ;($E21B)Room is centered. Toggle scroll.

Bank05_L8B73:  TXA                     ;X=#$01 or #$02(depending on which door Samus is in).

Bank05_SamusInDoor:
Bank05_L8B74:  ORA #$80                ;Set MSB of DoorStatus to indicate Samus has just-->
Bank05_L8B76:  STA DoorStatus          ;entered a door.
Bank05_L8B78:  RTS                     ;

;----------------------------------------------------------------------------------------------------

.checkpc DoorHandler
.advance DoorHandler

Bank05_L8B79:  LDX #$B0
Bank05_L8B7B:* JSR $8B87
Bank05_L8B7E:  LDA PageIndex
Bank05_L8B80:  SEC 
Bank05_L8B81:  SBC #$10
Bank05_L8B83:  TAX 
Bank05_L8B84:  BMI -
Bank05_L8B86:  RTS

Bank05_L8B87:  STX PageIndex
Bank05_L8B89:  LDA ObjAction,X
Bank05_L8B8C:  JSR ChooseRoutine       ;($C27C)

Bank05_L8B8F:  .word ExitSub
Bank05_L8B91:  .word Bank05_L8B9D
Bank05_L8B93:  .word Bank05_L8BD5
Bank05_L8B95:  .word Bank05_L8C01
Bank05_L8B97:  .word Bank05_L8C84
Bank05_L8B99:  .word $8CC6
Bank05_L8B9B:  .word $8CF0

Bank05_L8B9D:  INC $0300,X
Bank05_L8BA0:  LDA #$30
Bank05_L8BA2:  JSR SetProjectileAnim       ;($D2FA)
Bank05_L8BA5:  JSR $8CFB
Bank05_L8BA8:  LDY $0307,X
Bank05_L8BAB:  LDA _Door_Handler_Table,Y
Bank05_L8BAE:  STA $030F,X
Bank05_L8BB1:  LDA $0307,X
Bank05_L8BB4:  CMP #$03
Bank05_L8BB6:  BNE $8BBA
Bank05_L8BB8:  LDA #$01
Bank05_L8BBA:  ORA #$A0
Bank05_L8BBC:  STA $6B
Bank05_L8BBE:  LDA #$00
Bank05_L8BC0:  STA $030A,X
Bank05_L8BC3:  TXA 
Bank05_L8BC4:  AND #$10
Bank05_L8BC6:  EOR #$10
Bank05_L8BC8:  ORA $6B
Bank05_L8BCA:  STA $6B
Bank05_L8BCC:  LDA #$06
Bank05_L8BCE:  JMP AnimDrawObject

_Door_Handler_Table:
Bank05_L8BD1:  .byte $05, $01, $0A, $01

Bank05_L8BD5:  LDA $030A,X
Bank05_L8BD8:  AND #$04
Bank05_L8BDA:  BEQ $8BB1
Bank05_L8BDC:  DEC $030F,X
Bank05_L8BDF:  BNE $8BB1
Bank05_L8BE1:  LDA #$03
Bank05_L8BE3:  CMP $0307,X
Bank05_L8BE6:  BNE $8BEE
Bank05_L8BE8:  LDY $010B
Bank05_L8BEB:  INY 
Bank05_L8BEC:  BNE $8BB1
Bank05_L8BEE:  STA $0300,X
Bank05_L8BF1:  LDA #$50
Bank05_L8BF3:  STA $030F,X
Bank05_L8BF6:  LDA #$2C
Bank05_L8BF8:  STA $0305,X
Bank05_L8BFB:  SEC 
Bank05_L8BFC:  SBC #$03
Bank05_L8BFE:  JMP $8C7E

Bank05_L8C01:  LDA DoorStatus
Bank05_L8C03:  BEQ $8C1D
Bank05_L8C05:  LDA $030C
Bank05_L8C08:  EOR $030C,X
Bank05_L8C0B:  LSR 
Bank05_L8C0C:  BCS $8C1D
Bank05_L8C0E:  LDA $030E
Bank05_L8C11:  EOR $030E,X
Bank05_L8C14:  BMI $8C1D
Bank05_L8C16:  LDA #$04
Bank05_L8C18:  STA $0300,X
Bank05_L8C1B:  BNE $8C73
Bank05_L8C1D:  LDA $0306,X
Bank05_L8C20:  CMP $0305,X
Bank05_L8C23:  BCC $8C73
Bank05_L8C25:  LDA $030F,X
Bank05_L8C28:  CMP #$50
Bank05_L8C2A:  BNE $8C57
Bank05_L8C2C:  JSR $8CF7
Bank05_L8C2F:  LDA $0307,X
Bank05_L8C32:  CMP #$01
Bank05_L8C34:  BEQ $8C57
Bank05_L8C36:  CMP #$03
Bank05_L8C38:  BEQ $8C57
Bank05_L8C3A:  LDA #$0A
Bank05_L8C3C:  STA $09
Bank05_L8C3E:  LDA $030C,X
Bank05_L8C41:  STA $08
Bank05_L8C43:  LDY $50
Bank05_L8C45:  TXA 
Bank05_L8C46:  JSR Amul16
Bank05_L8C49:  BCC $8C4C
Bank05_L8C4B:  DEY 
Bank05_L8C4C:  TYA 
Bank05_L8C4D:  JSR $DC1E
Bank05_L8C50:  LDA #$00
Bank05_L8C52:  STA $0300,X
Bank05_L8C55:  BEQ $8C73
Bank05_L8C57:  LDA $2D
Bank05_L8C59:  LSR 
Bank05_L8C5A:  BCS $8C73
Bank05_L8C5C:  DEC $030F,X
Bank05_L8C5F:  BNE $8C73
Bank05_L8C61:  LDA #$01
Bank05_L8C63:  STA $030F,X
Bank05_L8C66:  JSR $8CFB
Bank05_L8C69:  LDA #$02
Bank05_L8C6B:  STA $0300,X
Bank05_L8C6E:  JSR $8C76
Bank05_L8C71:  LDX PageIndex
Bank05_L8C73:  JMP $8BB1
Bank05_L8C76:  LDA #$30
Bank05_L8C78:  STA $0305,X
Bank05_L8C7B:  SEC 
Bank05_L8C7C:  SBC #$02
Bank05_L8C7E:  JSR SetProjectileAnimWithoutReset
Bank05_L8C81:  JMP SFXDoor

Bank05_L8C84:  LDA DoorStatus
Bank05_L8C86:  CMP #$05
Bank05_L8C88:  BCS $8CC3
Bank05_L8C8A:  JSR $8CFB
Bank05_L8C8D:  JSR $8C76
Bank05_L8C90:  LDX PageIndex
Bank05_L8C92:  LDA $91
Bank05_L8C94:  BEQ $8CA7
Bank05_L8C96:  TXA 
Bank05_L8C97:  JSR Adiv16
Bank05_L8C9A:  EOR $91
Bank05_L8C9C:  LSR 
Bank05_L8C9D:  BCC $8CA7
Bank05_L8C9F:  LDA $76
Bank05_L8CA1:  EOR #$07
Bank05_L8CA3:  STA $76
Bank05_L8CA5:  STA $1C
Bank05_L8CA7:  INC $0300,X
Bank05_L8CAA:  LDA #$00
Bank05_L8CAC:  STA $91
Bank05_L8CAE:  LDA $0307,X
Bank05_L8CB1:  CMP #$03
Bank05_L8CB3:  BNE $8CC3
Bank05_L8CB5:  TXA 
Bank05_L8CB6:  JSR Amul16
Bank05_L8CB9:  BCS $8CC0
Bank05_L8CBB:  JSR TourianMusic
Bank05_L8CBE:  BNE $8CC3
Bank05_L8CC0:  JSR MotherBrainMusic
Bank05_L8CC3:  JMP $8C71

Bank05_L8CC6:  LDA DoorStatus
Bank05_L8CC8:  CMP #$05
Bank05_L8CCA:  BNE $8CED
Bank05_L8CCC:  TXA 
Bank05_L8CCD:  EOR #$10
Bank05_L8CCF:  TAX 
Bank05_L8CD0:  LDA #$06
Bank05_L8CD2:  STA $0300,X
Bank05_L8CD5:  LDA #$2C
Bank05_L8CD7:  STA $0305,X
Bank05_L8CDA:  SEC 
Bank05_L8CDB:  SBC #$03
Bank05_L8CDD:  JSR SetProjectileAnimWithoutReset
Bank05_L8CE0:  JSR SFXDoor
Bank05_L8CE3:  JSR SelectSamusPal
Bank05_L8CE6:  LDX PageIndex
Bank05_L8CE8:  LDA #$02
Bank05_L8CEA:  STA $0300,X
Bank05_L8CED:  JMP $8BB1

Bank05_L8CF0:  LDA DoorStatus
Bank05_L8CF2:  BNE $8CED
Bank05_L8CF4:  JMP $8C61
Bank05_L8CF7:  LDA #$FF
Bank05_L8CF9:  BNE $8CFD
Bank05_L8CFB:  LDA #$4E
Bank05_L8CFD:  PHA 
Bank05_L8CFE:  LDA #$50
Bank05_L8D00:  STA $02
Bank05_L8D02:  TXA 
Bank05_L8D03:  JSR Adiv16
Bank05_L8D06:  AND #$01
Bank05_L8D08:  TAY 
Bank05_L8D09:  LDA $8D3A,Y
Bank05_L8D0C:  STA $03
Bank05_L8D0E:  LDA $030C,X
Bank05_L8D11:  STA $0B
Bank05_L8D13:  JSR MakeCartRAMPtr
Bank05_L8D16:  LDY #$00
Bank05_L8D18:  PLA 
Bank05_L8D19:  STA ($04),Y
Bank05_L8D1B:  TAX 
Bank05_L8D1C:  TYA 
Bank05_L8D1D:  CLC 
Bank05_L8D1E:  ADC #$20
Bank05_L8D20:  TAY 
Bank05_L8D21:  TXA 
Bank05_L8D22:  CPY #$C0
Bank05_L8D24:  BNE $8D19
Bank05_L8D26:  LDX PageIndex
Bank05_L8D28:  TXA 
Bank05_L8D29:  JSR Adiv8
Bank05_L8D2C:  AND #$06
Bank05_L8D2E:  TAY 
Bank05_L8D2F:  LDA $04
Bank05_L8D31:  STA $005C,Y
Bank05_L8D34:  LDA $05
Bank05_L8D36:  STA $005D,Y
Bank05_L8D39:  RTS

Bank05_L8D3A:  .byte $E8, $10, $60, $AD, $91, $69, $8D, $78, $68, $AD, $92, $69, $8D, $79, $68, $A9 
Bank05_L8D4A:  .byte $00, $85, $00, $85, $02, $AD, $97, $69, $29, $80, $F0, $06, $A5, $00, $09, $80
Bank05_L8D5A:  .byte $85, $00, $AD, $97, $69, $29

;------------------------------------------[ Graphics data ]-----------------------------------------

;Misc. tile patterns.
Bank05_L8D60:  .byte $73, $FD, $3B, $A0, $C0, $E0, $60, $80, $00, $00, $00, $1F, $10, $17, $14, $14
Bank05_L8D70:  .byte $E8, $9C, $7C, $1C, $44, $58, $5C, $5C, $00, $04, $0C, $FC, $24, $B8, $BC, $BC
Bank05_L8D80:  .byte $E0, $E7, $A0, $2F, $73, $7C, $00, $00, $17, $10, $1F, $0F, $33, $7C, $00, $00
Bank05_L8D90:  .byte $58, $D4, $14, $DC, $EC, $D8, $00, $00, $B8, $34, $F4, $DC, $EC, $D8, $00, $00
Bank05_L8DA0:  .byte $41, $41, $77, $14, $14, $14, $14, $14, $1D, $01, $7F, $0C, $0C, $0C, $0C, $0C
Bank05_L8DB0:  .byte $14, $14, $14, $14, $14, $7F, $41, $41, $0C, $0C, $0C, $0C, $0C, $01, $01, $1D
Bank05_L8DC0:  .byte $7F, $7F, $7F, $3E, $3E, $3E, $3C, $1C, $03, $03, $07, $06, $06, $06, $04, $04
Bank05_L8DD0:  .byte $7E, $7E, $7E, $7C, $7C, $3C, $38, $38, $06, $06, $0E, $0C, $0C, $0C, $08, $08
Bank05_L8DE0:  .byte $1C, $1C, $1C, $08, $08, $08, $08, $08, $04, $04, $04, $00, $00, $00, $00, $00
Bank05_L8DF0:  .byte $38, $10, $10, $10, $00, $00, $00, $00, $08, $00, $00, $00, $00, $00, $00, $00
Bank05_L8E00:  .byte $7E, $7E, $7E, $3E, $3E, $3C, $1C, $1C, $60, $60, $70, $30, $30, $30, $10, $10
Bank05_L8E10:  .byte $FE, $FE, $FE, $7C, $7C, $7C, $3C, $38, $C0, $C0, $E0, $60, $60, $60, $20, $20
Bank05_L8E20:  .byte $1C, $08, $08, $08, $00, $00, $00, $00, $10, $00, $00, $00, $00, $00, $00, $00
Bank05_L8E30:  .byte $38, $38, $38, $10, $10, $10, $10, $10, $20, $20, $20, $00, $00, $00, $00, $00
Bank05_L8E40:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L8E50:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L8E60:  .byte $00, $01, $03, $00, $0F, $03, $1F, $21, $00, $01, $01, $00, $01, $03, $07, $01
Bank05_L8E70:  .byte $7F, $FF, $F0, $D7, $8F, $DC, $98, $F8, $7F, $9F, $70, $D0, $83, $C4, $88, $E8
Bank05_L8E80:  .byte $80, $F0, $78, $BC, $FC, $7E, $6E, $4C, $80, $F0, $78, $3C, $BC, $7E, $6E, $4C
Bank05_L8E90:  .byte $3C, $3C, $3A, $7B, $77, $6F, $69, $3C, $3C, $2C, $2A, $5B, $51, $47, $61, $1C
Bank05_L8EA0:  .byte $D1, $89, $07, $C6, $20, $1C, $87, $00, $C1, $81, $07, $C6, $00, $00, $80, $00
Bank05_L8EB0:  .byte $F6, $02, $08, $1C, $1E, $1E, $07, $07, $F6, $22, $60, $C0, $98, $9C, $44, $26
Bank05_L8EC0:  .byte $70, $70, $0C, $32, $20, $1C, $10, $06, $30, $30, $0C, $12, $20, $0C, $10, $02
Bank05_L8ED0:  .byte $1C, $7E, $78, $F3, $F1, $E1, $C2, $73, $1C, $66, $58, $B3, $B1, $A1, $C2, $73
Bank05_L8EE0:  .byte $03, $03, $03, $01, $B1, $18, $0C, $CC, $12, $12, $22, $00, $90, $08, $04, $44
Bank05_L8EF0:  .byte $00, $07, $00, $03, $00, $01, $03, $0F, $00, $03, $00, $01, $00, $00, $01, $03
Bank05_L8F00:  .byte $01, $48, $46, $30, $1E, $C0, $81, $67, $01, $48, $46, $30, $1E, $C0, $80, $61
Bank05_L8F10:  .byte $E6, $F0, $31, $0B, $83, $00, $EF, $C9, $A2, $C0, $30, $08, $81, $00, $20, $C1
Bank05_L8F20:  .byte $02, $03, $77, $89, $BE, $2C, $00, $80, $00, $01, $77, $81, $8E, $0C, $00, $00
Bank05_L8F30:  .byte $0F, $02, $1F, $02, $0F, $1B, $11, $F0, $07, $02, $0F, $02, $07, $0B, $11, $D0
Bank05_L8F40:  .byte $1F, $3C, $70, $61, $07, $5E, $19, $7E, $07, $1C, $30, $20, $01, $46, $19, $7E
Bank05_L8F50:  .byte $26, $7E, $58, $D2, $23, $C1, $00, $00, $20, $22, $10, $52, $23, $C1, $00, $00
Bank05_L8F60:  .byte $00, $40, $70, $18, $C8, $ED, $F7, $3D, $00, $00, $40, $10, $00, $C9, $E1, $3D
Bank05_L8F70:  .byte $18, $70, $F0, $80, $00, $00, $00, $00, $10, $10, $F0, $80, $00, $00, $00, $00
Bank05_L8F80:  .byte $00, $00, $00, $70, $FC, $DE, $02, $E2, $00, $00, $00, $00, $70, $1E, $02, $C0
Bank05_L8F90:  .byte $45, $D7, $FF, $FF, $FD, $FF, $BF, $FB, $00, $00, $00, $00, $02, $00, $40, $04
Bank05_L8FA0:  .byte $FF, $BB, $FF, $FF, $EF, $FF, $7F, $FD, $00, $44, $00, $00, $10, $00, $80, $02
Bank05_L8FB0:  .byte $12, $12, $12, $12, $12, $12, $12, $12, $1D, $1D, $1D, $1D, $1D, $1D, $1D, $1D
Bank05_L8FC0:  .byte $58, $58, $58, $58, $58, $58, $58, $58, $F8, $F8, $F8, $F8, $F8, $F8, $F8, $F8
Bank05_L8FD0:  .byte $00, $00, $7F, $80, $80, $FF, $7F, $00, $00, $7F, $80, $7F, $FF, $FF, $7F, $00
Bank05_L8FE0:  .byte $00, $00, $FC, $01, $03, $FF, $FE, $00, $00, $FE, $03, $FF, $FF, $FF, $FE, $00
Bank05_L8FF0:  .byte $00, $00, $00, $00, $00, $FF, $00, $00, $FF, $FF, $FF, $FF, $FF, $00, $FF, $FF
Bank05_L9000:  .byte $FF, $00, $FF, $FF, $FF, $FF, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00
Bank05_L9010:  .byte $00, $00, $10, $00, $09, $10, $0A, $25, $00, $00, $10, $00, $09, $10, $0A, $25
Bank05_L9020:  .byte $00, $00, $00, $90, $68, $90, $F4, $BA, $00, $00, $00, $90, $68, $90, $74, $AA
Bank05_L9030:  .byte $0A, $07, $2B, $15, $02, $21, $04, $00, $0A, $07, $2B, $15, $02, $21, $04, $00
Bank05_L9040:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9050:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9060:  .byte $FC, $B4, $6A, $C8, $22, $28, $00, $00, $FC, $B4, $6A, $C8, $22, $28, $00, $00
Bank05_L9070:  .byte $22, $76, $FF, $FF, $FF, $7F, $FF, $7E, $00, $76, $F7, $7F, $DB, $7F, $FF, $5E
Bank05_L9080:  .byte $90, $60, $E0, $D0, $F0, $AC, $D0, $F8, $90, $40, $E0, $D0, $F0, $AC, $D0, $F8
Bank05_L9090:  .byte $FF, $EE, $BD, $7B, $3E, $50, $00, $00, $FF, $EE, $BD, $7B, $3E, $50, $00, $00
Bank05_L90A0:  .byte $E4, $40, $A8, $40, $40, $00, $00, $00, $E4, $40, $A8, $40, $40, $00, $00, $00
Bank05_L90B0:  .byte $3F, $C0, $80, $80, $00, $00, $FF, $80, $00, $3F, $7F, $7F, $00, $00, $00, $7F
Bank05_L90C0:  .byte $FC, $00, $00, $00, $00, $1C, $90, $20, $00, $FC, $FC, $FC, $00, $00, $0C, $9C
Bank05_L90D0:  .byte $80, $80, $00, $F0, $80, $80, $00, $00, $7F, $7F, $00, $00, $7F, $7F, $00, $00
Bank05_L90E0:  .byte $20, $20, $00, $3C, $40, $40, $00, $00, $9C, $1C, $00, $00, $BC, $BC, $00, $00
Bank05_L90F0:  .byte $10, $10, $10, $00, $08, $08, $08, $08, $6F, $6F, $6F, $00, $17, $17, $17, $17
Bank05_L9100:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $00, $FF, $FF, $FF, $FF
Bank05_L9110:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $E6, $E6, $E6, $00, $C8, $C8, $C8, $C8
Bank05_L9120:  .byte $7E, $FF, $C0, $C0, $C0, $CF, $C0, $4F, $00, $00, $3F, $2F, $3F, $30, $38, $30
Bank05_L9130:  .byte $7E, $FF, $03, $03, $03, $F3, $03, $F2, $00, $01, $FF, $F7, $FF, $FF, $0F, $FE
Bank05_L9140:  .byte $40, $CF, $C0, $C0, $C0, $C0, $FF, $7E, $38, $30, $38, $3F, $2F, $3F, $7F, $7E
Bank05_L9150:  .byte $02, $F3, $03, $03, $03, $03, $FF, $7E, $0E, $FF, $0F, $FF, $F7, $FF, $FF, $7E
Bank05_L9160:  .byte $73, $F9, $FF, $7F, $3F, $BF, $FF, $FF, $00, $79, $40, $5F, $10, $17, $54, $55
Bank05_L9170:  .byte $CC, $DC, $FC, $F4, $F0, $D4, $D4, $54, $00, $DC, $04, $F4, $10, $D4, $54, $54
Bank05_L9180:  .byte $FC, $FF, $B0, $7F, $C0, $F7, $00, $00, $54, $57, $10, $5F, $40, $77, $00, $00
Bank05_L9190:  .byte $50, $D4, $14, $F4, $04, $CC, $00, $00, $50, $94, $14, $E4, $04, $C8, $00, $00
Bank05_L91A0:  .byte $FE, $82, $92, $AA, $92, $82, $FE, $00, $00, $7E, $46, $5E, $56, $7E, $FE, $00

;Game over, Japaneese font tile patterns.
Bank05_L91B0:  .byte $C0, $04, $C4, $04, $04, $0C, $F8, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L91C0:  .byte $00, $00, $00, $00, $04, $12, $08, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L91D0:  .byte $40, $7E, $48, $88, $08, $18, $70, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L91E0:  .byte $E0, $02, $02, $02, $06, $0C, $F8, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L91F0:  .byte $18, $0C, $86, $82, $82, $82, $82, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9200:  .byte $7E, $42, $C2, $02, $06, $0C, $78, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9210:  .byte $7E, $42, $C2, $1E, $02, $06, $7C, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9220:  .byte $44, $FE, $44, $44, $04, $0C, $78, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9230:  .byte $40, $40, $40, $78, $44, $40, $40, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9240:  .byte $10, $FE, $82, $82, $06, $0C, $78, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9250:  .byte $0C, $78, $08, $FE, $08, $18, $70, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9260:  .byte $7C, $00, $00, $00, $00, $00, $FE, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9270:  .byte $00, $00, $50, $54, $04, $0C, $38, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9280:  .byte $00, $00, $00, $38, $08, $08, $7C, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9290:  .byte $A2, $A2, $A2, $02, $06, $0C, $78, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L92A0:  .byte $40, $FE, $42, $46, $44, $60, $3E, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L92B0:  .byte $7E, $02, $02, $7E, $02, $02, $7E, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L92C0:  .byte $00, $00, $00, $00, $00, $18, $18, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L92D0:  .byte $3E, $60, $C0, $CE, $C6, $66, $3E, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L92E0:  .byte $38, $6C, $C6, $C6, $FE, $C6, $C6, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L92F0:  .byte $C6, $EE, $FE, $FE, $D6, $C6, $C6, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9300:  .byte $FE, $C0, $C0, $FC, $C0, $C0, $FE, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9310:  .byte $7C, $C6, $C6, $C6, $C6, $C6, $7C, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9320:  .byte $C6, $C6, $C6, $EE, $7C, $38, $10, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9330:  .byte $FC, $C6, $C6, $CE, $F8, $DC, $CE, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9340:  .byte $7E, $18, $18, $18, $18, $18, $18, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9350:  .byte $7E, $18, $18, $18, $18, $18, $7E, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9360:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9370:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9380:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9390:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L93A0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L93B0:  .byte $45, $D7, $FF, $BB, $FF, $EF, $7F, $DD, $00, $00, $00, $44, $02, $50, $88, $22
Bank05_L93C0:  .byte $FF, $77, $DD, $F7, $BE, $EF, $BB, $6E, $24, $88, $22, $48, $45, $10, $46, $B1
Bank05_L93D0:  .byte $7E, $42, $C2, $1E, $02, $06, $7C, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L93E0:  .byte $00, $00, $00, $00, $04, $12, $08, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L93F0:  .byte $44, $FE, $44, $44, $04, $0C, $78, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9400:  .byte $06, $0C, $38, $F0, $10, $10, $10, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9410:  .byte $FE, $C0, $C0, $FC, $C0, $C0, $FE, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9420:  .byte $FC, $C6, $C6, $CE, $F8, $DC, $CE, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9430:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9440:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9450:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9460:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9470:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank05_L9480:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank05_L9490:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L94A0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

;----------------------------------------------------------------------------------------------------

;Unused.
Bank05_L94B0:  .byte $06, $0C, $38, $F0, $10, $10, $10, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L94C0:  .byte $FE, $C0, $C0, $FC, $C0, $C0, $FE, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L94D0:  .byte $FC, $C6, $C6, $CE, $F8, $DC, $CE, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L94E0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L94F0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9500:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9510:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9520:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank05_L9530:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank05_L9540:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9550:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

;----------------------------------------------------------------------------------------------------

.checkpc PalPntrTbl
.advance PalPntrTbl
.scope

Bank05_L9560:  .word _Palette00         ;($A0EB)
Bank05_L9562:  .word _Palette01         ;($A10F)
Bank05_L9564:  .word _Palette02         ;($A11B)
Bank05_L9566:  .word _Palette03         ;($A115)
Bank05_L9568:  .word _Palette04         ;($A121)
Bank05_L956A:  .word _Palette05         ;($A127)
Bank05_L956C:  .word _Palette06         ;($A13B)
Bank05_L956E:  .word _Palette06         ;($A13B)
Bank05_L9570:  .word _Palette06         ;($A13B)
Bank05_L9572:  .word _Palette06         ;($A13B)
Bank05_L9574:  .word _Palette06         ;($A13B)
Bank05_L9576:  .word _Palette06         ;($A13B)
Bank05_L9578:  .word _Palette06         ;($A13B)
Bank05_L957A:  .word _Palette06         ;($A13B)
Bank05_L957C:  .word _Palette06         ;($A13B)
Bank05_L957E:  .word _Palette06         ;($A13B)
Bank05_L9580:  .word _Palette06         ;($A13B)
Bank05_L9582:  .word _Palette06         ;($A13B)
Bank05_L9584:  .word _Palette06         ;($A13B)
Bank05_L9586:  .word _Palette06         ;($A13B)
Bank05_L9588:  .word _Palette07         ;($A142)
Bank05_L958A:  .word _Palette08         ;($A149)
Bank05_L958C:  .word _Palette09         ;($A150)
Bank05_L958E:  .word _Palette0A         ;($A157)
Bank05_L9590:  .word _Palette0B         ;($A15F)
Bank05_L9592:  .word _Palette0C         ;($A167)
Bank05_L9594:  .word _Palette0D         ;($A16F)
Bank05_L9596:  .word _Palette0E         ;($A177)

.checkpc SpecItmsTblPtr
.advance SpecItmsTblPtr

Bank05_L9598:  .word _SpecItmsTbl       ;($A20D)Beginning of special items table.
Bank05_L959A:  .word _RmPtrTbl          ;($A17F)Beginning of room pointer table.
Bank05_L959C:  .word _StrctPtrTbl       ;($A1D3)Beginning of structure pointer table.
Bank05_L959E:  .word _MacroDefs         ;($AB23)Beginning of macro definitions.
Bank05_L95A0:  .word _EnemyFramePtrTbl1 ;($9BF0)Address table into enemy animation data. Two-->
Bank05_L95A2:  .word _EnemyFramePtrTbl2 ;($9CF0)tables needed to accommodate all entries.
Bank05_L95A4:  .word _EnemyPlacePtrTbl  ;($9D04)Pointers to enemy frame placement data.
Bank05_L95A6:  .word _EnemyAnimIndexTbl ;($9B85)Index to values in addr tables for enemy animations.

Bank05_L95A8:  .byte $60, $EA, $EA, $60, $EA, $EA, $60, $EA, $EA, $60, $EA, $EA, $60, $EA, $EA, $60
Bank05_L95B8:  .byte $EA, $EA, $60, $EA, $EA, $60, $EA, $EA, $60, $EA, $EA

.checkpc AreaRoutine
.advance AreaRoutine
Bank05_L95C3:  JMP $9B48           ;Area specific routine.

TwosCompliment_:
Bank05_L95C6:  EOR #$FF            ;
Bank05_L95C8:  CLC             ;The following routine returns the twos-->
Bank05_L95C9:  ADC #$01            ;compliment of the value stored in A.
Bank05_L95CB:  RTS             ;

Bank05_L95CC:  .byte $12           ;Ridley's room.

Bank05_L95CD:  .byte $80           ;Ridley hideout music init flag.

Bank05_L95CE:  .byte $40           ;Base damage caused by area enemies to lower health byte.
Bank05_L95CF:  .byte $02           ;Base damage caused by area enemies to upper health byte.

;Special room numbers(used to start item room music).
Bank05_L95D0:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF

Bank05_L95D7:  .byte $19           ;Samus start x coord on world map.
Bank05_L95D8:  .byte $18           ;Samus start y coord on world map.
Bank05_L95D9:  .byte $6E           ;Samus start verticle screen position.

Bank05_L95DA:  .byte $06, $00, $03, $58, $44, $4A, $48, $4A, $4A, $36 

.checkpc MemuByte
.advance MemuByte
    .byte $25

Bank05_L95E5:  LDA $6B02,X
Bank05_L95E8:  JSR $8024

Bank05_L95EB:  .word $98D7
Bank05_L95ED:  .word $990C
Bank05_L95EF:  .word $9847
Bank05_L95F1:  .word $9862
Bank05_L95F3:  .word $982A
Bank05_L95F5:  .word $982A
Bank05_L95F7:  .word $9967
Bank05_L95F9:  .word $9867
Bank05_L95FB:  .word $982A
Bank05_L95FD:  .word $9A13
Bank05_L95FF:  .word $9A4A
Bank05_L9601:  .word $982A
Bank05_L9603:  .word $9B03
Bank05_L9605:  .word $982A
Bank05_L9607:  .word $9B16
Bank05_L9609:  .word $982A

Bank05_L960B:  .byte $23, $23, $23, $23, $3A, $3A, $3C, $3C, $00, $00, $00, $00, $56, $56, $65, $63

Bank05_L961B:  .byte $00, $00, $11, $11, $13, $18, $28, $28, $32, $32, $34, $34, $00, $00, $00, $00

Bank05_L962B:  .byte $08, $08, $08, $08, $01, $01, $02, $01, $01, $8C, $FF, $FF, $08, $06, $FF, $00

Bank05_L963B:  .byte $1D, $1D, $1D, $1D, $3E, $3E, $44, $44, $00, $00, $00, $00, $4A, $4A, $69, $67

Bank05_L964B:  .byte $00, $00, $05, $08, $13, $18, $1D, $1D, $2D, $28, $34, $34, $00, $00, $00, $00

Bank05_L965B:  .byte $20, $20, $20, $20, $3E, $3E, $44, $44, $00, $00, $00, $00, $4A, $4A, $60, $5D

Bank05_L966B:  .byte $00, $00, $05, $08, $13, $18, $1D, $1D, $2D, $28, $34, $34, $00, $00, $00, $00

Bank05_L967B:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $80, $00, $00, $00, $82, $00, $00, $00

Bank05_L968B:  .byte $89, $89, $89, $89, $00, $00, $04, $80, $80, $81, $00, $00, $05, $89, $00, $00

Bank05_L969B:  .byte $01, $01, $01, $01, $01, $01, $01, $01, $28, $10, $00, $00, $00, $01, $00, $00

Bank05_L96AB:  .byte $05, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $86, $00, $00

Bank05_L96BB:  .byte $10, $01, $03, $03, $10, $10, $01, $08, $09, $10, $01, $10, $01, $20, $00, $00

Bank05_L96CB:  .byte $18, $1A, $00, $03, $00, $00, $08, $08, $00, $0A, $0C, $0F, $14, $16, $18, $00

Bank05_L96DB:  .word $97ED, $97ED, $97ED, $97ED, $97ED, $97F0, $97F3, $97F3
Bank05_L96EB:  .word $97F3, $97F3, $97F3, $97F3, $97F3, $97F3, $97F3, $97F3
Bank05_L96FB:  .word $97F3, $97F3, $97F3, $97F3, $97F3, $97F3, $97F3, $97F3
Bank05_L970B:  .word $97F3, $97F3, $97F3, $97F3, $97F3, $97F3, $97F3, $97F3
Bank05_L971B:  .word $97F3, $97F3, $97F3, $97F3

Bank05_L9723:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $80, $80, $00, $00, $7F, $7F, $81, $81
Bank05_L9733:  .byte $00, $00, $E0, $16, $15, $7F, $7F, $7F, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L9743:  .byte $00, $00, $00, $00, $C8, $00, $00, $00, $00, $00, $08, $20, $00, $00, $00, $00
Bank05_L9753:  .byte $0C, $0C, $02, $01, $F6, $FC, $0A, $04, $01, $FC, $06, $FE, $FE, $FA, $F9, $F9
Bank05_L9763:  .byte $FD, $00, $00, $00, $00, $02, $01, $01, $02, $02, $02, $02, $06, $00, $01, $01
Bank05_L9773:  .byte $01, $00, $00, $00, $03, $00, $00, $00

Bank05_L977B:  .byte $4C, $4C, $64, $6C, $00, $00, $00, $40, $00, $64, $44, $44, $40, $00, $00, $00

Bank05_L978B:  .byte $00, $00, $00, $00, $34, $34, $44, $4A, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_L979B:  .byte $08, $F8, $00, $00, $00, $00, $08, $F8, $00, $00, $00, $F8

Bank05_L97A7:  .word $97FD, $97FD, $980C, $981B, $9B49, $9B4E, $9B53, $9B58
Bank05_L97B7:  .word $9B5D, $9B62, $9B67, $9B6C, $9B71, $9B76, $9B7B, $9B80
Bank05_L97C7:  .word $9B85, $9B85, $9B85, $9B85, $9B85

Bank05_L97D1:  .byte $01, $04, $05, $01, $06, $07, $00, $02, $00, $09, $00, $0D, $01, $0E, $0F, $03
Bank05_L97E1:  .byte $00, $01, $02, $03, $00, $10, $00, $11, $00, $00, $00, $01

Bank05_L97ED:  .byte $01, $03, $FF

Bank05_L97F0:  .byte $01, $0B, $FF

Bank05_L97F3:  .byte $14, $90, $0A, $00, $FD, $30, $00, $14, $10, $FA

Bank05_L97FD:  .byte $09, $C2, $08, $A2, $07, $92, $07, $12, $08, $22, $09, $42, $50, $72, $FF

Bank05_L980C:  .byte $07, $C2, $06, $A2, $05, $92, $05, $12, $06, $22, $07, $42, $50, $72, $FF

Bank05_L981B:  .byte $05, $C2, $04, $A2, $03, $92, $03, $12, $04, $22, $05, $42, $50, $72, $FF

Bank05_L982A:  LDA #$00
Bank05_L982C:  STA $6AF4,X
Bank05_L982F:  RTS

Bank05_L9830:  LDA $81
Bank05_L9832:  CMP #$01
Bank05_L9834:  BEQ $983F
Bank05_L9836:  CMP #$03
Bank05_L9838:  BEQ $9844
Bank05_L983A:  LDA $00
Bank05_L983C:  JMP $8000
Bank05_L983F:  LDA $01
Bank05_L9841:  JMP $8003
Bank05_L9844:  JMP $8006
Bank05_L9847:  LDA #$42
Bank05_L9849:  STA $85
Bank05_L984B:  STA $86
Bank05_L984D:  LDA $6AF4,X
Bank05_L9850:  CMP #$03
Bank05_L9852:  BEQ $9857
Bank05_L9854:  JSR $801B
Bank05_L9857:  LDA #$06
Bank05_L9859:  STA $00
Bank05_L985B:  LDA #$08
Bank05_L985D:  STA $01
Bank05_L985F:  JMP $9830
Bank05_L9862:  LDA #$48
Bank05_L9864:  JMP $9849
Bank05_L9867:  LDA $6AF4,X
Bank05_L986A:  CMP #$02
Bank05_L986C:  BNE $98A6
Bank05_L986E:  LDA $0403,X
Bank05_L9871:  BNE $98A6
Bank05_L9873:  LDA $6AFE,X
Bank05_L9876:  BNE $988A
Bank05_L9878:  LDA $030D
Bank05_L987B:  SEC 
Bank05_L987C:  SBC $0400,X
Bank05_L987F:  CMP #$40
Bank05_L9881:  BCS $98A6
Bank05_L9883:  LDA #$7F
Bank05_L9885:  STA $6AFE,X
Bank05_L9888:  BNE $98A6
Bank05_L988A:  LDA $0402,X
Bank05_L988D:  BMI $98A6
Bank05_L988F:  LDA #$00
Bank05_L9891:  STA $0402,X
Bank05_L9894:  STA $0406,X
Bank05_L9897:  STA $6AFE,X
Bank05_L989A:  LDA $0405,X
Bank05_L989D:  AND #$01
Bank05_L989F:  TAY 
Bank05_L98A0:  LDA $98D5,Y
Bank05_L98A3:  STA $0403,X
Bank05_L98A6:  LDA $0405,X
Bank05_L98A9:  ASL 
Bank05_L98AA:  BMI $98CA
Bank05_L98AC:  LDA $6AF4,X
Bank05_L98AF:  CMP #$02
Bank05_L98B1:  BNE $98CA
Bank05_L98B3:  JSR $8036
Bank05_L98B6:  PHA 
Bank05_L98B7:  JSR $8039
Bank05_L98BA:  STA $05
Bank05_L98BC:  PLA 
Bank05_L98BD:  STA $04
Bank05_L98BF:  JSR $9AE1
Bank05_L98C2:  JSR $8027
Bank05_L98C5:  BCC $98CF
Bank05_L98C7:  JSR $9AF1
Bank05_L98CA:  LDA #$03
Bank05_L98CC:  JMP $8003
Bank05_L98CF:  LDA #$00
Bank05_L98D1:  STA $6AF4,X
Bank05_L98D4:  RTS

Bank05_L98D5:  PHP 
Bank05_L98D6:  SED 
Bank05_L98D7:  LDA #$03
Bank05_L98D9:  STA $00
Bank05_L98DB:  LDA #$08
Bank05_L98DD:  STA $01
Bank05_L98DF:  LDA $6AF4,X
Bank05_L98E2:  CMP #$01
Bank05_L98E4:  BNE $98F2
Bank05_L98E6:  LDA $0405,X
Bank05_L98E9:  AND #$10
Bank05_L98EB:  BEQ $98F2
Bank05_L98ED:  LDA #$01
Bank05_L98EF:  JSR $9958
Bank05_L98F2:  JSR $98F8
Bank05_L98F5:  JMP $9830
Bank05_L98F8:  LDA $6AF4,X
Bank05_L98FB:  CMP #$02
Bank05_L98FD:  BNE $990B
Bank05_L98FF:  LDA #$20
Bank05_L9901:  LDY $0402,X
Bank05_L9904:  BPL $9908
Bank05_L9906:  LDA #$1D
Bank05_L9908:  STA $6AF9,X
Bank05_L990B:  RTS

Bank05_L990C:  LDA $81
Bank05_L990E:  CMP #$01
Bank05_L9910:  BEQ $9922
Bank05_L9912:  CMP #$03
Bank05_L9914:  BEQ $9955
Bank05_L9916:  LDA $6AF4,X
Bank05_L9919:  CMP #$01
Bank05_L991B:  BNE $9927
Bank05_L991D:  LDA #$00
Bank05_L991F:  JSR $9958
Bank05_L9922:  LDA #$08
Bank05_L9924:  JMP $8003
Bank05_L9927:  LDA #$80
Bank05_L9929:  STA $6AFE,X
Bank05_L992C:  LDA $0402,X
Bank05_L992F:  BMI $994D
Bank05_L9931:  LDA $0405,X
Bank05_L9934:  AND #$10
Bank05_L9936:  BEQ $994D
Bank05_L9938:  LDA $0400,X
Bank05_L993B:  SEC 
Bank05_L993C:  SBC $030D
Bank05_L993F:  BPL $9944
Bank05_L9941:  JSR $95C6
Bank05_L9944:  CMP #$10
Bank05_L9946:  BCS $994D
Bank05_L9948:  LDA #$00
Bank05_L994A:  STA $6AFE,X
Bank05_L994D:  JSR $98F8
Bank05_L9950:  LDA #$03
Bank05_L9952:  JMP $8000
Bank05_L9955:  JMP $8006
Bank05_L9958:  STA $6B02,X
Bank05_L995B:  LDA $040B,X
Bank05_L995E:  PHA 
Bank05_L995F:  JSR $802A
Bank05_L9962:  PLA 
Bank05_L9963:  STA $040B,X
Bank05_L9966:  RTS

Bank05_L9967:  JSR $8009
Bank05_L996A:  AND #$03
Bank05_L996C:  BEQ $99A2
Bank05_L996E:  LDA $81
Bank05_L9970:  CMP #$01
Bank05_L9972:  BEQ $99AA
Bank05_L9974:  CMP #$03
Bank05_L9976:  BEQ $99A7
Bank05_L9978:  LDA $6AF4,X
Bank05_L997B:  CMP #$03
Bank05_L997D:  BEQ $99A2
Bank05_L997F:  LDA $040A,X
Bank05_L9982:  AND #$03
Bank05_L9984:  CMP #$01
Bank05_L9986:  BNE $9999
Bank05_L9988:  LDY $0400,X
Bank05_L998B:  CPY #$EB
Bank05_L998D:  BNE $9999
Bank05_L998F:  JSR $99DB
Bank05_L9992:  LDA #$03
Bank05_L9994:  STA $040A,X
Bank05_L9997:  BNE $999F
Bank05_L9999:  JSR $9A00
Bank05_L999C:  JSR $99C6
Bank05_L999F:  JSR $99E4
Bank05_L99A2:  LDA #$03
Bank05_L99A4:  JSR $800C
Bank05_L99A7:  JMP $8006
Bank05_L99AA:  JMP $8003
Bank05_L99AD:  LDA $0405,X
Bank05_L99B0:  LSR 
Bank05_L99B1:  LDA $040A,X
Bank05_L99B4:  AND #$03
Bank05_L99B6:  ROL 
Bank05_L99B7:  TAY 
Bank05_L99B8:  LDA $99BE,Y
Bank05_L99BB:  JMP $800F

Bank05_L99BE:  .byte $4A, $4A, $53, $4D, $50, $50, $4D, $53

Bank05_L99C6:  LDX $4B
Bank05_L99C8:  BCS $99E3
Bank05_L99CA:  LDA $00
Bank05_L99CC:  BNE $99DB
Bank05_L99CE:  LDY $040A,X
Bank05_L99D1:  DEY 
Bank05_L99D2:  TYA 
Bank05_L99D3:  AND #$03
Bank05_L99D5:  STA $040A,X
Bank05_L99D8:  JMP $99AD
Bank05_L99DB:  LDA $0405,X
Bank05_L99DE:  EOR #$01
Bank05_L99E0:  STA $0405,X
Bank05_L99E3:  RTS

Bank05_L99E4:  JSR $99F8
Bank05_L99E7:  JSR $9A00
Bank05_L99EA:  LDX $4B
Bank05_L99EC:  BCC $99F7
Bank05_L99EE:  JSR $99F8
Bank05_L99F1:  STA $040A,X
Bank05_L99F4:  JSR $99AD
Bank05_L99F7:  RTS

Bank05_L99F8:  LDY $040A,X
Bank05_L99FB:  INY 
Bank05_L99FC:  TYA 
Bank05_L99FD:  AND #$03
Bank05_L99FF:  RTS

Bank05_L9A00:  LDY $0405,X
Bank05_L9A03:  STY $00
Bank05_L9A05:  LSR $00
Bank05_L9A07:  ROL 
Bank05_L9A08:  ASL 
Bank05_L9A09:  TAY 
Bank05_L9A0A:  LDA $8049,Y
Bank05_L9A0D:  PHA 
Bank05_L9A0E:  LDA $8048,Y
Bank05_L9A11:  PHA 
Bank05_L9A12:  RTS

Bank05_L9A13:  LDA $6AF4,X
Bank05_L9A16:  CMP #$03
Bank05_L9A18:  BCC $9A33
Bank05_L9A1A:  BEQ $9A20
Bank05_L9A1C:  CMP #$05
Bank05_L9A1E:  BNE $9A41
Bank05_L9A20:  LDA #$00
Bank05_L9A22:  STA $6B04
Bank05_L9A25:  STA $6B14
Bank05_L9A28:  STA $6B24
Bank05_L9A2B:  STA $6B34
Bank05_L9A2E:  STA $6B44
Bank05_L9A31:  BEQ $9A41
Bank05_L9A33:  LDA #$0B
Bank05_L9A35:  STA $85
Bank05_L9A37:  LDA #$0E
Bank05_L9A39:  STA $86
Bank05_L9A3B:  JSR $801B
Bank05_L9A3E:  JSR $9A79
Bank05_L9A41:  LDA #$03
Bank05_L9A43:  STA $00
Bank05_L9A45:  STA $01
Bank05_L9A47:  JMP $9830
Bank05_L9A4A:  LDA $0405,X
Bank05_L9A4D:  PHA 
Bank05_L9A4E:  LDA #$02
Bank05_L9A50:  STA $00
Bank05_L9A52:  STA $01
Bank05_L9A54:  JSR $9830
Bank05_L9A57:  PLA 
Bank05_L9A58:  LDX $4B
Bank05_L9A5A:  EOR $0405,X
Bank05_L9A5D:  LSR 
Bank05_L9A5E:  BCS $9A73
Bank05_L9A60:  LDA $0405,X
Bank05_L9A63:  LSR 
Bank05_L9A64:  BCS $9A78
Bank05_L9A66:  LDA $0401,X
Bank05_L9A69:  SEC 
Bank05_L9A6A:  SBC $030E
Bank05_L9A6D:  BCC $9A78
Bank05_L9A6F:  CMP #$20
Bank05_L9A71:  BCC $9A78
Bank05_L9A73:  LDA #$00
Bank05_L9A75:  STA $6AF4,X
Bank05_L9A78:  RTS

Bank05_L9A79:  LDY $80
Bank05_L9A7B:  BNE $9A7F
Bank05_L9A7D:  LDY #$60
Bank05_L9A7F:  LDA $2D
Bank05_L9A81:  AND #$02
Bank05_L9A83:  BNE $9AA9
Bank05_L9A85:  DEY 
Bank05_L9A86:  STY $80
Bank05_L9A88:  TYA 
Bank05_L9A89:  ASL 
Bank05_L9A8A:  BMI $9AA9
Bank05_L9A8C:  AND #$0F
Bank05_L9A8E:  CMP #$0A
Bank05_L9A90:  BNE $9AA9
Bank05_L9A92:  LDX #$50
Bank05_L9A94:  LDA $6AF4,X
Bank05_L9A97:  BEQ $9AAA
Bank05_L9A99:  LDA $0405,X
Bank05_L9A9C:  AND #$02
Bank05_L9A9E:  BEQ $9AAA
Bank05_L9AA0:  TXA 
Bank05_L9AA1:  SEC 
Bank05_L9AA2:  SBC #$10
Bank05_L9AA4:  TAX 
Bank05_L9AA5:  BNE $9A94
Bank05_L9AA7:  INC $7E
Bank05_L9AA9:  RTS

Bank05_L9AAA:  TXA 
Bank05_L9AAB:  TAY 
Bank05_L9AAC:  LDX #$00
Bank05_L9AAE:  JSR $9AE1
Bank05_L9AB1:  TYA 
Bank05_L9AB2:  TAX 
Bank05_L9AB3:  LDA $0405
Bank05_L9AB6:  STA $0405,X
Bank05_L9AB9:  AND #$01
Bank05_L9ABB:  TAY 
Bank05_L9ABC:  LDA $9ADF,Y
Bank05_L9ABF:  STA $05
Bank05_L9AC1:  LDA #$F8
Bank05_L9AC3:  STA $04
Bank05_L9AC5:  JSR $8027
Bank05_L9AC8:  BCC $9AA9
Bank05_L9ACA:  LDA #$00
Bank05_L9ACC:  STA $040F,X
Bank05_L9ACF:  LDA #$0A
Bank05_L9AD1:  STA $6B02,X
Bank05_L9AD4:  LDA #$01
Bank05_L9AD6:  STA $6AF4,X
Bank05_L9AD9:  JSR $9AF1
Bank05_L9ADC:  JMP $802A
Bank05_L9ADF:  PHP 
Bank05_L9AE0:  SED 
Bank05_L9AE1:  LDA $0400,X
Bank05_L9AE4:  STA $08
Bank05_L9AE6:  LDA $0401,X
Bank05_L9AE9:  STA $09
Bank05_L9AEB:  LDA $6AFB,X
Bank05_L9AEE:  STA $0B
Bank05_L9AF0:  RTS

Bank05_L9AF1:  LDA $0B
Bank05_L9AF3:  AND #$01
Bank05_L9AF5:  STA $6AFB,X
Bank05_L9AF8:  LDA $08
Bank05_L9AFA:  STA $0400,X
Bank05_L9AFD:  LDA $09
Bank05_L9AFF:  STA $0401,X
Bank05_L9B02:  RTS

Bank05_L9B03:  LDA $6AF4,X
Bank05_L9B06:  CMP #$02
Bank05_L9B08:  BNE $9B0D
Bank05_L9B0A:  JSR $801E
Bank05_L9B0D:  LDA #$02
Bank05_L9B0F:  STA $00
Bank05_L9B11:  STA $01
Bank05_L9B13:  JMP $9830
Bank05_L9B16:  LDA #$00
Bank05_L9B18:  STA $6AF5,X
Bank05_L9B1B:  STA $6AF6,X
Bank05_L9B1E:  LDA #$10
Bank05_L9B20:  STA $0405,X
Bank05_L9B23:  TXA 
Bank05_L9B24:  LSR 
Bank05_L9B25:  LSR 
Bank05_L9B26:  LSR 
Bank05_L9B27:  LSR 
Bank05_L9B28:  ADC $2D
Bank05_L9B2A:  AND #$07
Bank05_L9B2C:  BNE $9B48
Bank05_L9B2E:  LSR $0405,X
Bank05_L9B31:  LDA #$03
Bank05_L9B33:  STA $87
Bank05_L9B35:  LDA $2E
Bank05_L9B37:  LSR 
Bank05_L9B38:  ROL $0405,X
Bank05_L9B3B:  AND #$03
Bank05_L9B3D:  BEQ $9B48
Bank05_L9B3F:  STA $88
Bank05_L9B41:  LDA #$02
Bank05_L9B43:  STA $85
Bank05_L9B45:  JMP $8021
Bank05_L9B48:  RTS

Bank05_L9B49:  .byte $22, $FF, $FF, $FF, $FF

Bank05_L9B4E:  .byte $22, $80, $81, $82, $83

Bank05_L9B53:  .byte $22, $84, $85, $86, $87

Bank05_L9B58:  .byte $22, $88, $89, $8A, $8B

Bank05_L9B5D:  .byte $22, $8C, $8D, $8E, $8F

Bank05_L9B62:  .byte $22, $94, $95, $96, $97

Bank05_L9B67:  .byte $22, $9C, $9D, $9D, $9C

Bank05_L9B6C:  .byte $22, $9E, $9F, $9F, $9E

Bank05_L9B71:  .byte $22, $90, $91, $92, $93

Bank05_L9B76:  .byte $22, $70, $71, $72, $73

Bank05_L9B7B:  .byte $22, $74, $75, $76, $77

Bank05_L9B80:  .byte $22, $78, $79, $7A, $7B

;-----------------------------------[ Enemy animation data tables ]----------------------------------

_EnemyAnimIndexTbl:
Bank05_L9B85:  .byte $00, $01, $FF

Bank05_L9B88:  .byte $02, $FF

Bank05_L9B8A:  .byte $03, $04, $FF

Bank05_L9B8D:  .byte $07, $08, $FF

Bank05_L9B90:  .byte $05, $06, $FF

Bank05_L9B93:  .byte $09, $0A, $FF

Bank05_L9B96:  .byte $0B, $FF

Bank05_L9B98:  .byte $0C, $0D, $0E, $0F, $FF

Bank05_L9B9D:  .byte $10, $11, $12, $13, $FF

Bank05_L9BA2:  .byte $17, $18, $FF

Bank05_L9BA5:  .byte $19, $1A, $FF

Bank05_L9BA8:  .byte $1B, $FF

Bank05_L9BAA:  .byte $21, $22, $FF

Bank05_L9BAD:  .byte $27, $28, $29, $2A, $FF

Bank05_L9BB2:  .byte $2B, $2C, $2D, $2E, $FF

Bank05_L9BB7:  .byte $2F, $FF

Bank05_L9BB9:  .byte $42, $FF

Bank05_L9BBB:  .byte $43, $44, $F7, $FF

Bank05_L9BBF:  .byte $37, $FF, $38, $FF

Bank05_L9BC3:  .byte $30, $31, $FF

Bank05_L9BC6:  .byte $31, $32, $FF

Bank05_L9BC9:  .byte $33, $34, $FF

Bank05_L9BCC:  .byte $34, $35, $FF

Bank05_L9BCF:  .byte $58, $59, $FF

Bank05_L9BD2:  .byte $5A, $5B, $FF

Bank05_L9BD5:  .byte $5C, $5D, $FF

Bank05_L9BD8:  .byte $5E, $5F, $FF

Bank05_L9BDB:  .byte $60, $FF

Bank05_L9BDD:  .byte $61, $F7, $62, $F7, $FF

Bank05_L9BE2:  .byte $66, $67, $FF

Bank05_L9BE5:  .byte $69, $6A, $FF

Bank05_L9BE8:  .byte $68, $FF

Bank05_L9BEA:  .byte $6B, $FF

Bank05_L9BEC:  .byte $66, $FF

Bank05_L9BEE:  .byte $69, $FF

;----------------------------[ Enemy sprite drawing pointer tables ]---------------------------------

_EnemyFramePtrTbl1:
Bank05_L9BF0:  .word $9DD8, $9DDD, $9DE2, $9DE7, $9DFA, $9E0E, $9E24, $9E3A
Bank05_L9C00:  .word $9E4D, $9E61, $9E77, $9E8D, $9E97, $9E9C, $9EA1, $9EA6
Bank05_L9C10:  .word $9EAB, $9EB0, $9EB5, $9EBA, $9EBF, $9EBF, $9EBF, $9EBF
Bank05_L9C20:  .word $9ECE, $9EDD, $9EEE, $9EFF, $9F07, $9F07, $9F07, $9F07
Bank05_L9C30:  .word $9F07, $9F07, $9F0F, $9F17, $9F17, $9F17, $9F17, $9F17
Bank05_L9C40:  .word $9F23, $9F31, $9F3F, $9F4D, $9F59, $9F67, $9F75, $9F83
Bank05_L9C50:  .word $9F8E, $9F9C, $9FAA, $9FB6, $9FC4, $9FD2, $9FDE, $9FDE
Bank05_L9C60:  .word $9FF2, $A006, $A006, $A006, $A006, $A006, $A006, $A006
Bank05_L9C70:  .word $A006, $A006, $A006, $A00B, $A013, $A01B, $A01B, $A01B
Bank05_L9C80:  .word $A01B, $A01B, $A01B, $A01B, $A01B, $A01B, $A01B, $A01B
Bank05_L9C90:  .word $A01B, $A01B, $A01B, $A01B, $A01B, $A01B, $A01B, $A01B
Bank05_L9CA0:  .word $A01B, $A027, $A033, $A03F, $A04B, $A057, $A063, $A06F
Bank05_L9CB0:  .word $A07B, $A083, $A091, $A0AB, $A0AB, $A0AB, $A0AB, $A0B3
Bank05_L9CC0:  .word $A0BB, $A0C3, $A0CB, $A0D3, $A0DB, $A0DB, $A0DB, $A0DB
Bank05_L9CD0:  .word $A0DB, $A0DB, $A0DB, $A0DB, $A0DB, $A0DB, $A0DB, $A0DB
Bank05_L9CE0:  .word $A0DB, $A0DB, $A0DB, $A0DB, $A0DB, $A0DB, $A0DB, $A0DB

_EnemyFramePtrTbl2:
Bank05_L9CF0:  .word $A0DB, $A0E1, $A0E6, $A0E6, $A0E6, $A0E6, $A0E6, $A0E6
Bank05_L9D00:  .word $A0E6, $A0E6

_EnemyPlacePtrTbl:
Bank05_L9D04:  .word $9D22, $9D24, $9D3C, $9D60, $9D72, $9D64, $9D6E, $9D76
Bank05_L9D14:  .word $9D82, $9D8A, $9D8A, $9DAA, $9DB8, $9DBC, $9DCC

;------------------------------[ Enemy sprite placement data tables ]--------------------------------

Bank05_L9D22:  .byte $FC, $FC

Bank05_L9D24:  .byte $80, $80, $81, $81, $82, $82, $83, $83, $84, $84, $85, $85, $F4, $F8, $F4, $00
Bank05_L9D34:  .byte $FC, $F8, $FC, $00, $04, $F8, $04, $00

Bank05_L9D3C:  .byte $EC, $F8, $EC, $00, $F4, $F8, $F4, $00, $FC, $F8, $FC, $00, $04, $E8, $04, $F0
Bank05_L9D4C:  .byte $04, $F8, $04, $00, $0C, $F0, $0C, $F8, $0C, $00, $F4, $F4, $F4, $EC, $FC, $F4
Bank05_L9D5C:  .byte $12, $E8, $14, $F8

Bank05_L9D60:  .byte $F4, $F4, $F4, $04

Bank05_L9D64:  .byte $F8, $F4, $F8, $FC, $F8, $04, $00, $F8, $00, $00

Bank05_L9D6E:  .byte $FC, $F8, $FC, $00

Bank05_L9D72:  .byte $F0, $F8, $F0, $00

Bank05_L9D76:  .byte $F8, $F8, $F8, $00, $00, $F8, $00, $00, $08, $F8, $08, $00

Bank05_L9D82:  .byte $F8, $E8, $F8, $10, $F8, $F0, $F8, $08

Bank05_L9D8A:  .byte $F8, $F8, $F8, $00, $00, $F8, $00, $00, $F0, $00, $F0, $08, $F8, $08, $F0, $F0
Bank05_L9D9A:  .byte $F0, $F8, $F8, $F0, $00, $F0, $08, $F0, $08, $F8, $00, $08, $08, $00, $08, $08

Bank05_L9DAA:  .byte $F8, $FC, $00, $F8, $F4, $F4, $FC, $F4, $00, $00, $F4, $04, $FC, $04

Bank05_L9DB8:  .byte $F8, $FC, $00, $FC

Bank05_L9DBC:  .byte $F8, $F4, $00, $F4, $F8, $FC, $00, $FC, $F4, $FC, $FC, $FC, $F8, $04, $00, $04

Bank05_L9DCC:  .byte $02, $F4, $0A, $F4, $F8, $FC, $00, $FC, $02, $04, $0A, $04

;Enemy frame drawing data.

Bank05_L9DD8:  .byte $00, $02, $02, $14, $FF

Bank05_L9DDD:  .byte $00, $02, $02, $24, $FF

Bank05_L9DE2:  .byte $00, $00, $00, $04, $FF

Bank05_L9DE7:  .byte $22, $13, $14, $C8, $C9, $C6, $C7, $D6, $D7, $D5, $E5, $E6, $E7, $F5, $F6, $F7
Bank05_L9DF7:  .byte $F9, $F8, $FF

Bank05_L9DFA:  .byte $22, $13, $14, $C8, $C9, $C6, $C7, $D6, $D7, $D5, $E5, $E6, $E7, $F5, $F6, $F7
Bank05_L9D0A:  .byte $D8, $FE, $E8, $FF

Bank05_L9E0E:  .byte $22, $13, $14, $C8, $C9, $C6, $C7, $D6, $D7, $FE, $D9, $E6, $E7, $E9, $EA, $EB
Bank05_L9E1E:  .byte $F9, $F8, $FE, $D5, $FA, $FF

Bank05_L9E24:  .byte $22, $13, $14, $C8, $C9, $C6, $C7, $D6, $D7, $FE, $D9, $E6, $E7, $E9, $EA, $EB
Bank05_L9E34:  .byte $D8, $FE, $E8, $D5, $FA, $FF

Bank05_L9E3A:  .byte $62, $13, $14, $C8, $C9, $C6, $C7, $D6, $D7, $D5, $E5, $E6, $E7, $F5, $F6, $F7
Bank05_L9E4A:  .byte $F9, $F8, $FF

Bank05_L9E4D:  .byte $62, $13, $14, $C8, $C9, $C6, $C7, $D6, $D7, $D5, $E5, $E6, $E7, $F5, $F6, $F7
Bank05_L9E5D:  .byte $D8, $FE, $E8, $FF

Bank05_L9E61:  .byte $62, $13, $14, $C8, $C9, $C6, $C7, $D6, $D7, $FE, $D9, $E6, $E7, $E9, $EA, $EB
Bank05_L9E71:  .byte $F9, $F8, $FE, $D5, $FA, $FF

Bank05_L9E77:  .byte $62, $13, $14, $C8, $C9, $C6, $C7, $D6, $D7, $FE, $D9, $E6, $E7, $E9, $EA, $EB
Bank05_L9E87:  .byte $D8, $FE, $E8, $D5, $FA, $FF

Bank05_L9E8D:  .byte $21, $00, $00, $C6, $C7, $D6, $D7, $E6, $E7, $FF

Bank05_L9E97:  .byte $30, $07, $07, $EC, $FF

Bank05_L9E9C:  .byte $30, $07, $07, $FB, $FF

Bank05_L9EA1:  .byte $F0, $07, $07, $EC, $FF

Bank05_L9EA6:  .byte $F0, $07, $07, $FB, $FF

Bank05_L9EAB:  .byte $70, $07, $07, $EC, $FF

Bank05_L9EB0:  .byte $70, $07, $07, $FB, $FF

Bank05_L9EB5:  .byte $B0, $07, $07, $EC, $FF

Bank05_L9EBA:  .byte $B0, $07, $07, $FB, $FF

Bank05_L9EBF:  .byte $25, $08, $08, $CE, $CF, $FD, $62, $CE, $FD, $22, $DF, $FD, $62, $DF, $FF

Bank05_L9ECE:  .byte $25, $08, $08, $CE, $CF, $FD, $62, $CE, $FD, $22, $DE, $FD, $62, $DE, $FF

Bank05_L9EDD:  .byte $A5, $08, $08, $FD, $22, $CE, $CF, $FD, $62, $CE, $FD, $A2, $DF, $FD, $E2, $DF
Bank05_L9EED:  .byte $FF

Bank05_L9EEE:  .byte $A5, $08, $08, $FD, $22, $CE, $CF, $FD, $62, $CE, $FD, $A2, $DE, $FD, $E2, $DE
Bank05_L9EFE:  .byte $FF

Bank05_L9EFF:  .byte $21, $00, $00, $CE, $CE, $DF, $DF, $FF

Bank05_L9F07:  .byte $29, $04, $08, $E6, $FD, $62, $E6, $FF

Bank05_L9F0F:  .byte $29, $04, $08, $E5, $FD, $62, $E5, $FF, $27, $08, $08, $EE, $EF

Bank05_L9F17:  .byte $FD, $E2, $EF, $FD, $A2, $EF, $FF

Bank05_L9F23:  .byte $27, $08, $08, $FD, $62, $EF, $FD, $22, $EF, $ED, $FD, $A2, $EF, $FF

Bank05_L9F31:  .byte $27, $08, $08, $FD, $62, $EF, $FD, $22, $EF, $FD, $E2, $EF, $EE, $FF

Bank05_L9F3F:  .byte $27, $08, $08, $FD, $62, $EF, $FD, $E2, $ED, $EF, $FD, $A2, $EF, $FF

Bank05_L9F4D:  .byte $67, $08, $08, $EE, $EF, $FD, $A2, $EF, $FD, $E2, $EF, $FF

Bank05_L9F59:  .byte $67, $08, $08, $FD, $22, $EF, $FD, $62, $EF, $ED, $FD, $E2, $EF, $FF

Bank05_L9F67:  .byte $67, $08, $08, $FD, $22, $EF, $FD, $62, $EF, $FD, $A2, $EF, $EE, $FF

Bank05_L9F75:  .byte $67, $08, $08, $FD, $22, $EF, $FD, $A2, $ED, $EF, $FD, $E2, $EF, $FF

Bank05_L9F83:  .byte $21, $00, $00, $FC, $04, $00, $EE, $EF, $EF, $EF, $FF

Bank05_L9F8E:  .byte $2D, $08, $0A, $E2, $F2, $E3, $F3, $FE, $FE, $FD, $62, $E2, $F2, $FF

Bank05_L9F9C:  .byte $2D, $08, $0A, $E4, $F2, $FE, $FE, $E3, $F3, $FD, $62, $E4, $F2, $FF

Bank05_L9FAA:  .byte $2E, $08, $0A, $F4, $F2, $E3, $F3, $FD, $62, $F4, $F2, $FF

Bank05_L9FB6:  .byte $AD, $08, $0A, $E2, $F2, $E3, $F3, $FE, $FE, $FD, $E2, $E2, $F2, $FF

Bank05_L9FC4:  .byte $AD, $08, $0A, $E4, $F2, $FE, $FE, $E3, $F3, $FD, $E2, $E4, $F2, $FF

Bank05_L9FD2:  .byte $AE, $08, $0A, $F4, $F2, $E3, $F3, $FD, $E2, $F4, $F2, $FF

Bank05_L9FDE:  .byte $21, $00, $00, $FC, $08, $FC, $E2, $FC, $00, $08, $E2, $FC, $00, $F8, $F2, $FC
Bank05_L9FEE:  .byte $00, $08, $F2, $FF

Bank05_L9FF2:  .byte $21, $00, $00, $FC, $00, $FC, $F2, $FC, $00, $08, $F2, $FC, $00, $F8, $E2, $FC
Bank05_LA002:  .byte $00, $08, $E2, $FF

Bank05_LA006:  .byte $20, $04, $04, $C0, $FF

Bank05_LA00B:  .byte $20, $00, $00, $FC, $F8, $00, $D0, $FF

Bank05_LA013:  .byte $23, $00, $00, $D1, $FD, $62, $D1, $FF

Bank05_LA01B:  .byte $27, $08, $08, $CC, $FD, $62, $CC, $FD, $22, $DC, $DD, $FF

Bank05_LA027:  .byte $67, $08, $08, $FD, $22, $CD, $FD, $62, $CD, $DC, $DD, $FF

Bank05_LA033:  .byte $27, $08, $08, $FD, $A2, $DA, $FD, $22, $CB, $DA, $DB, $FF

Bank05_LA03F:  .byte $A7, $08, $08, $CA, $CB, $FD, $22, $CA, $FD, $A2, $DB, $FF

Bank05_LA04B:  .byte $A7, $08, $08, $CC, $FD, $E2, $CC, $FD, $A2, $DC, $DD, $FF

Bank05_LA057:  .byte $E7, $08, $08, $FD, $A2, $CD, $FD, $E2, $CD, $DC, $DD, $FF

Bank05_LA063:  .byte $67, $08, $08, $FD, $E2, $DA, $FD, $62, $CB, $DA, $DB, $FF

Bank05_LA06F:  .byte $E7, $08, $08, $CA, $CB, $FD, $62, $CA, $FD, $E2, $DB, $FF

Bank05_LA07B:  .byte $21, $00, $00, $CC, $CD, $DC, $DD, $FF

Bank05_LA083:  .byte $0A, $00, $00, $75, $FD, $60, $75, $FD, $A0, $75, $FD, $E0, $75, $FF

Bank05_LA091:  .byte $0A, $00, $00, $FE, $FE, $FE, $FE, $3D, $3E, $4E, $FD, $60, $3E, $3D, $4E, $FD
Bank05_LA0A1:  .byte $E0, $4E, $3E, $3D, $FD, $A0, $4E, $3D, $3E, $FF

Bank05_LA0AB:  .byte $2A, $08, $08, $C2, $C3, $D2, $D3, $FF

Bank05_LA0B3:  .byte $2A, $08, $08, $C2, $C4, $D2, $D4, $FF

Bank05_LA0BB:  .byte $21, $08, $08, $C2, $C4, $D2, $D4, $FF

Bank05_LA0C3:  .byte $6A, $08, $08, $C2, $C3, $D2, $D3, $FF

Bank05_LA0CB:  .byte $6A, $08, $08, $C2, $C4, $D2, $D4, $FF

Bank05_LA0D3:  .byte $61, $08, $08, $C2, $C4, $D2, $D4, $FF

Bank05_LA0DB:  .byte $0C, $08, $04, $14, $24, $FF

A0E1:   .byte $00, $04, $04, $8A, $FF

A0E6:   .byte $00, $04, $04, $8A, $FF


;------------------------------------------[ Palette data ]------------------------------------------

_Palette00:
Bank05_LA0EB:  .byte $3F           ;Upper byte of PPU palette adress.
Bank05_LA0EC:  .byte $00           ;Lower byte of PPU palette adress.
Bank05_LA0ED:  .byte $20           ;Palette data length.
;The following values are written to the background palette:
Bank05_LA0EE:  .byte $0F, $20, $10, $00, $0F, $21, $14, $13, $0F, $28, $1B, $02, $0F, $15, $16, $04
;The following values are written to the sprite palette:
Bank05_LA0FE:  .byte $0F, $16, $19, $27, $0F, $12, $30, $21, $0F, $14, $13, $29, $0F, $13, $15, $27

Bank05_LA10E:  .byte $00           ;End Palette00 info.

_Palette01:
Bank05_LA10F:  .byte $3F           ;Upper byte of PPU palette adress.
Bank05_LA110:  .byte $12           ;Lower byte of PPU palette adress.
Bank05_LA111:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank05_LA112:  .byte $19, $27

Bank05_LA114:  .byte $00           ;End Palette01 info.

_Palette03:
Bank05_LA115:  .byte $3F           ;Upper byte of PPU palette adress.
Bank05_LA116:  .byte $12           ;Lower byte of PPU palette adress.
Bank05_LA117:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank05_LA118:  .byte $2C, $27

Bank05_LA11A:  .byte $00           ;End Palette03 info.

_Palette02:
Bank05_LA11B:  .byte $3F           ;Upper byte of PPU palette adress.
Bank05_LA11C:  .byte $12           ;Lower byte of PPU palette adress.
Bank05_LA11D:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank05_LA11E:  .byte $19, $35

Bank05_LA120:  .byte $00           ;End Palette02 info.

_Palette04:
Bank05_LA121:  .byte $3F           ;Upper byte of PPU palette adress.
Bank05_LA122:  .byte $12           ;Lower byte of PPU palette adress.
Bank05_LA123:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank05_LA124:  .byte $2C, $24

Bank05_LA126:  .byte $00           ;End Palette04 info.

_Palette05:
Bank05_LA127:  .byte $3F           ;Upper byte of PPU palette adress.
Bank05_LA128:  .byte $00           ;Lower byte of PPU palette adress.
Bank05_LA129:  .byte $10           ;Palette data length.
;The following values are written to the background palette:
Bank05_LA12A:  .byte $0F, $20, $16, $04, $0F, $21, $14, $13, $0F, $27, $16, $02, $0F, $15, $16, $04

Bank05_LA13A:  .byte $00           ;End Palette05 info.

_Palette06:
Bank05_LA13B:  .byte $3F           ;Upper byte of PPU palette adress.
Bank05_LA13C:  .byte $11           ;Lower byte of PPU palette adress.
Bank05_LA13D:  .byte $03           ;Palette data length.
;The following values are written to the sprite palette:
Bank05_LA13E:  .byte $04, $09, $07

Bank05_LA141:  .byte $00           ;End Palette06 info.

_Palette07:
Bank05_LA142:  .byte $3F           ;Upper byte of PPU palette adress.
Bank05_LA143:  .byte $11           ;Lower byte of PPU palette adress.
Bank05_LA144:  .byte $03           ;Palette data length.
;The following values are written to the sprite palette:
Bank05_LA145:  .byte $05, $09, $17

Bank05_LA148:  .byte $00           ;End Palette07 info.

_Palette08:
Bank05_LA149:  .byte $3F           ;Upper byte of PPU palette adress.
Bank05_LA14A:  .byte $11           ;Lower byte of PPU palette adress.
Bank05_LA14B:  .byte $03           ;Palette data length.
;The following values are written to the sprite palette:
Bank05_LA14C:  .byte $06, $0A, $26

Bank05_LA14F:  .byte $00           ;End Palette08 info.

_Palette09:
Bank05_LA150:  .byte $3F           ;Upper byte of PPU palette adress.
Bank05_LA151:  .byte $11           ;Lower byte of PPU palette adress.
Bank05_LA152:  .byte $03           ;Palette data length.
;The following values are written to the sprite palette:
Bank05_LA153:  .byte $16, $19, $27

Bank05_LA156:  .byte $00           ;End Palette09 info.

_Palette0A:
Bank05_LA157:  .byte $3F           ;Upper byte of PPU palette adress.
Bank05_LA158:  .byte $00           ;Lower byte of PPU palette adress.
Bank05_LA159:  .byte $04           ;Palette data length.
;The following values are written to the background palette:
Bank05_LA15A:  .byte $0F, $30, $30, $21

Bank05_LA15E:  .byte $00           ;End Palette0A info.

_Palette0B:
Bank05_LA15F:  .byte $3F           ;Upper byte of PPU palette adress.
Bank05_LA160:  .byte $10           ;Lower byte of PPU palette adress.
Bank05_LA161:  .byte $04           ;Palette data length.
;The following values are written to the sprite palette:
Bank05_LA162:  .byte $0F, $15, $34, $17

Bank05_LA166:  .byte $00           ;End Palette0B info.

_Palette0C:
Bank05_LA167:  .byte $3F           ;Upper byte of PPU palette adress.
Bank05_LA168:  .byte $10           ;Lower byte of PPU palette adress.
Bank05_LA169:  .byte $04           ;Palette data length.
;The following values are written to the sprite palette:
Bank05_LA16A:  .byte $0F, $15, $34, $19

Bank05_LA16E:  .byte $00           ;End Palette0C info.

_Palette0D:
Bank05_LA16F:  .byte $3F           ;Upper byte of PPU palette adress.
Bank05_LA170:  .byte $10           ;Lower byte of PPU palette adress.
Bank05_LA171:  .byte $04           ;Palette data length.
;The following values are written to the sprite palette:
Bank05_LA172:  .byte $0F, $15, $34, $28

Bank05_LA176:  .byte $00           ;End Palette0D info.

_Palette0E:
Bank05_LA177:  .byte $3F           ;Upper byte of PPU palette adress.
Bank05_LA178:  .byte $10           ;Lower byte of PPU palette adress.
Bank05_LA179:  .byte $04           ;Palette data length.
;The following values are written to the sprite palette:
Bank05_LA17A:  .byte $0F, $15, $34, $29

Bank05_LA17E:  .byte $00           ;End Palette0E info.

;----------------------------[ Room and structure pointer tables ]-----------------------------------

_RmPtrTbl:
Bank05_LA17F:  .word $A23F, $A23F, $A247, $A273, $A29E, $A2B2, $A2E4, $A30F
Bank05_LA18F:  .word $A34D, $A383, $A3B8, $A3F9, $A429, $A455, $A48C, $A4C3
Bank05_LA19F:  .word $A4F6, $A525, $A555, $A5A1, $A5E5, $A618, $A653, $A67C
Bank05_LA1AF:  .word $A6A9, $A6D6, $A6FF, $A72C, $A76B, $A79D, $A7CF, $A7FC
Bank05_LA1BF:  .word $A826, $A849, $A867, $A88D, $A8BF, $A8EC, $A92A, $A95D
Bank05_LA1CF:  .word $A97B, $A9A5

_StrctPtrTbl:
Bank05_LA1D3:  .word $A9BF, $A9D2, $A9D9, $A9E0, $A9F9, $A9FD, $AA02, $AA07
Bank05_LA1E3:  .word $AA17, $AA2C, $AA32, $AA3D, $AA57, $AA64, $AA6D, $AA78
Bank05_LA1F3:  .word $AA83, $AA86, $AA8C, $AA96, $AAAB, $AAC7, $AAD2, $AAD9
Bank05_LA203:  .word $AAEE, $AB0A, $AB11, $AB1A, $AB1D

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

;Missiles.
Bank05_LA20D:  .byte $18
Bank05_LA20E:  .word $A21B
Bank05_LA210:  .byte $12, $06, $02, $09, $6D, $00

;Elevator to Norfair.
Bank05_LA216:  .byte $19, $FF, $04, $84, $00

;Energy tank.
Bank05_LA21B:  .byte $19
Bank05_LA21C:  .word $A224
Bank05_LA21E:  .byte $11, $FF, $02, $08, $74, $0

;Missiles.
Bank05_LA224:  .byte $1B
Bank05_LA225:  .word $A22D
Bank05_LA227:  .byte $18, $FF, $02, $09, $6D, $00

;Energy tank.
Bank05_LA22D:  .byte $1D
Bank05_LA22E:  .word $A236
Bank05_LA230:  .byte $0F, $FF, $02, $08, $66, $00

;Missiles.
Bank05_LA236:  .byte $1E
Bank05_LA237:  .word $FFFF
Bank05_LA239:  .byte $14, $FF, $02, $09, $6D, $00

;-----------------------------------------[ Room definitions ]---------------------------------------

;The first byte of the room definitions is attribute table data and is used to set the base color of
;the room. The object data is grouped into 3 byte segments and represents a structure in the room.
;The first byte of the structure data has the format yyyyxxxx and contains the y, x location of the
;structure in the room(measured in tiles). The second byte is an index into the StrctPtrTbl and
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
Bank05_LA23F:  .byte $02           ;Attribute table data.
;Room object data:
Bank05_LA240:  .byte $07, $03, $02, $87, $03, $02, $FF

;Room #$01
Bank05_LA247:  .byte $03           ;Attribute table data.
;Room object data:
Bank05_LA248:  .byte $00, $07, $03, $01, $08, $03, $06, $09, $03, $0B, $08, $03, $0E, $07, $03, $50
Bank05_LA258:  .byte $07, $03, $5E, $07, $03, $93, $0A, $00, $96, $09, $03, $9C, $0A, $00, $A0, $07
Bank05_LA268:  .byte $03, $AE, $07, $03, $E2, $08, $03, $EA, $08, $03, $FF

;Room #$02
Bank05_LA273:  .byte $03           ;Attribute table data.
;Room object data:
Bank05_LA274:  .byte $00, $07, $03, $0E, $07, $03, $46, $08, $03, $50, $01, $02, $5F, $01, $02, $80
Bank05_LA284:  .byte $08, $03, $84, $09, $03, $88, $09, $03, $8C, $08, $03, $B0, $08, $03, $BC, $08
Bank05_LA294:  .byte $03, $D4, $00, $03, $FD
;Room enemy/door data:
Bank05_LA299:  .byte $02, $A1, $02, $B1, $FF

;Room #$03
Bank05_LA29E:  .byte $03           ;Attribute table data.
;Room object data:
Bank05_LA29F:  .byte $00, $07, $03, $0E, $07, $03, $50, $07, $03, $5E, $07, $03, $A0, $07, $03, $AE
Bank05_LA2AF:  .byte $07, $03, $FF

;Room #$04
Bank05_LA2B2:  .byte $03           ;Attribute table data.
;Room object data:
Bank05_LA2B3:  .byte $00, $08, $03, $04, $08, $03, $08, $08, $03, $0C, $08, $03, $40, $08, $03, $44
Bank05_LA2C3:  .byte $08, $03, $48, $08, $03, $4C, $08, $03, $70, $08, $03, $74, $08, $03, $78, $08
Bank05_LA2D3:  .byte $03, $7C, $08, $03, $B0, $08, $03, $B4, $08, $03, $B8, $08, $03, $BC, $08, $03
Bank05_LA2E3:  .byte $FF

;Room #$05
Bank05_LA2E4:  .byte $03           ;Attribute table data.
;Room object data:
Bank05_LA2E5:  .byte $00, $07, $03, $05, $08, $03, $0E, $07, $03, $50, $01, $02, $5F, $01, $02, $68
Bank05_LA2F5:  .byte $08, $03, $80, $07, $03, $82, $09, $03, $8C, $09, $03, $8E, $07, $03, $AE, $07
Bank05_LA305:  .byte $03, $B0, $07, $03, $FD
;Room enemy/door data:
Bank05_LA30A:  .byte $02, $A1, $02, $B1, $FF

;Room #$06
Bank05_LA30F:  .byte $03           ;Attribute table data.
;Room object data:
Bank05_LA310:  .byte $00, $07, $03, $0E, $07, $03, $26, $04, $03, $35, $09, $03, $50, $01, $02, $5E
Bank05_LA320:  .byte $07, $03, $80, $07, $03, $82, $09, $03, $89, $09, $03, $AE, $07, $03, $B2, $05
Bank05_LA330:  .byte $01, $C4, $09, $03, $D0, $07, $03, $DC, $04, $03, $EB, $09, $03, $FD
;Room enemy/door data:
Bank05_LA33E:  .byte $02, $B1, $07, $87, $27, $17, $87, $DD, $21, $86, $B5, $31, $86, $7B, $FF

;Room #$07
Bank05_LA34D:  .byte $03           ;Attribute table data.
;Room object data:
Bank05_LA34E:  .byte $00, $07, $03, $0E, $07, $03, $22, $05, $01, $26, $09, $03, $50, $07, $03, $5E
Bank05_LA35E:  .byte $07, $03, $62, $09, $03, $79, $09, $03, $95, $04, $03, $A0, $07, $03, $A4, $09
Bank05_LA36E:  .byte $03, $AE, $07, $03, $E8, $09, $03, $FD
;Room enemy/door data:
Bank05_LA376:  .byte $51, $06, $17, $01, $86, $6B, $11, $86, $DA, $27, $87, $96, $FF

;Room #$08
Bank05_LA383:  .byte $03           ;Attribute table data.
;Room object data:
Bank05_LA384:  .byte $00, $07, $03, $0E, $07, $03, $26, $09, $03, $2D, $06, $01, $50, $01, $02, $5C
Bank05_LA394:  .byte $09, $03, $5E, $07, $03, $80, $08, $03, $84, $08, $03, $88, $08, $03, $8C, $08
Bank05_LA3A4:  .byte $03, $C0, $08, $03, $CC, $08, $03, $D4, $00, $03, $FD
;Room enemy/door data:
Bank05_LA3AF:  .byte $02, $B1, $31, $86, $18, $41, $86, $78, $FF

;Room #$09
Bank05_LA3B8:  .byte $00           ;Attribute table data.
;Room object data:
Bank05_LA3B9:  .byte $00, $07, $03, $07, $19, $00, $0E, $07, $03, $45, $19, $00, $4C, $19, $00, $50
Bank05_LA3C9:  .byte $07, $03, $5F, $01, $02, $72, $19, $00, $8C, $09, $03, $8E, $07, $03, $A0, $07
Bank05_LA3D9:  .byte $03, $AB, $19, $00, $B4, $19, $00, $BE, $07, $03, $E8, $19, $00, $FD
;Room enemy/door data:
Bank05_LA3E7:  .byte $02, $A1, $01, $06, $34, $11, $86, $3C, $21, $06, $9B, $31, $86, $A4, $51, $86
Bank05_LA3F7:  .byte $D8, $FF

;Room #$0A
Bank05_LA3F9:  .byte $03           ;Attribute table data.
;Room object data:
Bank05_LA3FA:  .byte $00, $07, $03, $0E, $07, $03, $16, $19, $00, $50, $07, $03, $53, $19, $00, $5E
Bank05_LA40A:  .byte $07, $03, $86, $19, $00, $A0, $07, $03, $AE, $07, $03, $B9, $19, $00, $BD, $06
Bank05_LA41A:  .byte $01, $FD
;Room enemy/door data:
Bank05_LA41C:  .byte $41, $86, $06, $01, $06, $43, $11, $86, $76, $21, $86, $A9, $FF

;Room #$0B
Bank05_LA429:  .byte $03           ;Attribute table data.
;Room object data:
Bank05_LA42A:  .byte $00, $07, $03, $0E, $07, $03, $50, $07, $03, $5F, $01, $02, $80, $08, $03, $84
Bank05_LA43A:  .byte $08, $03, $88, $09, $03, $8C, $08, $03, $C0, $08, $03, $CC, $08, $03, $D4, $00
Bank05_LA44A:  .byte $03, $FD
;Room enemy/door data:
Bank05_LA44C:  .byte $02, $A1, $31, $82, $74, $41, $82, $79, $FF

;Room #$0C
Bank05_LA455:  .byte $00           ;Attribute table data.
;Room object data:
Bank05_LA456:  .byte $00, $0B, $00, $04, $0B, $00, $08, $0B, $00, $0C, $0B, $00, $50, $01, $02, $5F
Bank05_LA466:  .byte $01, $02, $80, $0B, $00, $82, $0B, $00, $86, $0C, $00, $88, $0B, $00, $8C, $0B
Bank05_LA476:  .byte $00, $C0, $0B, $00, $C2, $0B, $00, $C6, $0C, $00, $D8, $0B, $00, $DC, $0B, $00
Bank05_LA486:  .byte $FD
;Room enemy/door data:
Bank05_LA487:  .byte $02, $A0, $02, $B1, $FF

;Room #$0D
Bank05_LA48C:  .byte $00           ;Attribute table data.
;Room object data:
Bank05_LA48D:  .byte $00, $0B, $00, $04, $0B, $00, $08, $0B, $00, $0C, $0B, $00, $0E, $0D, $00, $1E
Bank05_LA49D:  .byte $0D, $00, $50, $01, $02, $5F, $01, $02, $80, $0B, $00, $84, $0B, $00, $88, $0B
Bank05_LA4AD:  .byte $00, $8C, $0B, $00, $C0, $0B, $00, $C4, $0B, $00, $C8, $0B, $00, $CC, $0B, $00
Bank05_LA4BD:  .byte $FD
;Room enemy/door data:
Bank05_LA4BE:  .byte $02, $A1, $02, $B1, $FF

;Room #$0E
Bank05_LA4C3:  .byte $00           ;Attribute table data.
;Room object data:
Bank05_LA4C4:  .byte $00, $0E, $00, $04, $0E, $00, $08, $0E, $00, $0C, $0E, $00, $7D, $0A, $00, $B0
Bank05_LA4D4:  .byte $0B, $00, $B4, $0B, $00, $B8, $0C, $00, $B9, $0B, $00, $BE, $0B, $00, $BF, $0C
Bank05_LA4E4:  .byte $00, $D0, $00, $03, $D8, $00, $03, $FD
;Room enemy/door data:
Bank05_LA4EC:  .byte $51, $80, $27, $01, $02, $A4, $11, $02, $AA, $FF

;Room #$0F
Bank05_LA4F6:  .byte $00           ;Attribute table data.
;Room object data:
Bank05_LA4F7:  .byte $00, $0E, $00, $04, $0E, $00, $08, $0E, $00, $0B, $0E, $00, $0F, $0A, $00, $5F
Bank05_LA507:  .byte $02, $02, $8C, $08, $03, $CC, $08, $03, $D0, $0F, $03, $D4, $00, $03, $D8, $0F
Bank05_LA517:  .byte $03, $FD
;Room enemy/door data:
Bank05_LA519:  .byte $02, $A2, $51, $80, $27, $21, $80, $29, $11, $80, $2B, $FF

;Room #$10
Bank05_LA525:  .byte $03           ;Attribute table data.
;Room object data:
Bank05_LA526:  .byte $00, $08, $03, $04, $08, $03, $08, $0E, $00, $0C, $0E, $00, $40, $08, $03, $42
Bank05_LA536:  .byte $0B, $00, $70, $08, $03, $72, $0B, $00, $76, $0A, $00, $B0, $08, $03, $B4, $08
Bank05_LA546:  .byte $03, $D8, $0F, $03, $DC, $0F, $03, $FD
;Room enemy/door data:
Bank05_LA54E:  .byte $31, $80, $2E, $41, $80, $2B, $FF

;Room #$11
Bank05_LA555:  .byte $03           ;Attribute table data.
;Room object data:
Bank05_LA556:  .byte $00, $07, $03, $02, $11, $03, $06, $11, $03, $0A, $11, $03, $0E, $07, $03, $13
Bank05_LA566:  .byte $10, $03, $14, $12, $03, $1C, $10, $03, $22, $0A, $00, $50, $02, $02, $5F, $02
Bank05_LA576:  .byte $02, $80, $07, $03, $84, $11, $03, $8F, $07, $03, $92, $19, $00, $95, $11, $03
Bank05_LA586:  .byte $99, $11, $03, $AE, $19, $00, $C0, $07, $03, $D2, $00, $03, $D7, $00, $03, $DF
Bank05_LA596:  .byte $07, $03, $FD
;Room enemy/door data:
Bank05_LA599:  .byte $02, $A1, $02, $B2, $01, $49, $66, $FF

;Room #$12
Bank05_LA5A1:  .byte $01           ;Attribute table data.
;Room object data:
Bank05_LA5A2:  .byte $00, $07, $03, $01, $0E, $00, $05, $0E, $00, $09, $0E, $00, $0D, $0E, $00, $22
Bank05_LA5B2:  .byte $11, $03, $26, $11, $03, $50, $02, $02, $80, $07, $03, $81, $11, $03, $8B, $0A
Bank05_LA5C2:  .byte $00, $A7, $0A, $00, $B0, $07, $03, $BF, $0A, $00, $D2, $00, $03, $DA, $00, $03
Bank05_LA5D2:  .byte $FD
;Room enemy/door data:
Bank05_LA5D3:  .byte $02, $B1, $11, $86, $97, $21, $06, $7B, $31, $86, $AF, $41, $80, $35, $51, $83
Bank05_LA5E3:  .byte $3E, $FF

;Room #$13
Bank05_LA5E5:  .byte $01           ;Attribute table data.
;Room object data:
Bank05_LA5E6:  .byte $00, $0E, $00, $04, $0E, $00, $08, $0E, $00, $0C, $0E, $00, $86, $0A, $00, $8A
Bank05_LA5F6:  .byte $0A, $00, $A2, $0A, $00, $A3, $0A, $00, $BE, $0A, $00, $D0, $00, $03, $D8, $00
Bank05_LA606:  .byte $03, $FD
;Room enemy/door data:
Bank05_LA608:  .byte $01, $86, $92, $11, $86, $76, $21, $86, $7A, $31, $06, $AE, $41, $80, $27, $FF

;Room #$14
Bank05_LA618:  .byte $01           ;Attribute table data.
;Room object data:
Bank05_LA619:  .byte $00, $0E, $00, $04, $0E, $00, $08, $0E, $00, $0C, $0B, $00, $5F, $01, $02, $85
Bank05_LA629:  .byte $0A, $00, $86, $0A, $00, $8C, $11, $03, $9E, $07, $03, $A2, $0A, $00, $B9, $0A
Bank05_LA639:  .byte $00, $CE, $07, $03, $D0, $00, $03, $D6, $00, $03, $FD
;Room enemy/door data:
Bank05_LA644:  .byte $02, $A1, $51, $86, $92, $01, $86, $75, $21, $80, $23, $31, $80, $28, $FF

;Room #$15
Bank05_LA653:  .byte $01           ;Attribute table data.
;Room object data:
Bank05_LA654:  .byte $00, $14, $01, $08, $14, $01, $10, $13, $01, $50, $01, $02, $80, $13, $01, $94
Bank05_LA664:  .byte $05, $01, $C0, $14, $01, $CA, $14, $01, $D8, $00, $03, $FD
;Room enemy/door data:
Bank05_LA670:  .byte $02, $B1, $41, $80, $37, $51, $80, $3C, $01, $80, $3E, $FF

;Room #$16
Bank05_LA67C:  .byte $01           ;Attribute table data.
;Room object data:
Bank05_LA67D:  .byte $00, $14, $01, $08, $14, $01, $30, $14, $01, $38, $14, $01, $90, $14, $01, $92
La68D:  .byte $04, $03, $94, $04, $03, $98, $14, $01, $9B, $04, $03, $C0, $14, $01, $C8, $14
Bank05_LA69D:  .byte $01, $FD
;Room enemy/door data:
Bank05_LA69F:  .byte $17, $87, $93, $27, $07, $95, $37, $87, $9C, $FF

;Room #$17
Bank05_LA6A9:  .byte $01           ;Attribute table data.
;Room object data:
Bank05_LA6AA:  .byte $00, $14, $01, $08, $14, $01, $30, $14, $01, $38, $14, $01, $52, $13, $01, $5A
Bank05_LA6BA:  .byte $13, $01, $61, $06, $01, $C0, $14, $01, $C3, $04, $03, $C8, $14, $01, $CB, $04
Bank05_LA6CA:  .byte $03, $FD
;Room enemy/door data:
Bank05_LA6CC:  .byte $47, $87, $C4, $57, $87, $CC, $01, $80, $67, $FF

;Room #$18
Bank05_LA6D6:  .byte $01           ;Attribute table data.
;Room object data:
Bank05_LA6D7:  .byte $00, $14, $01, $08, $14, $01, $1C, $13, $01, $5F, $01, $02, $8C, $13, $01, $C0
Bank05_LA6E7:  .byte $14, $01, $CA, $14, $01, $D0, $00, $03, $D5, $00, $03, $FD
;Room enemy/door data:
Bank05_LA6F3:  .byte $02, $A1, $11, $80, $33, $21, $00, $35, $31, $80, $37, $FF

;Room #$19
Bank05_LA6FF:  .byte $00           ;Attribute table data.
;Room object data:
Bank05_LA700:  .byte $00, $14, $01, $08, $14, $01, $30, $14, $01, $38, $14, $01, $D0, $00, $03, $D2
Bank05_LA710:  .byte $13, $01, $D7, $13, $01, $D8, $04, $03, $DB, $00, $03, $DC, $13, $01, $FD
;Room enemy/door data:
Bank05_LA71E:  .byte $41, $00, $64, $51, $80, $68, $01, $00, $6C, $17, $87, $D9, $FF

;Room #$1A
Bank05_LA72C:  .byte $01           ;Attribute table data.
;Room object data:
Bank05_LA72D:  .byte $00, $14, $01, $08, $14, $01, $30, $13, $01, $34, $13, $01, $38, $13, $01, $3C
Bank05_LA73D:  .byte $13, $01, $40, $16, $01, $41, $15, $01, $44, $15, $01, $48, $15, $01, $4C, $15
Bank05_LA74D:  .byte $01, $4F, $16, $01, $90, $14, $01, $92, $04, $03, $98, $14, $01, $9B, $04, $03
Bank05_LA75D:  .byte $C0, $14, $01, $C8, $14, $01, $FD
;Room enemy/door data:
Bank05_LA764:  .byte $27, $87, $93, $37, $87, $9C, $FF

;Room #$1B
Bank05_LA76B:  .byte $02           ;Attribute table data.
;Room object data:
Bank05_LA76C:  .byte $00, $18, $02, $08, $18, $02, $20, $18, $02, $28, $0A, $00, $50, $01, $02, $5F
Bank05_LA77C:  .byte $19, $00, $80, $17, $02, $8C, $19, $00, $C0, $18, $02, $CA, $18, $02, $D8, $00
Bank05_LA78C:  .byte $03, $FD
;Room enemy/door data:
Bank05_LA78E:  .byte $02, $B1, $01, $8C, $39, $11, $0C, $3D, $21, $8C, $6B, $31, $0C, $66, $FF

;Room #$1C
Bank05_LA79D:  .byte $02           ;Attribute table data.
;Room object data:
Bank05_LA79E:  .byte $00, $18, $02, $08, $18, $02, $28, $18, $02, $5F, $01, $02, $70, $19, $00, $8C
Bank05_LA7AE:  .byte $17, $02, $94, $19, $00, $B8, $17, $02, $BC, $17, $02, $C0, $18, $02, $D0, $00
Bank05_LA7BE:  .byte $03, $FD
;Room enemy/door data:
Bank05_LA7C0:  .byte $02, $A1, $01, $8C, $33, $11, $0C, $36, $41, $8C, $92, $51, $0C, $A6, $FF

;Room #$1D
Bank05_LA7CF:  .byte $00           ;Attribute table data.
;Room object data:
Bank05_LA7D0:  .byte $00, $18, $02, $08, $18, $02, $30, $0A, $00, $49, $19, $00, $55, $0A, $00, $5D
Bank05_LA7E0:  .byte $0A, $00, $A0, $18, $02, $A8, $18, $02, $D0, $00, $03, $D8, $00, $03, $FD
;Room enemy/door data:
Bank05_LA7F1:  .byte $21, $8C, $38, $31, $0C, $97, $41, $8C, $99, $51, $0C, $9B, $FF

;Room #$1E
Bank05_LA7FC:  .byte $02           ;Attribute table data.
;Room object data:
Bank05_LA7FD:  .byte $00, $17, $02, $04, $17, $02, $08, $17, $02, $0C, $17, $02, $70, $17, $02, $74
Bank05_LA80D:  .byte $17, $02, $78, $17, $02, $7C, $17, $02, $D0, $00, $03, $D8, $00, $03, $FD
;Room enemy/door data:
Bank05_LA81C:  .byte $01, $8C, $42, $11, $0C, $45, $21, $8C, $48, $FF

;Room #$1F
Bank05_LA826:  .byte $00           ;Attribute table data.
;Room object data:
Bank05_LA827:  .byte $00, $0B, $00, $04, $18, $02, $0C, $0B, $00, $50, $01, $02, $80, $0B, $00, $C0
Bank05_LA837:  .byte $18, $02, $C8, $18, $02, $FD
;Room enemy/door data:
Bank05_LA83D:  .byte $02, $B1, $21, $82, $5B, $31, $03, $85, $41, $83, $88, $FF

;Room #$20
Bank05_LA849:  .byte $02           ;Attribute table data.
;Room object data:
Bank05_LA84A:  .byte $20, $18, $02, $28, $18, $02, $A0, $18, $02, $A8, $18, $02, $D0, $00, $03, $D8
Bank05_LA85A:  .byte $00, $03, $FD
;Room enemy/door data:
Bank05_LA85D:  .byte $01, $82, $98, $11, $02, $9E, $41, $83, $53, $FF

;Room #$21
Bank05_LA867:  .byte $00           ;Attribute table data.
;Room object data:
Bank05_LA868:  .byte $00, $0B, $00, $04, $18, $02, $0C, $0B, $00, $5F, $01, $02, $8C, $0B, $00, $C0
Bank05_LA878:  .byte $18, $02, $C8, $18, $02, $FD
;Room enemy/door data:
Bank05_LA87E:  .byte $02, $A1, $11, $02, $57, $31, $83, $85, $41, $83, $88, $51, $03, $8A, $FF

;Room #$22
Bank05_LA88D:  .byte $00           ;Attribute table data.
;Room object data:
Bank05_LA88E:  .byte $00, $07, $03, $02, $12, $03, $0A, $12, $03, $50, $01, $02, $80, $07, $03, $82
Bank05_LA89E:  .byte $0B, $00, $8F, $0B, $00, $B0, $07, $03, $B9, $0B, $00, $D2, $00, $03, $DA, $00
Bank05_LA8AE:  .byte $03, $FD
;Room enemy/door data:
Bank05_LA8B0:  .byte $02, $B1, $01, $80, $18, $11, $80, $1E, $21, $86, $AB, $31, $86, $7F, $FF

;Room #$23
Bank05_LA8BF:  .byte $01           ;Attribute table data.
;Room object data:
Bank05_LA8C0:  .byte $00, $12, $03, $08, $12, $03, $92, $04, $03, $94, $04, $03, $99, $0B, $00, $A2
Bank05_LA8D0:  .byte $0B, $00, $BF, $0B, $00, $D0, $00, $03, $D8, $00, $03, $FD
;Room enemy/door data:
Bank05_LA8DC:  .byte $07, $87, $93, $11, $00, $1A, $21, $80, $1F, $47, $87, $95, $51, $86, $8B, $FF

;Room #$24
Bank05_LA8EC:  .byte $02           ;Attribute table data.
;Room object data:
Bank05_LA8ED:  .byte $00, $0B, $00, $04, $0E, $00, $08, $0E, $00, $0C, $0E, $00, $37, $0A, $00, $50
Bank05_LA8FD:  .byte $01, $02, $77, $0A, $00, $80, $17, $02, $8D, $1A, $01, $C0, $18, $02, $C4, $1B
Bank05_LA90D:  .byte $02, $C8, $18, $02, $D4, $1C, $02, $D8, $1C, $02, $DC, $1C, $02, $FD
;Room enemy/door data:
Bank05_LA91B:  .byte $02, $B0, $01, $82, $27, $11, $82, $2B, $21, $83, $B5, $31, $83, $BA, $FF

;Room #$25
Bank05_LA92A:  .byte $02           ;Attribute table data.
;Room object data:
Bank05_LA92B:  .byte $00, $0E, $00, $04, $0E, $00, $08, $0E, $00, $0C, $0E, $00, $87, $1A, $01, $C0
Bank05_LA93B:  .byte $18, $02, $C8, $18, $02, $CF, $1B, $02, $D0, $1C, $02, $D4, $1C, $02, $D8, $1C
Bank05_LA94B:  .byte $02, $DC, $1C, $02, $FD
;Room enemy/door data:
Bank05_LA950:  .byte $21, $82, $26, $31, $02, $2B, $41, $83, $B3, $51, $03, $BC, $FF

;Room #$26
Bank05_LA95D:  .byte $01           ;Attribute table data.
;Room object data:
Bank05_LA95E:  .byte $00, $14, $01, $08, $14, $01, $B2, $04, $03, $C0, $14, $01, $C9, $14, $01, $D0
Bank05_LA96E:  .byte $00, $03, $D8, $00, $03, $FD
;Room enemy/door data:
Bank05_LA974:  .byte $07, $87, $B3, $11, $03, $29, $FF

;Room #$27
Bank05_LA97B:  .byte $01           ;Attribute table data.
;Room object data:
Bank05_LA97C:  .byte $00, $14, $01, $08, $14, $01, $10, $0A, $00, $60, $0A, $00, $B0, $0A, $00, $B5
Bank05_LA98C:  .byte $04, $03, $C1, $14, $01, $CA, $14, $01, $D1, $00, $03, $D8, $00, $03, $FD
;Room enemy/door data:
Bank05_LA99B:  .byte $27, $87, $B6, $11, $82, $B7, $11, $80, $27, $FF

;Room #$28
Bank05_LA9A5:  .byte $00           ;Attribute table data.
;Room object data:
Bank05_LA9A6:  .byte $00, $0B, $00, $0C, $0B, $00, $50, $01, $02, $5C, $0B, $00, $80, $0B, $00, $AF
Bank05_LA9B6:  .byte $0B, $00, $D0, $0B, $00, $FD
;Room enemy/door data:
Bank05_LA9BC:  .byte $02, $B1, $FF

;---------------------------------------[ Structure definitions ]------------------------------------

;The first byte of the structure definition states how many macros are in the first row of the
;structure. The the number of bytes after the macro number byte is equal to the value of the macro
;number byte and those bytes define what each macro in the row are. For example, if the macro number
;byte is #$08, the next 8 bytes represent 8 macros. The macro description bytes are the macro numbers
;and are multiplied by 4 to find the index to the desired macro in MacroDefs.  Any further bytes in
;the structure definition represent the next rows.  #$FF marks the end of the structure definition.

;Structure #$00
Bank05_LA9BF:  .byte $08, $00, $00, $00, $00, $00, $00, $00, $00, $08, $01, $01, $01, $01, $01, $01
Bank05_LA9CF:  .byte $01, $01, $FF

;Structure #$01
Bank05_LA9D2:  .byte $01, $12, $01, $12, $01, $12, $FF

;Structure #$02
Bank05_LA9D9:  .byte $01, $13, $01, $13, $01, $13, $FF

;Structure #$03
Bank05_LA9E0:  .byte $02, $02, $03, $02, $02, $03, $02, $02, $03, $02, $02, $03, $02, $02, $03
Bank05_LA9F0:  .byte $02, $02, $03, $02, $02, $03, $02, $02, $03, $FF

;Structure #$04
Bank05_LA9F9:  .byte $02, $06, $07, $FF

;Structure #$05
Bank05_LA9FD:  .byte $01, $0A, $01, $0A, $FF

;Structure #$06
Bank05_LAA02:  .byte $01, $0B, $01, $0B, $FF

;Structure #$07
Bank05_LAA07:  .byte $02, $08, $08, $02, $08, $05, $02, $09, $08, $02, $08, $08, $02, $05, $08, $FF

;Structure #$08
Bank05_LAA17:  .byte $04, $08, $08, $08, $08, $04, $08, $09, $09, $08, $04, $08, $09, $09, $08, $04
Bank05_LAA27:  .byte $08, $08, $08, $08, $FF

;Structure #$09
Bank05_LAA2C:  .byte $04, $08, $09, $09, $08, $FF

;Structure #$0A
Bank05_LAA32:  .byte $01, $14, $01, $05, $01, $05, $01, $05, $01, $14, $FF

;Structure #$0B
Bank05_LAA3D:  .byte $04, $15, $15, $15, $15, $04, $15, $15, $15, $15, $04, $15, $15, $15, $15, $04
Bank05_LAA4D:  .byte $15, $15, $15, $15, $04, $15, $15, $15, $15, $FF

;Structure #$0C
Bank05_LAA57:  .byte $02, $16, $16, $02, $16, $16, $02, $16, $16, $02, $16, $16, $FF

;Structure #$0D
Bank05_LAA64:  .byte $01, $17, $01, $17, $01, $17, $01, $17, $FF

;Structure #$0E
Bank05_LAA6D:  .byte $04, $11, $11, $11, $11, $04, $11, $11, $11, $11, $FF

;Structure #$0F
Bank05_LAA78:  .byte $04, $18, $18, $18, $18, $04, $19, $19, $19, $19, $FF

;Structure #$10
Bank05_LAA83:  .byte $01, $1B, $FF

;Structure #$11
Bank05_LAA86:  .byte $04, $1A, $1A, $1A, $1A, $FF

;Structure #$12
Bank05_LAA8C:  .byte $08, $0F, $0F, $0F, $0F, $10, $10, $10, $10, $FF

;Structure #$13
Bank05_LAA96:  .byte $04, $0D, $0D, $0D, $0D, $04, $0D, $0E, $0E, $0D, $04, $0D, $0E, $0E, $0D, $04
Bank05_LAAA6:  .byte $0D, $0D, $0D, $0D, $FF

;Structure #$14
Bank05_LAAAB:  .byte $08, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $08, $0D, $0E, $0E, $0E, $0E, $0E
Bank05_LAABB:  .byte $0E, $0D, $08, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $FF

;Structure #$15
Bank05_LAAC7:  .byte $04, $1C, $1C, $1C, $1C, $04, $1C, $1C, $1C, $1C, $FF

;Structure #$16
Bank05_LAAD2:  .byte $01, $1D, $01, $1D, $01, $1D, $FF

;Structure #$17
Bank05_LAAD9:  .byte $04, $1E, $1E, $1E, $1E, $04, $1E, $05, $05, $1E, $04, $1E, $05, $05, $1E, $04
Bank05_LAAE9:  .byte $1E, $1E, $1E, $1E, $FF

;Structure #$18
Bank05_LAAEE:  .byte $08, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $08, $1E, $09, $09, $09, $09, $09
Bank05_LAAFE:  .byte $09, $1E, $08, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $FF

;Structure #$19
Bank05_LAB0A:  .byte $01, $14, $01, $05, $01, $14, $FF

;Structure #$1A
Bank05_LAB11:  .byte $01, $04, $01, $04, $01, $04, $01, $04, $FF

;Structure #$1B
Bank05_LAB1A:  .byte $01, $1F, $FF

;Structure #$1C
Bank05_LAB1D:  .byte $04, $20, $20, $20, $20, $FF


;----------------------------------------[ Macro definitions ]---------------------------------------

;The macro definitions are simply index numbers into the pattern tables that represent the 4 quadrants
;of the macro definition. The bytes correspond to the following position in order: lower right tile,
;lower left tile, upper right tile, upper left tile. 

_MacroDefs:

Bank05_LAB23:  .byte $FF, $FF, $F0, $F0
Bank05_LAB27:  .byte $F1, $F1, $F1, $F1
Bank05_LAB2B:  .byte $A4, $FF, $A4, $FF
Bank05_LAB2F:  .byte $FF, $A5, $FF, $A5
Bank05_LAB33:  .byte $80, $81, $82, $83
Bank05_LAB37:  .byte $45, $46, $45, $46
Bank05_LAB3B:  .byte $FF, $FF, $59, $5A
Bank05_LAB3F:  .byte $FF, $FF, $5A, $5B
Bank05_LAB43:  .byte $60, $61, $62, $63
Bank05_LAB47:  .byte $0C, $0D, $0E, $0F
Bank05_LAB4B:  .byte $EC, $FF, $ED, $FF
Bank05_LAB4F:  .byte $FF, $EE, $FF, $EF
Bank05_LAB53:  .byte $1C, $1D, $1E, $1F
Bank05_LAB57:  .byte $20, $21, $22, $23
Bank05_LAB5B:  .byte $25, $25, $24, $24
Bank05_LAB5F:  .byte $26, $27, $28, $29
Bank05_LAB63:  .byte $2A, $2B, $2C, $2D
Bank05_LAB67:  .byte $18, $19, $1A, $1B
Bank05_LAB6B:  .byte $A0, $A0, $A0, $A0
Bank05_LAB6F:  .byte $A1, $A1, $A1, $A1
Bank05_LAB73:  .byte $10, $11, $12, $13
Bank05_LAB77:  .byte $04, $05, $06, $07
Bank05_LAB7B:  .byte $E0, $E1, $E2, $E3
Bank05_LAB7F:  .byte $70, $71, $72, $73
Bank05_LAB83:  .byte $FF, $FF, $43, $43
Bank05_LAB87:  .byte $44, $44, $44, $44
Bank05_LAB8B:  .byte $14, $15, $16, $17
Bank05_LAB8F:  .byte $88, $89, $8A, $8B
Bank05_LAB93:  .byte $E8, $E9, $EA, $EB
Bank05_LAB97:  .byte $78, $79, $7A, $7B
Bank05_LAB9B:  .byte $55, $56, $57, $58
Bank05_LAB9F:  .byte $90, $91, $92, $93
Bank05_LABA3:  .byte $C7, $C8, $C9, $CA

;Not used.
Bank05_LABA7:  .byte $11, $11, $11, $04, $11, $11, $11, $11, $FF, $08, $20, $22, $22, $22, $22, $22
Bank05_LABB7:  .byte $22, $22, $FF, $01, $1F, $FF, $01, $21, $01, $21, $01, $21, $FF, $08, $23, $23
Bank05_LABC7:  .byte $23, $23, $23, $23, $23, $23, $08, $23, $24, $24, $24, $24, $24, $24, $23, $08
Bank05_LABD7:  .byte $23, $23, $23, $23, $23, $23, $23, $23, $FF, $01, $23, $01, $23, $01, $23, $01
Bank05_LABE7:  .byte $23, $FF, $04, $23, $23, $23, $23, $04, $23, $24, $24, $23, $04, $23, $24, $24
Bank05_LABF7:  .byte $23, $04, $23, $23, $23, $23, $FF, $01, $25, $FF, $01, $26, $01, $26, $01, $26
Bank05_LAC07:  .byte $01, $26, $FF, $03, $27, $27, $27, $FF, $03, $28, $28, $28, $FF, $08, $13, $13
Bank05_LAC17:  .byte $13, $13, $13, $13, $13, $13, $FF, $01, $13, $01, $13, $01, $13, $01, $13, $FF
Bank05_LAC27:  .byte $04, $0C, $0C, $0C, $0C, $04, $0D, $0D, $0D, $0D, $FF, $F1, $F1, $F1, $F1, $FF
Bank05_LAC37:  .byte $FF, $F0, $F0, $64, $64, $64, $64, $FF, $FF, $64, $64, $A4, $FF, $A4, $FF, $FF
Bank05_LAC47:  .byte $A5, $FF, $A5, $A0, $A0, $A0, $A0, $A1, $A1, $A1, $A1, $4F, $4F, $4F, $4F, $84
Bank05_LAC57:  .byte $85, $86, $87, $88, $89, $8A, $8B, $80, $81, $82, $83, $FF, $FF, $BA, $BA, $BB
Bank05_LAC67:  .byte $BB, $BB, $BB, $10, $11, $12, $13, $04, $05, $06, $07, $14, $15, $16, $17, $1C
Bank05_LAC77:  .byte $1D, $1E, $1F, $09, $09, $09, $09, $0C, $0D, $0E, $0F, $FF, $FF, $59, $5A, $FF
Bank05_LAC87:  .byte $FF, $5A, $5B, $51, $52, $53, $54, $55, $56, $57, $58, $EC, $FF, $ED, $FF, $FF
Bank05_LAC97:  .byte $EE, $FF, $EF, $45, $46, $45, $46, $4B, $4C, $4D, $50, $FF, $FF, $FF, $FF, $47
Bank05_LACA7:  .byte $48, $47, $48, $08, $08, $08, $08, $70, $71, $72, $73, $74, $75, $76, $77, $E0
Bank05_LACB7:  .byte $E1, $E2, $E3, $E4, $E5, $E6, $E7, $20, $21, $22, $23, $25, $25, $24, $24, $78
Bank05_LACC7:  .byte $79, $7A, $7B, $E8, $E9, $EA, $EB, $26, $27, $28, $29, $2A, $2B, $2C, $2D, $0D
Bank05_LACD7:  .byte $1E, $07, $21, $1D, $0D, $0D, $0D, $1E, $21, $07, $21, $21, $15, $14, $15, $21
Bank05_LACE7:  .byte $21, $07, $0D, $21, $16, $10, $16, $21, $0D, $07, $1F, $0D, $20, $10, $1F, $0D
Bank05_LACF7:  .byte $20, $FF, $08, $22, $22, $0D, $22, $22, $1E, $1C, $1D, $08, $1C, $1C, $21, $1C
Bank05_LAD07:  .byte $1C, $21, $1C, $21, $08, $1C, $1C, $0C, $1C, $1C, $1F, $0D, $20, $07, $1C, $1C
Bank05_LAD17:  .byte $21, $1C, $1C, $1C, $14, $04, $1C, $14, $0D, $14, $03, $1C, $1C, $15, $FF, $02
Bank05_LAD27:  .byte $01, $01, $02, $00, $00, $FF, $01, $16, $01, $21, $01, $21, $01, $0C, $01, $21
Bank05_LAD37:  .byte $01, $0D, $01, $21, $FF, $01, $0C, $FF, $07, $22, $22, $22, $22, $22, $22, $22
Bank05_LAD47:  .byte $FF, $05, $0B, $1D, $22, $0D, $22, $04, $11, $21, $11, $21, $04, $11, $21, $11
Bank05_LAD57:  .byte $0D, $03, $11, $21, $11, $03, $23, $23, $23, $FF, $03, $19, $1B, $1A, $FF, $01
Bank05_LAD67:  .byte $34, $01, $34, $FF, $08, $1D, $22, $17, $0D, $1E, $0D, $17, $0D, $08, $0D, $22
Bank05_LAD77:  .byte $17, $20, $21, $14, $0D, $11, $08, $21, $1D, $22, $17, $20, $10, $10, $21, $08
Bank05_LAD87:  .byte $21, $1F, $17, $0D, $22, $0D, $1E, $11, $08, $0D, $14, $10, $1F, $22, $22, $20
Bank05_LAD97:  .byte $11, $FF, $08, $17, $17, $0D, $17, $17, $0D, $17, $17, $08, $0D, $17, $17, $17
Bank05_LADA7:  .byte $17, $17, $17, $0D, $FF, $08, $18, $1D, $17, $1E, $1D, $17, $17, $1E, $08, $18
Bank05_LADB7:  .byte $21, $1C, $21, $21, $1C, $1C, $21, $08, $0D, $20, $1C, $1F, $20, $1C, $1C, $1F
Bank05_LADC7:  .byte $FF, $04, $0D, $0D, $0D, $0D, $04, $18, $18, $18, $18, $04, $18, $18, $18, $18
Bank05_LADD7:  .byte $04, $18, $18, $18, $18, $FF, $07, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $07, $0D
Bank05_LADE7:  .byte $17, $17, $17, $17, $17, $0D, $07, $18, $0A, $10, $0A, $0A, $10, $18, $07, $0D
Bank05_LADF7:  .byte $17, $17, $17, $17, $17, $0D, $FF, $01, $0A, $01, $0A, $01, $0A, $01, $0A, $01
Bank05_LAE07:  .byte $0A, $01, $0A, $01, $0A, $01, $0A, $FF, $01, $0D, $01, $18, $01, $18, $01, $18
Bank05_LAE17:  .byte $01, $18, $FF, $02, $19, $1A, $FF, $01, $0D, $FF, $04, $14, $1C, $1C, $14, $04
Bank05_LAE27:  .byte $0A, $0A, $0A, $0A, $FF, $08, $0D, $22, $22, $22, $22, $22, $22, $0D, $FF, $08
Bank05_LAE37:  .byte $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $08, $0E, $10, $0E, $0E, $10, $10, $0E
Bank05_LAE47:  .byte $10, $FF, $A7, $A7, $A7, $A7, $FF, $FF, $A6, $A6, $A2, $A2, $FF, $FF, $FF, $FF
Bank05_LAE57:  .byte $A3, $A3, $A4, $FF, $A4, $FF, $FF, $A5, $FF, $A5, $FF, $79, $FF, $7E, $4F, $4F
Bank05_LAE67:  .byte $4F, $4F, $A0, $A0, $A0, $A0, $A1, $A1, $A1, $A1, $04, $05, $06, $07, $10, $11
Bank05_LAE77:  .byte $12, $13, $00, $01, $02, $03, $08, $08, $08, $08, $18, $19, $1A, $1B, $1C, $1D
Bank05_LAE87:  .byte $1E, $1F, $0C, $0D, $0E, $0F, $09, $09, $09, $09, $7A, $7B, $7F, $5A, $2A, $2C
Bank05_LAE97:  .byte $FF, $FF, $14, $15, $16, $17, $20, $21, $22, $23, $24, $25, $20, $21, $28, $28
Bank05_LAEA7:  .byte $29, $29, $26, $27, $26, $27, $2A, $2B, $FF, $FF, $2B, $2C, $FF, $FF, $2B, $2B
Bank05_LAEB7:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $31, $32, $33, $34, $35, $36, $37, $38, $3D, $3E
Bank05_LAEC7:  .byte $3F, $40, $41, $42, $43, $44, $39, $3A, $39, $3A, $3B, $3B, $3C, $3C, $0B, $0B
Bank05_LAED7:  .byte $2D, $2E, $2F, $30, $0B, $0B, $50, $51, $52, $53, $54, $55, $54, $55, $56, $57
Bank05_LAEE7:  .byte $58, $59, $FF, $FF, $FF, $5E, $5B, $5C, $5F, $60, $FF, $FF, $61, $FF, $5D, $62
Bank05_LAEF7:  .byte $67, $68, $63, $64, $69, $6A, $65, $66, $6B, $6C, $6D, $6E, $73, $74, $6F, $70
Bank05_LAF07:  .byte $75, $76, $71, $72, $77, $78, $45, $46, $47, $48, $FF, $98, $FF, $98, $49, $4A
Bank05_LAF17:  .byte $4B, $4C, $90, $91, $90, $91, $7C, $7D, $4D, $FF, $1C, $1D, $1E, $17, $18, $19
Bank05_LAF27:  .byte $1A, $1F, $20, $21, $22, $60, $61, $62, $63, $0E, $0F, $FF, $FF, $0C, $0D, $0D
Bank05_LAF37:  .byte $0D, $10, $0D, $FF, $10, $10, $FF, $FF, $FF, $FF, $FF, $FF, $30, $FF, $33, $FF
Bank05_LAF47:  .byte $36, $FF, $39, $FF, $3D, $FF, $FF, $31, $32, $34, $35, $37, $38, $3A, $3B, $3E
Bank05_LAF57:  .byte $3F, $3C, $41, $40, $42, $84, $85, $86, $87, $80, $81, $82, $83, $88, $89, $8A
Bank05_LAF67:  .byte $8B, $45, $46, $45, $46, $47, $48, $48, $47, $5C, $5D, $5E, $5F, $B8, $B8, $B9
Bank05_LAF77:  .byte $B9, $74, $75, $75, $74, $C1, $13, $13, $13, $36, $BE, $BC, $BD, $BF, $14, $15
Bank05_LAF87:  .byte $14, $C0, $14, $C0, $16, $FF, $C1, $FF, $FF, $C2, $14, $FF, $FF, $30, $13, $BC
Bank05_LAF97:  .byte $BD, $13, $14, $15, $16, $D7, $D7, $D7, $D7, $76, $76, $76, $76, $FF, $FF, $BA
Bank05_LAFA7:  .byte $BA, $BB, $BB, $BB, $BB, $00, $01, $02, $03, $04, $05, $06, $07, $FF, $FF, $08
Bank05_LAFB7:  .byte $09, $FF, $FF, $09, $0A, $55, $56, $57, $58, $90, $91, $92, $93, $4B, $4C, $4D
Bank05_LAFC7:  .byte $50, $51, $52, $53, $54, $70, $71, $72, $73, $8C, $8D, $8E, $8F, $11, $12, $FF
Bank05_LAFD7:  .byte $11, $11, $12, $12, $11, $11, $12, $12, $FF, $C3, $C4, $C5, $C6, $30, $00, $BC
Bank05_LAFE7:  .byte $BD, $CD, $CE, $CF, $D0, $D1, $D2, $D3, $D4, $90, $91, $92, $93, $20, $20, $20
Bank05_LAFF7:  .byte $20, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0

;------------------------------------------[ Area music data ]---------------------------------------

;There are 3 control bytes associated with the music data and the rest are musical note indexes.
;If the byte has the binary format 1011xxxx ($Bx), then the byte is an index into the corresponding
;musical notes table and is used to set the note length until it is set by another note length
;byte. The lower 4 bits are the index into the note length table. Another control byte is the loop
;and counter btye. The loop and counter byte has the format 11xxxxxx. Bits 0 thru 6 contain the
;number of times to loop.  The third control byte is #$FF. This control byte marks the end of a loop
;and decrements the loop counter. If #$00 is found in the music data, the music has reached the end.
;A #$00 in any of the different music channel data segments will mark the end of the music. The
;remaining bytes are indexes into the MusicNotesTbl_B5 and should only be even numbers as there are 2
;bytes of data per musical note.

RidleyTriangleIndexData_B5:
Bank05_LB000:  .byte $B6           ;1 3/16 seconds
Bank05_LB001:  .byte $20           ;E3
Bank05_LB002:  .byte $B2           ;3/8 seconds
Bank05_LB003:  .byte $28           ;Ab3
Bank05_LB004:  .byte $B3           ;3/4 seconds
Bank05_LB005:  .byte $2C           ;A#3
Bank05_LB006:  .byte $34           ;D4
Bank05_LB007:  .byte $B4           ;1 1/2 seconds
Bank05_LB008:  .byte $30           ;C4
Bank05_LB009:  .byte $30           ;C4
Bank05_LB00A:  .byte $B3           ;3/4 seconds
Bank05_LB00B:  .byte $3C           ;F#4
Bank05_LB00C:  .byte $38           ;E4
Bank05_LB00D:  .byte $30           ;C4
Bank05_LB00E:  .byte $28           ;Ab3
Bank05_LB00F:  .byte $B4           ;1 1/2 seconds
Bank05_LB010:  .byte $24           ;F#3
Bank05_LB011:  .byte $24           ;F#3
Bank05_LB012:  .byte $1E           ;D#3
Bank05_LB013:  .byte $B3           ;3/4 seconds
Bank05_LB014:  .byte $2A           ;A3
Bank05_LB015:  .byte $26           ;G3
Bank05_LB016:  .byte $B4           ;1 1/2 seconds
Bank05_LB017:  .byte $2E           ;B3
Bank05_LB018:  .byte $2E           ;B3
Bank05_LB019:  .byte $B3           ;3/4 seconds
Bank05_LB01A:  .byte $32           ;C#4
Bank05_LB01B:  .byte $36           ;D#4
Bank05_LB01C:  .byte $2E           ;B3
Bank05_LB01D:  .byte $32           ;C#4
Bank05_LB01E:  .byte $B4           ;1 1/2 seconds
Bank05_LB01F:  .byte $2A           ;A3
Bank05_LB020:  .byte $2A           ;A3
Bank05_LB021:  .byte $00           ;End Ridley area music.

RidleySQ1IndexData_B5:
Bank05_LB022:  .byte $BA           ;3/64 seconds
Bank05_LB023:  .byte $02           ;No sound
Bank05_LB024:  .byte $D0           ;
Bank05_LB025:  .byte $B1           ;3/16 seconds   +
Bank05_LB026:  .byte $3C           ;F#4        |
Bank05_LB027:  .byte $40           ;Ab4        | Repeat 16 times
Bank05_LB028:  .byte $44           ;A#4        |
Bank05_LB029:  .byte $40           ;Ab4        +
Bank05_LB02A:  .byte $FF           ;
Bank05_LB02B:  .byte $D0           ;
Bank05_LB02C:  .byte $42           ;A4     +
Bank05_LB02D:  .byte $46           ;B4     | Repeat 16 times
Bank05_LB02E:  .byte $4A           ;C#5        |
Bank05_LB02F:  .byte $46           ;B4     +
Bank05_LB030:  .byte $FF           ;

RidleySQ2IndexData_B5:
Bank05_LB031:  .byte $D0           ;
Bank05_LB032:  .byte $B1           ;3/16 seconds   +
Bank05_LB033:  .byte $44           ;A#4        |
Bank05_LB034:  .byte $48           ;C5     | Repeat 16 times
Bank05_LB035:  .byte $4C           ;D5     |
Bank05_LB036:  .byte $48           ;C5     +
Bank05_LB037:  .byte $FF           ;
Bank05_LB038:  .byte $D0           ;
Bank05_LB039:  .byte $4A           ;C#5        +
Bank05_LB03A:  .byte $4E           ;D#5        | Repeat 16 times
Bank05_LB03B:  .byte $52           ;F5     |
Bank05_LB03C:  .byte $4E           ;D#5        +
Bank05_LB03D:  .byte $FF           ;
Bank05_LB03E:  .byte $00           ;End Ridley area music.

KraidSQ1IndexData_B5:
Bank05_LB03F:  .byte $B8           ;11/64 seconds
Bank05_LB040:  .byte $02           ;No sound

;SQ1 music data runs down into the SQ2 music data.
KraidSQ2IndexData_B5:
Bank05_LB041:  .byte $C4           ;
Bank05_LB042:  .byte $B3           ;1/2 seconds    +
Bank05_LB043:  .byte $38           ;E4     |
Bank05_LB044:  .byte $B2           ;1/4 seconds    |
Bank05_LB045:  .byte $2E           ;B3     |
Bank05_LB046:  .byte $B3           ;1/2 seconds    |
Bank05_LB047:  .byte $42           ;A4     |
Bank05_LB048:  .byte $B2           ;1/4 seconds    |
Bank05_LB049:  .byte $30           ;C4     | Repeat 4 times
Bank05_LB04A:  .byte $B3           ;1/2 seconds    |
Bank05_LB04B:  .byte $3C           ;F#4        |
Bank05_LB04C:  .byte $B2           ;1/4 seconds    |
Bank05_LB04D:  .byte $34           ;D4     |
Bank05_LB04E:  .byte $B3           ;1/2 seconds    |
Bank05_LB04F:  .byte $2E           ;B3     |
Bank05_LB050:  .byte $B2           ;1/4 seconds    |
Bank05_LB051:  .byte $2C           ;A#3        +
Bank05_LB052:  .byte $FF           ;
Bank05_LB053:  .byte $C2           ;
Bank05_LB054:  .byte $B3           ;1/2 seconds    +
Bank05_LB055:  .byte $3E           ;G4     |
Bank05_LB056:  .byte $B2           ;1/4 seconds    |
Bank05_LB057:  .byte $34           ;D4     |
Bank05_LB058:  .byte $B3           ;1/2 seconds    |
Bank05_LB059:  .byte $38           ;E4     |
Bank05_LB05A:  .byte $B2           ;1/4 seconds    |
Bank05_LB05B:  .byte $2E           ;B3     | Repeat 2 times
Bank05_LB05C:  .byte $B3           ;1/2 seconds    |
Bank05_LB05D:  .byte $3C           ;F#4        |
Bank05_LB05E:  .byte $B2           ;1/4 seconds    |
Bank05_LB05F:  .byte $34           ;D4     |
Bank05_LB060:  .byte $B3           ;1/2 seconds    |
Bank05_LB061:  .byte $42           ;A4     |
Bank05_LB062:  .byte $B2           ;1/4 seconds    |
Bank05_LB063:  .byte $38           ;E4     +
Bank05_LB064:  .byte $FF           ;
Bank05_LB065:  .byte $C4           ;
Bank05_LB066:  .byte $B1           ;1/8 seconds    +
Bank05_LB067:  .byte $3E           ;G4     |
Bank05_LB068:  .byte $2E           ;B3     |
Bank05_LB069:  .byte $3E           ;G4     |
Bank05_LB06A:  .byte $2E           ;B3     |
Bank05_LB06B:  .byte $3E           ;G4     |
Bank05_LB06C:  .byte $2E           ;B3     |
Bank05_LB06D:  .byte $44           ;A#4        |
Bank05_LB06E:  .byte $38           ;E4     |
Bank05_LB06F:  .byte $44           ;A#4        |
Bank05_LB070:  .byte $38           ;E4     |
Bank05_LB071:  .byte $44           ;A#4        | Repeat 4 times
Bank05_LB072:  .byte $38           ;E4     |
Bank05_LB073:  .byte $42           ;A4     |
Bank05_LB074:  .byte $30           ;C4     |
Bank05_LB075:  .byte $42           ;A4     |
Bank05_LB076:  .byte $30           ;C4     |
Bank05_LB077:  .byte $42           ;A4     |
Bank05_LB078:  .byte $30           ;C4     |
Bank05_LB079:  .byte $42           ;A4     |
Bank05_LB07A:  .byte $36           ;D#4        |
Bank05_LB07B:  .byte $3C           ;F#4        |
Bank05_LB07C:  .byte $36           ;D#4        |
Bank05_LB07D:  .byte $46           ;B4     |
Bank05_LB07E:  .byte $36           ;D#4        +
Bank05_LB07F:  .byte $FF           ;
Bank05_LB080:  .byte $C2           ;
Bank05_LB081:  .byte $3C           ;F#4        +
Bank05_LB082:  .byte $3E           ;G4     |
Bank05_LB083:  .byte $42           ;A4     |
Bank05_LB084:  .byte $46           ;B4     |
Bank05_LB085:  .byte $4C           ;D5     |
Bank05_LB086:  .byte $46           ;B4     |
Bank05_LB087:  .byte $54           ;F#5        |
Bank05_LB088:  .byte $4C           ;D5     |
Bank05_LB089:  .byte $42           ;A4     |
Bank05_LB08A:  .byte $3E           ;G4     |
Bank05_LB08B:  .byte $3C           ;F#4        | Repeat 2 times
Bank05_LB08C:  .byte $46           ;B4     |
Bank05_LB08D:  .byte $5A           ;A5     |
Bank05_LB08E:  .byte $54           ;F#5        |
Bank05_LB08F:  .byte $4C           ;D5     |
Bank05_LB090:  .byte $42           ;A4     |
Bank05_LB091:  .byte $3E           ;G4     |
Bank05_LB092:  .byte $3C           ;F#4        |
Bank05_LB093:  .byte $38           ;E4     |
Bank05_LB094:  .byte $3E           ;G4     |
Bank05_LB095:  .byte $42           ;A4     |
Bank05_LB096:  .byte $4C           ;D5     |
Bank05_LB097:  .byte $50           ;E5     |
Bank05_LB098:  .byte $02           ;No sound   +
Bank05_LB099:  .byte $FF           ;
Bank05_LB09A:  .byte $C4           ;
Bank05_LB09B:  .byte $B1           ;1/8 seconds    +
Bank05_LB09C:  .byte $5A           ;A5     |
Bank05_LB09D:  .byte $02           ;No sound   |
Bank05_LB09E:  .byte $56           ;G5     |
Bank05_LB09F:  .byte $02           ;No sound   |
Bank05_LB0A0:  .byte $54           ;F#5        |
Bank05_LB0A1:  .byte $02           ;No sound   | Repeat 4 times
Bank05_LB0A2:  .byte $50           ;E5     |
Bank05_LB0A3:  .byte $02           ;No sound   |
Bank05_LB0A4:  .byte $54           ;F#5        |
Bank05_LB0A5:  .byte $02           ;No sound   |
Bank05_LB0A6:  .byte $56           ;G5     |
Bank05_LB0A7:  .byte $02           ;No sound   +
Bank05_LB0A8:  .byte $FF           ;
Bank05_LB0A9:  .byte $00           ;End Kraid area music.

KraidTriangleIndexData_B5:
Bank05_LB0AA:  .byte $D0           ;
Bank05_LB0AB:  .byte $B2           ;1/4 seconds    +
Bank05_LB0AC:  .byte $20           ;E3     | Repeat 16 times
Bank05_LB0AD:  .byte $B3           ;1/2 seconds    |
Bank05_LB0AE:  .byte $38           ;E4     +
Bank05_LB0AF:  .byte $FF           ;
Bank05_LB0B0:  .byte $C2           ;
Bank05_LB0B1:  .byte $B2           ;1/4 seconds    +
Bank05_LB0B2:  .byte $18           ;C3     |
Bank05_LB0B3:  .byte $B3           ;1/2 seconds    |
Bank05_LB0B4:  .byte $30           ;C4     |
Bank05_LB0B5:  .byte $B2           ;1/4 seconds    |
Bank05_LB0B6:  .byte $18           ;C3     |
Bank05_LB0B7:  .byte $B3           ;1/2 seconds    |
Bank05_LB0B8:  .byte $30           ;C4     | Repeat 2 times
Bank05_LB0B9:  .byte $B2           ;1/4 seconds    |
Bank05_LB0BA:  .byte $1C           ;D3     |
Bank05_LB0BB:  .byte $B3           ;1/2 seconds    |
Bank05_LB0BC:  .byte $34           ;D4     |
Bank05_LB0BD:  .byte $B2           ;1/4 seconds    |
Bank05_LB0BE:  .byte $1C           ;D3     |
Bank05_LB0BF:  .byte $B3           ;1/2 seconds    |
Bank05_LB0C0:  .byte $34           ;D4     +
Bank05_LB0C1:  .byte $FF           ;
Bank05_LB0C2:  .byte $C4           ;
Bank05_LB0C3:  .byte $B2           ;1/4 seconds    +
Bank05_LB0C4:  .byte $20           ;E3     |
Bank05_LB0C5:  .byte $38           ;E4     |
Bank05_LB0C6:  .byte $50           ;E5     |
Bank05_LB0C7:  .byte $24           ;F#3        |
Bank05_LB0C8:  .byte $3C           ;F#4        | Repeat 4 times
Bank05_LB0C9:  .byte $54           ;F#5        |
Bank05_LB0CA:  .byte $22           ;F3     |
Bank05_LB0CB:  .byte $3A           ;F4     |
Bank05_LB0CC:  .byte $52           ;F5     |
Bank05_LB0CD:  .byte $16           ;B2     |
Bank05_LB0CE:  .byte $2E           ;B3     |
Bank05_LB0CF:  .byte $46           ;B4     +
Bank05_LB0D0:  .byte $FF           ;
Bank05_LB0D1:  .byte $C2           ;
Bank05_LB0D2:  .byte $B3           ;1/2 seconds    +
Bank05_LB0D3:  .byte $20           ;E3     |
Bank05_LB0D4:  .byte $B2           ;1/4 seconds    |
Bank05_LB0D5:  .byte $2E           ;B3     |
Bank05_LB0D6:  .byte $B3           ;1/2 seconds    |
Bank05_LB0D7:  .byte $30           ;C4     |
Bank05_LB0D8:  .byte $B2           ;1/4 seconds    |
Bank05_LB0D9:  .byte $2E           ;B3     | Repeat 2 times
Bank05_LB0DA:  .byte $B3           ;1/2 seconds    |
Bank05_LB0DB:  .byte $18           ;C3     |
Bank05_LB0DC:  .byte $B2           ;1/4 seconds    |
Bank05_LB0DD:  .byte $26           ;G3     |
Bank05_LB0DE:  .byte $B3           ;1/2 seconds    |
Bank05_LB0DF:  .byte $2A           ;A3     |
Bank05_LB0E0:  .byte $B2           ;1/4 seconds    |
Bank05_LB0E1:  .byte $2E           ;B3     +
Bank05_LB0E2:  .byte $FF           ;
Bank05_LB0E3:  .byte $C8           ;
Bank05_LB0E4:  .byte $B4           ;1 second   + Repeat 8 times
Bank05_LB0E5:  .byte $08           ;E2     +
Bank05_LB0E6:  .byte $FF           ;

.scend

;Not used.
B0E7:   .byte $2A, $2A, $2A, $B9, $2A, $2A, $2A, $B2, $2A, $2A, $2A, $2A, $2A, $B9, $2A, $12
B0F7:   .byte $2A, $B2, $26, $B9, $0E, $26, $26, $B2, $26, $B9, $0E, $26, $26, $B2, $22, $B9
B107:   .byte $0A, $22, $22, $B2, $22, $B9, $0A, $22, $22, $B2, $20, $20, $B9, $20, $20, $20
B117:   .byte $B2, $20, $B9, $34, $30, $34, $38, $34, $38, $3A, $38, $3A, $3E, $3A, $3E, $FF
B127:   .byte $C2, $B2, $18, $30, $18, $30, $18, $30, $18, $30, $22, $22, $B1, $22, $22, $B2
B137:   .byte $22, $20, $1C, $18, $16, $14, $14, $14, $2C, $2A, $2A, $B9, $2A, $2A, $2A, $B2
B147:   .byte $2A, $28, $28, $B9, $28, $28, $28, $B2, $28, $26, $26, $B9, $26, $26, $3E, $26
B157:   .byte $26, $3E, $FF, $F0, $B2, $01, $04, $01, $04, $FF, $E0, $BA, $2A, $1A, $02, $3A
B167:   .byte $40, $02, $1C, $2E, $38, $2C, $3C, $38, $02, $40, $44, $46, $02, $1E, $02, $2C
B177:   .byte $38, $46, $26, $02, $3A, $20, $02, $28, $2E, $02, $18, $44, $02, $46, $48, $4A
B187:   .byte $4C, $02, $18, $1E, $FF, $B8, $02, $C8, $B0, $0A, $0C, $FF, $C8, $0E, $0C, $FF
B197:   .byte $C8, $10, $0E, $FF, $C8, $0E, $0C, $FF, $00, $2B, $3B, $1B, $5A, $D0, $D1, $C3
B1A7:   .byte $C3, $3B, $3B, $9B, $DA, $D0, $D0, $C0, $C0, $2C, $23, $20, $20, $30, $98, $CF
B1B7:   .byte $C7, $00, $00, $00, $00, $00, $00, $00, $30, $1F, $80, $C0, $C0, $60, $70, $FC
B1C7:   .byte $C0, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00
B1D7:   .byte $00, $80, $80, $C0, $78, $4C, $C7, $80, $80, $C4, $A5, $45, $0B, $1B, $03, $03
B1E7:   .byte $00, $3A, $13, $31, $63, $C3, $83, $03, $04, $E6, $E6, $C4, $8E, $1C, $3C, $18
B1F7:   .byte $30, $E8, $E8, $C8, $90, $60, $00, $00, $00

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
Bank05_LBF56:  .byte $10, $07, $0E, $1C, $38, $70, $2A, $54, $15, $12, $02, $03, $20, $2C, $B4, $AD
Bank05_LBF66:  .byte $4D, $06, $8D, $8D, $06, $AD, $5E, $06, $A8, $B9, $2A, $BC, $A8, $A2, $00, $B9
Bank05_LBF76:  .byte $61, $BD, $9D, $2B, $06, $C8, $E8, $8A, $C9, $0D, $D0, $F3, $A9, $01, $8D, $40
Bank05_LBF86:  .byte $06, $8D, $41, $06, $8D, $42, $06, $8D, $43, $06, $A9, $00, $8D, $38, $06, $8D
Bank05_LBF96:  .byte $39, $06, $8D, $3A, $06, $8D, $3B, $06, $60, $FF, $00, $00, $00, $00, $00, $00
Bank05_LBFA6:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

;----------------------------------------------------------------------------------------------------

RESET_Bank05:
Bank05_LBFB0:  SEI                     ;Disables interrupt.
Bank05_LBFB1:  CLD                     ;Sets processor to binary mode.
Bank05_LBFB2:  LDX #$00                ;
Bank05_LBFB4:  STX PPUControl0         ;Clear PPU control registers.
Bank05_LBFB7:  STX PPUControl1         ;
Bank05_LBFBA:* LDA PPUStatus           ;
Bank05_LBFBD:  BPL -                   ;Wait for VBlank.
Bank05_LBFBF:* LDA PPUStatus           ;
Bank05_LBFC2:  BPL -                   ;
Bank05_LBFC4:  ORA #$FF                ;
Bank05_LBFC6:  STA MMC1Reg0            ;Reset MMC1 chip.
Bank05_LBFC9:  STA MMC1Reg1            ;(MSB is set).
Bank05_LBFCC:  STA MMC1Reg2            ;
Bank05_LBFCF:  STA MMC1Reg3            ;
Bank05_LBFD2:  JMP Startup             ;($C01A)Does preliminry housekeeping.

;----------------------------------------------------------------------------------------------------

;Not used.
Bank05_LBFD5:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00
Bank05_LBFE5:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank05_LBFF5:  .byte $00, $00, $00, $00, $00

;----------------------------------------------------------------------------------------------------

;Interrupt vectors.
.word NMI               ;($C0D9)NMI vector.
.word RESET_Bank05      ;($FFB0)Reset vector.
.word RESET_Bank05      ;($FFB0)IRQ vector.