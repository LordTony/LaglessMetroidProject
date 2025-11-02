;Kraid hideout bank.

;-----------------------------------------[ Start of code ]------------------------------------------

Bank04_L8000:  JMP StartUpdateEnemyAnimation
Bank04_L8003:  JMP StartUpdateEnemyAnimation_2
Bank04_L8006:  JMP Start_Special_Attrs
Bank04_L8009:  JMP DoSomethingToFrameCount
Bank04_L800C:  JMP UpdateEnemyAnim     ;($E094)
Bank04_L800F:  JMP DoSomethingToAnimationIndecies
Bank04_L8012:  JMP DoSomethingToEnDataIndex
Bank04_L8015:  JMP UpdateEnemyHitpoints
Bank04_L8018:  JMP Bank07_LFBB9
Bank04_L801B:  JMP Bank07_LFB88
Bank04_L801E:  JMP Bank07_LFBCA
Bank04_L8021:  JMP Bank07_LF870
Bank04_L8024:  JMP ChooseRoutine       ;($C27C)
Bank04_L8027:  JMP Bank07_LFD8F
Bank04_L802A:  JMP Bank07_LEB6E
Bank04_L802D:  JMP $8244
Bank04_L8030:  JMP $8318
Bank04_L8033:  JMP Bank07_LFA1E
Bank04_L8036:  JMP $833F
Bank04_L8039:  JMP $8395
Bank04_L803C:  JMP SomethingAboutMovement
Bank04_L803F:  JMP DrawTileBlast
Bank04_L8042:  JMP SubtractHealth      ;($CE92)
Bank04_L8045:  JMP Base10Subtract      ;($C3FB)

Bank04_L8048:  .word $84FD, $84A6, $844A, $844A, $84A6, $84FD, $83F4, $83F4

Bank04_L8058:  LDX PageIndex
Bank04_L805A:  LDA $0405,X
Bank04_L805D:  ASL 
Bank04_L805E:  BMI ++++++++
Bank04_L8060:  LDA EnStatus,X
Bank04_L8063:  CMP #$02
Bank04_L8065:  BNE ++++++++
Bank04_L8067:  JSR $8244
Bank04_L806A:  LDA $00
Bank04_L806C:  BPL ++
Bank04_L806E:  JSR TwosCompliment      ;($C3D4)
Bank04_L8071:  STA $66
Bank04_L8073:* JSR $83F5
Bank04_L8076:  JSR $80B8
Bank04_L8079:  DEC $66
Bank04_L807B:  BNE -
Bank04_L807D:* BEQ ++
Bank04_L807F:  STA $66
Bank04_L8081:* JSR $844B
Bank04_L8084:  JSR $80FB
Bank04_L8087:  DEC $66
Bank04_L8089:  BNE -
Bank04_L808B:* JSR $8318
Bank04_L808E:  LDA $00
Bank04_L8090:  BPL ++
Bank04_L8092:  JSR TwosCompliment      ;($C3D4)
Bank04_L8095:  STA $66
Bank04_L8097:* JSR $84A7
Bank04_L809A:  JSR $816E
Bank04_L809D:  DEC $66
Bank04_L809F:  BNE -
Bank04_L80A1:* BEQ ++
Bank04_L80A3:  STA $66
Bank04_L80A5:* JSR $84FE
Bank04_L80A8:  JSR $8134
Bank04_L80AB:  DEC $66
Bank04_L80AD:  BNE -
Bank04_L80AF:* RTS
 
Bank04_L80B0:  LDY EnDataIndex,X
Bank04_L80B3:  LDA $977B,Y
Bank04_L80B6:  ASL             ;*2 
Bank04_L80B7:  RTS

Bank04_L80B8:  LDX PageIndex
Bank04_L80BA:  BCS $80FA
Bank04_L80BC:  LDA $0405,X
Bank04_L80BF:  BPL $80C7
Bank04_L80C1:  JSR $81FC
Bank04_L80C4:  JMP $80F6
Bank04_L80C7:  JSR $80B0
Bank04_L80CA:  BPL $80EA
Bank04_L80CC:  LDA $6B03,X
Bank04_L80CF:  BEQ $80C1
Bank04_L80D1:  BPL $80D8
Bank04_L80D3:  JSR $81B1
Bank04_L80D6:  BEQ $80E2
Bank04_L80D8:  SEC 
Bank04_L80D9:  ROR $0402,X
Bank04_L80DC:  ROR EnCounter,X
Bank04_L80DF:  JMP $80F6
Bank04_L80E2:  STA $0402,X
Bank04_L80E5:  STA EnCounter,X
Bank04_L80E8:  BEQ $80F6
Bank04_L80EA:  LDA $977B,Y
Bank04_L80ED:  LSR 
Bank04_L80EE:  LSR 
Bank04_L80EF:  BCC $80F6
Bank04_L80F1:  LDA #$04
Bank04_L80F3:  JSR $856B
Bank04_L80F6:  LDA #$01
Bank04_L80F8:  STA $66
Bank04_L80FA:  RTS
 
Bank04_L80FB:  LDX PageIndex
Bank04_L80FD:  BCS $8133
Bank04_L80FF:  LDA $0405,X
Bank04_L8102:  BPL $810A
Bank04_L8104:  JSR $81FC
Bank04_L8107:  JMP $812F
Bank04_L810A:  JSR $80B0
Bank04_L810D:  BPL $8123
Bank04_L810F:  LDA $6B03,X
Bank04_L8112:  BEQ $8104
Bank04_L8114:  BPL $8120
Bank04_L8116:  CLC 
Bank04_L8117:  ROR $0402,X
Bank04_L811A:  ROR EnCounter,X
Bank04_L811D:  JMP $812F
Bank04_L8120:  JSR $81B1
Bank04_L8123:  LDA $977B,Y
Bank04_L8126:  LSR 
Bank04_L8127:  LSR 
Bank04_L8128:  BCC $812F
Bank04_L812A:  LDA #$04
Bank04_L812C:  JSR $856B
Bank04_L812F:  LDA #$01
Bank04_L8131:  STA $66
Bank04_L8133:  RTS
 
Bank04_L8134:  LDX PageIndex
Bank04_L8136:  BCS $816D
Bank04_L8138:  JSR $80B0
Bank04_L813B:  BPL $815E
Bank04_L813D:  LDA $0405,X
Bank04_L8140:  BMI $8148
Bank04_L8142:  JSR $81C7
Bank04_L8145:  JMP $8169
Bank04_L8148:  LDA $6B03,X
Bank04_L814B:  BEQ $8142
Bank04_L814D:  BPL $8159
Bank04_L814F:  CLC 
Bank04_L8150:  ROR $0403,X
Bank04_L8153:  ROR $0407,X
Bank04_L8156:  JMP $8169
Bank04_L8159:  JSR $81C0
Bank04_L815C:  BEQ $8169
Bank04_L815E:  LDA $977B,Y
Bank04_L8161:  LSR 
Bank04_L8162:  BCC $8169
Bank04_L8164:  LDA #$01
Bank04_L8166:  JSR $856B
Bank04_L8169:  LDA #$01
Bank04_L816B:  STA $66
Bank04_L816D:  RTS

Bank04_L816E:  LDX PageIndex
Bank04_L8170:  BCS $81B0
Bank04_L8172:  JSR $80B0
Bank04_L8175:  BPL $81A0
Bank04_L8177:  LDA $0405,X
Bank04_L817A:  BMI $8182
Bank04_L817C:  JSR $81C7
Bank04_L817F:  JMP $81AC
Bank04_L8182:  LDA $6B03,X
Bank04_L8185:  BEQ $817C
Bank04_L8187:  BPL $818E
Bank04_L8189:  JSR $81C0
Bank04_L818C:  BEQ $8198
Bank04_L818E:  SEC 
Bank04_L818F:  ROR $0403,X
Bank04_L8192:  ROR $0407,X
Bank04_L8195:  JMP $81AC
Bank04_L8198:  STA $0403,X
Bank04_L819B:  STA $0407,X
Bank04_L819E:  BEQ $81AC
Bank04_L81A0:  JSR $80B0
Bank04_L81A3:  LSR 
Bank04_L81A4:  LSR 
Bank04_L81A5:  BCC $81AC
Bank04_L81A7:  LDA #$01
Bank04_L81A9:  JSR $856B
Bank04_L81AC:  LDA #$01
Bank04_L81AE:  STA $66
Bank04_L81B0:  RTS
 
Bank04_L81B1:  JSR $81B8
Bank04_L81B4:  STA $6AFE,X
Bank04_L81B7:  RTS

Bank04_L81B8:  LDA #$20
Bank04_L81BA:  JSR LF744
Bank04_L81BD:  LDA #$00
Bank04_L81BF:  RTS

Bank04_L81C0:  JSR $81B8
Bank04_L81C3:  STA $6AFF,X
Bank04_L81C6:  RTS

Bank04_L81C7:  JSR $81F6
Bank04_L81CA:  BNE $81F5
Bank04_L81CC:  LDA #$01
Bank04_L81CE:  JSR $856B
Bank04_L81D1:  LDA $6AFF,X
Bank04_L81D4:  JSR TwosCompliment
Bank04_L81D7:  STA $6AFF,X

Bank04_L81DA:  JSR $81F6
Bank04_L81DD:  BNE $81F5
Bank04_L81DF:  JSR $80B0
Bank04_L81E2:  SEC 
Bank04_L81E3:  BPL $81ED
Bank04_L81E5:  LDA #$00
Bank04_L81E7:  SBC $0407,X
Bank04_L81EA:  STA $0407,X
Bank04_L81ED:  LDA #$00
Bank04_L81EF:  SBC $0403,X
Bank04_L81F2:  STA $0403,X
Bank04_L81F5:  RTS

Bank04_L81F6:  JSR LF74B
Bank04_L81F9:  AND #$20
Bank04_L81FB:  RTS

Bank04_L81FC:  JSR $81F6
Bank04_L81FF:  BNE $81F5
Bank04_L8201:  LDA #$04
Bank04_L8203:  JSR $856B
Bank04_L8206:  LDA $6AFE,X
Bank04_L8209:  JSR TwosCompliment
Bank04_L820C:  STA $6AFE,X

Bank04_L820F:  JSR $81F6
Bank04_L8212:  BNE $822A
Bank04_L8214:  JSR $80B0
Bank04_L8217:  SEC 
Bank04_L8218:  BPL $8222
Bank04_L821A:  LDA #$00
Bank04_L821C:  SBC EnCounter,X
Bank04_L821F:  STA EnCounter,X
Bank04_L8222:  LDA #$00
Bank04_L8224:  SBC $0402,X
Bank04_L8227:  STA $0402,X
Bank04_L822A:  RTS 

Bank04_L822B:  LDA $0405,X
Bank04_L822E:  BPL $8232
Bank04_L8230:  LSR 
Bank04_L8231:  LSR 
Bank04_L8232:  LSR 
Bank04_L8233:  LDA $0408,X
Bank04_L8236:  ROL 
Bank04_L8237:  ASL 
Bank04_L8238:  TAY 
Bank04_L8239:  LDA $96DB,Y
Bank04_L823C:  STA $81
Bank04_L823E:  LDA $96DC,Y
Bank04_L8241:  STA $82
Bank04_L8243:  RTS

Bank04_L8244:  JSR $80B0
Bank04_L8247:  BPL $824C
Bank04_L8249:  JMP $833F
Bank04_L824C:  LDA $0405,X
Bank04_L824F:  AND #$20
Bank04_L8251:  EOR #$20
Bank04_L8253:  BEQ $82A2
Bank04_L8255:  JSR $822B
Bank04_L8258:  LDY EnCounter,X
Bank04_L825B:  LDA ($81),Y
Bank04_L825D:  CMP #$F0
Bank04_L825F:  BCC $827F
Bank04_L8261:  CMP #$FA
Bank04_L8263:  BEQ $827C
Bank04_L8265:  CMP #$FB
Bank04_L8267:  BEQ $82B0
Bank04_L8269:  CMP #$FC
Bank04_L826B:  BEQ $82B3
Bank04_L826D:  CMP #$FD
Bank04_L826F:  BEQ $82A5
Bank04_L8271:  CMP #$FE
Bank04_L8273:  BEQ $82DE
Bank04_L8275:  LDA #$00
Bank04_L8277:  STA EnCounter,X
Bank04_L827A:  BEQ $8258
Bank04_L827C:  JMP $8312
Bank04_L827F:  SEC 
Bank04_L8280:  SBC EnDelay,X
Bank04_L8283:  BNE $8290
Bank04_L8285:  STA EnDelay,X
Bank04_L8288:  INY 
Bank04_L8289:  INY 
Bank04_L828A:  TYA 
Bank04_L828B:  STA EnCounter,X
Bank04_L828E:  BNE $825B
Bank04_L8290:  INC EnDelay,X
Bank04_L8293:  INY 
Bank04_L8294:  LDA ($81),Y
Bank04_L8296:  ASL 
Bank04_L8297:  PHP 
Bank04_L8298:  JSR Adiv32          ;($C2BE)Divide by 32.
Bank04_L829B:  PLP 
Bank04_L829C:  BCC $82A2
Bank04_L829E:  EOR #$FF
Bank04_L82A0:  ADC #$00
Bank04_L82A2:  STA $00
Bank04_L82A4:  RTS

Bank04_L82A5:  INC EnCounter,X
Bank04_L82A8:  INY 
Bank04_L82A9:  LDA #$00
Bank04_L82AB:  STA $6B01,X
Bank04_L82AE:  BEQ $825B
Bank04_L82B0:  PLA 
Bank04_L82B1:  PLA 
Bank04_L82B2:  RTS

Bank04_L82B3:  LDA $6B03,X
Bank04_L82B6:  BPL $82BE
Bank04_L82B8:  JSR GrowRadius
Bank04_L82BB:  JMP $82C3
Bank04_L82BE:  BEQ $82D2
Bank04_L82C0:  JSR ShrinkRadius
Bank04_L82C3:  LDX PageIndex
Bank04_L82C5:  BCS $82D2
Bank04_L82C7:  LDY EnCounter,X
Bank04_L82CA:  INY 
Bank04_L82CB:  LDA #$00
Bank04_L82CD:  STA $6B03,X
Bank04_L82D0:  BEQ $82D7
Bank04_L82D2:  LDY EnCounter,X
Bank04_L82D5:  DEY 
Bank04_L82D6:  DEY 
Bank04_L82D7:  TYA 
Bank04_L82D8:  STA EnCounter,X
Bank04_L82DB:  JMP $825B
Bank04_L82DE:  DEY 
Bank04_L82DF:  DEY 
Bank04_L82E0:  TYA 
Bank04_L82E1:  STA EnCounter,X
Bank04_L82E4:  LDA $6B03,X
Bank04_L82E7:  BPL $82EF
Bank04_L82E9:  JSR GrowRadius
Bank04_L82EC:  JMP $82F4
Bank04_L82EF:  BEQ $82FB
Bank04_L82F1:  JSR ShrinkRadius
Bank04_L82F4:  LDX PageIndex
Bank04_L82F6:  BCC $82FB
Bank04_L82F8:  JMP $8258
Bank04_L82FB:  LDY EnDataIndex,X
Bank04_L82FE:  LDA $968B,Y
Bank04_L8301:  AND #$20
Bank04_L8303:  BEQ $8312
Bank04_L8305:  LDA $0405,X
Bank04_L8308:  EOR #$05
Bank04_L830A:  ORA $968B,Y
Bank04_L830D:  AND #$1F
Bank04_L830F:  STA $0405,X
Bank04_L8312:  JSR $81B1
Bank04_L8315:  JMP $82A2
Bank04_L8318:  JSR $80B0
Bank04_L831B:  BPL $8320
Bank04_L831D:  JMP $8395
Bank04_L8320:  LDA $0405,X
Bank04_L8323:  AND #$20
Bank04_L8325:  EOR #$20
Bank04_L8327:  BEQ $833C
Bank04_L8329:  LDY EnCounter,X
Bank04_L832C:  INY 
Bank04_L832D:  LDA ($81),Y
Bank04_L832F:  TAX 
Bank04_L8330:  AND #$08
Bank04_L8332:  PHP 
Bank04_L8333:  TXA 
Bank04_L8334:  AND #$07
Bank04_L8336:  PLP 
Bank04_L8337:  BEQ $833C
Bank04_L8339:  JSR TwosCompliment
Bank04_L833C:  STA $00
Bank04_L833E:  RTS

Bank04_L833F:  LDY #$0E
Bank04_L8341:  LDA $6AFE,X
Bank04_L8344:  BMI $835E
Bank04_L8346:  CLC 
Bank04_L8347:  ADC EnCounter,X
Bank04_L834A:  STA EnCounter,X
Bank04_L834D:  LDA $0402,X
Bank04_L8350:  ADC #$00
Bank04_L8352:  STA $0402,X
Bank04_L8355:  BPL $8376
Bank04_L8357:  JSR TwosCompliment
Bank04_L835A:  LDY #$F2
Bank04_L835C:  BNE $8376
Bank04_L835E:  JSR $C3D4
Bank04_L8361:  SEC 
Bank04_L8362:  STA $00
Bank04_L8364:  LDA EnCounter,X
Bank04_L8367:  SBC $00
Bank04_L8369:  STA EnCounter,X
Bank04_L836C:  LDA $0402,X
Bank04_L836F:  SBC #$00
Bank04_L8371:  STA $0402,X
Bank04_L8374:  BMI $8357
Bank04_L8376:  CMP #$0E
Bank04_L8378:  BCC $8383
Bank04_L837A:  LDA #$00
Bank04_L837C:  STA EnCounter,X
Bank04_L837F:  TYA 
Bank04_L8380:  STA $0402,X
Bank04_L8383:  LDA $6AFC,X
Bank04_L8386:  CLC 
Bank04_L8387:  ADC EnCounter,X
Bank04_L838A:  STA $6AFC,X
Bank04_L838D:  LDA #$00
Bank04_L838F:  ADC $0402,X
Bank04_L8392:  STA $00
Bank04_L8394:  RTS

Bank04_L8395:  LDA #$00
Bank04_L8397:  STA $00
Bank04_L8399:  STA $02
Bank04_L839B:  LDA #$0E
Bank04_L839D:  STA $01
Bank04_L839F:  STA $03
Bank04_L83A1:  LDA $0407,X
Bank04_L83A4:  CLC 
Bank04_L83A5:  ADC $6AFF,X
Bank04_L83A8:  STA $0407,X
Bank04_L83AB:  STA $04
Bank04_L83AD:  LDA #$00
Bank04_L83AF:  LDY $6AFF,X
Bank04_L83B2:  BPL $83B6
Bank04_L83B4:  LDA #$FF
Bank04_L83B6:  ADC $0403,X
Bank04_L83B9:  STA $0403,X
Bank04_L83BC:  TAY 
Bank04_L83BD:  BPL $83D0
Bank04_L83BF:  LDA #$00
Bank04_L83C1:  SEC 
Bank04_L83C2:  SBC $0407,X
Bank04_L83C5:  STA $04
Bank04_L83C7:  LDA #$00
Bank04_L83C9:  SBC $0403,X
Bank04_L83CC:  TAY 
Bank04_L83CD:  JSR LE449
Bank04_L83D0:  LDA $04
Bank04_L83D2:  CMP $02
Bank04_L83D4:  TYA 
Bank04_L83D5:  SBC $03
Bank04_L83D7:  BCC $83E3
Bank04_L83D9:  LDA $00
Bank04_L83DB:  STA $0407,X
Bank04_L83DE:  LDA $01
Bank04_L83E0:  STA $0403,X
Bank04_L83E3:  LDA $6AFD,X
Bank04_L83E6:  CLC 
Bank04_L83E7:  ADC $0407,X
Bank04_L83EA:  STA $6AFD,X
Bank04_L83ED:  LDA #$00
Bank04_L83EF:  ADC $0403,X
Bank04_L83F2:  STA $00
Bank04_L83F4:  RTS

Bank04_L83F5:  LDX PageIndex
Bank04_L83F7:  LDA EnYRoomPos,X
Bank04_L83FA:  SEC 
Bank04_L83FB:  SBC EnRadY,X
Bank04_L83FE:  AND #$07
Bank04_L8400:  SEC 
Bank04_L8401:  BNE $8406
Bank04_L8403:  JSR GrowRadius
Bank04_L8406:  LDY #$00
Bank04_L8408:  STY $00
Bank04_L840A:  LDX PageIndex
Bank04_L840C:  BCC $844A
Bank04_L840E:  INC $00
Bank04_L8410:  LDY EnYRoomPos,X
Bank04_L8413:  BNE $8429
Bank04_L8415:  LDY #$F0
Bank04_L8417:  LDA $49
Bank04_L8419:  CMP #$02
Bank04_L841B:  BCS $8429
Bank04_L841D:  LDA $FC
Bank04_L841F:  BEQ $844A
Bank04_L8421:  JSR $8563
Bank04_L8424:  BEQ $844A
Bank04_L8426:  JSR $855A
Bank04_L8429:  DEY 
Bank04_L842A:  TYA 
Bank04_L842B:  STA EnYRoomPos,X
Bank04_L842E:  CMP EnRadY,X
Bank04_L8431:  BNE $8441
Bank04_L8433:  LDA $FC
Bank04_L8435:  BEQ $843C
Bank04_L8437:  JSR $8563
Bank04_L843A:  BNE $8441
Bank04_L843C:  INC EnYRoomPos,X
Bank04_L843F:  CLC 
Bank04_L8440:  RTS

Bank04_L8441:  LDA $0405,X
Bank04_L8444:  BMI $8449
Bank04_L8446:  INC $6B01,X
Bank04_L8449:  SEC 
Bank04_L844A:  RTS

Bank04_L844B:  LDX PageIndex
Bank04_L844D:  LDA EnYRoomPos,X
Bank04_L8450:  CLC 
Bank04_L8451:  ADC EnRadY,X
Bank04_L8454:  AND #$07
Bank04_L8456:  SEC 
Bank04_L8457:  BNE $845C
Bank04_L8459:  JSR ShrinkRadius
Bank04_L845C:  LDY #$00
Bank04_L845E:  STY $00
Bank04_L8460:  LDX PageIndex
Bank04_L8462:  BCC $84A6
Bank04_L8464:  INC $00
Bank04_L8466:  LDY EnYRoomPos,X
Bank04_L8469:  CPY #$EF
Bank04_L846B:  BNE $8481
Bank04_L846D:  LDY #$FF
Bank04_L846F:  LDA $49
Bank04_L8471:  CMP #$02
Bank04_L8473:  BCS $8481
Bank04_L8475:  LDA $FC
Bank04_L8477:  BEQ $84A6
Bank04_L8479:  JSR $8563
Bank04_L847C:  BNE $84A6
Bank04_L847E:  JSR $855A
Bank04_L8481:  INY 
Bank04_L8482:  TYA 
Bank04_L8483:  STA EnYRoomPos,X
Bank04_L8486:  CLC 
Bank04_L8487:  ADC EnRadY,X
Bank04_L848A:  CMP #$EF
Bank04_L848C:  BNE $849D
Bank04_L848E:  LDA $FC
Bank04_L8490:  BEQ $8497
Bank04_L8492:  JSR $8563
Bank04_L8495:  BEQ $849D
Bank04_L8497:  DEC EnYRoomPos,X
Bank04_L849A:  CLC 
Bank04_L849B:  BCC $84A6
Bank04_L849D:  LDA $0405,X
Bank04_L84A0:  BMI $84A5
Bank04_L84A2:  DEC $6B01,X
Bank04_L84A5:  SEC 
Bank04_L84A6:  RTS

Bank04_L84A7:  LDX PageIndex
Bank04_L84A9:  LDA EnXRoomPos,X
Bank04_L84AC:  SEC 
Bank04_L84AD:  SBC EnRadX,X
Bank04_L84B0:  AND #$07
Bank04_L84B2:  SEC 
Bank04_L84B3:  BNE $84B8
Bank04_L84B5:  JSR GrowRadiusX
Bank04_L84B8:  LDY #$00
Bank04_L84BA:  STY $00
Bank04_L84BC:  LDX PageIndex
Bank04_L84BE:  BCC $84FD
Bank04_L84C0:  INC $00
Bank04_L84C2:  LDY EnXRoomPos,X
Bank04_L84C5:  BNE $84DA
Bank04_L84C7:  LDA $49
Bank04_L84C9:  CMP #$02
Bank04_L84CB:  BCC $84DA
Bank04_L84CD:  LDA $FD
Bank04_L84CF:  BEQ $84D4
Bank04_L84D1:  JSR $8563
Bank04_L84D4:  CLC 
Bank04_L84D5:  BEQ $84FD
Bank04_L84D7:  JSR $855A
Bank04_L84DA:  DEC EnXRoomPos,X
Bank04_L84DD:  LDA EnXRoomPos,X
Bank04_L84E0:  CMP EnRadX,X
Bank04_L84E3:  BNE $84F4
Bank04_L84E5:  LDA $FD
Bank04_L84E7:  BEQ $84EE
Bank04_L84E9:  JSR $8563
Bank04_L84EC:  BNE $84F4
Bank04_L84EE:  INC EnXRoomPos,X
Bank04_L84F1:  CLC 
Bank04_L84F2:  BCC $84FD
Bank04_L84F4:  LDA $0405,X
Bank04_L84F7:  BPL $84FC
Bank04_L84F9:  INC $6B01,X
Bank04_L84FC:  SEC 
Bank04_L84FD:  RTS

Bank04_L84FE:  LDX PageIndex
Bank04_L8500:  LDA EnXRoomPos,X
Bank04_L8503:  CLC 
Bank04_L8504:  ADC EnRadX,X
Bank04_L8507:  AND #$07
Bank04_L8509:  SEC 
Bank04_L850A:  BNE $850F
Bank04_L850C:  JSR ShrinkRadiusX
Bank04_L850F:  LDY #$00
Bank04_L8511:  STY $00
Bank04_L8513:  LDX PageIndex
Bank04_L8515:  BCC $8559
Bank04_L8517:  INC $00
Bank04_L8519:  INC EnXRoomPos,X
Bank04_L851C:  BNE $8536
Bank04_L851E:  LDA $49
Bank04_L8520:  CMP #$02
Bank04_L8522:  BCC $8536
Bank04_L8524:  LDA $FD
Bank04_L8526:  BEQ $852D
Bank04_L8528:  JSR $8563
Bank04_L852B:  BEQ $8533
Bank04_L852D:  DEC EnXRoomPos,X
Bank04_L8530:  CLC 
Bank04_L8531:  BCC $8559
Bank04_L8533:  JSR $855A
Bank04_L8536:  LDA EnXRoomPos,X
Bank04_L8539:  CLC 
Bank04_L853A:  ADC EnRadX,X
Bank04_L853D:  CMP #$FF
Bank04_L853F:  BNE $8550
Bank04_L8541:  LDA $FD
Bank04_L8543:  BEQ $854A
Bank04_L8545:  JSR $8563
Bank04_L8548:  BEQ $8550
Bank04_L854A:  DEC EnXRoomPos,X
Bank04_L854D:  CLC 
Bank04_L854E:  BCC $8559
Bank04_L8550:  LDA $0405,X
Bank04_L8553:  BPL $8558
Bank04_L8555:  DEC $6B01,X
Bank04_L8558:  SEC 
Bank04_L8559:  RTS

Bank04_L855A:  LDA EnNameTable,X
Bank04_L855D:  EOR #$01
Bank04_L855F:  STA EnNameTable,X
Bank04_L8562:  RTS

Bank04_L8563:  LDA EnNameTable,X
Bank04_L8566:  EOR $FF
Bank04_L8568:  AND #$01
Bank04_L856A:  RTS

Bank04_L856B:  EOR $0405,X
Bank04_L856E:  STA $0405,X
Bank04_L8571:  RTS 

;---------------------------------[ Object animation data tables ]----------------------------------

;The following tables are indices into the FramePtrTable that correspond to various animations. The
;FramePtrTable represents individual frames and the entries in ObjectAnimIdxTbl are the groups of
;frames responsible for animaton Samus, her weapons and other objects.

.checkpc ObjectAnimIdxTbl
.advance ObjectAnimIdxTbl

;Samus run animation.
Bank04_L8572:  .byte $03, $04, $05, $FF

;Samus front animation.
Bank04_L8576:  .byte $07, $FF

;Samus jump out of ball animation.
Bank04_L8578:  .byte $17

;Samus Stand animation.
Bank04_L8579:  .byte $08, $FF

;Samus stand and fire animation.
Bank04_L857B:  .byte $22, $FF

;Samus stand and jump animation.
Bank04_L857D:  .byte $04

;Samus Jump animation.
Bank04_L857E:  .byte $10, $FF

;Samus summersault animation.
Bank04_L8580:  .byte $17, $18, $19, $1A, $FF

;Samus run and jump animation.
Bank04_L8585:  .byte $03, $17, $FF

;Samus roll animation.
Bank04_L8588:  .byte $1E, $1D, $1C, $1B, $FF

;Bullet animation.
Bank04_L858D:  .byte $28, $FF

;Bullet hit animation.
Bank04_L858F:  .byte $2A, $F7, $FF

;Samus jump and fire animation.
Bank04_L8592:  .byte $12, $FF

;Samus run and fire animation.
Bank04_L8594:  .byte $0C, $0D, $0E, $FF

;Samus point up and shoot animation.
Bank04_L8598:  .byte $30 

;Samus point up animation.
Bank04_L8599:  .byte $2B, $FF

;Door open animation.
Bank04_L859B:  .byte $31, $31, $33, $F7, $FF

;Door close animation.
Bank04_L85A0:  .byte $33, $33, $31, $FF

;Samus explode animation.
Bank04_L85A4: .byte $35, $FF

;Samus jump and point up animation.
Bank04_L85A6: .byte $39, $38, $FF

;Samus run and point up animation.
Bank04_L85A9:  .byte $40, $41, $42, $FF

;Samus run, point up and shoot animation 1.
Bank04_L85AD:  .byte $46, $FF

;Samus run, point up and shoot animation 2.
Bank04_L85AF:  .byte $47, $FF

;Samus run, point up and shoot animation 3.
Bank04_L85B1:  .byte $48, $FF

;Samus on elevator animation 1.
Bank04_L85B3:  .byte $07, $F7, $F7, $07, $F7, $F7, $F7, $07, $F7, $F7, $F7, $F7, $07, $F7, $FF

;Samus on elevator animation 2.
Bank04_L85C2:  .byte $23, $F7, $F7, $23, $F7, $F7, $F7, $23, $F7, $F7, $F7, $F7, $23, $F7, $FF

;Samus on elevator animation 3.
Bank04_L85D1:  .byte $07, $F7, $F7, $F7, $F7, $07, $F7, $F7, $F7, $07, $F7, $F7, $07, $F7, $FF

;Samus on elevator animation 4.
Bank04_L85E0:  .byte $23, $F7, $F7, $F7, $F7, $23, $F7, $F7, $F7, $23, $F7, $F7, $23, $F7, $FF

;Wave beam animation.
Bank04_L85EF:  .byte $4B, $FF

;Bomb tick animation.
Bank04_L85F1:  .byte $4E, $4F, $FF

;Bomb explode animation.
Bank04_L85F4:  .byte $3C, $4A, $49, $4A, $4D, $4A, $4D, $F7, $FF

;Missile left animation.
Bank04_L85FD:  .byte $26, $FF

;Missile right animation.
Bank04_L85FF:  .byte $25, $FF

;Missile up animation.
Bank04_L8601:  .byte $27, $FF

;Missile explode animation.
Bank04_L8603:  .byte $67, $67, $67, $68, $68, $69, $F7, $FF

;----------------------------[ Sprite drawing pointer tables ]--------------------------------------

;The above animation pointers provide an index into the following table
;for the animation sequences.

.checkpc FramePtrTable
.advance FramePtrTable

Bank04_L860B:  .word $87CB, $87CB, $87CB, $87CB, $87DD, $87F0, $8802, $8802
Bank04_L861B:  .word $8818, $882C, $882C, $882C, $882C, $883E, $8851, $8863
Bank04_L862B:  .word $8863, $8874, $8874, $8885, $8885, $8885, $8885, $8885
Bank04_L863B:  .word $888F, $8899, $88A3, $88AD, $88B8, $88C3, $88CE, $88D9
Bank04_L864B:  .word $88D9, $88D9, $88D9, $88EE, $88F8, $88F8, $88FE, $8904
Bank04_L865B:  .word $890A, $890F, $890F, $8914, $8928, $8928, $8928, $8928
Bank04_L866B:  .word $8928, $893C, $8948, $8948, $8954, $8954, $8961, $8961
Bank04_L867B:  .word $8961, $8974, $8987, $8987, $8987, $8995, $8995, $8995
Bank04_L868B:  .word $8995, $89A9, $89BE, $89D2, $89D2, $89D2, $89D2, $89E6
Bank04_L869B:  .word $89FB, $8A0F, $8A1D, $8A21, $8A26, $8A26, $8A3C, $8A41
Bank04_L86AB:  .word $8A46, $8A4E, $8A56, $8A5E, $8A66, $8A6E, $8A76, $8A7E
Bank04_L86BB:  .word $8A86, $8A8E, $8A9C, $8AA1, $8AA6, $8AAE, $8ABA, $8AC4
Bank04_L86CB:  .word $8AC4, $8AC4, $8AC4, $8AC4, $8AC4, $8AC4, $8AD8, $8AE9
Bank04_L86DB:  .word $8AF3, $8B03

;The following table provides pointers to data used for the placement of the sprites that make up
;Samus and other non-enemy objects.

.checkpc PlacePtrTable
.advance PlacePtrTable

Bank04_L86DF:  .word $8701, $871F, $872B, $8737, $8747, $8751, $86FD, $875D
Bank04_L86EF:  .word $8775, $878D, $8791, $8799, $87A5, $8749, $87B1

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
Bank04_L86FD:  .byte $E8, $FC, $EA, $FC

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
Bank04_L8701:  .byte $F0, $F8, $F0, $00, $F8, $F0, $F8, $F8, $F8, $00, $00, $F8, $00, $00, $00, $08
;              +--8--+   +--9--+   +--A--+   +--B--+   +--C--+   +--D--+   +--E--+
Bank04_L8711:  .byte $08, $F8, $08, $00, $08, $08, $F8, $F4, $F8, $F6, $EC, $F4, $EE, $F4

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
Bank04_L871F:  .byte $F3, $F8, $F3, $00, $FB, $F8, $FB, $00, $03, $F8, $03, $00 

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
Bank04_L872B:  .byte $F8, $F6, $F8, $FE, $F8, $06, $00, $F6, $00, $FE, $00, $06

;Elevator frame.
;          +--------+--------+--------+--------+--------+--------+--------+--------+
;          |        |        |        |        |        |        |        |        |
;          |        |        |        |        |        |        |        |        |
;          |        |        *        |        |        |        |        |        |
;          |       0|       1|       2|       3|       4|       5|       6|       7|
;          +--------+--------+--------+--------+--------+--------+--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+   +--4--+   +--5--+   +--6--+   +--7--+
Bank04_L8737:  .byte $FC, $F0, $FC, $F8, $FC, $00, $FC, $08, $FC, $10, $FC, $18, $FC, $20, $FC, $28

;Several projectile frames.
;          +--------+
;          |        |
;          |        |
;          |    *   |
;          |       0|
;          +--------+
;              +--0--+
Bank04_L8747:  .byte $FC, $FC

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
Bank04_L8749:  .byte $F8, $F8, $F8, $00, $00, $F8, $00, $00

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
Bank04_L8751:  .byte $E8, $00, $F0, $00, $F8, $00, $00, $00, $08, $00, $10, $00 

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
Bank04_L875D:  .byte $80, $80, $81, $81, $82, $82, $83, $83, $84, $84, $85, $85, $F4, $F8, $F4, $00
;              +--2--+   +--3--+   +--4--+   +--5--+
Bank04_L876D:  .byte $FC, $F8, $FC, $00, $04, $F8, $04, $00

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
Bank04_L8775:  .byte $F0, $00, $F0, $08, $F8, $08, $F0, $F0, $F0, $F8, $F8, $F0, $00, $F0, $08, $F0
;              +--8--+   +--9--+   +--A--+   +--B--+
Bank04_L8785:  .byte $08, $F8, $00, $08, $08, $00, $08, $08

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
Bank04_L878D:  .byte $F8, $FC, $00, $FC

;Missile left/right and missile explode frames.
;          +--------+--------+        +--------+--------+
;          |        |        |        |        |        |
;          |        |        |        |        |        |
;          |        *        |        |        |        |
;          |       0|       1|        |       2|       3|
;          +--------+--------+        +--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+
Bank04_L8791:  .byte $FC, $F8, $FC, $00, $FC, $10, $FC, $18

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
Bank04_L8799:  .byte $FC, $F0, $F4, $F8, $F4, $00, $FC, $08, $04, $F8, $04, $00

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
Bank04_L87A5:  .byte $FC, $E8, $EC, $F0, $EC, $08, $FC, $10, $0C, $F0, $0C, $08

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
Bank04_L87B1:  .byte $00, $F8, $00, $00, $08, $F8, $08, $00, $E8, $F0, $E8, $F8, $E8, $00, $F0, $F0
;              +--8--+   +--9--+   +--A--+   +--B--+   +--C--+
Bank04_L87C1:  .byte $F0, $F8, $F0, $00, $F8, $F0, $F8, $F8, $F8, $00

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
Bank04_L87CB:  .byte $40, $0F, $04, $00, $01, $FD, $20, $FE, $41, $40, $FD, $60, $20, $21, $FE, $FE
Bank04_L87DB:  .byte $31, $FF

;Samus run.
Bank04_L87DD:  .byte $40, $0F, $04, $02, $03, $FD, $20, $FE, $43, $42, $FD, $60, $22, $23, $FE, $32
Bank04_L87ED:  .byte $33, $34, $FF

;Samus run.
Bank04_L87F0:  .byte $40, $0F, $04, $05, $06, $FD, $20, $FE, $45, $44, $FD, $60, $25, $26, $27, $35
Bank04_L8800:  .byte $36, $FF

;Samus facing forward.
Bank04_L8802:  .byte $00, $0F, $04, $09, $FD, $60, $09, $FD, $20, $FE, $19, $1A, $FD, $20, $29, $2A
Bank04_L8812:  .byte $FE, $39, $FD, $60, $39, $FF

;Samus stand.
Bank04_L8818:  .byte $40, $0F, $04, $FD, $20, $0E, $0D, $FE, $1E, $1D, $2E, $2D, $FE, $FD, $60, $3B
Bank04_L8828:  .byte $3C, $FE, $17, $FF

;Samus run and fire.
Bank04_L882C:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $20, $21, $FE, $FE
Bank04_L883C:  .byte $31, $FF

;Samus run and fire.
Bank04_L883E:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $22, $23, $FE, $32
Bank04_L884E:  .byte $33, $34, $FF

;Samus run and fire.
Bank04_L8851:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $25, $26, $27, $35
Bank04_L8861:  .byte $36, $FF

;Samus stand and jump.
Bank04_L8863:  .byte $40, $0F, $04, $00, $01, $FD, $20, $FE, $41, $40, $FD, $60, $22, $07, $08, $32
Bank04_L8873:  .byte $FF

;Samus jump and fire.
Bank04_L8874:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $22, $07, $08, $32
Bank04_L8884:  .byte $FF

;Samus summersault.
Bank04_L8885:  .byte $41, $0F, $04, $52, $53, $62, $63, $72, $73, $FF

;Samus summersault.
Bank04_L888F:  .byte $42, $0F, $04, $54, $55, $56, $64, $65, $66, $FF

;Samus summersault.
Bank04_L8899:  .byte $81, $0F, $04, $52, $53, $62, $63, $72, $73, $FF

;Samus summersault.
Bank04_L88A3:  .byte $82, $0F, $04, $54, $55, $56, $64, $65, $66, $FF

;Samus roll.
Bank04_L88AD:  .byte $01, $08, $04, $FC, $03, $00, $50, $51, $60, $61, $FF

;Samus roll.
Bank04_L88B8:  .byte $81, $08, $04, $FC, $FD, $00, $50, $51, $60, $61, $FF

;Samus roll.
Bank04_L88C3:  .byte $C1, $08, $04, $FC, $FD, $00, $50, $51, $60, $61, $FF

;Samus roll.
Bank04_L88CE:  .byte $41, $08, $04, $FC, $03, $00, $50, $51, $60, $61, $FF

;Samus stand and fire.
Bank04_L88D9:  .byte $40, $0F, $04, $FD, $20, $0E, $0D, $FE, $1E, $1D, $2E, $2D, $FE, $FD, $60, $3B
Bank04_L88E9:  .byte $3C, $FE, $FE, $17, $FF

;Elevator.
Bank04_L88EE:  .byte $03, $04, $10, $28, $38, $38, $FD, $60, $28, $FF

;Missile right.
Bank04_L88F8:  .byte $4A, $04, $08, $5E, $5F, $FF

;Missile left.
Bank04_L88FE:  .byte $0A, $04, $08, $5E, $5F, $FF

;Missile up.
Bank04_L8904:  .byte $09, $08, $04, $14, $24, $FF

;Bullet fire.
Bank04_L890A:  .byte $04, $02, $02, $30, $FF

;Bullet hit.
Bank04_L890F:  .byte $04, $00, $00, $04, $FF

;Samus stand and point up.
Bank04_L8914:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $2E, $2D, $FE, $FD
Bank04_L8924:  .byte $60, $3B, $3C, $FF

;Samus from ball to pointing up.
Bank04_L8928:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $2E, $2D, $FE, $FD
Bank04_L8938:  .byte $60, $3B, $3C, $FF

;Door closed.
Bank04_L893C:  .byte $35, $18, $08, $0F, $1F, $2F, $FD, $A3, $2F, $1F, $0F, $FF

;Door open/close.
Bank04_L8948:  .byte $35, $18, $04, $6A, $6B, $6C, $FD, $A3, $6C, $6B, $6A, $FF

;Samus explode.
Bank04_L8954:  .byte $07, $00, $00, $FC, $FC, $00, $0B, $0C, $1B, $1C, $2B, $2C, $FF

;Samus jump and point up.
Bank04_L8961:  .byte $46, $0F, $04, $69, $FD, $20, $FE, $7A, $79, $FE, $78, $77, $FD, $60, $22, $07
Bank04_L8971:  .byte $08, $32, $FF

;Samus jump and point up.
Bank04_L8974:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $07
Bank04_L8984:  .byte $08, $32, $FF

;Bomb explode.
Bank04_L8987:  .byte $0D, $0C, $0C, $74, $FD, $60, $74, $FD, $A0, $74, $FD, $E0, $74, $FF

;Samus run and point up.
Bank04_L8995:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $20, $21
Bank04_L89A5:  .byte $FE, $FE, $31, $FF

;Samus run and point up.
Bank04_L89A9:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $23
Bank04_L89B9:  .byte $FE, $32, $33, $34, $FF

;Samus run and point up.
Bank04_L89BE:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $25, $26
Bank04_L89CE:  .byte $27, $35, $36, $FF

;Samus run and point up.
Bank04_L89D2:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $20, $21
Bank04_L89E2:  .byte $FE, $FE, $31, $FF

;Samus point up, run and fire.
Bank04_L89E6:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $23
Bank04_L89F6:  .byte $FE, $32, $33, $34, $FF

;Samus point up, run and fire.
Bank04_L89FB:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $25, $26
Bank04_L8A0B:  .byte $27, $35, $36, $FF

;Bomb explode.
Bank04_L8A0F:  .byte $0D, $0C, $0C, $75, $FD, $60, $75, $FD, $A0, $75, $FD, $E0, $75, $FF

;Bomb explode.
Bank04_L8A1D:  .byte $00, $00, $00, $FF

;Wave beam.
Bank04_L8A21:  .byte $04, $04, $04, $4C, $FF

;Bomb explode.
Bank04_L8A26:  .byte $08, $10, $10, $3D, $3E, $4E, $FD, $60, $3E, $3D, $4E, $FD, $E0, $4E, $3E, $3D
Bank04_L8A36:  .byte $FD, $A0, $4E, $3D, $3E, $FF

;Bomb tick.
Bank04_L8A3C:  .byte $04, $04, $04, $70, $FF

;Bomb tick.
Bank04_L8A41:  .byte $04, $04, $04, $71, $FF

;Bomb item.
Bank04_L8A46:  .byte $0D, $03, $03, $86, $87, $96, $97, $FF

;High jump item.
Bank04_L8A4E:  .byte $0D, $03, $03, $7B, $7C, $8B, $8C, $FF

;Long beam item.
Bank04_L8A56:  .byte $0D, $03, $03, $88, $67, $98, $99, $FF

;Screw attack item.
Bank04_L8A5E:  .byte $0D, $03, $03, $80, $81, $90, $91, $FF

;Maru Mari item.
Bank04_L8A66:  .byte $0D, $03, $03, $7D, $7E, $8D, $8E, $FF

;Varia item.
Bank04_L8A6E:  .byte $0D, $03, $03, $82, $83, $92, $93, $FF

;Wave beam item.
Bank04_L8A76:  .byte $0D, $03, $03, $88, $89, $98, $99, $FF

;Ice beam item.
Bank04_L8A7E:  .byte $0D, $03, $03, $88, $68, $98, $99, $FF

;Energy tank item.
Bank04_L8A86:  .byte $0D, $03, $03, $84, $85, $94, $95, $FF

;Missile item.
Bank04_L8A8E:  .byte $0D, $03, $03, $3F, $FD, $40, $3F, $FD, $00, $4F, $FD, $40, $4F, $FF

;Skree burrow.
Bank04_L8A9C:  .byte $34, $04, $04, $F2, $FF

;Not used.
Bank04_L8AA1:  .byte $04, $00, $00, $5A, $FF, $13, $00, $00, $B0, $B1, $B2, $B3, $FF, $13, $00, $00
Bank04_L8AB1:  .byte $B4, $B5, $B6, $B7, $B8, $B6, $B9, $B3, $FF, $13, $00, $00, $B3, $BA, $BA, $FE
Bank04_L8AC1:  .byte $80, $80, $FF

;Kraid statue.
Bank04_L8AC4:  .byte $1E, $00, $08, $FA, $FB, $FA, $FB, $FC, $00, $04, $C5, $C6, $C7, $D5, $D6, $D7
Bank04_L8AD4:  .byte $E5, $E6, $E7, $FF

;Ridley statue.
Bank04_L8AD8:  .byte $1E, $00, $08, $FA, $FB, $FA, $FB, $FE, $C8, $C9, $EB, $D8, $D9, $EA, $E8, $E9
Bank04_L8AE8:  .byte $FF

;Missile explode.
Bank04_L8AE9:  .byte $0A, $04, $08, $FD, $00, $57, $FD, $40, $57, $FF

;Missile explode.
Bank04_L8AF3:  .byte $0B, $04, $0C, $FD, $00, $57, $18, $FD, $40, $18, $57, $FD, $C0, $18, $18, $FF

;Missile explode.
Bank04_L8B03:  .byte $0C, $04, $10, $FD, $00, $57, $18, $FD, $40, $18, $57, $FD, $C0, $18, $18, $FF

;------------------------------------[ Samus enter door routines ]-----------------------------------

;This function is called once when Samus first enters a door.

.checkpc SamusEnterDoor
.advance SamusEnterDoor

Bank04_L8B13:  LDA DoorStatus          ;The code determines if Samus has entered a door if the-->
Bank04_L8B15:  BNE ++++                ;door status is 0, but door data information has been-->
Bank04_L8B17:  LDY SamusDoorData       ;written. If both conditions are met, Samus has just-->
Bank04_L8B19:  BEQ ++++                ;entered a door.
Bank04_L8B1B:  STA CrntMslePickups     ;
Bank04_L8B1D:  STA CrntEnrgyPickups    ;Reset current missile and energy power-up counters.
Bank04_L8B1F:  LDA RandomNumber1       ;
Bank04_L8B21:  AND #$0F                ;Randomly recalculate max missile pickups(16 max, 0 min).
Bank04_L8B23:  STA MaxMissilePickup    ;
Bank04_L8B25:  ASL                     ;
Bank04_L8B26:  ORA #$40                ;*2 for energy pickups and set bit 6(128 max, 64 min).
Bank04_L8B28:  STA MaxEnergyPickup     ;
Bank04_L8B2A:  LDA PPUCNT0ZP           ;
Bank04_L8B2C:  EOR #$01                ;
Bank04_L8B2E:  AND #$01                ;Erase name table door data for new room.
Bank04_L8B30:  TAY                     ;
Bank04_L8B31:  LSR                     ;
Bank04_L8B32:  STA $006C,Y             ;
Bank04_L8B35:  LDA ScrollDir           ;
Bank04_L8B37:  AND #$02                ;Is Samus scrolling horizontally?-->
Bank04_L8B39:  BNE +                   ;If so, branch.
Bank04_L8B3B:  LDX #$04                ;Samus currently scrolling vertically.
Bank04_L8B3D:  LDA ScrollY             ;Is room centered on screen?-->
Bank04_L8B3F:  BEQ +++++               ;If so, branch.
Bank04_L8B41:  LDA $FF                 ;
Bank04_L8B43:  EOR ObjectHi            ;Get inverse of Samus' current nametable.
Bank04_L8B46:  LSR                     ;
Bank04_L8B47:  BCC +++                 ;If Samus is on nametable 3, branch.
Bank04_L8B49:  BCS ++                  ;If Samus is on nametable 0, branch to decrement x.

Bank04_L8B4B:* LDX #$02                ;Samus is currently scrolling horizontally.
Bank04_L8B4D:  LDA ObjectX             ;Is Samus entering a left hand door?-->
Bank04_L8B50:  BPL ++                  ;If so, branch.
Bank04_L8B52:* DEX                     ;

Bank04_SetDoorEntryInfo:
Bank04_L8B53:* TXA                     ;X contains door scroll status and is transferred to A.
Bank04_L8B54:  STA DoorScrollStatus    ;Save door scroll status.
Bank04_L8B56:  JSR Bank04_SamusInDoor         ;($8B74)Indicate Samus just entered a door.
Bank04_L8B59:  LDA #$12                ;
Bank04_L8B5B:  STA DoorDelay           ;Set DoorDelay to 18 frames(going into door).
Bank04_L8B5D:  LDA SamusDoorData       ;
Bank04_L8B5F:  JSR Amul16              ;($C2C5)*16. Move scroll toggle data to upper 4 bits.
Bank04_L8B62:  ORA ObjAction           ;Keep Samus action so she will appear the same comming-->
Bank04_L8B65:  STA SamusDoorData       ;out of the door as she did going in.
Bank04_L8B67:  LDA #$05                ;
Bank04_L8B69:  STA ObjAction           ;Indicate Samus is in a door.
Bank04_L8B6C:* RTS                     ;

Bank04_L8B6D:* JSR Bank04_SetDoorEntryInfo    ;($8B53)Save Samus action and set door entry timer.
Bank04_L8B70:  JSR VertRoomCentered    ;($E21B)Room is centered. Toggle scroll.

Bank04_L8B73:  TXA                     ;X=#$01 or #$02(depending on which door Samus is in).

Bank04_SamusInDoor:
Bank04_L8B74:  ORA #$80                ;Set MSB of DoorStatus to indicate Samus has just-->
Bank04_L8B76:  STA DoorStatus          ;entered a door.
Bank04_L8B78:  RTS                     ;

;----------------------------------------------------------------------------------------------------

.checkpc DoorHandler
.advance DoorHandler

Bank04_L8B79:  LDX #$B0
Bank04_L8B7B:* JSR $8B87
Bank04_L8B7E:  LDA PageIndex
Bank04_L8B80:  SEC 
Bank04_L8B81:  SBC #$10
Bank04_L8B83:  TAX 
Bank04_L8B84:  BMI -
Bank04_L8B86:  RTS

Bank04_L8B87:  STX PageIndex
Bank04_L8B89:  LDA ObjAction,X
Bank04_L8B8C:  JSR ChooseRoutine       ;($C27C)

Bank04_L8B8F:  .word ExitSub
Bank04_L8B91:  .word $8B9D
Bank04_L8B93:  .word $8BD5
Bank04_L8B95:  .word $8C01
Bank04_L8B97:  .word $8C84
Bank04_L8B99:  .word $8CC6
Bank04_L8B9B:  .word $8CF0

Bank04_L8B9D:  INC $0300,X
Bank04_L8BA0:  LDA #$30
Bank04_L8BA2:  JSR SetProjectileAnim       ;($D2FA)
Bank04_L8BA5:  JSR $8CFB
Bank04_L8BA8:  LDY $0307,X
Bank04_L8BAB:  LDA $8BD1,Y
Bank04_L8BAE:  STA $030F,X
Bank04_L8BB1:  LDA $0307,X
Bank04_L8BB4:  CMP #$03
Bank04_L8BB6:  BNE $8BBA
Bank04_L8BB8:  LDA #$01
Bank04_L8BBA:  ORA #$A0
Bank04_L8BBC:  STA $6B
Bank04_L8BBE:  LDA #$00
Bank04_L8BC0:  STA $030A,X
Bank04_L8BC3:  TXA 
Bank04_L8BC4:  AND #$10
Bank04_L8BC6:  EOR #$10
Bank04_L8BC8:  ORA $6B
Bank04_L8BCA:  STA $6B
Bank04_L8BCC:  LDA #$06
Bank04_L8BCE:  JMP AnimDrawObject

Bank04_L8BD1:  .byte $05, $01, $0A, $01

Bank04_L8BD5:  LDA $030A,X
Bank04_L8BD8:  AND #$04
Bank04_L8BDA:  BEQ $8BB1
Bank04_L8BDC:  DEC $030F,X
Bank04_L8BDF:  BNE $8BB1
Bank04_L8BE1:  LDA #$03
Bank04_L8BE3:  CMP $0307,X
Bank04_L8BE6:  BNE $8BEE
Bank04_L8BE8:  LDY $010B
Bank04_L8BEB:  INY 
Bank04_L8BEC:  BNE $8BB1
Bank04_L8BEE:  STA $0300,X
Bank04_L8BF1:  LDA #$50
Bank04_L8BF3:  STA $030F,X
Bank04_L8BF6:  LDA #$2C
Bank04_L8BF8:  STA $0305,X
Bank04_L8BFB:  SEC 
Bank04_L8BFC:  SBC #$03
Bank04_L8BFE:  JMP $8C7E
Bank04_L8C01:  LDA DoorStatus
Bank04_L8C03:  BEQ $8C1D
Bank04_L8C05:  LDA $030C
Bank04_L8C08:  EOR $030C,X
Bank04_L8C0B:  LSR 
Bank04_L8C0C:  BCS $8C1D
Bank04_L8C0E:  LDA $030E
Bank04_L8C11:  EOR $030E,X
Bank04_L8C14:  BMI $8C1D
Bank04_L8C16:  LDA #$04
Bank04_L8C18:  STA $0300,X
Bank04_L8C1B:  BNE $8C73
Bank04_L8C1D:  LDA $0306,X
Bank04_L8C20:  CMP $0305,X
Bank04_L8C23:  BCC $8C73
Bank04_L8C25:  LDA $030F,X
Bank04_L8C28:  CMP #$50
Bank04_L8C2A:  BNE $8C57
Bank04_L8C2C:  JSR $8CF7
Bank04_L8C2F:  LDA $0307,X
Bank04_L8C32:  CMP #$01
Bank04_L8C34:  BEQ $8C57
Bank04_L8C36:  CMP #$03
Bank04_L8C38:  BEQ $8C57
Bank04_L8C3A:  LDA #$0A
Bank04_L8C3C:  STA $09
Bank04_L8C3E:  LDA $030C,X
Bank04_L8C41:  STA $08
Bank04_L8C43:  LDY $50
Bank04_L8C45:  TXA 
Bank04_L8C46:  JSR Amul16
Bank04_L8C49:  BCC $8C4C
Bank04_L8C4B:  DEY 
Bank04_L8C4C:  TYA 
Bank04_L8C4D:  JSR $DC1E
Bank04_L8C50:  LDA #$00
Bank04_L8C52:  STA $0300,X
Bank04_L8C55:  BEQ $8C73
Bank04_L8C57:  LDA $2D
Bank04_L8C59:  LSR 
Bank04_L8C5A:  BCS $8C73
Bank04_L8C5C:  DEC $030F,X
Bank04_L8C5F:  BNE $8C73
Bank04_L8C61:  LDA #$01
Bank04_L8C63:  STA $030F,X
Bank04_L8C66:  JSR $8CFB
Bank04_L8C69:  LDA #$02
Bank04_L8C6B:  STA $0300,X
Bank04_L8C6E:  JSR $8C76
Bank04_L8C71:  LDX PageIndex
Bank04_L8C73:  JMP $8BB1
Bank04_L8C76:  LDA #$30
Bank04_L8C78:  STA $0305,X
Bank04_L8C7B:  SEC 
Bank04_L8C7C:  SBC #$02
Bank04_L8C7E:  JSR SetProjectileAnimWithoutReset
Bank04_L8C81:  JMP SFXDoor
Bank04_L8C84:  LDA DoorStatus
Bank04_L8C86:  CMP #$05
Bank04_L8C88:  BCS $8CC3
Bank04_L8C8A:  JSR $8CFB
Bank04_L8C8D:  JSR $8C76
Bank04_L8C90:  LDX PageIndex
Bank04_L8C92:  LDA $91
Bank04_L8C94:  BEQ $8CA7
Bank04_L8C96:  TXA 
Bank04_L8C97:  JSR Adiv16
Bank04_L8C9A:  EOR $91
Bank04_L8C9C:  LSR 
Bank04_L8C9D:  BCC $8CA7
Bank04_L8C9F:  LDA $76
Bank04_L8CA1:  EOR #$07
Bank04_L8CA3:  STA $76
Bank04_L8CA5:  STA $1C
Bank04_L8CA7:  INC $0300,X
Bank04_L8CAA:  LDA #$00
Bank04_L8CAC:  STA $91
Bank04_L8CAE:  LDA $0307,X
Bank04_L8CB1:  CMP #$03
Bank04_L8CB3:  BNE $8CC3
Bank04_L8CB5:  TXA 
Bank04_L8CB6:  JSR Amul16
Bank04_L8CB9:  BCS $8CC0
Bank04_L8CBB:  JSR TourianMusic
Bank04_L8CBE:  BNE $8CC3
Bank04_L8CC0:  JSR MotherBrainMusic
Bank04_L8CC3:  JMP $8C71
Bank04_L8CC6:  LDA DoorStatus
Bank04_L8CC8:  CMP #$05
Bank04_L8CCA:  BNE $8CED
Bank04_L8CCC:  TXA 
Bank04_L8CCD:  EOR #$10
Bank04_L8CCF:  TAX 
Bank04_L8CD0:  LDA #$06
Bank04_L8CD2:  STA $0300,X
Bank04_L8CD5:  LDA #$2C
Bank04_L8CD7:  STA $0305,X
Bank04_L8CDA:  SEC 
Bank04_L8CDB:  SBC #$03
Bank04_L8CDD:  JSR SetProjectileAnimWithoutReset
Bank04_L8CE0:  JSR SFXDoor
Bank04_L8CE3:  JSR SelectSamusPal
Bank04_L8CE6:  LDX PageIndex
Bank04_L8CE8:  LDA #$02
Bank04_L8CEA:  STA $0300,X
Bank04_L8CED:  JMP $8BB1
Bank04_L8CF0:  LDA DoorStatus
Bank04_L8CF2:  BNE $8CED
Bank04_L8CF4:  JMP $8C61
Bank04_L8CF7:  LDA #$FF
Bank04_L8CF9:  BNE $8CFD
Bank04_L8CFB:  LDA #$4E
Bank04_L8CFD:  PHA 
Bank04_L8CFE:  LDA #$50
Bank04_L8D00:  STA $02
Bank04_L8D02:  TXA 
Bank04_L8D03:  JSR Adiv16
Bank04_L8D06:  AND #$01
Bank04_L8D08:  TAY 
Bank04_L8D09:  LDA $8D3A,Y
Bank04_L8D0C:  STA $03
Bank04_L8D0E:  LDA $030C,X
Bank04_L8D11:  STA $0B
Bank04_L8D13:  JSR MakeCartRAMPtr
Bank04_L8D16:  LDY #$00
Bank04_L8D18:  PLA 
Bank04_L8D19:  STA ($04),Y
Bank04_L8D1B:  TAX 
Bank04_L8D1C:  TYA 
Bank04_L8D1D:  CLC 
Bank04_L8D1E:  ADC #$20
Bank04_L8D20:  TAY 
Bank04_L8D21:  TXA 
Bank04_L8D22:  CPY #$C0
Bank04_L8D24:  BNE $8D19
Bank04_L8D26:  LDX PageIndex
Bank04_L8D28:  TXA 
Bank04_L8D29:  JSR Adiv8
Bank04_L8D2C:  AND #$06
Bank04_L8D2E:  TAY 
Bank04_L8D2F:  LDA $04
Bank04_L8D31:  STA $005C,Y
Bank04_L8D34:  LDA $05
Bank04_L8D36:  STA $005D,Y
Bank04_L8D39:  RTS

Bank04_L8D3A:  .byte $E8, $10, $60, $AD, $91, $69, $8D, $78, $68, $AD, $92, $69, $8D, $79, $68, $A9 
Bank04_L8D4A:  .byte $00, $85, $00, $85, $02, $AD, $97, $69, $29, $80, $F0, $06, $A5, $00, $09, $80
Bank04_L8D5A:  .byte $85, $00, $AD, $97, $69, $29

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

Bank04_L95DA:  .byte $06, $00, $03, $43, $00, $00, $00, $00, $00, $00, $64

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

;Not used.
Bank04_LACD6:  .byte $0D, $1E, $07, $21, $1D, $0D, $0D, $0D, $1E, $21, $07, $21, $21, $15, $14, $15
Bank04_LACE6:  .byte $21, $21, $07, $0D, $21, $16, $10, $16, $21, $0D, $07, $1F, $0D, $20, $10, $1F
Bank04_LACF6:  .byte $0D, $20, $FF, $08, $22, $22, $0D, $22, $22, $1E, $1C, $1D, $08, $1C, $1C, $21
Bank04_LAD06:  .byte $1C, $1C, $21, $1C, $21, $08, $1C, $1C, $0C, $1C, $1C, $1F, $0D, $20, $07, $1C
Bank04_LAD16:  .byte $1C, $21, $1C, $1C, $1C, $14, $04, $1C, $14, $0D, $14, $03, $1C, $1C, $15, $FF
Bank04_LAD26:  .byte $02, $01, $01, $02, $00, $00, $FF, $01, $16, $01, $21, $01, $21, $01, $0C, $01
Bank04_LAD36:  .byte $21, $01, $0D, $01, $21, $FF, $01, $0C, $FF, $07, $22, $22, $22, $22, $22, $22
Bank04_LAD46:  .byte $22, $FF, $05, $0B, $1D, $22, $0D, $22, $04, $11, $21, $11, $21, $04, $11, $21
Bank04_LAD56:  .byte $11, $0D, $03, $11, $21, $11, $03, $23, $23, $23, $FF, $03, $19, $1B, $1A, $FF
Bank04_LAD66:  .byte $01, $34, $01, $34, $FF, $08, $1D, $22, $17, $0D, $1E, $0D, $17, $0D, $08, $0D
Bank04_LAD76:  .byte $22, $17, $20, $21, $14, $0D, $11, $08, $21, $1D, $22, $17, $20, $10, $10, $21
Bank04_LAD86:  .byte $08, $21, $1F, $17, $0D, $22, $0D, $1E, $11, $08, $0D, $14, $10, $1F, $22, $22
Bank04_LAD96:  .byte $20, $11, $FF, $08, $17, $17, $0D, $17, $17, $0D, $17, $17, $08, $0D, $17, $17
Bank04_LADA6:  .byte $17, $17, $17, $17, $0D, $FF, $08, $18, $1D, $17, $1E, $1D, $17, $17, $1E, $08
Bank04_LADB6:  .byte $18, $21, $1C, $21, $21, $1C, $1C, $21, $08, $0D, $20, $1C, $1F, $20, $1C, $1C
Bank04_LADC6:  .byte $1F, $FF, $04, $0D, $0D, $0D, $0D, $04, $18, $18, $18, $18, $04, $18, $18, $18
Bank04_LADD6:  .byte $18, $04, $18, $18, $18, $18, $FF, $07, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $07
Bank04_LADE6:  .byte $0D, $17, $17, $17, $17, $17, $0D, $07, $18, $0A, $10, $0A, $0A, $10, $18, $07
Bank04_LADF6:  .byte $0D, $17, $17, $17, $17, $17, $0D, $FF, $01, $0A, $01, $0A, $01, $0A, $01, $0A
Bank04_LAE06:  .byte $01, $0A, $01, $0A, $01, $0A, $01, $0A, $FF, $01, $0D, $01, $18, $01, $18, $01
Bank04_LAE16:  .byte $18, $01, $18, $FF, $02, $19, $1A, $FF, $01, $0D, $FF, $04, $14, $1C, $1C, $14
Bank04_LAE26:  .byte $04, $0A, $0A, $0A, $0A, $FF, $08, $0D, $22, $22, $22, $22, $22, $22, $0D, $FF
Bank04_LAE36:  .byte $08, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $08, $0E, $10, $0E, $0E, $10, $10
Bank04_LAE46:  .byte $0E, $10, $FF, $A7, $A7, $A7, $A7, $FF, $FF, $A6, $A6, $A2, $A2, $FF, $FF, $FF
Bank04_LAE56:  .byte $FF, $A3, $A3, $A4, $FF, $A4, $FF, $FF, $A5, $FF, $A5, $FF, $79, $FF, $7E, $4F
Bank04_LAE66:  .byte $4F, $4F, $4F, $A0, $A0, $A0, $A0, $A1, $A1, $A1, $A1, $04, $05, $06, $07, $10
Bank04_LAE76:  .byte $11, $12, $13, $00, $01, $02, $03, $08, $08, $08, $08, $18, $19, $1A, $1B, $1C
Bank04_LAE86:  .byte $1D, $1E, $1F, $0C, $0D, $0E, $0F, $09, $09, $09, $09, $7A, $7B, $7F, $5A, $2A
Bank04_LAE96:  .byte $2C, $FF, $FF, $14, $15, $16, $17, $20, $21, $22, $23, $24, $25, $20, $21, $28
Bank04_LAEA6:  .byte $28, $29, $29, $26, $27, $26, $27, $2A, $2B, $FF, $FF, $2B, $2C, $FF, $FF, $2B
Bank04_LAEB6:  .byte $2B, $FF, $FF, $FF, $FF, $FF, $FF, $31, $32, $33, $34, $35, $36, $37, $38, $3D
Bank04_LAEC6:  .byte $3E, $3F, $40, $41, $42, $43, $44, $39, $3A, $39, $3A, $3B, $3B, $3C, $3C, $0B
Bank04_LAED6:  .byte $0B, $2D, $2E, $2F, $30, $0B, $0B, $50, $51, $52, $53, $54, $55, $54, $55, $56
Bank04_LAEE6:  .byte $57, $58, $59, $FF, $FF, $FF, $5E, $5B, $5C, $5F, $60, $FF, $FF, $61, $FF, $5D
Bank04_LAEF6:  .byte $62, $67, $68, $63, $64, $69, $6A, $65, $66, $6B, $6C, $6D, $6E, $73, $74, $6F
Bank04_LAF06:  .byte $70, $75, $76, $71, $72, $77, $78, $45, $46, $47, $48, $FF, $98, $FF, $98, $49
Bank04_LAF16:  .byte $4A, $4B, $4C, $90, $91, $90, $91, $7C, $7D, $4D, $FF, $1C, $1D, $1E, $17, $18
Bank04_LAF26:  .byte $19, $1A, $1F, $20, $21, $22, $60, $61, $62, $63, $0E, $0F, $FF, $FF, $0C, $0D
Bank04_LAF36:  .byte $0D, $0D, $10, $0D, $FF, $10, $10, $FF, $FF, $FF, $FF, $FF, $FF, $30, $FF, $33
Bank04_LAF46:  .byte $FF, $36, $FF, $39, $FF, $3D, $FF, $FF, $31, $32, $34, $35, $37, $38, $3A, $3B
Bank04_LAF56:  .byte $3E, $3F, $3C, $41, $40, $42, $84, $85, $86, $87, $80, $81, $82, $83, $88, $89
Bank04_LAF66:  .byte $8A, $8B, $45, $46, $45, $46, $47, $48, $48, $47, $5C, $5D, $5E, $5F, $B8, $B8
Bank04_LAF76:  .byte $B9, $B9, $74, $75, $75, $74, $C1, $13, $13, $13, $36, $BE, $BC, $BD, $BF, $14
Bank04_LAF86:  .byte $15, $14, $C0, $14, $C0, $16, $FF, $C1, $FF, $FF, $C2, $14, $FF, $FF, $30, $13
Bank04_LAF96:  .byte $BC, $BD, $13, $14, $15, $16, $D7, $D7, $D7, $D7, $76, $76, $76, $76, $FF, $FF
Bank04_LAFA6:  .byte $BA, $BA, $BB, $BB, $BB, $BB, $00, $01, $02, $03, $04, $05, $06, $07, $FF, $FF
Bank04_LAFB6:  .byte $08, $09, $FF, $FF, $09, $0A, $55, $56, $57, $58, $90, $91, $92, $93, $4B, $4C
Bank04_LAFC6:  .byte $4D, $50, $51, $52, $53, $54, $70, $71, $72, $73, $8C, $8D, $8E, $8F, $11, $12
Bank04_LAFD6:  .byte $FF, $11, $11, $12, $12, $11, $11, $12, $12, $FF, $C3, $C4, $C5, $C6, $30, $00
Bank04_LAFE6:  .byte $BC, $BD, $CD, $CE, $CF, $D0, $D1, $D2, $D3, $D4, $90, $91, $92, $93, $20, $20
Bank04_LAFF6:  .byte $20, $20, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0

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