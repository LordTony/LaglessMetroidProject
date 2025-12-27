;SFXdata. The top four entries are used by the noise music player for drum beats.

_SFXDatTbl:
    .byte $00               ;Base for drum beat music data.
_DrumBeat00SFXData:
    .byte $10, $01, $18     ;Noise channel music data #$01.
_DrumBeat01SFXData:
    .byte $00, $01, $38     ;Noise channel music data #$04.
_DrumBeat02SFXData:
    .byte $01, $02, $40     ;Noise channel music data #$07.
_DrumBeat03SFXData:
    .byte $00, $09, $58     ;Noise channel music data #$0A.
_GamePausedSFXData:
    .byte $80, $7F, $80, $48
_ScrewAttSFXData:
    .byte $35, $7F, $00, $B0
_MissileLaunchSFXData:
    .byte $19, $7F, $0E, $A0
_BombExplodeSFXData:
    .byte $0D, $7F, $0F, $08
_SamusWalkSFXData:
    .byte $16, $7F, $0B, $18
_SpitFlameSFXData:
    .byte $13, $7F, $0E, $F8
_SamusHitSQ1SQ2SFXData:
    .byte $C1, $89, $02, $0F
_BossHitSQ2SFXData:
    .byte $34, $BA, $E0, $05
_BossHitSQ1SFXData:
    .byte $34, $BB, $CE, $05
_IncorrectPasswordSQ1SFXData:
    .byte $B6, $7F, $00, $C2
_IncorrectPasswordSQ2SFXData:
    .byte $B6, $7F, $04, $C2
_TimeBombTickSFXData:
    .byte $17, $7F, $66, $89
_EnergyPickupSFXData:
    .byte $89, $7F, $67, $18
_MissilePickupSFXData:
    .byte $8B, $7F, $FD, $28
_MetalSFXData:
    .byte $02, $7F, $A8, $F8
_LongRangeShotSFXData:
    .byte $D7, $83, $58, $F8
_ShortRangeShotSFXData:
    .byte $D6, $82, $58, $F8
_JumpSFXData:
    .byte $95, $8C, $40, $B9
_EnemyHitSFXData:
    .byte $1D, $9A, $20, $8F
_BugOutOFHoleSFXData:
    .byte $16, $8D, $E0, $42
_WaveBeamSFXData:
    .byte $19, $7F, $6F, $40
_IceBeamSFXData:
    .byte $18, $7F, $80, $40
_BombLaunch1SFXData:
    .byte $07, $7F, $40, $28
_BombLaunch2SFXData:
    .byte $07, $7F, $45, $28
_SamusToBallSFXData:
    .byte $7F, $7F, $DD, $3B
_MetroidHitSFXData:
    .byte $7F, $7F, $FF, $98
_SamusDieSFXData:
    .byte $7F, $7F, $40, $08
_SamusBeepSFXData:
    .byte $09, $7F, $30, $48
_BigEnemyHitSFXData:
    .byte $03, $7F, $42, $18
_StatueRaiseSFXData:
    .byte $03, $7F, $11, $09
_DoorSFXData:
    .byte $7F, $7F, $30, $B2

;----------------------------------------------------------------------------------------------------

;The following table is used by the CheckSFXFlag routine.  The first two bytes of each row
;are the address of the pointer table used for handling SFX and music  routines for set flags.
;The second pair of bytes is the address of the routine to next jump to if no SFX or music
;flags were found.  The final byte represents what type of channel is currently being
;processed: 0=Noise, 1=SQ1, 3=Triangle, 4=Multiple channels.

_ChooseNextSFXRoutineTbl:

_NseInitDat:
  .word _NseInitTbl, _NseSFXContFlags        ;Noise init SFX(1st).
  .byte CHN_NOISE

_NseContDat:
  .word _NseContTbl, _NoSound                ;Noise continue SFX (2nd).
  .byte CHN_NOISE

_SQ1InitDat:
  .word _SQ1InitTbl, _SQ1SFXContFlags        ;SQ1 init SFX(5th).
  .byte CHN_SQ1

_SQ1ContDat:
  .word _SQ1ContTbl, _NoSound                ;SQ1 continue SFX(6th).
  .byte CHN_SQ1

_TriInitDat:
  .word _TriInitTbl, _TriSFXContFlags        ;Triangle init SFX(7th).
  .byte CHN_TRI

_TriContDat:
  .word _TriContTbl, _NoSound                ;Triangle continue SFX(8th).
  .byte CHN_TRI

_MultiInitDat:
  .word _MultiMusInitTbl, _MultiSFXContFlags ;Multi init SFX(3rd).
  .byte CHN_MULTI

_MultiContDat:
  .word _MultiSFXContTbl, _LoadSQ1Flags      ;Multi continue SFX(4th).
  .byte CHN_MULTI

_TmpInitDat:
  .word _MusicInitTbl, _ContinueMusic        ;temp flag Music(10th).
  .byte CHN_NOISE

_MusicInitDat:
  .word _MusicInitTbl, _LoadMusicInitFlags   ;Music(9th).
  .byte CHN_NOISE

;----------------------------------------------------------------------------------------------------

;The tables below contain addresses for SFX handling routines.

;Noise Init SFX handling routine addresses:
_NseInitTbl:
  .word _NoSound           ;No sound.
  .word _ScrwAtkSFXStart   ;Screw attack init SFX.
  .word _MslLnchSFXStart   ;Missile launch init SFX.
  .word _BmbExpldSFXStart  ;Bomb explode init SFX.
  .word _SmuWlkSFXStart    ;Samus walk init SFX.
  .word _SptFlmSFXStart    ;Spit flame init SFX.
  .word _NoSound           ;No sound.
  .word _NoSound           ;No sound.

;Noise Continue SFX handling routine addresses:
_NseContTbl:
  .word _NoSound           ;No sound.
  .word _ScrwAtkSFXCont    ;Screw attack continue SFX.
  .word _MslLnchSFXCont    ;Missile launch continue SFX.
  .word _NoiseSFXCont      ;Bomb explode continue SFX.
  .word _NoiseSFXCont      ;Samus walk continue SFX.
  .word _SptFlmSFXCont     ;Spit flame continue SFX.
  .word _NoSound           ;No sound.
  .word _NoSound           ;No sound.

;SQ1 Init SFX handling routine addresses:
_SQ1InitTbl:
  .word _MslPkupSFXStart   ;Missile pickup init SFX.
  .word _EnrgyPkupSFXStart ;Energy pickup init SFX.
  .word _MetalSFXStart     ;Metal init SFX.
  .word _BltFireSFXStart   ;Bullet fire init SFX.
  .word _EnRegenSFXStart   ;Enemy regenerate init SFX.
  .word _EnHitSFXStart     ;Enemy hit init SFX.
  .word _SmsJumpSFXStart   ;Samus jump init SFX.
  .word _WvBeamSFXStart    ;Wave beam init SFX.

;SQ1 Continue SFX handling routine addresses:
_SQ1ContTbl:
  .word _MslPkupSFXCont    ;Missile pickup continue SFX.
  .word _EnrgyPkupSFXCont  ;Energy pickup continue SFX.
  .word _SQ1SFXCont        ;Metal continue SFX.
  .word _BltFireSFXCont    ;Bullet fire continue SFX.
  .word _SQ1SFXCont        ;Enemy regenerate continue SFX.
  .word _SQ1SFXCont        ;Enemy hit continue SFX.
  .word _SQ1SFXCont        ;Samus jump continue SFX.
  .word _WvBeamSFXCont     ;Wave beam continue SFX.

;Triangle init handling routine addresses:
_TriInitTbl:
  .word _SmsDieSFXStart    ;Samus die init SFX.
  .word _DoorSFXStart      ;Door open close init SFX.
  .word _MtrdHitSFXStart   ;Metroid hit init SFX.
  .word _StRaiseSFXStart   ;Statue raise init SFX.
  .word _BeepSFXStart      ;Beep init SFX.
  .word _BigEnHitSFXStart  ;Big enemy hit init SFX.
  .word _SmsBallSFXStart   ;Samus to ball init SFX.
  .word _BmbLaunchSFXStart ;Bomb launch init SFX.

;Triangle continue handling routine addresses:
_TriContTbl:
  .word _SmsDieSFXCont     ;Samus die continue SFX.
  .word _DoorSFXCont       ;Door open close continue SFX.
  .word _MtrdHitSFXCont    ;Metroid hit continue SFX.
  .word _StRaiseSFXCont    ;Statue raise continue SFX.
  .word _BeepSFXCont       ;Beep continue SFX.
  .word _BigEnHitSFXCont   ;Big enemy hit continue SFX.
  .word _SmsBallSFXCont    ;Samus to ball continue SFX.
  .word _BmbLaunchSFXCont  ;Bomb launch continue SFX.

;----------------------------------------------------------------------------------------------------
_NseSFXInitFlags:
  LDA NoiseSFXFlag        ;Load A with Noise init SFX flags, (1st SFX cycle).
  LDX #<_NseInitDat        ;Lower address byte in ChooseNextSFXRoutineTbl.
  BNE _GotoSFXCheckFlags   ;Branch always.

_NseSFXContFlags:
  LDA NoiseContSFX        ;Load A with Noise continue flags, (2nd SFX cycle).
  LDX #<_NseContDat        ;Lower address byte in ChooseNextSFXRoutineTbl.
  BNE _GotoSFXCheckFlags   ;Branch always.

_SQ1SFXInitFlags:
  LDA SQ1SFXFlag          ;Load A with SQ1 init flags, (5th SFX cycle).
  LDX #<_SQ1InitDat        ;Lower address byte in ChooseNextSFXRoutineTbl.
  BNE _GotoSFXCheckFlags   ;Branch always.

_SQ1SFXContFlags:
  LDA SQ1ContSFX          ;Load A with SQ1 continue flags, (6th SFX cycle).
  LDX #<_SQ1ContDat        ;Lower address byte in ChooseNextSFXRoutineTbl.

_GotoSFXCheckFlags:
  JSR _CheckSFXFlag        ;($B4BD)Checks to see if SFX flags set.     
  JMP (SFXPtrE2_)         ;if no flag found, Jump to next SFX cycle,
                                ;else jump to specific SFX handling routine.
_STriSFXInitFlags:
  LDA TriangleSFXFlag     ;Load A with Triangle init flags, (7th SFX cycle).
  LDX #<_TriInitDat        ;Lower address byte in ChooseNextSFXRoutineTbl.
  BNE _GotoSFXCheckFlags   ;Brach always.

_TriSFXContFlags:
  LDA TriangleContSFX     ;Load A with Triangle continue flags, (8th SFX cycle).
  LDX #<_TriContDat        ;Lower address byte in ChooseNextSFXRoutineTbl.
  BNE _GotoSFXCheckFlags   ;Branch always.

_LdMultiSFXInitFlags:
  LDA MultiSFXFlag        ;Load A with Multi init flags, (3rd SFX cycle).
  LDX #<_MultiInitDat      ;Lower address byte in ChooseNextSFXRoutineTbl.
  JSR _CheckSFXFlag        ;($B4BD)Checks to see if SFX or music flags set.
;----------------------------------------------------------------------------------------------------

;MusicInitIndex values correspond to the following music:
;#$00=Ridley area music, #$01=Tourian music, #$02=Item room music, #$03=Kraid area music,
;#$04=Norfair music, #$05=Escape music, #$06=Mother brain music, #$07=Brinstar music,
;#$08=Fade in music, #$09=Power up music, #$0A=End game music, #$0B=Intro music.

.scope
  _FindMusicInitIndex:
    LDA #$FF                ;Load MusicInitIndex with #$FF.
    STA MusicInitIndex      ;

    LDA CurrentSFXFlags     ;Branch to exit if no SFX flags set for Multi SFX.
    BEQ _EndMusInit          ;

  * INC MusicInitIndex      ;Shift left until bit flag is in carry bit.
    ASL                     ;Loop until SFX flag found.  Store bit
    BCC -                   ;number of music in MusicInitIndex.

  _EndMusInit:
.scend

  ;The following routine is used to add eight to the music index when looking for music flags
  ;in the MultiSFX address.  
  _Add8:
    LDA MusicInitIndex      ;
    ADC #$07                ;Add #$08 to MusicInitIndex.
    STA MusicInitIndex      ;

  JMP (SFXPtrE2_)         ;If no flag found, Jump to next SFX cycle,
                                ;else jump to specific SFX handling subroutine.
_MultiSFXContFlags:
  LDA MultiContSFX        ;Load A with $68C flags (4th SFX cycle).
  LDX #<_MultiContDat      ;Lower address byte in ChooseNextSFXRoutineTbl.
  JMP _GotoSFXCheckFlags   ;($B337)Checks to see if SFX or music flags set.

_LoadSQ1Flags:
  JMP _SQ1SFXInitFlags      ;($B329)Check for SQ1 init flags.

;----------------------------------------------------------------------------------------------------

_LoadSQ1ChannelSFX:              ;Used to determine which sound registers to change
  LDA #<SQ1Cntrl0         ;($4000 - $4003) - SQ1.
  BEQ +                   ;Branch always.

_LoadTriChannelSFX:              ;Used to determine which sound registers to change
  LDA #<TriangleCntrl0    ;($4008 - $400B) - Triangle.
  BNE +                   ;Branch always.

_LoadNoiseChannelSFX:            ;Used to determine which sound registers to change
  LDA #<NoiseCntrl0       ;($400C - $400F) - Noise.
  BNE +                   ;Branch always.

_LoadSQ2ChannelSFX:              ;Used to determine which sound registers to change
  LDA #<SQ2Cntrl0         ;($4004 - $4007) - SQ2.

_LoadSFXData:
* STA SFXPtrE0LB          ;Lower address byte of desired APU control register.
  LDA #>APUCntrl          ;
  STA SFXPtrE0UB          ;Upper address byte of desired APU control register.

  STY SFXPtrE2LB          ;Lower address byte of data to load into sound channel.

  LDA #>_SFXDatTbl         ;Upper address byte of data to load into sound channel.
  STA SFXPtrE2UB          ;

  LDY #$00                ;Starting index for loading four byte sound data.

_LoadSFXRegisters:
  LDA (SFXPtrE2),Y        ;Load A with SFX data byte.
  STA (SFXPtrE0),Y        ;Store A in SFX register.
  INY                     ;
  LDA (SFXPtrE2),Y        ;Load A with SFX data byte.
  STA (SFXPtrE0),Y        ;Store A in SFX register.

  INY                     ;
  CPY #$04                ;channel are loaded one after the other (the loop
  BNE _LoadSFXRegisters    ;repeats four times).
  RTS                     ;
;----------------------------------------------------------------------------------------------------

_PauseSFX:
    INC SFXPaused           ;SFXPaused=#$01
    JSR _ClearSounds         ;($B43E)Clear sound registers of data.      
    STA PauseSFXStatus      ;PauseSFXStatus=#$00
    RTS                     ;

_ChkPausedSFX:
    LDA SFXPaused           ;Has SFXPaused been set? if not, branch
    BEQ _PauseSFX            ;

    LDA PauseSFXStatus      ;For the first #$12 frames after the game has been
    CMP #$12                ;paused, play GamePaused SFX.  If paused for #$12
    BEQ _EndGamePaused       ;frames or more, branch to exit.

    AND #$03                ;
    CMP #$03                ;Every fourth frame, repeat GamePaused SFX
    BNE +                   ;

    LDY #<_GamePausedSFXData ;Lower address byte of GamePaused SFX data(Base=$B200)
    JSR _LoadSQ1ChannelSFX   ;($B368) Load GamePaused SFX data.

*   INC PauseSFXStatus      ;Completed another frame of pause SFX.

_EndGamePaused:
    RTS                     ;Exit paused game SFX routine.

;----------------------------------[ Sound Engine Entry Point ]-----------------------------------

;Sound engine entry point.

;NOTES:  
;SFX take priority over music.
;
;There are 10 SFX cycles run every time the sound engine subroutine is called.  The cycles
;search for set sound flags in the following registers in order:
;$680, $688, $684, $68C, $681, $689, $683, $68B, $65D, $685 
;
;The sound channels are assigned SFX numbers.  Those SFX numbers are:
;Noise=0, sq1=1, sq2=2, triangle=3, Multi=4
;The sound channels are assigned music numbers.  Those music numbers are:
;SQ1=0, SQ2=1, Triangle=2, Noise=3

.advance SoundEngineEntryPoint

    ; TODO: This could be set once when the game starts and it will never change
    LDY #$B2                ;
    STY SFXPtrE4UB          ;

    LDA #$C0                ;Set APU to 5 frame cycle, disable frame interrupt.
    STA APUCommonCntrl1     ;
    LDA NoiseSFXFlag        ;is bit zero is set in NoiseSFXFlag(Silence
    LSR                     ;music)?  If yes, branch.
    BCS ++                  ;
    LDA MainRoutine         ;
    CMP #$05                ;Is game paused?  If yes, branch.
    BEQ _ChkPausedSFX        ;
    LDA #$00                ;Clear SFXPaused when game is running.
    STA SFXPaused           ;
    JSR _NseSFXInitFlags     ;($B31B)Check noise SFX flags.
    JSR _LdMultiSFXInitFlags ;($B34B)Check multichannel SFX flags.
    JSR _STriSFXInitFlags    ;($B33D)Check triangle SFX flags.
    JSR _LoadMusicTempFlags  ;($BC36)Check music flags.

_ClearSFXFlags:
* LDA #$00                ;
  STA NoiseSFXFlag        ;
  STA SQ1SFXFlag          ;
  STA SQ2SFXFlag          ;Clear all SFX flags.
  STA TriangleSFXFlag     ;
  STA MultiSFXFlag        ;
  STA MusicInitFlag       ;
  RTS                     ;

* JSR _InitSoundAddresses  ;($B404)Prepare to start playing music.     
  BEQ --                  ;Branch always.

_CheckRepeatMusic:
  LDA MusicRepeat         ;
  BEQ +                   ;If music is supposed to repeat, reset music,
  LDA CurrentMusic        ;flags else branch to exit.
  STA CrntMusicRepeat     ;
  RTS                     ;

_CheckMusicFlags:
  LDA CurrentMusic        ;Loads A with current music flags and compares it
  CMP CurrentSFXFlags     ;with current SFX flags.  If both are equal,
  BEQ ++                  ;just clear music counters, else clear everything.

_InitSoundAddresses:             ;
.scope
  _ClrMusAndSFXAddrs:              ;
  *   LDA #$00                ;
      STA SQ1InUse            ;
      STA SQ2InUse            ;
      STA TriangleInUse       ;
      STA WrtMultiChnDat      ;
      STA NoiseContSFX        ;Clears any SFX or music 
      STA SQ1ContSFX          ;currently being played.
      STA SQ2ContSFX          ;
      STA TriangleContSFX     ;
      STA MultiContSFX        ;
      STA CurrentMusic        ;
.scend
  
JSR _ClearSounds         ;($B43E)all sound addresses in order to start

.scope
  _ClearSpecialAddrs:
*   LDA #$00                ;   
    STA TriCounterCntrl     ;Clears addresses used for repeating music,
    STA SFXPaused           ;pausing music and controlling triangle length.
    STA CrntMusicRepeat     ;
    STA MusicRepeat         ;
.scend

  RTS                     ;

_ClearSounds:             ;
  LDA #$10                ;
  STA SQ1Cntrl0           ;
  STA SQ2Cntrl0           ;
  STA NoiseCntrl0         ;Clears all sounds that might be in
  LDA #$00                ;The sound channel registers.
  STA TriangleCntrl0      ;
  STA DMCCntrl1           ;
  RTS                     ;

_SelectSFXRoutine:
  LDX ChannelType         ;
  STA NoiseSFXLength,X    ;Stores frame length of SFX in corresponding address.
  TXA                     ;
  BEQ ++                  ;Branch if SFX uses noise channel.
  CMP #$01                ;
  BEQ +                   ;Branch if SFX uses SQ1 channel.
  CMP #$02                ;
  BEQ _MusicBranch00       ;Branch if SFX uses SQ2 channel.
  CMP #$03                ;
  BEQ _MusicBranch01       ;Branch if SFX uses triangle wave.
  RTS                     ;Exit if SFX routine uses no channels.

* JSR _LoadSQ1ChannelSFX   ;($B368)Prepare to load SQ1 channel with data.
  BEQ ++                  ;Branch always.
_MusicBranch00:                  ;
  JSR _LoadSQ2ChannelSFX   ;($B374)Prepare to load SQ2 channel with data.
  BEQ ++                  ;Branch always.
_MusicBranch01:                  ;
  JSR _LoadTriChannelSFX   ;($B36C)Prepare to load triangle channel with data.
  BEQ ++                  ;Branch always.
* JSR _LoadNoiseChannelSFX ;($B370)Prepare to load noise channel with data.
* JSR _UpdateContFlags     ;($B493)Set continuation flags for this SFX.
  TXA                     ;
  STA NoiseInUse,X        ;Indicate sound channel is in use.
  LDA #$00                ;
  STA ThisNoiseFrame,X    ;
  STA NoiseSFXData,X      ;Clears all the following addresses before going
  STA MultiSFXData,X      ;to the proper SFX handling routine.
  STA ScrewAtkSFXData,X   ;
  STA WrtMultiChnDat      ;
  RTS                     ;

_UpdateContFlags:
* LDX ChannelType         ;Loads X register with sound channel just changed.
  LDA NoiseContSFX,X      ;Clear existing continuation SFX
  AND #$00                ;flags for that channel.
  ORA CurrentSFXFlags     ;Load new continuation flags.
  STA NoiseContSFX,X      ;Save results.
  RTS                     ;

_ClrCrntSFXFlags:
  LDA #$00                ;Once SFX has completed, this block clears the
  STA CurrentSFXFlags     ;SFX flag from the current flag register.
  BEQ -                   ;

_IncrementSFXFrame:
  LDX ChannelType         ;Load SFX channel number.
  INC ThisNoiseFrame,X    ;increment current frame to play on given channel.
  LDA ThisNoiseFrame,X    ;Load current frame to play on given channel.
  CMP NoiseSFXLength,X    ;Check to see if current frame is last frame to play.
  BNE +                   ;
  LDA #$00                ;If current frame is last frame,
  STA ThisNoiseFrame,X    ;reset current frame to 0.
* RTS                     ;

;The CheckSFXFlag routine loads E0 thru E3 with the below values:
;1st  SFX cycle $E0=#$BB,$E1=#$B2,$E2=#$22,$E3=#$B3.  Base address=$B289
;2nd  SFX cycle $E0=#$CB,$E1=#$B2,$E2=#$EE,$E3=#$B4.  Base address=$B28E
;3rd  SFX cycle $E0=#$06,$E1=#$BC,$E2=#$5C,$E3=#$B3.  Base address=$B2A7
;4th  SFX cycle $E0=#$16,$E1=#$BC,$E2=#$64,$E3=#$B3.  Base address=$B2AC
;5th  SFX cycle $E0=#$DB,$E1=#$B2,$E2=#$30,$E3=#$B3.  Base address=$B293
;6th  SFX cycle $E0=#$EB,$E1=#$B2,$E2=#$EE,$E3=#$B4.  Base address=$B298
;7th  SFX cycle $E0=#$FB,$E1=#$B2,$E2=#$44,$E3=#$B3.  Base address=$B29D
;8th  SFX cycle $E0=#$0B,$E1=#$B3,$E2=#$EE,$E3=#$B4.  Base address=$B2A2
;9th  SFX cycle $E0=#$26,$E1=#$BC,$E2=#$3D,$E3=#$BC.  Base address=$B2B6
;10th SFX cycle $E0=#$26,$E1=#$BC,$E2=#$4B,$E3=#$BC.  Base address=$B2B1

_CheckSFXFlag:
  STA CurrentSFXFlags     ;Store any set flags in some space zeropage.
  STX SFXPtrE4LB          
  LDY #$04                ;Y=0 for counting loop ahead.
  LDA (SFXPtrE4),Y        ;
  STA ChannelType         ;#$00=SQ1,#$01=SQ2,#$02=Triangle,#$03=Noise
  DEY
  LDA (SFXPtrE4),Y        ;
  STA $E3 
  DEY
  LDA (SFXPtrE4),Y
  STA $E2
  DEY
  LDA (SFXPtrE4),Y
  STA $E1
  DEY
  LDA (SFXPtrE4),Y
  STA $E0

  ;Y is zero at this point
  lax CurrentSFXFlags
  beq _NoSound
  bmi _SFXFlagFound
  asr #$F0
  beq _CheckLowNibble
  lsr
  lsr
  lsr
  tax
  ldy _SFXHiBitToIndex - 1, x
  lda (SFXPtrE0),Y
  sta SFXPtrE2LB
  iny
  lda (SFXPtrE0),Y
  sta SFXPtrE2UB
  rts

_CheckLowNibble:
  ldy _SFXLoBitToIndex,x

_SFXFlagFound:
  lda (SFXPtrE0),Y        ;This routine stores the starting address of the
  sta SFXPtrE2LB          ;specific SFX handling routine for the SFX flag 
  iny                     ;found.  The address is stored in registers
  lda (SFXPtrE0),Y        ;$E2 and $E3.
  sta SFXPtrE2UB          ;

_NoSound:
  rts

_SFXHiBitToIndex:
    .byte 6
    .byte 4
    .byte 4
    .byte 2
    .byte 2 
    .byte 2 
    .byte 2

_SFXLoBitToIndex:
    .byte 14
    .byte 14
    .byte 12
    .byte 12
    .byte 10
    .byte 10
    .byte 10
    .byte 10
    .byte 8
    .byte 8
    .byte 8
    .byte 8
    .byte 8
    .byte 8
    .byte 8
    .byte 8

nop
nop
nop
nop
nop
nop

;-----------------------------------[ SFX Handling Routines ]---------------------------------------

;The following table is used by the SpitFlamesSFXContinue routine to change the volume
;on the SFX.  It starts out quiet, then becomes louder then goes quiet again.
_SpitFlamesTbl:
  .byte $12, $13, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $1D, $1B, $1A, $19, $17
  .byte $16, $15, $14, $12

_SptFlmSFXStart:
  LDA #$14                ;Number of frames to play sound before a change.
  LDY #$21                ;Lower byte of sound data start address(base=$B200).
  JMP _SelectSFXRoutine    ;($B452)Setup registers for SFX.

_SptFlmSFXCont:
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE +                   ;If more frames to process, branch.
  JMP _EndNoiseSFX         ;($B58F)End SFX.
* LDY NoiseSFXData        ;
  LDA _SpitFlamesTbl,Y             ;Load data from table above and store in NoiseCntrl0.
  STA NoiseCntrl0         ;
  INC NoiseSFXData        ;Increment to next entry in data table.
  RTS 

_ScrwAtkSFXStart:
  LDA #$05                ;Number of frames to play sound before a change.
  LDY #$11                ;Lower byte of sound data start address(base=$B200).
  JSR _SelectSFXRoutine   ;($B452)Setup registers for SFX.
  LDA SoundEngineOrg+$13  ;#$00.
  STA NoiseSFXData        ;Clear NoiseSFXData.
* RTS                     ;

_ScrwAtkSFXCont:
  LDA ScrewAtkSFXData     ;Prevents period index from being incremented until
  CMP #$02                ;after the tenth frame of the SFX.
  BEQ +                   ;Branch if not ready to increment.
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE -                   ;
  INC ScrewAtkSFXData     ;Increment every fifth frame.
  RTS                     ;

* JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE _IncPeriodIndex      ;Start increasing period index after first ten frames.
  DEC NoiseSFXData        ;
  DEC NoiseSFXData        ;Decrement NoiseSFXData by three every fifth frame.
  DEC NoiseSFXData        ;
  INC MultiSFXData        ;Increment MultiSFXData.  When it is equal to #$0F
  LDA MultiSFXData        ;end screw attack SFX.  MultiSFXData does not
  CMP #$0F                ;appear to be linked to multi SFX channels in
  BNE --                  ;this routine.
  JMP _EndNoiseSFX         ;($B58F)End SFX.

_IncPeriodIndex:
  INC NoiseSFXData        ;Incrementing the period index has the effect of
  LDA NoiseSFXData        ;lowering the frequency of the noise SFX.
  STA NoiseCntrl2         ;
  RTS                     ;

_MslLnchSFXStart:
  LDA #$18                ;Number of frames to play sound before a change.
  LDY #$15                ;Lower byte of sound data start address(base=$B200).
  JSR _GotoSelSFXRoutine   ;($B587)Prepare to setup registers for SFX.
  LDA #$0A                ;
  STA NoiseSFXData        ;Start increment index for noise channel at #$0A.
  RTS                     ;

_MslLnchSFXCont:
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE _IncPeriodIndex      ;
  JMP _EndNoiseSFX         ;($B58F)End SFX.

_BmbExpldSFXStart:
  LDA #$30                ;Number of frames to play sound before a change.
  LDY #$19                ;Lower byte of sound data start address(base=$B200).

_GotoSelSFXRoutine:
* JMP _SelectSFXRoutine    ;($B452)Setup registers for SFX.

;The following routine is used to continue BombExplode and SamusWalk SFX.

_NoiseSFXCont:
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE _MusicBranch02       ;If more frames to process, branch to exit. 

_EndNoiseSFX:
  JSR _ClrCrntSFXFlags     ;($B4A2)Clear all SFX flags.
  LDA #$10                ;
  STA NoiseCntrl0         ;disable envelope generator(sound off).

_MusicBranch02:
  RTS                     ;Exit for multiple routines.
 
_SmuWlkSFXStart:
  LDA NoiseContSFX        ;If MissileLaunch, SamusWalk or SpitFire SFX are
  AND #$34                ;already being played, branch to exit.
  BNE _MusicBranch02       ;
  LDA #$03                ;Number of frames to play sound before a change.
  LDY #$1D                ;Lower byte of sound data start address(base=$B200).
  BNE -                   ;Branch always.

_MultiSFXInit:
  STA MultiSFXLength      ;
  JSR _LoadSQ2ChannelSFX   ;($B374)Set SQ2 SFX data.
  JSR _UpdateContFlags     ;($B493)Set continue SFX flag.
  LDA #$01                ;
  STA SQ1InUse            ;Disable music from using SQ1 and SQ2 while
  LDA #$02                ;SFX are playing.
  STA SQ2InUse            ;
  LDA #$00                ;
  STA SQ1ContSFX          ;
  STA SQ1SFXData          ;
  STA SQ1SQ2SFXData       ;Clear all listed memory addresses.
  STA SQ1SFXPeriodLow     ;
  STA ThisMultiFrame      ;
  STA WrtMultiChnDat      ;
  RTS                     ;

_EndMultiSFX:
  LDA #$10                ;
  STA SQ1Cntrl0           ;Disable SQ1 envelope generator(sound off).
  STA SQ2Cntrl0           ;Disable SQ2 envelope generator(sound off).
  LDA #$7F                ;
  STA SQ1Cntrl1           ;Disable SQ1 sweep.
  STA SQ2Cntrl1           ;Disable SQ2 sweep.
  JSR _ClrCrntSFXFlags     ;($B4A2)Clear all SFX flags.
  LDA #$00                ;
  STA SQ1InUse            ;
  STA SQ2InUse            ;Allows music player to use SQ1 and SQ2 channels.
  INC WrtMultiChnDat      ;
  RTS                     ;

_BossHitSFXStart:
  LDY #$2D                ;Low byte of SQ1 sound data start address(base=$B200).
  JSR _LoadSQ1ChannelSFX   ;($B368)Set SQ1 SFX data.
  LDY #$29                ;Low byte of SQ2 sound data start address(base=$B200).
  JMP _MultiSFXInit        ;($B5A5)Initiate multi channel SFX.

_BossHitSFXContinue:
  INC SQ1SFXData          ;Increment index to data in table below.
  LDY SQ1SFXData          ;
  LDA _BsHitSFXDatTbl,Y    ;
  STA SQ1Cntrl0           ;Load SQ1Cntrl0 and SQ2Cntrl0 from table below.
  STA SQ2Cntrl0           ;
  LDA SQ1SFXData          ;
  CMP #$14                ;After #$14 frames, end SFX.
  BEQ ++                  ;
  CMP #$06                ;After six or more frames of SFX, branch.
  BCC +                   ;
  LDA RandomNumber1       ;
  ORA #$10                ;Set bit 5.
  AND #$7F                ;Randomly set bits 7, 3, 2, 1 and 0.
  STA SQ1SFXPeriodLow     ;Store in SQ1 period low.
  ROL                     ;
  STA SQ1SQ2SFXData       ;
  JMP _WriteSQ1SQ2PerLo    ;($B62C)Write period low data to SQ1 and SQ2.
* INC SQ1SQ2SFXData       ;
  INC SQ1SQ2SFXData       ;Increment SQ1 and SQ2 period low by two.
  INC SQ1SFXPeriodLow     ;
  INC SQ1SFXPeriodLow     ;

_WriteSQ1SQ2PerLo:
  LDA SQ1SQ2SFXData       ;
  STA SQ2Cntrl2           ;Write new SQ1 and SQ2 period lows to SQ1 and SQ2
  LDA SQ1SFXPeriodLow     ;channels.
  STA SQ1Cntrl2           ;
  RTS                     ;

* JMP _EndMultiSFX         ;($B5CD)End SFX.

_BsHitSFXDatTbl:
  .byte $38, $3D, $3F, $3F, $3F, $3F, $3F, $3D, $3B, $39, $3B, $3D, $3F, $3D, $3B, $39
  .byte $3B, $3D, $3F, $39

_SamusHitSFXContinue:
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE +                   ;If more SFX frames to process, branch.
  JMP _EndMultiSFX         ;($B5CD)End SFX.
* LDY #$25                ;Low byte of SQ1 sound data start address(base=$B200).
  JSR _LoadSQ1ChannelSFX   ;($B368)Set SQ1 SFX data.
  LDA RandomNumber1       ;
  AND #$0F                ;Randomly set last four bits of SQ1 period low.
  STA SQ1Cntrl2           ;
  LDY #$25                ;Low byte of SQ2 sound data start address(base=$B200).
  JSR _LoadSQ2ChannelSFX   ;($B374)Set SQ2 SFX data.
  LDA RandomNumber1       ;
  LSR                     ;Multiply random number by 4.
  LSR                     ;
  AND #$0F                ;
  STA SQ2Cntrl2           ;Randomly set bits 2 and 3 of SQ2 period low.
  RTS                     ;

_SmsHitSFXStart:
  LDY #$25                ;Low byte of SQ1 sound data start address(base=$B200).
  JSR _LoadSQ1ChannelSFX   ;($B368)Set SQ1 SFX data.
  LDA RandomNumber1       ;
  AND #$0F                ;Randomly set last four bits of SQ1 period low.
  STA SQ1Cntrl2           ;
  CLC                     ;
  LDA RandomNumber1       ;Randomly set last three bits of SQ2 period low+1.
  AND #$03                ;
  ADC #$01                ;Number of frames to play sound before a change.
  LDY #$25                ;Low byte of SQ2 sound data start address(base=$B200).
  JSR _MultiSFXInit        ;($B5A5)Initiate multi channel SFX.
  LDA RandomNumber1       ;
  LSR                     ;Multiply random number by 4.
  LSR                     ;
  AND #$0F                ;
  STA SQ2Cntrl2           ;Randomly set bits 2 and 3 of SQ2 period low.
* RTS                     ;

_BadPswrdSFXStart:
  LDY #$31                ;Low byte of SQ1 sound data start address(base=$B200).
  JSR _LoadSQ1ChannelSFX   ;($B368)Set SQ1 SFX data.
  LDA #$20                ;Number of frames to play sound before a change.
  LDY #$35                ;Low byte of SQ2 sound data start address(base=$B200).
  JMP _MultiSFXInit        ;($B5A5)Initiate multi channel SFX.

_IncorrectPasswordSFXContinue:
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE -                   ;If more frames to process, branch to exit.
  JMP _EndMultiSFX         ;($B5CD)End SFX.

;The following table is used by the below routine to load SQ1Cntrl2 data in the
;MissilePickupSFXContinue routine.

_MslPickupSFXTbl:
  .byte $BD, $8D, $7E, $5E, $46, $3E, $00 

_MslPkupSFXCont:
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE _MusicBranch03       ;If more frames to process, branch to exit.
  LDY SQ1SFXData          ;
  LDA _MslPickupSFXTbl,Y   ;Load SFX data from table above.
  BNE +                   ;
  JMP _EndSQ1SFX           ;($B6F2)SFX completed.
* STA SQ1Cntrl2           ;
  LDA SoundEngineOrg+$44               ;#$28.
  STA SQ1Cntrl3           ;load SQ1Cntrl3 with #$28.
  INC SQ1SFXData          ;Increment index to data table above every 5 frames.

_MusicBranch03:
  RTS                     ;Exit from multiple routines.

_MslPkupSFXStart:
  LDA #$05                ;Number of frames to play sound before a change.
  LDY #$41                ;Lower byte of sound data start address(base=$B200).
  BNE +++                 ;Branch always.

_EnrgyPkupSFXCont:
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE _MusicBranch03       ;If more frames to process, branch to exit.
  INC SQ1SFXData          ;
  LDA SQ1SFXData          ;Every six frames, reload SFX info.  Does it
  CMP #$03                ;three times for a total of 18 frames.
  BEQ +                   ;
  LDY #$3D                ;
  JMP _LoadSQ1ChannelSFX   ;($B368)Set SQ1 SFX data.

_EnrgyPkupSFXStart:
  LDA #$06                ;Number of frames to play sound before a change.
  LDY #$3D                ;Lower byte of sound data start address(base=$B200).
  BNE +++                 ;Branch always.

;The following continue routine is used by the metal, out of hole,
;enemy hit and the Samus jump SFXs.

_SQ1SFXCont:
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE _MusicBranch03       ;

_EndSQ1SFX:
* LDA #$10                ;
  STA SQ1Cntrl0           ;Disable envelope generator(sound off).
  LDA #$00                ;
  STA SQ1InUse            ;Allows music to use SQ1 channel.
  JSR _ClrCrntSFXFlags     ;($B4A2)Clear all SFX flags.
  INC WrtMultiChnDat      ;Allows music routines to load SQ1 and SQ2 music.
  RTS                     ;

_SmsJumpSFXStart:
  LDA CurrentMusic        ;If escape music is playing, exit without playing
  CMP #$04                ;Samus jump SFX.
  BEQ _MusicBranch03       ;
  LDA #$0C                ;Number of frames to play sound before a change.
  LDY #$51                ;Lower byte of sound data start address(base=$B200).
  BNE _SelectSFX1          ;Branch always.

_EnHitSFXStart:
  LDA #$08                ;Number of frames to play sound before a change.
  LDY #$55                ;Lower byte of sound data start address(base=$B200).
  BNE _SelectSFX1          ;Branch always.

_BltFireSFXStart:
  LDA HasBeamSFX          ;
  LSR                     ;If Samus has ice beam, branch.
  BCS +++++               ;
  LDA SQ1ContSFX          ;If MissilePickup, EnergyPickup, EnemyRegen
  AND #$CC                ;or EnemyHit SFX already playing, branch to exit.
  BNE _MusicBranch03       ;
  LDA HasBeamSFX          ;
  ASL                     ;If Samus has long beam, branch.
  BCS +                   ;
  LDA #$03                ;Number of frames to play sound before a change.
  LDY #$4D                ;Lower byte of sound data start address(base=$B200).
  BNE _SelectSFX1          ;Branch always (Plays ShortBeamSFX).

_HasLongBeamSFXStart:
* LDA #$07                ;Number of frames to play sound before a change.
  LDY #$49                ;Lower byte of sound data start address(base=$B200).
  BNE _SelectSFX1          ;Branch always.

_MetalSFXStart:
  LDA #$0B                ;Number of frames to play sound before a change.
  LDY #$45                ;Lower byte of sound data start address(base=$B200).

_SelectSFX1:
* JMP _SelectSFXRoutine    ;($B452)Setup registers for SFX.

_EnRegenSFXStart:
  LDA CurrentMusic        ;If escape music is playing, use this SFX to make
  CMP #$04                ;the bomb ticking sound, else play regular SFX.
  BEQ +                   ;
  LDA #$16                ;Number of frames to play sound before a change.
  LDY #$59                ;Lower byte of sound data start address(base=$B200).
  BNE _SelectSFX1          ;Branch always.
* LDA #$07                ;Number of frames to play sound before a change.
  LDY #$39                ;Lower byte of sound data start address(base=$B200).
  BNE _SelectSFX1          ;Branch always.

_BltFireSFXCont:
  LDA HasBeamSFX          ;
  LSR                     ;If Samus has ice beam, branch.
  BCS +++                 ;
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE +                   ;If more frames to process, branch to exit.
  JMP _EndSQ1SFX           ;($B6F2)If SFX finished, jump.
* RTS                     ;

_HasIceBeamSFXStart:
* LDA #$07                ;Number of frames to play sound before a change.
  LDY #$61                ;Lower byte of sound data start address(base=$B200).
  JMP _SelectSFXRoutine    ;($B452)Setup registers for SFX.

_HasIceBeamSFXContinue:
* JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE +                   ;If more frames to process, branch.
  JMP _EndSQ1SFX           ;($B6F2)If SFX finished, jump.
* LDA SQ1SFXData          ;
  AND #$01                ;Determine index for IceBeamSFXDataTbl below.
  TAY                     ;
  LDA _IceBeamSFXDataTbl,Y ;Loads A with value from IceBeamSFXDataTbl below.
  BNE ++                  ;

_IceBeamSFXDataTbl:
  .byte $93               ;Ice beam SFX period low data.
  .byte $81               ;

_WvBeamSFXStart:
  LDA #$08                ;Number of frames to play sound before a change.
  LDY #$5D                ;Lower byte of sound data start address(base=$B200).
  JMP _SelectSFXRoutine    ;($B452)Setup registers for SFX.

_WvBeamSFXCont:
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE +                   ;If more frames to process, branch.
  LDY SQ1SQ2SFXData       ;
  INC SQ1SQ2SFXData       ;Load wave beam SFXDisable/enable envelope length
  LDA _WvBmSFXDisLnTbl,Y   ;data from WaveBeamSFXDisableLengthTbl.
  STA SQ1Cntrl0           ;
  BNE _MusicBranch10       ;If at end of WaveBeamSFXDisableLengthTbl, end SFX.
  JMP _EndSQ1SFX           ;($B6F2)If SFX finished, jump.
* LDA SQ1SFXData
  AND #$01                ;
  TAY                     ;Load wave beam SFX period low data from
  LDA _WvBmSFXPerLowTbl,Y  ;WvBmSFXPerLowTbl.

_LoadSQ1PeriodLow:
* STA SQ1Cntrl2           ;Change the period low data for SQ1 channel.
  INC SQ1SFXData          ;

_MusicBranch10:
  RTS                     ;Exit for multiple routines.
 
_WvBmSFXPerLowTbl:
  .byte $58               ;Wave beam SFX period low data.
  .byte $6F               ;

_WvBmSFXDisLnTbl:
  .byte $93               ;
  .byte $91               ;Wave beam SFX Disable/enable envelope length data.
  .byte $00               ;

_DoorSFXStart:
  LDA SoundEngineOrg+$87               ;#$30.
  STA TriPeriodLow        ;Set triangle period low data byte.
  LDA SoundEngineOrg+$88               ;#$B2.
  AND #$07                ;Set triangle period high data byte.
  STA TriPeriodHigh       ;#$B7.
  LDA #$0F                ;
  STA TriChangeLow        ;Change triangle channel period low every frame by #$0F.
  LDA #$00                ;
  STA TriChangeHigh       ;No change in triangle channel period high.
  LDA #$1F                ;Number of frames to play sound before a change.
  LDY #$85                ;Lower byte of sound data start address(base=$B200).
  JMP _SelectSFXRoutine    ;($B452)Setup registers for SFX.

_DoorSFXCont:
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE +                   ;
  JMP _EndTriangleSFX      ;($B896)End SFX.
* JSR _DecreaseTriPeriods  ;($B98C)Decrease periods.
  JMP _WriteTriPeriods     ;($B869)Save new periods.

_BeepSFXStart:
  LDA TriangleContSFX     ;If BombLaunchSFX is already playing, branch
  AND #$80                ;without playing BeepSFX.
  BNE _MusicBranch10       ;
  LDA #$03                ;Number of frames to play sound before a change.
  LDY #$79                ;Lower byte of sound data start address(base=$B200).
  JMP _SelectSFXRoutine    ;($B452)Setup registers for SFX.

_BeepSFXCont:
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE _MusicBranch10       ;If more frames to process, branch to exit.
  JMP _EndTriangleSFX      ;($B896)End SFX.

_BigEnHitSFXStart:
  LDA #$12                ;Increase triangle low period by #$12 every frame.
  STA TriChangeLow        ;
  LDA #$00                ;
  STA TriChangeHigh       ;Does not change triangle period high.
  LDA SoundEngineOrg+$7F               ;#$42.
  STA TriPeriodLow        ;Save new triangle period low data.
  LDA SoundEngineOrg+$80               ;#$18.
  AND #$07                ;#$1F.
  STA TriPeriodHigh       ;Save new triangle period high data.
  LDA #$0A                ;Number of frames to play sound before a change.
  LDY #$7D                ;Lower byte of sound data start address(base=$B200).
  JMP _SelectSFXRoutine   ;($B452)Setup registers for SFX.

_BigEnHitSFXCont:
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE +                   ;If more frames to process, branch
  JMP _EndTriangleSFX      ;($B896)End SFX
* JSR _IncreaseTriPeriods  ;($B978)Increase periods.
  LDA RandomNumber1       ;
  AND #$3C                ;
  STA TriangleSFXData     ;
  LDA TriPeriodLow        ;Randomly set or clear bits 2, 3, 4 and 5 in
  AND #$C3                ;triangle channel period low.
  ORA TriangleSFXData     ;
  STA TriangleCntrl2      ;
  LDA TriPeriodHigh       ;
  ORA #$40                ;Set 4th bit in triangle channel period high.
  STA TriangleCntrl3      ;
  RTS                     ;

_SmsBallSFXStart:
  LDA #$08                ;Number of frames to play sound before a change.
  LDY #$6D                ;Lower byte of sound data start address(base=$B200).
  JSR _SelectSFXRoutine    ;($B452)Setup registers for SFX.
  LDA #$05                ;
  STA PercentDiff         ;Stores percent difference. In this case 5 = 1/5 = 20%.
  LDA SoundEngineOrg+$6F               ;#$DD.
  STA TriPeriodLow        ;Save new triangle period low data.
  LDA SoundEngineOrg+$70               ;#$3B.
  AND #$07                ;#$02.
  STA TriPeriodHigh       ;Save new triangle period high data.
  RTS                     ;

_SmsBallSFXCont:
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE +                   ;If more frames to process, branch.
  JMP _EndTriangleSFX      ;($B896)End SFX.
* JSR _DivideTriePeriods   ;($B9A0)reduces triangle period low by 20% each frame.
  LDA TriLoPercentage     ;
  STA TriChangeLow        ;Store new values to change triangle periods.
  LDA TriHiPercentage     ;
  STA TriChangeHigh       ;
  JSR _DecreaseTriPeriods  ;($B98C)Decrease periods.

_WriteTriPeriods:
  LDA TriPeriodLow        ;Write TriPeriodLow to triangle channel.
  STA TriangleCntrl2      ;
  LDA TriPeriodHigh       ;
  ORA #$08                ;Write TriPeriodHigh to triangle channel.
  STA TriangleCntrl3      ;
  RTS                     ;

_BmbLaunchSFXStart:
  LDA #$04                ;Number of frames to play sound before a change.
  LDY #$65                ;Lower byte of sound data start address(base=$B200).
  JMP _SelectSFXRoutine    ;($B452)Setup registers for SFX.

_BmbLaunchSFXCont:
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE _MusicBranch04       ;If more frames to process, branch to exit.
  INC TriangleSFXData     ;
  LDA TriangleSFXData     ;After four frames, load second part of SFX.
  CMP #$02                ;
  BNE +                   ;
  JMP _EndTriangleSFX      ;($B896)End SFX.
* LDY #$69                ;Lower byte of sound data start address(base=$B200).
  JMP _LoadTriChannelSFX   ;($B36C)Prepare to load triangle channel with data.

_EndTriangleSFX:
  LDA #$00                ;
  STA TriangleCntrl0      ;clear TriangleCntr0(sound off).
  STA TriangleInUse       ;Allows music to use triangle channel.
  LDA #$18                ;
  STA TriangleCntrl3      ;Set length index to #$03.
  JSR _ClrCrntSFXFlags     ;($B4A2)Clear all SFX flags.

_MusicBranch04:
  RTS                     ;Exit from for multiple routines.

_MtrdHitSFXStart:
  LDA #$03                ;Number of frames to play sound before a change.
  LDY #$71                ;Lower byte of sound data start address(base=$B200).
  JSR _SelectSFXRoutine    ;($B452)Setup registers for SFX.
  JMP _RndTrianglePeriods  ;($B8C3)MetroidHit SFX has several different sounds.

_MtrdHitSFXCont:
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BEQ +                   ;
  INC TriangleSFXData     ;
  LDA TriangleSFXData     ;Randomize triangle periods nine times throughout
  CMP #$09                ;the course of the SFX.
  BNE _MusicBranch04       ;If SFX not done, branch.
  JMP _EndTriangleSFX      ;($B896)End SFX.

_RndTrianglePeriods:
* LDA RandomNumber1       ;Randomly set or reset bits 7, 4, 2 and 1 of
  ORA #$6C                ;triangle channel period low.
  STA TriangleCntrl2      ;
  AND #$01                ;
  ORA #$F8                ;Randomly set or reset last bit of triangle
  STA TriangleCntrl3      ;channel period high.
  RTS                     ;

_SmsDieSFXStart:
  JSR _InitSoundAddresses  ;($B404)Clear all sound addresses.
  LDA #$0E                ;Number of frames to play sound before a change.
  LDY #$75                ;Lower byte of sound data start address(base=$B200).
  JSR _SelectSFXRoutine    ;($B452)Setup registers for SFX.
  LDA #$15                ;Decrease triangle SFX periods by 4.8% every frame.
  STA PercentDiff         ;
  LDA SoundEngineOrg+$77               ;#$40.
  STA TriPeriodLow        ;
  LDA #$00                ;Initial values of triangle periods.
  STA TriPeriodHigh       ;
* RTS                     ;

_SmsDieSFXCont:
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE +                   ;
  LDA #$20                ;Store change in triangle period low.
  STA TriChangeLow        ;
  LDA #$00                ;
  STA TriChangeHigh       ;No change in triangle period high.
  JSR _DecreaseTriPeriods  ;($B98C)Decrease periods.
  INC TriangleSFXData     ;
  LDA TriangleSFXData     ;
  CMP #$06                ;
  BNE -                   ;If more frames to process, branch to exit.
  JMP _EndTriangleSFX      ;($B896)End SFX.
* JSR _DivideTriePeriods   ;($B9A0)reduces triangle period low.
  LDA TriLoPercentage     ;
  STA TriChangeLow        ;Update triangle periods.
  LDA TriHiPercentage     ;
  STA TriChangeHigh       ;
  JSR _IncreaseTriPeriods  ;($B978)Increase periods.
  JMP _WriteTriPeriods     ;($B869)Save new periods.

_StRaiseSFXStart:
  LDA SoundEngineOrg+$83               ;#$11.
  STA TriPeriodLow        ;Save period low data.
  LDA SoundEngineOrg+$84               ;#$09.
  AND #$07                ;
  STA TriPeriodHigh       ;Store last three bits in $B284.
  LDA #$00                ;
  STA TriChangeHigh       ;No change in Triangle period high.
  LDA #$0B                ;
  STA TriChangeLow        ;
  LDA #$06                ;Number of frames to play sound before a change.
  LDY #$81                ;Lower byte of sound data start address(base=$B200).
  JMP _SelectSFXroutine    ;($B452)Setup registers for SFX.

_StRaiseSFXCont:
  JSR _IncrementSFXFrame   ;($B4A9)Get next databyte to process in SFX.
  BNE ++                  ;
  INC TriangleSFXData     ;Increment TriangleSFXData every 6 frames.
  LDA TriangleSFXData     ;
  CMP #$09                ;When TriangleSFXData = #$09, end SFX.
  BNE +                   ;
  JMP _EndTriangleSFX      ;($B896)End SFX.
* LDA TriChangeLow        ;
  PHA                     ;Save triangle periods.
  LDA TriChangeHigh       ;
  PHA                     ;
  LDA #$25                ;
  STA TriChangeLow        ;
  LDA #$00                ;No change in triangle period high.
  STA TriChangeHigh       ;
  JSR _IncreaseTriPeriods  ;($B978)Increase periods.
  PLA                     ;
  STA TriChangeHigh       ;Restore triangle periods.
  PLA                     ;
  STA TriChangeLow        ;
  JMP _WriteTriPeriods     ;($B869)Save new periods.
* JSR _DecreaseTriPeriods  ;($B98C)Decrease periods.
  JMP _WriteTriPeriods     ;($B869)Save new periods.

_IncreaseTriPeriods:
  CLC 
  LDA TriPeriodLow        ;
  ADC TriChangeLow        ;Calculate new TriPeriodLow.
  STA TriPeriodLow        ;
  LDA TriPeriodHigh       ;
  ADC TriChangeHigh       ;Calculate new TriPeriodHigh.
  STA TriPeriodHigh       ;
  RTS                     ;

_DecreaseTriPeriods:
  SEC 
  LDA TriPeriodLow        ;
  SBC TriChangeLow        ;Calculate new TriPeriodLow.
  STA TriPeriodLow        ;
  LDA TriPeriodHigh       ;
  SBC TriChangeHigh       ;Calculate new TriPeriodHigh.
  STA TriPeriodHigh       ;
  RTS                     ;

_DivideTriePeriods:
  LDA TriPeriodLow        ;
  PHA                     ;Store TriPeriodLow and TriPeriodHigh.
  LDA TriPeriodHigh       ;
  PHA                     ;
  LDA #$00                ;
  STA DivideData          ;
  LDX #$10                ;
  ROL TriPeriodLow        ;
  ROL TriPeriodHigh       ;
* ROL DivideData          ;The following routine takes the triangle period
  LDA DivideData          ;high and triangle period low values and reduces
  CMP PercentDiff         ;them by a certain percent.  The percent is
  BCC +                   ;determined by the value stored in
  SBC PercentDiff         ;PercentDiff.  If PercentDiff=#$05,
  STA DivideData          ;then the values will be reduced by 20%(1/5).
* ROL TriPeriodLow        ;If PercentDiff=#$0A,Then the value will
  ROL TriPeriodHigh       ;be reduced by 10%(1/10), etc. This function is
  DEX                     ;basically a software emulation of a sweep function.
  BNE --                  ;
  LDA TriPeriodLow        ;
  STA TriLoPercentage     ;
  LDA TriPeriodHigh       ;
  STA TriHiPercentage     ;
  PLA                     ;
  STA TriPeriodHigh       ;Restore TrianglePerodLow and TriPeriodHigh.
  PLA                     ;
  STA TriPeriodLow        ;
  RTS                     ;

;--------------------------------------[ End SFX routines ]-------------------------------------

_LoadSQ1SQ2Periods:
  LDA WrtMultiChnDat      ;If a Multi channel data does not need to be
  BEQ +                   ;loaded, branch to exit.
  LDA #$00                ;
  STA WrtMultiChnDat      ;Clear multi channel data write flag.
  LDA MusicSQ1Sweep       ;
  STA SQ1Cntrl1           ;
  LDA MusicSQ1PrdLow      ;
  STA SQ1Cntrl2           ;Loads SQ1 channel addresses $4001, $4002, $4003.
  LDA MusicSQ1PrdHi       ;
  STA SQ1Cntrl3           ;
  LDA MusicSQ2Sweep       ;
  STA SQ2Cntrl1           ;
  LDA MusicSQ2PeriodLo    ;
  STA SQ2Cntrl2           ;Loads SQ2 channel addresses $4005, $4006, $4007.
  LDA MusicSQ2PeriodHi    ;
  STA SQ2Cntrl3           ;
* RTS                     ;

_LoadSQ1SQ2Channels:
  LDX #$00                ;Load SQ1 channel data.
  JSR _WriteSQCntrl0       ;($BA41)Write Cntrl0 data.
  INX                     ;Load SQ2 channel data.
  JSR _WriteSQCntrl0       ;($BA41)Write Cntrl0 data.
  RTS                     ;

_WriteSQCntrl0:
  LDA SQ1VolumeCntrl,X    ;Load SQ channel volume data. If zero, branch to exit.
  BEQ +++++               ;
  STA VolCntrlAddress     ;
  JSR _LoadSQ1SQ2Periods   ;($BA08)Load SQ1 and SQ2 control information.
  LDA SQ1VolumeData,X     ;
  CMP #$10                ;If sound channel is not currently
  BEQ +++++++             ;playing sound, branch.
  LDY #$00                ;
* DEC VolCntrlAddress     ;Desired entry in VolumeCntrlAdressTbl.
  BEQ +                   ;
  INY                     ;*2(2 byte address to find voulume control data).
  INY                     ;
  BNE -                   ;Keep decrementing until desired address is found.
* LDA _VolCntrlPtrTbl,Y    ;Base is $BCB0.
  STA $EC                 ;Volume data address low byte.
  LDA _VolCntrlPtrTbl+1,Y  ;Base is $BCB1.
  STA $ED                 ;Volume data address high byte.
  LDY SQ1VolumeIndex,X    ;Index to desired volume data.
  LDA ($EC),Y             ;Load desired volume for current channel into
  STA Cntrl0Data          ;Cntrl0Data.
  CMP #$FF                ;If last entry in volume table is #$FF, restore
  BEQ _MusicBranch05       ;volume to its original level after done reading
  CMP #$F0                ;Volume data. If #$F0 is last entry, turn sound
  BEQ _MusicBranch06       ;off on current channel until next note.
  LDA SQ1DutyEnvelope,X   ;Remove duty cycle data For current channel and
  AND #$F0                ;add this frame of volume data and store results 
  ORA Cntrl0Data          ;in Cntrl0Data.
  TAY                     ;
* INC SQ1VolumeIndex,X    ;Increment Index to volume data.
* LDA SQ1InUse,X          ;If SQ1 or SQ2(depends on loop iteration) in use,
  BNE +                   ;branch to exit, else write SQ(1 or 2)Cntrl0.
  TXA                     ;
  BEQ ++                  ;If currently on SQ1, branch to write SQ1 data.

_WriteSQ2Cntrl0:                 ;
  STY SQ2Cntrl0           ;Write SQ2Cntrl0 data.
* RTS                     ;

_WriteSQ1Cntrl0:                 ;
* STY SQ1Cntrl0           ;Write SQ1Cntrl0 data.
  RTS                     ;

_MusicBranch05:
  LDY SQ1DutyEnvelope,X   ;Restore original volume of sound channel.
  BNE ---                 ;Branch always.

_MusicBranch06:
  LDY #$10                ;Disable envelope generator and set volume to 0.
  BNE ---                 ;Branch always.
* LDY #$10                ;Disable envelope generator and set volume to 0.
  BNE -----               ;Branch always.

_GotoCheckRepeatMusic:
* JSR _CheckRepeatMusic    ;($B3F0)Resets music flags if music repeats.
  RTS                     ;

_GotoLoadSQ1SQ2Channels:
* JSR _LoadSQ1SQ2Channels  ;($BA37)Load SQ1 and SQ2 channel data.
  RTS                     ;

_LoadCurMusFrameData:

.scope
  _ResetVolumeIndex:
    LDA SQ1MusicFrameCnt    ;If at the beginning of a new SQ1 note, set
    CMP #$01                ;SQ1VolumeIndex = #$01.
    BNE _skip1                   ;
    STA SQ1VolumeIndex      ;
  _skip1:
    LDA SQ2MusicFrameCnt    ;
    CMP #$01                ;If at the beginning of a new SQ2 note, set
    BNE _skip2              ;SQ2VolumeIndex = #$01.
    STA SQ2VolumeIndex      ;
  _skip2:
.scend

  LDA #$00                ;
  TAX                     ;X = #$00.
  STA ThisSoundChannel    ;(#$00, #$04, #$08 or #$0C).
  BEQ ++                  ;
* TXA                     ;
  LSR                     ;
  TAX                     ;Increment to next sound channel(1,2 or 3).
                                ;
_IncToNextChannel:               ;
  INX                     ;
  TXA                     ;
  CMP #$04                ;If done with four sound channels, branch to load
  BEQ --                  ;sound channel SQ1 SQ2 data.
  LDA ThisSoundChannel    ;Add 4 to the least significant byte of the current
  CLC                     ;sound channel start address.  This moves to next
  ADC #$04                ;sound channel address ranges to process.
  STA ThisSoundChannel    ;
* TXA                     ;
  ASL                     ;*2(two bytes for sound channel info base address).
  TAX                     ;
  LDA SQ1LowBaseByte,X    ;
  STA $E6                 ;Load sound channel info base address into $E6
  LDA SQ1HighBaseByte,X   ;and $E7. ($E6=low byte, $E7=high byte).
  STA $E7                 ;
  LDA SQ1HighBaseByte,X   ;If no data for this sound channel, branch
  BEQ --                  ;to find data for next sound channel.
  TXA                     ;
  LSR                     ;/2. Determine current sound channel (0,1,2 or3).
  TAX                     ;
  DEC SQ1MusicFrameCnt,X  ;Decrement the current sound channel frame count
  BNE _IncToNextChannel    ;If not zero, branch to check next channel, else
                                ;load the next set of sound channel data.
_LdNextChnlIndexDat:
  LDY SQ1MusicIdxIdx,X    ;Load current channel index to music data index.
  INC SQ1MusicIdxIdx,X    ;Increment current channel index to music data index.
  LDA ($E6),Y             ;
  BEQ ----                ;Branch if music has reached the end.
  TAY                     ;Transfer music data index to Y (base=$BE77) .
  CMP #$FF                ;
  BEQ +                   ;At end of loop? If yes, branch.
  AND #$C0                ;
  CMP #$C0                ;At beginnig of new loop? if yes, branch.
  BEQ ++                  ;
  JMP _LoadMusicChannel    ;($BB1C)Load music data into channel.

_RepeatMusicLoop:
* LDA SQ1RepeatCounter,X  ;If loop counter has reached zero, branch to exit.
  BEQ ++                  ;
  DEC SQ1RepeatCounter,X  ;Decrement loop counter.
  LDA SQ1LoopIndex,X      ;Load loop index for proper channel and store it in
  STA SQ1MusicIdxIdx,X    ;music index index address.
  BNE ++                  ;Branch unless music has reached the end.

_StartNewMusicLoop:
* TYA                     ;
  AND #$3F                ;Remove last six bits of loop controller and save
  STA SQ1RepeatCounter,X  ;in repeat counter addresses.  # of times to loop.
  DEC SQ1RepeatCounter,X  ;Decrement loop counter.
  LDA SQ1MusicIdxIdx,X    ;Store location of loop start in loop index address.
  STA SQ1LoopIndex,X      ;
* JMP _LdNextChnlIndexDat  ;($BADC)Load next channel index data.

* JMP _LdNseChannelMusic   ;($BBDE)Load data for noise channel music.

* JMP _LoadTriangleCntrl0  ;($BBB7)Load Cntrl0 byte of triangle channel.

_LoadMusicChannel:
  TYA                     ;
  AND #$B0                ;
  CMP #$B0                ;Is data byte music note length data?  If not, branch.
  BNE +                   ;
  TYA                     ;
  AND #$0F                ;Separate note length data.
  CLC                     ;
  ADC NoteLenTblOffset    ;Find proper note lengths table for current music.
  TAY                     ;
  LDA _NoteLengths0Tbl,Y   ;(Base is $BEF7)Load note length and store in 
  STA SQ1FrmCountInit,X   ;frame count init address.
  TAY                     ;Y now contains note length.
  TXA                     ;
  CMP #$02                ;If loading Triangle channel data, branch.
  BEQ -                   ;

_LdSndDatIndexIndex:
  LDY SQ1MusicIdxIdx,X    ;Load current index to sound data index.
  INC SQ1MusicIdxIdx,X    ;Increment music index index address.
  LDA ($E6),Y             ;Load index to sound channel music data.
  TAY                     ;
* TXA                     ;
  CMP #$03                ;If loading Noise channel data, branch.
  BEQ ---                 ;
  PHA                     ;Push music channel number on stack(0, 1 or 2).
  LDX ThisSoundChannel    ;
  LDA _MusicNotesTbl+1,Y   ;(Base=$BE78)Load A with music channel period low data.
  BEQ +                   ;If data is #$00, skip period high and low loading.
  STA MusicSQ1PrdLow,X    ;Store period low data in proper period low address.
  LDA _MusicNotesTbl,Y     ;(Base=$BE77)Load A with music channel period high data.
  ORA #$08                ;Ensure minimum index length of 1.
  STA MusicSQ1PrdHi,X     ;Store period high data in proper period high address.
* TAY                     ;
  PLA                     ;Pull stack and restore channel number to X.
  TAX                     ;
  TYA                     ;
  BNE +                   ;If period information was present, branch.
                
_NoPeriodInformation:
  LDA #$00                ;Turn off channel volume since no period data present.
  STA Cntrl0Data          ;
  TXA                     ;
  CMP #$02                ;If loading triangle channel data, branch.
  BEQ ++                  ;
  LDA #$10                ;Turn off volume and disable env. generator(SQ1,SQ2).
  STA Cntrl0Data          ;
  BNE ++                  ;Branch always.

_PeriodInformationFound:
* LDA SQ1DutyEnvelope,X   ;Store channel duty cycle and volume info in $EA.
  STA Cntrl0Data          ;
* TXA                     ;
  DEC SQ1InUse,X          ;
  CMP SQ1InUse,X          ;If SQ1 or SQ2 are being used by SFX routines, branch.
  BEQ +++                 ;
  INC SQ1InUse,X          ;Restore not in use status of SQ1 or SQ2.
  LDY ThisSoundChannel    ;
  TXA                     ;
  CMP #$02                ;If loading triangle channel data, branch.
  BEQ +                   ;
  LDA SQ1VolumeCntrl,X    ;If $062E or $062F has volume data, skip writing
  BNE ++                  ;Cntrl0Data to SQ1 or SQ2.
* LDA Cntrl0Data          ;
  STA SQ1Cntrl0,Y         ;Write Cntrl0Data.
* LDA Cntrl0Data          ;
  STA SQ1VolumeData,X     ;Store volume data index to volume data.
  LDA MusicSQ1PrdLow,Y    ;
  STA SQ1Cntrl2,Y         ;
  LDA MusicSQ1PrdHi,Y     ;Write data to three sound channel addresses.
  STA SQ1Cntrl3,Y         ;
  LDA MusicSQ1Sweep,X     ;
  STA SQ1Cntrl1,Y         ;

_LdNewMusFrameCount:
  LDA SQ1FrmCountInit,X   ;Load new music frame count and store it in music
  STA SQ1MusicFrameCnt,X  ;frame count address.
  JMP _IncToNextChannel    ;($BAB3)Move to next sound channel.

_SQ1SQ2InUse:
* INC SQ1InUse,X          ;Restore in use status of SQ1 or SQ1.
  JMP _LdNewMusFrameCount  ;($BBA8)Load new music frame count.

_LoadTriangleCntrl0:
  LDA TriCounterCntrl     ;
  AND #$0F                ;If lower bits set, branch to play shorter note. 
  BNE ++                  ;
  LDA TriCounterCntrl     ;
  AND #$F0                ;If upper bits are set, branch to play longer note.
  BNE +                   ;
  TYA                     ;
  JMP _AddTriangleLength   ;($BBCD)Calculate length to play note.
* LDA #$FF                ;Disable length cntr(play until triangle data changes).
  BNE +                   ;Branch always.

_AddTriangleLength:
  CLC                     ;
  ADC #$FF                ;Add #$FF(Effectively subtracts 1 from A).
  ASL                     ;
  ASL                     ;*4.
  CMP #$3C                ;
  BCC +                   ;If result is greater than #$3C, store #$3C(highest
  LDA #$3C                ;triangle linear count allowed).
* STA TriLinearCount      ;
* JMP _LdSndDatIndexIndex  ;($BB37)Load index to sound data index.

_LdNseChannelMusic:
  LDA NoiseContSFX        ;
  AND #$FC                ;If playing any Noise SFX, branch to exit.
  BNE +                   ;

  LDA _SFXDatTbl,Y         ;
  STA NoiseCntrl0         ;Load noise channel with drum beat SFX starting
  LDA _SFXDatTbl+1,Y       ;at address B201.  The possible values of Y are
  STA NoiseCntrl2         ;#$01, #$04, #$07 or #$0A.
  LDA _SFXDatTbl+2,Y       ;
  STA NoiseCntrl3         ;

* JMP _LdNewMusFrameCount  ;($BBA8)Load new music frame count.

;----------------------------------------------------------------------------------------------------

;The following table is used by the InitializeMusic routine to find the index for loading
;addresses $062B thru $0637.  Base is _InitMusicTbl($BD31).

_InitMusicIndexTbl:
  .byte $41               ;Ridley area music.
  .byte $8F               ;Tourian music.
  .byte $34               ;Item room music.
  .byte $27               ;Kraid area music.
  .byte $1A               ;Norfair music.
  .byte $0D               ;Escape music.
  .byte $00               ;Mother brain music.
  .byte $82               ;Brinstar music.
  .byte $68               ;Fade in music.
  .byte $75               ;Power up music.
  .byte $4E               ;End music.
  .byte $5B               ;Intro music.

;The tables below contain addresses for SFX and music handling routines.
;Multi channel Init SFX and music handling routine addresses:
_MultiMusInitTbl:
  .word _Music03Init      ;Fade in music.
  .word _Music01Init      ;Power up music. 
  .word _Music05Init      ;End game music.
  .word _Music01Init      ;Intro music.
  .word _NoSound           ;No sound.
  .word _SmsHitSFXStart    ;Samus hit init SFX.
  .word _BossHitSFXStart   ;Boss hit init SFX.
  .word _BadPswrdSFXStart  ;Incorrect password init SFX.

;Multi channel continue SFX handling routine addresses:
_MultiSFXContTbl:
  .word _NoSound                        ;No sound.
  .word _NoSound                        ;No sound.
  .word _NoSound                        ;No sound.
  .word _NoSound                        ;No sound.
  .word _NoSound                        ;No sound.
  .word _SamusHitSFXContinue            ;Samus hit continue SFX.
  .word _BossHitSFXContinue             ;Boss hit continue SFX.
  .word _IncorrectPasswordSFXContinue   ;Incorrect password continue SFX.

;Music handling routine addresses:
_MusicInitTbl:
  .word _Music04Init      ;Ridley area music.
  .word _Music00Init      ;Tourian music.
  .word _Music00Init      ;Item room music.
  .word _Music00Init      ;Kraid area music.
  .word _Music03Init      ;Norfair music.
  .word _Music02Init      ;Escape music.
  .word _Music00Init      ;Mother brain music.
  .word _Music03Init      ;Brinstar music.

;----------------------------------------------------------------------------------------------------

_LoadMusicTempFlags:
  LDA CrntMusicRepeat     ;Load A with temp music flags, (9th SFX cycle).
  LDX #<_MusicInitDat      ;Lower address byte in ChooseNextSFXRoutineTbl.
  BNE +                   ;Branch always.

_LoadMusicInitFlags:
  LDA MusicInitFlag       ;Load A with Music flags, (10th SFX cycle).
  LDX #<_TmpInitDat        ;Lower address byte in ChooseNextSFXRoutineTbl.

* JSR _CheckSFXFlag        ;($B4BD)Checks to see if SFX or music flags set.

;----------------------------------------------------------------------------------------------------

;MusicInitIndex values correspond to the following music:
;#$00=Ridley area music, #$01=Tourian music, #$02=Item room music, #$03=Kraid area music,
;#$04=Norfair music, #$05=Escape music, #$06=Mother brain music, #$07=Brinstar music,
;#$08=Fade in music, #$09=Power up music, #$0A=End game music, #$0B=Intro music.

.scope
  _FindMusicInitIndex:
    LDA #$FF                ;Load MusicInitIndex with #$FF.
    STA MusicInitIndex      ;

    LDA CurrentSFXFlags     ;Branch to exit if no SFX flags set for Multi SFX.
    BEQ _EndMusInit          ;

  * INC MusicInitIndex      ;Shift left until bit flag is in carry bit.
    ASL                     ;Loop until SFX flag found.  Store bit
    BCC -                   ;number of music in MusicInitIndex.

  _EndMusInit:
.scend

  JMP (SFXPtrE2_)         ;If no flag found, Jump to next SFX cycle,
                                ;else jump to specific SFX handling subroutine.

_ContinueMusic:                  ;11th and last SFX cycle.
  LDA CurrentMusic        ;
  BEQ _SoundEngineExit             ;Branch to exit of no music playing.
  JMP _LoadCurMusFrameData ;($BAA5)Load info for current frame of music data.

_SoundEngineExit:
  RTS
;----------------------------------------------------------------------------------------------------

_Music04Init:
  LDA #$B3                ;Duty cycle and volume data for SQ1 and SQ2.

_XYMusicInit:
  TAX                     ;Duty cycle and volume data for SQ1.
  TAY                     ;Duty cycle and volume data for SQ2.

_DoMusicInit:
*   LDA #$7F                ;
    STA MusicSQ1Sweep       ;Disable sweep generator on SQ1 and SQ2.
    STA MusicSQ2Sweep       ;
    STX SQ1DutyEnvelope     ;Store duty cycle and volume data for SQ1 and SQ2.
    STY SQ2DutyEnvelope     ;

  JSR _InitializeMusic_Bank00   ;($BF19)Setup music registers.
  JMP _LoadCurMusFrameData ;($BAA5)Load info for current frame of music data.

_Music03Init:
  LDA #$34                ;Duty cycle and volume data for SQ1 and SQ2.
  BNE _XYMusicInit         ;Branch always

_Music02Init:
  LDA #$F4                ;Duty cycle and volume data for SQ1 and SQ2.
  BNE _XYMusicInit         ;Branch always

_Music05Init:
  LDX #$F5                ;Duty cycle and volume data for SQ1.
  LDY #$F6                ;Duty cycle and volume data for SQ2.
  BNE _DoMusicInit         ;Branch always

_Music01Init:
  LDX #$B6                ;Duty cycle and volume data for SQ1.
  LDY #$F6                ;Duty cycle and volume data for SQ2.
  BNE _DoMusicInit         ;Branch always

_Music00Init:
  LDX #$92                ;Duty cycle and volume data for SQ1.
  LDY #$96                ;Duty cycle and volume data for SQ2.
  BNE _DoMusicInit         ;Branch always

;----------------------------------------------------------------------------------------------------

;The following address table provides starting addresses of the volume data tables below:
_VolCntrlPtrTbl:
  .word _VolumeDataTbl1, _VolumeDataTbl2, _VolumeDataTbl3, _VolumeDataTbl4
  .word _VolumeDataTbl5

_VolumeDataTbl1:
  .byte $01, $02, $02, $03, $03, $04, $05, $06, $07, $08, $FF

_VolumeDataTbl2:
  .byte $02, $04, $05, $06, $07, $08, $07, $06, $05, $FF

_VolumeDataTbl3:
  .byte $00, $0D, $09, $07, $06, $05, $05, $05, $04, $04, $FF

_VolumeDataTbl4:
  .byte $02, $06, $07, $07, $07, $06, $06, $06, $06, $05, $05, $05, $04, $04, $04, $03
  .byte $03, $03, $03, $02, $03, $03, $03, $03, $03, $02, $02, $02, $02, $02, $02, $02
  .byte $02, $02, $02, $01, $01, $01, $01, $01, $F0

_VolumeDataTbl5:
  .byte $0A, $0A, $09, $08, $07, $06, $05, $04, $03, $02, $07, $07, $06, $05, $04, $04
  .byte $03, $02, $02, $02, $05, $05, $05, $04, $03, $02, $02, $02, $01, $01, $04, $04
  .byte $03, $02, $01, $02, $02, $01, $01, $01, $02, $02, $02, $01, $01, $F0 

;----------------------------------------------------------------------------------------------------