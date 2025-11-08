;Brinstar bank.

;-----------------------------------------[ Start of code ]------------------------------------------

Bank01_L8000:  JMP StartUpdateEnemyAnimation
Bank01_L8003:  JMP StartUpdateEnemyAnimation_2
Bank01_L8006:  JMP Start_Special_Attrs
Bank01_L8009:  JMP DoSomethingToFrameCount
Bank01_L800C:  JMP UpdateEnemyAnim     ;($E094)
Bank01_L800F:  JMP DoSomethingToAnimationIndecies
Bank01_L8012:  JMP DoSomethingToEnDataIndex
Bank01_L8015:  JMP UpdateEnemyHitpoints
Bank01_L8018:  JMP Bank07_LFBB9
Bank01_L801B:  JMP Bank07_LFB88
Bank01_L801E:  JMP Bank07_LFBCA
Bank01_L8021:  JMP Bank07_LF870
Bank01_L8024:  JMP ChooseRoutine       ;($C27C)
Bank01_L8027:  JMP Bank07_LFD8F
Bank01_L802A:  JMP Bank07_LEB6E
Bank01_L802D:  JMP $8244
Bank01_L8030:  JMP $8318
Bank01_L8033:  JMP Bank07_LFA1E
Bank01_L8036:  JMP $833F
Bank01_L8039:  JMP $8395
Bank01_L803C:  JMP SomethingAboutMovement
Bank01_L803F:  JMP DrawTileBlast
Bank01_L8042:  JMP SubtractHealth      ;($CE92)
Bank01_L8045:  JMP Base10Subtract      ;($C3FB)

Bank01_L8048:  .word $84FD, $84A6, $844A, $844A, $84A6, $84FD, $83F4, $83F4

Bank01_L8058:  LDX PageIndex
Bank01_L805A:  LDA $0405,X
Bank01_L805D:  ASL 
Bank01_L805E:  BMI ++++++++
Bank01_L8060:  LDA EnStatus,X
Bank01_L8063:  CMP #$02
Bank01_L8065:  BNE ++++++++
Bank01_L8067:  JSR $8244
Bank01_L806A:  LDA $00
Bank01_L806C:  BPL ++
Bank01_L806E:  JSR TwosCompliment      ;($C3D4)
Bank01_L8071:  STA $66
Bank01_L8073:* JSR $83F5
Bank01_L8076:  JSR $80B8
Bank01_L8079:  DEC $66
Bank01_L807B:  BNE -
Bank01_L807D:* BEQ ++
Bank01_L807F:  STA $66
Bank01_L8081:* JSR $844B
Bank01_L8084:  JSR $80FB
Bank01_L8087:  DEC $66
Bank01_L8089:  BNE -
Bank01_L808B:* JSR $8318
Bank01_L808E:  LDA $00
Bank01_L8090:  BPL ++
Bank01_L8092:  JSR TwosCompliment      ;($C3D4)
Bank01_L8095:  STA $66
Bank01_L8097:* JSR $84A7
Bank01_L809A:  JSR $816E
Bank01_L809D:  DEC $66
Bank01_L809F:  BNE -
Bank01_L80A1:* BEQ ++
Bank01_L80A3:  STA $66
Bank01_L80A5:* JSR $84FE
Bank01_L80A8:  JSR $8134
Bank01_L80AB:  DEC $66
Bank01_L80AD:  BNE -
Bank01_L80AF:* RTS
 
Bank01_L80B0:  LDY EnDataIndex,X
Bank01_L80B3:  LDA $977B,Y
Bank01_L80B6:  ASL                     ;*2 
Bank01_L80B7:  RTS

Bank01_L80B8:  LDX PageIndex
Bank01_L80BA:  BCS $80FA
Bank01_L80BC:  LDA $0405,X
Bank01_L80BF:  BPL $80C7
Bank01_L80C1:  JSR $81FC
Bank01_L80C4:  JMP $80F6
Bank01_L80C7:  JSR $80B0
Bank01_L80CA:  BPL $80EA
Bank01_L80CC:  LDA $6B03,X
Bank01_L80CF:  BEQ $80C1
Bank01_L80D1:  BPL $80D8
Bank01_L80D3:  JSR $81B1
Bank01_L80D6:  BEQ $80E2
Bank01_L80D8:  SEC 
Bank01_L80D9:  ROR $0402,X
Bank01_L80DC:  ROR EnCounter,X
Bank01_L80DF:  JMP $80F6
Bank01_L80E2:  STA $0402,X
Bank01_L80E5:  STA EnCounter,X
Bank01_L80E8:  BEQ $80F6
Bank01_L80EA:  LDA $977B,Y
Bank01_L80ED:  LSR 
Bank01_L80EE:  LSR 
Bank01_L80EF:  BCC $80F6
Bank01_L80F1:  LDA #$04
Bank01_L80F3:  JSR $856B
Bank01_L80F6:  LDA #$01
Bank01_L80F8:  STA $66
Bank01_L80FA:  RTS
 
Bank01_L80FB:  LDX PageIndex
Bank01_L80FD:  BCS $8133
Bank01_L80FF:  LDA $0405,X
Bank01_L8102:  BPL $810A
Bank01_L8104:  JSR $81FC
Bank01_L8107:  JMP $812F
Bank01_L810A:  JSR $80B0
Bank01_L810D:  BPL $8123
Bank01_L810F:  LDA $6B03,X
Bank01_L8112:  BEQ $8104
Bank01_L8114:  BPL $8120
Bank01_L8116:  CLC 
Bank01_L8117:  ROR $0402,X
Bank01_L811A:  ROR EnCounter,X
Bank01_L811D:  JMP $812F
Bank01_L8120:  JSR $81B1
Bank01_L8123:  LDA $977B,Y
Bank01_L8126:  LSR 
Bank01_L8127:  LSR 
Bank01_L8128:  BCC $812F
Bank01_L812A:  LDA #$04
Bank01_L812C:  JSR $856B
Bank01_L812F:  LDA #$01
Bank01_L8131:  STA $66
Bank01_L8133:  RTS
 
Bank01_L8134:  LDX PageIndex
Bank01_L8136:  BCS $816D
Bank01_L8138:  JSR $80B0
Bank01_L813B:  BPL $815E
Bank01_L813D:  LDA $0405,X
Bank01_L8140:  BMI $8148
Bank01_L8142:  JSR $81C7
Bank01_L8145:  JMP $8169
Bank01_L8148:  LDA $6B03,X
Bank01_L814B:  BEQ $8142
Bank01_L814D:  BPL $8159
Bank01_L814F:  CLC 
Bank01_L8150:  ROR $0403,X
Bank01_L8153:  ROR $0407,X
Bank01_L8156:  JMP $8169
Bank01_L8159:  JSR $81C0
Bank01_L815C:  BEQ $8169
Bank01_L815E:  LDA $977B,Y
Bank01_L8161:  LSR 
Bank01_L8162:  BCC $8169
Bank01_L8164:  LDA #$01
Bank01_L8166:  JSR $856B
Bank01_L8169:  LDA #$01
Bank01_L816B:  STA $66
Bank01_L816D:  RTS

Bank01_L816E:  LDX PageIndex
Bank01_L8170:  BCS $81B0
Bank01_L8172:  JSR $80B0
Bank01_L8175:  BPL $81A0
Bank01_L8177:  LDA $0405,X
Bank01_L817A:  BMI $8182
Bank01_L817C:  JSR $81C7
Bank01_L817F:  JMP $81AC
Bank01_L8182:  LDA $6B03,X
Bank01_L8185:  BEQ $817C
Bank01_L8187:  BPL $818E
Bank01_L8189:  JSR $81C0
Bank01_L818C:  BEQ $8198
Bank01_L818E:  SEC 
Bank01_L818F:  ROR $0403,X
Bank01_L8192:  ROR $0407,X
Bank01_L8195:  JMP $81AC
Bank01_L8198:  STA $0403,X
Bank01_L819B:  STA $0407,X
Bank01_L819E:  BEQ $81AC
Bank01_L81A0:  JSR $80B0
Bank01_L81A3:  LSR 
Bank01_L81A4:  LSR 
Bank01_L81A5:  BCC $81AC
Bank01_L81A7:  LDA #$01
Bank01_L81A9:  JSR $856B
Bank01_L81AC:  LDA #$01
Bank01_L81AE:  STA $66
Bank01_L81B0:  RTS
 
Bank01_L81B1:  JSR $81B8
Bank01_L81B4:  STA $6AFE,X
Bank01_L81B7:  RTS

Bank01_L81B8:  LDA #$20
Bank01_L81BA:  JSR LF744
Bank01_L81BD:  LDA #$00
Bank01_L81BF:  RTS

Bank01_L81C0:  JSR $81B8
Bank01_L81C3:  STA $6AFF,X
Bank01_L81C6:  RTS

Bank01_L81C7:  JSR $81F6
Bank01_L81CA:  BNE $81F5
Bank01_L81CC:  LDA #$01
Bank01_L81CE:  JSR $856B
Bank01_L81D1:  LDA $6AFF,X
Bank01_L81D4:  JSR TwosCompliment
Bank01_L81D7:  STA $6AFF,X

Bank01_L81DA:  JSR $81F6
Bank01_L81DD:  BNE $81F5
Bank01_L81DF:  JSR $80B0
Bank01_L81E2:  SEC 
Bank01_L81E3:  BPL $81ED
Bank01_L81E5:  LDA #$00
Bank01_L81E7:  SBC $0407,X
Bank01_L81EA:  STA $0407,X
Bank01_L81ED:  LDA #$00
Bank01_L81EF:  SBC $0403,X
Bank01_L81F2:  STA $0403,X
Bank01_L81F5:  RTS

Bank01_L81F6:  JSR LF74B
Bank01_L81F9:  AND #$20
Bank01_L81FB:  RTS

Bank01_L81FC:  JSR $81F6
Bank01_L81FF:  BNE $81F5
Bank01_L8201:  LDA #$04
Bank01_L8203:  JSR $856B
Bank01_L8206:  LDA $6AFE,X
Bank01_L8209:  JSR TwosCompliment
Bank01_L820C:  STA $6AFE,X

Bank01_L820F:  JSR $81F6
Bank01_L8212:  BNE $822A
Bank01_L8214:  JSR $80B0
Bank01_L8217:  SEC 
Bank01_L8218:  BPL $8222
Bank01_L821A:  LDA #$00
Bank01_L821C:  SBC EnCounter,X
Bank01_L821F:  STA EnCounter,X
Bank01_L8222:  LDA #$00
Bank01_L8224:  SBC $0402,X
Bank01_L8227:  STA $0402,X
Bank01_L822A:  RTS 

Bank01_L822B:  LDA $0405,X
Bank01_L822E:  BPL $8232
Bank01_L8230:  LSR 
Bank01_L8231:  LSR 
Bank01_L8232:  LSR 
Bank01_L8233:  LDA $0408,X
Bank01_L8236:  ROL 
Bank01_L8237:  ASL 
Bank01_L8238:  TAY 
Bank01_L8239:  LDA $96DB,Y
Bank01_L823C:  STA $81
Bank01_L823E:  LDA $96DC,Y
Bank01_L8241:  STA $82
Bank01_L8243:  RTS

Bank01_L8244:  JSR $80B0
Bank01_L8247:  BPL $824C
Bank01_L8249:  JMP $833F
Bank01_L824C:  LDA $0405,X
Bank01_L824F:  AND #$20
Bank01_L8251:  EOR #$20
Bank01_L8253:  BEQ $82A2
Bank01_L8255:  JSR $822B
Bank01_L8258:  LDY EnCounter,X
Bank01_L825B:  LDA ($81),Y
Bank01_L825D:  CMP #$F0
Bank01_L825F:  BCC $827F
Bank01_L8261:  CMP #$FA
Bank01_L8263:  BEQ $827C
Bank01_L8265:  CMP #$FB
Bank01_L8267:  BEQ $82B0
Bank01_L8269:  CMP #$FC
Bank01_L826B:  BEQ $82B3
Bank01_L826D:  CMP #$FD
Bank01_L826F:  BEQ $82A5
Bank01_L8271:  CMP #$FE
Bank01_L8273:  BEQ $82DE
Bank01_L8275:  LDA #$00
Bank01_L8277:  STA EnCounter,X
Bank01_L827A:  BEQ $8258
Bank01_L827C:  JMP $8312
Bank01_L827F:  SEC 
Bank01_L8280:  SBC EnDelay,X
Bank01_L8283:  BNE $8290
Bank01_L8285:  STA EnDelay,X
Bank01_L8288:  INY 
Bank01_L8289:  INY 
Bank01_L828A:  TYA 
Bank01_L828B:  STA EnCounter,X
Bank01_L828E:  BNE $825B
Bank01_L8290:  INC EnDelay,X
Bank01_L8293:  INY 
Bank01_L8294:  LDA ($81),Y
Bank01_L8296:  ASL 
Bank01_L8297:  PHP 
Bank01_L8298:  JSR Adiv32              ;($C2BE)Divide by 32.
Bank01_L829B:  PLP 
Bank01_L829C:  BCC $82A2
Bank01_L829E:  EOR #$FF
Bank01_L82A0:  ADC #$00
Bank01_L82A2:  STA $00
Bank01_L82A4:  RTS

Bank01_L82A5:  INC EnCounter,X
Bank01_L82A8:  INY 
Bank01_L82A9:  LDA #$00
Bank01_L82AB:  STA $6B01,X
Bank01_L82AE:  BEQ $825B
Bank01_L82B0:  PLA 
Bank01_L82B1:  PLA 
Bank01_L82B2:  RTS

Bank01_L82B3:  LDA $6B03,X
Bank01_L82B6:  BPL $82BE
Bank01_L82B8:  JSR GrowRadiusY
Bank01_L82BB:  JMP $82C3
Bank01_L82BE:  BEQ $82D2
Bank01_L82C0:  JSR ShrinkRadiusY
Bank01_L82C3:  LDX PageIndex
Bank01_L82C5:  BCS $82D2
Bank01_L82C7:  LDY EnCounter,X
Bank01_L82CA:  INY 
Bank01_L82CB:  LDA #$00
Bank01_L82CD:  STA $6B03,X
Bank01_L82D0:  BEQ $82D7
Bank01_L82D2:  LDY EnCounter,X
Bank01_L82D5:  DEY 
Bank01_L82D6:  DEY 
Bank01_L82D7:  TYA 
Bank01_L82D8:  STA EnCounter,X
Bank01_L82DB:  JMP $825B
Bank01_L82DE:  DEY 
Bank01_L82DF:  DEY 
Bank01_L82E0:  TYA 
Bank01_L82E1:  STA EnCounter,X
Bank01_L82E4:  LDA $6B03,X
Bank01_L82E7:  BPL $82EF
Bank01_L82E9:  JSR GrowRadiusY
Bank01_L82EC:  JMP $82F4
Bank01_L82EF:  BEQ $82FB
Bank01_L82F1:  JSR ShrinkRadiusY
Bank01_L82F4:  LDX PageIndex
Bank01_L82F6:  BCC $82FB
Bank01_L82F8:  JMP $8258
Bank01_L82FB:  LDY EnDataIndex,X
Bank01_L82FE:  LDA $968B,Y
Bank01_L8301:  AND #$20
Bank01_L8303:  BEQ $8312
Bank01_L8305:  LDA $0405,X
Bank01_L8308:  EOR #$05
Bank01_L830A:  ORA $968B,Y
Bank01_L830D:  AND #$1F
Bank01_L830F:  STA $0405,X
Bank01_L8312:  JSR $81B1
Bank01_L8315:  JMP $82A2
Bank01_L8318:  JSR $80B0
Bank01_L831B:  BPL $8320
Bank01_L831D:  JMP $8395
Bank01_L8320:  LDA $0405,X
Bank01_L8323:  AND #$20
Bank01_L8325:  EOR #$20
Bank01_L8327:  BEQ $833C
Bank01_L8329:  LDY EnCounter,X
Bank01_L832C:  INY 
Bank01_L832D:  LDA ($81),Y
Bank01_L832F:  TAX 
Bank01_L8330:  AND #$08
Bank01_L8332:  PHP 
Bank01_L8333:  TXA 
Bank01_L8334:  AND #$07
Bank01_L8336:  PLP 
Bank01_L8337:  BEQ $833C
Bank01_L8339:  JSR TwosCompliment
Bank01_L833C:  STA $00
Bank01_L833E:  RTS

Bank01_L833F:  LDY #$0E
Bank01_L8341:  LDA $6AFE,X
Bank01_L8344:  BMI $835E
Bank01_L8346:  CLC 
Bank01_L8347:  ADC EnCounter,X
Bank01_L834A:  STA EnCounter,X
Bank01_L834D:  LDA $0402,X
Bank01_L8350:  ADC #$00
Bank01_L8352:  STA $0402,X
Bank01_L8355:  BPL $8376
Bank01_L8357:  JSR TwosCompliment
Bank01_L835A:  LDY #$F2
Bank01_L835C:  BNE $8376
Bank01_L835E:  JSR TwosCompliment
Bank01_L8361:  SEC 
Bank01_L8362:  STA $00
Bank01_L8364:  LDA EnCounter,X
Bank01_L8367:  SBC $00
Bank01_L8369:  STA EnCounter,X
Bank01_L836C:  LDA $0402,X
Bank01_L836F:  SBC #$00
Bank01_L8371:  STA $0402,X
Bank01_L8374:  BMI $8357
Bank01_L8376:  CMP #$0E
Bank01_L8378:  BCC $8383
Bank01_L837A:  LDA #$00
Bank01_L837C:  STA EnCounter,X
Bank01_L837F:  TYA 
Bank01_L8380:  STA $0402,X
Bank01_L8383:  LDA $6AFC,X
Bank01_L8386:  CLC 
Bank01_L8387:  ADC EnCounter,X
Bank01_L838A:  STA $6AFC,X
Bank01_L838D:  LDA #$00
Bank01_L838F:  ADC $0402,X
Bank01_L8392:  STA $00
Bank01_L8394:  RTS

Bank01_L8395:  LDA #$00
Bank01_L8397:  STA $00
Bank01_L8399:  STA $02
Bank01_L839B:  LDA #$0E
Bank01_L839D:  STA $01
Bank01_L839F:  STA $03
Bank01_L83A1:  LDA $0407,X
Bank01_L83A4:  CLC 
Bank01_L83A5:  ADC $6AFF,X
Bank01_L83A8:  STA $0407,X
Bank01_L83AB:  STA $04
Bank01_L83AD:  LDA #$00
Bank01_L83AF:  LDY $6AFF,X
Bank01_L83B2:  BPL $83B6
Bank01_L83B4:  LDA #$FF
Bank01_L83B6:  ADC $0403,X
Bank01_L83B9:  STA $0403,X
Bank01_L83BC:  TAY 
Bank01_L83BD:  BPL $83D0
Bank01_L83BF:  LDA #$00
Bank01_L83C1:  SEC 
Bank01_L83C2:  SBC $0407,X
Bank01_L83C5:  STA $04
Bank01_L83C7:  LDA #$00
Bank01_L83C9:  SBC $0403,X
Bank01_L83CC:  TAY 
Bank01_L83CD:  JSR LE449
Bank01_L83D0:  LDA $04
Bank01_L83D2:  CMP $02
Bank01_L83D4:  TYA 
Bank01_L83D5:  SBC $03
Bank01_L83D7:  BCC $83E3
Bank01_L83D9:  LDA $00
Bank01_L83DB:  STA $0407,X
Bank01_L83DE:  LDA $01
Bank01_L83E0:  STA $0403,X
Bank01_L83E3:  LDA $6AFD,X
Bank01_L83E6:  CLC 
Bank01_L83E7:  ADC $0407,X
Bank01_L83EA:  STA $6AFD,X
Bank01_L83ED:  LDA #$00
Bank01_L83EF:  ADC $0403,X
Bank01_L83F2:  STA $00
Bank01_L83F4:  RTS

Bank01_L83F5:  LDX PageIndex
Bank01_L83F7:  LDA EnYRoomPos,X
Bank01_L83FA:  SEC 
Bank01_L83FB:  SBC EnRadY,X
Bank01_L83FE:  AND #$07
Bank01_L8400:  SEC 
Bank01_L8401:  BNE $8406
Bank01_L8403:  JSR GrowRadiusY
Bank01_L8406:  LDY #$00
Bank01_L8408:  STY $00
Bank01_L840A:  LDX PageIndex
Bank01_L840C:  BCC $844A
Bank01_L840E:  INC $00
Bank01_L8410:  LDY EnYRoomPos,X
Bank01_L8413:  BNE $8429
Bank01_L8415:  LDY #$F0
Bank01_L8417:  LDA $49
Bank01_L8419:  CMP #$02
Bank01_L841B:  BCS $8429
Bank01_L841D:  LDA $FC
Bank01_L841F:  BEQ $844A
Bank01_L8421:  JSR $8563
Bank01_L8424:  BEQ $844A
Bank01_L8426:  JSR $855A
Bank01_L8429:  DEY 
Bank01_L842A:  TYA 
Bank01_L842B:  STA EnYRoomPos,X
Bank01_L842E:  CMP EnRadY,X
Bank01_L8431:  BNE $8441
Bank01_L8433:  LDA $FC
Bank01_L8435:  BEQ $843C
Bank01_L8437:  JSR $8563
Bank01_L843A:  BNE $8441
Bank01_L843C:  INC EnYRoomPos,X
Bank01_L843F:  CLC 
Bank01_L8440:  RTS

Bank01_L8441:  LDA $0405,X
Bank01_L8444:  BMI $8449
Bank01_L8446:  INC $6B01,X
Bank01_L8449:  SEC 
Bank01_L844A:  RTS

Bank01_L844B:  LDX PageIndex
Bank01_L844D:  LDA EnYRoomPos,X
Bank01_L8450:  CLC 
Bank01_L8451:  ADC EnRadY,X
Bank01_L8454:  AND #$07
Bank01_L8456:  SEC 
Bank01_L8457:  BNE $845C
Bank01_L8459:  JSR ShrinkRadiusY
Bank01_L845C:  LDY #$00
Bank01_L845E:  STY $00
Bank01_L8460:  LDX PageIndex
Bank01_L8462:  BCC $84A6
Bank01_L8464:  INC $00
Bank01_L8466:  LDY EnYRoomPos,X
Bank01_L8469:  CPY #$EF
Bank01_L846B:  BNE $8481
Bank01_L846D:  LDY #$FF
Bank01_L846F:  LDA $49
Bank01_L8471:  CMP #$02
Bank01_L8473:  BCS $8481
Bank01_L8475:  LDA $FC
Bank01_L8477:  BEQ $84A6
Bank01_L8479:  JSR $8563
Bank01_L847C:  BNE $84A6
Bank01_L847E:  JSR $855A
Bank01_L8481:  INY 
Bank01_L8482:  TYA 
Bank01_L8483:  STA EnYRoomPos,X
Bank01_L8486:  CLC 
Bank01_L8487:  ADC EnRadY,X
Bank01_L848A:  CMP #$EF
Bank01_L848C:  BNE $849D
Bank01_L848E:  LDA $FC
Bank01_L8490:  BEQ $8497
Bank01_L8492:  JSR $8563
Bank01_L8495:  BEQ $849D
Bank01_L8497:  DEC EnYRoomPos,X
Bank01_L849A:  CLC 
Bank01_L849B:  BCC $84A6
Bank01_L849D:  LDA $0405,X
Bank01_L84A0:  BMI $84A5
Bank01_L84A2:  DEC $6B01,X
Bank01_L84A5:  SEC 
Bank01_L84A6:  RTS

Bank01_L84A7:  LDX PageIndex
Bank01_L84A9:  LDA EnXRoomPos,X
Bank01_L84AC:  SEC 
Bank01_L84AD:  SBC EnRadX,X
Bank01_L84B0:  AND #$07
Bank01_L84B2:  SEC 
Bank01_L84B3:  BNE $84B8
Bank01_L84B5:  JSR GrowRadiusX
Bank01_L84B8:  LDY #$00
Bank01_L84BA:  STY $00
Bank01_L84BC:  LDX PageIndex
Bank01_L84BE:  BCC $84FD
Bank01_L84C0:  INC $00
Bank01_L84C2:  LDY EnXRoomPos,X
Bank01_L84C5:  BNE $84DA
Bank01_L84C7:  LDA $49
Bank01_L84C9:  CMP #$02
Bank01_L84CB:  BCC $84DA
Bank01_L84CD:  LDA $FD
Bank01_L84CF:  BEQ $84D4
Bank01_L84D1:  JSR $8563
Bank01_L84D4:  CLC 
Bank01_L84D5:  BEQ $84FD
Bank01_L84D7:  JSR $855A
Bank01_L84DA:  DEC EnXRoomPos,X
Bank01_L84DD:  LDA EnXRoomPos,X
Bank01_L84E0:  CMP EnRadX,X
Bank01_L84E3:  BNE $84F4
Bank01_L84E5:  LDA $FD
Bank01_L84E7:  BEQ $84EE
Bank01_L84E9:  JSR $8563
Bank01_L84EC:  BNE $84F4
Bank01_L84EE:  INC EnXRoomPos,X
Bank01_L84F1:  CLC 
Bank01_L84F2:  BCC $84FD
Bank01_L84F4:  LDA $0405,X
Bank01_L84F7:  BPL $84FC
Bank01_L84F9:  INC $6B01,X
Bank01_L84FC:  SEC 
Bank01_L84FD:  RTS

Bank01_L84FE:  LDX PageIndex
Bank01_L8500:  LDA EnXRoomPos,X
Bank01_L8503:  CLC 
Bank01_L8504:  ADC EnRadX,X
Bank01_L8507:  AND #$07
Bank01_L8509:  SEC 
Bank01_L850A:  BNE $850F
Bank01_L850C:  JSR ShrinkRadiusX
Bank01_L850F:  LDY #$00
Bank01_L8511:  STY $00
Bank01_L8513:  LDX PageIndex
Bank01_L8515:  BCC $8559
Bank01_L8517:  INC $00
Bank01_L8519:  INC EnXRoomPos,X
Bank01_L851C:  BNE $8536
Bank01_L851E:  LDA $49
Bank01_L8520:  CMP #$02
Bank01_L8522:  BCC $8536
Bank01_L8524:  LDA $FD
Bank01_L8526:  BEQ $852D
Bank01_L8528:  JSR $8563
Bank01_L852B:  BEQ $8533
Bank01_L852D:  DEC EnXRoomPos,X
Bank01_L8530:  CLC 
Bank01_L8531:  BCC $8559
Bank01_L8533:  JSR $855A
Bank01_L8536:  LDA EnXRoomPos,X
Bank01_L8539:  CLC 
Bank01_L853A:  ADC EnRadX,X
Bank01_L853D:  CMP #$FF
Bank01_L853F:  BNE $8550
Bank01_L8541:  LDA $FD
Bank01_L8543:  BEQ $854A
Bank01_L8545:  JSR $8563
Bank01_L8548:  BEQ $8550
Bank01_L854A:  DEC EnXRoomPos,X
Bank01_L854D:  CLC 
Bank01_L854E:  BCC $8559
Bank01_L8550:  LDA $0405,X
Bank01_L8553:  BPL $8558
Bank01_L8555:  DEC $6B01,X
Bank01_L8558:  SEC 
Bank01_L8559:  RTS

Bank01_L855A:  LDA EnNameTable,X
Bank01_L855D:  EOR #$01
Bank01_L855F:  STA EnNameTable,X
Bank01_L8562:  RTS

Bank01_L8563:  LDA EnNameTable,X
Bank01_L8566:  EOR $FF
Bank01_L8568:  AND #$01
Bank01_L856A:  RTS

Bank01_L856B:  EOR $0405,X
Bank01_L856E:  STA $0405,X
Bank01_L8571:  RTS 

;---------------------------------[ Object animation data tables ]----------------------------------

;The following tables are indices into the FramePtrTable that correspond to various animations. The
;FramePtrTable represents individual frames and the entries in ObjectAnimIdxTbl are the groups of
;frames responsible for animaton Samus, her weapons and other objects.

.checkpc ObjectAnimIdxTbl
.advance ObjectAnimIdxTbl

;Samus run animation.
Bank01_L8572:  .byte $03, $04, $05, $00

;Samus front animation.
Bank01_L8576:  .byte $07, $00

;Samus jump out of ball animation.
Bank01_L8578:  .byte $17

;Samus Stand animation.
Bank01_L8579:  .byte $08, $00

;Samus stand and fire animation.
Bank01_L857B:  .byte $22, $00

;Samus stand and jump animation.
Bank01_L857D:  .byte $04

;Samus Jump animation.
Bank01_L857E:  .byte $10, $00

;Samus summersault animation.
Bank01_L8580:  .byte $17, $18, $19, $1A, $00

;Samus run and jump animation.
Bank01_L8585:  .byte $03, $17, $00

;Samus roll animation.
Bank01_L8588:  .byte $1E, $1D, $1C, $1B, $00

;Bullet animation.
Bank01_L858D:  .byte $28, $00

;Bullet hit animation.
Bank01_L858F:  .byte $2A, $F7, $00

;Samus jump and fire animation.
Bank01_L8592:  .byte $12, $00

;Samus run and fire animation.
Bank01_L8594:  .byte $0C, $0D, $0E, $00

;Samus point up and shoot animation.
Bank01_L8598:  .byte $30 

;Samus point up animation.
Bank01_L8599:  .byte $2B, $00

;Door open animation.
Bank01_L859B:  .byte $31, $31, $33, $F7, $00

;Door close animation.
Bank01_L85A0:  .byte $33, $33, $31, $00

;Samus explode animation.
Bank01_L85A4: .byte $35, $00

;Samus jump and point up animation.
Bank01_L85A6: .byte $39, $38, $00

;Samus run and point up animation.
Bank01_L85A9:  .byte $40, $41, $42, $00

;Samus run, point up and shoot animation 1.
Bank01_L85AD:  .byte $46, $00

;Samus run, point up and shoot animation 2.
Bank01_L85AF:  .byte $47, $00

;Samus run, point up and shoot animation 3.
Bank01_L85B1:  .byte $48, $00

;Samus on elevator animation 1.
Bank01_L85B3:  .byte $07, $F7, $F7, $07, $F7, $F7, $F7, $07, $F7, $F7, $F7, $F7, $07, $F7, $00

;Samus on elevator animation 2.
Bank01_L85C2:  .byte $23, $F7, $F7, $23, $F7, $F7, $F7, $23, $F7, $F7, $F7, $F7, $23, $F7, $00

;Samus on elevator animation 3.
Bank01_L85D1:  .byte $07, $F7, $F7, $F7, $F7, $07, $F7, $F7, $F7, $07, $F7, $F7, $07, $F7, $00

;Samus on elevator animation 4.
Bank01_L85E0:  .byte $23, $F7, $F7, $F7, $F7, $23, $F7, $F7, $F7, $23, $F7, $F7, $23, $F7, $00

;Wave beam animation.
Bank01_L85EF:  .byte $4B, $00

;Bomb tick animation.
Bank01_L85F1:  .byte $4E, $4F, $00

;Bomb explode animation.
Bank01_L85F4:  .byte $3C, $4A, $49, $4A, $4D, $4A, $4D, $F7, $00

;Missile left animation.
Bank01_L85FD:  .byte $26, $00

;Missile right animation.
Bank01_L85FF:  .byte $25, $00

;Missile up animation.
Bank01_L8601:  .byte $27, $00

;Missile explode animation.
Bank01_L8603:  .byte $67, $67, $67, $68, $68, $69, $F7, $00

;----------------------------[ Sprite drawing pointer tables ]--------------------------------------

;The above animation pointers provide an index into the following table
;for the animation sequences.

.checkpc FramePtrTable
.advance FramePtrTable

Bank01_L860B:  .word $87CB, $87CB, $87CB, $87CB, $87DD, $87F0, $8802, $8802
Bank01_L861B:  .word $8818, $882C, $882C, $882C, $882C, $883E, $8851, $8863
Bank01_L862B:  .word $8863, $8874, $8874, $8885, $8885, $8885, $8885, $8885
Bank01_L863B:  .word $888F, $8899, $88A3, $88AD, $88B8, $88C3, $88CE, $88D9
Bank01_L864B:  .word $88D9, $88D9, $88D9, $88EE, $88F8, $88F8, $88FE, $8904
Bank01_L865B:  .word $890A, $890F, $890F, $8914, $8928, $8928, $8928, $8928
Bank01_L866B:  .word $8928, $893C, $8948, $8948, $8954, $8954, $8961, $8961
Bank01_L867B:  .word $8961, $8974, $8987, $8987, $8987, $8995, $8995, $8995
Bank01_L868B:  .word $8995, $89A9, $89BE, $89D2, $89D2, $89D2, $89D2, $89E6
Bank01_L869B:  .word $89FB, $8A0F, $8A1D, $8A21, $8A26, $8A26, $8A3C, $8A41
Bank01_L86AB:  .word $8A46, $8A4E, $8A56, $8A5E, $8A66, $8A6E, $8A76, $8A7E
Bank01_L86BB:  .word $8A86, $8A8E, $8A9C, $8AA1, $8AA6, $8AAE, $8ABA, $8AC4
Bank01_L86CB:  .word $8AC4, $8AC4, $8AC4, $8AC4, $8AC4, $8AC4, $8AD8, $8AE9
Bank01_L86DB:  .word $8AF3, $8B03

;The following table provides pointers to data used for the placement of the sprites that make up
;Samus and other non-enemy objects.

.checkpc PlacePtrTable
.advance PlacePtrTable

Bank01_L86DF:  .word $8701, $871F, $872B, $8737, $8747, $8751, $86FD, $875D
Bank01_L86EF:  .word $8775, $878D, $8791, $8799, $87A5, $8749, $87B1

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
Bank01_L86FD:  .byte $E8, $FC, $EA, $FC

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
Bank01_L8701:  .byte $F0, $F8, $F0, $00, $F8, $F0, $F8, $F8, $F8, $00, $00, $F8, $00, $00, $00, $08
;              +--8--+   +--9--+   +--A--+   +--B--+   +--C--+   +--D--+   +--E--+
Bank01_L8711:  .byte $08, $F8, $08, $00, $08, $08, $F8, $F4, $F8, $F6, $EC, $F4, $EE, $F4

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
Bank01_L871F:  .byte $F3, $F8, $F3, $00, $FB, $F8, $FB, $00, $03, $F8, $03, $00 

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
Bank01_L872B:  .byte $F8, $F6, $F8, $FE, $F8, $06, $00, $F6, $00, $FE, $00, $06

;Elevator frame.
;          +--------+--------+--------+--------+--------+--------+--------+--------+
;          |        |        |        |        |        |        |        |        |
;          |        |        |        |        |        |        |        |        |
;          |        |        *        |        |        |        |        |        |
;          |       0|       1|       2|       3|       4|       5|       6|       7|
;          +--------+--------+--------+--------+--------+--------+--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+   +--4--+   +--5--+   +--6--+   +--7--+
Bank01_L8737:  .byte $FC, $F0, $FC, $F8, $FC, $00, $FC, $08, $FC, $10, $FC, $18, $FC, $20, $FC, $28

;Several projectile frames.
;          +--------+
;          |        |
;          |        |
;          |    *   |
;          |       0|
;          +--------+
;              +--0--+
Bank01_L8747:  .byte $FC, $FC

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
Bank01_L8749:  .byte $F8, $F8, $F8, $00, $00, $F8, $00, $00

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
Bank01_L8751:  .byte $E8, $00, $F0, $00, $F8, $00, $00, $00, $08, $00, $10, $00 

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
Bank01_L875D:  .byte $80, $80, $81, $81, $82, $82, $83, $83, $84, $84, $85, $85, $F4, $F8, $F4, $00
;              +--2--+   +--3--+   +--4--+   +--5--+
Bank01_L876D:  .byte $FC, $F8, $FC, $00, $04, $F8, $04, $00

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
Bank01_L8775:  .byte $F0, $00, $F0, $08, $F8, $08, $F0, $F0, $F0, $F8, $F8, $F0, $00, $F0, $08, $F0
;              +--8--+   +--9--+   +--A--+   +--B--+
Bank01_L8785:  .byte $08, $F8, $00, $08, $08, $00, $08, $08

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
Bank01_L878D:  .byte $F8, $FC, $00, $FC

;Missile left/right and missile explode frames.
;          +--------+--------+        +--------+--------+
;          |        |        |        |        |        |
;          |        |        |        |        |        |
;          |        *        |        |        |        |
;          |       0|       1|        |       2|       3|
;          +--------+--------+        +--------+--------+
;              +--0--+   +--1--+   +--2--+   +--3--+
Bank01_L8791:  .byte $FC, $F8, $FC, $00, $FC, $10, $FC, $18

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
Bank01_L8799:  .byte $FC, $F0, $F4, $F8, $F4, $00, $FC, $08, $04, $F8, $04, $00

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
Bank01_L87A5:  .byte $FC, $E8, $EC, $F0, $EC, $08, $FC, $10, $0C, $F0, $0C, $08

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
Bank01_L87B1:  .byte $00, $F8, $00, $00, $08, $F8, $08, $00, $E8, $F0, $E8, $F8, $E8, $00, $F0, $F0
;              +--8--+   +--9--+   +--A--+   +--B--+   +--C--+
Bank01_L87C1:  .byte $F0, $F8, $F0, $00, $F8, $F0, $F8, $F8, $F8, $00

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
Bank01_L87CB:  .byte $40, $0F, $04, $00, $01, $FD, $20, $FE, $41, $40, $FD, $60, $20, $21, $FE, $FE
Bank01_L87DB:  .byte $31, $FF

;Samus run.
Bank01_L87DD:  .byte $40, $0F, $04, $02, $03, $FD, $20, $FE, $43, $42, $FD, $60, $22, $23, $FE, $32
Bank01_L87ED:  .byte $33, $34, $FF

;Samus run.
Bank01_L87F0:  .byte $40, $0F, $04, $05, $06, $FD, $20, $FE, $45, $44, $FD, $60, $25, $26, $27, $35
Bank01_L8800:  .byte $36, $FF

;Samus facing forward.
Bank01_L8802:  .byte $00, $0F, $04, $09, $FD, $60, $09, $FD, $20, $FE, $19, $1A, $FD, $20, $29, $2A
Bank01_L8812:  .byte $FE, $39, $FD, $60, $39, $FF

;Samus stand.
Bank01_L8818:  .byte $40, $0F, $04, $FD, $20, $0E, $0D, $FE, $1E, $1D, $2E, $2D, $FE, $FD, $60, $3B
Bank01_L8828:  .byte $3C, $FE, $17, $FF

;Samus run and fire.
Bank01_L882C:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $20, $21, $FE, $FE
Bank01_L883C:  .byte $31, $FF

;Samus run and fire.
Bank01_L883E:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $22, $23, $FE, $32
Bank01_L884E:  .byte $33, $34, $FF

;Samus run and fire.
Bank01_L8851:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $25, $26, $27, $35
Bank01_L8861:  .byte $36, $FF

;Samus stand and jump.
Bank01_L8863:  .byte $40, $0F, $04, $00, $01, $FD, $20, $FE, $41, $40, $FD, $60, $22, $07, $08, $32
Bank01_L8873:  .byte $FF

;Samus jump and fire.
Bank01_L8874:  .byte $40, $0F, $04, $00, $01, $FD, $20, $4B, $4A, $49, $FD, $60, $22, $07, $08, $32
Bank01_L8884:  .byte $FF

;Samus summersault.
Bank01_L8885:  .byte $41, $0F, $04, $52, $53, $62, $63, $72, $73, $FF

;Samus summersault.
Bank01_L888F:  .byte $42, $0F, $04, $54, $55, $56, $64, $65, $66, $FF

;Samus summersault.
Bank01_L8899:  .byte $81, $0F, $04, $52, $53, $62, $63, $72, $73, $FF

;Samus summersault.
Bank01_L88A3:  .byte $82, $0F, $04, $54, $55, $56, $64, $65, $66, $FF

;Samus roll.
Bank01_L88AD:  .byte $01, $08, $04, $FC, $03, $00, $50, $51, $60, $61, $FF

;Samus roll.
Bank01_L88B8:  .byte $81, $08, $04, $FC, $FD, $00, $50, $51, $60, $61, $FF

;Samus roll.
Bank01_L88C3:  .byte $C1, $08, $04, $FC, $FD, $00, $50, $51, $60, $61, $FF

;Samus roll.
Bank01_L88CE:  .byte $41, $08, $04, $FC, $03, $00, $50, $51, $60, $61, $FF

;Samus stand and fire.
Bank01_L88D9:  .byte $40, $0F, $04, $FD, $20, $0E, $0D, $FE, $1E, $1D, $2E, $2D, $FE, $FD, $60, $3B
Bank01_L88E9:  .byte $3C, $FE, $FE, $17, $FF

;Elevator.
Bank01_L88EE:  .byte $03, $04, $10, $28, $38, $38, $FD, $60, $28, $FF

;Missile right.
Bank01_L88F8:  .byte $4A, $04, $08, $5E, $5F, $FF

;Missile left.
Bank01_L88FE:  .byte $0A, $04, $08, $5E, $5F, $FF

;Missile up.
Bank01_L8904:  .byte $09, $08, $04, $14, $24, $FF

;Bullet fire.
Bank01_L890A:  .byte $04, $02, $02, $30, $FF

;Bullet hit.
Bank01_L890F:  .byte $04, $00, $00, $04, $FF

;Samus stand and point up.
Bank01_L8914:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $2E, $2D, $FE, $FD
Bank01_L8924:  .byte $60, $3B, $3C, $FF

;Samus from ball to pointing up.
Bank01_L8928:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $2E, $2D, $FE, $FD
Bank01_L8938:  .byte $60, $3B, $3C, $FF

;Door closed.
Bank01_L893C:  .byte $35, $18, $08, $0F, $1F, $2F, $FD, $A3, $2F, $1F, $0F, $FF

;Door open/close.
Bank01_L8948:  .byte $35, $18, $04, $6A, $6B, $6C, $FD, $A3, $6C, $6B, $6A, $FF

;Samus explode.
Bank01_L8954:  .byte $07, $00, $00, $FC, $FC, $00, $0B, $0C, $1B, $1C, $2B, $2C, $FF

;Samus jump and point up.
Bank01_L8961:  .byte $46, $0F, $04, $69, $FD, $20, $FE, $7A, $79, $FE, $78, $77, $FD, $60, $22, $07
Bank01_L8971:  .byte $08, $32, $FF

;Samus jump and point up.
Bank01_L8974:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $07
Bank01_L8984:  .byte $08, $32, $FF

;Bomb explode.
Bank01_L8987:  .byte $0D, $0C, $0C, $74, $FD, $60, $74, $FD, $A0, $74, $FD, $E0, $74, $FF

;Samus run and point up.
Bank01_L8995:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $20, $21
Bank01_L89A5:  .byte $FE, $FE, $31, $FF

;Samus run and point up.
Bank01_L89A9:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $23
Bank01_L89B9:  .byte $FE, $32, $33, $34, $FF

;Samus run and point up.
Bank01_L89BE:  .byte $46, $0F, $04, $69, $FE, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $25, $26
Bank01_L89CE:  .byte $27, $35, $36, $FF

;Samus run and point up.
Bank01_L89D2:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $20, $21
Bank01_L89E2:  .byte $FE, $FE, $31, $FF

;Samus point up, run and fire.
Bank01_L89E6:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $22, $23
Bank01_L89F6:  .byte $FE, $32, $33, $34, $FF

;Samus point up, run and fire.
Bank01_L89FB:  .byte $46, $0F, $04, $FE, $69, $FD, $20, $7A, $79, $FE, $78, $77, $FD, $60, $25, $26
Bank01_L8A0B:  .byte $27, $35, $36, $FF

;Bomb explode.
Bank01_L8A0F:  .byte $0D, $0C, $0C, $75, $FD, $60, $75, $FD, $A0, $75, $FD, $E0, $75, $FF

;Bomb explode.
Bank01_L8A1D:  .byte $00, $00, $00, $FF

;Wave beam.
Bank01_L8A21:  .byte $04, $04, $04, $4C, $FF

;Bomb explode.
Bank01_L8A26:  .byte $08, $10, $10, $3D, $3E, $4E, $FD, $60, $3E, $3D, $4E, $FD, $E0, $4E, $3E, $3D
Bank01_L8A36:  .byte $FD, $A0, $4E, $3D, $3E, $FF

;Bomb tick.
Bank01_L8A3C:  .byte $04, $04, $04, $70, $FF

;Bomb tick.
Bank01_L8A41:  .byte $04, $04, $04, $71, $FF

;Bomb item.
Bank01_L8A46:  .byte $0D, $03, $03, $86, $87, $96, $97, $FF

;High jump item.
Bank01_L8A4E:  .byte $0D, $03, $03, $7B, $7C, $8B, $8C, $FF

;Long beam item.
Bank01_L8A56:  .byte $0D, $03, $03, $88, $67, $98, $99, $FF

;Screw attack item.
Bank01_L8A5E:  .byte $0D, $03, $03, $80, $81, $90, $91, $FF

;Maru Mari item.
Bank01_L8A66:  .byte $0D, $03, $03, $7D, $7E, $8D, $8E, $FF

;Varia item.
Bank01_L8A6E:  .byte $0D, $03, $03, $82, $83, $92, $93, $FF

;Wave beam item.
Bank01_L8A76:  .byte $0D, $03, $03, $88, $89, $98, $99, $FF

;Ice beam item.
Bank01_L8A7E:  .byte $0D, $03, $03, $88, $68, $98, $99, $FF

;Energy tank item.
Bank01_L8A86:  .byte $0D, $03, $03, $84, $85, $94, $95, $FF

;Missile item.
Bank01_L8A8E:  .byte $0D, $03, $03, $3F, $FD, $40, $3F, $FD, $00, $4F, $FD, $40, $4F, $FF

;Skree burrow.
Bank01_L8A9C:  .byte $34, $04, $04, $F2, $FF

;Not used.
Bank01_L8AA1:  .byte $04, $00, $00, $5A, $FF, $13, $00, $00, $B0, $B1, $B2, $B3, $FF, $13, $00, $00
Bank01_L8AB1:  .byte $B4, $B5, $B6, $B7, $B8, $B6, $B9, $B3, $FF, $13, $00, $00, $B3, $BA, $BA, $FE
Bank01_L8AC1:  .byte $80, $80, $FF

;Kraid statue.
Bank01_L8AC4:  .byte $1E, $00, $08, $FA, $FB, $FA, $FB, $FC, $00, $04, $C5, $C6, $C7, $D5, $D6, $D7
Bank01_L8AD4:  .byte $E5, $E6, $E7, $FF

;Ridley statue.
Bank01_L8AD8:  .byte $1E, $00, $08, $FA, $FB, $FA, $FB, $FE, $C8, $C9, $EB, $D8, $D9, $EA, $E8, $E9
Bank01_L8AE8:  .byte $FF

;Missile explode.
Bank01_L8AE9:  .byte $0A, $04, $08, $FD, $00, $57, $FD, $40, $57, $FF

;Missile explode.
Bank01_L8AF3:  .byte $0B, $04, $0C, $FD, $00, $57, $18, $FD, $40, $18, $57, $FD, $C0, $18, $18, $FF

;Missile explode.
Bank01_L8B03:  .byte $0C, $04, $10, $FD, $00, $57, $18, $FD, $40, $18, $57, $FD, $C0, $18, $18, $FF

;------------------------------------[ Samus enter door routines ]-----------------------------------

;This function is called once when Samus first enters a door.

.checkpc SamusEnterDoor
.advance SamusEnterDoor

Bank01_L8B13:  LDA DoorStatus          ;The code determines if Samus has entered a door if the-->
Bank01_L8B15:  BNE ++++                ;door status is 0, but door data information has been-->
Bank01_L8B17:  LDY SamusDoorData       ;written. If both conditions are met, Samus has just-->
Bank01_L8B19:  BEQ ++++                ;entered a door.
Bank01_L8B1B:  STA CrntMslePickups     ;
Bank01_L8B1D:  STA CrntEnrgyPickups    ;Reset current missile and energy power-up counters.
Bank01_L8B1F:  LDA RandomNumber1       ;
Bank01_L8B21:  AND #$0F                ;Randomly recalculate max missile pickups(16 max, 0 min).
Bank01_L8B23:  STA MaxMissilePickup    ;
Bank01_L8B25:  ASL                     ;
Bank01_L8B26:  ORA #$40                ;*2 for energy pickups and set bit 6(128 max, 64 min).
Bank01_L8B28:  STA MaxEnergyPickup     ;
Bank01_L8B2A:  LDA PPUCNT0ZP           ;
Bank01_L8B2C:  EOR #$01                ;
Bank01_L8B2E:  AND #$01                ;Erase name table door data for new room.
Bank01_L8B30:  TAY                     ;
Bank01_L8B31:  LSR                     ;
Bank01_L8B32:  STA $006C,Y             ;
Bank01_L8B35:  LDA ScrollDir           ;
Bank01_L8B37:  AND #$02                ;Is Samus scrolling horizontally?-->
Bank01_L8B39:  BNE +                   ;If so, branch.
Bank01_L8B3B:  LDX #$04                ;Samus currently scrolling vertically.
Bank01_L8B3D:  LDA ScrollY             ;Is room centered on screen?-->
Bank01_L8B3F:  BEQ +++++               ;If so, branch.
Bank01_L8B41:  LDA $FF                 ;
Bank01_L8B43:  EOR ObjectHi            ;Get inverse of Samus' current nametable.
Bank01_L8B46:  LSR                     ;
Bank01_L8B47:  BCC +++                 ;If Samus is on nametable 3, branch.
Bank01_L8B49:  BCS ++                  ;If Samus is on nametable 0, branch to decrement x.

Bank01_L8B4B:* LDX #$02                ;Samus is currently scrolling horizontally.
Bank01_L8B4D:  LDA ObjectX             ;Is Samus entering a left hand door?-->
Bank01_L8B50:  BPL ++                  ;If so, branch.
Bank01_L8B52:* DEX                     ;

Bank01_SetDoorEntryInfo:
Bank01_L8B53:* TXA                     ;X contains door scroll status and is transferred to A.
Bank01_L8B54:  STA DoorScrollStatus    ;Save door scroll status.
Bank01_L8B56:  JSR Bank01_SamusInDoor         ;($8B74)Indicate Samus just entered a door.
Bank01_L8B59:  LDA #$12                ;
Bank01_L8B5B:  STA DoorDelay           ;Set DoorDelay to 18 frames(going into door).
Bank01_L8B5D:  LDA SamusDoorData       ;
Bank01_L8B5F:  JSR Amul16              ;($C2C5)*16. Move scroll toggle data to upper 4 bits.
Bank01_L8B62:  ORA ObjAction           ;Keep Samus action so she will appear the same comming-->
Bank01_L8B65:  STA SamusDoorData       ;out of the door as she did going in.
Bank01_L8B67:  LDA #$05                ;
Bank01_L8B69:  STA ObjAction           ;Indicate Samus is in a door.
Bank01_L8B6C:* RTS                     ;

Bank01_L8B6D:* JSR Bank01_SetDoorEntryInfo    ;($8B53)Save Samus action and set door entry timer.
Bank01_L8B70:  JSR VertRoomCentered    ;($E21B)Room is centered. Toggle scroll.

Bank01_L8B73:  TXA                     ;X=#$01 or #$02(depending on which door Samus is in).

Bank01_SamusInDoor:
Bank01_L8B74:  ORA #$80                ;Set MSB of DoorStatus to indicate Samus has just-->
Bank01_L8B76:  STA DoorStatus          ;entered a door.
Bank01_L8B78:  RTS                     ;

;----------------------------------------------------------------------------------------------------

Bank01_L8B79:  LDX #$B0
Bank01_L8B7B:* JSR $8B87
Bank01_L8B7E:  LDA PageIndex
Bank01_L8B80:  SEC 
Bank01_L8B81:  SBC #$10
Bank01_L8B83:  TAX 
Bank01_L8B84:  BMI -
Bank01_L8B86:  RTS

Bank01_L8B87:  STX PageIndex
Bank01_L8B89:  LDA ObjAction,X
Bank01_L8B8C:  JSR ChooseRoutine       ;($C27C)

Bank01_L8B8F:  .word ExitSub
Bank01_L8B91:  .word $8B9D
Bank01_L8B93:  .word $8BD5
Bank01_L8B95:  .word $8C01
Bank01_L8B97:  .word $8C84
Bank01_L8B99:  .word $8CC6
Bank01_L8B9B:  .word $8CF0

Bank01_L8B9D:  INC $0300,X
Bank01_L8BA0:  LDA #$30
Bank01_L8BA2:  JSR SetProjectileAnim       ;($D2FA)
Bank01_L8BA5:  JSR $8CFB
Bank01_L8BA8:  LDY $0307,X
Bank01_L8BAB:  LDA $8BD1,Y
Bank01_L8BAE:  STA $030F,X
Bank01_L8BB1:  LDA $0307,X
Bank01_L8BB4:  CMP #$03
Bank01_L8BB6:  BNE $8BBA
Bank01_L8BB8:  LDA #$01
Bank01_L8BBA:  ORA #$A0
Bank01_L8BBC:  STA $6B
Bank01_L8BBE:  LDA #$00
Bank01_L8BC0:  STA $030A,X
Bank01_L8BC3:  TXA 
Bank01_L8BC4:  AND #$10
Bank01_L8BC6:  EOR #$10
Bank01_L8BC8:  ORA $6B
Bank01_L8BCA:  STA $6B
Bank01_L8BCC:  LDA #$06
Bank01_L8BCE:  JMP AnimDrawObject

Bank01_L8BD1:  .byte $05, $01, $0A, $01

Bank01_L8BD5:  LDA $030A,X
Bank01_L8BD8:  AND #$04
Bank01_L8BDA:  BEQ $8BB1
Bank01_L8BDC:  DEC $030F,X
Bank01_L8BDF:  BNE $8BB1
Bank01_L8BE1:  LDA #$03
Bank01_L8BE3:  CMP $0307,X
Bank01_L8BE6:  BNE $8BEE
Bank01_L8BE8:  LDY $010B
Bank01_L8BEB:  INY 
Bank01_L8BEC:  BNE $8BB1
Bank01_L8BEE:  STA $0300,X
Bank01_L8BF1:  LDA #$50
Bank01_L8BF3:  STA $030F,X
Bank01_L8BF6:  LDA #$2C
Bank01_L8BF8:  STA $0305,X
Bank01_L8BFB:  SEC 
Bank01_L8BFC:  SBC #$03
Bank01_L8BFE:  JMP $8C7E
Bank01_L8C01:  LDA DoorStatus
Bank01_L8C03:  BEQ $8C1D
Bank01_L8C05:  LDA $030C
Bank01_L8C08:  EOR $030C,X
Bank01_L8C0B:  LSR 
Bank01_L8C0C:  BCS $8C1D
Bank01_L8C0E:  LDA $030E
Bank01_L8C11:  EOR $030E,X
Bank01_L8C14:  BMI $8C1D
Bank01_L8C16:  LDA #$04
Bank01_L8C18:  STA $0300,X
Bank01_L8C1B:  BNE $8C73
Bank01_L8C1D:  LDA $0306,X
Bank01_L8C20:  CMP $0305,X
Bank01_L8C23:  BCC $8C73
Bank01_L8C25:  LDA $030F,X
Bank01_L8C28:  CMP #$50
Bank01_L8C2A:  BNE $8C57
Bank01_L8C2C:  JSR $8CF7
Bank01_L8C2F:  LDA $0307,X
Bank01_L8C32:  CMP #$01
Bank01_L8C34:  BEQ $8C57
Bank01_L8C36:  CMP #$03
Bank01_L8C38:  BEQ $8C57
Bank01_L8C3A:  LDA #$0A
Bank01_L8C3C:  STA $09
Bank01_L8C3E:  LDA $030C,X
Bank01_L8C41:  STA $08
Bank01_L8C43:  LDY $50
Bank01_L8C45:  TXA 
Bank01_L8C46:  JSR Amul16
Bank01_L8C49:  BCC $8C4C
Bank01_L8C4B:  DEY 
Bank01_L8C4C:  TYA 
Bank01_L8C4D:  JSR $DC1E
Bank01_L8C50:  LDA #$00
Bank01_L8C52:  STA $0300,X
Bank01_L8C55:  BEQ $8C73
Bank01_L8C57:  LDA $2D
Bank01_L8C59:  LSR 
Bank01_L8C5A:  BCS $8C73
Bank01_L8C5C:  DEC $030F,X
Bank01_L8C5F:  BNE $8C73
Bank01_L8C61:  LDA #$01
Bank01_L8C63:  STA $030F,X
Bank01_L8C66:  JSR $8CFB
Bank01_L8C69:  LDA #$02
Bank01_L8C6B:  STA $0300,X
Bank01_L8C6E:  JSR $8C76
Bank01_L8C71:  LDX PageIndex
Bank01_L8C73:  JMP $8BB1
Bank01_L8C76:  LDA #$30
Bank01_L8C78:  STA $0305,X
Bank01_L8C7B:  SEC 
Bank01_L8C7C:  SBC #$02
Bank01_L8C7E:  JSR SetProjectileAnimWithoutReset
Bank01_L8C81:  JMP SFXDoor
Bank01_L8C84:  LDA DoorStatus
Bank01_L8C86:  CMP #$05
Bank01_L8C88:  BCS $8CC3
Bank01_L8C8A:  JSR $8CFB
Bank01_L8C8D:  JSR $8C76
Bank01_L8C90:  LDX PageIndex
Bank01_L8C92:  LDA $91
Bank01_L8C94:  BEQ $8CA7
Bank01_L8C96:  TXA 
Bank01_L8C97:  JSR Adiv16
Bank01_L8C9A:  EOR $91
Bank01_L8C9C:  LSR 
Bank01_L8C9D:  BCC $8CA7
Bank01_L8C9F:  LDA $76
Bank01_L8CA1:  EOR #$07
Bank01_L8CA3:  STA $76
Bank01_L8CA5:  STA $1C
Bank01_L8CA7:  INC $0300,X
Bank01_L8CAA:  LDA #$00
Bank01_L8CAC:  STA $91
Bank01_L8CAE:  LDA $0307,X
Bank01_L8CB1:  CMP #$03
Bank01_L8CB3:  BNE $8CC3
Bank01_L8CB5:  TXA 
Bank01_L8CB6:  JSR Amul16
Bank01_L8CB9:  BCS $8CC0
Bank01_L8CBB:  JSR TourianMusic
Bank01_L8CBE:  BNE $8CC3
Bank01_L8CC0:  JSR MotherBrainMusic
Bank01_L8CC3:  JMP $8C71

Bank01_L8CC6:  LDA DoorStatus
Bank01_L8CC8:  CMP #$05
Bank01_L8CCA:  BNE $8CED
Bank01_L8CCC:  TXA 
Bank01_L8CCD:  EOR #$10
Bank01_L8CCF:  TAX 
Bank01_L8CD0:  LDA #$06
Bank01_L8CD2:  STA $0300,X
Bank01_L8CD5:  LDA #$2C
Bank01_L8CD7:  STA $0305,X
Bank01_L8CDA:  SEC 
Bank01_L8CDB:  SBC #$03
Bank01_L8CDD:  JSR SetProjectileAnimWithoutReset
Bank01_L8CE0:  JSR SFXDoor
Bank01_L8CE3:  JSR SelectSamusPal
Bank01_L8CE6:  LDX PageIndex
Bank01_L8CE8:  LDA #$02
Bank01_L8CEA:  STA $0300,X
Bank01_L8CED:  JMP $8BB1

Bank01_L8CF0:  LDA DoorStatus
Bank01_L8CF2:  BNE $8CED
Bank01_L8CF4:  JMP $8C61
Bank01_L8CF7:  LDA #$FF
Bank01_L8CF9:  BNE $8CFD
Bank01_L8CFB:  LDA #$4E
Bank01_L8CFD:  PHA 
Bank01_L8CFE:  LDA #$50
Bank01_L8D00:  STA $02
Bank01_L8D02:  TXA 
Bank01_L8D03:  JSR Adiv16
Bank01_L8D06:  AND #$01
Bank01_L8D08:  TAY 
Bank01_L8D09:  LDA $8D3A,Y
Bank01_L8D0C:  STA $03
Bank01_L8D0E:  LDA $030C,X
Bank01_L8D11:  STA $0B
Bank01_L8D13:  JSR MakeCartRAMPtr
Bank01_L8D16:  LDY #$00
Bank01_L8D18:  PLA 
Bank01_L8D19:  STA ($04),Y
Bank01_L8D1B:  TAX 
Bank01_L8D1C:  TYA 
Bank01_L8D1D:  CLC 
Bank01_L8D1E:  ADC #$20
Bank01_L8D20:  TAY 
Bank01_L8D21:  TXA 
Bank01_L8D22:  CPY #$C0
Bank01_L8D24:  BNE $8D19
Bank01_L8D26:  LDX PageIndex
Bank01_L8D28:  TXA 
Bank01_L8D29:  JSR Adiv8
Bank01_L8D2C:  AND #$06
Bank01_L8D2E:  TAY 
Bank01_L8D2F:  LDA $04
Bank01_L8D31:  STA $005C,Y
Bank01_L8D34:  LDA $05
Bank01_L8D36:  STA $005D,Y
Bank01_L8D39:  RTS

Bank01_L8D3A:  .byte $E8, $10, $60, $AD, $91, $69, $8D, $78, $68, $AD, $92, $69, $8D, $79, $68, $A9 
Bank01_L8D4A:  .byte $00, $85, $00, $85, $02, $AD, $97, $69, $29, $80, $F0, $06, $A5, $00, $09, $80
Bank01_L8D5A:  .byte $85, $00, $AD, $97, $69, $29

;------------------------------------------[ Graphics data ]-----------------------------------------

;Partial font, "THE END".
Bank01_L8D60:  .byte $00, $00, $00, $00, $00, $18, $18, $08, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8D70:  .byte $18, $38, $18, $18, $18, $18, $7E, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8D80:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $78, $70, $F0, $F0, $78, $79, $1F, $00
Bank01_L8D90:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $03, $87, $46, $4E, $4C, $8C, $08, $00
Bank01_L8DA0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $39, $99, $3B, $33, $73, $79, $30, $00
Bank01_L8DB0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $FC, $DC, $98, $B8, $B8, $FD, $66, $00
Bank01_L8DC0:  .byte $3C, $60, $C0, $FC, $C6, $C6, $7C, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8DD0:  .byte $00, $00, $00, $00, $00, $18, $18, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8DE0:  .byte $7C, $C6, $C6, $7C, $C6, $C6, $7C, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8DF0:  .byte $7C, $C6, $C6, $7E, $06, $0C, $78, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8E00:  .byte $38, $6C, $C6, $C6, $FE, $C6, $C6, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8E10:  .byte $FC, $C6, $C6, $FC, $C6, $C6, $FC, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8E20:  .byte $3C, $66, $C0, $C0, $C0, $66, $3C, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8E30:  .byte $F8, $CC, $C6, $C6, $C6, $CC, $F8, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8E40:  .byte $FE, $C0, $C0, $FC, $C0, $C0, $FE, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8E50:  .byte $FE, $C0, $C0, $FC, $C0, $C0, $C0, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8E60:  .byte $3E, $60, $C0, $CE, $C6, $66, $3E, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8E70:  .byte $C6, $C6, $C6, $FE, $C6, $C6, $C6, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8E80:  .byte $7E, $18, $18, $18, $18, $18, $7E, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8E90:  .byte $1E, $06, $06, $06, $C6, $C6, $7C, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8EA0:  .byte $C6, $CC, $D8, $F0, $F8, $DC, $CE, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8EB0:  .byte $60, $60, $60, $60, $60, $60, $7E, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8EC0:  .byte $C6, $EE, $FE, $FE, $D6, $C6, $C6, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8ED0:  .byte $C6, $E6, $F6, $FE, $DE, $CE, $C6, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8EE0:  .byte $7C, $C6, $C6, $C6, $C6, $C6, $7C, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8EF0:  .byte $FC, $C6, $C6, $C6, $FC, $C0, $C0, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8F00:  .byte $7C, $C6, $C6, $C6, $DE, $CC, $7A, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8F10:  .byte $FC, $C6, $C6, $CE, $F8, $DC, $CE, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8F20:  .byte $78, $CC, $C0, $7C, $06, $C6, $7C, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8F30:  .byte $7E, $18, $18, $18, $18, $18, $18, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8F40:  .byte $C6, $C6, $C6, $C6, $C6, $C6, $7C, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8F50:  .byte $C6, $C6, $C6, $EE, $7C, $38, $10, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8F60:  .byte $C6, $C6, $D6, $FE, $FE, $EE, $C6, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8F70:  .byte $C6, $EE, $7C, $38, $7C, $EE, $C6, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8F80:  .byte $66, $66, $66, $3C, $18, $18, $18, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8F90:  .byte $FE, $0E, $1C, $38, $70, $E0, $FE, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L8FA0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $01, $07, $0F, $0C, $08, $08, $04, $03
Bank01_L8FB0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $C1, $FF, $FF, $3E, $00, $08, $88, $19
Bank01_L8FC0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $60, $60, $E0, $C0, $C8
Bank01_L8FD0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $38
Bank01_L8FE0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $30, $48, $40, $61, $3F, $3F, $1F, $00
Bank01_L8FF0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $11, $33, $73, $E7, $E6, $C6, $04, $00
Bank01_L9000:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $9C, $CC, $1C, $19, $3A, $3C, $18, $00
Bank01_L9010:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $7C, $74, $E4, $F8, $E0, $72, $3C, $00
Bank01_L9020:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $03, $06, $0C, $0C, $06, $02, $1E, $3C
Bank01_L9030:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $80, $40, $20, $20, $40, $03, $01, $03
Bank01_L9040:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $90
Bank01_L9050:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $03, $03, $07, $06, $EE
Bank01_L9060:  .byte $32, $FF, $F7, $FF, $7F, $FF, $DB, $FF, $73, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank01_L9070:  .byte $B4, $FF, $FF, $FF, $FE, $7B, $FF, $FD, $B6, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank01_L9080:  .byte $B5, $FF, $7F, $9D, $F6, $7F, $DD, $77, $FF, $FF, $FF, $FF, $EF, $FF, $BB, $FE
Bank01_L9090:  .byte $D7, $FF, $79, $DE, $F5, $3F, $ED, $BF, $FF, $FF, $FF, $FF, $BF, $FF, $FB, $FF
Bank01_L90A0:  .byte $89, $F7, $5F, $F3, $E7, $FD, $70, $CF, $FF, $BF, $EC, $FF, $9F, $FE, $AF, $F9
Bank01_L90B0:  .byte $9F, $F9, $3D, $F7, $3F, $99, $FD, $CF, $F6, $7F, $FF, $FD, $CF, $FF, $FF, $FB
Bank01_L90C0:  .byte $B9, $59, $CC, $7F, $DF, $9F, $BF, $1E, $7F, $FF, $B7, $F3, $FD, $6F, $FF, $E7
Bank01_L90D0:  .byte $7F, $F9, $F3, $FF, $FF, $FF, $FF, $BB, $9F, $FF, $CF, $9F, $FD, $FF, $27, $DF
Bank01_L90E0:  .byte $63, $EF, $EE, $1F, $B9, $1C, $F7, $FF, $9D, $38, $FF, $FF, $C7, $E3, $FF, $BF
Bank01_L90F0:  .byte $FF, $9D, $7E, $FF, $B3, $C7, $FF, $A1, $3C, $7E, $FF, $E7, $CF, $FF, $FB, $7F
Bank01_L9100:  .byte $C8, $ED, $BE, $DC, $9E, $F8, $36, $CC, $3F, $1E, $7F, $FF, $EF, $07, $CF, $FF
Bank01_L9110:  .byte $C7, $BF, $3A, $7F, $BD, $A3, $7F, $FC, $3C, $7C, $FD, $E7, $CF, $FE, $8C, $0F
Bank01_L9120:  .byte $00, $00, $18, $18, $3C, $7E, $5E, $FF, $10, $10, $18, $38, $7C, $7E, $FE, $FF
Bank01_L9130:  .byte $00, $10, $10, $10, $10, $30, $30, $10, $10, $10, $10, $10, $30, $30, $30, $30
Bank01_L9140:  .byte $20, $30, $30, $20, $60, $30, $70, $F8, $20, $30, $30, $60, $60, $70, $F0, $F8
Bank01_L9150:  .byte $10, $10, $10, $10, $10, $10, $00, $10, $00, $00, $00, $00, $00, $00, $00, $00

;Brinstar enemy tile patterns.
Bank01_L9160:  .byte $03, $0F, $05, $32, $D1, $48, $12, $24, $01, $02, $02, $11, $48, $20, $00, $00
Bank01_L9170:  .byte $E0, $F0, $EC, $DE, $92, $8D, $A0, $3C, $C0, $00, $0C, $02, $01, $0C, $02, $00
Bank01_L9180:  .byte $00, $00, $F8, $3E, $1F, $0F, $0F, $0E, $00, $00, $00, $08, $04, $00, $00, $00
Bank01_L9190:  .byte $18, $30, $6C, $7C, $5C, $78, $70, $21, $00, $00, $0C, $1C, $1C, $38, $30, $3C
Bank01_L91A0:  .byte $18, $30, $60, $60, $40, $40, $40, $01, $00, $00, $00, $00, $00, $00, $00, $3C
Bank01_L91B0:  .byte $00, $01, $00, $00, $03, $04, $48, $3C, $00, $01, $00, $03, $0C, $08, $10, $03
Bank01_L91C0:  .byte $48, $2F, $B3, $4D, $32, $CC, $84, $6F, $48, $28, $AF, $3D, $78, $CD, $B6, $6F
Bank01_L91D0:  .byte $00, $50, $00, $C8, $74, $34, $90, $38, $00, $00, $B0, $E8, $74, $BC, $18, $18
Bank01_L91E0:  .byte $3C, $7F, $FF, $FF, $FF, $7E, $7B, $3D, $3C, $7F, $FF, $FC, $D1, $50, $69, $0E
Bank01_L91F0:  .byte $00, $00, $C0, $E0, $B0, $08, $07, $87, $00, $00, $C0, $60, $B0, $68, $73, $B2
Bank01_L9200:  .byte $01, $00, $1C, $0F, $07, $03, $0F, $3F, $01, $00, $10, $08, $04, $00, $08, $20
Bank01_L9210:  .byte $80, $C0, $F8, $C8, $88, $32, $51, $68, $0C, $10, $A0, $06, $01, $32, $11, $00
Bank01_L9220:  .byte $00, $01, $21, $33, $3B, $1F, $9F, $FF, $00, $01, $20, $12, $08, $00, $80, $20
Bank01_L9230:  .byte $00, $00, $08, $98, $B8, $F0, $F2, $FE, $00, $00, $08, $90, $20, $00, $02, $04
Bank01_L9240:  .byte $81, $A5, $E7, $00, $00, $24, $18, $24, $81, $A5, $E7, $42, $66, $C3, $66, $18
Bank01_L9250:  .byte $00, $24, $1B, $1F, $3B, $44, $5B, $3F, $BD, $9B, $E4, $C0, $C4, $98, $83, $C7
Bank01_L9260:  .byte $00, $20, $60, $C3, $CC, $60, $20, $00, $0A, $0F, $0F, $1C, $13, $0F, $0F, $0A
Bank01_L9270:  .byte $00, $00, $00, $00, $E0, $00, $00, $00, $40, $E8, $FA, $FF, $1F, $FA, $E8, $40
Bank01_L9280:  .byte $1E, $1C, $18, $3A, $36, $60, $00, $00, $00, $00, $00, $02, $06, $00, $03, $00
Bank01_L9290:  .byte $43, $C6, $FE, $F8, $F6, $A9, $21, $20, $38, $00, $00, $00, $66, $AD, $F9, $20
Bank01_L92A0:  .byte $73, $DE, $EF, $F8, $F6, $A9, $21, $20, $38, $1E, $0F, $00, $66, $AD, $F9, $20
Bank01_L92B0:  .byte $03, $02, $30, $7E, $70, $D0, $6C, $1D, $04, $30, $48, $00, $80, $11, $30, $21
Bank01_L92C0:  .byte $61, $30, $1E, $81, $28, $FF, $FF, $F1, $61, $32, $1E, $81, $F8, $FF, $FF, $F9
Bank01_L92D0:  .byte $B8, $D0, $6C, $36, $9E, $0C, $C0, $E8, $FC, $FC, $7E, $36, $BE, $0C, $E0, $F8
Bank01_L92E0:  .byte $1F, $0F, $07, $03, $01, $0E, $1F, $3F, $07, $03, $03, $01, $00, $06, $17, $13
Bank01_L92F0:  .byte $C3, $66, $9E, $DE, $EF, $F7, $73, $B9, $DA, $66, $DE, $C6, $E3, $61, $25, $B9
Bank01_L9300:  .byte $0F, $03, $07, $0F, $1D, $00, $01, $03, $08, $00, $04, $08, $10, $00, $01, $02
Bank01_L9310:  .byte $60, $51, $32, $88, $C8, $F8, $C0, $00, $0C, $11, $32, $00, $04, $02, $12, $20
Bank01_L9320:  .byte $78, $33, $65, $26, $19, $00, $04, $02, $00, $00, $04, $46, $80, $90, $14, $0A
Bank01_L9330:  .byte $1C, $C8, $A4, $64, $18, $00, $20, $40, $00, $00, $25, $62, $80, $88, $26, $40
Bank01_L9340:  .byte $00, $02, $0D, $17, $2D, $62, $6D, $2E, $83, $C5, $F2, $E0, $C2, $81, $8C, $CE
Bank01_L9350:  .byte $00, $40, $B0, $E8, $B4, $46, $B6, $74, $C1, $A3, $4F, $07, $43, $81, $31, $73
Bank01_L9360:  .byte $00, $00, $00, $00, $00, $20, $73, $DF, $00, $00, $0A, $0F, $1F, $14, $11, $18
Bank01_L9370:  .byte $00, $00, $00, $00, $00, $00, $12, $C0, $00, $00, $40, $E8, $FA, $FF, $70, $00
Bank01_L9380:  .byte $24, $3C, $5A, $DB, $66, $99, $5A, $24, $00, $00, $42, $C3, $66, $00, $00, $42
Bank01_L9390:  .byte $00, $00, $44, $EE, $B2, $82, $84, $40, $04, $38, $54, $EE, $B2, $80, $00, $00
Bank01_L93A0:  .byte $00, $00, $0C, $04, $62, $12, $1F, $01, $00, $B0, $50, $78, $9C, $6C, $20, $00
Bank01_L93B0:  .byte $38, $72, $C5, $73, $72, $6F, $22, $00, $40, $82, $05, $23, $42, $07, $1E, $00
Bank01_L93C0:  .byte $C3, $E0, $7C, $8F, $C7, $F3, $72, $00, $E3, $F0, $7E, $8F, $C7, $F2, $71, $01
Bank01_L93D0:  .byte $F0, $E8, $3C, $9C, $80, $18, $1C, $00, $F0, $E8, $3C, $9E, $42, $5A, $5C, $00
Bank01_L93E0:  .byte $3B, $7D, $7B, $7D, $7E, $FF, $FF, $00, $31, $3D, $3B, $1C, $6E, $37, $79, $00
Bank01_L93F0:  .byte $F9, $B9, $50, $E0, $7C, $8C, $E0, $00, $F9, $B1, $40, $60, $3C, $8E, $C2, $02
Bank01_L9400:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L9410:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L9420:  .byte $60, $71, $30, $18, $0C, $00, $00, $00, $62, $72, $37, $93, $81, $7E, $34, $06
Bank01_L9430:  .byte $00, $01, $00, $08, $1C, $30, $70, $60, $02, $02, $07, $83, $91, $7E, $74, $66
Bank01_L9440:  .byte $26, $31, $10, $1C, $18, $0C, $00, $00, $C6, $C0, $60, $60, $20, $30, $18, $08
Bank01_L9450:  .byte $5E, $2C, $20, $3C, $24, $18, $00, $00, $87, $C3, $42, $42, $42, $66, $24, $24
Bank01_L9460:  .byte $00, $00, $00, $00, $0B, $27, $73, $DF, $0A, $0F, $1F, $34, $0B, $07, $11, $18
Bank01_L9470:  .byte $00, $00, $00, $00, $00, $8C, $F2, $E0, $40, $E8, $FA, $FF, $60, $80, $30, $00
Bank01_L9480:  .byte $00, $00, $1C, $3E, $3E, $3E, $1C, $00, $00, $1C, $26, $69, $55, $53, $32, $1C
Bank01_L9490:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L94A0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L94B0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L94C0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L94D0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L94E0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L94F0:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L9500:  .byte $1D, $1D, $1D, $1D, $1D, $1D, $1D, $1D, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
Bank01_L9510:  .byte $F8, $F8, $F8, $F8, $F8, $F8, $F8, $F8, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0
Bank01_L9520:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank01_L9530:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Bank01_L9540:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L9550:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

;----------------------------------------------------------------------------------------------------

;The following table points to the palette data used in this bank.

.checkpc PalPntrTbl
.advance PalPntrTbl

.scope
    .word _Palette00, _Palette01, _Palette02, _Palette03
    .word _Palette04, _Palette05, _Palette06, _Palette06
    .word _Palette06, _Palette06, _Palette06, _Palette06
    .word _Palette06, _Palette06, _Palette06, _Palette06
    .word _Palette06, _Palette06, _Palette06, _Palette06
    .word _Palette07, _Palette08, _Palette09, _Palette0A
    .word _Palette0B, _Palette0C, _Palette0D, _Palette0E
;----------------------------------------------------------------------------------------------------

.checkpc SpecItmsTblPtr
.advance SpecItmsTblPtr

Bank01_L9598:  .word _SpecItmsTbl       ;($A3D6)Beginning of special items table.
Bank01_L959A:  .word _RmPtrTbl          ;($A314)Beginning of room pointer table.    
Bank01_L959C:  .word _StrctPtrTbl       ;($A372)Beginning of structure pointer table.
Bank01_L959E:  .word _MacroDefs         ;($AEF0)Beginning of macro definitions.
Bank01_L95A0:  .word _EnemyFramePtrTbl1     ;($9DE0)Pointer table into enemy animation data. Two-->
Bank01_L95A2:  .word _EnemyFramePtrTbl2     ;($9EE0)tables needed to accommodate all entries.
Bank01_L95A4:  .word _EnemyPlacePtrTbl      ;($9F0E)Pointers to enemy frame placement data.
Bank01_L95A6:  .word _EnemyAnimIndexTbl     ;($9D6A)index to values in addr tables for enemy animations.

Bank01_L95A8:  .byte $60, $EA, $EA, $60, $EA, $EA, $60, $EA, $EA, $60, $EA, $EA, $60, $EA, $EA, $60 
Bank01_L95B8:  .byte $EA, $EA, $60, $EA, $EA, $60, $EA, $EA, $60, $EA, $EA

.checkpc AreaRoutine
.advance AreaRoutine

Bank01_L95C3:  JMP $9D35           ;Area specific routine.

TwosCompliment_:
Bank01_L95C6:  EOR #$FF            ;
Bank01_L95C8:  CLC             ;The following routine returns the twos-->
Bank01_L95C9:  ADC #$01            ;compliment of the value stored in A.
Bank01_L95CB:  RTS             ;

Bank01_L95CC:  .byte $FF           ;Not used.
                
Bank01_L95CD:  .byte $01           ;Brinstar music init flag.

Bank01_L95CE:  .byte $80           ;Base damage caused by area enemies to lower health byte.
Bank01_L95CF:  .byte $00           ;Base damage caused by area enemies to upper health byte.

;Special room numbers(used to start item room music).
Bank01_L95D0:  .byte $2B, $2C, $28, $0B, $1C, $0A, $1A

Bank01_L95D7:  .byte $03           ;Samus start x coord on world map.
Bank01_L95D8:  .byte $0E           ;Samus start y coord on world map.
Bank01_L95D9:  .byte $B0           ;Samus start verticle screen position.

Bank01_L95DA:  .byte $01, $00, $03, $43, $00, $00, $00, $00, $00, $00 

.checkpc MemuByte
.advance MemuByte
    .byte $69

Bank01_L95E5:  LDA EnDataIndex, X
Bank01_L95E8:  JSR $8024

Bank01_L95EB:  .word $99B8
Bank01_L95ED:  .word $99D3
Bank01_L95EF:  .word $99E5
Bank01_L95F1:  .word $99D8
Bank01_L95F3:  .word $99FA
Bank01_L95F5:  .word $9A4C
Bank01_L95F7:  .word $9AF5
Bank01_L95F9:  .word $9B32
Bank01_L95FB:  .word $9BA2
Bank01_L95FD:  .word $9BD2
Bank01_L95FF:  .word $9C1A
Bank01_L9601:  .word $0000
Bank01_L9603:  .word $0000
Bank01_L9605:  .word $0000
Bank01_L9607:  .word $0000
Bank01_L9609:  .word $0000

Bank01_L960B:  .byte $27, $27, $29, $29, $2D, $2B, $31, $2F, $33, $33, $41, $41, $4B, $4B, $55, $53

Bank01_L961B:  .byte $72, $74, $00, $00, $00, $00, $69, $69, $69, $69, $00, $00, $00, $00, $00, $00

Bank01_L962B:  .byte $08, $08, $04, $FF, $02, $02, $04, $01, $20, $FF, $FF, $04, $01, $00, $00, $00

Bank01_L963B:  .byte $05, $05, $0B, $0B, $17, $13, $1B, $19, $23, $23, $35, $35, $48, $48, $59, $57 

Bank01_L964B:  .byte $6C, $6F, $5B, $5D, $62, $67, $69, $69, $69, $69, $00, $00, $00, $00, $00, $00

Bank01_L965B:  .byte $05, $05, $0B, $0B, $17, $13, $1B, $19, $23, $23, $35, $35, $48, $48, $50, $4D

Bank01_L966B:  .byte $6C, $6F, $5B, $5D, $5F, $64, $69, $69, $69, $69, $00, $00, $00, $00, $00, $00

Bank01_L967B:  .byte $00, $00, $00, $80, $00, $00, $00, $00, $00, $00, $00, $00, $80, $00, $00, $00 

Bank01_L968B:  .byte $01, $01, $01, $00, $86, $04, $89, $80, $81, $00, $00, $00, $82, $00, $00, $00 

Bank01_L969B:  .byte $01, $01, $01, $01, $01, $01, $01, $01, $20, $01, $01, $01, $40, $00, $00, $00 

Bank01_L96AB:  .byte $00, $00, $06, $00, $83, $00, $88, $00, $00, $00, $00, $00, $00, $00, $00, $00 

Bank01_L96BB:  .byte $08, $08, $01, $01, $01, $01, $10, $08, $10, $00, $00, $01, $01, $00, $00, $00

Bank01_L96CB:  .byte $00, $03, $06, $08, $0A, $10, $0C, $0E, $14, $17, $19, $10, $12, $00, $00, $00

Bank01_L96DB:  .word $97EF, $97F2, $97F5, $97F5, $97F5, $97F5, $97F5, $97F5
Bank01_L96EB:  .word $97F5, $97F5, $97F5, $9840, $988B, $988E, $9891, $98A5
Bank01_L96FB:  .word $98B9, $98B9, $98B9, $98B9, $98B9, $98B9, $98B9, $98B9
Bank01_L970B:  .word $98B9, $98C0, $98C7, $98CE, $98D5, $98D8, $98DB, $98F2
Bank01_L971B:  .word $9909, $9920, $9937, $994E

Bank01_L9723:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $7F, $40, $30, $C0, $D0, $00, $00, $7F
Bank01_L9733:  .byte $80, $00, $54, $70, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L9743:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L9753:  .byte $F6, $FC, $FE, $04, $02, $00, $00, $00, $0C, $FC, $FC, $00, $00, $00, $00, $00
Bank01_L9763:  .byte $00, $00, $00, $00, $00, $02, $02, $02, $02, $00, $00, $00, $02, $00, $02, $02
Bank01_L9773:  .byte $00, $00, $00, $00, $00, $00, $00, $00

Bank01_L977B:  .byte $64, $6C, $21, $01, $04, $00, $4C, $40, $04, $00, $00, $40, $40, $00, $00, $00 

Bank01_L978B:  .byte $00, $00, $64, $67, $69, $69, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_L979B:  .byte $0C, $F4, $00, $00, $00, $00, $00, $00, $F4, $00, $00, $00

Bank01_L97A7:  .word $9965, $9974, $9983, $9992, $9D36, $9D3B, $9D40, $9D45
Bank01_L97B7:  .word $9D4A, $9D4F, $9D54, $9D59, $9D5E, $9D63, $9D6A, $9D6A
Bank01_L97C7:  .word $9D6A, $9D6A, $9D6A, $9D6A, $9D6A

Bank01_L97D1:  .byte $01, $01, $02, $01, $03, $04, $00, $05, $00, $06, $00, $07, $00, $08, $00, $09
Bank01_L97E1:  .byte $00, $00, $00, $0B, $01, $0C, $0D, $00, $0E, $03, $0F, $10, $11, $0F

Bank01_L97EF:  .byte $20, $22, $FE

Bank01_L97F2:  .byte $20, $2A, $FE

Bank01_L97F5:  .byte $02, $F2, $04, $E2, $04, $D2, $05, $B2, $03, $92, $04, $02, $05, $12, $03, $32
Bank01_L9805:  .byte $05, $52, $04, $62, $02, $72, $02, $72, $04, $62, $04, $52, $05, $32, $03, $12
Bank01_L9815:  .byte $04, $02, $05, $92, $03, $B2, $05, $D2, $04, $E2, $02, $F2, $FD, $03, $D2, $06
Bank01_L9825:  .byte $B2, $08, $92, $05, $02, $07, $12, $05, $32, $04, $52, $03, $52, $06, $32, $08
Bank01_L9835:  .byte $12, $05, $02, $07, $92, $05, $B2, $04, $D2, $FD, $FF

Bank01_L9840:  .byte $02, $FA, $04, $EA, $04, $DA, $05, $BA, $03, $9A, $04, $0A, $05, $1A, $03, $3A
Bank01_L9850:  .byte $05, $5A, $04, $6A, $02, $7A, $02, $7A, $04, $6A, $04, $5A, $05, $3A, $03, $1A
Bank01_L9860:  .byte $04, $0A, $05, $9A, $03, $BA, $05, $DA, $04, $EA, $02, $FA, $FD, $03, $DA, $06
Bank01_L9870:  .byte $BA, $08, $9A, $05, $0A, $07, $1A, $05, $3A, $04, $5A, $03, $5A, $06, $3A, $08
Bank01_L9880:  .byte $1A, $05, $0A, $07, $9A, $05, $BA, $04, $DA, $FD, $FF

Bank01_L988B:  .byte $01, $01, $FF

Bank01_L988E:  .byte $01, $09, $FF

Bank01_L9891:  .byte $04, $22, $01, $42, $01, $22, $01, $42, $01, $62, $01, $42, $04, $62, $FC, $01
Bank01_L98A1:  .byte $00, $64, $00, $FB

Bank01_L98A5:  .byte $04, $2A, $01, $4A, $01, $2A, $01, $4A, $01, $6A, $01, $4A, $04, $6A, $FC, $01
Bank01_L98B5:  .byte $00, $64, $00, $FB

Bank01_L98B9:  .byte $14, $11, $0A, $00, $14, $19, $FE

Bank01_L98C0:  .byte $14, $19, $0A, $00, $14, $11, $FE

Bank01_L98C7:  .byte $1E, $11, $0A, $00, $1E, $19, $FE 

Bank01_L98CE:  .byte $1E, $19, $0A, $00, $1E, $11, $FE

Bank01_L98D5:  .byte $50, $04, $FF

Bank01_L98D8:  .byte $50, $0C, $FF

Bank01_L98DB:  .byte $02, $F3, $04, $E3, $04, $D3, $05, $B3, $03, $93, $04, $03, $05, $13, $03, $33
Bank01_L98EB:  .byte $05, $53, $04, $63, $50, $73, $FF

Bank01_L98F2:  .byte $02, $FB, $04, $EB, $04, $DB, $05, $BB, $03, $9B, $04, $0B, $05, $1B, $03, $3B
Bank01_L9902:  .byte $05, $5B, $04, $6B, $50, $7B, $FF

Bank01_L9909:  .byte $02, $F4, $04, $E4, $04, $D4, $05, $B4, $03, $94, $04, $04, $05, $14, $03, $34
Bank01_L9919:  .byte $05, $54, $04, $64, $50, $74, $FF

Bank01_L9920:  .byte $02, $FC, $04, $EC, $04, $DC, $05, $BC, $03, $9C, $04, $0C, $05, $1C, $03, $3C
Bank01_L9930:  .byte $05, $5C, $04, $6C, $50, $7C, $FF

Bank01_L9937:  .byte $02, $F2, $04, $E2, $04, $D2, $05, $B2, $03, $92, $04, $02, $05, $12, $03, $32
Bank01_L9947:  .byte $05, $52, $04, $62, $50, $72, $FF

Bank01_L994E:  .byte $02, $FA, $04, $EA, $04, $DA, $05, $BA, $03, $9A, $04, $0A, $05, $1A, $03, $3A
Bank01_L995E:  .byte $05, $5A, $04, $6A, $50, $7A, $FF

Bank01_L9965:  .byte $04, $B3, $05, $A3, $06, $93, $07, $03, $06, $13, $05, $23, $50, $33, $FF

Bank01_L9974:  .byte $09, $C2, $08, $A2, $07, $92, $07, $12, $08, $22, $09, $42, $50, $72, $FF

Bank01_L9983:  .byte $07, $C2, $06, $A2, $05, $92, $05, $12, $06, $22, $07, $42, $50, $72, $FF

Bank01_L9992:  .byte $05, $C2, $04, $A2, $03, $92, $03, $12, $04, $22, $05, $42, $50, $72, $FF

Bank01_L99A1:  LDA $81
Bank01_L99A3:  CMP #$01
Bank01_L99A5:  BEQ $99B0
Bank01_L99A7:  CMP #$03
Bank01_L99A9:  BEQ $99B5
Bank01_L99AB:  LDA $00
Bank01_L99AD:  JMP $8000
Bank01_L99B0:  LDA $01
Bank01_L99B2:  JMP $8003
Bank01_L99B5:  JMP $8006

Bank01_L99B8:  LDA #$09
Bank01_L99BA:  STA $85
Bank01_L99BC:  STA $86
Bank01_L99BE:  LDA EnStatus,X
Bank01_L99C1:  CMP #$03
Bank01_L99C3:  BEQ $99C8
Bank01_L99C5:  JSR $801B
Bank01_L99C8:  LDA #$06
Bank01_L99CA:  STA $00
Bank01_L99CC:  LDA #$08
Bank01_L99CE:  STA $01
Bank01_L99D0:  JMP $99A1

Bank01_L99D3:  LDA #$0F
Bank01_L99D5:  JMP $99BA
Bank01_L99D8:  LDA EnStatus,X
Bank01_L99DB:  CMP #$03
Bank01_L99DD:  BEQ $99E2
Bank01_L99DF:  JSR $801E
Bank01_L99E2:  JMP $99C8
Bank01_L99E5:  LDA #$21
Bank01_L99E7:  STA $85
Bank01_L99E9:  LDA #$1E
Bank01_L99EB:  STA $86
Bank01_L99ED:  LDA EnStatus,X
Bank01_L99F0:  CMP #$03
Bank01_L99F2:  BEQ $99F7
Bank01_L99F4:  JSR $801B
Bank01_L99F7:  JMP $99C8
Bank01_L99FA:  LDA $81
Bank01_L99FC:  CMP #$01
Bank01_L99FE:  BEQ $9A44
Bank01_L9A00:  CMP #$03
Bank01_L9A02:  BEQ $9A49
Bank01_L9A04:  LDA EnCounter,X
Bank01_L9A07:  CMP #$0F
Bank01_L9A09:  BCC $9A3F
Bank01_L9A0B:  CMP #$11
Bank01_L9A0D:  BCS $9A16
Bank01_L9A0F:  LDA #$3A
Bank01_L9A11:  STA $6B01,X
Bank01_L9A14:  BNE $9A3F
Bank01_L9A16:  DEC $6B01,X
Bank01_L9A19:  BNE $9A3F
Bank01_L9A1B:  LDA #$00
Bank01_L9A1D:  STA EnStatus,X
Bank01_L9A20:  LDY #$0C
Bank01_L9A22:  LDA #$0A
Bank01_L9A24:  STA $00A0,Y
Bank01_L9A27:  LDA EnYRoomPos,X
Bank01_L9A2A:  STA $00A1,Y
Bank01_L9A2D:  LDA EnXRoomPos,X
Bank01_L9A30:  STA $00A2,Y
Bank01_L9A33:  LDA EnNameTable,X
Bank01_L9A36:  STA $00A3,Y
Bank01_L9A39:  DEY 
Bank01_L9A3A:  DEY 
Bank01_L9A3B:  DEY 
Bank01_L9A3C:  DEY 
Bank01_L9A3D:  BPL $9A22
Bank01_L9A3F:  LDA #$02
Bank01_L9A41:  JMP $8000
Bank01_L9A44:  LDA #$08
Bank01_L9A46:  JMP $8003
Bank01_L9A49:  JMP $8006

Bank01_L9A4C:  JSR $8009
Bank01_L9A4F:  AND #$03
Bank01_L9A51:  BEQ $9A87
Bank01_L9A53:  LDA $81
Bank01_L9A55:  CMP #$01
Bank01_L9A57:  BEQ $9A44
Bank01_L9A59:  CMP #$03
Bank01_L9A5B:  BEQ $9A49
Bank01_L9A5D:  LDA EnStatus,X
Bank01_L9A60:  CMP #$03
Bank01_L9A62:  BEQ $9A87
Bank01_L9A64:  LDA $040A,X
Bank01_L9A67:  AND #$03
Bank01_L9A69:  CMP #$01
Bank01_L9A6B:  BNE $9A7E
Bank01_L9A6D:  LDY EnYRoomPos,X
Bank01_L9A70:  CPY #$E4
Bank01_L9A72:  BNE $9A7E
Bank01_L9A74:  JSR $9ABD
Bank01_L9A77:  LDA #$03
Bank01_L9A79:  STA $040A,X
Bank01_L9A7C:  BNE $9A84
Bank01_L9A7E:  JSR $9AE2
Bank01_L9A81:  JSR $9AA8
Bank01_L9A84:  JSR $9AC6
Bank01_L9A87:  LDA #$03
Bank01_L9A89:  JSR $800C
Bank01_L9A8C:  JMP $8006
Bank01_L9A8F:  LDA $0405,X
Bank01_L9A92:  LSR 
Bank01_L9A93:  LDA $040A,X
Bank01_L9A96:  AND #$03
Bank01_L9A98:  ROL 
Bank01_L9A99:  TAY 
Bank01_L9A9A:  LDA $9AA0,Y
Bank01_L9A9D:  JMP $800F

Bank01_L9AA0:  .byte $35, $35, $3E, $38, $3B, $3B, $38, $3E 

Bank01_L9AA8:  LDX PageIndex
Bank01_L9AAA:  BCS $9AC5
Bank01_L9AAC:  LDA $00
Bank01_L9AAE:  BNE $9ABD
Bank01_L9AB0:  LDY $040A,X
Bank01_L9AB3:  DEY 
Bank01_L9AB4:  TYA 
Bank01_L9AB5:  AND #$03
Bank01_L9AB7:  STA $040A,X
Bank01_L9ABA:  JMP $9A8F
Bank01_L9ABD:  LDA $0405,X
Bank01_L9AC0:  EOR #$01
Bank01_L9AC2:  STA $0405,X
Bank01_L9AC5:  RTS

Bank01_L9AC6:  JSR $9ADA
Bank01_L9AC9:  JSR $9AE2
Bank01_L9ACC:  LDX PageIndex
Bank01_L9ACE:  BCC $9AD9
Bank01_L9AD0:  JSR $9ADA
Bank01_L9AD3:  STA $040A,X
Bank01_L9AD6:  JSR $9A8F
Bank01_L9AD9:  RTS

Bank01_L9ADA:  LDY $040A,X
Bank01_L9ADD:  INY 
Bank01_L9ADE:  TYA 
Bank01_L9ADF:  AND #$03
Bank01_L9AE1:  RTS

Bank01_L9AE2:  LDY $0405,X
Bank01_L9AE5:  STY $00
Bank01_L9AE7:  LSR $00
Bank01_L9AE9:  ROL 
Bank01_L9AEA:  ASL 
Bank01_L9AEB:  TAY 
Bank01_L9AEC:  LDA $8049,Y
Bank01_L9AEF:  PHA 
Bank01_L9AF0:  LDA $8048,Y
Bank01_L9AF3:  PHA 
Bank01_L9AF4:  RTS

Bank01_L9AF5:  LDA $81
Bank01_L9AF7:  CMP #$01
Bank01_L9AF9:  BEQ $9B2D
Bank01_L9AFB:  CMP #$03
Bank01_L9AFD:  BEQ $9B2A
Bank01_L9AFF:  LDA #$80
Bank01_L9B01:  STA $6AFE,X
Bank01_L9B04:  LDA $0402,X
Bank01_L9B07:  BMI $9B25
Bank01_L9B09:  LDA $0405,X
Bank01_L9B0C:  AND #$10
Bank01_L9B0E:  BEQ $9B25
Bank01_L9B10:  LDA EnYRoomPos,X
Bank01_L9B13:  SEC 
Bank01_L9B14:  SBC $030D
Bank01_L9B17:  BPL $9B1C
Bank01_L9B19:  JSR $95C6
Bank01_L9B1C:  CMP #$10
Bank01_L9B1E:  BCS $9B25
Bank01_L9B20:  LDA #$00
Bank01_L9B22:  STA $6AFE,X
Bank01_L9B25:  LDA #$03
Bank01_L9B27:  JMP $8000
Bank01_L9B2A:  JMP $8006
Bank01_L9B2D:  LDA #$08
Bank01_L9B2F:  JMP $8003
Bank01_L9B32:  LDA EnStatus,X
Bank01_L9B35:  CMP #$02
Bank01_L9B37:  BNE $9B71
Bank01_L9B39:  LDA $0403,X
Bank01_L9B3C:  BNE $9B71
Bank01_L9B3E:  LDA $6AFE,X
Bank01_L9B41:  BNE $9B55
Bank01_L9B43:  LDA $030D
Bank01_L9B46:  SEC 
Bank01_L9B47:  SBC EnYRoomPos,X
Bank01_L9B4A:  CMP #$40
Bank01_L9B4C:  BCS $9B71
Bank01_L9B4E:  LDA #$7F
Bank01_L9B50:  STA $6AFE,X
Bank01_L9B53:  BNE $9B71
Bank01_L9B55:  LDA $0402,X
Bank01_L9B58:  BMI $9B71
Bank01_L9B5A:  LDA #$00
Bank01_L9B5C:  STA $0402,X
Bank01_L9B5F:  STA EnCounter,X
Bank01_L9B62:  STA $6AFE,X
Bank01_L9B65:  LDA $0405,X
Bank01_L9B68:  AND #$01
Bank01_L9B6A:  TAY 
Bank01_L9B6B:  LDA $9BA0,Y
Bank01_L9B6E:  STA $0403,X
Bank01_L9B71:  LDA $0405,X
Bank01_L9B74:  ASL 
Bank01_L9B75:  BMI $9B95
Bank01_L9B77:  LDA EnStatus,X
Bank01_L9B7A:  CMP #$02
Bank01_L9B7C:  BNE $9B95
Bank01_L9B7E:  JSR $8036
Bank01_L9B81:  PHA 
Bank01_L9B82:  JSR $8039
Bank01_L9B85:  STA $05
Bank01_L9B87:  PLA 
Bank01_L9B88:  STA $04
Bank01_L9B8A:  JSR $9CA8
Bank01_L9B8D:  JSR $8027
Bank01_L9B90:  BCC $9B9A
Bank01_L9B92:  JSR $9C96
Bank01_L9B95:  LDA #$03
Bank01_L9B97:  JMP $8003
Bank01_L9B9A:  LDA #$00
Bank01_L9B9C:  STA EnStatus,X
Bank01_L9B9F:  RTS

Bank01_L9BA0:  .byte $04, $FC

Bank01_L9BA2:  LDA EnStatus,X
Bank01_L9BA5:  CMP #$03
Bank01_L9BA7:  BCC $9BC2
Bank01_L9BA9:  BEQ $9BAF
Bank01_L9BAB:  CMP #$05
Bank01_L9BAD:  BNE $9BCB
Bank01_L9BAF:  LDA #$00
Bank01_L9BB1:  STA $6B04
Bank01_L9BB4:  STA $6B14
Bank01_L9BB7:  STA $6B24
Bank01_L9BBA:  STA $6B34
Bank01_L9BBD:  STA $6B44
Bank01_L9BC0:  BEQ $9BCB
Bank01_L9BC2:  JSR $9C1D
Bank01_L9BC5:  JSR $9CCC
Bank01_L9BC8:  JSR $9D05
Bank01_L9BCB:  LDA #$0A
Bank01_L9BCD:  STA $00
Bank01_L9BCF:  JMP $99CC
Bank01_L9BD2:  LDA $0405,X
Bank01_L9BD5:  AND #$02
Bank01_L9BD7:  BEQ $9BE0
Bank01_L9BD9:  LDA EnStatus,X
Bank01_L9BDC:  CMP #$03
Bank01_L9BDE:  BNE $9BE7
Bank01_L9BE0:  LDA #$00
Bank01_L9BE2:  STA EnStatus,X
Bank01_L9BE5:  BEQ $9C12
Bank01_L9BE7:  LDA $0405,X
Bank01_L9BEA:  ASL 
Bank01_L9BEB:  BMI $9C12
Bank01_L9BED:  LDA EnStatus,X
Bank01_L9BF0:  CMP #$02
Bank01_L9BF2:  BNE $9C12
Bank01_L9BF4:  JSR $802D
Bank01_L9BF7:  LDX PageIndex
Bank01_L9BF9:  LDA $00
Bank01_L9BFB:  STA $0402,X
Bank01_L9BFE:  JSR $8030
Bank01_L9C01:  LDX PageIndex
Bank01_L9C03:  LDA $00
Bank01_L9C05:  STA $0403,X
Bank01_L9C08:  JSR $8033
Bank01_L9C0B:  BCS $9C12
Bank01_L9C0D:  LDA #$03
Bank01_L9C0F:  STA EnStatus,X
Bank01_L9C12:  LDA #$01
Bank01_L9C14:  JSR $800C
Bank01_L9C17:  JMP $8006
Bank01_L9C1A:  JMP $9BD2
Bank01_L9C1D:  LDX #$50
Bank01_L9C1F:  JSR $9C2A
Bank01_L9C22:  TXA 
Bank01_L9C23:  SEC 
Bank01_L9C24:  SBC #$10
Bank01_L9C26:  TAX 
Bank01_L9C27:  BNE $9C1F
Bank01_L9C29:  RTS

Bank01_L9C2A:  LDY EnStatus,X
Bank01_L9C2D:  BEQ $9C55
Bank01_L9C2F:  LDA EnDataIndex,X
Bank01_L9C32:  CMP #$0A
Bank01_L9C34:  BEQ $9C3A
Bank01_L9C36:  CMP #$09
Bank01_L9C38:  BNE $9CA7
Bank01_L9C3A:  LDA $0405,X
Bank01_L9C3D:  AND #$02
Bank01_L9C3F:  BEQ $9C55
Bank01_L9C41:  DEY 
Bank01_L9C42:  BEQ $9C60
Bank01_L9C44:  CPY #$02
Bank01_L9C46:  BEQ $9C55
Bank01_L9C48:  CPY #$03
Bank01_L9C4A:  BNE $9CA7
Bank01_L9C4C:  LDA $040C,X
Bank01_L9C4F:  CMP #$01
Bank01_L9C51:  BNE $9CA7
Bank01_L9C53:  BEQ $9C60
Bank01_L9C55:  LDA #$00
Bank01_L9C57:  STA EnStatus,X
Bank01_L9C5A:  STA EnSpecialAttribs,X
Bank01_L9C5D:  JSR $802A
Bank01_L9C60:  LDA $0405
Bank01_L9C63:  STA $0405,X
Bank01_L9C66:  LSR 
Bank01_L9C67:  PHP 
Bank01_L9C68:  TXA 
Bank01_L9C69:  LSR 
Bank01_L9C6A:  LSR 
Bank01_L9C6B:  LSR 
Bank01_L9C6C:  LSR 
Bank01_L9C6D:  TAY 
Bank01_L9C6E:  LDA $9CB7,Y
Bank01_L9C71:  STA $04
Bank01_L9C73:  LDA $9CC6,Y
Bank01_L9C76:  STA EnDataIndex,X
Bank01_L9C79:  TYA 
Bank01_L9C7A:  PLP 
Bank01_L9C7B:  ROL 
Bank01_L9C7C:  TAY 
Bank01_L9C7D:  LDA $9CBB,Y
Bank01_L9C80:  STA $05
Bank01_L9C82:  LDX #$00
Bank01_L9C84:  JSR $9CA8
Bank01_L9C87:  JSR $8027
Bank01_L9C8A:  LDX PageIndex
Bank01_L9C8C:  BCC $9CA7
Bank01_L9C8E:  LDA EnStatus,X
Bank01_L9C91:  BNE $9C96
Bank01_L9C93:  INC EnStatus,X
Bank01_L9C96:  LDA $08
Bank01_L9C98:  STA EnYRoomPos,X
Bank01_L9C9B:  LDA $09
Bank01_L9C9D:  STA EnXRoomPos,X
Bank01_L9CA0:  LDA $0B
Bank01_L9CA2:  AND #$01
Bank01_L9CA4:  STA EnNameTable,X
Bank01_L9CA7:  RTS

Bank01_L9CA8:  LDA EnYRoomPos,X
Bank01_L9CAB:  STA $08
Bank01_L9CAD:  LDA EnXRoomPos,X
Bank01_L9CB0:  STA $09
Bank01_L9CB2:  LDA EnNameTable,X
Bank01_L9CB5:  STA $0B
Bank01_L9CB7:  RTS

Bank01_L9CB8:  .byte $F5, $FD, $05, $F6, $FE, $0A, $F6, $0C, $F4, $0E, $F2, $F8, $08, $F4, $0C, $09
Bank01_L9CC8:  .byte $09, $09, $0A, $0A
 
Bank01_L9CCC:  LDY $7E
Bank01_L9CCE:  BNE $9CD2
Bank01_L9CD0:  LDY #$80
Bank01_L9CD2:  LDA $2D
Bank01_L9CD4:  AND #$02
Bank01_L9CD6:  BNE $9D04
Bank01_L9CD8:  DEY 
Bank01_L9CD9:  STY $7E
Bank01_L9CDB:  TYA 
Bank01_L9CDC:  ASL 
Bank01_L9CDD:  BMI $9D04
Bank01_L9CDF:  AND #$0F
Bank01_L9CE1:  CMP #$0A
Bank01_L9CE3:  BNE $9D04
Bank01_L9CE5:  LDA #$01
Bank01_L9CE7:  LDX #$10
Bank01_L9CE9:  CMP EnStatus,X
Bank01_L9CEC:  BEQ $9CFF
Bank01_L9CEE:  LDX #$20
Bank01_L9CF0:  CMP EnStatus,X
Bank01_L9CF3:  BEQ $9CFF
Bank01_L9CF5:  LDX #$30
Bank01_L9CF7:  CMP EnStatus,X
Bank01_L9CFA:  BEQ $9CFF
Bank01_L9CFC:  INC $7E
Bank01_L9CFE:  RTS

Bank01_L9CFF:  LDA #$08
Bank01_L9D01:  STA EnDelay,X
Bank01_L9D04:  RTS

Bank01_L9D05:  LDY $7F
Bank01_L9D07:  BNE $9D0B
Bank01_L9D09:  LDY #$60
Bank01_L9D0B:  LDA $2D
Bank01_L9D0D:  AND #$02
Bank01_L9D0F:  BNE $9D34
Bank01_L9D11:  DEY 
Bank01_L9D12:  STY $7F
Bank01_L9D14:  TYA 
Bank01_L9D15:  ASL 
Bank01_L9D16:  BMI $9D34
Bank01_L9D18:  AND #$0F
Bank01_L9D1A:  BNE $9D34
Bank01_L9D1C:  LDA #$01
Bank01_L9D1E:  LDX #$40
Bank01_L9D20:  CMP EnStatus,X
Bank01_L9D23:  BEQ $9D2F
Bank01_L9D25:  LDX #$50
Bank01_L9D27:  CMP EnStatus,X
Bank01_L9D2A:  BEQ $9D2F
Bank01_L9D2C:  INC $7F
Bank01_L9D2E:  RTS

Bank01_L9D2F:  LDA #$08
Bank01_L9D31:  STA EnDelay,X
Bank01_L9D34:  RTS

Bank01_L9D35:  .byte $60, $22, $FF, $FF, $FF, $FF, $22, $80, $81, $82, $83, $22, $84, $85, $86, $87
Bank01_L9D45:  .byte $22, $88, $89, $8A, $8B, $22, $8C, $8D, $8E, $8F, $22, $94, $95, $96, $97, $22
Bank01_L9D55:  .byte $9C, $9D, $9D, $9C, $22, $9E, $9F, $9F, $9E, $22, $90, $91, $92, $93, $32, $4E
Bank01_L9D65:  .byte $4E, $4E, $4E, $4E, $4E

;-----------------------------------[ Enemy animation data tables ]----------------------------------

_EnemyAnimIndexTbl:

Bank01_L9D6A:  .byte $00, $01, $FF

Bank01_L9D6D:  .byte $02, $FF

Bank01_L9D6F:  .byte $19, $1A, $FF

Bank01_L9D72:  .byte $1A, $1B, $FF

Bank01_L9D75:  .byte $1C, $1D, $FF

Bank01_L9D78:  .byte $1D, $1E, $FF

Bank01_L9D7B:  .byte $22, $23, $24, $FF

Bank01_L9D7F:  .byte $1F, $20, $21, $FF

Bank01_L9D83:  .byte $22, $FF

Bank01_L9D85:  .byte $1F, $FF

Bank01_L9D87:  .byte $23, $04, $FF

Bank01_L9D8A:  .byte $20, $03, $FF

Bank01_L9D8D:  .byte $27, $28, $29, $FF

Bank01_L9D91:  .byte $37, $FF

Bank01_L9D93:  .byte $38, $FF

Bank01_L9D95:  .byte $39, $FF

Bank01_L9D97:  .byte $3A, $FF

Bank01_L9D99:  .byte $3B, $FF

Bank01_L9D9B:  .byte $3C, $FF

Bank01_L9D9D:  .byte $3D, $FF

Bank01_L9D9F:  .byte $58, $59, $FF

Bank01_L9DA2:  .byte $5A, $5B, $FF

Bank01_L9DA5:  .byte $5C, $5D, $FF

Bank01_L9DA8:  .byte $5E, $5F, $FF

Bank01_L9DAB:  .byte $60, $FF

Bank01_L9DAD:  .byte $61, $F7, $62, $F7, $FF

Bank01_L9DB2:  .byte $63, $64, $FF

Bank01_L9DB5:  .byte $65, $FF

Bank01_L9DB7:  .byte $66, $67, $FF

Bank01_L9DBA:  .byte $69, $6A, $FF

Bank01_L9DBD:  .byte $68, $FF

Bank01_L9DBF:  .byte $6B, $FF

Bank01_L9DC1:  .byte $66, $FF

Bank01_L9DC3:  .byte $69, $FF

Bank01_L9DC5:  .byte $6C, $FF

Bank01_L9DC7:  .byte $6D, $FF

Bank01_L9DC9:  .byte $6F, $70, $71, $6E, $FF

Bank01_L9DCE:  .byte $73, $74, $75, $72, $FF

Bank01_L9DD3:  .byte $8F, $90, $FF

Bank01_L9DD6:  .byte $91, $92, $FF

Bank01_L9DD9:  .byte $93, $94, $FF

Bank01_L9DDC:  .byte $95, $FF

Bank01_L9DDE:  .byte $96, $FF

;----------------------------[ Enemy sprite drawing pointer tables ]---------------------------------

_EnemyFramePtrTbl1:
Bank01_L9DE0:  .word $9FC2, $9FC7, $9FCC, $9FD1, $9FDA, $9FE3, $9FE3, $9FE3
Bank01_L9DF0:  .word $9FE3, $9FE3, $9FE3, $9FE3, $9FE3, $9FE3, $9FE3, $9FE3
Bank01_L9E00:  .word $9FE3, $9FE3, $9FE3, $9FE3, $9FE3, $9FE3, $9FE3, $9FE3
Bank01_L9E10:  .word $9FE3, $9FE3, $9FF1, $9FFF, $A00B, $A019, $A027, $A033
Bank01_L9E20:  .word $A03C, $A046, $A050, $A059, $A063, $A06D, $A06D, $A06D
Bank01_L9E30:  .word $A07B, $A082, $A08B, $A08B, $A08B, $A08B, $A08B, $A08B
Bank01_L9E40:  .word $A08B, $A08B, $A08B, $A08B, $A08B, $A08B, $A08B, $A08B
Bank01_L9E50:  .word $A09F, $A0B3, $A0BE, $A0C9, $A0D2, $A0DB, $A0E6, $A0E6
Bank01_L9E60:  .word $A0E6, $A0E6, $A0E6, $A0E6, $A0E6, $A0E6, $A0E6, $A0E6
Bank01_L9E70:  .word $A0E6, $A0E6, $A0E6, $A0E6, $A0E6, $A0E6, $A0E6, $A0E6
Bank01_L9E80:  .word $A0E6, $A0E6, $A0E6, $A0E6, $A0E6, $A0E6, $A0E6, $A0E6
Bank01_L9E90:  .word $A0E6, $A0EE, $A0F6, $A0FE, $A106, $A10E, $A116, $A11E
Bank01_L9EA0:  .word $A126, $A12E, $A13C, $A156, $A162, $A16F, $A177, $A17F
Bank01_L9EB0:  .word $A187, $A18F, $A197, $A19F, $A1A7, $A1AF, $A1B7, $A1BF
Bank01_L9EC0:  .word $A1C7, $A1CF, $A1D7, $A1DF, $A1E7, $A1EF, $A1F7, $A1F7
Bank01_L9ED0:  .word $A1F7, $A1F7, $A1F7, $A1F7, $A1F7, $A1F7, $A1F7, $A1F7

_EnemyFramePtrTbl2:
Bank01_L9EE0:  .word $A1F7, $A1FF, $A204, $A204, $A204, $A204, $A204, $A204
Bank01_L9EF0:  .word $A204, $A204, $A209, $A209, $A209, $A209, $A209, $A209
Bank01_L9F00:  .word $A213, $A21D, $A22D, $A23D, $A24D, $A25D, $A267

_EnemyPlacePtrTbl:
Bank01_L9F0E:  .word $9F2E, $9F30, $9F48, $9F60, $9F60, $9F60, $9F70, $9F7C
Bank01_L9F1E:  .word $9F84, $9F90, $9F90, $9FB0, $9FBE, $9FBE, $9FBE, $9FBE

;------------------------------[ Enemy sprite placement data tables ]--------------------------------

Bank01_L9F2E:  .byte $FC, $FC

;Enemy explode.
Bank01_L9F30:  .byte $80, $80, $81, $81, $82, $82, $83, $83, $84, $84, $85, $85, $F4, $F8, $F4, $00
Bank01_L9F40:  .byte $FC, $F8, $FC, $00, $04, $F8, $04, $00

Bank01_L9F48:  .byte $F0, $F4, $F0, $FC, $F0, $04, $F8, $F4, $F8, $FC, $F8, $04, $00, $F4, $00, $FC
Bank01_L9F58:  .byte $00, $04, $08, $F4, $08, $FC, $08, $04

Bank01_L9F60:  .byte $F8, $F4, $00, $F4, $F8, $FC, $00, $FC, $F4, $FC, $FC, $FC, $F8, $04, $00, $04

Bank01_L9F70:  .byte $02, $F4, $0A, $F4, $F8, $FC, $00, $FC, $02, $04, $0A, $04

Bank01_L9F7C:  .byte $F8, $F8, $F8, $00, $00, $F8, $00, $00

Bank01_L9F84:  .byte $F4, $FC, $FC, $FC, $04, $FC, $FC, $04, $04, $04, $0C, $FC

Bank01_L9F90:  .byte $F8, $F8, $F8, $00, $00, $F8, $00, $00, $F0, $00, $F0, $08, $F8, $08, $F0, $F0
Bank01_L9FA0:  .byte $F0, $F8, $F8, $F0, $00, $F0, $08, $F0, $08, $F8, $00, $08, $08, $00, $08, $08

Bank01_L9FB0:  .byte $F8, $FC, $00, $F8, $F4, $F4, $FC, $F4, $00, $00, $F4, $04, $FC, $04

Bank01_L9FBE:  .byte $FC, $F8, $FC, $00 

;Enemy frame drawing data.

Bank01_L9FC2:  .byte $00, $02, $02, $14, $FF

Bank01_L9FC7:  .byte $00, $02, $02, $24, $FF

Bank01_L9FCC:  .byte $00, $00, $00, $04, $FF

Bank01_L9FD1:  .byte $27, $06, $08, $FC, $04, $00, $D0, $D1, $FF

Bank01_L9FDA:  .byte $67, $06, $08, $FC, $04, $00, $D0, $D1, $FF

Bank01_L9FE3:  .byte $25, $08, $0A, $A3, $B3, $A4, $B4, $FE, $FE, $FD, $62, $A3, $B3, $FF

Bank01_L9FF1:  .byte $25, $08, $0A, $A5, $B3, $FE, $FE, $A4, $B4, $FD, $62, $A5, $B3, $FF

Bank01_L9FFF:  .byte $26, $08, $0A, $B5, $B3, $A4, $B4, $FD, $62, $B5, $B3, $FF

Bank01_LA00B:  .byte $A5, $08, $0A, $A3, $B3, $A4, $B4, $FE, $FE, $FD, $E2, $A3, $B3, $FF

Bank01_LA019:  .byte $A5, $08, $0A, $A5, $B3, $FE, $FE, $A4, $B4, $FD, $E2, $A5, $B3, $FF

Bank01_LA027:  .byte $A6, $08, $0A, $B5, $B3, $A4, $B4, $FD, $E2, $B5, $B3, $FF

Bank01_LA033:  .byte $27, $06, $08, $FC, $04, $00, $C0, $C1, $FF

Bank01_LA03C:  .byte $27, $06, $08, $E0, $E1, $FD, $A2, $E0, $E1, $FF

Bank01_LA046:  .byte $27, $06, $08, $F0, $F1, $FD, $A2, $F0, $F1, $FF

Bank01_LA050:  .byte $67, $06, $08, $FC, $04, $00, $C0, $C1, $FF

Bank01_LA059:  .byte $67, $06, $08, $E0, $E1, $FD, $E2, $E0, $E1, $FF

Bank01_LA063:  .byte $67, $06, $08, $F0, $F1, $FD, $E2, $F0, $F1, $FF

Bank01_LA06D:  .byte $28, $0C, $08, $CE, $FC, $00, $FC, $DE, $EE, $DF, $FD, $62, $EE, $FF

Bank01_LA07B:  .byte $28, $0C, $08, $CE, $CF, $EF, $FF

Bank01_LA082:  .byte $28, $0C, $08, $CE, $FD, $62, $CF, $EF, $FF

Bank01_LA08B:  .byte $21, $00, $00, $FC, $08, $FC, $A3, $FC, $00, $08, $A3, $FC, $00, $F8, $B3, $FC
Bank01_LA09B:  .byte $00, $08, $B3, $FF

Bank01_LA09F:  .byte $21, $00, $00, $FC, $00, $FC, $B3, $FC, $00, $08, $B3, $FC, $00, $F8, $A3, $FC
Bank01_LA0AF:  .byte $00, $08, $A3, $FF

Bank01_LA0B3:  .byte $21, $00, $00, $FC, $04, $00, $F1, $F0, $F1, $F0, $FF

Bank01_LA0BE:  .byte $21, $00, $00, $FC, $04, $00, $F0, $F1, $F0, $F1, $FF

Bank01_LA0C9:  .byte $21, $00, $00, $FC, $08, $00, $D1, $D0, $FF

Bank01_LA0D2:  .byte $21, $00, $00, $FC, $08, $00, $D0, $D1, $FF

Bank01_LA0DB:  .byte $21, $00, $00, $FC, $08, $00, $DE, $DF, $EE, $EE, $FF

Bank01_LA0E6:  .byte $27, $08, $08, $CC, $CD, $DC, $DD, $FF

Bank01_LA0EE:  .byte $67, $08, $08, $CC, $CD, $DC, $DD, $FF

Bank01_LA0F6:  .byte $27, $08, $08, $CA, $CB, $DA, $DB, $FF

Bank01_LA0FE:  .byte $A7, $08, $08, $CA, $CB, $DA, $DB, $FF

Bank01_LA106:  .byte $A7, $08, $08, $CC, $CD, $DC, $DD, $FF

Bank01_LA10E:  .byte $E7, $08, $08, $CC, $CD, $DC, $DD, $FF

Bank01_LA116:  .byte $67, $08, $08, $CA, $CB, $DA, $DB, $FF

Bank01_LA11E:  .byte $E7, $08, $08, $CA, $CB, $DA, $DB, $FF

Bank01_LA126:  .byte $21, $00, $00, $CC, $CD, $DC, $DD, $FF

Bank01_LA12E:  .byte $0A, $00, $00, $75, $FD, $60, $75, $FD, $A0, $75, $FD, $E0, $75, $FF

Bank01_LA13C:  .byte $0A, $00, $00, $FE, $FE, $FE, $FE, $3D, $3E, $4E, $FD, $60, $3E, $3D, $4E, $FD
Bank01_LA14C:  .byte $E0, $4E, $3E, $3D, $FD, $A0, $4E, $3D, $3E, $FF

Bank01_LA156:  .byte $2B, $08, $08, $E2, $E3, $E4, $FE, $FD, $62, $E3, $E4, $FF

Bank01_LA162:  .byte $2B, $08, $08, $E2, $E3, $FE, $E4, $FD, $62, $E3, $FE, $E4, $FF

Bank01_LA16F:  .byte $21, $00, $00, $96, $96, $98, $98, $FF

Bank01_LA177:  .byte $2A, $08, $08, $C2, $C3, $D2, $D3, $FF

Bank01_LA17F:  .byte $2A, $08, $08, $C2, $C4, $D2, $D4, $FF

Bank01_LA187:  .byte $21, $08, $08, $C2, $C4, $D2, $D4, $FF

Bank01_LA18F:  .byte $6A, $08, $08, $C2, $C3, $D2, $D3, $FF

Bank01_LA197:  .byte $6A, $08, $08, $C2, $C4, $D2, $D4, $FF

Bank01_LA19F:  .byte $61, $08, $08, $C2, $C4, $D2, $D4, $FF

Bank01_LA1A7:  .byte $20, $02, $04, $FC, $FF

Bank01_LA1AC:  .byte $00, $F8, $FF

Bank01_LA1AF:  .byte $60, $02, $04, $FC, $FF

Bank01_LA1B4:  .byte $00, $F8, $FF

Bank01_LA1B7:  .byte $20, $02, $02, $FC, $FE, $00, $D9, $FF

Bank01_LA1BF:  .byte $E0, $02, $02, $FC, $00, $02, $D8, $FF

Bank01_LA1C7:  .byte $E0, $02, $02, $FC, $02, $00, $D9, $FF

Bank01_LA1CF:  .byte $20, $02, $02, $FC, $00, $FE, $D8, $FF

Bank01_LA1D7:  .byte $60, $02, $02, $FC, $FE, $00, $D9, $FF

Bank01_LA1DF:  .byte $A0, $02, $02, $FC, $00, $FE, $D8, $FF

Bank01_LA1E7:  .byte $A0, $02, $02, $FC, $02, $00, $D9, $FF

Bank01_LA1EF:  .byte $60, $02, $02, $FC, $00, $02, $D8, $FF

Bank01_LA1F7:  .byte $06, $08, $04, $FE, $FE, $14, $24, $FF

Bank01_LA1FF:  .byte $00, $04, $04, $8A, $FF

Bank01_LA204:  .byte $00, $04, $04, $8A, $FF

Bank01_LA209:  .byte $3F, $04, $08, $FD, $03, $EC, $FD, $43, $EC, $FF

Bank01_LA213:  .byte $3F, $04, $08, $FD, $03, $ED, $FD, $43, $ED, $FF

Bank01_LA21D:  .byte $22, $10, $0C, $C5, $C6, $C7, $D5, $D6, $D7, $E5, $E6, $E7, $F5, $F6, $F7, $FF

Bank01_LA22D:  .byte $22, $10, $0C, $C5, $C6, $C7, $D5, $D6, $D7, $E5, $E6, $E7, $E8, $E9, $F9, $FF

Bank01_LA23D:  .byte $62, $10, $0C, $C5, $C6, $C7, $D5, $D6, $D7, $E5, $E6, $E7, $F5, $F6, $F7, $FF

Bank01_LA24D:  .byte $62, $10, $0C, $C5, $C6, $C7, $D5, $D6, $D7, $E5, $E6, $E7, $E8, $E9, $F9, $FF

Bank01_LA25D:  .byte $21, $00, $00, $C5, $C7, $D5, $D7, $E5, $E7, $FF

Bank01_LA267:  .byte $21, $00, $00, $C7, $C5, $D7, $D5, $E7, $E5, $FF

;----------------------------------------[ Palette data ]--------------------------------------------

_Palette00:
Bank01_LA271:  .byte $3F           ;Upper byte of PPU palette adress.
Bank01_LA272:  .byte $00           ;Lower byte of PPU palette adress.
Bank01_LA273:  .byte $20           ;Palette data length.
;The following values are written to the background palette:
Bank01_LA274:  .byte $0F, $22, $12, $1C, $0F, $22, $12, $1C, $0F, $27, $11, $07, $0F, $22, $12, $1C
;The following values are written to the sprite palette:
Bank01_LA284:  .byte $0F, $16, $19, $27, $0F, $12, $30, $21, $0F, $27, $2A, $3C, $0F, $15, $21, $38

Bank01_LA294:  .byte $00           ;End Palette00 info.

_Palette01:
Bank01_LA295:  .byte $3F           ;Upper byte of PPU palette adress.
Bank01_LA296:  .byte $12           ;Lower byte of PPU palette adress.
Bank01_LA297:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank01_LA298:  .byte $19, $27

Bank01_LA29A:  .byte $00           ;End Palette01 info.

_Palette03:
Bank01_LA29B:  .byte $3F           ;Upper byte of PPU palette adress.
Bank01_LA29C:  .byte $12           ;Lower byte of PPU palette adress.
Bank01_LA29D:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank01_LA29E:  .byte $2C, $27

Bank01_LA2A0:  .byte $00           ;End Palette02 info.

_Palette02:
Bank01_LA2A1:  .byte $3F           ;Upper byte of PPU palette adress.
Bank01_LA2A2:  .byte $12           ;Lower byte of PPU palette adress.
Bank01_LA2A3:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank01_LA2A4:  .byte $19, $35

Bank01_LA2A6:  .byte $00           ;End Palette03 info.

_Palette04:
Bank01_LA2A7:  .byte $3F           ;Upper byte of PPU palette adress.
Bank01_LA2A8:  .byte $12           ;Lower byte of PPU palette adress.
Bank01_LA2A9:  .byte $02           ;Palette data length.
;The following values are written to the sprite palette:
Bank01_LA2AA:  .byte $2C, $24

Bank01_LA2AC:  .byte $00           ;End Palette04 info.

_Palette05:
Bank01_LA2AD:  .byte $3F           ;Upper byte of PPU palette adress.
Bank01_LA2AE:  .byte $00           ;Lower byte of PPU palette adress.
Bank01_LA2AF:  .byte $10           ;Palette data length.
;The following values are written to the background palette:
Bank01_LA2B0:  .byte $0F, $20, $10, $00, $0F, $28, $19, $17, $0F, $27, $11, $07, $0F, $28, $16, $17
Bank01_LA2C0:  .byte $3F           ;Upper byte of PPU palette adress.
Bank01_LA2C1:  .byte $14           ;Lower byte of PPU palette adress.
Bank01_LA2C2:  .byte $0C           ;Palette data length.
;The following values are written to the sprite palette:
Bank01_LA2C3:  .byte $0F, $12, $30, $21, $0F, $26, $1A, $31, $0F, $15, $21, $38

Bank01_LA2CF:  .byte $00           ;End Palette05 info.

_Palette06:
Bank01_LA2D0:  .byte $3F           ;Upper byte of PPU palette adress.
Bank01_LA2D1:  .byte $11           ;Lower byte of PPU palette adress.
Bank01_LA2D2:  .byte $03           ;Palette data length.
;The following values are written to the sprite palette:
Bank01_LA2D3:  .byte $04, $09, $07

Bank01_LA2D6:  .byte $00           ;End Palette06 info.

_Palette07:
Bank01_LA2D7:  .byte $3F           ;Upper byte of PPU palette adress.
Bank01_LA2D8:  .byte $11           ;Lower byte of PPU palette adress.
Bank01_LA2D9:  .byte $03           ;Palette data length.
;The following values are written to the sprite palette:
Bank01_LA2DA:  .byte $05, $09, $17

Bank01_LA2DD:  .byte $00           ;End Palette07 info.

_Palette08:
Bank01_LA2DE:  .byte $3F           ;Upper byte of PPU palette adress.
Bank01_LA2DF:  .byte $11           ;Lower byte of PPU palette adress.
Bank01_LA2E0:  .byte $03           ;Palette data length.
;The following values are written to the sprite palette:
Bank01_LA2E1:  .byte $06, $0A, $26

Bank01_LA2E4:  .byte $00           ;End Palette08 info.

_Palette09:
Bank01_LA2E5:  .byte $3F           ;Upper byte of PPU palette adress.
Bank01_LA2E6:  .byte $11           ;Lower byte of PPU palette adress.
Bank01_LA2E7:  .byte $03           ;Palette data length.
;The following values are written to the sprite palette:
Bank01_LA2E8:  .byte $16, $19, $27

Bank01_LA2EB:  .byte $00           ;End Palette09 info.

_Palette0A:
Bank01_LA2EC:  .byte $3F           ;Upper byte of PPU palette adress.
Bank01_LA2ED:  .byte $00           ;Lower byte of PPU palette adress.
Bank01_LA2EE:  .byte $04           ;Palette data length.
;The following values are written to the background palette:
Bank01_LA2EF:  .byte $0F, $30, $30, $21

Bank01_LA2F3:  .byte $00           ;End Palette0A info.

_Palette0B:
Bank01_LA2F4:  .byte $3F           ;Upper byte of PPU palette adress.
Bank01_LA2F5:  .byte $10           ;Lower byte of PPU palette adress.
Bank01_LA2F6:  .byte $04           ;Palette data length.
;The following values are written to the sprite palette:
Bank01_LA2F7:  .byte $0F, $15, $34, $17

Bank01_LA2FB:  .byte $00           ;End Palette0B info.

_Palette0C:
Bank01_LA2FC:  .byte $3F           ;Upper byte of PPU palette adress.
Bank01_LA2FD:  .byte $10           ;Lower byte of PPU palette adress.
Bank01_LA2FE:  .byte $04           ;Palette data length.
;The following values are written to the sprite palette:
Bank01_LA2FF:  .byte $0F, $15, $34, $19

Bank01_LA303:  .byte $00           ;End Palette0C info.

_Palette0D:
Bank01_LA304:  .byte $3F           ;Upper byte of PPU palette adress.
Bank01_LA305:  .byte $10           ;Lower byte of PPU palette adress.
Bank01_LA306:  .byte $04           ;Palette data length.
;The following values are written to the sprite palette:
Bank01_LA307:  .byte $0F, $15, $34, $28

Bank01_LA30B:  .byte $00           ;End Palette0D info.

_Palette0E:
Bank01_LA30C:  .byte $3F           ;Upper byte of PPU palette adress.
Bank01_LA30D:  .byte $10           ;Lower byte of PPU palette adress.
Bank01_LA30E:  .byte $04           ;Palette data length.
;The following values are written to the sprite palette:
Bank01_LA30F:  .byte $0F, $15, $34, $29

Bank01_LA313:  .byte $00           ;End Palette0E info.

.scend
;----------------------------[ Room and structure pointer tables ]-----------------------------------

_RmPtrTbl:
Bank01_LA314:  .word $A441, $A454, $A45C, $A480, $A4BB, $A4ED, $A524, $A55A
Bank01_LA324:  .word $A587, $A5B9, $A5DD, $A615, $A635, $A661, $A68D, $A6B1
Bank01_LA334:  .word $A6DB, $A715, $A73C, $A768, $A78B, $A7A3, $A7D0, $A7F1
Bank01_LA344:  .word $A81B, $A85B, $A88B, $A8B1, $A8E7, $A910, $A92B, $A96B
Bank01_LA354:  .word $A997, $A9C6, $A9F6, $AA20, $AA56, $AAA4, $AAE6, $AB19
Bank01_LA364:  .word $AB48, $AB71, $AB92, $ABBF, $AC24, $AC4D, $AC6A 

_StrctPtrTbl:
Bank01_LA372:  .word $AC84, $AC97, $ACB0, $ACC9, $ACD0, $ACD7, $ACDB, $ACE6
Bank01_LA382:  .word $ACF3, $ACFF, $AD05, $AD0A, $AD1A, $AD1E, $AD28, $AD4D 
Bank01_LA392:  .word $AD57, $AD6A, $AD7F, $AD8E, $AD98, $ADA2, $ADAD, $ADBE
Bank01_LA3A2:  .word $ADE3, $ADE6, $ADEC, $ADF9, $AE09, $AE13, $AE18, $AE2D
Bank01_LA3B2:  .word $AE42, $AE48, $AE4B, $AE5F, $AE70, $AE85, $AE8E, $AE92
Bank01_LA3C2:  .word $AEA5, $AEB0, $AEB3, $AEBE, $AEC8, $AECB, $AEDE, $AEE1
Bank01_LA3D2:  .word $AEE4, $AEED 

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

;Elevator to Tourian.
Bank01_LA3D6:  .byte $02
Bank01_LA3D7:  .word $A3E4
Bank01_LA3D9:  .byte $03, $05, $04, $03, $00

;Varia suit.
Bank01_LA3DE:  .byte $0F, $FF, $02, $05, $37, $00

;Missiles.
Bank01_LA3E4:  .byte $03
Bank01_LA3E5:  .word $A3F3
Bank01_LA3E7:  .byte $18, $06, $02, $09, $67, $00

;Energy tank.
Bank01_LA3ED:  .byte $1B, $FF, $02, $08, $87, $00

;Long beam.
Bank01_LA3F3:  .byte $05
Bank01_LA3F4:  .word $A402
Bank01_LA3F6:  .byte $07, $06, $02, $02, $37, $00

;Bombs.
Bank01_LA3FC:  .byte $19, $FF, $02, $00, $37, $00

;Palette change room.
Bank01_LA402:  .byte $07
Bank01_LA403:  .word $A40F
Bank01_LA405:  .byte $0C, $04, $0A, $00

;Energy tank.
Bank01_LA409:  .byte $19, $FF, $02, $08, $87, $00

;Ice beam.
Bank01_LA40F:  .byte $09
Bank01_LA410:  .word $A41C
Bank01_LA412:  .byte $13, $06, $02, $07, $37, $00

;Mellows.
Bank01_LA418:  .byte $15, $FF, $03, $00

;Missiles.
Bank01_LA41C:  .byte $0B
Bank01_LA41D:  .word $A42A
Bank01_LA41F:  .byte $12, $06, $02, $09, $67, $00

;Elevator to Norfair.
Bank01_LA425:  .byte $16, $FF, $04, $01, $00

;Maru Mari.
Bank01_LA42A:  .byte $0E
Bank01_LA42B:  .word $A439
Bank01_LA42D:  .byte $02, $06, $02, $04, $96, $00

;Energy tank.
Bank01_LA433:  .byte $09, $FF, $02, $08, $12, $00

;Elevator to Kraid.
Bank01_LA439:  .byte $12
Bank01_LA43A:  .word $FFFF
Bank01_LA43C:  .byte $07, $FF, $04, $02, $00

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
Bank01_LA441:  .byte $02               ;Attribute table data.
;Room object data:
Bank01_LAA42:  .byte $40, $01, $02, $48, $01, $02, $50, $03, $02, $5F, $03, $02, $FD
;Room enemy/door data:
Bank01_LAA4F:  .byte $02, $A1, $02, $B1, $FF

;Room #$01
Bank01_LA454:  .byte $02               ;Attribute table data.
;Room object data:
Bank01_LA455:  .byte $07, $02, $02, $87, $02, $02, $FF

;Room #$02
Bank01_LA45C:  .byte $03               ;Attribute table data.
;Room object data:
Bank01_LA45D:  .byte $00, $0B, $03, $0E, $0B, $03, $50, $0B, $03, $5E, $0B, $03, $A0, $0B, $03, $AE
Bank01_LA46D:  .byte $0B, $03, $FD
;Room enemy/door data: 
Bank01_LA470:  .byte $01, $03, $42, $11, $83, $8A, $21, $03, $B5, $31, $02, $59, $41, $02, $A3, $FF

;Room #$03
Bank01_LA480:  .byte $02               ;Attribute table data.
;Room object data:
Bank01_LA481:  .byte $00, $0B, $03, $02, $09, $03, $0E, $0B, $03, $50, $0B, $03, $56, $0A, $03, $5F
Bank01_LA491:  .byte $03, $02, $8B, $0A, $03, $8E, $0B, $03, $92, $0A, $03, $A0, $0B, $03, $C7, $09
Bank01_LA4A1:  .byte $03, $DE, $0B, $03, $FD 
;Room enemy/door data:
Bank01_LA4A6:  .byte $02, $A1, $01, $85, $47, $11, $05, $BA, $21, $03, $08, $31, $83, $53, $41, $83
Bank01_LA4B6:  .byte $97, $51, $03, $C5, $FF

;Room #$04
Bank01_LA4BB:  .byte $03               ;Attribute table data.
;Room object data:
Bank01_LA4BC:  .byte $00, $0B, $03, $04, $0A, $03, $0E, $0B, $03, $47, $09, $03, $50, $03, $02, $5E
Bank01_LA4CC:  .byte $0B, $03, $80, $0B, $03, $82, $0A, $03, $9C, $0A, $03, $AE, $0B, $03, $B6, $0A
Bank01_LA4DC:  .byte $03, $C0, $0B, $03, $FD
;Room enemy/door data:
Bank01_LA4E1:  .byte $02, $B1, $41, $03, $45, $51, $03, $BB, $31, $05, $39, $FF 

;Room #$05
Bank01_LA4ED:  .byte $03               ;Attribute table data.
;Room object data:
Bank01_LA4EE:  .byte $00, $0B, $03, $0E, $0B, $03, $15, $09, $03, $50, $03, $02, $57, $0A, $03, $5F
Bank01_LA4FE:  .byte $03, $02, $80, $0B, $03, $82, $0A, $03, $8B, $0A, $03, $8E, $0B, $03, $B0, $0B
Bank01_LA50E:  .byte $03, $C6, $09, $03, $CE, $0B, $03, $FD
;Room enemy/door data:
Bank01_LA516:  .byte $02, $A1, $02, $B1, $01, $83, $43, $31, $85, $48, $51, $05, $B7, $FF

;Room #$06
Bank01_LA524:  .byte $03               ;Attribute table data.
;Room object data:
Bank01_LA525:  .byte $00, $0B, $03, $0E, $0B, $03, $12, $0A, $03, $37, $0A, $03, $50, $0B, $03, $5E
Bank01_LA535:  .byte $0B, $03, $73, $0A, $03, $8A, $0A, $03, $A0, $0B, $03, $AE, $0B, $03, $B6, $09
Bank01_LA545:  .byte $03, $FD 
;Room enemy/door data:
Bank01_LA547:  .byte $01, $03, $B3, $11, $03, $3C, $21, $05, $A8, $31, $05, $64, $51, $85, $7B, $41
Bank01_LA557:  .byte $05, $28, $FF

;Room #$07
Bank01_LA55A:  .byte $03               ;Attribute table data.
;Room object data:
Bank01_LA55B:  .byte $00, $0D, $03, $08, $0D, $03, $54, $06, $03, $5A, $06, $03, $67, $07, $03, $A0
Bank01_LA56B:  .byte $0B, $03, $AE, $0B, $03, $C2, $06, $03, $CD, $06, $03, $D2, $00, $02, $D6, $00
Bank01_LA57B:  .byte $02, $FD
;Room enemy/door data:
Bank01_LA57D:  .byte $51, $05, $B2, $41, $05, $BD, $31, $05, $67, $FF

;Room #$08
Bank01_LA587:  .byte $03               ;Attribute table data.
;Room object data:
Bank01_LA588:  .byte $00, $1E, $03, $04, $1E, $03, $08, $1E, $03, $0C, $1E, $03, $38, $1E, $03, $40
Bank01_LA598:  .byte $1E, $03, $44, $1E, $03, $4C, $1E, $03, $74, $1E, $03, $78, $1E, $03, $80, $1E
Bank01_LA5A8:  .byte $03, $8C, $1E, $03, $B0, $1E, $03, $B4, $1E, $03, $B8, $1E, $03, $CC, $1E, $03
Bank01_LA5B8:  .byte $FF

;Room #$09(Starting room).
Bank01_LA5B9:  .byte $03               ;Attribute table data.
;Room object data:
Bank01_LA5BA:  .byte $00, $11, $01, $08, $11, $01, $35, $1D, $03, $3B, $1D, $03, $55, $0B, $03, $5A
Bank01_LA5CA:  .byte $0B, $03, $C5, $16, $00, $D0, $10, $03, $D8, $10, $03, $FD
;Room enemy/door data: 
Bank01_LA5D6:  .byte $51, $05, $25, $41, $05, $2B, $FF

;Room #$0A
Bank01_LA5DD:  .byte $00               ;Attribute table data.
;Room object data:
Bank01_LA5DE:  .byte $00, $14, $00, $08, $14, $00, $0F, $15, $00, $10, $15, $00, $14, $15, $00, $25
Bank01_LA5EE:  .byte $08, $03, $50, $14, $00, $58, $0C, $00, $5F, $04, $02, $60, $14, $00, $70, $13
Bank01_LA5FE:  .byte $00, $80, $14, $00, $88, $14, $00, $90, $16, $00, $99, $16, $00, $B3, $15, $00
Bank01_LA60E:  .byte $BC, $15, $00, $FD
;Room enemy/door data: 
Bank01_LA612:  .byte $02, $A0, $FF

;Room #$0B
Bank01_LA615:  .byte $00               ;Attribute table data.
;Room object data:
Bank01_LA616:  .byte $00, $15, $00, $01, $16, $00, $08, $16, $00, $0F, $15, $00, $4F, $15, $00, $50
Bank01_LA626:  .byte $04, $02, $80, $16, $00, $87, $02, $02, $89, $16, $00, $FD
;Room enemy/door data:
Bank01_LA632:  .byte $02, $B1, $FF

;Room #$0C
Bank01_LA635:  .byte $02               ;Attribute table data.
;Room object data:
Bank01_LA636:  .byte $00, $1B, $02, $08, $1B, $02, $10, $1A, $02, $50, $03, $02, $80, $1A, $02, $82
Bank01_LA646:  .byte $19, $02, $BC, $19, $02, $C0, $1A, $02, $C6, $1B, $02, $D1, $00, $02, $D9, $00
Bank01_LA656:  .byte $02, $FD
;Room enemy/door data:
Bank01_LA658:  .byte $02, $B1, $51, $02, $5A, $31, $02, $AA, $FF

;Room #$0D
Bank01_LA661:  .byte $02               ;Attribute table data.
;Room object data:
Bank01_LA662:  .byte $00, $1B, $02, $08, $1B, $02, $1E, $1A, $02, $5F, $03, $02, $8C, $19, $02, $8E
Bank01_LA672:  .byte $1A, $02, $B7, $1A, $02, $C2, $1A, $02, $CE, $1A, $02, $D0, $00, $02, $D7, $00
Bank01_LA682:  .byte $02, $FD
;Room enemy/door data:
Bank01_LA684:  .byte $02, $A1, $31, $05, $B3, $51, $02, $44, $FF

;Room #$0E
Bank01_LA68D:  .byte $02               ;Attribute table data.
;Room object data:
Bank01_LA68E:  .byte $00, $1B, $02, $08, $1B, $02, $AC, $19, $02, $B4, $19, $02, $B8, $1A, $02, $D0
Bank01_LA69E:  .byte $00, $02, $D8, $00, $02, $FD
;Room enemy/door data:
Bank01_LA6A4:  .byte $01, $82, $28, $11, $05, $A5, $21, $02, $8B, $31, $02, $BD, $FF 

;Room #$0F
Bank01_LA6B1:  .byte $03               ;Attribute table data.
;Room object data:
Bank01_LA6B2:  .byte $00, $1B, $02, $08, $1B, $02, $59, $06, $03, $92, $19, $02, $AC, $19, $02, $BB
Bank01_LA6C2:  .byte $19, $02, $C0, $06, $03, $D0, $00, $02, $D8, $00, $02, $FD
;Room enemy/door data:
Bank01_LA6CE:  .byte $01, $02, $3B, $11, $02, $B8, $51, $85, $84, $41, $05, $49, $FF

;Room #$10
Bank01_LA6DB:  .byte $02               ;Attribute table data.
;Room object data:
Bank01_LA6DC:  .byte $00, $17, $02, $08, $17, $02, $10, $17, $02, $18, $17, $02, $50, $03, $02, $5F
Bank01_LA6EC:  .byte $03, $02, $80, $1A, $02, $82, $19, $02, $86, $2E, $02, $87, $1B, $02, $8E, $1A
Bank01_LA6FC:  .byte $02, $C0, $1A, $02, $CE, $1A, $02, $D2, $12, $02, $D8, $12, $02, $FD
;Room enemy/door data:
Bank01_LA70A:  .byte $02, $A1, $02, $B1, $01, $02, $5C, $11, $02, $A7, $FF

;Room #$11
Bank01_LA715:  .byte $03               ;Attribute table data.
;Room object data:
Bank01_LA716:  .byte $00, $0B, $03, $02, $06, $03, $0E, $0B, $03, $50, $0B, $03, $52, $06, $03, $5E
Bank01_LA726:  .byte $0B, $03, $A0, $0B, $03, $A2, $06, $03, $AE, $0B, $03, $FD
;Room enemy/door data:
Bank01_LA732:  .byte $01, $83, $DD, $11, $03, $35, $21, $02, $7D, $FF

;Room #$12
Bank01_LA73C:  .byte $03               ;Attribute table data.
;Room object data:
Bank01_LA73D:  .byte $00, $0B, $03, $02, $11, $01, $0A, $11, $01, $50, $03, $02, $80, $0B, $03, $82
Bank01_LA74D:  .byte $0A, $03, $D0, $10, $03, $D8, $10, $03, $FD
;Room enemy/door data:
Bank01_LA756:  .byte $02, $B1, $01, $05, $C7, $11, $05, $CB, $51, $04, $3A, $41, $04, $29, $31, $04
Bank01_LA766:  .byte $1E, $FF

;Room #$13
Bank01_LA768:  .byte $03               ;Attribute table data.
;Room object data:
Bank01_LA769:  .byte $00, $11, $01, $07, $10, $03, $0E, $0B, $03, $5F, $03, $02, $8A, $09, $03, $8E
Bank01_LA779:  .byte $0B, $03, $D0, $10, $03, $D8, $10, $03, $FD
;Room enemy/door data:
Bank01_LA782:  .byte $02, $A1, $01, $05, $7B, $11, $05, $C8, $FF

;Room #$14
Bank01_LA78B:  .byte $01               ;Attribute table data.
;Room object data:
Bank01_LA78C:  .byte $00, $11, $01, $08, $11, $01, $D0, $10, $03, $D8, $10, $03, $FD
;Room enemy/door data:
Bank01_LA799:  .byte $51, $04, $14, $21, $04, $38, $41, $04, $2E, $FF

;Room #$15
Bank01_LA7A3:  .byte $03               ;Attribute table data.
;Room object data:
Bank01_LA7A4:  .byte $00, $10, $03, $08, $10, $03, $90, $1F, $01, $96, $1F, $01, $AA, $05, $03, $AC
Bank01_LA7B4:  .byte $1F, $01, $BA, $10, $03, $C4, $05, $03, $D0, $10, $03, $D8, $10, $03, $FD
;Room enemy/door data:
Bank01_LA7C3:  .byte $51, $05, $89, $37, $87, $AB, $21, $06, $23, $17, $07, $C5, $FF

;Room #$16
Bank01_LA7D0:  .byte $01               ;Attribute table data.
;Room object data:
Bank01_LA7D1:  .byte $00, $11, $01, $08, $11, $01, $B0, $1F, $01, $B6, $05, $03, $B8, $05, $03, $BC
Bank01_LA7E1:  .byte $1F, $01, $C6, $1F, $01, $D4, $00, $02, $FD
;Room enemy/door data:
Bank01_LA7EA:  .byte $07, $07, $B7, $47, $87, $B9, $FF

;Room #$17
Bank01_LA7F1:  .byte $03               ;Attribute table data.
;Room object data:
Bank01_LA7F2:  .byte $00, $11, $01, $08, $10, $03, $4A, $1E, $03, $6B, $1E, $03, $8C, $1E, $03, $A6
Bank01_LA802:  .byte $15, $00, $B3, $1D, $03, $B9, $1D, $03, $C3, $0C, $00, $C8, $0C, $00, $D0, $10
Bank01_LA812:  .byte $03, $D8, $10, $03, $FD
;Room enemy/door data:
Bank01_LA817:  .byte $41, $05, $B4, $FF

;Room #$18
Bank01_LA81B:  .byte $01               ;Attribute table data.
;Room object data:
Bank01_LA81C:  .byte $00, $0B, $03, $01, $11, $01, $09, $11, $01, $0E, $0B, $03, $50, $03, $02, $5F
Bank01_LA82C:  .byte $03, $02, $64, $0D, $03, $66, $20, $01, $80, $1F, $01, $84, $20, $01, $88, $20
Bank01_LA83C:  .byte $01, $8C, $1E, $03, $A6, $20, $01, $B0, $0B, $03, $BE, $0B, $03, $E6, $20, $01
Bank01_LA84C:  .byte $FD
;Room enemy/door data:
Bank01_LA84D:  .byte $02, $A1, $02, $B1, $31, $05, $56, $01, $85, $5A, $21, $05, $D9, $FF

;Room #$19
Bank01_LA85B:  .byte $01               ;Attribute table data.
;Room object data:
Bank01_LA85C:  .byte $00, $10, $03, $04, $1F, $01, $08, $1F, $01, $0C, $11, $01, $12, $31, $03, $44
Bank01_LA86C:  .byte $1F, $01, $48, $1F, $01, $84, $1F, $01, $88, $1F, $01, $D0, $1F, $01, $D4, $1F
Bank01_LA87C:  .byte $01, $D8, $10, $03, $FD
;Room enemy/door data:
Bank01_LA881:  .byte $51, $05, $C0, $41, $05, $CA, $31, $06, $3C, $FF

;Room #$1A
Bank01_LA88B:  .byte $02               ;Attribute table data.
;Room object data:
Bank01_LA88C:  .byte $00, $28, $02, $01, $2D, $02, $09, $2D, $02, $50, $04, $02, $80, $28, $02, $81
Bank01_LA89C:  .byte $14, $00, $95, $15, $00, $D0, $2D, $02, $D8, $2D, $02, $FD
;Room enemy/door data:
Bank01_LA8A8:  .byte $02, $B0, $01, $05, $C7, $11, $85, $CA, $FF

;Room #$1B
Bank01_LA8B1:  .byte $00               ;Attribute table data.
;Room object data:
Bank01_LA8B2:  .byte $00, $14, $00, $04, $15, $00, $08, $14, $00, $0A, $15, $00, $97, $06, $03, $A0
Bank01_LA8C2:  .byte $0B, $03, $A6, $15, $00, $A8, $15, $00, $AE, $0B, $03, $B4, $06, $03, $BA, $06
Bank01_LA8D2:  .byte $03, $C2, $06, $03, $D2, $00, $02, $D6, $00, $02, $FD
;Room enemy/door data:
Bank01_LA8DD:  .byte $41, $05, $AA, $21, $06, $17, $11, $05, $A4, $FF

;Room #$1C
Bank01_LA8E7:  .byte $00               ;Attribute table data.
;Room object data:
Bank01_LA8E8:  .byte $00, $15, $00, $01, $0D, $03, $09, $0E, $01, $2A, $23, $01, $37, $22, $03, $4D
Bank01_LA8F8:  .byte $0E, $01, $50, $03, $02, $6A, $16, $00, $6D, $0E, $01, $80, $14, $00, $87, $02
Bank01_LA908:  .byte $02, $89, $14, $00, $FD
;Room enemy/door data:
Bank01_LA90D:  .byte $02, $B1, $FF

;Room #$1D
Bank01_LA910:  .byte $01               ;Attribute table data.
;Room object data:
Bank01_LA911:  .byte $00, $0E, $01, $08, $0E, $01, $44, $0E, $01, $84, $0F, $01, $94, $0E, $01, $B0
Bank01_LA921:  .byte $0E, $01, $B8, $0E, $01, $FD 
;Room enemy/door data:
Bank01_LA927:  .byte $31, $06, $42, $FF

;Room #$1E
Bank01_LA92B:  .byte $01               ;Attribute table data.
;Room object data:
Bank01_LA92C:  .byte $00, $0E, $01, $02, $2A, $01, $07, $25, $01, $08, $0E, $01, $10, $0E, $01, $12
Bank01_LA93c:  .byte $2A, $01, $17, $25, $01, $18, $0E, $01, $50, $03, $02, $5F, $03, $02, $74, $26
Bank01_LA94C:  .byte $01, $78, $26, $01, $80, $0E, $01, $88, $0E, $01, $C0, $24, $01, $CC, $24, $01
Bank01_LA95C:  .byte $D4, $00, $02, $FD
;Room enemy/door data:
Bank01_LA960:  .byte $02, $A1, $02, $B1, $11, $02, $52, $01, $03, $C8, $FF

;Room #$1F
Bank01_LA96B:  .byte $01               ;Attribute table data.
;Room object data:
Bank01_LA96C:  .byte $00, $27, $01, $08, $27, $01, $10, $24, $01, $50, $03, $02, $80, $24, $01, $A6
Bank01_LA97C:  .byte $26, $01, $B0, $0E, $01, $CA, $26, $01, $D8, $0E, $01, $FD
;Room enemy/door data:
Bank01_LA988:  .byte $02, $B1, $01, $02, $2B, $11, $02, $BB, $21, $82, $5B, $31, $02, $8B, $FF

;Room #$20
Bank01_LA997:  .byte $01               ;Attribute table data.
;Room object data:
Bank01_LA998:  .byte $00, $27, $01, $08, $27, $01, $1C, $24, $01, $20, $24, $01, $5F, $03, $02, $8C
Bank01_LA9A8:  .byte $24, $01, $BA, $26, $01, $C4, $26, $01, $C8, $0E, $01, $D0, $0E, $01, $FD 
;Room enemy/door data:
Bank01_LA9B7:  .byte $02, $A1, $51, $02, $85, $41, $02, $C5, $31, $05, $BA, $21, $05, $C5, $FF

;Room #$21
Bank01_LA9C6:  .byte $01               ;Attribute table data.
;Room object data:
Bank01_LA9C7:  .byte $00, $0E, $01, $08, $0E, $01, $30, $0E, $01, $38, $0E, $01, $A7, $26, $01, $B0
Bank01_LA9D7:  .byte $24, $01, $B6, $24, $01, $BC, $24, $01, $C4, $05, $03, $D4, $27, $01, $DA, $00
Bank01_LA9E7:  .byte $02, $FD
;Room enemy/door data:
Bank01_LA9E9:  .byte $07, $07, $C5, $11, $05, $AC, $21, $05, $A8, $51, $06, $7A, $FF

;Room #$22
Bank01_LA9F6:  .byte $01               ;Attribute table data.
;Room object data:
Bank01_LA9F7:  .byte $00, $0E, $01, $08, $0E, $01, $30, $0E, $01, $37, $25, $01, $48, $2A, $01, $4C
Bank01_LAA07:  .byte $2A, $01, $68, $0E, $01, $78, $0E, $01, $A3, $26, $01, $B0, $0E, $01, $B8, $0E
Bank01_LAA17:  .byte $01, $FD
;Room enemy/door data:
Bank01_LAA19:  .byte $41, $06, $75, $21, $03, $85, $FF

;Room #$23
Bank01_LAA20:  .byte $02               ;Attribute table data.
;Room object data:
Bank01_LAA21:  .byte $00, $27, $01, $08, $27, $01, $63, $29, $01, $73, $28, $02, $8B, $29, $01, $9B
Bank01_LAA31:  .byte $28, $02, $C0, $26, $01, $C6, $26, $01, $D0, $0E, $01, $D8, $00, $02, $D9, $0E
Bank01_LAA41:  .byte $01, $DE, $05, $03, $FD
;Room enemy/door data:
Bank01_LAA46:  .byte $01, $85, $63, $11, $05, $8B, $21, $02, $6E, $47, $07, $DF, $31, $83, $A8, $FF

;Room #$24
Bank01_LAA56:  .byte $01               ;Attribute table data.
;Room object data:
Bank01_LAA57:  .byte $00, $0E, $01, $08, $0E, $01, $40, $2B, $00, $48, $2B, $00, $50, $0E, $01, $53
Bank01_LAA67:  .byte $20, $01, $58, $0E, $01, $5B, $20, $01, $60, $2B, $00, $68, $13, $00, $70, $27
Bank01_LAA77:  .byte $01, $78, $27, $01, $80, $2B, $00, $88, $2B, $00, $90, $27, $01, $98, $27, $01
Bank01_LAA87:  .byte $A0, $13, $00, $A8, $2B, $00, $B0, $0E, $01, $B8, $0E, $01, $FD
;Room enemy/door data:
Bank01_LAA94:  .byte $01, $05, $4D, $11, $85, $6C, $21, $05, $8A, $31, $85, $AF, $41, $05, $47, $FF

;Room #$25
Bank01_LAAA4:  .byte $02               ;Attribute table data.
;Room object data:
Bank01_LAAA5:  .byte $00, $27, $01, $05, $27, $01, $0A, $0E, $01, $23, $24, $01, $4A, $13, $00, $52
Bank01_LAAB5:  .byte $24, $01, $59, $20, $01, $5A, $0E, $01, $6A, $2B, $00, $79, $0E, $01, $89, $2B
Bank01_LAAC5:  .byte $00, $90, $28, $02, $94, $06, $03, $98, $0E, $01, $A8, $13, $00, $B0, $0E, $01
Bank01_LAAD5:  .byte $B8, $0E, $01, $FD
;Room enemy/door data:
Bank01_LAAD9:  .byte $51, $05, $4F, $41, $05, $6E, $31, $05, $8E, $21, $02, $48, $FF

;Room #$26
Bank01_LAAE6:  .byte $01               ;Attribute table data.
;Room object data:
Bank01_LAAE7:  .byte $00, $0E, $01, $08, $27, $01, $40, $2B, $00, $50, $0E, $01, $56, $20, $01, $60
Bank01_LAAF7:  .byte $2B, $00, $68, $2C, $00, $80, $27, $01, $8B, $24, $01, $D0, $00, $02, $D8, $00
Bank01_LAB07:  .byte $02, $FD
;Room enemy/door data:
Bank01_LAB09:  .byte $51, $05, $67, $41, $05, $7E, $21, $05, $7B, $31, $03, $49, $11, $02, $C6, $FF

;Room #$27
Bank01_LAB19:  .byte $03               ;Attribute table data.
;Room object data:
Bank01_LAB1A:  .byte $00, $0B, $03, $02, $11, $01, $09, $11, $01, $50, $04, $02, $80, $0B, $03, $82
Bank01_LAB2A:  .byte $1E, $03, $B6, $1D, $03, $B7, $1D, $03, $C2, $09, $03, $C8, $1D, $03, $D0, $10
Bank01_LAB3A:  .byte $03, $D8, $10, $03, $FD
;Room enemy/door data:
Bank01_LAB3F:  .byte $02, $B0, $11, $04, $38, $31, $06, $27, $FF

;Room #$28
Bank01_LAB48:  .byte $00               ;Attribute table data.
;Room object data:
Bank01_LAB49:  .byte $00, $2D, $02, $08, $2D, $02, $0F, $28, $02, $5F, $03, $02, $87, $14, $00, $8F
Bank01_LAB59:  .byte $28, $02, $9A, $15, $00, $C3, $26, $01, $D0, $2D, $02, $D8, $2D, $02, $FD 
;Room enemy/door data:
Bank01_LAB68:  .byte $02, $A1, $01, $06, $23, $31, $05, $7D, $FF

;Room #$29
Bank01_LAB71:  .byte $02               ;Attribute table data.
;Room object data:
Bank01_LAB72:  .byte $00, $2D, $02, $08, $2D, $02, $C2, $26, $01, $C7, $26, $01, $C9, $26, $01, $D0
Bank01_LAB82:  .byte $2D, $02, $D8, $2D, $02, $FD
;Room enemy/door data:
Bank01_LAB88:  .byte $41, $86, $25, $51, $06, $2A, $21, $05, $CB, $FF

;Room #$2A
Bank01_LAB92:  .byte $00               ;Attribute table data.
;Room object data:
Bank01_LAB93:  .byte $00, $11, $01, $08, $11, $01, $68, $21, $02, $78, $15, $00, $95, $15, $00, $A0
Bank01_LABA3:  .byte $0B, $03, $AE, $0B, $03, $BB, $15, $00, $C2, $06, $03, $D2, $00, $02, $D6, $00
Bank01_LABB3:  .byte $02, $FD
;Room enemy/door data:
Bank01_LABB5:  .byte $01, $05, $58, $11, $05, $85, $31, $06, $26, $FF

;Room #$2B(Bridge to Tourian).
Bank01_LABBF:  .byte $02               ;Attribute table data.
;Room object data:
Bank01_LABC0:  .byte $00, $30, $00, $01, $1A, $02, $02, $30, $00, $03, $1A, $02, $05, $1C, $02, $0A
Bank01_LABD0:  .byte $1B, $02, $0F, $30, $00, $10, $30, $00, $14, $30, $00, $1F, $30, $00, $2C, $18
Bank01_LABE0:  .byte $02, $35, $18, $02, $41, $19, $02, $44, $2F, $02, $45, $18, $02, $46, $2F, $02
Bank01_LABF0:  .byte $50, $04, $02, $53, $19, $02, $5F, $04, $02, $64, $1C, $02, $65, $1C, $02, $68
Bank01_LAC00:  .byte $2F, $02, $80, $15, $00, $81, $19, $02, $8D, $19, $02, $9C, $19, $02, $9F, $15
Bank01_LAC10:  .byte $00, $C0, $30, $00, $D1, $00, $02, $D7, $00, $02, $DF, $30, $00, $FD
;Room enemy/door data:
Bank01_LAC1E:  .byte $02, $A0, $02, $B1, $06, $FF

;Room #$2C
Bank01_LAC24:  .byte $00               ;Attribute table data.
;Room object data:
Bank01_LAC25:  .byte $00, $16, $00, $07, $16, $00, $0E, $16, $00, $1F, $15, $00, $20, $15, $00, $40
Bank01_LAC35:  .byte $30, $00, $5F, $04, $02, $80, $16, $00, $87, $02, $02, $89, $16, $00, $A0, $15
Bank01_LAC45:  .byte $00, $AF, $15, $00, $FD
;Room enemy/door data:
Bank01_LAC4A:  .byte $02, $A1, $FF

;Room #$2D
Bank01_LAC4D:  .byte $03               ;Attribute table data.
;Room object data:
Bank01_LAC4E:  .byte $00, $11, $01, $08, $11, $01, $1E, $1E, $03, $5F, $04, $02, $8B, $10, $03, $9E
Bank01_LAC5E:  .byte $0B, $03, $D0, $10, $03, $D8, $10, $03, $FD
;Room enemy/door data:
Bank01_LAC67:  .byte $02, $A1, $FF

;Room #$2E
Bank01_LAC6A:  .byte $03               ;Attribute table data.
;Room object data:
Bank01_LAC6B:  .byte $00, $0B, $03, $0E, $0B, $03, $50, $03, $02, $5E, $0B, $03, $80, $0B, $03, $AE
Bank01_LAC7B:  .byte $0B, $03, $D0, $0B, $03, $FD
;Room enemy/door data:
Bank01_LAC81:  .byte $02, $B1, $FF

;---------------------------------------[ Structure definitions ]------------------------------------

;The first byte of the structure definition states how many macros are in the first row of the
;structure. The the number of bytes after the macro number byte is equal to the value of the macro
;number byte and those bytes define what each macro in the row are. For example, if the macro number
;byte is #$08, the next 8 bytes represent 8 macros. The macro description bytes are the macro numbers
;and are multiplied by 4 to find the index to the desired macro in _MacroDefs.  Any further bytes in
;the structure definition represent the next rows.  #$FF marks the end of the structure definition.

;Structure #$00
Bank01_LAC84:  .byte $08, $01, $01, $01, $01, $01, $01, $01, $01, $08, $00, $00, $00, $00, $00, $00
Bank01_LAC94:  .byte $00, $00, $FF

;Structure #$01
Bank01_LAC97:  .byte $08, $02, $02, $02, $02, $02, $02, $02, $02, $01, $28, $01, $28, $01, $28, $08
Bank01_LACA7:  .byte $02, $02, $02, $02, $02, $02, $02, $02, $FF

;Structure #$02
Bank01_LACB0:  .byte $02, $04, $05, $02, $04, $05, $02, $04, $05, $02, $04, $05, $02, $04, $05, $02
Bank01_LACC0:  .byte $04, $05, $02, $04, $05, $02, $04, $05, $FF

;Structure #$03
Bank01_LACC9:  .byte $01, $06, $01, $06, $01, $06, $FF

;Structure #$04
Bank01_LACD0:  .byte $01, $07, $01, $07, $01, $07, $FF

;Structure #$05
Bank01_LACD7:  .byte $02, $31, $32, $FF

;Structure #$06
Bank01_LACDB:  .byte $01, $08, $01, $33, $01, $33, $01, $33, $01, $33, $FF

;Structure #$07
Bank01_LACE6:  .byte $01, $28, $01, $08, $01, $1F, $01, $17, $01, $17, $01, $1F, $FF

;Structure #$08
Bank01_LACF3:  .byte $02, $0E, $11, $03, $0F, $12, $22, $03, $10, $13, $14, $FF

;Structure #$09
Bank01_LACFF:  .byte $04, $08, $35, $35, $08, $FF

;Structure #$0A
Bank01_LAD05:  .byte $03, $08, $35, $08, $FF

;Structure #$0B
Bank01_LAD0A:  .byte $02, $36, $36, $02, $1C, $08, $02, $08, $34, $02, $34, $34, $02, $08, $08, $FF

;Structure #$0C
Bank01_LAD1A:  .byte $02, $20, $20, $FF

;Structure #$0D
Bank01_LAD1E:  .byte $08, $08, $1C, $08, $35, $08, $35, $1C, $08, $FF

;Structure #$0E
Bank01_LAD28:  .byte $08, $1E, $1E, $1C, $1C, $1E, $1E, $1E, $1E, $08, $1E, $1E, $1E, $1E, $1C, $1E
Bank01_LAD38:  .byte $1E, $1E, $08, $1C, $1E, $1E, $1E, $1E, $1E, $1C, $1E, $08, $1E, $1E, $1E, $1C
Bank01_LAD48:  .byte $1E, $1C, $1C, $1E, $FF

;Structure #$0F
Bank01_LAD4D:  .byte $08, $2E, $2E, $2E, $2E, $2E, $2E, $2E, $2E, $FF

;Structure #$10
Bank01_LAD57:  .byte $08, $08, $0B, $0B, $0B, $0B, $08, $0B, $0B, $08, $08, $08, $1C, $1C, $08, $08
Bank01_LAD67:  .byte $1C, $08, $FF

;Structure #$11
Bank01_LAD6A:  .byte $08, $1C, $08, $08, $08, $08, $0A, $08, $1C, $08, $08, $0A, $09, $0A, $28, $28
Bank01_LAD7A:  .byte $08, $08, $01, $08, $FF

;Structure #$12
Bank01_LAD7F:  .byte $06, $2C, $2C, $2C, $2C, $15, $2C, $06, $2D, $2D, $2D, $2D, $16, $2D, $FF

;Structure #$13
Bank01_LAD8E:  .byte $08, $2B, $2B, $2B, $2B, $2B, $2B, $2B, $2B, $FF

;Structure #$14
Bank01_LAD98:  .byte $08, $1A, $1A, $1A, $1A, $1A, $1A, $1A, $1A, $FF

;Structure #$15
Bank01_LADA2:  .byte $01, $20, $01, $20, $01, $17, $01, $17, $01, $20, $FF

;Structure #$16
Bank01_LADAD:  .byte $07, $20, $20, $20, $20, $20, $20, $20, $07, $20, $1A, $20, $1F, $20, $1A, $20
Bank01_LADBD:  .byte $FF

;Structure #$17
Bank01_LADBE:  .byte $08, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $08, $0D, $0D, $0D, $0D, $0D, $0D
Bank01_LADCE:  .byte $0D, $0D, $08, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $08, $0D, $0D, $0D, $0D
Bank01_LADDE:  .byte $0D, $0D, $0D, $0D, $FF

;Structure #$18
Bank01_LADE3:  .byte $01, $0D, $FF

;Structure #$19
Bank01_LADE6:  .byte $04, $0D, $0D, $0D, $0D, $FF

;Structure #$1A
Bank01_LADEC:  .byte $02, $0D, $0D, $02, $0D, $0D, $02, $0D, $0D, $02, $0D, $0D, $FF

;Structure #$1B
Bank01_LADF9:  .byte $08, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $05, $27, $30, $0D, $0D, $30, $FF

;Structure #$1C
Bank01_LAE09:  .byte $08, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $FF

;Structure #$1D
Bank01_LAE13:  .byte $01, $0C, $01, $1F, $FF

;Structure #$1E
Bank01_LAE18:  .byte $04, $08, $35, $08, $08, $04, $08, $1C, $08, $34, $04, $34, $08, $08, $08, $04
Bank01_LAE28:  .byte $08, $08, $1C, $08, $FF

;Structure #$1F
Bank01_LAE2D:  .byte $04, $1D, $1D, $1D, $1D, $04, $1D, $1C, $1C, $1D, $04, $1C, $1D, $1C, $1C, $04
Bank01_LAE3D:  .byte $1D, $1C, $1D, $1D, $FF

;Structure #$20
Bank01_LAE42:  .byte $04, $33, $33, $33, $33, $FF

;Structure #$21
Bank01_LAE48:  .byte $01, $22, $FF

;Structure #$22
Bank01_LAE4B:  .byte $03, $28, $0E, $08, $03, $37, $08, $39, $03, $38, $39, $39, $03, $28, $3A, $0A
Bank01_LAE5B:  .byte $02, $3B, $3C, $FF

;Structure #$23
Bank01_LAE5F:  .byte $03, $1E, $1E, $1C, $03, $39, $08, $1E, $03, $0A, $09, $1E, $03, $3D, $0B, $0A
Bank01_LAE6F:  .byte $FF

;Structure #$24
Bank01_LAE70:  .byte $04, $1E, $1E, $1C, $1E, $04, $1E, $1E, $1E, $1E, $04, $1C, $1E, $1E, $1E, $04
Bank01_LAE80:  .byte $1E, $1E, $1C, $1E, $FF

;Structure #$25
Bank01_LAE85:  .byte $01, $23, $01, $23, $01, $23, $01, $23, $FF

;Structure #$26
Bank01_LAE8E:  .byte $02, $3E, $3F, $FF

;Structure #$27
Bank01_LAE92:  .byte $08, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $08, $1E, $1E, $1E, $1E, $1E, $1E
Bank01_LAEA2:  .byte $1E, $1E, $FF

;Structure #$28
Bank01_LAEA5:  .byte $01, $1F, $01, $1F, $01, $1F, $01, $1F, $01, $1F, $FF

;Structure #$29
Bank01_LAEB0:  .byte $01, $3E, $FF

;Structure #$2A
Bank01_LAEB3:  .byte $04, $2E, $2A, $2E, $2E, $04, $2E, $2E, $2E, $2A, $FF

;Structure #$2B
Bank01_LAEBE:  .byte $08, $2B, $03, $03, $2B, $03, $03, $03, $2B, $FF

;Structure #$2C
Bank01_LAEC8:  .byte $01, $1B, $FF

;Structure #$2D
Bank01_LAECB:  .byte $08, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $08, $1F, $1F, $1F, $1F, $1F, $1F
Bank01_LAEDB:  .byte $1F, $1F, $FF

;Structure #$2E
Bank01_LAEDE:  .byte $01, $2F, $FF

;Structure #$2F
Bank01_LAEE1:  .byte $01, $1F, $FF

;Structure #$30
Bank01_LAEE4:  .byte $01, $17, $01, $17, $01, $17, $01, $17, $FF

;Structure #$31
Bank01_LAEED:  .byte $01, $24, $FF

;----------------------------------------[ Macro definitions ]---------------------------------------

;The macro definitions are simply index numbers into the pattern tables that represent the 4 quadrants
;of the macro definition. The bytes correspond to the following position in order: lower right tile,
;lower left tile, upper right tile, upper left tile. 

_MacroDefs:

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

;Not used.
Bank01_LAFF4:  .byte $20, $20, $20, $20, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0

;------------------------------------------[ Area music data ]---------------------------------------

;There are 3 control bytes associated with the music data and the rest are musical note indexes.
;If the byte has the binary format 1011xxxx ($Bx), then the byte is an index into the corresponding
;musical notes table and is used to set the note length until it is set by another note length
;byte. The lower 4 bits are the index into the note length table. Another control byte is the loop
;and counter btye. The loop and counter byte has the format 11xxxxxx. Bits 0 thru 6 contain the
;number of times to loop.  The third control byte is #$FF. This control byte marks the end of a loop
;and decrements the loop counter. If #$00 is found in the music data, the music has reached the end.
;A #$00 in any of the different music channel data segments will mark the end of the music. The
;remaining bytes are indexes into the MusicNotesTbl_B1 and should only be even numbers as there are 2
;bytes of data per musical note.

BrinstarSQ1IndexData_B1:
Bank01_LB000:  .byte $C2           ;
Bank01_LB001:  .byte $B4           ;1 1/2 seconds  +
Bank01_LB002:  .byte $2E           ;B3     | Repeat 2 times
Bank01_LB003:  .byte $30           ;C4     +
Bank01_LB004:  .byte $FF           ;
Bank01_LB005:  .byte $C3           ;
Bank01_LB006:  .byte $B3           ;3/4 seconds    +
Bank01_LB007:  .byte $2E           ;B3     |
Bank01_LB008:  .byte $34           ;D4     | Repeat 3 times
Bank01_LB009:  .byte $30           ;C4     |
Bank01_LB00A:  .byte $3A           ;F4     +
Bank01_LB00B:  .byte $FF           ;
Bank01_LB00C:  .byte $B4           ;1 1/2 seconds
Bank01_LB00d:  .byte $2E           ;B3
Bank01_LB00E:  .byte $B3           ;3/4 seconds
Bank01_LB00F:  .byte $30           ;C4
Bank01_LB010:  .byte $34           ;D4
Bank01_LB011:  .byte $C3           ;
Bank01_LB012:  .byte $B6           ;1 3/16 seconds +
Bank01_LB013:  .byte $38           ;E4     |
Bank01_LB014:  .byte $B9           ;1/8 seconds    |
Bank01_LB015:  .byte $30           ;C4     |
Bank01_LB016:  .byte $26           ;G3     | Repeat 3 times
Bank01_LB017:  .byte $30           ;C4     |
Bank01_LB018:  .byte $B3           ;3/4 seconds    |
Bank01_LB019:  .byte $3A           ;F4     |
Bank01_LB01A:  .byte $34           ;D4     +
Bank01_LB01B:  .byte $FF           ;
Bank01_LB01C:  .byte $B4           ;1 1/2 seconds
Bank01_LB01D:  .byte $38           ;E4
Bank01_LB01E:  .byte $38           ;E4
Bank01_LB01F:  .byte $B2           ;3/8 seconds
Bank01_LB020:  .byte $3A           ;F4
Bank01_LB021:  .byte $30           ;C4
Bank01_LB022:  .byte $2A           ;A3
Bank01_LB023:  .byte $B9           ;1/8 seconds
Bank01_LB024:  .byte $30           ;C4
Bank01_LB025:  .byte $2C           ;A#3
Bank01_LB026:  .byte $30           ;C4
Bank01_LB027:  .byte $B2           ;3/8 seconds
Bank01_LB028:  .byte $34           ;D4
Bank01_LB029:  .byte $3A           ;F4
Bank01_LB02A:  .byte $B3           ;3/4 seconds
Bank01_LB02B:  .byte $30           ;C4
Bank01_LB02C:  .byte $B2           ;3/8 seconds
Bank01_LB02D:  .byte $36           ;D#4
Bank01_LB02E:  .byte $2A           ;A3
Bank01_LB02F:  .byte $22           ;F3
Bank01_LB030:  .byte $B9           ;1/8 seconds
Bank01_LB031:  .byte $18           ;C3
Bank01_LB032:  .byte $2C           ;A#3
Bank01_LB033:  .byte $18           ;C3
Bank01_LB034:  .byte $B2           ;3/8 seconds
Bank01_LB035:  .byte $1C           ;D3
Bank01_LB036:  .byte $22           ;F3
Bank01_LB037:  .byte $2C           ;A#3
Bank01_LB038:  .byte $B9           ;1/8 seconds
Bank01_LB039:  .byte $18           ;C3
Bank01_LB03A:  .byte $22           ;F3
Bank01_LB03B:  .byte $2A           ;A3
Bank01_LB03C:  .byte $B3           ;3/4 seconds
Bank01_LB03D:  .byte $2E           ;B3
Bank01_LB03E:  .byte $2A           ;A3
Bank01_LB03F:  .byte $26           ;G3
Bank01_LB040:  .byte $34           ;D4
Bank01_LB041:  .byte $B2           ;3/8 seconds
Bank01_LB042:  .byte $36           ;D#4
Bank01_LB043:  .byte $3A           ;F4
Bank01_LB044:  .byte $28           ;Ab3
Bank01_LB045:  .byte $B9           ;1/8 seconds
Bank01_LB046:  .byte $26           ;G3
Bank01_LB047:  .byte $22           ;F3
Bank01_LB048:  .byte $1E           ;D#3
Bank01_LB049:  .byte $B2           ;3/8 seconds
Bank01_LB04A:  .byte $22           ;F3
Bank01_LB04B:  .byte $2C           ;A#3
Bank01_LB04C:  .byte $26           ;G3
Bank01_LB04D:  .byte $B9           ;1/8 seconds
Bank01_LB04E:  .byte $22           ;F3
Bank01_LB04F:  .byte $44           ;A#4
Bank01_LB050:  .byte $34           ;D4
Bank01_LB051:  .byte $B4           ;1 1/2 seconds
Bank01_LB052:  .byte $34           ;D4
Bank01_LB053:  .byte $B3           ;3/4 seconds
Bank01_LB054:  .byte $2E           ;B3
Bank01_LB055:  .byte $26           ;G3
Bank01_LB056:  .byte $00           ;End Brinstar music

BrinstarSQ2IndexData_B1:
Bank01_LB057:  .byte $C2           ;
Bank01_LB058:  .byte $B2           ;3/8 seconds    +
Bank01_LB059:  .byte $0E           ;G2     |
Bank01_LB05A:  .byte $B9           ;1/8 seconds    |
Bank01_LB05B:  .byte $0E           ;G2     |
Bank01_LB05C:  .byte $06           ;D2     |
Bank01_LB05D:  .byte $0E           ;G2     |
Bank01_LB05E:  .byte $B2           ;3/8 seconds    |
Bank01_LB05F:  .byte $0E           ;G2     |
Bank01_LB060:  .byte $B9           ;1/8 seconds    |
Bank01_LB061:  .byte $0E           ;G2     |
Bank01_LB062:  .byte $06           ;D2     |
Bank01_LB063:  .byte $0E           ;G2     | Repeat 2 times
Bank01_LB064:  .byte $B2           ;3/8 seconds    |
Bank01_LB065:  .byte $14           ;A#2        |
Bank01_LB066:  .byte $B9           ;1/8 seconds    |
Bank01_LB067:  .byte $14           ;A#2        |
Bank01_LB068:  .byte $0A           ;F2     |
Bank01_LB069:  .byte $14           ;A#2        |
Bank01_LB06A:  .byte $B2           ;3/8 seconds    |
Bank01_LB06B:  .byte $14           ;A#2        |
Bank01_LB06C:  .byte $B9           ;1/8 seconds    |
Bank01_LB06D:  .byte $14           ;A#2        |
Bank01_LB06E:  .byte $0A           ;F2     |
Bank01_LB06F:  .byte $14           ;A#2        +
Bank01_LB070:  .byte $FF           ;
Bank01_LB071:  .byte $C3           ;
Bank01_LB072:  .byte $B4           ;1 1/2 seconds  +
Bank01_LB073:  .byte $3E           ;G4     |
Bank01_LB074:  .byte $B6           ;1 3/16 seconds |
Bank01_LB075:  .byte $44           ;A#4        |
Bank01_LB076:  .byte $B0           ;3/32 seconds   | Repeat 3 times
Bank01_LB077:  .byte $42           ;A4     |
Bank01_LB078:  .byte $44           ;A#4        |
Bank01_LB079:  .byte $42           ;A4     |
Bank01_LB07A:  .byte $3A           ;F4     +
Bank01_LB07B:  .byte $FF           ;
Bank01_LB07C:  .byte $B4           ;1 1/2 seconds
Bank01_LB07D:  .byte $3E           ;G4
Bank01_LB07E:  .byte $3E           ;G4
Bank01_LB07F:  .byte $C3           ;
Bank01_LB080:  .byte $B6           ;1 3/16 seconds +
Bank01_LB081:  .byte $48           ;C5     |
Bank01_LB082:  .byte $B2           ;3/8 seconds    |
Bank01_LB083:  .byte $3E           ;G4     |
Bank01_LB084:  .byte $B6           ;1 3/16 seconds |
Bank01_LB085:  .byte $44           ;A#4        | Repeat 3 times
Bank01_LB086:  .byte $B0           ;3/32 seconds   |
Bank01_LB087:  .byte $42           ;A4     |
Bank01_LB088:  .byte $44           ;A#4        |
Bank01_LB089:  .byte $42           ;A4     |
Bank01_LB08A:  .byte $3A           ;F4     +
Bank01_LB08B:  .byte $FF           ;
Bank01_LB08C:  .byte $B4           ;1 1/2 seconds
Bank01_LB08D:  .byte $3E           ;G4
Bank01_LB08E:  .byte $26           ;G3
Bank01_LB08F:  .byte $B6           ;1 3/16 seconds
Bank01_LB090:  .byte $42           ;A4
Bank01_LB091:  .byte $B9           ;1/8 seconds
Bank01_LB092:  .byte $42           ;A4
Bank01_LB093:  .byte $3E           ;G4
Bank01_LB094:  .byte $42           ;A4
Bank01_LB095:  .byte $B3           ;3/4 seconds
Bank01_LB096:  .byte $44           ;A#4
Bank01_LB097:  .byte $B2           ;3/8 seconds
Bank01_LB098:  .byte $3A           ;F4
Bank01_LB099:  .byte $B9           ;1/8 seconds
Bank01_LB09A:  .byte $30           ;C4
Bank01_LB09B:  .byte $3A           ;F4
Bank01_LB09C:  .byte $3E           ;G4
Bank01_LB09D:  .byte $B6           ;1 3/16 seconds
Bank01_LB09E:  .byte $42           ;A4
Bank01_LB09F:  .byte $B9           ;1/8 seconds
Bank01_LB0A0:  .byte $42           ;A4
Bank01_LB0A1:  .byte $3E           ;G4
Bank01_LB0A2:  .byte $42           ;A4
Bank01_LB0A3:  .byte $B3           ;3/4 seconds
Bank01_LB0A4:  .byte $44           ;A#4
Bank01_LB0A5:  .byte $B2           ;3/8 seconds
Bank01_LB0A6:  .byte $3A           ;F4
Bank01_LB0A7:  .byte $B9           ;1/8 seconds
Bank01_LB0A8:  .byte $3A           ;F4
Bank01_LB0A9:  .byte $44           ;A#4
Bank01_LB0AA:  .byte $48           ;C5
Bank01_LB0AB:  .byte $B4           ;1 1/2 seconds
Bank01_LB0AC:  .byte $4C           ;D5
Bank01_LB0AD:  .byte $B3           ;3/4 seconds
Bank01_LB0AE:  .byte $48           ;C5
Bank01_LB0AF:  .byte $46           ;B4
Bank01_LB0B0:  .byte $B6           ;1 3/16 seconds
Bank01_LB0B1:  .byte $48           ;C5
Bank01_LB0B2:  .byte $B9           ;1/8 seconds
Bank01_LB0B3:  .byte $4E           ;D#5
Bank01_LB0B4:  .byte $4C           ;D5
Bank01_LB0B5:  .byte $48           ;C5
Bank01_LB0B6:  .byte $B3           ;3/4 seconds
Bank01_LB0B7:  .byte $4C           ;D5
Bank01_LB0B8:  .byte $B2           ;3/8 seconds
Bank01_LB0B9:  .byte $44           ;A#4
Bank01_LB0BA:  .byte $B9           ;1/8 seconds
Bank01_LB0BB:  .byte $44           ;A#4
Bank01_LB0BC:  .byte $4C           ;D5
Bank01_LB0BD:  .byte $52           ;F5
Bank01_LB0BE:  .byte $B4           ;1 1/2 seconds
Bank01_LB0BF:  .byte $54           ;F#5
Bank01_LB0C0:  .byte $54           ;F#5

BrinstarTriangleIndexData_B1:
Bank01_LB0C1:  .byte $C4           ;
Bank01_LB0C2:  .byte $B4           ;1 1/2 seconds  + Repeat 4 times
Bank01_LB0C3:  .byte $02           ;No sound   +
Bank01_LB0C4:  .byte $FF           ;
Bank01_LB0C5:  .byte $C3           ;
Bank01_LB0C6:  .byte $B2           ;3/8 seconds    +
Bank01_LB0C7:  .byte $26           ;G3     |
Bank01_LB0C8:  .byte $B9           ;1/8 seconds    |
Bank01_LB0C9:  .byte $26           ;G3     |
Bank01_LB0CA:  .byte $3E           ;G4     |
Bank01_LB0CB:  .byte $34           ;D4     |
Bank01_LB0CC:  .byte $B2           ;3/8 seconds    |
Bank01_LB0CD:  .byte $26           ;G3     |
Bank01_LB0CE:  .byte $B9           ;1/8 seconds    |
Bank01_LB0CF:  .byte $26           ;G3     |
Bank01_LB0D0:  .byte $34           ;D4     | Repeat 3 times
Bank01_LB0D1:  .byte $26           ;G3     |
Bank01_LB0D2:  .byte $B2           ;3/8 seconds    |
Bank01_LB0D3:  .byte $2C           ;A#3        |
Bank01_LB0D4:  .byte $B9           ;1/8 seconds    |
Bank01_LB0D5:  .byte $2C           ;A#3        |
Bank01_LB0D6:  .byte $3A           ;F4     |
Bank01_LB0D7:  .byte $2C           ;A#3        |
Bank01_LB0D8:  .byte $B2           ;3/8 seconds    |
Bank01_LB0D9:  .byte $2C           ;A#3        |
Bank01_LB0DA:  .byte $B9           ;1/8 seconds    |
Bank01_LB0DB:  .byte $2C           ;A#3        |
Bank01_LBoDC:  .byte $3A           ;F4     |
Bank01_LB0DD:  .byte $2C           ;A#3        +
Bank01_LB0DE:  .byte $FF           ;
Bank01_LB0DF:  .byte $C4           ;
Bank01_LB0E0:  .byte $B2           ;3/8 seconds    +
Bank01_LB0E1:  .byte $26           ;G3     |
Bank01_LB0E2:  .byte $B9           ;1/8 seconds    | Repeat 4 times
Bank01_LB0E3:  .byte $34           ;D4     |
Bank01_LB0E4:  .byte $26           ;G3     |
Bank01_LB0E5:  .byte $26           ;G3     +
Bank01_LB0E6:  .byte $FF           ;
Bank01_LB0E7:  .byte $D0           ;
Bank01_LB0E8:  .byte $B9           ;1/8 seconds    +               
Bank01_LB0E9:  .byte $18           ;C3     |
Bank01_LB0EA:  .byte $26           ;G3     | Repeat 16 times
Bank01_LB0EB:  .byte $18           ;C3     |
Bank01_LB0EC:  .byte $B2           ;3/8 seconds    |
Bank01_LB0ED:  .byte $18           ;C3     +
Bank01_LB0EE:  .byte $FF           ;
Bank01_LB0EF:  .byte $C2           ;
Bank01_LB0F0:  .byte $B2           ;3/8 seconds    +
Bank01_LB0F1:  .byte $1E           ;D#3        |
Bank01_LB0F2:  .byte $B9           ;1/8 seconds    |
Bank01_LB0F3:  .byte $1E           ;D#3        |
Bank01_LB0F4:  .byte $18           ;C3     |
Bank01_LB0F5:  .byte $1E           ;D#3        |
Bank01_LB0F6:  .byte $B2           ;3/8 seconds    |
Bank01_LB0F7:  .byte $1E           ;D#3        |
Bank01_LB0F8:  .byte $B9           ;1/8 seconds    |
Bank01_LB0F9:  .byte $1E           ;D#3        |
Bank01_LB0FA:  .byte $18           ;C3     | Repeat 2 times
Bank01_LB0FB:  .byte $1E           ;D#3        |
Bank01_LB0FC:  .byte $B2           ;3/8 seconds    |
Bank01_LB0FD:  .byte $1C           ;D3     |
Bank01_LB0FE:  .byte $B9           ;1/8 seconds    |
Bank01_LB0FF:  .byte $1C           ;D3     |
Bank01_LB100:  .byte $14           ;A#2        |
Bank01_LB101:  .byte $1C           ;D3     |
Bank01_LB102:  .byte $B2           ;3/8 seconds    |
Bank01_LB103:  .byte $1C           ;D3     |
Bank01_LB104:  .byte $B9           ;1/8 seconds    |
Bank01_LB105:  .byte $1C           ;D3     |
Bank01_LB106:  .byte $14           ;A#2        |
Bank01_LB107:  .byte $1C           ;D3     +
Bank01_LB108:  .byte $FF           ;
Bank01_LB109:  .byte $B2           ;3/8 seconds
Bank01_LB10A:  .byte $26           ;G3
Bank01_LB10B:  .byte $12           ;A2
Bank01_LB10C:  .byte $16           ;B2
Bank01_LB10D:  .byte $18           ;C3
Bank01_LB10E:  .byte $1C           ;D3
Bank01_LB10F:  .byte $20           ;E3
Bank01_LB110:  .byte $24           ;F#3
Bank01_LB111:  .byte $26           ;G3
Bank01_LB112:  .byte $B2           ;3/8 seconds
Bank01_LB113:  .byte $28           ;Ab3
Bank01_LB114:  .byte $B9           ;1/8 seconds
Bank01_LB115:  .byte $28           ;Ab3
Bank01_LB116:  .byte $1E           ;D#3
Bank01_LB117:  .byte $18           ;C3
Bank01_LB118:  .byte $B2           ;3/8 seconds
Bank01_LB119:  .byte $10           ;Ab2
Bank01_LB11A:  .byte $B9           ;1/8 seconds
Bank01_LB11B:  .byte $30           ;C4
Bank01_LB11C:  .byte $2C           ;A#3
Bank01_LB11D:  .byte $28           ;Ab3
Bank01_LB11E:  .byte $B2           ;3/8 seconds
Bank01_LB11F:  .byte $1E           ;D#3
Bank01_LB120:  .byte $1C           ;D3
Bank01_LB121:  .byte $18           ;C3
Bank01_LB122:  .byte $14           ;A#2
Bank01_LB123:  .byte $2A           ;A3
Bank01_LB124:  .byte $2A           ;A3
Bank01_LB125:  .byte $2A           ;A3
Bank01_LB126:  .byte $2A           ;A3
Bank01_LB127:  .byte $CC           ;
Bank01_LB128:  .byte $B9           ;1/8 seconds    + Repeat 12 times
Bank01_LB129:  .byte $2A           ;A3     +
Bank01_LB12A:  .BYTE $FF           ;

BrinstarNoiseIndexData_B1:
Bank01_LB12B:  .byte $E8           ;
Bank01_LB12C:  .byte $B2           ;3/8 seconds    +
Bank01_LB12D:  .byte $04           ;Drumbeat 01    |
Bank01_LB12E:  .byte $04           ;Drumbeat 01    |
Bank01_LB12F:  .byte $04           ;Drumbeat 01    | Repeat 40 times
Bank01_LB130:  .byte $B9           ;1/8 seconds    |
Bank01_LB131:  .byte $04           ;Drumbeat 01    |
Bank01_LB132:  .byte $04           ;Drumbeat 01    |
Bank01_LB133:  .byte $04           ;Drumbeat 01    +
Bank01_LB134:  .byte $FF           ;

;Unused tile patterns. 
Bank01_LB135:  .byte $E0, $E0, $F0, $00, $00, $00, $00, $00, $00, $00, $00, $21, $80, $40, $02, $05
Bank01_LB145:  .byte $26, $52, $63, $00, $00, $00, $06, $07, $67, $73, $73, $FF, $AF, $2F, $07, $0B
Bank01_LB155:  .byte $8D, $A7, $B1, $00, $00, $00, $00, $00, $80, $80, $80, $F8, $B8, $F8, $F8, $F0
Bank01_LB165:  .byte $F0, $F8, $FC, $00, $00, $00, $00, $00, $00, $00, $00, $07, $07, $07, $07, $07
Bank01_LB175:  .byte $03, $03, $01, $00, $00, $00, $00, $00, $00, $00, $80, $FF, $C7, $83, $03, $C7
Bank01_LB185:  .byte $CF, $FE, $EC, $00, $30, $78, $F8, $30, $00, $01, $12, $F5, $EA, $FB, $FD, $F9
Bank01_LB195:  .byte $1E, $0E, $44, $07, $03, $03, $01, $01, $E0, $10, $48, $2B, $3B, $1B, $5A, $D0
Bank01_LB1A5:  .byte $D1, $C3, $C3, $3B, $3B, $9B, $DA, $D0, $D0, $C0, $C0, $2C, $23, $20, $20, $30
Bank01_LB1B5:  .byte $98, $CF, $C7, $00, $00, $00, $00, $00, $00, $00, $30, $1F, $80, $C0, $C0, $60
Bank01_LB1C5:  .byte $70, $FC, $C0, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00
Bank01_LB1D5:  .byte $00, $00, $00, $80, $80, $C0, $78, $4C, $C7, $80, $80, $C4, $A5, $45, $0B, $1B
Bank01_LB1E5:  .byte $03, $03, $00, $3A, $13, $31, $63, $C3, $83, $03, $04, $E6, $E6, $C4, $8E, $1C
Bank01_LB1F5:  .byte $3C, $18, $30, $E8, $E8, $C8, $90, $60, $00, $00, $00

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

    ;Brinstar music
    _LBDB3:  .byte $0B, $FF, $00, $02, $03
    _LBDB8:  .word $B000, $B057, $B0C1, $B12B

    ;Tourian music
    _LBDC0:  .byte $0B, $FF, $03, $00, $00
    _LBDC5:  .word $BE59, $BE47, $BE62, $0000

    .include "Sound_Engine_Common_2.asm"
.scend

;---------------------------------------- [ Not used ] ---------------------------------------------

;Not used.
Bank01_LBF56:  .byte $10, $07, $0E, $1C, $38, $70, $2A, $54, $15, $12, $02, $03, $20, $2C, $B4, $AD
Bank01_LBF66:  .byte $4D, $06, $8D, $8D, $06, $AD, $5E, $06, $A8, $B9, $2A, $BC, $A8, $A2, $00, $B9
Bank01_LBF76:  .byte $61, $BD, $9D, $2B, $06, $C8, $E8, $8A, $C9, $0D, $D0, $F3, $A9, $01, $8D, $40
Bank01_LBF86:  .byte $06, $8D, $41, $06, $8D, $42, $06, $8D, $43, $06, $A9, $00, $8D, $38, $06, $8D
Bank01_LBF96:  .byte $39, $06, $8D, $3A, $06, $8D, $3B, $06, $60, $FF, $00, $00, $00, $00, $00, $00
Bank01_LBFA6:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

;----------------------------------------------------------------------------------------------------

RESET_Bank01:
Bank01_LBFB0:  SEI                     ;Disables interrupt.
Bank01_LBFB1:  CLD                     ;Sets processor to binary mode.
Bank01_LBFB2:  LDX #$00                ;
Bank01_LBFB4:  STX PPUControl0         ;Clear PPU control registers.
Bank01_LBFB7:  STX PPUControl1         ;
Bank01_LBFBA:* LDA PPUStatus           ;
Bank01_LBFBD:  BPL -                   ;Wait for VBlank.
Bank01_LBFBF:* LDA PPUStatus           ;
Bank01_LBFC2:  BPL -                   ;
Bank01_LBFC4:  ORA #$FF                ;
Bank01_LBFC6:  STA MMC1Reg0            ;Reset MMC1 chip.
Bank01_LBFC9:  STA MMC1Reg1            ;(MSB is set).
Bank01_LBFCC:  STA MMC1Reg2            ;
Bank01_LBFCF:  STA MMC1Reg3            ;
Bank01_LBFD2:  JMP Startup             ;($C01A)Does preliminry housekeeping.

;----------------------------------------------------------------------------------------------------

;Not used.
Bank01_LBFD5:  .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00
Bank01_LBFE5:  .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Bank01_LBFF5:  .byte $00, $00, $00, $00, $00

;----------------------------------------------------------------------------------------------------

;Interrupt vectors.
.word NMI                      ;($C0D9)NMI vector.
.word RESET_Bank01             ;($FFB0)Reset vector.
.word RESET_Bank01             ;($FFB0)IRQ vector.