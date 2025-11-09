;----------------------------------------------------------------------------------------------------

_ItmRmTriData:
  .byte $C8               ;
  .byte $B0               ;3/32 seconds   +
  .byte $38               ;E3             |
  .byte $3A               ;F3             |
  .byte $3C               ;F#3            |
  .byte $3E               ;G3             |
  .byte $40               ;Ab3            | Repeat 8 times
  .byte $3E               ;G3             |
  .byte $3C               ;F#3            |
  .byte $3A               ;F3             |
  .byte $B6               ;1 3/16 seconds |
  .byte $02               ;no sound       +
  .byte $FF               ;

_ItmRmSQ1Data:
  .byte $B8               ;1/4 seconds
  .byte $02               ;No sound

_ItmRmSQ2Data:
  .byte $B3               ;3/4 seconds
  .byte $02               ;No sound
  .byte $B2               ;3/8 seconds
  .byte $74               ;A#6
  .byte $02               ;No sound
  .byte $6A               ;F5
  .byte $02               ;No sound
  .byte $72               ;A6
  .byte $02               ;No sound
  .byte $62               ;C#5
  .byte $B4               ;1 1/2 seconds
  .byte $02               ;No sound
  .byte $B2               ;3/8 seconds
  .byte $60               ;C5
  .byte $02               ;No sound
  .byte $6C               ;F#5
  .byte $02               ;No sound
  .byte $76               ;B6
  .byte $B3               ;3/4 seconds
  .byte $02               ;No sound
  .byte $B2               ;3/8 seconds
  .byte $7E               ;F6
  .byte $02               ;No sound
  .byte $7C               ;D6
  .byte $B3               ;3/4 seconds
  .byte $02               ;No sound
  .byte $00               ;End item room music.

_PwrUpSQ1Data:
  .byte $B3               ;1/2 seconds
  .byte $48               ;C4
  .byte $42               ;A4
  .byte $B2               ;1/4 seconds
  .byte $3E               ;G3
  .byte $38               ;E3
  .byte $30               ;C3
  .byte $38               ;E3
  .byte $4C               ;D4
  .byte $44               ;A#4
  .byte $3E               ;G3
  .byte $36               ;D#3
  .byte $C8               ;
  .byte $B0               ;1/16 seconds   +
  .byte $38               ;E3             | Repeat 8 times
  .byte $3C               ;F#3            +
  .byte $FF

_PwrUpTriData:
  .byte $B4               ;1 second
  .byte $2C               ;A#3
  .byte $2A               ;A3
  .byte $1E               ;D#2
  .byte $1C               ;D2

_PwrUpSQ2Data:
  .byte $B2               ;1/4 seconds
  .byte $22               ;F2
  .byte $2C               ;A#3
  .byte $30               ;C3
  .byte $34               ;D3
  .byte $38               ;E3
  .byte $30               ;C3
  .byte $26               ;G2
  .byte $30               ;C3
  .byte $3A               ;F3
  .byte $34               ;D3
  .byte $2C               ;A#3
  .byte $26               ;G2
  .byte $B4               ;1 second
  .byte $2A               ;A3
  .byte $00               ;End power up music.

_FadeInSQ2Data:
  .byte $C4
  .byte $B0               ;3/32 seconds   +
  .byte $3E               ;G3             | Repeat 4 times
  .byte $30               ;C3             +
  .byte $FF               ;
  .byte $C4               ;
  .byte $42               ;A4             + Repeat 4 times
  .byte $30               ;C3             +
  .byte $FF               ;
  .byte $C4               ;
  .byte $3A               ;F3             + Repeat 4 times
  .byte $2C               ;A#3            +
  .byte $FF               ;
  .byte $C4               ;
  .byte $38               ;E3             + Repeat 4 times
  .byte $26               ;G2             +
  .byte $FF               ;
  .byte $C4               ;
  .byte $34               ;D3             + Repeat 4 times
  .byte $20               ;E2             +
  .byte $FF               ;
  .byte $E0               ;
  .byte $34               ;D3             + Repeat 32 times
  .byte $24               ;F#2            +
  .byte $FF               ;

_FadeInTriData:
  .byte $B3               ;3/4 seconds
  .byte $36               ;D#3
  .byte $34               ;D3
  .byte $30               ;C3
  .byte $2A               ;A3
  .byte $B4               ;1 1/2 seconds
  .byte $1C               ;D2
  .byte $1C               ;D2

_FadeInSQ1Data:
  .byte $B3               ;3/4 seconds
  .byte $34               ;D3
  .byte $3A               ;F3
  .byte $34               ;D3
  .byte $30               ;C3
  .byte $B4               ;1 1/2 seconds
  .byte $2A               ;A3
  .byte $2A               ;A3
  .byte $00               ;End fade in music.

_TourianSQ2Data:
  .byte $B4               ;1 1/2 seconds
  .byte $12               ;A2
  .byte $B3               ;3/4 seconds
  .byte $10               ;Ab1
  .byte $18               ;C2
  .byte $16               ;B2
  .byte $0A               ;F1
  .byte $B4               ;1 1/2 seconds
  .byte $14               ;A#2
  .byte $12               ;A2
  .byte $B3               ;3/4 seconds
  .byte $10               ;Ab1
  .byte $06               ;D1
  .byte $0E               ;G1
  .byte $04               ;C#1
  .byte $B4               ;1 1/2 seconds
  .byte $0C               ;F#1
  .byte $00               ;End Tourian music.

_TourianSQ1Data:
  .byte $E0               ;
  .byte $B0               ;3/32 seconds   +
  .byte $54               ;F#4            |
  .byte $4E               ;D#4            |
  .byte $48               ;C4             | Repeat 32 times
  .byte $42               ;A4             |
  .byte $48               ;C4             |
  .byte $4E               ;D#4            +
  .byte $FF               ;

_TourianTriData:
  .byte $E0               ;
  .byte $B3               ;3/4 seconds    +
  .byte $02               ;No sound       |
  .byte $B0               ;3/32 seconds   |
  .byte $3C               ;F#3            |
  .byte $40               ;Ab3            |
  .byte $44               ;A#4            |
  .byte $4A               ;C#4            |
  .byte $4E               ;D#4            |
  .byte $54               ;F#4            |
  .byte $58               ;Ab4            | Repeat 32 times
  .byte $5C               ;A#5            |
  .byte $62               ;C#5            |
  .byte $66               ;D#5            |
  .byte $6C               ;F#5            |
  .byte $70               ;Ab5            |
  .byte $74               ;A#6            |
  .byte $7A               ;C#6            |
  .byte $B3               ;3/4 seconds    |
  .byte $02               ;No sound       +
  .byte $FF

;----------------------------------------------------------------------------------------------------

;The following table contains the musical notes used by the music player.  The first byte is
;the period high information(3 bits) and the second byte is the period low information(8 bits).
;The formula for figuring out the frequency is as follows: 1790000/16/(hhhllllllll + 1)

_MusicNotesTbl:
  .byte $07, $F0          ;55.0Hz  (A1)  SQ1/SQ2 (A0)  TRI - Index #$00 (Not used)
  .byte $00, $00          ;No sound                          Index #$02
  .byte $06, $4E          ;69.3Hz  (C#2) SQ1/SQ2 (C#1) TRI - Index #$04
  .byte $05, $F3          ;73.4Hz  (D2)  SQ1/SQ2 (D1)  TRI - Index #$06
  .byte $05, $4D          ;82.4Hz  (E2)  SQ1/SQ2 (E1)  TRI - Index #$08
  .byte $05, $01          ;87.3Hz  (F2)  SQ1/SQ2 (F1)  TRI - Index #$0A
  .byte $04, $B9          ;92.5Hz  (F#2) SQ1/SQ2 (F#1) TRI - Index #$0C
  .byte $04, $75          ;98.0Hz  (G2)  SQ1/SQ2 (G1)  TRI - Index #$0E
  .byte $04, $35          ;103.8Hz (Ab2) SQ1/SQ2 (Ab1) TRI - Index #$10
  .byte $03, $F8          ;110.0Hz (A2)  SQ1/SQ2 (A1)  TRI - Index #$12
  .byte $03, $BF          ;116.5Hz (A#2) SQ1/SQ2 (A#1) TRI - Index #$14
  .byte $03, $89          ;123.5Hz (B2)  SQ1/SQ2 (B1)  TRI - Index #$16
  .byte $03, $57          ;130.7Hz (C3)  SQ1/SQ2 (C2)  TRI - Index #$18
  .byte $03, $27          ;138.5Hz (C#3) SQ1/SQ2 (C#2) TRI - Index #$1A
  .byte $02, $F9          ;146.8Hz (D3)  SQ1/SQ2 (D2)  TRI - Index #$1C
  .byte $02, $CF          ;155.4Hz (D#3) SQ1/SQ2 (D#2) TRI - Index #$1E
  .byte $02, $A6          ;164.8Hz (E3)  SQ1/SQ2 (E2)  TRI - Index #$20
  .byte $02, $80          ;174.5Hz (F3)  SQ1/SQ2 (F2)  TRI - Index #$22
  .byte $02, $5C          ;184.9Hz (F#3) SQ1/SQ2 (F#2) TRI - Index #$24
  .byte $02, $3A          ;196.0Hz (G3)  SQ1/SQ2 (G2)  TRI - Index #$26
  .byte $02, $1A          ;207.6Hz (Ab3) SQ1/SQ2 (Ab2) TRI - Index #$28
  .byte $01, $FC          ;219.8Hz (A3)  SQ1/SQ2 (A2)  TRI - Index #$2A
  .byte $01, $DF          ;233.1Hz (A#3) SQ1/SQ2 (A#2) TRI - Index #$2C
  .byte $01, $C4          ;247.0Hz (B3)  SQ1/SQ2 (B2)  TRI - Index #$2E
  .byte $01, $AB          ;261.4Hz (C4)  SQ1/SQ2 (C3)  TRI - Index #$30
  .byte $01, $93          ;276.9Hz (C#4) SQ1/SQ2 (C#3) TRI - Index #$32
  .byte $01, $7C          ;293.6Hz (D4)  SQ1/SQ2 (D3)  TRI - Index #$34
  .byte $01, $67          ;310.8Hz (D#4) SQ1/SQ2 (D#3) TRI - Index #$36
  .byte $01, $52          ;330.0Hz (E4)  SQ1/SQ2 (E3)  TRI - Index #$38
  .byte $01, $3F          ;349.6Hz (F4)  SQ1/SQ2 (F3)  TRI - Index #$3A
  .byte $01, $2D          ;370.4Hz (F#4) SQ1/SQ2 (F#3) TRI - Index #$3C
  .byte $01, $1C          ;392.5Hz (G4)  SQ1/SQ2 (G3)  TRI - Index #$3E
  .byte $01, $0C          ;415.9Hz (Ab4) SQ1/SQ2 (Ab3) TRI - Index #$40
  .byte $00, $FD          ;440.4Hz (A4)  SQ1/SQ2 (A3)  TRI - Index #$42
  .byte $00, $EE          ;468.1Hz (A#4) SQ1/SQ2 (A#3) TRI - Index #$44
  .byte $00, $E1          ;495.0Hz (B4)  SQ1/SQ2 (B3)  TRI - Index #$46
  .byte $00, $D4          ;525.2Hz (C5)  SQ1/SQ2 (C4)  TRI - Index #$48
  .byte $00, $C8          ;556.6Hz (C#5) SQ1/SQ2 (C#4) TRI - Index #$4A
  .byte $00, $BD          ;588.8Hz (D5)  SQ1/SQ2 (D4)  TRI - Index #$4C
  .byte $00, $B2          ;625.0Hz (D#5) SQ1/SQ2 (D#4) TRI - Index #$4E
  .byte $00, $A8          ;662.0Hz (E5)  SQ1/SQ2 (E4)  TRI - Index #$50
  .byte $00, $9F          ;699.2Hz (F5)  SQ1/SQ2 (F4)  TRI - Index #$52
  .byte $00, $96          ;740.9Hz (F#5) SQ1/SQ2 (F#4) TRI - Index #$54
  .byte $00, $8D          ;787.9Hz (G5)  SQ1/SQ2 (G4)  TRI - Index #$56
  .byte $00, $85          ;834.9Hz (Ab5) SQ1/SQ2 (Ab4) TRI - Index #$58
  .byte $00, $7E          ;880.9HZ (A5)  SQ1/SQ2 (A4)  TRI - Index #$5A
  .byte $00, $76          ;940.1Hz (A#5) SQ1/SQ2 (A#4) TRI - Index #$5C
  .byte $00, $70          ;990.0Hz (B5)  SQ1/SQ2 (B4)  TRI - Index #$5E
  .byte $00, $69          ;1055Hz  (C6)  SQ1/SQ2 (C5)  TRI - Index #$60
  .byte $00, $63          ;1118Hz  (C#6) SQ1/SQ2 (C#5) TRI - Index #$62
  .byte $00, $5E          ;1178Hz  (D6)  SQ1/SQ2 (D5)  TRI - Index #$64
  .byte $00, $58          ;1257Hz  (D#6) SQ1/SQ2 (D#5) TRI - Index #$66
  .byte $00, $53          ;1332Hz  (E6)  SQ1/SQ2 (E5)  TRI - Index #$68
  .byte $00, $4F          ;1398Hz  (F6)  SQ1/SQ2 (F5)  TRI - Index #$6A
  .byte $00, $4A          ;1492Hz  (F#6) SQ1/SQ2 (F#5) TRI - Index #$6C
  .byte $00, $46          ;1576Hz  (G6)  SQ1/SQ2 (G5)  TRI - Index #$6E
  .byte $00, $42          ;1670Hz  (Ab6) SQ1/SQ2 (Ab5) TRI - Index #$70
  .byte $00, $3E          ;1776Hz  (A6)  SQ1/SQ2 (A5)  TRI - Index #$72
  .byte $00, $3A          ;1896Hz  (A#6) SQ1/SQ2 (A#5) TRI - Index #$74
  .byte $00, $37          ;1998Hz  (B6)  SQ1/SQ2 (B5)  TRI - Index #$76
  .byte $00, $34          ;2111Hz  (C7)  SQ1/SQ2 (C6)  TRI - Index #$78
  .byte $00, $31          ;2238Hz  (C#7) SQ1/SQ2 (C#6) TRI - Index #$7A
  .byte $00, $2E          ;2380Hz  (D7)  SQ1/SQ2 (D6)  TRI - Index #$7C
  .byte $00, $27          ;2796Hz  (F7)  SQ1/SQ2 (F6)  TRI - Index #$7E

;----------------------------------------------------------------------------------------------------

;The following tables are used to load the music frame count addresses ($0640 thru $0643). The
;larger the number, the longer the music will play a solid note.  The number represents how
;many frames the note will play.  There is a small discrepancy in time length because the
;Nintendo runs at 60 frames pers second and I am using 64 frames per second to make the
;numbers below divide more evenly.

;Used by power up music and Kraid area music.

_NoteLengths0Tbl:
  .byte $04               ;About    1/16 seconds ($B0)
  .byte $08               ;About    1/8  seconds ($B1)
  .byte $10               ;About    1/4  seconds ($B2)
  .byte $20               ;About    1/2  seconds ($B3)
  .byte $40               ;About 1       seconds ($B4)
  .byte $18               ;About    3/8  seconds ($B5)
  .byte $30               ;About    3/4  seconds ($B6)
  .byte $0C               ;About    3/16 seconds ($B7)
  .byte $0B               ;About   11/64 seconds ($B8)
  .byte $05               ;About    5/64 seconds ($B9)
  .byte $02               ;About    1/32 seconds ($BA)

;Used by item room, fade in, Brinstar music, Ridley area music, Mother brain music,
;escape music, Norfair music and Tourian music.

_NoteLengths1Tbl:
  .byte $06               ;About    3/32 seconds ($B0)
  .byte $0C               ;About    3/16 seconds ($B1)
  .byte $18               ;About    3/8  seconds ($B2)
  .byte $30               ;About    3/4  seconds ($B3)
  .byte $60               ;About 1  1/2  seconds ($B4)
  .byte $24               ;About    9/16 seconds ($B5)
  .byte $48               ;About 1  3/16 seconds ($B6)
  .byte $12               ;About    9/32 seconds ($B7)
  .byte $10               ;About    1/4  seconds ($B8)
  .byte $08               ;About    1/8  seconds ($B9)
  .byte $03               ;About    3/64 seconds ($BA)

;Used by intro and end game music.

_NoteLengths2Tbl:
  .byte $10               ;About    1/4  seconds ($B0)
  .byte $07               ;About    7/64 seconds ($B1)
  .byte $0E               ;About    7/32 seconds ($B2)
  .byte $1C               ;About    7/16 seconds ($B3)
  .byte $38               ;About    7/8  seconds ($B4)
  .byte $70               ;About 1 13/16 seconds ($B5)
  .byte $2A               ;About   21/32 seconds ($B6)
  .byte $54               ;About 1  5/16 seconds ($B7)
  .byte $15               ;About   21/64 seconds ($B8)
  .byte $12               ;About    9/32 seconds ($B9)
  .byte $02               ;About    1/32 seconds ($BA)
  .byte $03               ;About    3/64 seconds ($BB)

;----------------------------------------------------------------------------------------------------

_InitializeMusic_Bank00:                    
  JSR _CheckMusicFlags     ;($B3FC)Check to see if restarting current music.

  LDA CurrentSFXFlags     ;Load current SFX flags and store CurrentMusic address.
  nop                     ;TODO - Get rid of this
  STA CurrentMusic        ;

  LDA MusicInitIndex      ;Get the index for the music data to start.
  TAY                     ;
  LDA _InitMusicIndexTbl,Y ;($BBFA)Find index for music in InitMusicInitIndexTbl.
  TAY                     ;

  LDX #$00                ;Zero out index.

* LDA _InitMusicTbl,Y      ;Base is $BD31.
  STA NoteLenTblOffset,X  ;
  INY                     ;The following loop repeats 13 times to
  INX                     ;load the initial music addresses 
  TXA                     ;(registers $062B thru $0637).
  CMP #$0D                ;
  BNE -                   ;

  LDA #$01                ;
  STA SQ1MusicFrameCnt    ;Resets addresses $0640 thru $0643 to #$01.
  STA SQ2MusicFrameCnt    ;These addresses are used for counting the
  STA TriMusicFrameCnt    ;number of frames music channels have been playing.
  STA NseMusicFrameCnt    ;

  LDA #$00                ;
  STA SQ1MusicIdxIdx      ;
  STA SQ2MusicIdxIdx      ;Resets addresses $0638 thru $063B to #$00.
  STA TriMusicIdxIdx      ;These are the index to find sound channel data index.
  STA NoiseMusicIdxIdx    ;
  RTS                     ;

;----------------------------------------------------------------------------------------------------