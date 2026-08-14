;Game engine bank.

;----------------------------------------[ Start of code ]------------------------------------------

;This routine generates pseudo random numbers and updates those numbers
;every frame. The random numbers are used for several purposes including
;password scrambling and determinig what items, if any, an enemy leaves
;behind after it is killed.

RandomNumbers:
.scope
    LC000:  TXA                     ;       
    LC001:  PHA                     ;
    LC002:  LDX #$05                ;
    _loop:
        LC004:  LDA RandomNumber1   ;
        LC006:  CLC                 ;
        LC007:  ADC #$05            ;
        LC009:  STA RandomNumber1   ;2E is increased by #$19 every frame and
        LC00B:  LDA RandomNumber2   ;2F is increased by #$5F every frame.           
        LC00D:  CLC                 ;
        LC00E:  ADC #$13            ;
        LC010:  STA RandomNumber2   ;
        LC012:  DEX                 ;
        LC013:  BNE _loop           ;
    LC015:  PLA                     ;
    LC016:  TAX                     ;
    LC017:  LDA RandomNumber1       ;
    LC019:  RTS                     ;
.scend

;------------------------------------------[ Startup ]----------------------------------------------

Startup:
LC01A:  LDA #$00                ;
LC01C:  STA MMC1Reg1            ;Clear bit 0. MMC1 is serial controlled
LC01F:  STA MMC1Reg1            ;Clear bit 1
LC022:  STA MMC1Reg1            ;Clear bit 2
LC024:  STA MMC1Reg1            ;Clear bit 3
LC027:  STA MMC1Reg1            ;Clear bit 4 
LC02B:  STA MMC1Reg2            ;Clear bit 0
LC02E:  STA MMC1Reg2            ;Clear bit 1
LC031:  STA MMC1Reg2            ;Clear bit 2
LC034:  STA MMC1Reg2            ;Clear bit 3
LC037:  STA MMC1Reg2            ;Clear bit 4 
LC03A:  JSR MMCWriteReg3        ;($C4FA)Swap to PRG bank #0 at $8000
LC03D:  DEX                     ;X = $FF
LC03E:  TXS                     ;S points to end of stack page

;Clear RAM at $000-$7FF.
LC03F:  LDY #$07                ;High byte of start address.
LC041:  STY $01                 ;
LC043:  LDY #$00                ;Low byte of start address.
LC045:  STY $00                 ;$0000 = #$0700
LC047:  TYA                     ;A = 0
LC048:* STA ($00),y             ;clear address
LC04A:  INY                     ;
LC04B:  BNE -                   ;Repeat for entire page.
LC04D:  DEC $01                 ;Decrement high byte of address.
LC04F:  BMI +                   ;If $01 < 0, all pages are cleared.
LC051:  LDX $01                 ;
LC053:  CPX #$01                ;Keep looping until ram is cleared.
LC055:  BNE -                   ;

;Clear cartridge RAM at $6000-$7FFF.
LC057:* LDY #$7F                ;High byte of start address.
LC059:  STY $01                 ;
LC05B:  LDY #$00                ;Low byte of start address.
LC05D:  STY $00                 ;$0000 points to $7F00
LC05F:  TYA                     ;A = 0
LC060:* STA ($00),y             ;
LC062:  INY                     ;Clears 256 bytes of memory before decrementing to next
LC063:  BNE -                   ;256 bytes.
LC065:  DEC $01                 ;
LC067:  LDX $01                 ;Is address < $6000?
LC069:  CPX #$60                ;If not, do another page.
LC06B:  BCS -                   ; 

LC06D:  LDA #%00001110          ;Verticle mirroring.
                                ;H/V mirroring (As opposed to one-screen mirroring).
                                ;Switch low PRGROM area during a page switch.
                                ;16KB PRGROM switching enabled.
                                ;8KB CHRROM switching enabled.
LC06F:  STA MMCReg0Cntrl        ;

                                ; Y == 0 here
;LC071:  LDY #$00               ;Clear bits 3 and 4 of MMC1 register 3.
LC077:  STY ScrollX             ;ScrollX = 0
LC079:  STY ScrollY             ;ScrollY = 0
LC07B:  STY PPUScroll           ;Clear hardware scroll x
LC07E:  STY PPUScroll           ;Clear hardware scroll y


        INY                     ;
LC082:  STY GameMode            ;Title screen mode
LC084:  JSR ClearNameTables     ;($C158)
LC087:  JSR EraseAllSprites     ;($C1A3)

LC08A:  LDA #%10010000          ;NMI = enabled
                                ;Sprite size = 8x8
                                ;BG pattern table address = $1000
                                ;SPR pattern table address = $0000
                                ;PPU address increment = 1
                                ;Name table address = $2000
LC08C:  STA PPUControl0         ;
LC08F:  STA PPUCNT0ZP           ;

LC091:  LDA #%00000010          ;Sprites visible = no
                                ;Background visible = no
                                ;Sprite clipping = yes
                                ;Background clipping = no
                                ;Display type = color
LC093:  STA PPUCNT1ZP           ;

LC095:  LDA #$47                ;
LC097:  STA MirrorCntrl         ;Prepare to set PPU to vertical mirroring.
LC099:  JSR SetPPUMirror        ;($C4B2)

LC09C:  LDY #$00                ;
LC09E:  STY DMCCntrl1           ;PCM volume = 0 - disables DMC channel

LC0A1:  LDA #$0F                ;
LC0A3:  STA APUCommonCntrl0     ;Enable sound channel 0,1,2,3

        LDA #$B2                ; Setup Audio Entry point high byte
        STA SFXPtrE4UB          ;

;LC0A6:  LDY #$00                ;
LC0A8:  STY TitleRoutine        ;Set title routine and and main routine function
LC0AA:  STY MainRoutine         ;pointers equal to 0.
LC0AC:  LDA #$11                ;
LC0AE:  STA RandomNumber1       ;Initialize RandomNumber1 to #$11
LC0B0:  LDA #$FF                ;
LC0B2:  STA RandomNumber2       ;Initialize RandomNumber2 to #$FF

LC0B4:  INY                     ;Y = 1
LC0B5:  STY SwitchPending       ;Prepare to switch page 0 into lower PRGROM.
LC0B7:  JSR CheckSwitch         ;($C4DE)
LC0BA:  BNE WaitNMIEnd          ;Branch always

;-----------------------------------------[ Main loop ]----------------------------------------------

;The main loop runs all the routines that take place outside of the NMI.

MainLoop:
LC0BC:  JSR CheckSwitch         ;($C4DE)Check to see if memory page needs to be switched.

;-------------------------------------------[ Update timer ]---------------------------------------

;This routine is used for timing - or for waiting around, rather.
;Timer2Delay is decremented every frame. When it hits zero, $2A, and $2B are
;decremented if they aren't already zero. The program can then check
;these variables (it usually just checks $2B) to determine when it's time
;to "move on". This is used for the various sequences of the intro screen,
;when the game is started, when Samus takes a special item, and when GAME
;OVER is displayed, to mention a few examples.

.scope
    UpdateTimers:
    DoTimer1:
        lda Timer1 
        beq DoTimer2 
        dec Timer1 
    DoTimer2:
        dec Timer2Delay 
        bpl _Done 
        lda #$09
        sta Timer2Delay 
        lda Timer2 
        beq _Done 
        dec Timer2 
    _Done:
.scend
;--------------------------------------------------------------------------------------------------

LC0C2:  JSR GoMainRoutine       ;($C114)Go to main routine for updating game.
LC0C5:  INC FrameCount          ;Increment frame counter.
LC0C7:  LDA #$00                ;
LC0C9:  STA NMIStatus           ;Wait for next NMI to end.

WaitNMIEnd:
LC0CC:  LDA NMIStatus           ;
LC0CE:  BNE +                   ;If nonzero, NMI has ended. Else keep waiting.
LC0D0:  BEQ WaitNMIEnd          ;

LC0D3:* JSR RandomNumbers       ;($C000)Update pseudo random numbers.
ReturnToMainLoop:
LC0D6:  JMP MainLoop            ;($C0BC)Jump to top of subroutine.

;-------------------------------------[ Non-Maskable Interrupt ]-------------------------------------

;The NMI is called 60 times a second by the VBlank signal from the PPU. When the
;NMI routine is called, the game should already be waiting for it in the main 
;loop routine in the WaitNMIEnd loop.  It is possible that the main loop routine
;will not be waiting as it is bogged down with excess calculations. This causes
;the game to slow down.

GoSoundEngine_Trampoline:
    JMP GoSoundEngine

NMI:
LC0D9:  PHP                             ;Save processor status, A, X and Y on stack.
LC0DA:  PHA                             ;Save A.
LC0DB:  TXA                             ;
LC0DC:  PHA                             ;Save X.
LC0DD:  TYA                             ;
LC0DE:  PHA                             ;Save Y.
LC0DF:  LDA #$00                        ;
LC0E1:  STA SPRAddress                  ;Sprite RAM address = 0.
LC0E4:  LDA #$02                        ;
LC0E6:  STA SPRDMAReg                   ;Transfer page 2 ($200-$2FF) to Sprite RAM.
LC0E9:  LDA NMIStatus                   ;
LC0EB:  BNE GoSoundEngine_Trampoline    ;Skip if the frame couldn't finish in time.
LC0ED:  LDA GameMode                    ;
LC0EF:  BEQ DoGamePlayPalWrite          ;Branch if mode=Play.
LC0F1:  JSR NMIScreenWrite              ;($9A07)Write end message on screen(If appropriate).

;--------------------------------[ Check and prepare palette write ]---------------------------------

.scope

	CheckPalWrite:
		LC1E4:  LDA TitleRoutine        ;
		LC1E6:  CMP #$1D                ;Is Game at ending sequence? If not, branch
		LC1E8:  BCC DoGamePlayPalWrite  ;
		LC1EA:  JSR EndGamePalWrite     ;($9F54)Write palette data for ending.
				JMP _done
						
	DoGamePlayPalWrite:
		LC1ED:  LDY PalDataPending      ;
		LC1EF:  BEQ LC1F1       ;Is palette data pending? If not, branch.

        	;Prepare to write palette data to PPU.
	SetupPalWrite:
		LC1FF:  DEY                     ;Palette # = PalDataPending - 1.
		LC203:  LDX PalPntrTbl_Lo,y     ;X = low byte of PPU data pointer.
				STX $00
		LC206:  LDA PalPntrTbl_Hi,y     ;
		LC209:  STA $01                 ;A = high byte of PPU data pointer.
		LC20A:  LDA #$00                ;Clear A.
		LC20C:  STA PalDataPending      ;Reset palette data pending byte.
		LC212:  JSR ProcessPPUStr       ;($C30C)Write data string to PPU.
        		JMP _done

		LC1F1:  LDA GameMode            ;
		LC1F3:  BEQ _done      			;Is game being played? If so, branch to exit.
		LC1F5:  LDA TitleRoutine        ;
		LC1F7:  CMP #$15                ;Is intro playing? If not, branch.
		LC1F9:  BCS _done       		;
		LC1FB:  JSR StarPalSwitch       ;($8AC7)Cycles palettes for intro stars twinkle.

	_done:
	
.scend

CheckPPUWrite:
LC2CA:  LDA PPUDataPending          ;
LC2CC:  BEQ WritePPUCtrl            ;If zero no PPU data to write, branch to exit.

 CustomProcessPPUStr:
.scope
    ldy #$00                    ; start at the beginning
    beq _processPPUStr          ; branch always

    _PPUWrite:
        sta PPUAddress          ;Set high PPU address.
        lda PPUDataString+1,y   ;
        sta PPUAddress          ;Set low PPU address.
        lax PPUDataString+2,y   ;Get data byte containing rep length & RLE status.
        asl                     ;Carry Flag = PPU address increment (0 = 1, 1 = 32).

    _SetPPUInc:
        lda PPUCNT0ZP           ;
        ora #$04                ;
        bcs +                   ;PPU increment = 32 only if Carry Flag set,
            and #$FB            ;else PPU increment = 1.
*       sta PPUControl0         ;
        sta PPUCNT0ZP           ;
        txa                     ;Get data byte again.
        and #$3F                ;Keep lower 6 bits as loop counter.
        tax                     ;
        iny
        iny

    _loop:
        iny                     ; advance to next data byte each iteration
        lda PPUDataString,y     ; get next byte
        sta PPUIOReg            ; write it
        dex
        bne _loop

    _afterPPULoop:
        iny

    _processPPUStr:
        ldx PPUStatus           ;Reset PPU address flip/flop.
        lda PPUDataString, y    ;
        bne _PPUWrite           ;If A is non-zero, PPU data string follows,

        ; A is zero here
        sta PPUStrIndex         ;PPU data string has been written so the data
        sta PPUDataString       ;stored for the write is now erased.
        sta PPUDataPending      ;
.scend

WritePPUCtrl:
    lda PPUCNT0ZP    
    sta PPUControl0 

    lda PPUCNT1ZP    
    sta PPUControl1 
    ;lda MirrorCntrl 
    
PrepPPUMirror:
    lda MirrorCntrl         ;Load MirrorCntrl into A.
    jsr SetPPUMirror        ;($C4B6)Set mirroring through MMC1 chip.

LC0FD:
    jsr WriteScroll         ;($C29A)Update h/v scroll reg.

;----------------------------------------[Read joy pad status ]--------------------------------------

;The following routine reads the status of both joypads

ReadJoyPads:
LC215:  LDX #$00                ;Load x with #$00. Used to read status of joypad 1.
LC217:  STX $01                 ;

ReadOnePad:
LC21F:  LDY #$01                ;These lines strobe the        
LC221:  STY CPUJoyPad1          ;joystick to enable the
LC224:  DEY                     ;program to read the 
LC225:  STY CPUJoyPad1          ;buttons pressed.

LC228:  LDY #$08                ;Do 8 buttons.
LC22A:* PHA                     ;Store A.
LC22B:  LDA CPUJoyPad1,x        ;Read button status. Joypad 1 or 2.
LC22E:  STA $00                 ;Store button press at location $00.
LC230:  LSR                     ;Move button push to carry bit.
LC231:  ORA $00                 ;If joystick not connected, 
LC233:  LSR                     ;fills Joy1Status with all 1s.
LC234:  PLA                     ;Restore A.
LC235:  ROL                     ;Add button press status to A.
LC236:  DEY                     ;Loop 8 times to get 
LC237:  BNE -                   ;status of all 8 buttons.

LC239:  LDX $01                 ;Joypad #(0 or 1).
LC23B:  LDY Joy1Status,x        ;Get joypad status of previous refresh.
LC23D:  STY $00                 ;Store at $00.
LC23F:  STA Joy1Status,x        ;Store current joypad status.
LC241:  EOR $00                 ;
LC243:  BEQ +                   ;Branch if no buttons changed.
LC245:  LDA $00                 ;           
LC247:  AND #$BF                ;Remove the previous status of the B button.
LC249:  STA $00                 ;
LC24B:  EOR Joy1Status,x        ;
LC24D:* AND Joy1Status,x        ;Save any button changes from the current frame
LC24F:  STA Joy1Change,x        ;and the last frame to the joy change addresses.
LC251:  STA Joy1Retrig,x        ;Store any changed buttons in JoyRetrig address.
LC253:  LDY #$20                ;
LC255:  LDA Joy1Status,x        ;Checks to see if same buttons are being
LC257:  CMP $00                 ;pressed this frame as last frame.
LC259:  BNE +                   ;If none, branch.
LC25B:  DEC RetrigDelay1,x      ;Decrement RetrigDelay if same buttons pressed.
LC25D:  BNE EndJoypadLoop       ;       
LC25F:  STA Joy1Retrig,x        ;Once RetrigDelay=#$00, store buttons to retrigger.
LC261:  LDY #$08                ;
LC263:* STY RetrigDelay1,x      ;Reset retrigger delay to #$20(32 frames)

EndJoypadLoop:
        CPX #01
        bne GoSoundEngine
LC21C:  INX                     ;Load x with #$01. Used to read status of joypad 2.
LC21D:  INC $01                 ;
        bne ReadOnePad          ; Always jmp (fewer bytes than jmp)

GoSoundEngine:
LC103: JSR SoundEngineEntryPoint      ;($B3B4)Update music and SFX.

;----------------------------------------[ Update age ]----------------------------------------------

;This is the routine which keeps track of Samus' age. It is called in the
;NMI. Basically, this routine just increments a 24-bit variable every
;256th frame. (Except it's not really 24-bit, because the lowest age byte
;overflows at $D0.)

UpdateAge:
LC97E:  lda GameMode            ;
LC980:  bne NMIEnd              ;Exit if at title/password screen.
LC982:  lda MainRoutine         ;
LC984:  cmp #$03                ;Is game engine running?
LC986:  bne NMIEnd              ;If not, don't update age.
LC988:  ldx FrameCount          ;Only update age when FrameCount is zero
LC98A:  bne NMIEnd              ;(which is approx. every 4.266666666667 seconds).
LC98C:  inc SamusAgeLo          ; Minor Age = Minor Age + 1.
LC98F:  lda SamusAgeLo          ;
LC992:  cmp #$D0                ;Has Minor Age reached $D0?
LC994:  bcc NMIEnd              ;If not, we're done.
LC996:  lda #$00                ;Else reset minor age.
LC998:  sta SamusAgeLo          ;
        inc SamusAgeLo+1        ;
        bne NMIEnd              ;Loop to update middle age and possibly major age.
        inc SamusAgeLo+2        ;
        bne NMIEnd              ;
        inc SamusAgeLo+3        ;Branch if middle age overflowed, need to increment 

NMIEnd: 

LC109:  LDY #$01                ; NMI = finished.
LC10B:  STY NMIStatus           ;
LC10D:  PLA                     ;Restore Y.
LC10E:  TAY                     ;
LC10F:  PLA                     ;Restore X.
LC110:  TAX                     ;
LC111:  PLA                     ;restore A.
LC112:  PLP                     ;Restore processor status flags.
LC113:  RTI                     ;Return from NMI.

;----------------------------------------[ GoMainRoutine ]-------------------------------------------

;This is where the real code of each frame is executed.
;MainRoutine or TitleRoutine (Depending on the value of GameMode)
;is used as an index into a code pointer table, and this routine
;is executed.

GoMainRoutine:
LC114:  LDA GameMode            ;0 if game is running, 1 if at intro screen.
LC116:  BEQ MainGameplayRoutine ;Branch if mode=Play.
LC118:  JMP MainTitleRoutine    ;Jump to $8000, where a routine similar to the one
                                ;below is executed, only using TitleRoutine instead
                                ;of MainRoutine as index into a jump table.

MainGameplayRoutine:
LC11B:* LDA Joy1Change          ;
LC11D:  AND #$10                ;Has START been pressed?
LC11F:  BEQ AfterPauseToggle    ;if not, execute current routine as normal.

PauseButtonPressed:
LC121:  LDX MainRoutine         ;
LC123:  CPX #$03                ;Is game engine running?
LC125:  BEQ SetPauseState       ;If yes, check for routine #5 (pause game).
LC127:  CPX #$05                ;Is game paused?
LC129:  BNE AfterPauseToggle    ;If not routine #5 either, don't care about START being pressed.
LC12B:  LDX #$03                ;Otherwise, switch to routine #3 (game engine).
LC12D:  BNE TogglePauseState    ;Branch always.

SetPauseState:
LC12F:* LDX #$05                ;Switch to pause routine.

TogglePauseState:
LC131:* STX MainRoutine         ;(MainRoutine = 5 if game paused, 3 if game engine running).
LC133:  LDA GamePaused          ;
LC135:  EOR #$01                ;Toggle game paused.
LC137:  STA GamePaused          ;

;Set PauseMusic SFX flag
    LDA #MUS_PAUSE
    ORA NoiseSFXFlag
    STA NoiseSFXFlag

AfterPauseToggle:
* LDX MainRoutine 

LDA MainRoutineTable_LoBytes, x
STA CodePtr
LDA MainRoutineTable_HiBytes, x
STA CodePtr + 1
JMP (CodePtr)

MainRoutineTable_HiBytes:
    .byte >AreaInit, >MoreInit, >SamusInit, >GameEngine, >GameOver, >PauseMode, >GoPassword, >IncrementRoutine, >SamusIntro, >WaitTimer
MainRoutineTable_LoBytes:
    .byte <AreaInit, <MoreInit, <SamusInit, <GameEngine, <GameOver, <PauseMode, <GoPassword, <IncrementRoutine, <SamusIntro, <WaitTimer

IncrementRoutine:
LC155:  inc MainRoutine         ;Increment to next routine in above table.
LC157:  rts                     ;

;-------------------------------------[ Clear name tables ]------------------------------------------

; Not worth optimizing
ClearNameTables:
LC158:  JSR ClearNameTable0     ;($C16D)Always clear name table 0 first.
LC15B:  LDA GameMode            ;
LC15D:  BEQ +                   ;Branch if mode = Play.
LC15F:  LDA TitleRoutine        ;
LC161:  CMP #$1D                ;If running the end game routine, clear
LC163:  BEQ ++                  ;name table 2, else clear name table 1.
LC165:* LDA #$02                ;Name table to clear + 1 (name table 1).
LC167:  BNE +++                 ;Branch always.
LC169:* LDA #$03                ;Name table to clear + 1 (name table 2).
LC16B:  BNE ++                  ;Branch always.

ClearNameTable0:
LC16D:* LDA #$01                ;Name table to clear + 1 (name table 0).
LC16F:* STA $01                 ;Stores name table to clear.
LC171:  LDA #$FF                ;
LC173:  STA $00                 ;Value to fill with.

ClearNameTable:
LC175:  LDX PPUStatus           ;Reset PPU address latch.
LC178:  LDA PPUCNT0ZP           ;
LC17A:  AND #$FB                ;PPU increment = 1.
LC17C:  STA PPUCNT0ZP           ;
LC17E:  STA PPUControl0         ;Store control bits in PPU.
LC181:  LDX $01                 ;
LC183:  DEX                     ;Name table = X - 1.
LC184:  LDA HiPPUTable,x        ;get high PPU address.  pointer table at $C19F.
LC187:  STA PPUAddress          ;
LC18A:  LDY #$00                ;Set PPU start address (High byte first).
LC18C:  STY PPUAddress          ;
LC18F:  LDX #$04                ;Prepare to loop 4 times.
LC193:  LDA $00                 ;Fill-value.
LC195:* STA PPUIOReg            ;
LC198:  DEY                     ;
LC199:  BNE -                   ;Loops until the desired name table is cleared.
LC19B:  DEX                     ;It also clears the associated attribute table.
LC19C:  BNE -                   ;
LC19E:  RTS                     ;

;-------------------------------------[ Erase all sprites ]------------------------------------------

.scope
EraseAllSprites:
LC1A3:
    LDY #$00
    LDA #$F4
    _loop: 
        STA $0200,y         ;Stores #$F0 in memory addresses $0200 thru $02FF.
        INY                 ; 
        BNE _loop           ;Loop while more sprite RAM to clear.
    LDA GameMode            ;
    BEQ Exit101             ;Exit subroutine if GameMode=Play(#$00)
    JMP DecSpriteYCoord     ;($988A)Find proper y coord of sprites.

Exit101:
LC1BB:  RTS                 ;Return used by subroutines above and below.

.scend
;---------------------------------------[ Remove intro sprites ]-------------------------------------

;The following routine is used in the Intro to remove the sparkle sprites and the crosshairs
;sprites every frame.  It does this by loading the sprite values with #$F4 which moves the 
;sprite to the bottom right of the screen and uses a blank graphic for the sprite.

RemIntroSprts:
LC1C4:  LDY #$5F                ;Prepare to clear RAM $0200-$025F
LC1C6:  LDA #$F4                ;
LC1C8:* STA $0200,y             ;
LC1CA:  DEY                     ;Loop unitl $200 thru $25F is filled with #$F4.
LC1CB:  BPL -                   ;
LC1CD:  LDA GameMode            ;
LC1CF:  BEQ Exit101             ; branch if mode = Play.
LC1D1:  JMP DecSpriteYCoord     ;($988A)Find proper y coord of sprites.

;-------------------------------------[ PPU writing routines ]---------------------------------------

;Checks if any data is waiting to be written to the PPU.
;RLE data is one tile that repeats several times in a row.  RLE-Repeat Last Entry

PPUWrite:
LC2E4:  STA PPUAddress          ;Set high PPU address.
LC2E7:  INY                     ;
LC2E8:  LDA ($00),y             ;
LC2EA:  STA PPUAddress          ;Set low PPU address.
LC2ED:  INY                     ;
LC2EE:  LDA ($00),y             ;Get data byte containing rep length & RLE status.
LC2F0:  ASL                     ;Carry Flag = PPU address increment (0 = 1, 1 = 32).

;In: CF = desired PPU address increment (0 = 1, 1 = 32).
;Out: PPU control #0 ($2000) updated accordingly.

SetPPUInc:
    TAX                     ;Preserve A.
    LDA PPUCNT0ZP           ;
    ORA #$04                ;
    BCS +                   ;PPU increment = 32 only if Carry Flag set,
        AND #$FB                ;else PPU increment = 1.
*   STA PPUControl0         ;
    STA PPUCNT0ZP           ;
    TXA                     ;Restore A.
    ASL                     ;Carry Flag = bit 6 of byte at ($00),y (1 = RLE).
    LDA ($00),y             ;Get data byte again.
    AND #$3F                ;Keep lower 6 bits as loop counter.
    TAX                     ;

    BCC NonRLE_LoopInit        ;If Carry Flag not set, the data is not RLE.

RLE_LoopInit:
    INY                    ;Data is RLE, move to data byte.
    LDA ($00),y            ;Load RLE byte once
    
RLE_Loop:
    STA PPUIOReg            ; write the repeated value
    DEX
    BNE RLE_Loop
    BEQ After_PPU_Loop

NonRLE_LoopInit:
NonRLE_Loop:
    INY                     ; advance to next data byte each iteration
    LDA ($00),y             ; get next byte
    STA PPUIOReg            ; write it
    DEX
    BNE NonRLE_Loop

After_PPU_Loop:             ;
    INY
    ;Add Y to pointer at $0000. 
    TYA                     ;
    CLC                     ;Add value stored in Y to lower address
    ADC $00                 ;byte stored in $00.
    STA $00                 ;
    BCS Inc_01_and_branch_to_ProcessPPUStr 

;Write data string at ($00) to PPU.

ProcessPPUStr:
    LDX PPUStatus           ;Reset PPU address flip/flop.
    LDY #$00                ;
    LDA ($00),y             ;
    BNE PPUWrite            ;If A is non-zero, PPU data string follows,

WriteScroll:                ;  Write to scroll registers
    LDA PPUStatus           ; Reset scroll register flip/flop
    LDA ScrollX             ;
    STA PPUScroll           ;
    LDA ScrollY             ; X and Y scroll offsets are loaded serially.
    STA PPUScroll           ;
    RTS                     ;

PrepPPUProcess:
    STX $00                 ;Lower byte of pointer to PPU string.
    STY $01                 ;Upper byte of pointer to PPU string.
    BNE ProcessPPUStr       ;Branch always ($C30C)Write data string to PPU.
    ; Safe

Inc_01_and_branch_to_ProcessPPUStr:
    INC $01
    bne ProcessPPUStr       ; branch always
    ; Safe

;Erase blasted tile on nametable.  Each screen is 16 tiles across and 15 tiles down.
EraseTile:
LC328:  LDY #$01                ;
LC32A:  STY PPUDataPending      ;data pending = YES.
LC32C:  DEY                     ;
LC32D:  LAX ($02),y             ;
LC32F:  AND #$0F                ;
LC331:  STA $05                 ;# of tiles horizontally.
LC333:  lda Div16Table, x
LC338:  STA $04                 ;# of tiles vertically.
LC33A:  LDX PPUStrIndex         ;
LC33D:* LDA $01                 ;
LC33F:  JSR WritePPUByte        ;($C36B)write PPU high address to $07A1,PPUStrIndex.
LC342:  LDA $00                 ;
LC344:  JSR WritePPUByte        ;($C36B)write PPU low address to $07A1,PPUStrIndex.
LC347:  LDA $05                 ;data length.
LC349:  STA $06                 ;
LC34B:  JSR WritePPUByte        ;($C36B)write PPU string length to $07A1,PPUStrIndex.
LC34E:* INY                     ;
LC34F:  LDA ($02),y             ;Get new tile to replace old tile.
LC351:  JSR WritePPUByte        ;($C36B)Write it to $07A1,PPUStrIndex, inc x.
LC354:  DEC $06                 ;
LC356:  BNE -                   ;Branch if more horizontal tiles to replace.
LC358:  STX PPUStrIndex         ;
LC35B:  STY $06                 ;
LC35D:  lda #$20                    ;
        clc                         ;Add value stored in Y to lower address
        adc $00                     ;byte stored in $00.
        sta $00                     ;
        bcc LC364                   ;Increment $01(upper address byte) if carry
            INC $01
LC364:  DEC $04                 ;
LC366:  BNE --                  ;Branch if more lines need to be changed on name table.
        lda #$00           
        sta PPUDataString,x
        rts

WritePPUByte:
LC36B:  STA PPUDataString,x     ;Store data byte at end of PPUDataString.

NextPPUByte:
LC36E:  INX                     ;PPUDataString has increased in size by 1 byte.
LC36F:  CPX #PPUMaxSize         ;PPU byte writer can only write a maximum of #$4F bytes
LC371:  BCC +                   ;If PPU string not full, branch to get more data.
LC373:  LDX PPUStrIndex         ;

EndPPUString:
LC376:  LDA #$00                ;If PPU string is already full, or all PPU bytes loaded,
LC378:  STA PPUDataString,x     ;add #$00 as last byte to the PPU byte string.
LC37B:  PLA                     ;
LC37C:  PLA                     ;Remove last return address from stack and jump out of
LC37D:* RTS                     ;PPU writing routines.

SeparateControlBits:
LC3C6:  STA $04                 ;Store current byte
SeparateControlBitsWithoutStoring04:
LC3C8:  AND #$BF                ;
LC3CA:  STA PPUDataString,x     ;Remove RLE bit and save control bit in PPUDataString.
LC3CD:  AND #$3F                ;
LC3CF:  STA $05                 ;Extract counter bits and save them for use above.
LC3D1:  JMP NextPPUByte         ;($C36E)

;----------------------------------------[ Math routines ]-------------------------------------------

;The following two routines add a Binary coded decimal (BCD) number to another BCD number.
;A base number is stored in $03 and the number in A is added/subtracted from $03.  $01 and $02 
;contain the lower and upper digits of the value in A respectively.  If an overflow happens after
;the addition/subtraction, the carry bit is set before the routine returns.

Base10Subtract:

; ExtractNibbles:
LC3FB:
        PHA                     ;
        AND #$0F                ;Lower 4 bits of value to change HealthLo/HealthHi by.
        STA $01                 ;
        PLA                     ;
        AND #$F0                ;Upper 4 bits of value to change HealthLo/HealthHi by.
        STA $02                 ;
        LDA $03                 ;
        AND #$0F                ;Keep lower 4 bits of HealthLo/HealthHi in A.

LC3FE:  SBC $01                 ;Subtract lower nibble from number.
LC400:  STA $01                 ;
LC402:  BCS +                   ;If result is less than zero, add 10 to create
LC404:  ADC #$0A                ;valid result.
LC406:  STA $01                 ;
LC408:  LDA $02                 ;
LC40A:  ADC #$0F                ;Adjust $02 to account for borrowing.
LC40C:  STA $02                 ;
LC40E:* LDA $03                 ;Keep upper 4 bits of HealthLo/HealthHi in A.
LC410:  AND #$F0                ;
LC412:  SEC                     ;
LC413:  SBC $02                 ;If result is greater than zero, branch to finish.
LC415:  BCS +                   ;
LC417:  ADC #$A0                ;Add 10 to create valid result.
LC419:  CLC                     ;
LC41A:* ORA $01                 ;Combine A and $01 to create final value.
LC41C:  RTS                     ;

;---------------------------[ NMI and PPU control routines ]--------------------------------

ScreenOff:
LC439:  LDA PPUCNT1ZP           ;
LC43B:  AND #$E7                ; BG & SPR visibility = off

WriteAndWait:
LC43D: STA PPUCNT1ZP           ;Update value to be loaded into PPU control register.

; Wait for the NMI to end.

WaitNMIPass:
LC434:  LDA #$00                ;Clear NMI byte to indicate the game is
LC436:  STA NMIStatus           ;currently running NMI routines.

WaitNMIPassLoop:
LC442:  LDA NMIStatus            ;
LC444:  BEQ WaitNMIPassLoop     ; Wait for NMI to end before continuing.
LC446:  RTS                     ;

ScreenOn:
LC447:  LDA PPUCNT1ZP           ;
LC449:  ORA #$1E                ;BG & SPR visibility = on
LC44B:  BNE WriteAndWait         ;Branch always

;Turn off both screen and NMI.

ScreenNmiOff:
LC45D:  LDA PPUCNT1ZP           ;
LC45F:  AND #$E7                ;BG & SPR visibility = off
LC461:  JSR WriteAndWait        ;($C43D)Wait for end of NMI.
LC464:  LDA PPUCNT0ZP           ;Prepare to turn off NMI in PPU.
LC466:  AND #$7F                ;NMI = off
LC468:  STA PPUCNT0ZP           ;
LC46A:  STA PPUControl0         ;Actually load PPU register with NMI off value.
ExitSub:
LC46D:  RTS                     ;

VBOffAndHorzWr: 
LC47D:  LDA PPUCNT0ZP           ;
LC47F:  AND #$7B                ;Horizontal write, disable VBlank. 
LC481:* STA PPUControl0         ;Save new values in the PPU control register
LC484:  STA PPUCNT0ZP           ;and PPU status byte.
LC486:  RTS                     ;

NmiOn:
LC487:* LDA PPUStatus           ;
LC48A:  AND #$80                ;Wait for end of VBlank.
LC48C:  BNE -                   ;
LC48E:  LDA PPUCNT0ZP           ;
LC490:  ORA #$80                ;Enable VBlank interrupts.
LC492:  BNE --                  ;Branch always.

;--------------------------------------[ Timer routines ]--------------------------------------------

;The following routines set the timer and decrement it. The timer is set after Samus dies and
;before the GAME OVER message is dispayed.  The timer is also set while the item pickup music
;is playing.

WaitTimer:
LC494:  LDA Timer2              ;Exit if timer hasn't hit zero yet
LC496:  BNE +                   ;
LC498:  LDA NextRoutine         ;Set GameOver as next routine.
LC49A:  CMP #$04                ;
LC49C:  BEQ SetMainRoutine      ;Set GoPassword as main routine.
LC49E:  CMP #$06                ;
LC4A0:  BEQ SetMainRoutine      ;
LC4A2:  JSR StartMusic          ;($D92C)Assume power up was picked up and GameEngine
LC4A5:  LDA NextRoutine         ;is next routine. Start area music before exiting.

SetMainRoutine:
LC4A7:  STA MainRoutine         ;Set next routine to run.
LC4A9:* RTS                     ;

;-----------------------------------[ PPU mirroring routines ]---------------------------------------

;PrepVertMirror:
;LC4B2:  NOP                     ;
;LC4B3:  NOP                     ;Prepare to set PPU for vertical mirroring (again).
;LC4B4:  LDA #$47                ;

SetPPUMirror:
LC4B6:  LSR                     ;
LC4B7:  LSR                     ;Move bit 3 to bit 0 position.
;LC4B8:  LSR                     ;
;LC4B9:  AND #$01                ;Remove all other bits.
LC4B9:  asr #$03
LC4BB:  STA $00                 ;Store at address $00.
LC4BD:  LDA MMCReg0Cntrl        ;
LC4BF:  AND #$FE                ;Load MMCReg0Cntrl and remove bit 0.
LC4C1:  ORA $00                 ;Replace bit 0 with stored bit at $00.
LC4C3:  STA MMCReg0Cntrl        ;
LC4C5:  STA MMC1Reg0            ;
LC4C8:  LSR                     ;
LC4C9:  STA MMC1Reg0            ;
LC4Cc:  LSR                     ;
LC4CD:  STA MMC1Reg0            ;
LC4D0:  LSR                     ;Load new configuration data serially
LC4D1:  STA MMC1Reg0            ;into MMC1Reg0.
LC4D4:  LSR                     ;
LC4D5:  STA MMC1Reg0            ;
Exit27:
LC4D8:  RTS                     ;

;-----------------------------[ Switch bank and init bank routines ]---------------------------------

;This is how the bank switching works... Every frame, the routine below
;is executed. First, it checks the value of SwitchPending. If it is zero,
;the routine will simply exit. If it is non-zero, it means that a bank
;switch has been issued, and must be performed. SwitchPending then contains
;the bank to switch to, plus one.

CheckSwitch:
LC4DE:  LDY SwitchPending       ;
LC4E0:  BEQ Exit27     ;Exit if zero(no bank switch issued). else Y contains bank#+1.

SwitchOK:
    LDA #$00                ;Reset(so that the bank switch won't be performed
    STA SwitchPending       ;every succeeding frame too).
    DEY                     ;Y now contains the bank to switch to.
    STY CurrentBank         ;

LC4E2:  
    JSR ROMSwitch            ;($C4E8)Perform bank switch.

;Calls the proper routine according to the bank number in A.
GoBankInit:
    LDA GoBankTable_LoBytes, y
    STA CodePtr
    LDA GoBankTable_HiBytes, y
    STA CodePtr + 1
    JMP (CodePtr)

GoBankTable_HiBytes:
    .byte >InitBank0, >InitBank1, >InitBank2, >Bank03_Init, >InitBank4, >Bank05_Init
GoBankTable_LoBytes:
    .byte <InitBank0, <InitBank1, <InitBank2, <Bank03_Init, <InitBank4, <Bank05_Init

;Title screen memory page.

InitBank0:
LC533:  STY GamePaused          ;Ensure game is not paused.
LC535:  INY                     ;Y=1.
LC536:  STY GameMode            ;Game is at title routines.
LC538:  JSR ScreenNmiOff        ;($C45D)Waits for NMI to end then turns it off.
LC53B:  JSR CopyMap             ;($A93E)Copy game map from ROM to cartridge RAM $7000-$73FF
LC53E:  JSR ClearNameTables     ;($C158)Erase name table data.

LC541:  LDY #$A0                ;
LC543:* LDA IntroStarsData-1, y             ;
LC546:  STA $6DFF,y             ;Loads sprite info for stars into RAM $6E00 thru 6E9F.
LC549:  DEY                     ;
LC54A:  BNE -                   ;

LC54C:  JSR InitTitleGFX        ;($C5D7)Load title GFX.
LC54F:  JMP NmiOn               ;($C487)Turn on VBlank interrupts.

;Brinstar memory page.

InitBank1:
LC552:  LXA #$00                ; X == A == 0
LC554:  STA GameMode            ;GameMode = play.
LC556:  JSR ScreenNmiOff        ;($C45D)Disable screen and Vblank.
LC559:  LDA MainRoutine         ;
LC55B:  CMP #$03                ;Is game engine running? if so, branch.
LC55D:  BEQ InitBank1_RomSwitch ;Else do some housekeeping first.
LC55F:  TXA                     ; X == A == 0
LC561:  STA MainRoutine         ;Run InitArea routine next.
LC563:  STA InArea              ;Start in Brinstar.
LC565:  STA GamePaused          ;Make sure game is not paused.

ClearRAM_33_DF:
*   STA $33,x               ;Clear RAM addresses $33 through $DF.
    INX                     ;
    CPX #$A0                ;
    BCC -                   ;Loop until all desired addresses are cleared.

    LDY #$0F                ;Clears Samus stats(Health, full tanks, game timer, etc.).
*   STA $0100,y             ;A = 0 here. Load $100 thru $10F with #$00.
    DEY                     ;
    BPL -                   ;Loop 16 times.

InitBank1_RomSwitch:
;LC56D:  tay                     ; A == 0
LC56F:  JSR MMCWriteReg3         ;($C4EF)Load Brinstar memory page into lower 16Kb memory.
        lda #$07
        sta SpareMemD1
BrinstarGFX_Loop:
        ldx SpareMemD1
        ldy BrinstarGFXTable, x
        JSR LoadGFX
        dec SpareMemD1
        bpl BrinstarGFX_Loop
LC575:  JMP NmiOn               ;($C487)Turn on VBlank interrupts.

InitEndGFX:
LC5D0:  LDA #$01                ;
LC5D2:  STA GameMode            ;Game is at title/end game.
LC6C2:  TAY                     ;Y = 1 here. Entry 1 in GFXInfo table.
LC6C4:  JSR LoadGFX             ;($C7AB)Load pattern table GFX.
LC6C7:  LDY #$02                ;Entry 2 in GFXInfo table.
        JSR LoadGFX             ;($C7AB)Load pattern table GFX.
        LDY #$19
        JSR LoadGFX             ;($C7AB)Load pattern table GFX.
        LDY #$16
        JMP LoadGFX

InitTitleGFX:
LC5D7:  LDY #$15                ;Entry 21 in GFXInfo table.
LC5D9:  JSR LoadGFX             ;($C7AB)Load pattern table GFX.

LoadSamusGFX:
    LDY #$00                ;Entry 0 in GFXInfo table.
    JSR LoadGFX             ;($C7AB)Load pattern table GFX.

    lda #$04
    sta SpareMemD1

    lda JustInBailey
    beq SamusGFX_Loop
    inc SpareMemD1
SamusGFX_Loop:
    ldx SpareMemD1
    ldy SamusGFXTable, x
    JSR LoadGFX
    dec SpareMemD1
    bpl SamusGFX_Loop
SamusGFX_AfterLoop:
    rts

InitGFX7:
LC6D6:  LDY #$17                ;Entry 23 in GFXInfo table.
LC6D8:  JSR LoadGFX             ;($C7AB)Load pattern table GFX.
LC6DB:  LDY #$16                ;Entry 22 in GFXInfo table.
;LC6DD:  JMP LoadGFX             ;($C7AB)Load pattern table GFX.

;--------------------------------[ Pattern table loading routines ]---------------------------------

;Y contains the GFX header to fetch from the table above, GFXInfo.

LoadGFX:
LC7AB:  lda #$FF                ;
LC7AD:* clc                     ;Every time y decrements, the entry into the table
LC7AE:  adc #$07                ;is increased by 7.  When y is less than 0, A points
LC7B0:  dey                     ;to the last byte of the entry in the table.
LC7B1:  bpl -                   ;
LC7B3:  tay                     ;Transfer offset into table to Y.

LC7B4:  ldx #$06                ;
LC7B6:* lda GFXInfo,y           ;
LC7B9:  sta $00,x               ;Copy entries from GFXInfo to $00-$06.
LC7BB:  dey                     ;
LC7BC:  dex                     ;
LC7BD:  bpl -                   ;

LC7BF:  lda $00                 ;ROM bank containing the GFX data.
LC7C1:  jsr MMCWriteReg3        ;($C4EF)Switch to that bank.
LC7C4:  lda PPUCNT0ZP           ;
LC7C6:  and #$FB                ;
LC7C8:  sta PPUCNT0ZP           ;Set the PPU to increment by 1.
LC7CA:  sta PPUControl0         ;

;Writes tile data from ROM to VRAM, according to the gfx header data
;contained in $00-$06.

CopyGFXBlock:
LC7D5:  lda $05                 ;
LC7D7:  bne GFXCopyLoop         ;If $05 is #$00, decrement $06 before beginning.
LC7D9:  dec $06                 ;

GFXCopyLoop:
LC7DB:  lda $04                 ;
LC7DD:  sta PPUAddress          ;Set PPU to proper address for GFX block write.
LC7E0:  lda $03                 ;
LC7E2:  sta PPUAddress          ;
LC7E5:  ldy #$00                ;Set offset for GFX data to 0.
LC7E7:* lda ($01),y             ;
LC7E9:  sta PPUIOReg            ;Copy GFX data byte from ROM to Pattern table.
LC7EC:  dec $05                 ;Decrement low byte of data length.
LC7EE:  bne +                   ;Branch if high byte does not need decrementing.
LC7F0:  lda $06                 ;
LC7F2:  beq GFXCopyLoopEnd      ;If copying complete, branch to exit.

LC7F4:  dec $06                 ;Decrement when low byte has reached 0.
LC7F6:* iny                     ;Increment to next byte to copy.
LC7F7:  bne --                  ;
LC7F9:  inc $02                 ;After 256 bytes loaded, increment upper bits of
LC7FB:  inc $04                 ;Source and destination addresses.
LC7FD:  jmp GFXCopyLoop         ;(&C7DB)Repeat copy routine.

GFXCopyLoopEnd:
LC7D0:  ldy CurrentBank         ;

ROMSwitch:
    TYA                     ;
MMCWriteReg3:
    STA MMC1Reg3            ;Write bit 0 of ROM bank #.
    LSR                     ;
    STA MMC1Reg3            ;Write bit 1 of ROM bank #.
    LSR                     ;
    STA MMC1Reg3            ;Write bit 2 of ROM bank #.
    LSR                     ;
    STA MMC1Reg3            ;Write bit 3 of ROM bank #.
    LSR                     ;
    STA MMC1Reg3            ;Write bit 4 of ROM bank #.
MMCWriteRegExit:
    RTS                   ;

;-------------------------------------------[ AreaInit ]---------------------------------------------

AreaInit:
LC801:  lda #$00                ;
LC803:  sta ScrollX             ;Clear ScrollX.
LC805:  sta ScrollY             ;Clear ScrollY.
LC807:  lda PPUCNT0ZP           ;   
LC809:  and #$FC                ;Sets nametable address = $2000.
LC80B:  sta PPUCNT0ZP           ;
LC80D:  inc MainRoutine         ;Increment MainRoutine to MoreInit.
;LC80F:  lda Joy1Status          ;
;LC811:  and #$C0                ;Stores status of both the A and B buttons.
;LC813:  sta ABStatus            ;Appears to never be accessed.
LC815:  jsr EraseAllSprites     ;($C1A3)Clear all sprite info.
LC818:  lda #$10                ;Prepare to load Brinstar memory page.
LC81A:  jsr IsEngineRunning     ;($CA18)Check to see if ok to switch lower memory page.

;------------------------------------------[ MoreInit ]---------------------------------------------

MoreInit:
LC81D:  ldy #$01                ;
LC81F:  sty PalDataPending      ;Palette data pending = yes.
LC821:  lxa #$00                ; A and X = 0
LC826:  stx AtEnding            ;Not playing ending scenes.
LC829:  stx DoorStatus          ;Samus not in door.
LC82B:  stx SamusDoorData       ;Samus is not inside a door.
LC82D:  stx UpdtngPrjctl        ;No projectiles need to be updated.
        sta SamusObjAction

LC830:* cpx #$65                ;Check to see if more RAM to clear in $7A thru $DE.
LC832:  bcs +                   ;
LC834:  sta $7A,x               ;Clear RAM $7A thru $DE.
LC836:* cpx #$FF                ;Check to see if more RAM to clear in $300 thru $3FE.
LC838:  bcs +                   ;
LC83A:  sta ObjAction,x         ;Clear RAM $300 thru $3FE.
LC83D:* inx                     ;
LC83E:  bne ---                 ;Loop until all required RAM is cleared.

LC840:  jsr ScreenOff           ;($C439)Turn off Background and visibility.
LC843:  jsr ClearNameTables     ;($C158)Clear screen data.
LC846:  jsr EraseAllSprites     ;($C1A3)Erase all sprites from sprite RAM.
LC849:  jsr DestroyEnemies      ;($C8BB)

    stx DoorOnNameTable3        ;Clear data about doors on the name tables.
    stx DoorOnNameTable0        ;

    ldx #$02  
    stx ScrollDir               ;Set initial scroll direction as left.

    lda $95D7                   ;Get Samus start x pos on map.
    sta MapPosX                 ;

    lda $95D8                   ;Get Samus start y pos on map.
    sta MapPosY                 ;

LC860:
    lda $95DA               ;Get ??? Something to do with palette switch
    sta PalToggle
LC86C:
    lda #$00
    sta Quarter
    jsr GetRoomNum          ;($E720)Put room number at current map pos in $5A.
*   jsr SetupRoom           ;($EA2B)
    ldy RoomNumber          ;load room number
    iny
    bne -

    ldy CartRAMPtrUB
    sty $01
    ldy CartRAMPtrLB
    sty $00
    lda PPUCNT0ZP
    and #$FB    ; PPU increment = 1
    sta PPUCNT0ZP
    sta PPUControl0
    ldy PPUStatus   ; reset PPU addr flip/flop

; Copy room RAM #0 ($6000) to PPU Name Table #0 ($2000)

    ldy #$20
    sty PPUAddress
    ldy #$00
    sty PPUAddress
    ldx #$04    ; prepare to write 4 pages
*   lda ($00),y
    sta PPUIOReg
    iny
    bne -
    inc $01
    dex
    bne -

    stx $91
    inx      ; X = 1
    stx PalDataPending
    inc MainRoutine         ;SamusInit is next routine to run.
    jmp ScreenOn

; DestroyEnemies
; ==============

DestroyEnemies:
LC8BB:  
    LDA #$00
    TAX
*   CPX #$48
    BCS +
    STA $97,x
*   STA EnStatus,x
    PHA
    PLA
    INX
    BNE --
    STX MetroidOnSamus      ;Samus had no Metroid stuck to her.
    lda CurrentBank
    cmp #TourianBank
    bne Exit106
        JMP Bank03_LA315              ; Tourian Only
    Exit106:
        rts

; SamusInit
; =========
; Code that sets up Samus, when the game is first started.

SamusInit:
LC8D1:  LDA #$08                ;
LC8D3:  STA MainRoutine         ;SamusIntro will be executed next frame.
LC8D5:  LDA #$2C                ;440 frames to fade in Samus(7.3 seconds).
LC8D7:  STA Timer2              ;
IntroMusic_Inline:
        LDA #MUS_FADE_IN 
        ORA MultiSFXFlag
        STA MultiSFXFlag
LC8DC:  LDY #sa_FadeIn0         ;
        STY SamusObjAction      ;Set Samus status as fading onto screen.
        LDX #$00
        STX SamusBlink
        DEX                     ;X = $FF
        STX PipeEnemyStatus
        STX $0730
        STX $0732
        STX $0738
        STX EndTimerLo          ;Set end timer bytes to #$FF as
        STX EndTimerHi          ;escape timer not currently active.
        STX $8B
        STX $8E
        LDY #$27
        LDA InArea
        AND #$0F
        BEQ +                   ;Branch if Samus starting in Brinstar.
        LSR ScrollDir           ;If not in Brinstar, change scroll direction from left
        LDY #$2F                ;to down. and set PPU for horizontal mirroring.
      * STY MirrorCntrl         ;
        STY MaxMissilePickup
        STY MaxEnergyPickup
        LDA $95D9               ;Samus' initial vertical position
        STA ObjectY             ;
        LDA #$80                ;Samus' initial horizontal position
        STA ObjectX             ;
        LDA PPUCNT0ZP           ;
        AND #$01                ;Set Samus' name table position to current name table
        STA ObjectHi            ;active in PPU.
        LDA #$00                ;
        STA HealthLo            ;Starting health is
        LDA #$03                ;set to 30 units.
        STA HealthHi            ;
Exit25:
      * RTS                     ;

;------------------------------------[ Main game engine ]--------------------------------------------

GameEngine:

.scope
    HandleDoorScrolls:

        ldx DoorStatus
        beq _skip
            jsr ScrollDoor
            ldx DoorStatus
            jsr ScrollDoor
        _skip:

.scend

; ===== HANDLE the debug NARPASSWORD =====

    HandleNarPassword:
        lda NARPASSWORD         ;
        beq UpdateWorld         ;
        lda #$03                ;The following code is only accessed if 
        sta HealthHi            ;NARPASSWORD has been entered at the 
        lda #$FF                ;password screen. Gives you new health,
        sta SamusGear           ;missiles and every power-up every frame.
        lda #$05                ;
        sta MissileCount        ;

; ===== THE REAL GUTS OF THE GAME ENGINE! =====

UpdateWorld:
        ldx #$00
LCB2B:  stx SpritePagePos

.scope
    UpdateEnemies:

        ldy EnStatus + $50
        beq _skip1
            ldx #$50       
            jsr DoOneEnemy
        _skip1:

        ldy EnStatus + $40
        beq _skip2
            ldx #$40       
            jsr DoOneEnemy
        _skip2:

        ldy EnStatus + $30
        beq _skip3
            ldx #$30       
            jsr DoOneEnemy
        _skip3:

        ldy EnStatus + $20
        beq _skip4
            ldx #$20       
            jsr DoOneEnemy
        _skip4:

        ldy EnStatus + $10
        beq _skip5
            ldx #$10       
            jsr DoOneEnemy
        _skip5:

        ldy EnStatus + $00
        beq _skip6
            ldx #$00       
            jsr DoOneEnemy
        _skip6:

.scend 

LCB30:  jsr UpdateProjectiles   ;($D4BF)Display of bullets/missiles/bombs.

;--------------------------------------[ Update Samus ]----------------------------------------------

    UpdateSamus:
        LDX #$00                ;Samus data is located at index #$00.
        STX PageIndex           ;
        INX                     ;x=1.
        STX IsSamus             ;Indicate Samus is the object being updated.
        JSR GoSamusHandler      ;($CC1A)Find proper Samus handler routine.
        DEC IsSamus             ;Update of Samus complete.

;-------------------------------------- [ Area Routine ] ----------------------------------------------

.scope
    HandleAreaRoutine:
        lda CurrentBank
        cmp #TourianBank
        bne _skip   
            jsr Bank03_Area_Routine 
    _skip:
.scend

.scope
    HandleUpdateElevatorRoutine:
        ldy ObjAction + $20
        beq _skip
            jsr UpdateElevator                  ;($D7B3)Display of elevators.
    _skip:
.scend

.scope
    HandleUpdateStatuesRoutine:
        ldy $0360
        beq _skip     ;Skip if no statue present
            jsr UpdateStatues                   ;($D9D4)Display of Ridley & Kraid statues.
    _skip:
.scend

.scope
    UpdateEnemyDestruction:  
        lda EnStatus + $C0
        beq _skip1
            ldx #$C0
            jsr DoDestroyOneEnemy
        _skip1:
        lda EnStatus + $C8
        beq _skip2
            ldx #$C8
            jsr DoDestroyOneEnemy
        _skip2:
        lda EnStatus + $D0
        beq _skip3
            ldx #$D0
            jsr DoDestroyOneEnemy
        _skip3:
        lda EnStatus + $D8
        beq _skip4
            ldx #$D8
            jsr DoDestroyOneEnemy
        _skip4:
.scend

.scope
    HandleUpdateMellowMemu:
        lda $6BE4
        beq AfterHandleUpdateMellowMemu
            jsr UpdateMellowMemu            ; update of Mellow/Memu enemies
        AfterHandleUpdateMellowMemu:
.scend

.scope
    UpdateKnR:
        ldx #$B0

    ; goes through B0, A0, 90, 80, 70, 60
    _loop:
        stx PageIndex
        lda $0405,x
        and #$02
        bne _check_enemy_status
            sta EnStatus,x
            beq _skip
    _check_enemy_status:
        ldy EnStatus,x
        beq _skip
            jsr DoOneKnRUpdate
    _skip:
        lax PageIndex
        sbx #$10
        cpx #$50
        bne _loop

.scend

.scope

; destruction of green spinners
UpdateSpinnerDestruction:
    lda $A0 + $0C
    beq _skip1
        ldx #$0C
        jsr DoOneSpinnerDestruction
    _skip1:

    lda $A0 + $08
    beq _skip2
        ldx #$08
        jsr DoOneSpinnerDestruction
    _skip2:

    lda $A0 + $04
    beq _skip3
        ldx #$04
        jsr DoOneSpinnerDestruction
    _skip3:

    lda $A0
    beq _skip4
        ldx #$00
        jsr DoOneSpinnerDestruction
    _skip4:
.scend

.scope
HandleSamusEnterDoor:
    lda DoorStatus              ;The code determines if Samus has entered a door if the-->
    bne _skip                   ;door status is 0, but door data information has been-->
    ldy SamusDoorData           ;written. If both conditions are met, Samus has just-->
    beq _skip                   ;entered a door.
        jsr SamusEnterDoor      ;($8B13)Check if Samus entered a door.
    _skip:
.scend

LCB4E:  jsr DoorHandler         ; display of doors

LCB51:  jsr UpdateTiles         ; tile de/regeneration
LCB54:  jsr CollisionDetection  ; Samus < enemies crash detection
LCB57:  jsr DisplayBar          ;($E0C1)Display of status bar.

.scope
    UpdatePipeEnemies:
        ldx PipeEnemyStatus + $18
        bmi _skip1
            ldy #$18
            jsr DoOnePipeEnemy
        _skip1:

        ldx PipeEnemyStatus + $10
        bmi _skip2
            ldy #$10
            jsr DoOnePipeEnemy
        _skip2:

        ldx PipeEnemyStatus + $08      
        bmi _skip3 
            ldy #$08
            jsr DoOnePipeEnemy
        _skip3:

        ldx PipeEnemyStatus + $00
        bmi _skip4
            ldy #$00
            jsr DoOnePipeEnemy
        _skip4:
.scend

.scope
    ; CheckMissileToggle
    ; ==================
    ; Toggles between bullets/missiles (if Samus has any missiles).

    CheckMissileToggle:
        lda MissileCount
        beq _done       ; exit if Samus has no missiles
        lda Joy1Change
        ora Joy1Retrig
        and #$20    
        beq _done       ; exit if SELECT not pressed
        lda MissileToggle
        eor #$01                     ; 0 = fire bullets, 1 = fire missiles
        sta MissileToggle
        jsr SelectSamusPal

_done:

.scend

jsr UpdateItems             ;($DB37)Display of power-up items.

; Don't kow what this is doing. Seems to be some kind of timer thing
.scope
    LFDE3:  
        lda EndTimerHi
        cmp #$99
        bne _loopPrep
        clc
        sbc EndTimerLo      ; A = zero if timer just started
        bne _loopPrep      ; branch if not
        sta $06
        lda #$38
        sta $07
        jsr LDC54
    _loopPrep:
        ldx #$20
    _loop:
        lda $0758,x
        sec
        sbc #$02
        bne _endloop
        sta $06
        inc $0758,x
        txa
        lsr
        adc #$3C
        sta $07
        jsr LDC54
        txa
        sbx #$08
        bne _Loop
        jsr LDC54
    _endloop:
.scend

; Clear ram from unused objects
; Could possibly cause bugs if the SpritePagePos is really high
    ldx SpritePagePos
ClearSpriteRamLoop:
    ldy SpriteRAM,x
    cpy #$F4
    beq AfterClearSpriteRam
        lda #$F4
        sta SpriteRAM,x
        sta SpriteRAM+4,x
        sta SpriteRAM+8,x
        sta SpriteRAM+12,x
        txa
        sbx #$F0
        bne ClearSpriteRamLoop      ; always branch

AfterClearSpriteRam:

LC948:  lda MiniBossKillDly     ;
LC94B:  ora PowerUpDelay        ;Check if mini boss was just killed or powerup aquired.
LC94E:  beq StartDeathCheck     ;If not, branch.

LC950:  lda #$00                ;
LC952:  sta MiniBossKillDly     ;Reset delay indicators.
LC955:  sta PowerUpDelay        ;
LC958:  lda #$18                ;Set timer for 240 frames(4 seconds).
LC95A:  ldx #$03                ;GameEngine routine to run after delay expires
LC95C:  jsr SetTimer            ;($C4AA)Set delay timer and game engine routine.

StartDeathCheck:
LC95F:  lda SamusObjAction      ;Check is Samus is dead.
LC962:  cmp #sa_Dead2           ;Is Samus dead?
LC964:  bne GameEngineExit      ;exit if not.
LC966:  lda AnimDelay           ;Is Samus still exploding?
LC969:  bne GameEngineExit      ;Exit if still exploding.

SilenceMusic_Inline:
        lda #MUS_NONE
        ora NoiseSFXFlag
        sta NoiseSFXFlag

LC96E:  lda MthrBrainStatus     ;
LC970:  cmp #$0A                ;Is mother brain already dead? If so, branch.
LC972:  beq StartGameEgine      ;
LC974:  lda #$04                ;Set timer for 40 frames (.667 seconds).
        tax
SetTimer:
        STA Timer2              ;Set Timer2. Frames to wait is value stored in A*10.
        STX NextRoutine         ;Save routine to jump to after Timer2 expires.
        LDA #$09                ;Next routine to run is WaitTimer.
        STA MainRoutine
        RTS            

StartGameEgine:
LC97B:  inc MainRoutine         ;Next routine to run is GameOver.
GameEngineExit:
LC97D:  rts                     ;

;-------------------------------------------[ Game over ]--------------------------------------------

GameOver:
LC9A6:  lda #$1C                ;GameOver is the next routine to run.
LC9A8:  sta TitleRoutine        ;
LC9AA:  lda #$01                ;
LC9AC:  sta SwitchPending       ;Prepare to switch to title memory page.
LC9AE:  jmp ScreenOff           ;($C439)Turn screen off.

;------------------------------------------[ Pause mode ]--------------------------------------------

PauseMode:
LC9B1:  lda Joy2Status          ;Load buttons currently being pressed on joypad 2.
LC9B3:  and #$88                ;
LC9B5:  eor #$88                ;both A & UP pressed?
LC9B7:  bne Exit14              ;Exit if not.
LC9B9:  ldy EndTimerHi          ;
LC9BC:  iny                     ;Is escape timer active?
LC9BD:  bne Exit14              ;Sorry, can't quit if this is during escape scence.
LC9BF:  sta GamePaused          ;Clear pause game indicator.
LC9C1:  inc MainRoutine         ;Display password is the next routine to run.

Exit14:
LC9C3:  rts                     ;Exit for routines above and below.

;------------------------------------------[ GoPassword ]--------------------------------------------

GoPassword:
LC9C4:  lda #$19                ;DisplayPassword is next routine to run.
LC9C6:  sta TitleRoutine        ;
LC9C8:  lda #$01                ;
LC9CA:  sta SwitchPending       ;Prepare to switch to intro memory page.
LC9CC:  lda NoiseSFXFlag        ;
LC9CF:  ora #$01                ;Silence music.
LC9D1:  sta NoiseSFXFlag        ;
LC9D4:  jmp ScreenOff           ;($C439)Turn off screen.

;-----------------------------------------[ Samus intro ]--------------------------------------------

SamusIntro:
LC9D7:  jsr EraseAllSprites     ;($C1A3)Clear all sprites off screen.
LC9DA:  ldy SamusObjAction      ;Load Samus' fade in status.
LC9DD:  lda Timer2              ;
LC9E0:  bne +                   ;Branch if Intro still playing.
    
;Fade in complete.
LC9E2:  sta ItemRmMusicSts      ;Make sure item room music is not playing.
LC9E4:  lda #sa_Begin           ;Samus facing forward and can't be hurt.
LC9E6:  sta SamusObjAction      ;
LC9E8:  jsr StartMusic          ;($D92C)Start main music.
LC9EB:  jsr SelectSamusPal      ;($CB73)Select proper Samus palette.
LC9EE:  lda #$03                ;
LC9F0:  sta MainRoutine         ;Game engine will be called next frame.

;Still fading in.
LC9F2:* cmp #$1F                ;When 310 frames left of intro, display Samus.
LC9F4:  bcs Exit14              ;Branch if not time to start drawing Samus.
LC9F6:  cmp SamusFadeTmTbl-20,y ;sa_FadeIn0 is beginning of table.
LC9F9:  bne +                   ;Every time Timer2 equals one of the entries in the table
LC9FB:  inc SamusObjAction      ;below, change the palette used to color Samus.
LC9FE:  sty PalDataPending      ;
LCA00:* lda FrameCount          ;Is game currently on an odd frame?
LCA02:  lsr                     ;If not, branch to exit.
LCA03:  bcc Exit14              ;Only display Samus on odd frames [the blink effect].
LCA05:  lda #an_SamusFront      ;Samus front animation is animation to display.
LCA07:  jsr SetSamusAnim        ;($CF6B)while fading in.
;LCA0A:  lda #$00                ;  SetSamusAnim sets A register to 0 already
LCA0C:  sta SpritePagePos       ;Samus sprites start at Sprite 0.
LCA0E:  sta PageIndex           ;Samus RAM is first set of RAM.
LCA10:  jmp AnimDrawObject      ;($DE47)Draw Samus on screen.

;---------------------------------[ Check if game engine running ]-----------------------------------

IsEngineRunning:
LCA18:  ldy MainRoutine         ;If Samus is fading in or the wait timer is
LCA1A:  cpy #$07                ;active, return from routine.
LCA1C:  beq Exit14              ;
LCA1E:  cpy #$03                ;Is game engine running?
LCA20:  bne Exit14              ;If yes, continue to SwitchBank.

;-----------------------------------------[ Switch bank ]--------------------------------------------

;Switch to appropriate area bank

SwitchBank:
LCA23:* STA InArea              ;Save current area Samus is in.
LCA25:  AND #$0F                ;
LCA27:  TAY                     ;Use 4 LSB to load switch pending offset from BankTable table.
LCA28:  LDA BankTable,y         ;Base is $CA30.
LCA2B:  STA SwitchPending       ;Store switch data.
LCA2D:  JMP CheckSwitch         ;($C4DE)Switch lower 16KB to appropriate memory page.

;------------------------------------[ Select Samus palette ]----------------------------------------

; Select the proper palette for Samus based on:
; - Is Samus wearing Varia (protective suit)?
; - Is Samus firing missiles or regular bullets?
; - Is Samus with or without suit?

SelectSamusPal:
    lda SamusGear
    asl
    asl
    asl                         ;CF contains Varia status (1 = Samus has it)
    lda MissileToggle           ;A = 1 if Samus is firing missiles, else 0
    rol                         ;Bit 0 of A = 1 if Samus is wearing Varia
    adc #$02
    dec JustInBailey            ;In suit? Doing a dec inc
    bne SkipZeroSuit            ;If so, Branch.
        clc
        adc #$17                ;Add #$17 to the pal # to reach "no suit"-palettes.
SkipZeroSuit:
    inc JustInBailey           
    sta PalDataPending          ;Palette will be written next NMI.
SelectSamusPalExit:
    rts                         ;
        
;---------------------------------------[ Samus Handler ]-------------------------------------------
; HUGBEES #2 - 10% of averge frame time is spent here
GoSamusHandler:
    LDX SamusObjAction                              ;
    BMI SamusStand                                  ;Branch if Samus is standing.
    BEQ SamusStand
    LDA GoSamusHandlerTable_LoBytes - 1, x          ; Adding the -1 because SamusStand is already taken care of. Doesn't need to be in the list
    STA CodePtr
    LDA GoSamusHandlerTable_HiBytes - 1, x
    STA CodePtr + 1
    JMP (CodePtr)

;Pointer table for Samus' action handlers.
GoSamusHandlerTable_HiBytes:
    .byte >SamusRun, >SamusJump, >SamusRoll, >SamusPntUp, >SamusDoor, >SamusJump, >SamusElevator, >SamusDead, >SamusDead2 

GoSamusHandlerTable_LoBytes:
    .byte <SamusRun, <SamusJump, <SamusRoll, <SamusPntUp, <SamusDoor, <SamusJump, <SamusElevator, <SamusDead, <SamusDead2 

;---------------------------------------[ Samus standing ]-------------------------------------------

SamusStand:
LCC36:  LDA Joy1Status          ;Status of joypad 1.
LCC38:  AND #$CF                ;Remove SELECT & START status bits.
LCC3A:  BEQ +                   ;Branch if no buttons pressed.
LCC3C:  JSR ClearHrztAnimData   ;($CF5D)Set no horiontal movement and single frame animation.
LCC3F:  LDA Joy1Status          ;
LCC41:* AND #$07                ;Keep status of DOWN/LEFT/RIGHT.
LCC43:  BNE +                   ;Branch if any are pressed.
LCC45:  LDA Joy1Change          ;
LCC47:  AND #$08                ;Check if UP was pressed last frame.
LCC49:  BEQ +++                 ;If not, branch.
LCC4B:* JSR BitScan             ;($E1E1)Find which directional button is pressed.
LCC4E:  CMP #$02                ;Is down pressed?
LCC50:  BCS +                   ;If so, branch.
LCC52:  STA SamusDir            ;1=left, 0=right.
LCC54:* TAX                     ;
LCC55:  LDA ActionTable,x       ;Load proper Samus status from table below.
LCC58:  STA SamusObjAction      ;Save Samus status.
LCC5B:* LDA Joy1Change          ;
LCC5D:  ORA Joy1Retrig          ;Check if fire was just pressed or needs to retrigger.
LCC5F:  ASL                     ;
LCC60:  BPL +                   ;Branch if FIRE not pressed.
LCC62:  JSR FireWeapon          ;($D1EE)Shoot left/right.
LCC65:* BIT Joy1Change          ;Check if jump was just pressed.
LCC67:  BPL +                   ;Branch if JUMP not pressed.
LCC69:  LDA #sa_Jump            ;
LCC6B:  STA SamusObjAction      ;Set Samus status as jumping.
LCC6E:* LDA #$04                ;Prepare to set animation delay to 4 frames.
LCC70:  JSR SetSamusData        ;($CD6D)Set Samus control data and animation.
LCC73:  LDX SamusObjAction      ;
LCC76:  CPX #sa_Door            ;Is Samus inside a door, dead or pointing up and jumping?
LCC78:  BCS Exit9               ;If so, branch to exit.

LDA SamusStandTable_LoBytes, x
STA CodePtr
LDA SamusStandTable_HiBytes, x
STA CodePtr + 1
JMP (CodePtr)

SamusStandTable_HiBytes:
    .byte >Exit9, >SetSamusRun, >SetSamusJump, >SetSamusRoll, >SetSamusPntUp

SamusStandTable_LoBytes:
    .byte <Exit9, <SetSamusRun, <SetSamusJump, <SetSamusRoll, <SetSamusPntUp

;----------------------------------------------------------------------------------------------------

SetSamusRun:
    ldx #an_SamusRun    ; #an_SamusRun == #$00

    lda #$09
    sta WalkSoundDelay

    lda AnimResetIndex
    cmp #an_SamusStand          ; #an_SamusStand == #$07
    beq SetSamusRunAnimationResetIndex
        ldx #an_SamusRunPntUp   ; #an_SamusRun == #$37

        cmp #an_SamusPntUp      ; #an_SamusPntUp == #$27
        beq SetSamusRunAnimationResetIndex
            lda #$04
            sta AnimIndex

            lda #$00     
            sta AnimDelay

SetSamusRunAnimationResetIndex:
    stx AnimResetIndex

SetRunAccelerationToSamusDir:
    ldx SamusDir

SetRunAcceleration:  
    lda RunAccelerationTbl,x
    sta SamusHorzAccel
Exit9:
    rts

; SamusRun
; ========

SamusRun:
LCCC2:
    ldx SamusDir
    lda SamusGravity
    beq AfterHandleGravity

    ldy SamusJmpDsplcmnt
    bit ObjVertSpeed
    bmi +
    cpy #$18
    bcs ++++
    lda #an_SamusJump
    sta AnimResetIndex
    bcc ++++      ; branch always
*   cpy #$18
    bcc +++
    lda AnimResetIndex
    cmp #an_SamusFireJump
    beq +
    lda #an_SamusSalto
    sta AnimResetIndex
*   cpy #$20
    bcc ++
    lda Joy1Status
    and #$08
    beq +
    lda #an_SamusJmpPntUp
    sta AnimResetIndex
*   bit Joy1Status
    bmi +
    jsr StopVertMovement        ;($D147)

*   lda #an_SamusRun
    cmp AnimResetIndex
    bne +
    lda #an_SamusJump
    sta AnimResetIndex
*   lda SamusInLava
    beq +
    lda Joy1Change
    bmi LCD40       ; branch if JUMP pressed
*   jsr LCF88
    jsr LD09C
    jsr SetSamusHorzAccl
    lda #$02
    bne SetSamusData       ; branch always

AfterHandleGravity:
*   lda SamusOnElevator
    bne +
    jsr SetRunAcceleration
*   jsr LCDBF
    dec WalkSoundDelay  ; time to play walk sound?
    bne +               ; branch if not
    lda #$09
    sta WalkSoundDelay  ; # of frames till next walk sound trigger

SFXSamusWalk_Inline1:
    lda #$08
    ora NoiseSFXFlag
    sta NoiseSFXFlag

*   jsr SetSamusHorzAccl
    lda Joy1Change
    bpl +      ; branch if JUMP not pressed
LCD40:  
    jsr SetSamusJump
    lda #$20
    sta SamusHorzSpdMax
    jmp LCD6B

*   ora Joy1Retrig
    asl
    bpl ++      ; branch if FIRE not pressed

    jsr FireWeapon          ;($D1EE)Shoot left/right.
    lda Joy1Status
    and #$08
    bne +
    lda #an_SamusFireRun
    sta AnimIndex
    bne AfterShooting       ; always branch

*   lda AnimIndex
    sec
    sbc AnimResetIndex
    and #$03
    tax
    lda Table05,x
    jsr SetSamusNextAnim
AfterShooting:
*   lda Joy1Status
    and #$03
    bne +
    jsr StopHorzMovement
    jmp LCD6B

*   jsr BitScan         ;($E1E1)
    cmp SamusDir
    beq LCD6B
    sta SamusDir
    jsr SetSamusRun
LCD6B:
    lda #$03

;---------------------------------------[ Set Samus data ]-------------------------------------------

;The following function sets various animation and control data bytes for Samus.

SetSamusData:
LCD6D:  JSR UpdateObjAnim       ;($DC8F)Update animation if needed.
LCD70:  JSR IsScrewAttackActive     ;($CD9C)Check if screw attack active to change palette.
LCD73:  BCS +               ;If screw attack not active, branch to skip palette change.
LCD75:  LDA FrameCount      ;
LCD77:  asr #$07            ; Every other frame, change Samus palette while screw
LCD7A:  ORA #$A0            ;Attack is active.
LCD7C:  STA ObjectCntrl         ;
LCD7E:* JSR CheckHealthStatus       ;($CDFA)Check if Samus hit, blinking or Health low.
LCD81:  JSR LavaAndMoveCheck        ;($E269)Check if Samus is in lava or moving.
LCD84:  LDA MetroidOnSamus      ;Is a Metroid stuck to Samus?
LCD86:  BEQ LCD8C               ;If not, branch.
LCD88:  LDA #$A1                ;Metroid on Samus. Turn Samus blue.
LCD8A:  STA ObjectCntrl         ;
LCD8C:
        LDA SamusDir
        BEQ SetSamusDrawFrameCall
        LDA #$10                ;
        ORA ObjectCntrl         ;
        STA ObjectCntrl
SetSamusDrawFrameCall:
LCD8F:  JMP DrawFrame           ;($DE4A)Display Samus.

;---------------------------------[ Set mirror control bit ]-----------------------------------------

SetmirrorCntrlBit:
LCD4B:  
        LDA SamusDir            ;Facing left=#$01, facing right=#$00.
        BEQ +                   ;
        LDA #$10                ;
        ORA ObjectCntrl         ;
        STA ObjectCntrl         ;Use SamusDir bit to set mirror bit.
*       RTS                     ;

;------------------------------[ Check if screw attack is active ]-----------------------------------

IsScrewAttackActive:
    SEC                     ;Assume screw attack is not active.
    LDY SamusObjAction      ;
    DEY                     ;Is Samus running?
    BNE ScrewAttackExit     ;If not, branch to exit.
    LDA SamusGear           ;
    AND #gr_SCREWATTACK     ;Does Samus have screw attack?
    BEQ ScrewAttackExit     ;If not, branch to exit.
    LDA AnimResetIndex      ;
    CMP #an_SamusSalto      ;Is Samus summersaulting?
    BEQ +                   ;If so, branch to clear carry(screw attack active).
        CMP #an_SamusJump   ;
        SEC                 ;Is Samus jumping?
        BNE ScrewAttackExit ;If not, branch to exit.
        BIT ObjVertSpeed    ;If Samus is jumping and still moving upwards, screw 
        BPL ScrewAttackExit ;attack is active.
*   CMP AnimIndex           ;Screw attack will still be active if not spinning, but
ScrewAttackExit:
    RTS                     ;jumping while running and still moving upwards.

;----------------------------------------------------------------------------------------------------

; Note - the pla x2 thing makes this tough to inline
LCDBF:
    lda Joy1Status
    asr #$08
    lsr
    lsr
    tax
    lda RunAnimationTbl,x
    cmp AnimResetIndex
    beq ScrewAttackExit
    jsr SetSamusAnim
    pla
    pla
    jmp LCD6B

CheckHealthStatus:
    lda SamusHit            ;
    and #$20            ;Has Samus been hit?
    beq +++             ;If not, branch to check if still blinking from recent hit.
    lda #$32            ;
    sta SamusBlink          ;Samus has been hit. Set blink for 32 frames.
    lda #$FF
    sta DmgPushDir
    lda $73
    sta $77
    beq ++
    bpl +

SFX_SamusHit_Inline:
    lda #SFX_SMS_HIT
    ora MultiSFXFlag
    sta MultiSFXFlag

*   lda SamusHit
    asr #$08
    lsr
    lsr
    sta DmgPushDir

*   lda #$FD
    sta ObjVertSpeed

    lda #$38                ;Samus is hit. Store Samus hit gravity.
    sta SamusGravity        ;
    
; jsr IsSamusDead
    lda SamusObjAction
    and #$08

    beq +
    bne CheckHealthBeep

*   lda SamusBlink
    beq CheckHealthBeep

    dec SamusBlink
    ldx DmgPushDir
    inx
    beq +++
    lsr
    lsr
    lsr
    lsr
    cmp #$03
    bcs +
    ldy SamusHorzAccel
    bne +++
    jsr LCF4E
*   dex
    bne +

    eor #$FF
    clc
    adc #$01
*   sta ObjHorzSpeed

*   lda $77
    bpl CheckHealthBeep
    lda FrameCount
    and #$01
    bne CheckHealthBeep
    sta AnimDelay
    ldy #$F7
    sty AnimFrame

CheckHealthBeep:
    ldy HealthHi
    dey
    bmi +
    bne ++
    lda HealthLo
    cmp #$70
    bcs ++
; health < 17
*   lda FrameCount
    and #$0F
    bne +               ;Only beep every 16th frame.
SFXBeep_Inline:
    lda #SFX_BEEP
    ora TriangleSFXFlag
    sta TriangleSFXFlag
*   lda #$00
    sta SamusHit
Exit3:
LCE83:  rts

;----------------------------------------[ Subtract health ]-----------------------------------------

SubtractHealth:
; TODO: Just don't call subtract health if there is no health change
LCE92:  lda HealthLoChange      ;Check to see if health needs to be changed.
LCE94:  ora HealthHiChange      ;If not, branch to exit.
LCE96:  beq Exit3               ;

SubtractHealthNoGuard:
; TODO: Just don't call Subtract health is Samus is dead
;LCE98:  jsr IsSamusDead         ;($CE84)Check if Samus is already dead.
        lda SamusObjAction
        and #$08
LCE9B:  bne ClearPendingDamage         ;Samus is dead. Branch to clear damage values.

LCE9D:  ldy EndTimerHi          ;If end escape timer is running, Samus cannot be hurt.
LCEA0:  iny                     ;
LCEA1:  bne ClearPendingDamage         ;Branch if end escape timer not active.

LCEA6:* lda MthrBrainStatus     ;If mother brain is in the process of dying, receive
LCEA8:  cmp #$03                ;no damage.
LCEAA:  bcs ClearPendingDamage  ;

LCEAC:  lda SamusGear           ;
LCEAF:  and #gr_VARIA           ;Check is Samus has Varia.
LCEB1:  beq DoHealthSubtration                   ;
LCEB3:  lsr HealthLoChange      ;If Samus has Varia, divide damage by 2.
LCEB5:  lsr HealthHiChange      ;
LCEB7:  bcc DoHealthSubtration               ;If HealthHi moved a bit into the carry flag while
LCEB9:  lda #$4F            ;dividing, add #$4F to HealthLo for proper
LCEBB:  adc HealthLoChange      ;division results.
LCEBD:  sta HealthLoChange      ;

DoHealthSubtration:
LCEBF:* lda HealthLo            ;Prepare to subtract from HealthLo.
LCEC2:  sta $03             ;
LCEC4:  lda HealthLoChange      ;Amount to subtract from HealthLo.
LCEC6:  sec             ;
LCEC7:  jsr Base10Subtract      ;($C3FB)Perform base 10 subtraction.
LCECA:  sta HealthLo            ;Save results.

LCECD:  lda HealthHi           ;Prepare to subtract from HealthHi.
LCED0:  sta $03             ;
LCED2:  lda HealthHiChange      ;Amount to subtract from HealthHi.
LCED4:  jsr Base10Subtract      ;($C3FB)Perform base 10 subtraction.
LCED7:  sta HealthHi            ;Save Results.

LCEDA:  lda HealthLo            ;
LCEDD:  and #$F0                ;Is Samus health at 0?  If so, branch to
LCEDF:  ora HealthHi            ;begin death routine.
LCEE2:  beq SamusWasKilled      ;
        bcc SamusWasKilled      ;

ClearPendingDamage:
    lda #$00
    sta HealthLoChange
    sta HealthHiChange
    rts

SamusWasKilled:
LCEE6:  lda #$00                ;Samus is dead.
LCEE8:* sta HealthLo 
LCEEB:  sta HealthHi            ;Set health to #$00.
LCEEE:  lda #sa_Dead            ; #sa_Dead == 7
LCEF0:  sta SamusObjAction      ;Death handler.

SFX_SamusDie_Inline:
        lda #SFX_SMS_DIE        ; #SFX_SMS_DIE == #$80
        ora TriangleSFXFlag
        sta TriangleSFXFlag

SetSamusExplode:
    lda #$50
    sta SamusJmpDsplcmnt
    lda #an_Explode             ; #an_Explode == #$32
    jsr SetSamusAnim
    sta ObjectCounter
    rts

;----------------------------------------------------------------------------------------------------

SetSamusHorzAccl:  
    LDA SamusHit
    asr #$05
    BEQ EXIT_46
    BCS +
    LDA SamusHorzAccel
    BMI EXIT_46
    BPL ++
*   LDA SamusHorzAccel
    BMI +
    BNE EXIT_46
*   eor #$FF
    adc #$00                ;Carry is always set here
    STA SamusHorzAccel

ClearHorzMvmntData:
LCF4C:  LDY #$00                ;
LCF4E:  STY ObjHorzSpeed        ;Set Samus Horizontal speed and horizontal
        STY HorzCntrLinear      ;linear counter to #$00.
EXIT_46:
*       RTS                     ;

StopHorzMovement:
LCF55:  LDA SamusHorzAccel      ;Is Samus moving horizontally?
        BNE ClearHrztAnimData   ;If so, branch to stop movement.

SFXSamusWalk_Inline2:
        LDA #SFX_SMS_WLK
        ORA NoiseSFXFlag
        STA NoiseSFXFlag

ClearHrztAnimData:
LCF5D:  JSR NoHorzMoveNoDelay   ;($CF81)Clear horizontal movement and animation delay data.
        STY SamusObjAction      ;Samus is standing.
        LDA Joy1Status          ;
        AND #$08                ;Is The up button being pressed?
        BNE +                   ;If so, branch.
        LDA #an_SamusStand      ;Set Samus animation for standing.

SetSamusAnim:
LCF6B:  STA AnimResetIndex      ;Set new animation reset index.

SetSamusNextAnim:
        STA AnimIndex           ;Set new animation data index.
        LDA #$00                ;
        STA AnimDelay           ;New animation to take effect immediately.
        RTS                     ;

SetSamusPntUp:
LCF77:* LDA #sa_PntUp           ;
        STA SamusObjAction      ;Samus is pointing up.
        LDA #an_SamusPntUp      ;
        JSR SetSamusAnim        ;($CF6B)Set new animation values.

NoHorzMoveNoDelay:
LCF81:  JSR ClearHorzData       ;($CFB7)Clear all horizontal movement data.
        STY AnimDelay           ;Clear animation delay data.
        RTS                     ;

LCF88:  LDA Joy1Status
        AND #$03
        BEQ ApplyGravity
        JSR BitScan             ;($E1E1)
        TAX
        JSR SetRunAcceleration
        LDA SamusGravity
        BMI ClearHorzDataExit
        LDA AnimResetIndex
        CMP #an_SamusSalto
        BEQ ClearHorzDataExit
        STX SamusDir
        LDA Table06+1,x
        JMP SetSamusAnim
ApplyGravity:
        LDA SamusGravity
        BMI ClearHorzDataExit
        BEQ ClearHorzDataExit
        LDA AnimResetIndex
        CMP #an_SamusJump
        BNE ClearHorzDataExit

ClearHorzData:
        JSR ClearHorzMvmntData  ;($CF4C)Clear horizontal speed and linear counter.
        STY SamusHorzAccel      ;Clear horizontal acceleration data.
ClearHorzDataExit:
        RTS                     ;

SetSamusJump:
LCFC3:  LDY #an_SamusJump

AfterSamusJumpSet:
      * STY AnimResetIndex
        DEY
        STY AnimIndex

        LDA #$04
        STA AnimDelay

        LDA #$00
        STA SamusJmpDsplcmnt

        LDA #$FC
        STA ObjVertSpeed

        LDX SamusObjAction
        DEX
        BNE SFX_SamusJump_Inline2    ; branch if Samus is standing still
        LDA SamusGear
        AND #gr_SCREWATTACK
        BEQ SFX_SamusJump_Inline2    ; branch if Samus doesn't have Screw Attack
        stx $0686                    ; X == 0 here

SFX_ScrewAttack_Inline:
        LDA #SFX_SCRW_ATK
        ORA NoiseSFXFlag
        STA NoiseSFXFlag

SFX_SamusJump_Inline2:
      * LDA #SFX_SMS_JMP
        ORA SQ1SFXFlag
        STA SQ1SFXFlag

        LDY #$18                ; gravity (high value -> low jump)
        LDA SamusGear
        AND #gr_HIGHJUMP
        BEQ +                   ; branch if Samus doesn't have High Jump
        ;LDY #$12                ; lower gravity value -> high jump!
        LDY #$0D                ; HACK - while developing, make her jump higher
*       STY SamusGravity
        RTS

SamusJump:
    ldy #$00
    LDA SamusJmpDsplcmnt
    BIT ObjVertSpeed
    BPL LD055      ; branch if falling down
    CMP #$20
    BCC LD055      ; branch if jumped less than 32 pixels upwards
    BIT Joy1Status
    BMI LD055      ; branch if JUMP button still pressed
    ;Stop Vertical Movement        ;($D147)Stop jump (start falling).
    sty ObjVertSpeed
    sty VertCntrLinear

LD055:  
    ldx #$01
    lda Joy1Status
    lsr
    bcs +                       ; branch if RIGHT pressed
    dex
    lsr
    bcc ++++                    ; branch if LEFT not pressed

    dex
    iny
*   cpy SamusDir
    beq +++
    lda SamusObjAction
    cmp #sa_PntJump
    bne +
    lda AnimResetIndex
    cmp Table04,y
    bne ++
    lda Table04+1,y
    bne ++                      ; branch always

*   lda AnimResetIndex
    cmp Table06,y
    bne +
    lda Table06+1,y
*   jsr SetSamusAnim
    lda #$08
    sta AnimDelay
    sty SamusDir
*   stx ObjHorzSpeed

    JSR SetSamusHorzAccl
    LDA Joy1Status
    AND #$08     ; UP pressed?
    BEQ +      ; branch if not

    LDA #an_SamusJmpPntUp
    STA AnimResetIndex

    LDA #sa_PntJump      ; "jumping & pointing up" handler
    STA SamusObjAction

*   JSR LD09C
    LDA SamusInLava
    BEQ +
    LDA Joy1Change
    BPL +      ; branch if JUMP not pressed
    JSR SetSamusJump
    JMP LCD6B

*   LDA SamusGravity
    BNE ++
    LDA SamusObjAction
    CMP #sa_PntJump
    BNE +
    JSR SetSamusPntUp
    BNE ++
*   JSR StopHorzMovement
*   LDA #$03
    JMP SetSamusData        ;($CD6D)Set Samus control data and animation.
    ;safe

LD09C:
    lda Joy1Change
    ora Joy1Retrig
    asl
    bpl SetSamusRollExit      ; exit if FIRE not pressed
    lda AnimResetIndex
    cmp #an_SamusJmpPntUp
    bne +
    jmp SpawnBulletVertical

*   jsr SpawnBulletHorizontal
    lda #an_SamusFireJump
    jmp SetSamusAnim

SetSamusRoll:
LD0B5:
    lda SamusGear
    and #gr_MARUMARI
    beq +      ; branch if Samus doesn't have Maru Mari
    lda SamusGravity
    bne +

    lda #an_SamusRoll
    sta AnimResetIndex

    lda #an_SamusRunJump
    sta AnimIndex

    ldx SamusDir
    lda RunAccelerationTbl,x
    sta SamusHorzAccel

    lda #$01
    sta $0686
SFX_SamusBall:
    lda #SFX_SMS_BALL
    ora TriangleSFXFlag
    sta TriangleSFXFlag
    rts

*   lda #sa_Stand       ; A == 0
    sta SamusObjAction
SetSamusRollExit:
    rts

; SamusRoll
; =========

SamusRoll:
    lda Joy1Change
    and #$08     ; UP pressed?
    bne +      ; branch if yes
    bit Joy1Change  ; JUMP pressed?
    bpl ++    ; branch if no
*   lda Joy1Status
    anc #$04       ; DOWN pressed?
    bne +     ; branch if yes
;break out of "ball mode"
    lda ObjRadY
    ;clc
    adc #$08
    sta ObjRadY

;CheckMoveUp:
    lda ObjRadY
    clc
    adc #$08
    jsr CheckMoveUpDownSharedPart

    bcc +     ; branch if not possible to stand up

    lda ObjectHi
    sta $0B

    lda ObjectY
    sta $08

    lda ObjectX
    sta $09

    ldx #$00
    stx $05

    lda #$F5
    sta $04

    jsr Bank07_LFD8F
    jsr LD638
    jsr StopHorzMovement
    dec AnimIndex
    jsr StopVertMovement        ;($D147)
    lda #$04
    jmp SetSamusData

*   lda Joy1Change
    jsr BitScan         ;($E1E1)
    cmp #$02
    bcs +
    sta SamusDir
    lda #an_SamusRoll
    jsr SetSamusAnim
*   jsr SetRunAccelerationToSamusDir
    jsr SetSamusHorzAccl
    jsr CheckBombLaunch
    lda Joy1Status
    and #$03
    bne +     
        sta ObjHorzSpeed  
        sta HorzCntrLinear 
        sta SamusHorzAccel
*   lda #$02
LD144:  
    jmp SetSamusData        ;($CD6D)Set Samus control data and animation.

StopVertMovement:
LD147:
    ldy #$00
    sty ObjVertSpeed
    sty VertCntrLinear
    rts

; CheckBombLaunch
; ===============
; This routine is called only when Samus is rolled into a ball.
; It does the following:
; - Checks if Samus has bombs
; - If so, checks if the FIRE button has been pressed
; - If so, checks if there are any object "slots" available
;   (only 3 bullets/bombs can be active at the same time)
; - If so, a bomb is launched.

CheckBombLaunch:
LD150:
    lda SamusGear
    lsr
    bcc BombExit            ; exit if Samus doesn't have Bombs
    lda Joy1Change
    ora Joy1Retrig
    asl                     ; bit 7 = status of FIRE button
    bpl BombExit            ; exit if FIRE not pressed
    lda ObjVertSpeed
    ora SamusOnElevator
    bne BombExit
        ldx #$D0                ; try object slot D
        lda ObjAction + $D0
        beq DoBombLaunch        ; launch bomb if slot available

        ldx #$E0                ; try object slot E
        lda ObjAction + $E0
        beq DoBombLaunch        ; launch bomb if slot available

        ldx #$F0                ; try object slot F
        lda ObjAction + $F0
        bne BombExit            ; no bomb slots available, exit

; launch bomb... give it same coords as Samus
DoBombLaunch:
*   lda ObjectHi
    sta ObjectHi,x

    lda ObjectX
    sta ObjectX,x

    lda ObjectY
    clc
    adc #$04    ; 4 pixels further down than Samus' center
    sta ObjectY,x

    lda #wa_LayBomb
    sta ObjAction,x

SFXBombLaunch:
    lda #SFX_BMB_SET
    ora TriangleSFXFlag
    sta TriangleSFXFlag
BombExit:
*   rts 

SamusPntUp:
    lda Joy1Status
    and #$08     ; UP still pressed?
    bne +      ; branch if yes
    lda #sa_Stand   ; stand handler
    sta SamusObjAction
*   lda Joy1Status
    and #$07    ; DOWN, LEFT, RIGHT pressed?
    beq ++    ; branch if no
    jsr BitScan         ;($E1E1)
    cmp #$02
    bcs +
    sta SamusDir
*   tax
    lda ActionTable,x
    sta SamusObjAction
*   lda Joy1Change
    ora Joy1Retrig
    asl
    bpl +      ; branch if FIRE not pressed
    jsr FireWeapon          ;($D1EE)Shoot up.
*   bit Joy1Change
    bpl +      ; branch if JUMP not pressed
    lda #sa_PntJump
    sta SamusObjAction
*   lda #$04
    jsr SetSamusData        ;($CD6D)Set Samus control data and animation.
    ldx SamusObjAction

 .scope
        CPX #$04
        BCS _Check_6
        _DoJump:
            LDA SamusPntUpTable_LowBytes,x
            STA CodePtr
            LDA SamusPntUpTable_HiBytes,x
            STA CodePtr + 1
            JMP (CodePtr)
        _Check_6:
            CPX #$06
            BNE _DoJump
        LDY #an_SamusJmpPntUp
        JMP AfterSamusJumpSet

    SamusPntUpTable_HiBytes:
       .byte >StopHorzMovement, >SetSamusRun, >ExitSub, >SetSamusRoll, >ExitSub
    SamusPntUpTable_LowBytes:
       .byte <StopHorzMovement, <SetSamusRun, <ExitSub, <SetSamusRoll, <ExitSub
 
 .scend

CheckIfBulletCanBeFired:
    ldy #$D0
    lda ObjAction + $D0
    beq CheckIfMissileCanBeFired

    ldy #$E0
    lda ObjAction + $E0
    beq CheckIfMissileCanBeFired

    ldy #$F0
    lda ObjAction + $F0
    beq CheckIfMissileCanBeFired

    ldy #$01
    rts

CheckIfMissileCanBeFired:
    sta $030A,y
    lda MissileToggle
    beq BulletCanBeFiredExit    ; Is missles are toggled on, only the first slot is free
    cpy #$D0                    ; Missiles can only fire one at a time
BulletCanBeFiredExit:
    rts

FireWeapon:
    lda Joy1Status
    and #$08
    bne SpawnBulletVertical

SpawnBulletHorizontal:
    lda MetroidOnSamus
    bne +
    jsr CheckIfBulletCanBeFired
    bne +
    jsr DoNormalBulletStuff

    lda MissileToggle
    bne AfterHorizontalSpecialBeamChecks
        lda SamusDir
        jsr DoWaveBeamAndIceBeamStuff

AfterHorizontalSpecialBeamChecks:
    lda #$0C
    sta $030F,y

    ldx SamusDir 
    lda BulletSpeedTable,x      ; get bullet speed
    sta ObjHorzSpeed,y          ; -4 or 4, depending on Samus' direction

    lda #$00
    sta ObjVertSpeed,y

    lda #$01
    sta ObjectOnScreen,y

    lda MissileToggle 
    beq AfterHorizontalMissleLaunch 
        jsr DoHorizontalMissleLaunch 

AfterHorizontalMissleLaunch:

    lda ObjAction,y
    asl
    ora SamusDir
    and #$03
    tax
    lda Table08,x
    sta $05

    lda #$FA
    sta $04

    jsr LD306

    lda SamusGear
    asr #gr_LONGBEAM
    lsr
    lsr
    ror
    ora HasBeamSFX
    sta HasBeamSFX

    ldx ObjAction,y
    dex
    bne +

        lda #SFX_BLT_FIRE
        ora SQ1SFXFlag
        sta SQ1SFXFlag


*   ldy #$09
LD26B:
    tya
    jmp SetSamusNextAnim
    ; safe
    
SpawnBulletVertical: 
    lda MetroidOnSamus
    bne +
    jsr CheckIfBulletCanBeFired
    bne +
    jsr DoNormalBulletStuff

    lda MissileToggle
    bne AfterVerticalSpecialBeamChecks
        lda #$02
        jsr DoWaveBeamAndIceBeamStuff

AfterVerticalSpecialBeamChecks:
    lda #$0C
    sta $030F,y

    lda #$FC
    sta ObjVertSpeed,y

    lda #$00
    sta ObjHorzSpeed,y

    lda #$01
    sta ObjectOnScreen,y
 
    lda MissileToggle
    beq AfterVerticalMissleToggleCheck
        lda #$8F
        jsr GoSetBulletAnim

    AfterVerticalMissleToggleCheck:

    ldx SamusDir
    lda Table09_A,x
    sta $05

    lda ObjAction,y
    and #$01
    tax
    lda Table09_B,x
    sta $04

    jsr LD306

    lda SamusGear
    asr #gr_LONGBEAM
    lsr
    lsr
    ror
    ora HasBeamSFX
    sta HasBeamSFX

    ldx ObjAction,y
    dex
    bne +
    
        lda #SFX_BLT_FIRE
        ora SQ1SFXFlag
        sta SQ1SFXFlag

*   ldy #$26
    lda SamusGravity
    beq +
    ldy #$34

*   lda SamusObjAction
    cmp #$01
    beq LD26B
Exit107:
    rts

DoNormalBulletStuff:
    tya
    tax
    inc ObjAction,x
    lda #$02
    sta ObjRadY,y
    sta ObjRadX,y
    lda #an_Bullet      ; #an_Bullet == $1B

SetProjectileAnim:
    sta AnimResetIndex,x

SetProjectileAnimWithoutReset:  
    sta AnimIndex,x
    lda #$00
    sta AnimDelay,x
Exit108:
*   rts

LD306:
    lda ObjectHi
    sta $0B

    lda ObjectY
    sta $08

    lda ObjectX
    sta $09

    tya
    tax
    jsr Bank07_LFD8F
    txa
    tay
    jmp LD638

Exit4:
    rts

DoHorizontalMissleLaunch:
    ldx SamusDir
    lda MissileAnims,x

GoSetBulletAnim:
*   sta AnimIndex,y
    sta AnimResetIndex,y
    lda #$00
    sta AnimDelay,y

SFXMissileLaunch_Inline:
    lda #SFX_MSL_LNCH
    ora NoiseSFXFlag
    sta NoiseSFXFlag

    lda #wa_Missile ; #wa_Missile == #$0B
    sta ObjAction,y

    lda #$FF
    sta $030F,y     ; # of frames projectile should last

    dec MissileCount
    bne Exit4       ; exit if not the last missile

; Samus has no more missiles left
    dec MissileToggle       ; put Samus in "regular fire" mode
    jmp SelectSamusPal      ; update Samus' palette to reflect this
    ; Safe

DoWaveBeamAndIceBeamStuff:
DoWaveBeamStuff:
    sta $0502,y
    bit SamusGear
    bvc DoIceBeamStuff     ; branch if Samus doesn't have Wave Beam

    lda Div16Table, y      ; Setup the carry bit for below 
    lsr

    lda #$00
    sta AnimDelay,y
    sta $0501,y
    sta $0304,y

    bcs +
        lda #$0C
*   STA $0500,y
    lda #wa_WaveBeam        ; #wa_WaveBeam == #$02
    sta ObjAction,y
Set_WaveFireAnim:
    lda #an_WaveBeam        ; #an_WaveBeam == #$7D
    sta AnimIndex,y
    sta AnimResetIndex,y
    ;lda #$00
    ;sta AnimDelay,y        ; moving this up

SFX_WaveFire:
    lda #SFX_WV_FIRE        ; #SFX_WV_FIRE == #$01 
    ora SQ1SFXFlag
    sta SQ1SFXFlag

; NARPASS allows having the ice beam and wave beam at the same time
; but the ice beam overwrites the wave behavior
DoIceBeamStuff:
    lda SamusGear
    bpl IceBeamExit       ; branch if Samus doesn't have Ice Beam

    lda #wa_IceBeam       ; #wa_IceBeam == #$03 
    sta ObjAction,y

    lda HasBeamSFX
    ora #$01
    sta HasBeamSFX
SFX_BulletFire:
    lda #SFX_BLT_FIRE       ; #SFX_BLT_FIRE == #$10 
    ora SQ1SFXFlag
    sta SQ1SFXFlag
IceBeamExit:
    rts 

; SamusDoor
; =========

MoveOutDoor_Trampoline:
    jmp MoveOutDoor

SamusDoor:
    lda DoorStatus
    cmp #$05
    bcs CheckDoorDelay
*   JMP CheckHealthStatusAndSetCntrlBit
CheckDoorDelay:
    ; move Samus out of door, how far depends on initial value of DoorDelay
    dec DoorDelay
    bne MoveOutDoor_Trampoline
    ; done moving

    asl
    bcc +
    lsr
    sta DoorStatus
    bne -
    .scope
        * ldx #$60      ; 60 40 20 00
        ;sec
        _loop1:
            lda $0405,x
            and #$02
            bne skip1
                sta EnStatus,x
            skip1: 
            txa
            sbx #$20
            bpl _loop1

        jsr GetNameTable
        
        ldx #$FF
        cmp $072C + $00
        bne _i1
            stx PipeEnemyStatus + $00
        _i1: 
        cmp $072C + $08
        bne _i2
            stx PipeEnemyStatus + $08
        _i2:
        cmp $072C + $10
        bne _i3
            stx PipeEnemyStatus + $10
        _i3: 
        cmp $072C + $18
        bne _done
            stx PipeEnemyStatus + $18
        _done:
    .scend

    jsr LED65
    lda CurrentBank
    cmp #TourianBank
    bne CheckDoorAfterTourian
        jsr Bank03_LA315            ; Tourian Only

CheckDoorAfterTourian:
    lda ItemRmMusicSts
    beq ++
    pha
    jsr StartMusic       ; start music
    pla
    bpl ++
    lda #$00
    sta ItemRmMusicSts
    beq ++  ; branch always

*   lda #$80
    sta ItemRmMusicSts
*   lda KrdRdlyPresent
    beq +

;TourianMusic:
    lda #MUS_TOURIAN
    ora MusicInitFlag
    sta MusicInitFlag

    lda #$00
    sta KrdRdlyPresent
    beq --     ; branch always

*   lda SamusDoorData
    and #$0F
    sta SamusObjAction
    lda #$00
    sta SamusDoorData
    sta DoorStatus
    ; Stop Vertical Movement
    sta ObjVertSpeed
    sta VertCntrLinear

MoveOutDoor:
    lda SamusDoorDir
    beq ++    ; branch if door leads to the right
    ldy ObjectX
    bne +
    jsr ToggleSamusHi       ; toggle 9th bit of Samus' X coord
*   dec ObjectX
    jmp CheckHealthStatusAndSetCntrlBit

*   inc ObjectX
    bne CheckHealthStatusAndSetCntrlBit
    jsr ToggleSamusHi       ; toggle 9th bit of Samus' X coord

CheckHealthStatusAndSetCntrlBit:
    jsr CheckHealthStatus       ;($CDFA)Check if Samus hit, blinking or Health low.
    jsr SetmirrorCntrlBit
    jmp DrawFrame       ; display Samus
    ; safe

SamusDead:
D41A:
    lda #$01
    jmp SetSamusData        ;($CD6D)Set Samus control data and animation.

SamusDead2:
    dec AnimDelay
    rts

; SamusElevator
; =============

SamusElevator:
    lda ElevatorStatus
    cmp #$03
    beq +
    cmp #$08
    bne SamusElevatorEnd
*   lda $032F
    bmi +++
    lda ObjectY
    sec
    sbc ScrollY     ; A = Samus' Y position on the visual screen
    cmp #$84
    bcc +      ; if ScreenY < $84, don't scroll
    jsr ScrollDown  ; otherwise, attempt to scroll
*   ldy ObjectY
    cpy #239    ; wrap-around required?
    bne +
    jsr ToggleSamusHi       ; toggle 9th bit of Samus' Y coord
    ldy #$FF    ; ObjectY will now be 0
*   iny
    sty ObjectY
    jmp LD47E

*   lda ObjectY
    sec
    sbc ScrollY     ; A = Samus' Y position on the visual screen
    cmp #$64
    bcs +      ; if ScreenY >= $64, don't scroll
    jsr ScrollUp    ; otherwise, attempt to scroll
*   ldy ObjectY
    bne +      ; wraparound required? (branch if not)
    jsr ToggleSamusHi       ; toggle 9th bit of Samus' Y coord
    ldy #240    ; ObjectY will now be 239
*   dey
    sty ObjectY
    jmp LD47E

SamusElevatorEnd:
*   ldy #$00
    sty ObjVertSpeed
    cmp #$05
    beq +
    cmp #$07
    beq +
LD47E:  
    lda FrameCount
    lsr
    bcc ++
*   jsr SetmirrorCntrlBit       ;($CD92)Mirror Samus, if necessary.
    lda #$01
    jmp AnimDrawObject
EXIT_33:
*   rts

; UpdateProjectiles
; =================

UpdateProjectiles:

.scope
    lda ObjAction + $D0
    beq _skip1
        ldx #$D0
        jsr DoOneProjectile
    _skip1:

    lda ObjAction + $E0
    beq _skip2
        ldx #$E0
        jsr DoOneProjectile
    _skip2:

    lda ObjAction + $F0
    beq Exit_33
        ldx #$F0
        ; Fall through
.scend

DoOneProjectile:
    stx PageIndex
    tax
    lda DoOneProjectileTable_LoBytes - 1, x
    sta CodePtr
    lda DoOneProjectileTable_HiBytes - 1, x
    sta CodePtr + 1
    ldx PageIndex
    jmp (CodePtr)

    DoOneProjectileTable_HiBytes:
        .byte >UpdateBullet         ; regular beam
        .byte >UpdateWaveBullet     ; wave beam
        .byte >UpdateIceBullet      ; ice beam
        .byte >BulletExplode        ; bullet/missile explode
        .byte >LayBomb1and4         ; lay bomb 1
        .byte >LayBomb2and5         ; lay bomb 2
        .byte >LayBomb3and6         ; lay bomb 3
        .byte >LayBomb1and4         ; lay bomb 4
        .byte >LayBomb2and5         ; bomb countdown
        .byte >LayBomb3and6         ; bomb explode
        .byte >UpdateBullet         ; missile
    DoOneProjectileTable_LoBytes:
        .byte <UpdateBullet
        .byte <UpdateWaveBullet
        .byte <UpdateIceBullet
        .byte <BulletExplode
        .byte <LayBomb1and4 
        .byte <LayBomb2and5
        .byte <LayBomb3and6
        .byte <LayBomb1and4
        .byte <LayBomb2and5
        .byte <LayBomb3and6
        .byte <UpdateBullet

; UpdateIceBullet
; ===============

UpdateIceBullet:
    lda #$81
    sta ObjectCntrl

UpdateBullet:
    lda #$01
    sta UpdtngPrjctl
    jsr LD5FC
    jsr LD5DA
    jsr LD609
CheckBulletStat:
    ldx PageIndex
    bcc +
    lda SamusGear
    and #gr_LONGBEAM
    bne DrawBullet  ; branch if Samus has Long Beam
    dec $030F,x     ; decrement bullet timer
    bne DrawBullet
    lda #$00    ; timer hit 0, kill bullet
    sta ObjAction,x
    beq DrawBullet  ; branch always

*   lda ObjAction,x
    beq +
    jsr LD5E4
DrawBullet:
    lda #$01
    jsr AnimDrawObject
*   dec UpdtngPrjctl
    rts

*   inc $0500,x
LD522:
    inc $0500,x
    lda #$00
    sta $0501,x
    beq +      ; branch always
    ;safe

UpdateWaveBullet:
    lda #$01
    sta UpdtngPrjctl
    jsr LD5FC
    jsr LD5DA
    lda $0502,x
    and #$FE
    tay

    lda Table0A,y
    sta $0A

    lda Table0A+1,y
    sta $0B

*   ldy $0500,x
    lda ($0A),y
    cmp #$FF
    bne +
    sta $0500,x
    jmp LD522

*   cmp $0501,x
    beq ---
    inc $0501,x
    iny
    lda ($0A),y
    jsr $8296
    ldx PageIndex
    sta ObjVertSpeed,x
    lda ($0A),y
    jsr $832F
    ldx PageIndex
    sta ObjHorzSpeed,x
    tay
    lda $0502,x
    lsr
    bcc +
    tya
    eor #$FF
    adc #$00            ;Carry always set here
    sta ObjHorzSpeed,x
*   jsr LD609
    bcs +
    jsr LD624
*   jmp CheckBulletStat


; BulletExplode
; =============
; bullet/missile explode

BulletExplode:
    lda #$01
    sta UpdtngPrjctl
    lda $0303,x
    sec
    sbc #$F7
    bne +
    sta ObjAction,x  ; kill bullet
*   jmp DrawBullet

LD5DA:
    lda $030A,x
    beq Exit5
    lda #$00
    sta $030A,x
LD5E4:  
    lda #$1D
    ldy ObjAction,x
    cpy #wa_BulletExplode
    beq Exit5
    cpy #wa_Missile
    bne +
    lda #an_MissileExpld
*   jsr SetProjectileAnim
    lda #wa_BulletExplode
*   sta ObjAction,x
Exit5:
    rts

LD5FC:
    lda ObjectOnScreen,x
    lsr
    bcs Exit5
*   lda #$00
    sta ObjAction,x   ; branch always
    rts

*   jmp LE81E

; bullet < background crash detection

LD609:
    jsr GetObjCoords
    ldy #$00
    lda ($04),y     ; get tile # that bullet touches
    cmp #$A0
    bcs LD624
    jsr $95C0       ; Tourian Only
    cmp #$4E
    beq -

.scope

    ldy InArea
    cpy #$10
    beq _compare_hex_80
    cmp #$70
    bcs _end
    _compare_hex_80:
        cmp #$80
        bcc Exit5
    _end:

    clc
    jmp IsBlastTile

.scend

LD624:
    ldx PageIndex

    lda ObjHorzSpeed,x
    sta $05

    lda ObjVertSpeed,x
    sta $04

    lda ObjectHi,x
    sta $0B

    lda ObjectY,x
    sta $08

    lda ObjectX,x
    sta $09

    jsr Bank07_LFD8F
    bcc --
LD638:
    lda $08
    sta ObjectY,x

    lda $09
    sta ObjectX,x

    lda $0B
    and #$01
    bpl +      ; branch always

ToggleObjectHi:
    lda ObjectHi,x
    eor #$01
*   sta ObjectHi,x
*   rts

LayBomb1and4:
    lda #an_BombTick
    jsr SetProjectileAnim
    lda #$18    ; fuse length :-)
    sta $030F,x
    inc ObjAction,x       ; bomb update handler
DrawBomb:
    lda #$03
    jmp AnimDrawObject

LayBomb2and5:
    lda FrameCount
    lsr
    bcc ++    ; only update counter on odd frames
    dec $030F,x
    bne ++
    lda #$37
    ldy ObjAction,x
    cpy #$09
    bne +
    lda #an_BombExplode
*   jsr SetProjectileAnim
    inc ObjAction,x

SFXBombExplode_Inline:
    lda #SFX_BMB_XPLD
    ora NoiseSFXFlag
    sta NoiseSFXFlag

*   jmp DrawBomb

LayBomb3and6:
    inc $030F,x
    jsr LD6A7
    ldx PageIndex
    lda $0303,x
    sec
    sbc #$F7
    bne +
    sta ObjAction,x     ; kill bomb
*   jmp DrawBomb

LD6A7:
    jsr GetObjCoords

    lda $04
    sta $0A

    lda $05
    sta $0B
    
    ldx PageIndex
    ldy $030F,x
    dey
    beq ++
    dey
    bne +++
    lda #$40
    jsr LD78B
    txa
    bne +
    lda $04
    and #$20
    beq Exit6
*   lda $05
    and #$03
    cmp #$03
    bne +
    lda $04
    cmp #$C0
    bcc +
    lda ScrollDir
    and #$02
    bne Exit6
    lda #$80
    jsr LD78B
*   jsr LD76A
Exit6:  rts

*   dey
    bne +++
    lda #$40
    jsr LD77F
    txa
    bne +
    lda $04
    and #$20
    bne Exit6
*   lda $05
    and #$03
    cmp #$03
    bne +
    lda $04
    cmp #$C0
    bcc +
    lda ScrollDir
    and #$02
    bne Exit6
    lda #$80
    jsr LD77F
*   jmp LD76A

*   dey
    bne +++
    lda #$02
    jsr LD78B
    txa
    bne +
    lda $04
    lsr
    bcc Exit7
*   lda $04
    and #$1F
    cmp #$1E
    bcc +
    lda ScrollDir
    and #$02
    beq Exit7
    lda #$1E
    jsr LD77F
    lda $05
    eor #$04
    sta $05
*   jmp LD76A

*   dey
    bne Exit7
    lda #$02
    jsr LD77F
    txa
    bne +
    lda $04
    lsr
    bcs Exit7
*   lda $04
    and #$1F
    cmp #$02
    bcs LD76A
    lda ScrollDir
    and #$02
    beq Exit7
    lda #$1E
    jsr LD78B
    lda $05
    eor #$04
    sta $05
LD76A:
    txa
    pha
    ldy #$00
    lda ($04),y

.scope

    ldy InArea
    cpy #$10
    beq _compare_hex_80
    cmp #$70
    bcs _end
    _compare_hex_80:
        cmp #$80
    _end:

.scend

    bcc +
    cmp #$A0
    bcs +
    jsr LE9C2
*   pla
    tax
Exit7:
    rts

LD77F:
    clc
    adc $0A
    sta $04
    lda $0B
    adc #$00
    jmp LD798
    ; safe

LD78B:
    sta $00
    lda $0A
    sec
    sbc $00
    sta $04
    lda $0B
    sbc #$00
LD798:
    and #$07
    ora #$60
    sta $05
Exit99:
*   rts

;---------------------------------------------------------------------------------------------------

UpdateElevator:
    ldx #$20
    stx PageIndex

    LDA UpdateElevatorTable_LoByte - 1, y
    STA CodePtr
    LDA UpdateElevatorTable_HiByte - 1, y
    STA CodePtr + 1
    JMP (CodePtr)

UpdateElevatorTable_HiByte:
    .byte >ElevatorIdle, >LD80E, >ElevatorMove, >ElevatorScroll, >LD8A3, >LD8BF, >LD8A3, >ElevatorMove, >ElevatorStop
UpdateElevatorTable_LoByte:
    .byte <ElevatorIdle, <LD80E, <ElevatorMove, <ElevatorScroll, <LD8A3, <LD8BF, <LD8A3, <ElevatorMove, <ElevatorStop

ElevatorIdle:
    lda SamusOnElevator
    beq ShowElevator
    lda #$04
    bit $032F       ; elevator direction in bit 7 (1 = up)
    bpl +
    asl     ; btn_UP
*   and Joy1Status
    beq ShowElevator
    ; start elevator!
    jsr StopVertMovement        ;($D147)
    sty AnimDelay
    sty SamusGravity
    ;tya
    sty ObjVertSpeed + $20
    inc ObjAction + $20
    lda #sa_Elevator
    sta SamusObjAction
    lda #an_SamusFront
    jsr SetSamusAnim
    lda #128
    sta ObjectX     ; center
    lda #112
    sta ObjectY     ; center

ShowElevator:
    lda FrameCount
    lsr
    bcc Exit99          ; only display elevator at odd frames
    jmp DrawFrame       ; display elevator

LD80E:
    lda ScrollX
    bne +
    lda MirrorCntrl
    ora #$08
    sta MirrorCntrl
    lda ScrollDir
    and #$01
    sta ScrollDir   ; JUMANJI
    inc ObjAction + $20
    jmp ShowElevator

*   lda #$80
    sta ObjectX
    lda ObjectX + $20
    sec
    sbc ScrollX
    bmi +
    jsr ScrollLeft
    jmp ShowElevator

*   jsr ScrollRight
    jmp ShowElevator
    ;safe

ElevatorMove:
    lda $030F + $20
    bpl ++    ; branch if elevator going down
    ; move elevator up one pixel
    ldy ObjectY + $20
    bne +
    jsr ToggleObjectHi
    ldy #240
*   dey
    tya
    sta ObjectY + $20
    jmp ++

    ; move elevator down one pixel
*   inc ObjectY + $20
    lda ObjectY + $20
    cmp #240
    bne +
    jsr ToggleObjectHi
    lda #$00
    sta ObjectY + $20
*   cmp #$83
    bne +      ; move until Y coord = $83
    inc ObjAction + $20
*   jmp ShowElevator

ElevatorScroll:
    lda ScrollY
    bne ElevScrollRoom  ; scroll until ScrollY = 0
    lda #$4E
    sta AnimResetIndex

    lda #$41
    sta AnimIndex

    lda #$5D
    sta AnimResetIndex + $20

    lda #$50
    sta AnimIndex + $20

    inc ObjAction + $20
    lda #$40
    sta Timer1
    jmp ShowElevator

ElevScrollRoom:
    lda $030F + $20
    bpl +      ; branch if elevator going down
    jsr ScrollUp
    jmp ShowElevator

*   jsr ScrollDown
    jmp ShowElevator

;Elevator Move
LD8A3:

    inc ObjAction + $20
    lda ObjAction + $20
    cmp #$08    ; ElevatorMove
    bne +
    lda #$23
    sta $0303 + $20
    lda #an_SamusFront
    jsr SetSamusAnim
    jmp ShowElevator

*   lda #$01
    jmp AnimDrawObject
    ; safe

LD8BF:
    lda $030F + $20
    tay
    cmp #$8F    ; Leads-To-Ending elevator?
    bne +
    ; Samus made it! YAY!
    lda #$07
    sta MainRoutine
    inc AtEnding
    ldy #$00
    sty $33
    iny
    sty SwitchPending   ; switch to bank 0
    lda #$1D    ; ending
    sta TitleRoutine
    rts

*   tya
    bpl ++
    ldy #$00
    cmp #$84
    bne +
    iny
*   tya
*   ora #$10
    jsr IsEngineRunning
    lda PalToggle
    eor #$07
    sta PalToggle
    ldy InArea
    cpy #$12
    bcc +
    lda #$01
*   sta PalDataPending
    jsr WaitNMIPass
    jsr SelectSamusPal
    jsr StartMusic          ;($LD92C)Start music.
    jsr ScreenOn
    jsr DestroyEnemies

    ;ldx #$20
    ;stx PageIndex

    lda #$6B
    sta AnimResetIndex

    lda #$5F
    sta AnimIndex

    lda #$7A
    sta AnimResetIndex + $20

    lda #$6E
    sta AnimIndex + $20

    inc ObjAction + $20

    lda #$40
    sta Timer1

    rts

StartMusic:
    lda ElevatorStatus
    cmp #$06
    bne +
    lda $032F
    bmi ++
*   lda $95CD           ;Load proper bit flag for area music.
    ldy ItemRmMusicSts
    bmi ++
    beq ++
*   lda #$81
    sta ItemRmMusicSts
    lda #$20            ;Set flag to play item room music.

*   ora MusicInitFlag       ;
    sta MusicInitFlag       ;Store music flag info.
    rts             ;

ElevatorStop:
    lda ScrollY
    bne ++    ; scroll until ScrollY = 0
    lda #sa_Stand
    sta SamusObjAction
    jsr StopHorzMovement
    ;ldx PageIndex   ; #$20
    lda #$01    ; ElevatorIdle
    sta ObjAction + $20
    lda $030F + $20
    eor #$80    ; switch elevator direction
    sta $030F + $20
    bmi +
    jsr ToggleScroll
    sta MirrorCntrl
*   jmp ShowElevator
*   jmp ElevScrollRoom

SamusOnElevatorOrEnemy:
    ldy #$00                ;
    sty SamusOnElevator     ;Assume Samus is not on an elevator or on a frozen enemy.
    sty OnFrozenEnemy       ;

    lda ObjectY
    sta $06

    lda ObjectX
    sta $08

    lda ObjectHi
    eor PPUCNT0ZP
    and #$01
    sta $0A

    ldx #$50
StandingOnFrozenEnemyLoop:
*   lda EnStatus,x
    cmp #$04
    bne +
    jsr GetXEnemyRoomPosition_07_09_0B
    jsr DistFromEn0ToObj1
    jsr LF1FA
    bcs +
    jsr LD9BA
    bne +
    inc OnFrozenEnemy       ;Samus is standing on a frozen enemy.
    bne ++
*   txa
    sbx #$10
    bpl StandingOnFrozenEnemyLoop

StandingOnElevator:
*   lda ElevatorStatus
    beq +
    ldy #$00
    ldx #$20
    jsr GetObject0CoordData
    bcs +
    jsr LD9BA
    bne +
    inc SamusOnElevator     ;Samus is standing on elevator.
*   rts

LD9BA:
    lda $10
    and #$02
    bne +
        ldy $11
        iny
        cpy $04
        beq Exit8
*   lda SamusHit
    and #$38
    ora $10
    ora #$40
    sta SamusHit
Exit8:
    rts

; UpdateStatues
; =============

UpdateStatues:
    lda #$60
    sta PageIndex
    dey
    bne +
    jsr LDAB0
    ldy #$01
    jsr LDAB0
    bcs +
    inc $0360
*   ldy $0360
    cpy #$02
    bne +++
    lda KraidStatueStat
    bpl +
    ldy #$02
    jsr LDAB0
*   lda $687C
    bpl +
    ldy #$03
    jsr LDAB0
*   bcs +
    inc $0360
*   ldx #$60
    jsr LDA1A
    ldx #$61
    jsr LDA1A

    LDA $54
    BMI Exit0
    LDA DoorStatus
    BNE Exit0
    LDA KraidStatueStat
    AND $687C
    BPL Exit0
    STA $54
    LDX #$70
    LDY #$08
.scope
    _loop:
        lda #$03
        sta $0500,x

        tya 
        asl 
        sta $0507,x

        lda #$04
        sta TileType,x

        lda $036C
        asl 
        asl 
        ora #$62
        sta TileWRAMHi,x

        tya
        asl
        adc #$08
        sta TileWRAMLo,x

        txa
        sbx #$10
        dey
        bne _loop
    Exit0:
        RTS
.scend

LDA1A:
    lda $0304,x
    bmi LDA3D_END
    lda #$01
    sta $0304,x
    lda $030F,x
    and #$0F
    beq LDA3D_END
    inc $0304,x
    dec $030F,x
    lda $030F,x
    and #$0F
    bne LDA3D_END
    lda $0304,x
    ora #$80
    sta $0304,x
    sta $681B,x
    inc $0304,x
    txa
    pha
    and #$01
    pha
    tay
    jsr LDAB0
    pla
    tay
    iny
    iny
    jsr LDAB0
    pla
LDA3D_END:

LDA7C:
    tax
    and #$01
    tay

    lda $030F,x
    sta $036D

    lda LDA39,y
    sta $036E

    lda $681B,x
    beq +
    bmi +
    lda $0304,x
    cmp #$01
    bne +
    lda $0306,x
    beq +
    dec $030F,x
    lda TriangleSFXFlag
    ora #$10
    sta TriangleSFXFlag
*   lda #$00
    sta $0306,x

    txa
    and #$01
    ;ora #$65
    tay
    lda LDA3B,y
    sta $0363

    lda $681B,x
    beq +
    bmi +
    lda FrameCount
    lsr
    bcc Exit31    ; only display statue at odd frames
*   jmp DrawFrame       ; display statue

LDAB0:
    lda Table0E,y
    sta $05C8

    lda $036C
    asl
    asl
    ora Table1B,y
    sta $05C9

    lda #$09
    sta $05C3

    lda #$C0
    sta PageIndex

    jsr DrawTileBlast

    lda #$60
    sta PageIndex
Exit31:
    rts

;------------------------------------------[ Update items ]-----------------------------------------

UpdateItems:
LDB37:  LDA #$40            ;PowerUp RAM starts at $0340.
LDB39:  STA PageIndex           ;
LDB3B:  LDX #$00            ;Check first item slot.
LDB3D:  JSR CheckOneItem        ;($DB42)Check current item slot.
LDB40:  LDX #$08            ;Check second item slot.

CheckOneItem:
LDB42:  STX ItemIndex           ;First or second item slot index(#$00 or #$08).
LDB44:  LDY PowerUpType,x       ;
LDB47:  INY             ;Is no item present in item slot(#$FF)?
LDB48:  BEQ Exit31               ;If so, branch to exit.

LDB4A:  LDA PowerUpYCoord,x     ;
LDB4D:  STA PowerUpY            ;

LDB50:  LDA PowerUpXCoord,x     ;Store y, x and name table coordinates of power up item.
LDB53:  STA PowerUpX            ;

LDB56:  LDA PowerUpNameTable,x      ;
LDB59:  STA PowerUpHi           ;

LDB5C:  JSR GetObjCoords        ;($D79F)Find object position in room RAM.
;LDB5F:  LDX ItemIndex           ;Index to proper power up item.
LDB61:  LDY #$00            ;Reset index.
LDB63:  LDA ($04),y         ;Load pointer into room RAM.
LDB65:  CMP #$A0            ;Is object being placed on top of a solid tile?
LDB67:  BCC Exit31               ;If so, branch to exit.
LDB69:  LDA PowerUpType,x       ;
LDB6C:  AND #$0F            ;Load power up type byte and keep only bits 0 thru 3.
LDB6E:  ORA #$50            ;Set bits 4 and 6.
LDB70:  STA PowerUpAnimFrame        ;Save index to find object animation.

LDB73:  LDA FrameCount          ;
LDB76:  asr #$07            ;Color affected every other frame. ;the 2 LSBs of object control byte change palette of object.
LDB78:  ORA #$80            ;Indicate ObjectCntrl contains valid data by setting MSB.
LDB7A:  STA ObjectCntrl         ;Change color of item every other frame.

LDB7C:  LDA SpritePagePos       ;Load current index into sprite RAM.
LDB7E:  PHA             ;Temp save sprite RAM position.
LDB7F:  LDA PowerUpAnimIndex,x      ;Load entry into FramePtrTable for item animation.
LDB82:  JSR DrawFrame           ;($DE4A)Display special item.

LDB85:  PLA             ;Restore sprite page position byte.
LDB86:  CMP SpritePagePos       ;Was power up item successfully drawn?
LDB88:  BEQ Exit31           ;If not, branch to exit.
LDB8A:  TAX             ;Store sprite page position in x.
LDB8B:  LDY ItemIndex           ;Load index to proper power up data slot.
LDB8D:  LDA PowerUpType,y       ;Reload power up type data.
LDB90:  LDY #$01            ;Set power up color for ice beam orb.
LDB92:  CMP #$07            ;Is power up item the ice beam?
LDB94:  BEQ +               ;If so, branch.

LDB96:  DEY             ;Set power up color for long/wave beam orb.
LDB97:  CMP #$06            ;Is power up item the wave beam?
LDB99:  BEQ +               ;If so, branch.
LDB9B:  CMP #$02            ;Is power up item the long beam?
LDB9D:  BNE ++              ;If not, branch.
LDB9F:* TYA             ;Transfer color data to A.
LDBA0:  STA SpriteRAM+6,x     ;Store power up color for beam weapon.
LDBA3:  LDA #$FF            ;Indicate power up obtained is a beam weapon.

LDBA5:* PHA                 ;Temporarily store power up type.
LDBA8:  LDY #$00            ;Index to object 0(Samus).
LDBA6:  LDX #$40            ;Index to object 1(power up).
LDBAA:  JSR AreObjectsTouching      ;($DC7F)Determine if Samus is touching power up.
LDBAD:  PLA             ;Restore power up type byte.
LDBAE:  BCS Exit31           ;Carry clear=Samus touching power up. Carry set=not touching.

LDBB0:  TAY             ;Store power-up type byte in Y.

;PowerUpMusic:
    LDA #MUS_PWR_UP
    ORA MultiSFXFlag
    STA MultiSFXFlag

LDBB4:  LDX ItemIndex           ;X=index to power up item slot.
LDBB6:  INY             ;Is item obtained a beam weapon?
LDBB7:  BEQ +               ;If so, branch.
LDBB9:  LDA PowerUpNameTable,x      ;
LDBBC:  STA $08             ;Temp storage of nametable and power-up type in $08
LDBBE:  LDA PowerUpType,x       ;and $09 respectively.
LDBC1:  STA $09             ;
LDBC3:  JSR GetItemXYPos        ;($DC1C)Get proper X and Y coords of item, save in history.
LDBC6:* LDA PowerUpType,x       ;Get power-up type byte again.
LDBC9:  TAY             ;
LDBCA:  CPY #$08            ;Is power-up item a missile or energy tank?
LDBCC:  BCS MissileEnergyPickup ;If so, branch.
LDBCE:  CPY #$06            ;Is item the wave beam or ice beam?
LDBD0:  BCC MakeBitMask         ;If not, branch.
LDBD2:  LDA SamusGear           ;Clear status of wave beam and ice beam power ups.
LDBD5:  AND #$3F            ;
LDBD7:  STA SamusGear           ;Remove beam weapon data from Samus gear byte.

; MakeBitMask
; ===========
;In: Y = bit index. Out: A = bit Y set, other 7 bits zero.

MakeBitMask:
LDB2F:  SEC
LDB30:  LDA #$00
MakeBitMaskLoop:
LDB32:  ROL
LDB33:  DEY
LDB34:  BPL MakeBitMaskLoop

LDBDD:  ORA SamusGear           ;
LDBE0:  STA SamusGear           ;Update Samus gear with new beam weapon.

LDBE3:* LDA #$FF            ;
LDBE5:  STA PowerUpDelay        ;Initiate delay while power up music plays.
LDBE8:  STA PowerUpType,x       ;Clear out item data from RAM.
LDBEB:  LDY ItemRmMusicSts     ;Is Samus not in an item room?
LDBED:  BEQ LDBF1               ;If not, branch.
LDBEF:  LDY #$01            ;Restart item room music after special item music is done.
LDBF1:* STY ItemRmMusicSts     ;
LDBF3:  JMP SelectSamusPal      ;($CB73)Set Samus new palette.

MissileEnergyPickup:
LDBF7:* BEQ EnergyTankPickup    ;Branch if item is an energy tank.
LDBF9:  LDA #$05            ;
LDBFB:  JSR AddToMaxMissiles        ;($DD97)Increase missile capacity by 5.
LDBFE:  BNE LDBE3             ;Branch always.

; HCSS - There are more than 6 energy tanks in the game, but you can only hold 6
EnergyTankPickup:
LDC00:* LDA TankCount           ;
LDC03:  CMP #$06            ;Has Samus got 6 energy tanks?
LDC05:  BEQ LDC0A               ;If so, she can't have any more.
LDC07:  INC TankCount           ;Otherwise give her a new tank.
LDC0A:* LDA TankCount           ;
LDC0D:  asl
        asl
        asl
        asl                 ;Get tank count and shift into upper nibble.
LDC10:  ORA #$09            ;
LDC12:  STA HealthHi            ;Set new tank count. Upper health digit set to 9.
LDC15:  LDA #$99            ;Max out low health digit.
LDC17:  STA HealthLo            ;Health is now FULL!
LDC1A:  BNE LDBE3           ;Branch always.
        ; Safe

;It is possible for the current nametable in the PPU to not be the actual nametable the special item
;is on so this function checks for the proper location of the special item so the item ID can be
;properly calculated.

GetItemXYPos:
LDC1C:  LDY MapPosX         ;

Bank07_LDC1E:  
        STY $07             ;Temp storage of Samus map position x and y in $07
LDC20:  LDA MapPosY         ;and $06 respectively.
LDC22:  STA $06             ;
LDC24:  LDA ScrollDir           ;Load scroll direction and shift LSB into carry bit.
LDC26:  LSR             ;
LDC27:  PHP             ;Temp storage of processor status.
LDC28:  BEQ +               ;Branch if scrolling up/down.
LDC2A:  BCC ++              ;Branch if scrolling right.

;Scrolling left.
LDC2C:  LDA ScrollX         ;Unless the scroll x offset is 0, the actual room x pos
LDC2E:  BEQ ++              ;needs to be decremented in order to be correct.
LDC30:  DEC $07             ;
LDC32:  BCS ++              ;Branch always.

LDC34:* BCC +               ;Branch if scrolling up.

;Scrolling down.
LDC36:  LDA ScrollY         ;Unless the scroll y offset is 0, the actual room y pos
LDC38:  BEQ +               ;needs to be decremented in order to be correct.
LDC3A:  DEC $06             ;

LDC3C:* LDA PPUCNT0ZP           ;If item is on the same nametable as current nametable,
LDC3E:  EOR $08             ;then no further adjustment to item x and y position needed.
; HCSS - Pitfalls of ANC
LDC40:  AND #$01            ;
LDC42:  PLP             ;Restore the processor status and clear the carry bit.
LDC43:  CLC             ; This is a tricky CLC becase it's after the PLP
LDC44:  BEQ +               ;If Scrolling up/down, branch to adjust item y position.

LDC46:  ADC $07             ;Scrolling left/right. Make any necessary adjustments to
LDC48:  STA $07             ;item x position before writing to unique item history.

; TODO - might be able to assume something that can make this a branch instead of a JMP
LDC4A:  JMP AddItemToHistory        ;($DC51)Add unique item to unique item history.

LDC4D:* ADC $06             ;Scrolling up/down. Make any necessary adjustments to
LDC4F:  STA $06             ;item y position before writing to unique item history.

AddItemToHistory:
LDC51:  JSR CreateItemID        ;($DC67)Create an item ID to put into unique item history.
LDC54:  LDY NumUniqueItems     ;Store number of uniqie items in Y.
LDC57:  LDA $06             ;
LDC59:  STA UnqItmHist,y     ;Store item ID in inuque item history.
LDC5C:  LDA $07             ;
LDC5E:  STA UnqItmHist+1,y   ;
LDC61:  INY             ;Add 2 to Y. 2 bytes ber unique item.
LDC62:  INY             ;
LDC63:  STY NumUniqueItems     ;Store new number of unique items.
LDC66:  RTS             ;

;-----------------------------------------------------------------------------------------------------

AreObjectsTouching:
    lda ObjectY
    sta $06
    
    lda ObjectX
    sta $08

    lda ObjectHi
    eor PPUCNT0ZP
    and #$01
    sta $0A

GetObject0CoordData:
    lda ObjectY,x
    sta $07

    lda ObjectX,x
    sta $09
    
    lda ObjectHi,x
    eor PPUCNT0ZP
    anc #$01
    sta $0B

DistFromObj0ToObj1:
    lda ObjRadY,x
    ;clc
    adc ObjRadY,y
    sta $04

    lda ObjRadX,x
    adc ObjRadX,y
    sta $05

    jmp LF1FA

; UpdateObjAnim
; =============
; Move to object's next frame of animation

UpdateObjAnim:
LDC8F:  
    LDX PageIndex
    LDY AnimDelay,x
    BEQ +                   ; is it time to move to the next anim frame?
    DEC AnimDelay,x         ; nope
    BNE UpdateObjAnimExit   ; exit if still not zero (don't update animation)
*   STA AnimDelay,x         ; set initial anim countdown value
    LDY AnimIndex,x
UpdateObjAnimLoop:
*   LDA ObjectAnimIdxTbl,y  ;($8572)Load frame number.
    BEQ ++                  ; has end of anim been reached?
    STA AnimFrame,x         ; store frame number
    INY                     ; inc anim index
    TYA
    STA AnimIndex,x         ; store anim index
UpdateObjAnimExit:
*   RTS

*   LDY AnimResetIndex,x    ; reset anim frame index
    JMP UpdateObjAnimLoop   ; do first frame of animation

;--------------------------------[ Get sprite control byte ]-----------------------------------------

;The sprite control byte extracted from the frame data has the following format: AABBXXXX.
;Where AA are the two bits used to control the horizontal and verticle mirroring of the
;sprite and BB are the two bits used control the sprite colors. XXXX is the entry number
;in the PlacePtrTbl used to place the sprite on the screen.

GetSpriteCntrlData:
LDCC3:  LDY #$00            ;
LDCC5:  STY $0F             ;Clear index into placement data.
LDCC7:  LAX ($00),y         ;Load control byte from frame pointer data.
LDCC9:  STA $04             ;Store value in $04 for processing below. ;Keep a copy of the value in x as well.

LDCCC:  lda Div16Table, x
        and #$03
LDCD1:  STA $05             ;The following lines take the upper 4 bits in the

LDCD3:  TXA             ;control byte and transfer bits 4 and 5 into $05 bits 0
LDCD4:  AND #$C0            ;and 1(sprite color bits).  Bits 6 and 7 are
LDCD6:  ORA #$20            ;transferred into $05 bits 6 and 7(sprite flip bits).
LDCD8:  ORA $05             ;bit 5 is then set(sprite always drawn behind background).
LDCDA:  STA $05             ;

LDCDC:  LDA ObjectCntrl         ;Extract bit from control byte that controls the
LDCDE:  AND #$10            ;object mirroring.
LDCE0:  ASL             ;
LDCE1:  ASL             ;
LDCE2:  EOR $04             ;Move it to the bit 6 position and use it to flip the
LDCE4:  STA $04             ;horizontal mirroring of the sprite if set.

LDCE6:  LDA ObjectCntrl     ;
LDCE8:  BPL +               ;If MSB is set in ObjectCntrl, use its flip bits(6 and 7).

; SpriteFlipBitsOverride
    and #$3F
    sta $D4                 ; scratch ZP
    txa 
    and #$C0                ;Extract the two sprite flip bytes from theoriginal
    ora $D4                 ;control byte and set any additional bits from ObjectCntrl.
    sta $05                 ;Store modified byte to load in sprite control byte later.

LDCEF:* TXA             ;Discard upper nibble so only entry number into
LDCF0:  AND #$0F            ;PlacePtrTbl remains.
LDCF3:  TAX             ;Transfer to X to use as an index to find proper
LDCF4:  RTS             ;placement data segment.

;-----------------------------------------------------------------------------------------------------

MoveEnemies_Continued:
    lda #$00
    sta ObjectCntrl         ;Clear object control byte.
    PLA
    PLA
    LDX PageIndex
LDCFC:  
    ldy EnDataIndex,x
    LDA InArea
    CMP #$13
    BNE +
    cpy #$04
    BEQ +++++
    cpy #$02
    BEQ +++++
*   LDA $040C,x
    ASL
    BMI OnBossKilled

    lda $968B,y
    sta $00

;inlined $80B0
    lda $977B,y
    asl              
    AND #$20

    STA EnDataIndex,x
    LDA #$05
    STA EnStatus,x
    LDA #$60
    STA $040D,x
    LDA RandomNumber1
    CMP #$10
    BCC LDD5B
*   AND #$07
    TAY
    LDA ItemDropTbl,y
    STA EnAnimFrame,x
    CMP #$80
    BNE ++
    LDY MaxMissilePickup
    CPY CrntMslePickups
    BEQ LDD5B
    LDA MaxMissiles
    BEQ LDD5B
    INC CrntMslePickups
EXIT_67:
*   RTS

*   LDY MaxEnergyPickup
    CPY CrntEnrgyPickups
    BEQ LDD5B
    INC CrntEnrgyPickups
    CMP #$89
    BNE EXIT_67
    LSR $00
    BCS EXIT_67

LDD5B:
    ldx PageIndex
    lda InArea
    cmp #$13
    beq ++
*   jmp KillObject          ;($FA18)Free enemy data slot.

*   lda RandomNumber1
    ldy #$00
    sty CrntEnrgyPickups
    sty CrntMslePickups
    iny
    sty MaxMissilePickup
    sty MaxEnergyPickup
    bne -----

OnBossKilled:

;PowerUpMusic:
    LDA #MUS_PWR_UP
    ORA MultiSFXFlag
    STA MultiSFXFlag

    lda InArea
    and #$0F
    sta MiniBossKillDly
    lsr
    tay
    sta MaxMissiles,y
    lda #75
    jsr AddToMaxMissiles
    bne LDD5B               ; Branch always

; TODO - This kicks off the fat slow
; HUGBEES #3  - %7 of average frame time is spent here

; Move this to the most common jmpSomethingAboutMovement line
SomethingAboutMovement:
    ; MARU
    ;ldx PageIndex          ; Should be loaded from all callers already
    ldy EnAnimFrame,x
    cpy #$F7
    bne MoveEnemies
    lda #$00
    sta ObjectCntrl
    rts

; AddToMaxMissiles
; ================
; Adds A to both MissileCount & MaxMissiles, storing the new count
; (255 if it overflows)

AddToMaxMissiles:
    PHA             ;Temp storage of # of missiles to add.
    CLC
    ADC MissileCount
    BCC +               ; Only possible to overflow 255 during loading
    LDA #$FF
*   STA MissileCount
    PLA
    ADC MaxMissiles
    STA MaxMissiles
    RTS

MoveEnemies:
*   LDA EnYRoomPos,x
    STA $0A  ; Y coord
    
    LDA EnXRoomPos,x
    STA $0B  ; X coord
    
    LDA EnNameTable,x
    STA $06  ; hi coord
;    LDY EnAnimFrame,x
    
    LDA EnemyFramePtrTbl_Lo,y
*   STA $00
    
    LDA EnemyFramePtrTbl_Hi,y
*   STA $01
    
    JSR GetSpriteCntrlData      ;($DCC3)Get place pointer index and sprite control data.
    
    LDA EnemyPlacePtrTbl_Lo,x
    STA $02
    
    LDA EnemyPlacePtrTbl_Hi,x
    STA $03

    ;LDY #$00                   ; GetSpriteCntrlData sets Y to 0
    CPX #$01
    BNE +
        LDX PageIndex
        INC EnCounter,x
        LDA EnCounter,x
        PHA
            AND #$03
            TAX
            LDA $05
            AND #$3F
            ORA ExplodeRotationTbl,x
            STA $05
        PLA
        CMP #$19
        BNE +
            JMP MoveEnemies_Continued

*   LDX PageIndex
    INY
    LDA ($00),y
    STA EnRadY,x

    ; Reduce Y Radius
      sec                 ; needed (so far)
      sbc #$10            ;Subtract #$10 from object y radius.
      bcs +               ;If number is still a positive number, branch to store value.
      lda #$00            ;Number is negative.  Set Y radius to #$00.
    * sta $08             ;Store result and return.

    INY
    LDA ($00),y
    STA EnRadX,x
    STA $09

    INY
    STY $11

    JSR IsObjectVisible     ;($DFDF)Determine if object is within screen boundaries.
    ;TXA
    ASL
    STA $08

    ;LDX PageIndex
    LDA $0405,x
    AND #$FD
    ORA $08
    STA $0405,x

    LDA $08
    BEQ ClearObjectCntrl_2
    JMP DoDrawSpriteObject

ClearObjectCntrl_2:
    lda #$00              ; A == 0 here
    sta ObjectCntrl       ;Clear object control byte.
    rts                   ;

AnimDrawObject:
LDE47:  jsr UpdateObjAnim       ;($DC8F)Update animation if needed.

DrawFrame:
LDE4A:  ldx PageIndex           ;Get index to proper object to work with.
LDE4C:  ldy AnimFrame,x         ;
LDE4F:  cpy #$F7                ;Is the frame valid?
LDE51:  beq ClearObjectCntrl_2  ;Branch if no.

; HCSS - just pulled random crap out that might be important

LDE60:* lda ObjectY,x           ;
LDE63:  sta $0A             ;

LDE65:  lda ObjectX,x           ;Copy object y and x room position and name table
LDE68:  sta $0B             ;data into $0A, $0B and $06 respectively.

LDE6A:  lda ObjectHi,x          ;
LDE6D:  sta $06             ;

LDE74:  lda FramePtrTable_Lo,y     ;
LDE77:  sta $00             ;

LDE79:  lda FramePtrTable_Hi,y       ;Entry from FramePtrTable is stored in $0000.
LDE7C:  sta $01             ;

LDE7E:  jsr GetSpriteCntrlData      ;($DCC3)Get place pointer index and sprite control data.

LDE81:  lda PlacePtrTable_Lo,x     ;
LDE84:  sta $02             ;

LDE86:  lda PlacePtrTable_Hi,x       ;Store pointer from PlacePtrTbl in $0002.
LDE89:  sta $03             ;

;Special case for Samus exploding.
LDE8F:  cpx #$07                    ;Is Samus exploding?
LDE91:  bne DrawFramePPUPart        ;If not, branch to skip this section of code.

LDE95:  inc ObjectCounter           ;Incremented every frame during explode sequence.
LDE97:  lda ObjectCounter           ;Bottom two bits used for index into ExplodeRotationTbl.
;LDE99:  pha                         ;Save value of A.
LDE9A:  and #$03                    ;Use 2 LSBs for index into ExplodeRotationTbl.
LDE9C:  tax                         ;
LDE9D:  lda $05                     ;Drop mirror control bits from sprite control byte.
LDE9F:  and #$3F                    ;
LDEA1:  ora ExplodeRotationTbl,x    ;Use mirror control bytes from table(Base is $DC8B).
LDEA4:  sta $05                     ;Save modified sprite control byte.
;LDEA6:  pla                         ;Restore A
        lda ObjectCounter
LDEA7:  cmp #$19                    ;After 25 frames, Move on to second part of death 
LDEA9:  bne DrawFramePPUPart        ;handler, else branch to skip the rest of this code.

LDEAD:  lda #sa_Dead2           ;
LDEAF:  sta SamusObjAction         ;Move to next part of the death handler.

LDEB2:  lda #$28            ;
LDEB4:  sta AnimDelay       ;Set animation delay for 40 frames(.667 seconds).

LDEB7:  pla                 ;Pull last return address off of the stack.
LDEB8:  pla                 ;
        sty ObjectCntrl     ;Y = 0 here; Clear object control byte.
        rts                 ;

DrawFramePPUPart:
LDEBC:* ldx PageIndex       ;
LDEBE:  iny                 ;Increment to second frame data byte.
LDEBF:  lda ($00),y         ;
LDEC1:  sta ObjRadY,x           ;Get verticle radius in pixles of object.

    ; Reduce Y Radius
      sec 
      sbc #$10              ;Subtract #$10 from object y radius.
      bcs +                 ;If number is still a positive number, branch to store value.
      lda #$00              ;Number is negative.  Set Y radius to #$00.
    * sta $08               ;Store result and return.

LDEC6:  iny                 ;Increment to third frame data byte.
LDEC7:  lda ($00),y         ;Get horizontal radius in pixels of object.
LDEC9:  sta ObjRadX,x       ;
LDECB:  sta $09             ;Temp storage for object x radius.

LDECD:  iny                 ;Set index to 4th byte of frame data.
LDECE:  sty $11             ;Store current index into frame data.

LDED0:  jsr IsObjectVisible     ;($DFDF)Determine if object is within the screen boundaries.
;LDED3:  txa             ;

;LDED4:  ldx PageIndex           ;Get index to object.
LDED6:  sta ObjectOnScreen,x        ;Store visibility status of object.
LDEDB:  tax                     ;
LDEDC:  beq SetObjectCntrlToA   ;

DoDrawSpriteObject:
LDEDE:  ldx SpritePagePos       ;Load index into next unused sprite RAM segment.
LDEE0:  jmp DrawSpriteObject        ;($DF19)Start drawing object.

SetObjectCntrlToA:
    sta ObjectCntrl         ;Clear object control byte.
    rts 
;----------------------------------[ Sprite placement routines ]-------------------------------------

;Special case for Samus exploding.
SamusExplodeDisplacement:
    adc ObjectCounter       ;Increments every frame Samus is exploding. Initial=#$01.
SamusExplodeDisplacement_2:
    tay             ;
    lda ExplodeIndexTbl+2,y     ;Get data from ExplodePlacementTbl.
    pha             ;Save data on stack.
    lda $0F             ;Load placement data index.
    clc             ;
    adc #$0C            ;Move index forward by 12 bytes. to find y
    tay             ;placement data.
    pla             ;Restore A with ExplodePlacementTbl data.
    clc             ;
    adc ($02),y         ;Add table displacements with sprite placement data.
    bit $04             ;
    bmi NegativeDisplacementY    ;Branch if MSB in $04 is set(Flips object).
    bpl AfterYDisplacement

; This one is in a weird spot so I can attempt use branches instead of jumps in other places

.scope
ExplodeXDisplace:
    ldy PageIndex           ;Load index to proper enemy slot.
    lda EnCounter,y         ;Load counter value.
    ldy IsSamus         ;Is Samus the one exploding?
    beq _Skip1          ;If not, branch.
    lda ObjectCounter       ;Load object counter if it is Samus who is exploding.
_Skip1:
    asl             ;*2. Move sprite in x direction 2 pixels every frame.
    pha             ;Store value on stack.
    ldy $0F             ;
    lda ($02),y         ;Load placement data byte.
    lsr             ;
    bcs _Skip2       ;Check if LSB is set. If not, the byte stored on stack
    pla             ;Will be twos complimented and used to move sprite in
    eor #$FF            ;the negative x direction.
    adc #$01            ;
    pha
_Skip2:         ;
    lda $0F             ;Load placement data index.
    clc             ;
    adc #$0C            ;Move index forward by 12 bytes. to find x
    tay             ;placement data.
    pla             ;Restore A with x displacement data.
    clc             ;
    adc ($02),y         ;Add x displacement with sprite placement data.
    jmp XDisplacementBitCheck ;Branch to add x placement values to sprite coords.
.scend

WriteSpriteRAM:
LDEE6: ldy $0F             ;Load index for placement data.

.scope
YDisplacement:
    lda ($02),y         ;Load placement data byte.
    tay             ;
    and #$F0            ;Check to see if this is placement data for the object
    cmp #$80            ;exploding.  If so, branch.
    beq ExplodeYDisplace              ;
    tya             ;Restore placement data byte to A.
    bit $04             ;
    bmi NegativeDisplacementY    ;Branch if MSB in $04 is set(Flips object).
    bpl _ClearAndExit

ExplodeYDisplace:
    tya             ;Transfer placement byte back into A.
    asr #$0E            ;Discard bits 7,6,5,4 and 0.
    tay             ;
    lda ExplodeIndexTbl,y       ;Index into ExplodePlacementTbl.
    ldy IsSamus         ;
    bne SamusExplodeDisplacement  ;Is Samus the object exploding? if so, branch.
    ldy PageIndex           ;Load index to proper enemy data.
    adc EnCounter,y         ;Increment every frame enemy is exploding. Initial=#$01.
    jmp SamusExplodeDisplacement_2 ;Jump to load explode placement data.

NegativeDisplacementY:
    eor #$FF            ;
    sec             ;NOTE:Setting carry makes solution 1 higher than expected.
    adc #$F8            ;If flip bit is set in $04, this function flips the
_ClearAndExit:
    sec
.scend

AfterYDisplacement:
        sbc #$00
LDEE9:  clc
LDEEB:  adc $10             ;Add initial Y position.
LDEED:  sta SpriteRAM,x       ;Store sprite Y coord.
LDEF3:  inc $0F             ;Increment index to next byte of placement data.
LDEF5:  ldy MacroTileIndex             ;Get index to frame data.
LDEF7:  lda ($00),y         ;Tile value.
LDEF9:  sta SpriteRAM+1,x     ;Store tile value in sprite RAM.

LDEFC:  lda ObjectCntrl         ;
LDEFE:  asl                     ;Move horizontal mirror control byte to bit 6 and
LDEFF:  asl                     ;discard all other bits.
LDF00:  and #$40                ;
LDF02:  eor $05                 ;Use it to override sprite horz mirror bit.
LDF04:  sta SpriteRAM+2,x       ;Store sprite control byte in sprite RAM.

LDF07:  inc MacroTileIndex    ;Increment to next byte of frame data.
LDF09:  ldy $0F             ;Load index for placement data.

.scope
XDisplacement:
    lda ($02),y         ;Load placement data byte.
    tay             ;
    and #$F0            ;Check to see if this is placement data for the object
    cmp #$80            ;exploding.  If so, branch.
    beq ExplodeXDisplace ;
    tya             ;Restore placement data byte to A.

XDisplacementBitCheck:
    bit $04             ;
    bvc _ClearAndExit    ;Branch if bit 6 cleared, else data is negative displacement.

NegativeDisplacementX:
    eor #$FF            ;
    sec             ;NOTE:Setting carry makes solution 1 higher than expected.
    adc #$F8            ;If flip bit is set in $04, this function flips the

_ClearAndExit:
    clc             ;object by using two compliment minus 8(Each sprite is ;8x8 pixels).

.scend

AfterXDisplacement:

LDF0E:  adc $0E             ;Add initial X pos
LDF10:  sta SpriteRAM+3,x     ;Store sprite X coord
LDF13:  inc $0F             ;Increment to next placement data byte.
        txa
        sbx #$FC            ; Add 4 to X

DrawSpriteObject:
LDF19:  ldy $11             ;Get index into frame data.

GetNextFrameByte:
LDF1B:  lda ($00),y                 ;Get next frame data byte.
LDF1D:  cmp #$FC                    ;If byte < #$FC, byte is tile data.
LDF1F:  bcc WriteSpriteRAM          ;if < #$FC, byte is frame data control info. Branch to draw sprite.
LDF21:  beq OffsetObjectPosition    ;if == $FC changes object's x and y position.
        cmp #$FE
        bcc GetNewControlByte       ;if == $FD - sets new control byte information for the next sprites.
        beq SkipPlacementData       ;if == $FE - skips next sprite placement x and y bytes.
LDF2B:  stx SpritePagePos           ;Keep track of current position in sprite RAM.

ClearObjectCntrl:
LDF2D:  lda #$00                    ;
LDF2F:  sta ObjectCntrl             ;Clear object control byte.
LDF31:  rts                         ;

SkipPlacementData:
    lda $0F                     ;Skip next y and x placement data bytes.
    adc #$01
    sta $0F
LDF36:  inc $11                     ;Increment to next data item in frame data.
LDF38:  bne DrawSpriteObject        ;Branch Always - ($DF19)Draw next sprite.

.scope

GetNewControlByte:
    LDF3B:  iny                     ;Increment index to next byte of frame data.
    LDF3C:  asl ObjectCntrl         ;If MSB of ObjectCntrl is not set, no overriding of
            lda ($00),y             ;Reload frame data control byte into A.
            iny 
            sty $11                 ;Save index of frame data.
    LDF3E:  bcs _flip               ;flip bits needs to be performed.
    
    _noFlip:
        sta $05                     ;Save new sprite control byte.
        lsr ObjectCntrl             ;Restore MSB.
        jmp GetNextFrameByte        ;($DF1B)Load next frame data byte.

    _flip:
    ;SpriteFlipBitsOverride
        ; TODO - Search the other SpriteFlipBitsOverride and try to do the same trick
        lsr ObjectCntrl             ;Restore MSB.
        and #$C0                    ;Extract the two sprite flip bytes from theoriginal
        ora ObjectCntrl             ;control byte and set any additional bits from ObjectCntrl.
        sta $05                     ;Store modified byte to load in sprite control byte later.
        lda ObjectCntrl             ;
        ora #$80                    ;
        sta ObjectCntrl             ;Ensure MSB of object control byte remains set.
        bne GetNextFrameByte        ;Branch Always - ($DF1B)Load next frame data byte.
.scend

OffsetObjectPosition:
        iny                         ;Increment index to next byte of frame data.
        lda ($00),y                 ;This data byte is used to offset the object from its current y position
        adc ScreenYPos              ;
        sta ScreenYPos              ;Add offset amount to object y screen position.
        
        iny                         ;
        lda ($00),y                 ;Load x offset data byte.
        adc ScreenXPos              ;Add offset amount to object x screen position.
        sta ScreenXPos 

        clc
        lda $11
        adc #$03
        sta $11

LDF68:  bne DrawSpriteObject        ;Always branch. Draw next sprite.

;---------------------------------[ Check if object is on screen ]----------------------------------

;The following set of functions determine if an object is visible on the screen.  If the object
;is visible, X-1 when the function returns, X=0 if the object is not within the boundaries of the
;current screen.  The function needs to know what nametable is currently in the PPU, what nametable
;the object is on and what the scroll offsets are. 

IsObjectVisible:

LDFE1:  lda $0A                 ;Object Y position in room.
LDFE3:  tay                     ;
LDFE4:  sec                     ;Subtract y scroll to find sprite's y position on screen.
LDFE5:  sbc ScrollY             ;
LDFE7:  sta $10                 ;Store result in $10.

LDFE9:  lda $0B                 ;Object X position in room.
LDFEB:  sec                     ;
LDFEC:  sbc ScrollX             ;Subtract x scroll to find sprite's x position on screen.
LDFEE:  sta $0E                 ;Store result in $0E.

LDFF0:  lda ScrollDir           ;
LDFF2:  and #$02                ;Is Samus scrolling left or right?
LDFF4:  bne HorzScrollCheck     ;($E01C)If so, branch.

VertScrollCheck:
LDFF6:  cpy ScrollY             ;If object room pos is >= scrollY, set carry.
LDFF8:  lda $06                 ;Check if object is on different name table as current
LDFFA:  eor PPUCNT0ZP           ;name table active in PPU.
LDFFC:  and #$01                ;If not, branch.
LDFFE:  beq VertBccCheck        ;
LE000:  bcs Return_Invisible    ;If carry is still set, sprite is not in screen boundaries.
LE002:  lda $10                 ;
LE004:  sbc #$0F                ;Move sprite y position up 15 pixles.
LE006:  sta $10                 ;
LE008:  lda $09                 ;
LE00A:  clc                     ;If a portion of the object is outside the sceen
LE00B:  adc $10                 ;boundaries, treat object as if the whole thing is
LE00D:  cmp #$F0                ;not visible.
LE00F:  bcc Return_Visible      ;
LE011:  bcs Return_Invisible    ;

VertBccCheck:
LE012:  bcc Return_Invisible    ;
LE014:  lda $09                 ;If object is on same name table as the current one in
LE016:  cmp $10                 ;the PPU, check if part of object is out of screen 
LE018:  bcs Return_Invisible    ;boundaries.  If so, branch.

Return_Visible:
    lda #$01
    rts

HorzScrollCheck:
LE01C:  lda $06                 ;
LE01E:  eor PPUCNT0ZP           ;Check if object is on different name table as current
LE020:  and #$01                ;name table active in PPU.
LE022:  beq HorzBccCheck        ;If not, branch.
LE024:  bcs Return_Invisible    ;If carry is still set, sprite is not in screen boundaries.
LE026:  lda $09                 ;If a portion of the object is outside the screen
LE029:  adc $0E                 ;boundaries, treat object as if the whole thing is
LE02B:  bcc Return_Visible      ;not visible.
LE02D:  bcs Return_Invisible    ;

HorzBccCheck:
LE02E:* bcc Return_Invisible    ;
LE030:  lda $09                 ;If object is on same name table as the current one in
LE032:  cmp $0E                 ;the PPU, check if part of object is out of screen 
LE034:  bcc Return_Visible      ;boundaries.  If so, branch.

Return_Invisible:
    lda #$00
    rts 

;--------------------------------------[ Update enemy animation ]-----------------------------------

;move to next frame of enemy's animation. Basically the same as UpdateObjAnim, only for enemies.

.scope
    UpdateEnemyAnim:
        LE094: ldx PageIndex                    ;Load index to desired enemy.
        LE096: ldy EnStatus,x                   ;
        LE099: cpy #$05                         ;Is enemy in the process of dying?
        LE09B: beq UpdateEnemyAnimExit          ;If so, branch to exit.
        LE09D: ldy EnAnimDelay,x                ;
        LE0A0: beq _saveAnimDelay               ;Check if current anumation frame is ready to be updated.
        LE0A2: dec EnAnimDelay,x                ;Not ready to update. decrement delay timer and
        LE0A5: bne UpdateEnemyAnimExit          ;branch to exit.

    _saveAnimDelay:
        LE0A7: sta EnAnimDelay,x           ;Save new animation delay value.
        LE0AA: ldy EnAnimIndex,x           ;Load enemy animation index.

    _getNextAnimData:
        LE0AD: lda EnemyAnimIndexTbl,y     ;Get animation data.
        LE0AF: cmp #$FF                    ;End of animation?
        LE0B1: beq _resetAnimation         ;If so, branch to reset animation.
        LE0B3: sta EnAnimFrame,x           ;Store current animation frame data.
        LE0B6: iny                         ;Increment to next animation data index.
        LE0B7: tya                         ;
        LE0B8: sta EnAnimIndex,x           ;Save new animation index.

    UpdateEnemyAnimExit:
        LE0BB: rts                          ;

    _resetAnimation:
        LE0BC: ldy EnResetAnimIndex,x       ;reset animation index.
        LE0BF: bcs _getNextAnimData         ;Branch always.
.scend
;---------------------------------------[ Display status bar ]---------------------------------------

;Displays Samus' status bar components.

;Sprite data for Samus' data display

;Original_Data_Table:
;    .byte $28,$00,$3A,$21       ; 0 = ..
;    .byte $20,$01,$7F,$21       ; 1 = N
;    .byte $18,$01,$76,$21       ; 2 = E
;    .byte $20,$00,$5F,$2B       ; 3 = Right half of missile.
;    .byte $18,$00,$5E,$2B       ; 4 = Left half of missile.
;    .byte $38,$01,$FF,$2B       ; 5 = Lower missile digit.
;    .byte $30,$01,$FF,$2B       ; 6 = Middle missile digit.
;    .byte $28,$01,$FF,$2B       ; 7 = Upper missile digit.
;    .byte $38,$01,$A0,$21       ; 8 = Lower health digit.
;    .byte $30,$01,$A0,$21       ; 9 = Upper health digit.


Hud_Sprite_X_Tbl:
    .byte $28, $20, $18, $20, $18, $38, $30, $28, $38, $30

Hud_Sprite_Index_Tbl:
    .byte $3A, $7F, $76, $5F, $5E, $FF, $FF, $FF, $A0, $A0

TensPlaceTable:
    .byte $A0, $A0, $A0, $A0, $A0
    .byte $A1, $A1, $A1, $A1, $A1
    .byte $A2, $A2, $A2, $A2, $A2
    .byte $A3, $A3, $A3, $A3, $A3
    .byte $A4, $A4, $A4, $A4, $A4
    .byte $A5, $A5, $A5, $A5, $A5
    .byte $A6, $A6, $A6, $A6, $A6
    .byte $A6, $A7, $A7, $A7, $A7
    .byte $A8, $A8, $A8, $A8, $A8
    .byte $A9, $A9, $A9, $A9, $A9

DisplayBar:
LE0C3:  
    lax SpritePagePos               ; Load current sprite index.

    cmp HudCacheIndex               ; Adding a cache to skip writing hud sprites
    stx HudCacheIndex               ; As long as they are all in the same place
    bne DoHudSpriteSetup
        sbx #$D8                    ; Add #$28 or #40 using one of the best illigal opcodes
        bne AfterDisplayBarLoop     ; Branch always

    DoHudSpriteSetup:

    ; Load the Hud sprite palette color data
    lda #$01
    sta SpriteRAM+2,x
    sta SpriteRAM+6,x
    sta SpriteRAM+10,x
    sta SpriteRAM+14,x
    sta SpriteRAM+18,x
    sta SpriteRAM+30,x
    sta SpriteRAM+34,x

    lda #$00
    sta SpriteRAM+22,x
    sta SpriteRAM+26,x
    sta SpriteRAM+38,x

    ; Load the Hud sprite Y position data
    lda #$2B
    sta SpriteRAM+8,x
    sta SpriteRAM+12,x
    sta SpriteRAM+16,x
    sta SpriteRAM+20,x
    sta SpriteRAM+24,x

    lda #$21
    sta SpriteRAM,x
    sta SpriteRam+4,x
    sta SpriteRam+28,x
    sta SpriteRam+32,x
    sta SpriteRam+36,x

    ldy #10
    DisplayBarLoop:

        lda Hud_Sprite_Index_Tbl-1, y
        sta SpriteRAM+1,x

        lda Hud_Sprite_X_Tbl-1, y
        sta SpriteRAM+3,x

        dey

        lda Hud_Sprite_Index_Tbl-1, y
        sta SpriteRAM+5,x

        lda Hud_Sprite_X_Tbl-1, y
        sta SpriteRAM+7,x

        txa
        sbx #$F8        ; Add 8 to X register

        dey

    bne DisplayBarLoop          ;load next byte from table.

AfterDisplayBarLoop:

;Display 2-digit health count.
LE0D3:  stx SpritePagePos       ;Save new location in sprite RAM.

PrintHealthTensDigit:
LE0D7:  lda HealthHi            ;
LE0DA:  and #$0F                ;Extract upper health digit.
        ora #$A0
        sta SpriteRAM-39,x

PrintHealthOnesDigit:
LE0DF:  ldy HealthLo 
LE0E2:  lda Div16Table, y
        ora #$A0                
        sta SpriteRAM-35,x

LE0E8:  ldy EndTimerHi                      ;
LE0EB:  iny                                 ;Is Samus in escape sequence?
LE0EC:  bne DisplayEscapeSequenceTimer      ;If so, branch.
LE0EE:  ldy MaxMissiles                     ;
LE0F1:  beq EraseMissileSprite              ;Don't show missile count if Samus has no missile containers.

;------------------------------------[ Convert hex to decimal ]--------------------------------------
; Display 3-digit missile count. Convert the Hex number of missiles to a 3 digit decimal number
; The digit sprites (0 - 9) start at $A0 so the #$9F trick is just to get us the proper mapping to the digit sprites

.scope
DisplayNumberOfMissiles:
    lda MissileCount
    ldy #$A0

    cmp #100
    bcc PrintMissileHundredsDigit

    iny
    cmp #200
    bcc _Minus100

    iny
    sbc #100

    _Minus100:
        sec
        sbc #100

    PrintMissileHundredsDigit:
        pha 
        tya 
        sta SpriteRAM - 31,x
        pla 

    DisplayMissleTensDigit:
        ror
        tay
        lda TensPlaceTable, y

    PrintMissileTensDigit:
        sta SpriteRAM - 27,x

        tya
        rol
        and #$0F
        cmp #10
        bcc PrintMissileOnesDigit
        sbc #10 

    PrintMissileOnesDigit:
        ora #$A0
        sta SpriteRAM - 23,x

    bne MissileAndTimerDisplayEnd   ;Branch always.

.scend

EraseMissileSprite:
;Samus has no missiles, erase missile sprite.
LE10A:* lda #$FF                        ;"Blank" tile.
LE10C:  cpx #$D4                        ;If at last 3 sprites, branch to skip.
LE10E:  bcs MissileAndTimerDisplayEnd   ;
LE110:  sta SpriteRAM-19,x              ;Erase left half of missile.
LE113:  cpx #$D0                        ;If at last 4 sprites, branch to skip.
LE115:  bcs MissileAndTimerDisplayEnd   ;
LE117:  sta SpriteRAM-15,x              ;Erase right half of missile.
LE11A:  bne MissileAndTimerDisplayEnd   ;Branch always.

DisplayEscapeSequenceTimer:
;Display 3-digit end sequence timer.
LE11C:* ldy EndTimerHi          ;
        lda Div16Table, y
        ora #$A0            ;#$A0 is index into pattern table for numbers.
        sta SpriteRAM-31,x     ;Store proper nametable pattern in sprite RAM.

LE125:  lda EndTimerHi          ;
LE128:  and #$0F                ;Middle timer digit.
        ora #$A0               ;#$A0 is index into pattern table for numbers.
        sta SpriteRAM-27,x     ;Store proper nametable pattern in sprite RAM.

LE12D:  ldy EndTimerLo          ;
        lda Div16Table, y       
        ora #$A0               ;#$A0 is index into pattern table for numbers.
        sta SpriteRAM-23,x     ;Store proper nametable pattern in sprite RAM.

LE136:  lda #$58                ;"TI" sprite(left half of "TIME").
LE138:  sta SpriteRAM-19,x      ;
        lda #$01
LE13B:  sta SpriteRAM-18,x      ;Change color of sprite to pal 1

LE13E:  cpx #$DC                ;If at last sprite, branch to skip.
LE140:  bcs MissileAndTimerDisplayEnd
        sta SpriteRAM-14,x      ;Change color of sprite to pal 1               ;
LE142:  lda #$59                ;"ME" sprite(right half of "TIME").
LE144:  sta SpriteRAM-15,x      ;

MissileAndTimerDisplayEnd:
    *   lda TankCount           ;
LE14F:  beq ++              ;Branch to exit if Samus has no energy tanks.

;----------------------------------[ Add energy tanks to display ]------------------------------------

AddTanks:
LE157:  lda #$6F                    ;"Full energy tank" tile.
        sta $00
LE159:  ldy HealthHi 
LE15C:  lda Div16Table, y
LE15F:  sta $01                     ;Storage of full tanks.
LE161:  bne AfterAddTankSetup       ;Branch if at least 1 tank is full.
LE163:  dec $00                     ;Else switch to "empty energy tank" tile.

AfterAddTankSetup:
    ldy #$00
    ldx SpritePagePos               ;Restore initial sprite page pos.

AddOneTank:
    LE17B:  lda #$17                ;Y coord-1.
    LE17D:  sta SpriteRAM,x         ;
    LE180:  lda $00                 ;Tile value.
    LE181:  sta SpriteRAM+1,x       ;
    LE184:  lda #$01                ;Palette #.
    LE186:  sta SpriteRAM+2,x       ;
            iny
    LE189:  lda TankXTable-1,y      ;X coord.
    LE18B:  sta SpriteRAM+3,x       ;
            txa
            sbx #$FC                ;add 4 to x
    LE167:  dec $01                 ;Any more full energy tanks left?
    LE169:  bne +                   ;If so, then branch.
    LE16B:  dec $00                 ;Otherwise, switch to "empty energy tank" tile.
    LE16C:* cpy TankCount           ;done all tanks?
    LE16E:  bne AddOneTank          ;if not, loop to do another.

    LE170:  stx SpritePagePos       ;Store new sprite page position.
    LE172:* rts                     ;

TankXTable:
    .byte 64, 54, 44, 34, 24, 14

;-------------------------------------------[ Bit scan ]---------------------------------------------

;This function takes the value stored in A and right shifts it until a set bit is encountered.
;Once a set bit is encountered, the function exits and returns the bit number of the set bit.
;The returned value is stored in A. 

; HCSS
.scope
BitScan:
    beq _zero

    tax      
    and #$0F 
    beq _high

    tay             
    lda Nibble_Tab-1,y 
    rts             

_high:
    ldy Div16Table, x            
    lda Nibble_Tab-1,y
    adc #$04
    rts

_zero:
    lda #$08                ; 2c
BitscanExit:
    rts

Nibble_Tab:
    .byte $00, $01, $00, $02, $00, $01, $00, $03, $00, $01, $00, $02, $00, $01, $00

.scend

;------------------------------------------[ Scroll door ]-------------------------------------------

;Scrolls the screen if Samus is inside a door.

ScrollDoor:
;LE1F1:  ldx DoorStatus          ;
;LE1F3:  beq BitscanExit         ;Exit if Samus isn't in a door.
LE1F5:  dex             ;
LE1F6:  bne +               ;Not in right door. branch to check left door.
LE1F8:  jsr ScrollRight         ;($E6D2)DoorStatus=1, scroll 1 pixel right.
LE1FB:  jmp ++              ;Jump to check if door scroll is finished.

LE1FE:* dex             ;Check if in left door.
LE1FF:  bne ++              ;
LE201:  jsr ScrollLeft          ;($E6A7)DoorStatus=2, scroll 1 pixel left.
LE204:* ldx ScrollX         ;Has x scroll offset reached 0?
LE206:  bne Exit15          ;If not, branch to exit.

;Scrolled one full screen, time to exit door.
LE208:  ldx #$05            ;Samus is exiting the door.
LE20A:  bne DoOneDoorScroll     ;Branch always.
        ;safe

LE20C:* dex             ;
LE20D:  bne +               ;Check if need to scroll down to center door.
LE20F:  jsr ScrollDown          ;($E519)DoorStatus=3, scroll 1 pixel down.
LE212:  jmp ++              ;Jump to check y scrolling value.
LE215:* dex             ;
LE216:  bne Exit15          ;Check if need to scroll up to center door.
LE218:  jsr ScrollUp            ;($E4F1)DoorStatus=4, scroll 1 pixel up.

VertRoomCentered:
LE21B:* ldx ScrollY         ;Has room been centered on screen?
LE21D:  bne Exit15          ;If not, branch to exit.
LE21F:  stx DoorOnNameTable3        ;
LE221:  stx DoorOnNameTable0        ;Erase door nametable data.
LE223:  inx             ;X=1.
LE224:  lda ObjectX         ;Did Samus enter in the right hand door?
LE227:  bmi ++              ;If so, branch.
LE229:  inx             ;X=2. Samus is in left door.
LE22A:  bne ++              ;Branch always.

;This function is called once after door scrolling is complete.

DoOneDoorScroll:
LE22C:  lda #$20            ;Set DoorDelay to 32 frames(comming out of door).
LE22E:  sta DoorDelay           ;

LE230:  lda SamusDoorData       ;Check if scrolling should be toggled.
        and #$20                ;($C2C6)*8. Is door not to toggle scrolling(item room,
LE235:  bne +                   ;bridge room, etc.)? If so, branch to NOT toggle scrolling.
LE237:  ldy DoorScrollStatus    ;If comming from vertical shaft, skip ToggleScroll because
LE239:  cpy #$03                ;the scroll was already toggled after room was centered
LE23B:  bcc ++                  ;by the routine just above.
LE23D:* lda #$47                ;Set mirroring for vertical mirroring(horz scrolling).
LE23F:  bne ++                  ;Branch always.

LE241:* jsr ToggleScroll        ;($E252)Toggle scrolling and mirroring.
LE244:* sta MirrorCntrl         ;Store new mirror control data.
LE246:  stx DoorStatus          ;DoorStatus=5. Done with door scrolling.

Exit15:
LE248:  rts             ;Exit for several routines above.

;------------------------------------[ Toggle Samus nametable ]--------------------------------------

ToggleSamusHi:
LE249:  lda ObjectHi            ;
LE24C:  eor #$01            ;Change Samus' current nametable from one to the other.
LE24E:  sta ObjectHi            ;
LE251:  rts             ;

;-------------------------------------------[ Toggle scroll ]----------------------------------------

;Toggles both mirroring and scroll direction when Samus has moved from
;a horizontal shaft to a vertical shaft or vice versa.

ToggleScroll:
LE252:  lda ScrollDir           ;
LE254:  eor #$03                ;Toggle scroll direction.
LE256:  sta ScrollDir           ;
LE258:  lda MirrorCntrl         ;Toggle mirroring.
LE25A:  eor #$08            ;
ToggleScrollExit:
LE25C: rts                 ;

;----------------------------------[ Check lava and movement routines ]------------------------------

; HUGBEES #5 - %4.5 of frame time is spent here (???)
LavaAndMoveCheck:
LE25D:  
    lda SamusObjAction           ;
    cmp #sa_Elevator        ;Is Samus on elevator?
    beq +                   ;If so, branch.
    cmp #sa_Dead            ;Is Samus Dead
    bcs ToggleScrollExit    ;If so, branch to exit.

;The following function checks to see if Samus is in lava.  If she is, the carry bit is cleared,
;if she is not, the carry bit is set. Samus can only be in lava if in a horizontally scrolling
;room. If Samus is 24 pixels or less away from the bottom of the screen, she is considered to be
;in lava whether its actually there or not.

IsSamusInLava:
*   lda #$01                ;
    cmp ScrollDir           ;Set carry bit(and exit) if scrolling up or down.
    bcs +                   ;
    lda #$D8                ;If Samus is Scrolling left or right and within 24 pixels
    cmp ObjectY             ;of the bottom of the screen, she is in lava. Clear carry bit.
    
*   ldy #$FF                ;Assume Samus not in lava.
    bcs UpdateLavaStatus    ;Samus not in lava so branch.

;Samus is in lava.          
LE27B:  sty DmgPushDir      ;Don't push Samus from lava damage.
        iny                 ; y = 0 here
        sty HealthLoChange
        sty HealthHiChange
LE280:  lda #$32            ;
LE282:  sta SamusBlink          ;Make Samus blink.
LE284:  lda FrameCount          ;
LE286:  and #$03            ;Start the jump SFX every 4th frame while in lava.
LE288:  bne +               ;

SFX_SamusJump_Inline1:
    LDA #SFX_SMS_JMP
    ORA SQ1SFXFlag
    STA SQ1SFXFlag

LE28D:* lda FrameCount          ;
LE28F:  asr #$07            ;This portion of the code causes Samus to be damaged by ;lava twice every 8 frames if she does not have the varia
LE292:  bne ++              ;but only once every 8 frames if she does.
LE294:  lda SamusGear           ;
LE297:  and #gr_VARIA           ;Does Samus have the Varia?
LE299:  beq +               ;If not, branch.
LE29B:  bcc ++              ;Samus has varia. Carry set every other frame. Half damage.
LE29D:* lda #$07            ;
LE29F:  sta HealthLoChange      ;Samus takes lava damage.
LE2A1:  jsr SubtractHealthNoGuard      ;($CE92)
LE2A4:* ldy #$00            ;Prepare to indicate Samus is in lava.

UpdateLavaStatus:
LE2A6:* iny             ;Set Samus lava status.
LE2A7:  sty SamusInLava         ;

SamusMoveVertically:
LE2A9:  jsr VertAccelerate      ;($E37A)Calculate vertical acceleration.
LE2AC:  lda ObjectY         ;
LE2AF:  sec             ;
LE2B0:  sbc ScrollY         ;Calculate Samus' screen y position.
LE2B2:  sta SamusScrY           ;
LE2B4:  lda $00             ;Load temp copy of vertical speed.
LE2B6:  bpl ++++            ;If Samus is moving downwards, branch.

        EOR #$FF
        CLC                 ;TODO: Stick a breakpoint here and see what the carry bit is
        ADC #$01

LE2BB:  ldy SamusInLava         ;Is Samus in lava?
LE2BD:  beq +               ;If not, branch,
LE2BF:  lsr             ;else cut vertical speed in half.
LE2C0:  beq SamusMoveHorizontally   ;($E31A)Branch if no vertical mvmnt to Check left/right mvmnt.

;Samus is moving upwards.
LE2C2:* sta ObjectCounter       ;Store number of pixels to move Samus this frame.
LE2C4:* jsr MoveSamusUp         ;($E457)Attempt to move Samus up 1 pixel.
LE2C7:  bcs +               ;Branch if Samus successfully moved up 1 pixel.

LE2C9:  sec             ;Samus blocked upwards. Divide her speed by 2 and set the
LE2CA:  ror ObjVertSpeed        ;MSB to reverse her direction of travel.
LE2CD:  ror VertCntrLinear      ;
LE2D0:  jmp SamusMoveHorizontally   ;($E31A)Attempt to move Samus left/right.

LE2D3:* dec ObjectCounter       ;1 pixel movement is complete.
LE2D5:  bne --              ;Branch if Samus needs to be moved another pixel.

;Samus is moving downwards.
LE2D7:* beq SamusMoveHorizontally   ;($E31A)Branch if no vertical mvmnt to Check left/right mvmnt.
LE2D9:  ldy SamusInLava         ;Is Samus in lava?
LE2DB:  beq +               ;If not, branch,
LE2DD:  lsr             ;Else reduce Samus speed by 75%(divide by 4).
LE2DE:  lsr             ;
LE2DF:  beq SamusMoveHorizontally   ;($E31A)Attempt to move Samus left/right.

LE2E1:* sta ObjectCounter       ;Store number of pixels to move Samus this frame.

LE2E3:* jsr MoveSamusDown       ;($E4A3)Attempt to move Samus 1 pixel down.
LE2E6:  bcs +++             ;Branch if Samus successfully moved down 1 pixel.

;Samus bounce after hitting the ground in ball form.
LE2E8:  lda SamusObjAction           ;
LE2EB:  cmp #sa_Roll            ;Is Samus rolled into a ball?
LE2ED:  bne +               ;If not, branch.
LE2EF:  lsr ObjVertSpeed        ;Divide verticle speed by 2.
LE2F2:  beq ++              ;Speed not fast enough to bounce. branch to skip.
LE2F4:  ror VertCntrLinear      ;Move carry bit into MSB to reverse Linear counter.
LE2F7:  lda #$00            ;
LE2F9:  sec             ;
LE2FA:  sbc VertCntrLinear      ;Subtract linear counter from 0 and save the results.
LE2FD:  sta VertCntrLinear      ;Carry will be cleared.
LE300:  lda #$00            ;
LE302:  sbc ObjVertSpeed        ;Subtract vertical speed from 0. this will reverse the
LE305:  sta ObjVertSpeed        ;vertical direction of travel(bounce up).
LE308:  jmp SamusMoveHorizontally   ;($E31A)Attempt to move Samus left/right.

;Samus has hit the ground after moving downwards. 
LE30B: 
SFXSamusWalk_Inline3:
*       lda #$08
        ora NoiseSFXFlag
        sta NoiseSFXFlag

LE30E:* jsr StopVertMovement        ;($D147)Clear vertical movement data.
LE311:  sty SamusGravity        ;Clear Samus gravity value.
LE314:  beq SamusMoveHorizontally   ;($E31A)Attempt to move Samus left/right.

LE316:* dec ObjectCounter       ;1 pixel movement is complete.
LE318:  bne LE2E3               ;Branch if Samus needs to be moved another pixel.

SamusMoveHorizontally:

.scope

    HorzAccelerate:
        lda HorzCntrLinear
        clc
        adc SamusHorzAccel
        sta HorzCntrLinear
        tax

        lda #$00
        bit SamusHorzAccel
        bpl +
            lda #$FF
    *   adc ObjHorzSpeed
        sta ObjHorzSpeed

        bpl _moving_right

    _moving_left: 
        lda #$00
        sec
        sbc SamusHorzSpdMax
        tax

        lda #$FE
        tay

        cpx HorzCntrLinear
        sbc ObjHorzSpeed

        bcc _done
            stx HorzCntrLinear
            sty ObjHorzSpeed
            jmp _done

    _moving_right:
        cpx SamusHorzSpdMax
        sbc #$01                ; A is still ObjHorzSpeed from the adc above
        bcc _done
            lda SamusHorzSpdMax
            sta HorzCntrLinear
            lda #$01
            sta ObjHorzSpeed

    _done:
        lda HorzCntrNonLinr
        clc
        adc HorzCntrLinear
        sta HorzCntrNonLinr

        lda #$00
        adc ObjHorzSpeed
        sta $00

.scend

LE31D:  lda ObjectX         ;
LE320:  sec             ;Calculate Samus' x position on screen.
LE321:  sbc ScrollX         ;
LE323:  sta SamusScrX           ;Save Samus' x position.
LE325:  lda $00             ;Load Samus' current horizontal speed.
LE327:  bpl LE347             ;Branch if moving right.

;Samus is moving left.
        eor #$FF
        clc
        adc #$01                ; Carry always set ehre
LE32C:  ldy SamusInLava         ;Is Samus in lava?
LE32E:  beq LE333               ;If not, branch,
LE330:  lsr             ;else cut horizontal speed in half.
LE331:  beq Exit10          ;Branch to exit if Samus not going to move this frame.

LE333:* sta ObjectCounter       ;Store number of pixels to move Samus this frame.
LE335:* jsr MoveSamusLeft       ;($E626)Attempt to move Samus 1 pixel to the left.
LE338:  jsr CheckStopHorzMvmt       ;($E365)Check if horizontal movement needs to be stopped.
LE33B:  dec ObjectCounter       ;1 pixel movement is complete.
LE33D:  bne LE335               ;Branch if Samus needs to be moved another pixel.

LE33F:  lda SamusDoorData       ;Has Samus entered a door?
LE341:  beq Exit10          ;If not, branch to exit.
LE343:  lda #$01            ;Door leads to the left.
LE345:  bne LE362            ;Branch always.

;Samus is moving right.
LE347:* beq Exit10          ;Branch to exit if Samus not moving horizontally.
LE349:  ldy SamusInLava         ;Is Samus in lava?
LE34B:  beq LE350               ;If not, branch,
LE34D:  lsr             ;else cut horizontal speed in half.
LE34E:  beq Exit10          ;Branch to exit if Samus not going to move this frame.

LE350:* sta ObjectCounter       ;Store number of pixels to move Samus this frame.

.scope
MoveSamusRight:
    lda ObjectX
    clc
    adc ObjRadX
    and #$07
    bne +          ; only call crash detection every 8th pixel
;CheckMoveRight:
    sec
    sbc ObjRadX
    jsr CheckMoveRightLeftSharedPart

    bcc ResetDoorData       ; branch if yes! (CF = 0)
*   jsr SamusOnElevatorOrEnemy
    lda SamusHit
    and #$41
    cmp #$40
    ;clc
    beq ResetDoorData
    lda SamusScrX
    cmp #$8F    ; reached right scroll limit?
    bcc +      ; branch if not
    jsr ScrollRight
    bcc ++
*   inc SamusScrX
*   inc ObjectX      ; go right, Samus!
    bne +
    lda ScrollDir
    and #$02
    beq +
    jsr ToggleSamusHi       ; toggle 9th bit of Samus' X coord
*   sec
.scend

LE355:  jsr CheckStopHorzMvmt       ;($E365)Check if horizontal movement needs to be stopped.
LE358:  dec ObjectCounter       ;1 pixel movement is complete.
LE35A:  bne MoveSamusRight      ;Branch if Samus needs to be moved another pixel.

LE35C:  lda SamusDoorData       ;Has Samus entered a door?
LE35E:  beq Exit10          ;If not, branch to exit.
LE360:  lda #$00            ;
LE362:* sta SamusDoorDir        ;Door leads to the right.

Exit10:
LE364:  rts             ;Exit for routines above and below.

ResetDoorData:
    lda #$00
    sta SamusDoorData
    rts

CheckStopHorzMvmt:
LE365:  bcs Exit10          ;Samus moved successfully. Branch to exit.
LE367:  lda #$01            ;Load counter with #$01 so this function will not be
LE369:  sta ObjectCounter       ;called again.
LE36C:  lda SamusGravity        ;Is Samus on the ground?
LE36E:  bne Exit10          ;If not, branch to exit.
LE370:  lda SamusObjAction           ;
LE373:  cmp #sa_Roll            ;Is Samus rolled into a ball?
LE375:  beq Exit10          ;If so, branch to exit.
LE377:  jmp StopHorzMovement        ;($CF55)Stop horizontal movement or play walk SFX if stopped.

;-------------------------------------[ Samus vertical acceleration ]--------------------------------

;The following code accelerates/decelerates Samus vertically.  There are 4 possible values for
;gravity used in the acceleration calculation. The higher the number, the more intense the gravity.
;The possible values for gravity are as follows:
;#$38-When Samus has been hit by an enemy.
;#$1A-When Samus is falling.
;#$18-Jump without high jump boots.
;#$12-Jump with high jump boots.

VertAccelerate:
LE37A:  lda SamusGravity        ;Is Samus rising or falling?
LE37D:  bne ++              ;Branch if yes.
LE37F:  lda #$80           ;
LE381:  sta SamusHorzSpdMax       ;Set Samus maximum running speed.
LE384:  lda ObjectY         ;
LE387:  clc             ;
LE388:  adc ObjRadY         ;Check is Samus is obstructed downwards on y room
LE38B:  and #$07            ;positions divisible by 8(every 8th pixel).
LE38D:  bne +               ;
LE38F:  jsr CheckMoveDown       ;($E7AD)Is Samus obstructed downwards?
LE392:  bcc ++              ;Branch if yes.
LE394:* jsr SamusOnElevatorOrEnemy  ;($D976)Calculate if Samus standing on elevator or enemy.
LE397:  lda SamusOnElevator     ;Is Samus on an elevator?
LE39A:  bne +               ;Branch if yes.
LE39C:  lda OnFrozenEnemy       ;Is Samus standing on a frozen enemy?
LE39E:  bne +               ;Branch if yes.
LE3A0:  lda #$1A            ;Samus is falling. Store falling gravity value.
LE3A2:  sta SamusGravity        ;

LE3A5:* ldx #$05            ;Load X with maximum downward speed.
LE3A7:  lda VertCntrLinear      ;
LE3AA:  clc             ;The higher the gravity, the faster this addition overflows
LE3AB:  adc SamusGravity        ;and the faster ObjVertSpeed is incremented.
LE3AE:  sta VertCntrLinear      ;
LE3B1:  lda ObjVertSpeed        ;Every time above addition sets carry bit, ObjVertSpeed is
LE3B4:  adc #$00            ;incremented. This has the effect of speeding up a fall
LE3B6:  sta ObjVertSpeed        ;and slowing down a jump.
LE3B9:  bpl +               ;Branch if Samus is moving downwards.

;Check if maximum upward speed has been exceeded. If so, prepare to set maximum speed.
LE3BB:  lda #$00            ;
LE3BD:  cmp VertCntrLinear      ;Sets carry bit.
LE3C0:  sbc ObjVertSpeed        ;Subtract ObjVertSpeed to see if maximum speed has
LE3C3:  cmp #$06            ;been exceeded.
LE3C5:  ldx #$FA            ;Load X with maximum upward speed.
LE3C7:  bne ++              ;Branch always.

;Check if maximum downward speed has been reached. If so, prepare to set maximum speed.
LE3C9:* cmp #$05            ;Has maximum downward speed been reached?
LE3CB:* bcc +               ;If not, branch.

;Max verticle speed reached or exceeded. Adjust Samus verticle speed to max.
LE3CD:  jsr StopVertMovement        ;($D147)Clear verticle movement data.
LE3D0:  stx ObjVertSpeed        ;Set Samus vertical speed to max.

;This portion of the function creates an exponential increase/decrease in verticle speed. This is the
;part of the function that does all the work to make Samus' jump seem natural.
LE3D3:* lda VertCntrNonLinr       ;
LE3D6:  clc             ;This function adds itself plus the linear verticle counter
LE3D7:  adc VertCntrLinear      ;onto itself every frame.  This causes the non-linear
LE3DA:  sta VertCntrNonLinr       ;counter to increase exponentially.  This function will
LE3DD:  lda #$00            ;cause Samus to reach maximum speed first in most
LE3DF:  adc ObjVertSpeed        ;situations before the linear counter.
LE3E2:  sta $00             ;$00 stores temp copy of current verticle speed.
LE3E4:  rts             ;

;----------------------------------------------------------------------------------------------------

;Attempt to move Samus one pixel up.

MoveSamusUp:
LE457:
    lda ObjectY         ;Get Samus' y position in room.
    sec             ;
    sbc ObjRadY         ;Subtract Samus' vertical radius.
LE45E:  anc #$07            ;Check if result is a multiple of 8. If so, branch to
LE460:  bne +               ;Only call crash detection every 8th pixel.
LE462:
;CheckMoveUp:
    lda ObjRadY
    adc #$08
    jsr CheckMoveUpDownSharedPart

    bcc MoveSamusUpExit     ;If so, branch to exit(can't move any further).
*   lda SamusObjAction           ;
    cmp #sa_Elevator        ;Is Samus riding elevator?
    beq +               ;If so, branch.
        jsr SamusOnElevatorOrEnemy  ;($D976)Calculate if Samus standing on elevator or enemy.
        lda SamusHit
        and #$42
        cmp #$42
        clc
        beq MoveSamusUpExit

*   lda SamusScrY
    cmp #$66    ; reached up scroll limit?
    bcs +      ; branch if not
        jsr ScrollUp
    bcc ++
*   dec SamusScrY
*   lda ObjectY
    bne ++
    lda ScrollDir
    and #$02
    bne +
    jsr ToggleSamusHi       ; toggle 9th bit of Samus' Y coord
*   lda #240
    sta ObjectY
*   dec ObjectY
    inc SamusJmpDsplcmnt
    sec
MoveSamusUpExit:
*   rts

; attempt to move Samus one pixel down

MoveSamusDown:
    lda ObjectY
    clc
    adc ObjRadY
    and #$07
    bne +                   ; only call crash detection every 8th pixel
    jsr CheckMoveDown       ; check if Samus obstructed DOWNWARDS
    bcc Exit104             ; exit if yes
*   lda SamusObjAction
    cmp #sa_Elevator        ; is Samus in elevator?
    beq +
    jsr SamusOnElevatorOrEnemy
    lda SamusOnElevator
    clc
    bne Exit104
    lda OnFrozenEnemy
    bne Exit104
*   lda SamusScrY
    cmp #$84    ; reached down scroll limit?
    bcc +      ; branch if not
    jsr ScrollDown
    bcc ++
*   inc SamusScrY
*   lda ObjectY
    cmp #239
    bne ++
    lda ScrollDir
    and #$02
    bne +
    jsr ToggleSamusHi       ; toggle 9th bit of Samus' Y coord
*   lda #$FF
    sta ObjectY
*   inc ObjectY
    dec SamusJmpDsplcmnt
    sec
Exit104:
*   rts

; Attempt to scroll UP

ScrollUp:
    lda ScrollDir
    beq +
    cmp #$01
    bne ++++
    dec ScrollDir
    lda ScrollY
    beq +
    dec MapPosY
*   ldx ScrollY
    bne +
    dec MapPosY                     ; decrement MapY
    lda #$00
    sta Quarter
    jsr GetRoomNum                  ; put room # at current map pos in $5A
    bcs ++                          ; if function returns CF = 1, moving up is not possible
    jsr SwitchToOppositeNameTable
    ldx #240    ; new Y coord
*   dex
    cpx #MidScreenVertical + 20          ; Load just a bit before you reach the half way point vertically
    bne SkipScrollUpMidwayMap
        lda #$02
        sta Quarter
        jsr GetRoomNum
    SkipScrollUpMidwayMap:
    jmp LE53F

*   inc MapPosY
*   sec
    rts

; Attempt to scroll DOWN

ScrollDown:
    ldx ScrollDir
    dex
    beq +
    bpl +++++
    inc ScrollDir
    lda ScrollY
    beq +
    inc MapPosY
*   lda ScrollY
    bne +
    inc MapPosY     ; increment MapY
    ;lda #$00       ; A == 0 here
    sta Quarter
    jsr GetRoomNum  ; put room # at current map pos in $5A
    bcs +++   ; if function returns CF = 1, moving down is not possible
*   ldx ScrollY
    cpx #MidScreenVertical - 1
    bne SkipScrollDownMidwayMap
        lda #$02
        sta Quarter
        jsr GetRoomNum
    SkipScrollDownMidwayMap:
    cpx #239
    bne +
    jsr SwitchToOppositeNameTable
    ldx #$FF
*   inx
LE53F:
    stx ScrollY
    jsr CheckForRoomUpdate       ; check if it's time to update Name Table
    clc
    rts

*   dec MapPosY
*   sec
Exit_35:
*   rts

; Entry point for roomload / loadroom / load room / room loading?
CheckForRoomUpdate:
    jsr SetupRoom
    ldx RoomNumber
    inx
    bne Exit_35
    lax ScrollDir
    and #$02
    ;bne CheckRoomUpdate_HorizontalScroll
    beq CheckRoomUpdate_VerticalScroll

; Check if it's time to update nametable (when scrolling is HORIZONTAL)
CheckRoomUpdate_HorizontalScroll:
    lda ScrollX
    and #$07                ; keep lower 3 bits
    cmp TileBlastAnim-1,x   ; compare value = 0 if ScrollDir = right, else 7
                            ; Using TileBlastAnim because it has [$07, $00] in there
                            ; It's a bit a hack.
    bne Exit_35             ; exit if not equal (no nametable update)

LE70C:
    ldx ScrollDir
    cpx TempScrollDir
    bne Exit_35
    lda ScrollX
    lsr         ; keep upper five bits
    lsr 
    lsr         ; / 8 (make 'em lower five)
    sta $00
    lda #$00
    beq LE590   ; branch always

;----------------------------------------------------------------------------------------------------

; check if it's time to update nametable (when scrolling is VERTICAL)

CheckRoomUpdate_VerticalScroll:
    lda ScrollY
    and #$07    ; compare value = 0 if ScrollDir = down, else 7
    cmp TileBlastAnim+1,x   ; This is a hack because all we need is [$07, $00] 
                            ; and that just happens to exist in the TileBlastAnim table
    bne Exit_35             ; exit if not equal (no nametable update)

LE57C:
    ldx ScrollDir           ;
    cpx TempScrollDir       ;Still scrolling same direction when room was loaded?
    bne Exit_35              ;If not, branch to exit.

    lda ScrollY
    and #$F8                ; keep upper 5 bits
    sta $00
    lda #$00
    asl $00
    rol
    asl $00
    rol

LE590:
    sta $01                 ; $0001 = (ScrollY & 0xF8) << 2 = row offset

.scope
    lda PPUCNT0ZP           ;
    eor ScrollDir           ;Store #$01 if object should be loaded onto name table 3,
    and #$01                ;store #$00 if it should be loaded onto name table 0.LE569;
    beq _loadNameAddrs0

    _loadNameAddrs3:
        lda #$2C            ;High byte of nametable #3(PPU)
        ldx #$64            ;High byte of RoomRAMB(cart RAM)
        bne _afterLoad      ;
    _loadNameAddrs0:
        lda #$20            ;High byte of nametable #0(PPU).
        ldx #$60            ;High byte of RoomRAMA(cart RAM)
    _afterLoad:

    sta PPUDataPending      ; data pending = YES Anything non-zero works here.

    ora $01
    sta $03
    txa
    ora $01
    sta $01

    ldx PPUStrIndex
    lda $03
    sta PPUDataString, x

    lda $00
    sta PPUDataString + 1, x

    txa 
    sbx #$FD    ; Add 3 to X

    ldy ScrollDir                   ; Bit1 = 0 if vertical scrolling, Bit1 = 1 if horizontal
    lda PPUWriteDirectionTable,y    ; A = 0 if vertical scrolling, 1 if horizontal
    sta PPUDataString - 1,x

    ldy #$00

    and #$80                            ; ... if bit 7 (PPU inc) of $04 clear                     
    bne _hoizontal_ppu_loop_setup

_vertical_ppu_loop:
    lda ($00),y
    sta PPUDataString, x
    iny

    lda ($00),y
    sta PPUDataString+1, x
    iny

    lda ($00),y
    sta PPUDataString+2, x
    iny

    lda ($00),y
    sta PPUDataString+3, x
    iny

    txa
    sbx #$FC 

    cpy #$20
    bne _vertical_ppu_loop
    beq _loop_end      ;always branch

_inc_01_clear_and_jump_back:
    clc
    inc $01
    bne _after_hoizontal_ppu_loop_inc

_hoizontal_ppu_loop_setup:
    clc
    lda #$0F
    sta $05
_hoizontal_ppu_loop:
*   lda ($00),y
    sta PPUDataString, x
    inx
    tya      
    adc #$20 
    tay      

    lda ($00),y
    sta PPUDataString, x
    inx
    tya                             
    adc #$20                        
    tay                          

    bcs _inc_01_clear_and_jump_back     ;Increment $01(upper address byte) if carry
_after_hoizontal_ppu_loop_inc:
    dec $05
    bne _hoizontal_ppu_loop

_loop_end:
    stx PPUStrIndex
    lda #$00           
    sta PPUDataString,x
    rts

.scend
;----------------------------------------------------------------------------------------------------

; attempt to move Samus one pixel left

MoveSamusLeft:
.scope
LE626:
    lda ObjectX
    sec
    sbc ObjRadX
    anc #$07
    bne +          ; only call crash detection every 8th pixel

;CheckMoveLeft:
    ;ldx #$00
    lda ObjRadX
    ;clc
    adc #$08
    jsr CheckMoveRightLeftSharedPart
    bcc ResetDoorDataCopy    ; branch if yes! (CF = 0)

*   jsr SamusOnElevatorOrEnemy
    lda SamusHit
    and #$41
    cmp #$41
    clc
    beq ResetDoorDataCopy
    lda SamusScrX
    cmp #$71    ; reached left scroll limit?
    bcs +      ; branch if not
    jsr ScrollLeft
    bcc ++
*   dec SamusScrX
*   lda ObjectX
    bne +
    lda ScrollDir
    and #$02
    beq +
    jsr ToggleSamusHi       ; toggle 9th bit of Samus' X coord
*   dec ObjectX
    sec
    rts

ResetDoorDataCopy:
    lda #$00
    sta SamusDoorData
    rts
.scend

; crash with object on the left

; Attempt to scroll LEFT

ScrollLeft:
    lda ScrollDir
    cmp #$02
    beq +
    cmp #$03
    bne ++++
    dec ScrollDir
    lda ScrollX
    beq +
    dec MapPosX
*   lda ScrollX
    bne +
    dec MapPosX     ; decrement MapX
    lda #$00
    sta Quarter
    jsr GetRoomNum  ; put room # at current map pos in $5A
    bcs ++  ; if function returns CF=1, scrolling left is not possible
    jsr SwitchToOppositeNameTable
*   dec ScrollX
    cmp #MidScreenHorizontal - 1      ; Not sure why +4 and not +1. Assembly is hard.
    bne SkipScrollLeftMidwayMap
        lda #$02
        sta Quarter
        jsr GetRoomNum
    SkipScrollLeftMidwayMap:
    jsr CheckForRoomUpdate       ; check if it's time to update Name Table
    clc
    rts

*   inc MapPosX
*   sec
    rts

; Attempt to scroll RIGHT

ScrollRight:
    lda ScrollDir
    cmp #$03
    beq +
    cmp #$02
    bne +++++
    inc ScrollDir
    lda ScrollX
    beq +
    inc MapPosX
*   lda ScrollX
    bne +
    inc MapPosX
    ;lda #$00   ; A == 0 here
    sta Quarter
    jsr GetRoomNum  ; put room # at current map pos in $5A
    bcs +++   ; if function returns CF=1, scrolling right is not possible
*   cmp #MidScreenHorizontal - 1
    bne SkipScrollRightMidwayMap
        lda #$02
        sta Quarter
        jsr GetRoomNum
SkipScrollRightMidwayMap:
    inc ScrollX
    bne +
    jsr SwitchToOppositeNameTable
*   jsr CheckForRoomUpdate      ; check if it's time to update Name Table
    clc
    rts

*   dec MapPosX
*   sec
ScrollRightExit:
*   rts

;---------------------------------------[ Get room number ]-------------------------------------------

;Gets room number at current map position. Sets carry flag if room # at map position is FF.
;If valid room number, the room number is stored in $5A.

GetRoomNum:
LE720:  lda ScrollDir           ;
LE722:  lsr             ;Branch if scrolling vertical.
LE723:  beq +               ;

LE725:  rol             ;Restore value of a
LE726:  adc #$FF            ;A=#$01 if scrolling left, A=#$02 if scrolling right.
LE728:  pha             ;Save A.
OnNameTable0:
LEC93:  lda PPUCNT0ZP       ;
        eor #$01            ;If currently on name table 0,
        and #$01            ;return #$01. Else return #$00.
        tay                 ;
LE72C:  pla                 ;Restore A.
LE72D:  and $6C,y           ;
LE730:  sec                 ;
LE731:  bne +++++           ;Can't load room, a door is in the way. This has the
                            ;effect of stopping the scrolling until Samus walks
                            ;through the door(horizontal scrolling only).

LE733:* lda MapPosY         ;Map pos y.
        ;lda Mul16Table,y   Mul16
        asl
        asl
        asl
        asl
LE738:  sta $00             ;Store multiplied value in $00.
LE73A:  lda #$00            ;
LE73C:  rol                 ;Save carry, if any.
LE73D:  rol $00             ;Multiply value in $00 by 2.
LE73F:  rol                 ;Save carry, if any.
LE740:  sta $01             ;
LE742:  lda $00             ;
LE744:  adc MapPosX         ;Add map pos X to A.
LE746:  sta $00             ;Store result.
LE748:  lda $01             ;
LE74A:  adc #$70            ;Add #$7000 to result.
LE74C:  sta $01             ;$0000 = (MapY*32)+MapX+#$7000.
LE74E:  ldy #$00            ;
LE750:  lda ($00),y         ;Load room number.
LE752:  cmp #$FF            ;Is it unused?
LE754:  beq ++++            ;If so, branch to exit with carry flag set.

LE756:  sta RoomNumber          ;Store room number.

LE758:* cmp $95D0,y         ;Is it a special room?
LE75B:  beq +               ;If so, branch to set flag to play item room music.
LE75D:  iny             ;
LE75E:  cpy #$07            ;
LE760:  bne -               ;Loop until all special room numbers are checked.

LE762:  lda ItemRmMusicSts     ;Load item room music status.
LE764:  beq ++              ;Branch if not in special room.
LE766:  lda #$80            ;Ptop playing item room music after next music start.
LE768:  bne ++              ;Branch always.

LE76A:* lda #$01            ;Start item room music on next music start.
LE76C:* sta ItemRmMusicSts     ;
LE76E:  clc             ;Clear carry flag. was able to get room number.
LE76F:* rts             ;

;-----------------------------------------------------------------------------------------------------

GrowRadiusY:
    ;ldx PageIndex
    lda EnRadY,x
    clc
    adc #$08
    jmp LE783

ShrinkRadiusY:
    ;ldx PageIndex
    lda #$00
    sec
    sbc EnRadY,x
LE783:
    sta $02

    lda #$08
    sta $04

    jsr GetXEnemyRoomPosition_09_08_0B
    lda EnRadX,x
    jmp LE7BD

GetXEnemyRoomPosition_09_08_0B:
    lda EnXRoomPos,x
    sta $09     ; X coord
    lda EnYRoomPos,x
    sta $08     ; Y coord
    lda EnNameTable,x
    sta $0B     ; hi coord
    rts

CheckMoveDown:
    ;lda #$00   ; A == 0 here
    sec
    sbc ObjRadY

CheckMoveUpDownSharedPart:
    sta $02
    
    lda ObjectHi
    sta $0B

    lda ObjectY
    sta $08

    lda ObjectX
    sta $09

    lda ObjRadX

LE7BD:
    bne +
SEC_RTS:
    sec
    rts

*   sta $03
    tay
    ldx #$00
    lda $09
    sec
    sbc $03
    anc #$07
    beq +
    inx
*   jsr LE8CE
    sta $04
    jsr LE90F
    ldx #$00
    ldy #$08
    lda $00
LE7DE:  
    bne SEC_RTS
    stx $06
    sty $07
    ldx $04

; object<background crash detection
LE7E6:
;    jsr MakeCartRAMPtr      ;($E96A)Find object position in room RAM.
    lda $0B   
    and #$01  
    ora #$18  
    sta $05

    lda $02   
    and #$F8
    asl 
    rol $05   
    asl 
    rol $05   
    sta $04
    
    lda $03   
    lsr 
    lsr 
    lsr 
    ora $04
    sta $04   

    ldy #$00
    lda ($04),y     ; get tile value
    cmp #$4E
    beq LE81E
    jsr $95C0       ; Tourian Only
    
.scope

    ldy InArea
    cpy #$10
    beq _compare_hex_80
    cmp #$70
    bcs _end
    _compare_hex_80:
        cmp #$80
    _end:

.scend

    bcc Exit16      ; CF = 0 if tile # < $80 (solid tile)... CRASH!!!
    cmp #$A0    ; is tile >= A0h? (walkable tile)
    bcs IsWalkableTile
    jmp IsBlastTile  ; tile is $80-$9F (blastable tiles)

IsWalkableTile:
    ldy IsSamus
    beq ++
    ; special case for Samus
    dey      ; = 0
    sty SamusDoorData
    cmp #$A0    ; crash with tile #$A0? (scroll toggling door)
    beq +
    cmp #$A1    ; crash with tile #$A1? (horizontal scrolling door)
    bne ++
    inc SamusDoorData
*   inc SamusDoorData
*   dex
    beq +
    jsr LE98E
    jmp LE7E6

*   sec      ; no crash
    Exit16:
    rts

;HCSS
; Only every other byte is used
ASL_ASL_ASL_ORA_80_Table:
.byte $80, $FF, $90, $FF, $A0, $FF, $B0

LE81E:
    ldx UpdtngPrjctl
    beq ClcExit
    ldx #$06
LE81E_Loop:
*   lda $05
    eor $5D,x
    and #$04
    bne LE81E_Next
    lda $04
    eor $5C,x
    and #$1F
    bne LE81E_Next
    ldy ASL_ASL_ASL_ORA_80_Table, x
    lda ObjAction,y
    beq LE81E_Next
    lda $0307,y
    lsr
    bcs ++
    ldx PageIndex
    lda ObjAction,x
    eor #$0B
    beq +
    lda ObjAction,x
    eor #$04
    bne SFXMetal
    lda AnimResetIndex,x
    eor #$91
    bne SFXMetal
*   lda TriangleSFXFlag
    ora #$02
    sta TriangleSFXFlag
*   lda #$04
    sta $030A,y
    bne ClcExit

LE81E_Next:
*   dex
    dex
    bpl LE81E_Loop

    lda $04
    lsr
    lsr
    asr #$03
    tax
    inc $0366,x

ClcExit:
    clc
    rts

SFXMetal:
    lda #SFX_METAL
    ora SQ1SFXFlag
    sta SQ1SFXFlag
    rts

CheckMoveRightLeftSharedPart:
    sta $03

    lda ObjectHi
    sta $0B

    lda ObjectY
    sta $08

    lda ObjectX
    sta $09

    ldy ObjRadY

LE89B:  
    bne +
    sec
    rts

*   sty $02
    ldx #$00
    lda $08
    sec
    sbc $02
    anc #$07
    beq +
    inx
*   jsr LE8CE
    sta $04

    jsr LE90F
    ldx #$08
    ldy #$00
    lda $01
    jmp LE7DE
    ; safe

LE8CE:
    eor #$FF
    ;clc
    adc #$01
    and #$07
    sta $04

    tya
    asl
    sec
    sbc $04

    bcs +
    adc #$08
*   tay
    lsr
    lsr
    lsr
    sta $04
    tya
    anc #$07
    beq +
    inx
*   txa
    ; HCSS show how ANC works
    ;clc
    adc $04
    rts

; TODO: Move into Game_Start_Common
GrowRadiusX:
LE8F1:
    ;ldx PageIndex
    lda EnRadX,x
    clc
    adc #$08
    jmp LE904

; TODO: Move into Game_Start_Common
ShrinkRadiusX:
LE8FC:
    ;ldx PageIndex
    lda #$00
    sec
    sbc EnRadX,x
LE904:
    sta $03
    jsr GetXEnemyRoomPosition_09_08_0B
    ldy EnRadY,x
    jmp LE89B

LE90F:

    lda $02
    bpl ++

    lda $08
    sec
    sbc $02
    tax
    and #$07
    sta $00

    bcs +
    cpx #$F0
    bcc +++
*   txa 
    adc #$0F
    jmp LE934

*   lda $08
    sec
    sbc $02
    tax
    and #$07
    sta $00

    bcs +
    txa
    sbc #$0F

LE934:
    tax
    lda ScrollDir
    and #$02
    bne +
    inc $0B
*   stx $02
    ldx #$00
    lda $03
    bmi +
    dex
*   lda $09
    sec
    sbc $03
    sta $03
    and #$07
    sta $01
    txa
    adc #$00
    beq +
    lda ScrollDir
    and #$02
    beq +
    inc $0B
*   rts

;-------------------------------------[ Get object coordinates ]------------------------------------

GetObjCoords:
LD79F:  ldy PageIndex           ;Load index into object RAM to find proper object.
;LD7A1:  lda ObjectY,y           ;
;LD7A4:  sta $02             ;Load and save temp copy of object y coord.
;LD7A6:  lda ObjectX,y           ;
;LD7A9:  sta $03             ;Load and save temp copy of object x coord.
;LD7AB:  lda ObjectHi,y          ;
;LD7AE:  sta $0B             ;Load and save temp copy of object nametable.

; HCSS
;MakeCartRAMPtr:
    lda ObjectHi,y  ; ObjectHi
    and #$01        ; isolate the one bit we need
    ora #$18        ; fold in the base constant (no overlap w/ bit 0)
    sta $05         ; preset hi-byte accumulator = $18 | H

    lda ObjectY,y   ; Y
    and #$F8
    asl 
    rol $05         ; Y7 and H both migrate into place here
    asl 
    rol $05         ; ...and here — $05 is now the FINAL hi byte
    sta $04         ; stash Y-derived low-byte bits

    lda ObjectX,y   ; X
    lsr 
    lsr 
    lsr 
    ora $04
    sta $04         ; $04 = final lo byte

    rts

;---------------------------------------------------------------------------------------------------

; TODO: Easy - Inline 
LE98E:
    lda $02
    clc
    adc $06
    sta $02
    cmp #$F0
    bcc +
    adc #$0F
    sta $02
    lda ScrollDir
    anc #$02
    bne +
    inc $0B
*   lda $03
    ;clc
    adc $07
    sta $03
    bcc +
    lda ScrollDir
    and #$02
    beq +
    inc $0B
*   rts

SwitchToOppositeNameTable: 
    lda PPUCNT0ZP
    eor #$03
    sta PPUCNT0ZP
    rts

IsBlastTile:
    ldy UpdtngPrjctl
    beq Exit18
LE9C2:
    tay
    lda CurrentBank
    cmp #TourianBank
    bne LE9C2_Skip
        jsr Bank03_LA0C6       ; Tourian Only
    LE9C2_Skip:
    cpy #$98
    bcs +++++
; attempt to find a vacant tile slot
    ldx #$C0

    .scope
    _loop:   
    *   lda TileRoutine,x
        beq +      ; 0 = free slot
        txa
        sbx #$10
        bne _loop
    .scend

    lda TileRoutine,x
    bne ++++     ; no more slots, can't blast tile
*   inc TileRoutine,x
    lda $04
    and #$DE
    sta TileWRAMLo,x
    lda $05
    sta TileWRAMHi,x
    lda InArea
    cmp #$11
    bne +
    cpy #$76
    bne +
    lda #$04
    bne ++
*   tya
    clc
    adc #$10
    asr #$3C
*   lsr
    sta TileType,x
*   clc
Exit18: rts

;---------------------------------[ Write PPU attribute table data ]----------------------------------

; ==== ALERT TODO BUG WARNING ERROR PROBLEM ISSUE =====
; THE COLOR GITCH IS HERE SOMEWHERE.

; 510 Cycles
; 5 Scanlines

WritePPUAttribTbl:
LE5E2:  ldx #$C0            ;Low byte of First row of attribute table.
        ror
        bcs +
LE5EA:  ldx #$E0            ;Low byte of second row of attribute table.
LE5EC:* stx $00             ;$0000=RoomRAM atrrib table starting address.

LE5FE:  stx PPUDataPending  ;Data pending = YES. Anything other than zero is good here

; GetNameAddrs:
.scope
    lda PPUCNT0ZP
    eor ScrollDir
    and #$01
    beq _loadNameAddrs0
_loadNameAddrs3:
    lda #$2F                 ;High byte of nametable #3(PPU)
    ldy #$67                 ;High byte of RoomRAMB(cart RAM)
    bne _afterload           ;Always branch
_loadNameAddrs0:
    lda #$23                 ;High byte of nametable #0(PPU).
    ldy #$63                 ;High byte of RoomRAMA(cart RAM)
_afterload:
    sty $01                  ;#$63 for RoomRAMA, #$67 for RoomRAMB(Attrib tables).

.scend

LE600:  ldx PPUStrIndex             ;Load current index into PPU strng to append data.
LE603:  sta PPUDataString, x        ;Store high byte of starting address(attrib table).
LE608:  lda $00                     ;Store low byte of starting address(attrib table).
        sta PPUDataString + 1, x
LE60D:  lda #$20                    ;Length of data to write(1 row of attrib data).
        sta PPUDataString + 2, x
        txa
        sbx #$FD                    ;Add 3 to X
        ldy #$00                    ;Reset index into data string.

WritePPUAttribTblLoop:
    lda ($00),y                 ;Get data byte.
    sta PPUDataString,x         ;Store data byte at end of PPUDataString.
    iny

    lda ($00),y        
    sta PPUDataString+1,x
    iny

    lda ($00),y        
    sta PPUDataString+2,x
    iny

    lda ($00),y        
    sta PPUDataString+3,x
    iny

    lda ($00),y        
    sta PPUDataString+4,x
    iny

    lda ($00),y        
    sta PPUDataString+5,x
    iny

    lda ($00),y        
    sta PPUDataString+6,x
    iny

    lda ($00),y        
    sta PPUDataString+7,x
    iny

    txa
    sbx #$F8
    
    ; PPU guardrails
    cpx #PPUMaxSize             ;PPU byte writer can only write a maximum of #$6F bytes
    bcs PPUAttribTblIsFull      ;If PPU string not full, branch to get more data.

    cpy #$20                    
    bne WritePPUAttribTblLoop   ;Loop until all attrib data loaded into PPU.

    stx PPUStrIndex             ;Store updated PPU string index.

PPUAttribTblIsFull:
    ldx PPUStrIndex         ;
    lda #$00                ;If PPU string is already full, or all PPU bytes loaded,
    sta PPUDataString,x     ;add #$00 as last byte to the PPU byte string.
    rts                     ;PPU writing routines.

;------------------------------------[ write attribute table data ]----------------------------------

WritePPUAttribTbl_Trampoline:
    jmp WritePPUAttribTbl

AttribTableWrite:
    cmp #$F4
    beq RoomFinished
    inc RoomNumber          ;to load from RoomRAM into PPU.
    ror
    bcs WritePPUAttribTbl_Trampoline
    rts

; Replaced this jump table
; 
; LEA1c:  .word ExitSub               ;($C45C)Rts.
; LEA1E:  .word WritePPUAttribTbl     ;($E5E2)Write first row of PPU attrib data.
; LEA20:  .word ExitSub               ;($C45C)Rts.
; LEA22:  .word WritePPUAttribTbl     ;($E5E2)Write second row of PPU attrib data.
; LEA24:  .word RoomFinished          ;($EA26)Finished writing attribute table data.

;-----------------------------------[ Finished writing room data ]-----------------------------------

RoomFinished:
LEA26:  lda #$FF            ;No more tasks to perform on current room.
LEA28:  sta RoomNumber      ;Set RoomNumber to #$FF.
RoomFinishedExit:
LEA2A:  rts                 ;

;------------------------------------------[ Setup room ]--------------------------------------------
;
; Scroll Dirs: 00=Up, 01=Down, 10=Left, 11=Right.
;
;              First Half | Second Half       
;      =================================
;          up    [2, 3]   |   [0, 1]
;        down    [0, 1]   |   [2, 3]
;        left    [1, 3]   |   [0, 2]
;       right    [0, 2]   |   [1, 3]       
;
;                   down         
;                  +--+--+       
;                  |1 |3 |       
;           right  +--+--+  left 
;                  |5 |7 |       
;                  +--+--+
;                    up
;
; TODO: 
; - For fewer bytes and ease of implementation, enemy / door placement should be handled only after the 2nd quarter
; - (HUGE) make all rooms use the quad structure
;   - Currently only brinstar (Bank 01) is refactored to use this

; These tables are all quarter*2 so I don't need to ASL when using the values
ScrollDir_Quarter_Tbls:
ScrollDir_To_1st_Quarter_Tbl:
    .byte $05, $01, $03, $01
ScrollDir_To_2nd_Quarter_Tbl:
    .byte $07, $03, $07, $05
ScrollDir_To_3rd_Quarter_Tbl:
    .byte $01, $05, $01, $03
ScrollDir_To_4th_Quarter_Tbl:
    .byte $03, $07, $05, $07

.scope

.alias _originalRoomPtr         $DA
.alias _originalRoomPtr_Lo      $DA
.alias _originalRoomPtr_Hi      $DB

SetupRoom:
LEA2B:  lda RoomNumber              ;Room number.
LEA2D:  cmp #$FF
        beq RoomFinishedExit

LEA35:  cmp #$F0                    
LEA37:  bcs AttribTableWrite        ;Branch if time to write PPU attribute table data.

; Only do this stuff if we are drawing the first quarter
lda Quarter
bne SetupFromRoomStart
    jsr UpdateRoomSpriteInfo 
    jsr ScanForItems 

SetupFromRoomStart:                 ; start_counting_stuff_addr in BuildRoomAnalyzer.lua
LEA3F:  ldy RoomNumber              ;Room number to load.
        sty StableRoomNumber        
LEA43:  lda RoomPointerTable_Lo,y 
LEA45:  sta _originalRoomPtr_Lo   
LEA48:  lda RoomPointerTable_Hi,y 
LEA4A:  sta _originalRoomPtr_Hi   

SetRoomPalNibbles:
LEA4C:  ldy #$00                    ;
LEA4E:  lax (_originalRoomPtr),y    ; First byte of room data.
        lda Div16Table, x
        sta RoomPal_Hi_Nib
        txa
        and #$0F
        sta RoomPal_Lo_Nib          ;store initial palette # to fill attrib table with.

DrawHalfOrFullRoom:
    jsr DrawSingleRoomQuarter 
    lda MainRoutine                 ; Only draw all 4 quarters if we are loading into the room and not moving into it
    lsr                             ; MainRoutine == 1 is loading into a room, all movement based loads will be 3 here
    bne DrawSingleRoomQuarter 
        jsr DrawSingleRoomQuarter 
        jsr DrawSingleRoomQuarter 

DrawSingleRoomQuarter:
    ; Can use (_quarter << + ScrollDir) to treat ScrollDir_Quarter_Tbls as a double array
    lda Quarter 
    asl
    rol     ; this will set the carry bit to 0
    ;clc
    adc ScrollDir
    tax

    ldy ScrollDir_Quarter_Tbls, x
    cpy #$07
    bne +
        lda _originalRoomPtr_Lo
        adc #$06
        sta RoomPtrLB
        lda _originalRoomPtr_Hi
        adc #$00 
        bne ++                      ; always branch 
    * lda (_originalRoomPtr),y
    sta RoomPtrLB
    iny 
    lda (_originalRoomPtr),y
    * sta RoomPtrUB
    
.scend

;------------------------------------------[ Select room RAM ]---------------------------------------

SelectRoomRAM:
    lda PPUCNT0ZP       ;
    eor ScrollDir       ;Store #$01 if object should be loaded onto name table 3,
    and #$01            ;store #$00 if it should be loaded onto name table 0.
    asl                 ;
    asl                 ;
    ora #$60            ;A=#$64 for name table 3, A=#$60 for name table 0.
    sta CartRAMPtrUB    ;
;------------------------[ Initialize room RAM and associated attribute table ]-----------------------

lda Quarter
and #$01
bne End_Attr_Loop

InitTables:
    lda #GFXBank                ; Switch to Bank06
    jsr MMCWriteReg3 
    jsr DoRoomRamClear          ; Call this routine which exists only in Bank06
    lda CurrentBank             
    jsr MMCWriteReg3            ; Switch back to whatever bank we were on

.scope

.alias _AttrRepeatVal       $D4
.alias _AttrRepeatCount     $D5

lda MainRoutine
lsr
beq End_Attr_Loop

WriteRoomSpecificAttrPaletteData:
    ldx RoomNumber
    lda RoomAttrTbl_Lo,x
    sta CodePtr
    lda RoomAttrTbl_Hi,x
    sta CodePtr+1

    ldy #$00
    lda #$60
    cmp CartRAMPtrUB
    bne _attr_6700_loop

    _attr_6300_loop:
        lax (CodePtr),y        ; A=X=control byte
        beq End_Attr_Loop
        bmi _attr_6300_single  ; $C0-$FF -> old single-write mode

        ; --- repeat mode: control byte ($01-$7F) is a count ---
        sta _AttrRepeatCount
        iny
        lda (CodePtr),y        ; fill value
        sta _AttrRepeatVal
        iny
        _attr_6300_repeat:
            lax (CodePtr),y     ; next dest offset
            lda _AttrRepeatVal
            sta $6300,x
            iny
            dec _AttrRepeatCount
            bne _attr_6300_repeat
            beq _attr_6300_loop ; branch always

        _attr_6300_single:
            iny
            lda (CodePtr),y
            sta $6300,x
            iny
            bne _attr_6300_loop
            beq End_Attr_Loop   ; catches y wraparound edge case

    _attr_6700_loop:
        lax (CodePtr),y
        beq End_Attr_Loop
        bmi _attr_6700_single

        sta _AttrRepeatCount
        iny
        lda (CodePtr),y
        sta _AttrRepeatVal
        iny
        _attr_6700_repeat:
            lax (CodePtr),y
            lda _AttrRepeatVal
            sta $6700,x
            iny
            dec _AttrRepeatCount
            bne _attr_6700_repeat
            beq _attr_6700_loop

        _attr_6700_single:
            iny
            lda (CodePtr),y
            sta $6700,x
            iny
            bne _attr_6700_loop

    End_Attr_Loop:
        ldy #$00
        beq DrawRoom            ; Always branch
.scend
;---------------------------------------[ Draw room object ]-----------------------------------------

DrawObject:
LEA6C:  
    sta $0E                 ;($C2BF)/16. Lower nibble contains object y position.
    lda Div16Table, x
LEA70:  
    bne UpdateCartPointerYPosition      ;Skip y position calculation loop as y position=0
                                        ;does not need to be calculated.
                                        ; A = 0 at this point
    sta CartRAMWorkPtrLB                ;Set the working pointer equal to the room pointer
    ldx CartRAMPtrUB                    ;(start at beginning of the room).
    stx CartRAMWorkPtrUB
    bne UpdateCartPointerXPosition      ; branch always

UpdateCartPointerYPosition:
    tax

    lsr
    lsr
    clc
    adc CartRAMPtrUB
    sta CartRAMWorkPtrUB
    lda CartRamMulOffsetLoTable,x
    sta CartRAMWorkPtrLB

UpdateCartPointerXPosition:
LEA80:  lda $0E                 ;Reload object position byte.
LEA82:  and #$0F                ;Remove y position upper nibble.
LEA84:  asl                     ;Each x unit is 2 tiles.
LEA85:  adc CartRAMWorkPtrLB    ;
LEA87:  sta CartRAMWorkPtrLB    ;Add x position to room RAM work pointer.
        sta $26                  ;.alias _RoomDataWritePtr_Lo     $26

LEA89:  bcc SetupStructPtr      ;If carry occurred, increment high byte of room RAM work
LEA8B:  inc CartRAMWorkPtrUB    ;pointer, else branch to draw object.
;CartRAMWorkPtr now points to the object's starting location (upper left corner)
;on the room RAM which will eventually be loaded into a name table.

SetupStructPtr:
        lda CartRAMWorkPtrUB    
        sta $27                         ;.alias _RoomDataWritePtr_Hi     $27
LEA8D:  iny                             ; Move to the next byte of room data which is
LEA8E:  lax (RoomPtr),y                 ; the index into the structure pointer table.
LEA99:  lda StructPointerTable_Lo ,x    ; Low byte of 16-bit structure ptr.
LEA9B:  sta StructPtrLB                 ;
LEA9E:  lda StructPointerTable_Hi, x    ; High byte of 16-bit structure ptr.
LEAA0:  sta StructPtrUB                 ;
        dey                             ;Y = 0 at this point
        jmp DrawStruct          ;($EF8C)Draw one structure.     ; count_struct_addr in BuildRoomAnalyzer.lua


IncRoomPtrHiByte:
    inc RoomPtr+1
    bne DrawRoom

CheckForNextStruct:
    lda #$02                ;Move to next set of structure data.
    clc                     ;Prepare to add index in A to room pointer.
    adc RoomPtr             ;
    sta RoomPtr             ;
    bcs IncRoomPtrHiByte    ;Did carry occur? If not branch to exit.

;-------------------------------------------[ Draw room ]--------------------------------------------

;The following function draws a room in the room RAM which is eventually loaded into a name table.

; Start if the draw room
DrawRoom:
                            ;Zero index. Y = 0 here
LEAAC:  lax (RoomPtr),y     ;Load byte of room data. 
LEAAE:  cmp #$FF            ;Is it #$FF(end-of-room)?
LEAB0:  beq EndOfRoomLoad       ;If so, branch to exit.
LEAB6:  cmp #$FD            ;is A=#$FD(end-of-objects)?
LEAB8:  bne DrawObject      ;If not, branch to draw room object.
LEACA:  lda RoomPtr         ;
LEACC:  sta $00             ;Store room pointer in $0000.
LEACE:  lda RoomPtr+1       ;
LEAD0:  sta $01             ;
        inc $00
        bne LoadRoomFeatureRoutine
            inc $01
; End of Draw Room
        bne LoadRoomFeatureRoutine   ; branch always ; print_stuff_addr_1 in BuildRoomAnalyzer.lua  (Room end no enemies path)

;----------------------------------------------------------------------------------------------------

SetupNextRoomFeature:              ; print_stuff_addr_2 in BuildRoomAnalyzer.lua  (Room end, setup enemies)
    clc                 ;
    adc $00             ;
    sta $00             ; A is added to the 16 bit address stored in $0000.
    bcc +               ;
    inc $01             ;
*   ldy #$00

LoadRoomFeatureRoutine:
        lda ($00),y         ;Get first byte of enemy/door data.
LEADB:  cmp #$FF            ;End of enemy/door data?
LEADD:  beq EndOfRoomLoad   ;If so, branch to finish room setup.
LEADF:  and #$0F            ;Discard upper four bits of data.

;Choose Routine
    TAX
    LDA EnemyLoopTable_LoBytes - 1, x
    STA CodePtr
    LDA EnemyLoopTable_HiBytes - 1, x
    STA CodePtr + 1
    JMP (CodePtr)

EnemyLoopTable_HiBytes:
    .byte >LoadEnemy, >LoadDoor, >ExitSub, >ExitSub, >ExitSub, >LoadStatues, >ZebHole 
EnemyLoopTable_LoBytes:
    .byte <LoadEnemy, <LoadDoor, <ExitSub, <ExitSub, <ExitSub, <LoadStatues, <ZebHole 

;---------------------------------------------------------------------------------------------------

EndOfRoomLoad:
    inc Quarter
    lda Quarter
    and #$01
    beq Quarter2And4RoomEnd
EndOfRoomExit:
    rts

Quarter2And4RoomEnd:
    ldx #$F0                ;Prepare for PPU attribute table write.
    stx RoomNumber          ;
    lda ScrollDir           ;
    sta TempScrollDir       ;Make temp copy of ScrollDir.
    and #$02                ;Check if scrolling left or right.
    bne +                   ;
    jmp LE57C
*   jmp LE70C

LoadEnemy:
LEB06:  jsr GetEnemyData        ;($EB0C)Get enemy data from room data.
LEB09:  bne SetupNextRoomFeature       ;branch always

GetEnemyData:
    lda ($00),y         ;Get 1st byte again.
    and #$F0            ;Get object slot that enemy will occupy.
    tax             ;
; IsSlotTaken
        lda EnStatus,x
        beq EnemySlotIsNotTaken
        lda EnAttr_05,x
        and #$02
*   bne ++              ;Exit if object slot taken.
EnemySlotIsNotTaken:
    iny             ;
    lda ($00),y         ;Get enemy type.
    jsr GetEnemyType        ;($EB28)Load data about enemy.
    ldy #$02            ;
    lda ($00),y         ;Get enemy initial position(%yyyyxxxx).
    ; GetEnemyType
    jsr Near_LEB4D
    pha
*   pla
*   lda #$03            ;Number of bytes to add to ptr to find next room item.
GetEnemyDataExit:    
rts             ;

GetEnemyType:
    pha             ;Store enemy type.
    and #$C0            ;If MSB is set, the "tough" version of the enemy  
    sta EnSpecialAttribs,x      ;is to be loaded(more hit points, except rippers).
    asl             ;
    bpl EnemyIsKraidOrRidley             ;If bit 6 is set, the enemy is either Kraid or Ridley.
    lda InArea          ;Load current area Samus is in(to check if Kraid or
    asr #$06            ;Ridley is alive or dead). Use InArea to find status of Kraid/Ridley statue.
    tay                 ;
    lda MaxMissiles,y       ;Load status of Kraid/Ridley statue.
    beq +               ;Branch if Kraid or Ridley needs to be loaded.
    pla             ;
    pla             ;Mini boss is dead so pull enemy info and last address off
    jmp --              ;stack so next enemy/door item can be loaded.

*   lda #$01            ;Samus is in Kraid or Ridley's room and the
    sta KrdRdlyPresent      ;mini boss is alive and needs to be loaded.

EnemyIsKraidOrRidley:
*   pla             ;Restore enemy type data.
    and #$3F            ;Keep 6 lower bits to use as index for enemy data tables.
    sta EnDataIndex,x       ;Store index byte.
    rts             ;

; Might be able to inline
Near_LEB4D:
    tay                 ;Save enemy position data in Y.
    and #$F0            ;Extract Enemy y position.
    ora #$08            ;Add 8 pixels to y position so enemy is always on screen. 
    sta EnYRoomPos,x    ;Store enemy y position.
    ;lda Mul16Table,y    ;*16 to extract enemy x position.
    tya
    asl
    asl
    asl
    asl                 ;*16 to extract enemy x position.
    ora #$0C            ;Add 12 pixels to x position so enemy is always on screen.
    sta EnXRoomPos,x        ;Store enemy x position.
    lda #$01            ;
    sta EnStatus,x          ;Indicate object slot is taken.
    lda #$00
    sta EnHasBeenHit,x
    jsr GetNameTable        ;($EB85)Get name table to place enemy on.
    sta EnNameTable,x       ;Store name table.
Bank07_LEB6E:
    asl EnAttr_05,x         ;*2
    jsr LFB7B

UpdateEnemyHitpoints:
    ldy EnDataIndex,x
    lda $969B,y
    sta $040D,x
    lda EnemyHitPointTbl,y      ;($962B)
    ldy EnSpecialAttribs,x
    bpl +
    asl
*   sta EnHitPoints,x
    rts

;------------------------------------------[ Get name table ]----------------------------------------

;The following routine is small but is called by several other routines so it is important and
;requires some explaining to understand its function.  First of all, as Samus moves from one room
;to the next, she is also moving from one name table to the next.  Samus does not move from one
;name table to the next as one might think. Samus moves diagonally through the name tables. To
;understand this concept, one must first know how the name tables are arranged.  They are arranged
;like so:
;
; +-----+-----+                                               +-----+-----+
; |     |     | The following is an incorrect example of how  |     |     |
; |  2  |  3  | Samus goes from one name table to the next--> |  2  |  3  |
; |     |     |                                               |     |     |
; +-----+-----+                                               +-----+-----+
; |     |     |                                               |     |     |
; |  0  |  1  |                               INCORRECT!----> |  0<-|->1  |
; |     |     |                                               |     |     |
; +-----+-----+                                               +-----+-----+
;
;The following are examples of how the name tables are properly traversed while walking through rooms:
;
; +-----+-----+                                               +-----+-----+
; |     |     |                                               |     |     |
; |  2  | ->3 |                                               |  2  |  3<-|-+
; |     |/    |                                               |     |     | |
; +-----+-----+ <------------------CORRECT!-----------------> +-----+-----+ |
; |    /|     |                                               |     |     | |
; | 0<- |  1  |                                             +-|->0  |  1  | |
; |     |     |                                             | |     |     | |
; +-----+-----+                                             | +-----+-----+ |
;                                                           +---------------+
;
;The same diagonal traversal of the name tables illustrated above applies to vetricle traversal as
;well. Since Samus can only travel between 2 name tables and not 4, the name table placement for
;objects is simplified.  The following code determines which name table to use next:

GetNameTable:
LEB85:  LDA PPUCNT0ZP           ;
LEB87:  EOR ScrollDir           ;Store #$01 if object should be loaded onto name table 3,
LEB89:  AND #$01                ;store #$00 if it should be loaded onto name table 0.
LEB8B:  RTS                     ;

;----------------------------------------------------------------------------------------------------

; LoadDoor
; ========

LoadDoor:
    jsr DoSingleDoor
*   jmp SetupNextRoomFeature    ; do next room object

DoSingleDoor:
    iny
    lda ($00),y     ; door info byte
    pha
    asl
    asl
    asl
    asl             ; CF = door side (0=right, 1=left)
    php
    lda MapPosX
    clc
    adc MapPosY
    plp
    rol
    and #$03
    tay
    ldx LoadDoorTable_2,y
    pla      ; retrieve door info
    and #$03
    sta $0307,x     ; door palette
    tya
    pha
    lda $0307,x
    cmp #$01
    beq ++
    cmp #$03
    beq ++
    lda #$0A
    sta $09
    ldy MapPosX
    txa
    asl     ; Mul16
    asl
    asl
    asl
    bcc +
    dey
*   tya
    jsr LEE41
    jsr CheckForItem
    bcs ++
*   lda #$01
    sta ObjAction,x
*   pla
    and #$01    ; A = door side (0=right, 1=left)
    tay
    jsr GetNameTable        ;($EB85)
    sta ObjectHi,x
    lda DoorXs,y    ; get door's X coordinate
    sta ObjectX,x
    lda #$68    ; door Y coord is always #$68
    sta ObjectY,x
    lda LoadDoorTable,y
    tay
    ;jsr GetNameTable        ;($EB85)
    lda ObjectHi,x
    eor #$01
    tax
    tya
    ora DoorOnNameTable3,x
    sta DoorOnNameTable3,x
    lda #$02
    rts

; LoadStatues
; ===========

LoadStatues:
    jsr GetNameTable        ;($EB85)
    sta $036C
    lda #$40
    ldx RidlyStatueStat
    bpl +      ; branch if Ridley statue not hit
    lda #$30
*   sta $0370
    lda #$60
    ldx KraidStatueStat
    bpl +      ; branch if Kraid statue not hit
    lda #$50
*   sta $036F
    sty $54
    lda #$01
    sta $0360
SetupNextRoomFeature_Trampoline:
*   jmp SetupNextRoomFeature   ; do next room object

ZebHole:
LEC57:
    ldx #$20
ZebHoleLoop:
*   txa
    sbx #$08
    bmi +
    ldy PipeEnemyStatus,x
    iny
    bne ZebHoleLoop

    ;ldy #$00       ; y == 0 here
    lda ($00),y
    and #$F0
    sta $0729,x

    iny
    lda ($00),y
    sta PipeEnemyStatus,x

    iny
    lda ($00),y
    tay
    and #$F0
    ora #$08
    sta $072A,x

    ;lda Mul16Table, y  Mul16
    tya
    asl
    asl
    asl
    asl
    sta $072B,x

    jsr GetNameTable        ;($EB85)
    sta $072C,x
*   lda #$03
; HCSS - Trampolines
    bne SetupNextRoomFeature_Trampoline         ; branch always
    ; safe

UpdateRoomSpriteInfo:
LEC9B:  
    ldx ScrollDir
    dex
UpdateDoorData:
    txa               ;
    eor #$03          ;
    tax

    and $6C         ;Moves door info from one name table to the next
    sta $6C         ;when the room is transferred across name tables.
    txa               
    and $6D         ;Moves door info from one name table to the next
    sta $6D         ;when the room is transferred across name tables.

; Loop goes 50, 40, 30, 20, 10, 00
SetupUpdateDoorDataLoop:
    ldx #$50
    jsr GetNameTable        ;($EB85)
    tay

UpdateDoorDataLoop:
*   tya
    eor EnNameTable,x
    lsr
    bcs UpdateDoorDataNext
    lda EnAttr_05,x
    and #$02
    bne UpdateDoorDataNext
    sta EnStatus,x
UpdateDoorDataNext:
*   txa
    sbx #$10
    bpl UpdateDoorDataLoop

.scope   
    _check1:
        tya
        eor $B3 + $18
        bne _check2
            sta $B0 + $18

    _check2:
        tya
        eor $B3 + $10
        bne _check3
            sta $B0 + $10

    _check3:
        tya
        eor $B3 + $08
        bne _check4
            sta $B0 + $08

    _check4:
        tya
        eor $B3 + $00
        bne _end
            sta $B0 + $00

    _end:
.scend

    jsr LED65

LED5B:  

    tya             ; Y contains the current name table at this point
    pha
    eor #$01
    tay
    lda #$00
    sta $006C,y

Setup_LED5B_Loop:
    pla
    asl
    asl
    tay

ldx #$C0

; Goes from #$C0, #$B0, #$A0, #$90, #$80, #$70, #$60, #$50, #$40, #$30, #$20, #$10, #$00
LED5B_Loop:
*   tya
    eor TileWRAMHi,x
    and #$04
    bne +
    sta $0500,x
*   txa
    sbx #$10
    bpl LED5B_Loop

.scope
    tya
    lsr
    lsr
    tay

    ldx #$D0

    ; goes from #$D0, #$E0, #$F0
    _loop:
        lda ObjAction,x
        cmp #$05
        bcc _afterLoop
        tya
        eor ObjectHi,x
        lsr
        bcs _afterLoop
        sta ObjAction,x
        txa
        ; HCSS - SBX for adding
        sbx #$F0            ; Add 16 to X
        bne _loop
    _afterLoop:

.scend

    tya
    sec
    sbc $032C
    bne AnotherPostRoomSetupThing
        sta ElevatorStatus

.scope
    AnotherPostRoomSetupThing:
        lda #$FF

    _check1:
        ldx $0704 + $1E
        bne _check2
            sta $0700 + $1E

    _check2:
        ldx $0704 + $18
        bne _check3
            sta $0700 + $18

    _check3:
        ldx $0704 + $12
        bne _check4
            sta $0700 + $12

    _check4:
        ldx $0704 + $0C
        bne _check5
            sta $0700 + $0C

    _check5:
        ldx $0704 + $06
        bne _check6
            sta $0700 + $06

    _check6:
        ldx $0704 + $00
        bne _done
            sta $0700 + $00

    _done:

.scend

    cpy $036C
    bne +
        ldx #$00
        stx $0360

 ; A == #$FF here
PipeEnemyPostRoomSetup:
*   cpy $072C + $18
    bne +
        sta PipeEnemyStatus + $18
*   cpy $072C + $10
    bne +
        sta PipeEnemyStatus + $10
*   cpy $072C + $08
    bne +
        sta PipeEnemyStatus + $08
*   cpy $072C + $00
    bne +
        sta PipeEnemyStatus + $00

.scope

    ; A == #$FF here
    cpy PowerUpNameTable 
    bne _skip1
        sta PowerUpType 
    _skip1:

    cpy PowerUpNameTable + $08
    bne _skip2
        sta PowerUpType + $08
    _skip2:

    lda CurrentBank
    cmp #TourianBank
    bne Exit11
    jmp Bank03_L9C6F    ; Tourian Only
.scend

LED65:  
    ldx #$B0
*   lda ObjAction,x
    beq +
    lda ObjectOnScreen,x
    bne +
    sta ObjAction,x
*   txa
    sbx #$10
    bmi --

Exit11: 
    rts

;---------------------------------------[ Setup special items ]--------------------------------------

;The following routines look for special items on the game map and jump to
;the appropriate routine to handle those items.

ScanForItems:
LED98:  lda SpecItmsTblPtr       ;Low byte of ptr to 1st item data.
LED9B:  sta $00             ;
LED9D:  lda SpecItmsTblPtr+1     ;High byte of ptr to 1st item data.

ScanOneItem:
LEDA0:  sta $01             ;
LEDA2:  ldy #$00            ;Index starts at #$00.
LEDA4:  lda ($00),y         ;Load map Ypos of item.
LEDA6:  cmp MapPosY         ;Does it equal Samus' Ypos on map?
LEDA8:  beq ScanItemYPositionMatch           ;If yes, check Xpos too.

LEDAA:  bcs Exit11          ;Exit if item Y pos >  Samus Y Pos.
LEDAC:  iny             ;
LEDAD:  lax ($00),y         ;Low byte of ptr to next item data.         ;
LEDB0:  iny             ;
LEDB1:  eor ($00),y     ; HACK: 
                            ; instead of checking for FFFF I am now
                            ; checking if the high and low bit are the same 
                            ; In practice this should be the same result.

;LEDB3:  cmp #$FF           ;if result is FF, then this was the last item
LEDB5:  beq Exit11          ;(item ptr = FFFF). Branch to exit.

LEDB7:  lda ($00),y         ;High byte of ptr to next item data.
LEDB9:  stx $00             ;Write low byte for next item.
LEDBB:  jmp ScanOneItem     ;Process next item.

ScanItemYPositionMatch:
                        ; Carry bit will always be set here
*   lda #$02            ;Get ready to look at byte containing X pos.

; AddToPtr00:
    adc $00             ;
    sta $00             ; A is added to the 16 bit address stored in $0000.
    bcc ScanItemX           ;
    inc $01             ;

ScanItemX:
LEDC3:  ldy #$00            ;
LEDC5:  lda ($00),y         ;Load map Xpos of object.
LEDC7:  cmp MapPosX         ;Does it equal Samus' Xpos on map?
LEDC9:  beq LEDD4           ;If so, then load object.
LEDCB:  bcs Exit11          ;Exit if item pos X > Samus Pos X.

LEDCD:  iny                 ;
LEDCE:  jsr LEF00           ;($EF00)Check for another item on same Y pos.
LEDD1:  jmp ScanItemX       ;Try next X coord.

LEDD4:* lda #$02            ;Move ahead two bytes to find item data.

ChooseHandlerRoutine:
        clc                
        adc $00            
        sta $00            
        bcc LEDD9
        inc $01                    
LEDD9:  ldy #$00                ;
LEDDB:  lda ($00),y             ;Object type
LEDDD:  and #$0F                ;Object handling routine index stored in 4 LSBs.
    tax
    lda ChooseHandlerRoutineTable_LoBytes, x
    sta CodePtr
    lda ChooseHandlerRoutineTable_HiBytes, x
    sta CodePtr + 1
    jmp (CodePtr)

;Handler routines jumped to by above code.

ChooseHandlerRoutineTable_HiBytes:
    .byte >ExitSub           ;($C45C)rts.
    .byte >SqueeptHandler        ;($EDF8)Some squeepts.
    .byte >PowerUpHandler        ;($EDFE)power-ups.
    .byte >SpecEnemyHandler      ;($EE63)Special enemies(Mellows, Melias and Memus).
    .byte >ElevatorHandler       ;($EEA1)Elevators.
    .byte >CannonHandler     ;($EEA6)Mother brain room cannons.
    .byte >MotherBrainHandler    ;($EEAE)Mother brain.
    .byte >ZeebetiteHandler      ;($EECA)Zeebetites.
    .byte >RinkaHandler      ;($EEEE)Rinkas.
    .byte >SpecialDoorHandler       ;($EEF4)Some doors.
    .byte >PaletteHandler        ;($EEFA)Background palette change.

ChooseHandlerRoutineTable_LoBytes:
    .byte <ExitSub           ;($C45C)rts.
    .byte <SqueeptHandler        ;($EDF8)Some squeepts.
    .byte <PowerUpHandler        ;($EDFE)power-ups.
    .byte <SpecEnemyHandler      ;($EE63)Special enemies(Mellows, Melias and Memus).
    .byte <ElevatorHandler       ;($EEA1)Elevators.
    .byte <CannonHandler     ;($EEA6)Mother brain room cannons.
    .byte <MotherBrainHandler    ;($EEAE)Mother brain.
    .byte <ZeebetiteHandler      ;($EECA)Zeebetites.
    .byte <RinkaHandler      ;($EEEE)Rinkas.
    .byte <SpecialDoorHandler       ;($EEF4)Some doors.
    .byte <PaletteHandler        ;($EEFA)Background palette change.

;---------------------------------------[ Squeept handler ]------------------------------------------

SqueeptHandler:
LEDF8:  jsr GetEnemyData        ;($EB0C)Load Squeept data.
GoChooseHandlerRoutine:
LEDFB:* jmp ChooseHandlerRoutine    ;($EDD6)Exit handler routines.

;--------------------------------------[ Power-up Handler ]------------------------------------------

PowerUpHandler:
LEDFE:  iny             ;Prepare to store item type.
LEDFF:  ldx #$00            ;
LEE01:  lda #$FF            ;
LEE03:  cmp PowerUpType         ;Is first power-up item slot available?
LEE06:  beq LEE0F               ;if yes, branch to load item.

LEE08:  ldx #$08                ;Prepare to check second power-up item slot.
LEE0A:  cmp PowerUpBType        ;Is second power-up item slot available?         
LEE0D:  bne PowerUpHandlerEnd   ;If not, branch to exit.

LEE0F:  lda ($00),y             ;Power-up item type.
LEE11:  jsr PrepareItemID       ;($EE3D)Get unique item ID.
LEE14:  jsr CheckForItem        ;($EE4A)Check if Samus already has item.
LEE17:  bcs PowerUpHandlerEnd   ;Samus already has item. do not load it.

LEE19:  ldy #$02            ;Prepare to load item coordinates.
LEE1B:  lda $09             ;
LEE1D:  sta PowerUpType,x       ;Store power-up type in available item slot.
LEE20:  lda ($00),y         ;Load x and y screen positions of item.
LEE22:  tay             ;Save position data for later processing.
LEE23:  and #$F0            ;Extract Y coordinate.
LEE25:  ora #$08            ;+ 8 to find  Y coordinate center.
LEE27:  sta PowerUpYCoord,x     ;Store center Y coord
LEE2A:  tya             ;Reload position data.
LEE2B:  asl
        asl
        asl
        asl                 ;($C2C5)*16. Move lower 4 bits to upper 4 bits.
LEE2E:  ora #$08            ;+ 8 to find X coordinate center.
LEE30:  sta PowerUpXCoord,x     ;Store center X coord
LEE33:  jsr GetNameTable        ;($EB85)Get name table to place item on.
LEE36:  sta PowerUpNameTable,x      ;Store name table Item is located on.

PowerUpHandlerEnd:
LEE39:  lda #$03            ;Get next data byte(Always #$00).
LEE3B:  bne GoChooseHandlerRoutine  ;Branch always to exit handler routines.

.scope
    CheckForItem:
        ldy NumUniqueItems              ;
        beq CheckForItemClcAndExit      ;Samus has no unique items. Load item and exit.
        _loop:
            lda $07                     ;
            cmp NumUniqueItems,y        ;Look for lower byte of unique item.
            bne _next                   ;
                lda $06                 ;Look for upper byte of unique item.
                cmp DataSlot,y          ;
                beq CheckForItemExit    ;Samus already has item. Branch to exit.
        _next:
            dey                         ;
            dey                         ;
            bne _loop                   ;Loop until all Samus' unique items are checked.

    CheckForItemClcAndExit:
        clc                         ;Samus does not have the item. It will be placed on screen.
    CheckForItemExit:
        rts 

.scend

;------------------------------------------[ Create item ID ]-----------------------------------------

;The following routine creates a unique two byte item ID number for that item.  The description
;of the format of the item ID number is as follows:
;
;IIIIIIXX XXXYYYYY. I = item type, X = X coordinate on world map, Y = Y coordinate
;on world map.  The items have the following values of IIIIII:
;High jump     = 000001
;Long beam     = 000010 (Not considered a unique item).
;Screw attack  = 000011
;Maru Mari     = 000100
;Varia suit    = 000101
;Wave beam     = 000110 (Not considered a unique item).
;Ice beam      = 000111 (Not considered a unique item).
;Energy tank   = 001000
;Missiles      = 001001
;Missile door  = 001010
;Bombs         = 001100
;Mother brain  = 001110
;1st Zeebetite = 001111
;2nd Zeebetite = 010000
;3rd Zeebetite = 010001
;4th Zeebetite = 010010
;5th Zeebetite = 010011
;
;The results are stored in $06(upper byte) and $07(lower byte).

PrepareItemID:
    sta $09                     ;Store item type.
    lda MapPosX                 ;

LEE41:  
    sta $07                     ;Store item X coordinate.
    lda MapPosY                 ;
    sta $06                     ;Store item Y coordinate.

CreateItemID:
LDC67:  LDA $07             ;Load x map position of item.
LDC69:  ASL                 
        ASL
        ASL
        ASL
        ASL                 ;($C2C$)*32. Move lower 3 bytes to upper 3 bytes.
LDC6C:  ORA $06             ;combine Y coordinates into data byte.
LDC6E:  STA $06             ;Lower data byte complete. Save in $06.
LDC70:  LSR $07             ;
LDC72:  LSR $07             ;Move upper two bits of X coordinate to LSBs.
LDC74:  LSR $07             ;
LDC76:  LDA $09             ;Load item type bits.
LDC78:  ASL                 ;Move the 6 bits of item type to upper 6 bits of byte.
LDC79:  ASL                 ;
LDC7A:  ORA $07             ;Add upper two bits of X coordinate to byte.
LDC7C:  STA $07             ;Upper data byte complete. Save in #$06.
LDC7E:  RTS                 ;

;-----------------------------------------------------------------------------------------------------

.scope
SpecEnemyHandler:
LEE63:
    ldx #$18
    lda RandomNumber1
    adc FrameCount
    sta $8A
    ; Cache the GetNameTable call in y
    jsr GetNameTable
    tay
_loop:
    lda $B0,x
    bne _next
        txa
        adc $8A
        and #$7F
        sta $B1,x

        adc RandomNumber2
        sta $B2,x

        tya
        sta $B3,x

        lda #$01
        sta $B0,x

        rol $8A
    _next:
    txa
    sbx #$08
    bpl _loop

    lda MemuByte
    sta $6BE9
    sta $6BEA
    lda #$01
    sta $6BE4
ChooseHandlerRoutine_Trampoline:
    jmp ChooseHandlerRoutine    ;($EDD6)Exit handler routines.

.scend

; LoadElevator / ElevatorHandler
; ============

LoadElevator:
ElevatorHandler:
    lda ElevatorStatus
    bne SetATo2AndJumpToHandlerRoutine      ; exit if elevator already present
        iny
        lda ($00),y
        sta $032F
        ldy #$83
        sty $032D       ; elevator Y coord
        lda #$80
        sta $032E       ; elevator X coord
        jsr GetNameTable        ;($EB85)
        sta $032C       ; high Y coord
        lda #$23
        sta $0323       ; elevator frame
        inc ElevatorStatus      ;1
SetATo2AndJumpToHandlerRoutine:
    lda #$02
    bne ChooseHandlerRoutine_Trampoline              ;Branch always.

; Tourian Only
CannonHandler:
LEEA6:
    ; The only time we will ever even get here is in bank 3
    ; so no need to guard here
    jsr Bank03_L9CE6 
*   jmp SetATo2AndJumpToHandlerRoutine                ;($EDD6)Exit handler routines.

; Tourian Only
MotherBrainHandler:
LEEAE: 
    jsr Bank03_L9D21 
    lda #$38
    sta $07
    lda #$00
    sta $06
    jsr CheckForItem
    bcc SetATo1AndJumpToHandlerRoutine
    lda #$08
    sta MthrBrainStatus
    lda #$00
    sta MotherBrainHits
SetATo1AndJumpToHandlerRoutine:  
    lda #$01
    bne ChooseHandlerRoutine_Trampoline

; Tourian Only
ZeebetiteHandler:
LEECA:
    jsr Bank03_L9D3D 
    txa
    lsr
    adc #$3C
    sta $07
    lda #$00
    sta $06
    jsr CheckForItem
    bcc +
    lda #$81
    sta $0758,x

    lda #$01
    sta $075D,x

    lda #$07
    sta $075B,x
*   bne SetATo1AndJumpToHandlerRoutine

; Tourian Only
RinkaHandler:
    jsr Bank03_L9D6C 
    jmp SetATo1AndJumpToHandlerRoutine

SpecialDoorHandler:
LEEF4:
    jsr DoSingleDoor
    jmp ChooseHandlerRoutine    ;($EDD6)Exit handler routines.

PaletteHandler:
LEEFA:
    lda ScrollDir
    sta $91
    bne SetATo1AndJumpToHandlerRoutine

; Probably don't need these, but I don't really know 
LEF00:
    lda ($00),y 
    cmp #$FF    
    bne LEF09   
    pla         
    pla         
    rts         

LEF09:
    ;clc                
    adc $00            
    sta $00            
    bcc Exit102       
    inc $01            
Exit102:
    rts

;----------------------------------[ Draw structure routines ]----------------------------------------
.scope

.alias _PositionInStruct        $10
.alias _MacrosLeftInRow         $0E
.alias _CloseToAttrTable        $30
.alias _RoomDataWritePtr_Hi     $27
.alias _RoomDataWritePtr_Lo     $26
.alias _RoomDataWritePtr        $26

DrawStructExit:
    jmp CheckForNextStruct

IncStructPtrUB:
    inc StructPtrUB         ;Update high byte of struct pointer if carry occured.
    clc                     
    bcc UpdateCartRamPtr    ;branch always

IncCartRAMWorkPtrUB:
    inc CartRAMWorkPtrUB    ;Increment high byte of pointer if necessary.
    inc _RoomDataWritePtr_Hi
    clc 
    bcc DrawStruct          ;branch always

DoAnotherMacro:
    LEF76:  lda _PositionInStruct            ;Load struct index.

AdvanceRow:
    LEF78:  sec                         ;Since carry bit is set,
    LEF79:  adc StructPtrLB             ;addition will be one more than expected.
    LEF7B:  sta StructPtrLB             ;Update the struct pointer.
    LEF7D:  bcs IncStructPtrUB          ;Branching is 1 cycle slower than not branching

UpdateCartRamPtr:
    LEF81:  lda CartRAMWorkPtrLB        ;
    LEF84:  adc #$40                    ;Advance to next macro row in room RAM(two tile rows).
    LEF86:  sta CartRAMWorkPtrLB        ;
            sta _RoomDataWritePtr_Lo
    LEF88:  bcs IncCartRAMWorkPtrUB     ;Branching is 1 cycle slower than not branching

; Entry point
DrawStruct:
LEF8E:  sty _PositionInStruct   ;Reset struct index. y == 0 here
LEF90:  lax (StructPtr), y      ;Load data byte.
LEF94:  bmi DrawStructExit      ;If so, branch to exit.

;Draws one row of the structure.
;A = number of 2x2 tile macros to draw horizontally.

DrawStructRow:
LEF19:  sta _MacrosLeftInRow      ;Store horizontal macro count.

;High byte of current location in room RAM.
;Check high byte of room RAM address for both room RAMs
;to see if the attribute table data for the room RAM has
;been reached.  If so, branch to check lower byte as well.
;If not at end of room RAM, branch to draw macro.

DrawMacro:
LEF3F:  inc _PositionInStruct   ;Increase struct data index.       ; count_macro_addr in BuildRoomAnalyzer.lua
LEF41:  ldy _PositionInStruct   ;Load struct data index into Y.

DrawNext:
LEF43:  lax (StructPtr),y       ;Get macro number. StructPtr = $35
;The following table is used to draw macros in room RAM. Each macro is 2 x 2 tiles.
;The following table contains the offsets required to place the tiles in each macro.

        ldy #$20
        lda MacroUpperRight, x
        sta (_RoomDataWritePtr),Y

        iny
        lda MacroUpperLeft, x
        sta (_RoomDataWritePtr),Y

        ldy #$01
        lda MacroLowerLeft, x
        sta (_RoomDataWritePtr),Y

        dey
        lda MacroLowerRight, x                             ; Doing it like this so Y is 0 when we get out of here
        sta (_RoomDataWritePtr),Y

        lda _RoomDataWritePtr
        adc #$02
        sta _RoomDataWritePtr

LEF72:  dec _MacrosLeftInRow        ;Have all macros been drawn on this row?
LEF74:  bne DrawMacro               ;If not, branch to draw another macro.
LEF65:  beq DoAnotherMacro          ;If yes, branch to do another macro.

.scend

; Collision detection
; ===============

; HUGBEES #4 - %8 of all frame time is spent here.
CollisionDetection:
    lda #$FF
    sta $73
    sta $010F
; check for crash with Memus
    ldx #$18
*   lda $B0,x
    beq AfterMemuCollisionCheck             ; branch if no Memu in slot
    cmp #$03
    beq AfterMemuCollisionCheck

    lda $B1,x
    sta $07

    lda $B2,x

    sta $09
    lda $B3,x
    eor PPUCNT0ZP
    and #$01
    sta $0B

    ; jsr IsSamusDead
    lda SamusObjAction
    and #$08
    bne +
    lda SamusBlink
    bne +
    ldy #$00
    jsr LF149
    jsr LF2B4
    ; check for crash with bullets

    .scope
*   ldy #$D0
; loop
    *   lda ObjAction,y       ; projectile active?
        beq ++                  ; try next one if not
        cmp #wa_BulletExplode
        bcc +
        cmp #$07
        beq +
        cmp #wa_BombExplode
        beq +
        cmp #wa_Missile
        bne ++
    *   jsr LF149
        bcs +
        lda $10
        ora $030A,y
        sta $030A,y
        jsr LF2BF
    *   tya
        clc
        adc #$10
        tay
        bne ---
.scend

AfterMemuCollisionCheck:
*   txa
    sbx #$08
    bpl ------

    ldx #$B0
*   lda ObjAction,x
    cmp #$02
    bne +
    ldy #$00
    ;jsr IsSamusDead
    lda SamusObjAction
    and #$08
    bne ++
    jsr AreObjectsTouching      ;($DC7F)
    bcs +
    lda $10
    ora $030A,y
    sta $030A,y
*   txa
    sbx #$10
    bmi --
; enemy < bullet/missile/bomb detection
*   ldx #$50        ; start with enemy slot #5
LF09F:
    lda EnStatus,x       ; slot active?
    beq NextEnemy          ; branch if not
    cmp #$03
*   beq NextEnemy      ; next slot
    jsr GetXEnemyRoomPosition_07_09_0B
    lda EnStatus,x
    cmp #$05
    beq AfterBulletLoop

.scope
    ldy #$D0        ; first projectile slot

    _loop:
        lda ObjAction,y     ; is it active?
        beq _next        ; branch if not
        cmp #wa_BulletExplode       ; wa_BulletExplode == 4 so if A < 4     Bullet, Wave, Ice
        bcc _doStuff
        cmp #$07                    ; if A == 7     My guess is Ice beam exploding 4 == bullet explostion && 3 == ice beam
        beq _doStuff
        cmp #wa_BombExplode         ; if A == 10
        beq _doStuff
        cmp #wa_Missile     
        bne _next

        ; check if enemy is actually hit
        _doStuff:
            jsr DistFromEn0ToObj1
            jsr GetObject1CoordData
            jsr LF1FA
            bcs _next
                jsr LF2CA

    _next:
        clc   
        tya
        adc #$10
        tay      ; next projectile slot
    bne _loop
.scend

AfterBulletLoop:
*   ldy #$00
    lda SamusBlink
    bne NextEnemy

    ;jsr IsSamusDead
    lda SamusObjAction
    and #$08
    bne NextEnemy

    jsr DistFromEn0ToObj1
    jsr GetSamusCoordData_06_08_0A
    jsr LF1FA
    bcs NextEnemy
    jsr LF282
NextEnemy:
    txa
    sbx #$10
    bpl LF09F

*   ldx #$00    ; LF2ED needs this to be 0
    jsr GetSamusCoordData_07_09_0B

    ldy #$60    ; Loop runs 60, 70, 80, 90, A0, B0
NextEnemyLoop:
    *   lda EnStatus,y
        beq NextEnemyLoopContinue

        cmp #$05
        beq NextEnemyLoopContinue

        lda SamusBlink
        bne NextEnemyLoopContinue
        ;jsr IsSamusDead
        lda SamusObjAction
        anc #$08
        bne NextEnemyLoopContinue

;DistFromObj0ToEn1: 
        lda ObjRadY
        ;clc
        adc EnRadY,y
        sta $04

        lda ObjRadX
        adc EnRadX,y
        sta $05

        lda EnYRoomPos,y     ; Y coord
        sta $06

        lda EnXRoomPos,y     ; X coord
        sta $08

        lda EnNameTable,y     ; hi coord
        eor PPUCNT0ZP
        and #$01
        sta $0A

        jsr LF1FA
        jsr LF2ED
    NextEnemyLoopContinue:
    *   tya
        clc
        adc #$10
        tay
        cmp #$C0
        bne NextEnemyLoop

    ldy #$00
        
    ;jsr IsSamusDead
    lda SamusObjAction
    and #$08
    bne SubtractHealth_Trampoline

    ; Samus is not dead
    jsr GetSamusCoordData_06_08_0A
    ldx #$F0
*   lda ObjAction,x
    cmp #$07
    beq +
    cmp #$0A
    bne ++
*   jsr GetObject0CoordData
    bcs +       ; skip JSR is carry is set
        ; y is always 0 here.
        jsr LF311
*   txa
    sbx #$10
    cpx #$C0
    bne ---
SubtractHealth_Trampoline:
*   jmp SubtractHealth      ;($CE92)
    ; safe

LF149:
    jsr GetObject1CoordData ; <== set the carry bit to zero

    lda #$04
    ;clc
    adc ObjRadY,y
    sta $04

    lda #$08
    adc ObjRadX,y
    sta $05
    
    jmp LF1FA

GetXEnemyRoomPosition_07_09_0B:  
    lda EnYRoomPos,x
    sta $07  ; Y coord

    lda EnXRoomPos,x
    sta $09  ; X coord

    lda EnNameTable,x     ; hi coord
    eor PPUCNT0ZP
    anc #$01
    sta $0B

    rts

GetSamusCoordData_07_09_0B:
    lda ObjectY
    sta $07

    lda ObjectX
    sta $09

    lda ObjectHi
    eor PPUCNT0ZP
    and #$01
    sta $0B

    rts

GetSamusCoordData_06_08_0A:
    lda ObjectY
    sta $06

    lda ObjectX
    sta $08

    lda ObjectHi
    eor PPUCNT0ZP
    anc #$01
    sta $0A

    rts

GetObject1CoordData:
    lda ObjectY,y
    sta $06

    lda ObjectX,y
    sta $08

    lda ObjectHi,y
    eor PPUCNT0ZP
    anc #$01
    sta $0A
    rts

DistFromEn0ToObj1:
    lda EnRadY,x
    clc
    adc ObjRadY,y
    sta $04

    lda EnRadX,x
    clc
    adc ObjRadX,y
    sta $05

    rts

; Y = Y + 16
; TODO: move this to the most common "jmp LF1FA" instruction
; FIFA

.scope
; Does not clobber X or Y
LF1FA:

    lda $07             ;Load object 0 y coord.
    sec             ;
    sbc $06             ;Subtract object 1 y coord.
    sta $00             ;Store difference in $00.
    
    lda #$02
    sta $10

    and ScrollDir
    sta $03

    bne ++

    lda $0B
    eor $0A
    beq ++

    jsr LF262
    
    lda $00
    sec
    sbc #$10
    sta $00
    bcs +
    dec $01
*   jmp LF22B

*   lda #$00
    sbc #$00
    sta $01
    bpl LF22B
        jsr LE449

LF22B:
    sec
    lda $01
    bne ++
    lda $00
    sta $11
    cmp $04
    bcs ++
    asl $10
    lda $09
    sec
    sbc $08
    sta $00
    lda $03
    beq +
    lda $0B
    eor $0A
    beq +
        jsr LF262
        jmp LF256

*   sbc #$00
    sta $01
    bpl LF256
        jsr LE449

LF256:
    sec
    lda $01
    bne +
    lda $00
    sta $0F
    cmp $05
*   rts

LF262:
    lda $0B
    sbc $0A
    sta $01
    bpl Exit17

;----------------------------------------------------------------------------------------------------

LE449:
    lda #$00
    sec
    sbc $00
    sta $00

    lda #$00
    sbc $01
    sta $01
    inc $10
Exit17:
    rts

.scend

LF282:
    jsr LF2E8
    jsr IsScrewAttackActive     ;($CD9C)Check if screw attack active.
    ldy #$00
    bcc +++
    lda EnStatus,x
    cmp #$04
    bcs Exit17
    lda EnDataIndex,x

*   sta $010F
    tay
    bmi +
    lda $968B,y
    and #$10
    bne Exit17
*   lda $10
    asl
    asl
    asl
    ora $030A
    sta $030A
    jmp LF306

*   lda #$81
    sta $040E,x
    bne ++
LF2B4:
    bcs +
    jsr IsScrewAttackActive     ;($CD9C)Check if screw attack active.
    ldy #$00
    lda #$C0
    bcs ---
LF2BF:  
    lda $B6,x
    and #$F8
    ora $10
    eor #$03
    sta $B6,x
*   rts

LF2CA:
; At this point, the bullet has made contact with the enemy
    lda ObjAction,y
    sta $040E,x
    lda $10

    ora $030A,y
    sta $030A,y
*   lda $10

    eor #$03
    asl
    asl
    asl
*   ora EnHasBeenHit,x
    sta EnHasBeenHit,x
*   rts

LF2E8:
    lda $10
    eor #$03
    bne --
LF2ED:  
    bcs +
    lda $10
    ora EnHasBeenHit,y
    sta EnHasBeenHit,y
    tya
    pha
    jsr IsScrewAttackActive     ;($CD9C)Check if screw attack active.
    pla
    tay
    bcc +
    lda #$80
    sta $010F

    lda $10
    eor #$03
    asl
    asl
    asl
    ora $030A,x
    sta $030A,x
LF306:  
    lda $95CE
    sta HealthLoChange
    lda $95CF
    sta HealthHiChange
*   rts

LF311:  
    lda #$E0
    sta $010F

    lda $10
    asl
    asl
    asl
    ora $030A,y
    sta $030A,y

    lda $0F
    beq +
        lda #$01
*   sta $73

; ClearHealthChange:
LF323:  lda #$00
LF325:  sta HealthLoChange
LF327:  sta HealthHiChange

EXIT22: 
LF329: 
    rts             ;Return for routine above and below.

; HUGBEES #1 - %15 of average frame time is spent here
DoOneEnemy:
    stx PageIndex
    cpy #$03
    bcs ChooseEnemySubroutine
    lda EnAttr_05,x
    and #$02
    bne ChooseEnemySubroutine

.scope
_IsObjectVisible:
    lda EnYRoomPos,x       
    tay                    
    sec                    
    sbc ScrollY            
    sta $10                

    lda EnXRoomPos,x       
    sec                    
    sbc ScrollX            
    sta $0E                

    lda ScrollDir          
    and #$02               
    bne _HorzScrollCheck   

_VertScrollCheck:
    cpy ScrollY                
    lda EnNameTable,x          
    eor PPUCNT0ZP              
    and #$01                   
    beq _VertBccCheck          
    bcs EXIT22                 
    lda $10                    
    sbc #$0F                   
    sta $10

    lda EnRadX,x               
    clc                        
    adc $10                    
    cmp #$F0                   
    bcc ChooseEnemySubroutine 
    bcs EXIT22                 

_VertBccCheck:
    bcc EXIT22 
    lda EnRadX,x 
    cmp $10      
    bcs EXIT22
    bcc ChooseEnemySubroutine

_HorzScrollCheck:
    lda EnNameTable,x        
    eor PPUCNT0ZP            
    and #$01                 
    beq _HorzBccCheck        
    bcs EXIT22 

    lda EnRadX,x             
    adc $0E                  
    bcc ChooseEnemySubroutine
    bcs EXIT22 

_HorzBccCheck:
    bcc EXIT22  
    lda EnRadX,x
    cmp $0E     
    bcs EXIT22

ChooseEnemySubroutine:

    lda Div16Table,x
    eor FrameCount
    lsr

    lda EnAttr_05,x
    and #%10111111
    bcc _after_setting_bit_6
        ora #%01000000
    _after_setting_bit_6:
    sta EnAttr_05,x

    ldy EnStatus,x
    sty $81                 ; Y is EnStatus,x at this point
;    bne DoEnemySubroutine
; ==== Couldn't get these bytes to trigger =====
;    cpy #$07
;    bcc DoEnemySubroutine
;KillObject_Duplicate:
;    lda #$00
;    sta EnStatus,x
;    rts

DoEnemySubroutine:
    lda DoOneEnemyTableHiByte - 1, y    ; -1 is because we already handled the 0 case
    sta CodePtr + 1                     ; Don't need to waste 2 bytes for the exit routine
    lda DoOneEnemyTableLoByte - 1, y
    sta CodePtr
    JMP (CodePtr)

DoOneEnemyTableHiByte:
    .byte >EnemyRoutine_1, >EnemyRoutine_2, >HandleBankEnemies, >EnemyRoutine_4, >HandleEnemyPickupState, >EnemyRoutine_6 

DoOneEnemyTableLoByte:
    .byte <EnemyRoutine_1, <EnemyRoutine_2, <HandleBankEnemies, <EnemyRoutine_4, <HandleEnemyPickupState, <EnemyRoutine_6 

.scend

EnemyRoutine_1:
LF3BE:
    lda EnAttr_05,x
    asl
    bmi HandleBankEnemies_Trampoline
    lda #$00
    sta $6B01,x
    sta EnCounter,x
    sta $040A,x

     ; TODO: Join LF6B9 and LF75B together
    jsr LF6B9
    jsr LF75B
    jsr LF682

;inlined $80B0
    LDY EnDataIndex,X
    LDA $977B,Y
    asl              
    asl 
    asl 
    asl 
    ; TODO: see if "and #$C0" can be removed
    and #$C0
    sta $6B03,x

    lda EnDelay,x
    beq +
        jsr LF7BA
*   jmp LF40A

EnemyRoutine_2:
LF3E6:
    lda $0405,x
    asl
    bmi ++
    lda $0405,x
    and #$20
    beq +
    ldy EnDataIndex,x
    lda EnemyInitDelayTbl,y     ;($96BB)
    sta EnDelay,x
    dec EnStatus,x
    bne ++
    ; TODO: Join LF6B9 and LF75B together
*   jsr LF6B9
    jsr LF75B
    jsr LF51E
LF40A:
    * jsr CheckIfEnemyHasBeenHit

HandleBankEnemies_Trampoline:
LF40D:
    jmp HandleBankEnemies

StartUpdateEnemyAnimation:
    jsr UpdateEnemyAnim
    ; === Change ====
    lda $0405,X
    asl
    bmi Start_Special_Attrs
        jsr $8060       ; JUAMNJI changed from $8058
    ; === End Change ===
    ; === Before Change ===
    ; jsr $8058
    ; === End Before Change

Start_Special_Attrs:
    ldx PageIndex
    lda EnSpecialAttribs,x
    bpl +
    lda ObjectCntrl
    bmi +
    lda #$A3
LF423:
    sta ObjectCntrl
*   lda EnStatus,x
    beq LF42F
    ldy EnAnimFrame,x
    cpy #$F7
    beq LF42B
        jsr MoveEnemies
LF42B:
    sta ObjectCntrl
LF42D:
    ldx PageIndex
    ;lda #$00
LF42F:
    sta EnHasBeenHit,x
    sta $040E,x
Exit105:
    rts

; This one is called from Bank01 - Bank05
StartUpdateEnemyAnimation_2:  
    jsr UpdateEnemyAnim
LF43B:
    jmp Start_Special_Attrs

EnemyRoutine_4:
LF43E:
    jsr CheckIfEnemyHasBeenHit
    lda EnStatus,x
    cmp #$03
    beq StartUpdateEnemyAnimation
    bit ObjectCntrl
    bmi +
    lda #$A1
    sta ObjectCntrl
*   lda FrameCount
    and #$07
    bne +
    dec $040D,x
    bne +
    lda EnStatus,x
    cmp #$03
    beq +
    lda $040C,x
    sta EnStatus,x
    ldy EnDataIndex,x
    lda $969B,y
    sta $040D,x
*   lda $040D,x
    cmp #$0B
    bcs +
    lda FrameCount
    and #$02
    beq +
    asl ObjectCntrl
*   jmp Start_Special_Attrs

HandleEnemyPickupState:
LF483:
    lda EnHasBeenHit,x
    and #$24
    beq DecrementEnemyPickupTimer

CollectEnemyPickup:
    jsr KillObject
    ldy EnAnimFrame,x
    cpy #$80
    beq PickupMissile

PickupHealth:
    lda #$03
    sta $00                ;Add 30 Health
    lda EnDataIndex,x
    bne AddToHealthHi

    dec $00                ;Add 20 Health
    cpy #$81
    bne AddToHealthHi

.scope

Add5Health:
    lda #$00
    sta $00
    lda HealthLo
    adc #$50
    cmp #$A0
    bcc _storeLo
        adc #$5F
_storeLo:
    sta HealthLo

AddToHealthHi:
    lda HealthHi
    and #$F0
    sta $01

    lda HealthHi 
    and #$0F
    adc $00

    cmp #$0A
    bcc _addAndStoreHi
        adc #$05

_addAndStoreHi:
    adc $01
    sta HealthHi            ;Save results.

; Cap the max life based
    lda TankCount           ;
    asl
    asl
    asl
    asl
    ora #$0F                ;Set lower 4 bits.
    cmp HealthHi            ;
    bcs SFX_EnergyPickup    ;Is life less than max? if so, branch.
    and #$F9                ;Life is more than max amount. 
    sta HealthHi            ;
    lda #$99                ;Set life to max amount.
    sta HealthLo            ;

.scend

;($CEF9)Add health to Samus.
SFX_EnergyPickup:
    lda #SFX_ENGY_PKUP
    ora SQ1SFXFlag
    sta SQ1SFXFlag
    rts             

PickupMissile:
    lda #$02
    ldy EnDataIndex,x
    beq +
    lda #$1E
*   clc
    adc MissileCount
    bcs +               ; can't have more than 255 missiles
    cmp MaxMissiles     ; can Samus hold this many missiles?
    bcc ++              ; branch if yes
*   lda MaxMissiles     ; set to max. # of missiles allowed
*   sta MissileCount
SFX_MissilePickup:
    lda #SFX_MSL_PKUP
    ora SQ1SFXFlag
    sta SQ1SFXFlag
    rts

DecrementEnemyPickupTimer:
*   lda FrameCount
    and #$03
    bne +
    dec $040D,x
    bne +
    jsr KillObject          ;($FA18)Free enemy data slot.
*   lda FrameCount
    asr #$02
    ora #$A0
    sta ObjectCntrl
    jmp Start_Special_Attrs

EnemyRoutine_6:
LF4EE:
    dec EnSpecialAttribs,x
    bne ++
    lda $040C,x
    tay
    and #$C0
    sta EnSpecialAttribs,x
    tya
    and #$3F
    sta EnStatus,x
    pha

;inlined $80B0
    LDY EnDataIndex,X
    LDA $977B,Y
    ; asl20
    ;ASL              
    and #$10
    beq +
    pla
    sta $040C,x
    lda #$04
    sta EnStatus,x
    pha
*   pla
*   lda #$A0
    jmp LF423

LF51E:
    lda ScrollDir
    ldx PageIndex
    cmp #$02
    bcc +
    lda EnYRoomPos,x     ; Y coord
    cmp #$EC
    bcc +
    jmp KillObject          ;($FA18)Free enemy data slot.

; SFX_MetroidHit:          
    lda #SFX_MTRD_HIT
    ora TriangleSFXFlag
    sta TriangleSFXFlag
    ldx PageIndex
Exit24:
*   rts

CheckIfEnemyHasBeenHit:
    lda EnSpecialAttribs,x
    sta $0A
    lda EnHasBeenHit,x
    and #$20
    beq +
EnemyReactToBeingHit:
    lda $040E,x
    cmp #$03
    bne EnemyPlayGetHitSound
    bit $0A
    bvs EnemyPlayGetHitSound
    lda EnStatus,x
    cmp #$04
    beq EnemyPlayGetHitSound
    
    sta $040C,x

    lda #$04
    sta EnStatus,x

    lda #$40
    sta $040D,x

;inlined $80B0
    ldy EnDataIndex,X
    lda $977B,Y
    ; asl20          
    and #$10
    beq +
    lda #$05
    sta EnHitPoints,x
    lda CurrentBank
    cmp #TourianBank
    bne +
        jmp Bank03_LA320           ; Only tourian
*   rts

;inlined $80B0
HitInvincibleObject:
*   ldy EnDataIndex,X
    lda $977B,Y
    ; asl20
    and #$10
    bne Exit24
    ;ldx PageIndex
    sta EnHasBeenHit,x
    sta $040E,x

    jmp SFXMetal

EnemyPlayGetHitSound:
*   lda EnHitPoints,x
    cmp #$FF
    beq HitInvincibleObject
    bit $0A
    bvc +
SFX_BossHit_Inline:
    lda #SFX_BOSS_HIT
    ora MultiSFXFlag
    sta MultiSFXFlag
    bne ++

*   ldy EnDataIndex,x
    lda $968B,y

    and #$0C
    beq PlaySnd1
    cmp #$04
    beq PlaySnd1
    cmp #$08
    beq PlaySnd3
; SFX_MetroidHit:          
    lda #SFX_MTRD_HIT
    ora TriangleSFXFlag
    sta TriangleSFXFlag
    bne +       ; branch always
PlaySnd1:
    jsr SFX_EnemyHit
    bne +       ; branch always
PlaySnd3:
SFX_BigEnemyHit_Inline:
    lda #SFX_BIG_EN_HIT
    ora TriangleSFXFlag
    sta TriangleSFXFlag

*   ldx PageIndex

;inlined $80B0
    LDY EnDataIndex,X
    LDA $977B,Y
    ; asl20            
    and #$10
    beq +
    lda $040E,x
    cmp #$0B
    bne ----
*   lda EnStatus,x
    cmp #$04
    bne +
    lda $040C,x
*   ora $0A
    sta $040C,x
    asl
    bmi +

;inlined $80B0
*   LDY EnDataIndex,X
    LDA $977B,Y
    ; asl20            
    and #$10
    bne +
    ldy $040E,x
    cpy #$0B
    beq +++++
    cpy #$81
    beq +++++
*   lda #$06
    sta EnStatus,x
    lda #$0A
    bit $0A
    bvc +
    lda #$03
*   sta EnSpecialAttribs,x
    cpy #$02
    beq +
    bit $0A
    bvc ++
    ldy $040E,x
    cpy #$0B
    bne ++
    dec EnHitPoints,x
    beq +++
    dec EnHitPoints,x
    beq +++
*   dec EnHitPoints,x
    beq ++
*   dec EnHitPoints,x
    bne GetPageIndex

*   lda #$03
    sta EnStatus,x
    bit $0A
    bvs +
    lda $040E,x
    cmp #$02
    bcs +
    ;lda #$00
    jsr LDCFC
    ;ldx PageIndex
*   jsr LF844
    lda $960B,y
    jsr DoSomethingToAnimationIndecies
    sta EnCounter,x
    ldx #$C0
*   lda EnStatus,x
    beq +
    txa
    sbx #$F8    ; Add 8 to X
    cpx #$E0
    bne -
    beq GetPageIndex

*   lda $95DD
    jsr DoSomethingToAnimationIndecies
    lda #$0A
    sta EnCounter,x
    inc EnStatus,x
    lda #$00
    bit $0A
    bvc +
    lda #$03
*   sta $0407,x

    ldy PageIndex
    lda EnYRoomPos,y
    sta EnYRoomPos,x
    lda EnXRoomPos,y
    sta EnXRoomPos,x
    lda EnNameTable,y
    sta EnNameTable,x

GetPageIndex:
    ldx PageIndex
    rts

LF682:  
    jsr LF844
    lda $963B,y
    cmp EnResetAnimIndex,x
    beq +
DoSomethingToAnimationIndecies:  
    sta EnResetAnimIndex,x
LF690:  
    sta EnAnimIndex,x
    lda #$00
    sta EnAnimDelay,x
Exit12:
*   rts

LF6B9:
    lda #$00
    sta $82

    ldy EnDataIndex,x
    lda $968B,y

    tay
    lda EnStatus,x
    cmp #$02
    bne +
    tya
    and #$02
    beq Exit12
*   tya
    dec $040D,x
    bne Exit12
    pha
    ldy EnDataIndex,x
    lda $969B,y
    sta $040D,x
    pla
    bpl ++++
    lda #$FE

    and $0405,x
    sta $0405,x

    lda ScrollDir
    cmp #$02
    bcc +

    lda EnNameTable,x
    tay
    eor ObjectHi
    lsr

    bcc +
    tya
    eor PPUCNT0ZP
    bcs +++
*   lda EnXRoomPos,x
    cmp ObjectX
    bne +
    inc $82
*   rol
*   and #$01
    ora EnAttr_05,x
    sta EnAttr_05,x
    lsr
    ror
    eor $0403,x
    bpl +
    jsr $81DA
*   lda #$FB

    and $0405,x
    sta $0405,x

    lda ScrollDir
    cmp #$02
    bcs +

    lda EnNameTable,x
    tay
    eor ObjectHi
    lsr

    bcc +
    tya
    eor PPUCNT0ZP
    bcs +++
*   lda EnYRoomPos,x
    cmp ObjectY
    bne +
    inc $82
    inc $82
*   rol
*   and #$01
    asl
    asl
    ora EnAttr_05,x
    sta EnAttr_05,x
    lsr
    lsr
    lsr
    ror
    eor $0402,x
    bpl EXIT_44
    jmp $820F

EXIT_44:
    rts

; This is now only used in Game_Start_Common
; Need one more byte to inline it
UpdateEnAttr_05:
    ora EnAttr_05,x
    sta EnAttr_05,x
    rts

; Possible Inline, maybe move to Game_Start_Common
LF74B:
    ldy EnDataIndex,x
    lda $968B,y
    rts

LF75B:
    lda #$E7
    sta $06
    lda #$18
    ora $0405,x
    sta $0405,x
    ldy EnDataIndex,x
    lda $96AB,y
    beq +++++
    tay
    lda $0405,x
    and #$02
    beq ++++
    tya
    ldy #$F7
    asl
    bcs +
    ldy #$EF
*   lsr
    sta $02
    sty $06
    lda ObjectY
    sta $00
    ldy EnYRoomPos,x
    lda $0405,x
    bmi +
    ldy ObjectX
    sty $00
    ldy EnXRoomPos,x
*   lda ObjectHi
    lsr
    ror $00
    lda EnNameTable,x
    lsr
    tya
    ror
    sec
    sbc $00
    bpl +

    eor #$FF
    adc #$00    ;Carry always set here

*   lsr
    lsr
    lsr
    cmp $02
    bcc ++
*   lda $06
LF7B3:
    and $0405,x
    sta $0405,x
*   rts

LF7BA:
    dec EnDelay,x
    bne +
    lda $0405,x
    and #$08
    bne ++
    inc EnDelay,x
*   rts

*   lda EnDataIndex,x
    cmp #$07
    bne +

;SFXEnemyRegen:
    lda #SFX_EN_REGEN 
    ora SQ1SFXFlag
    sta SQ1SFXFlag

    ldx PageIndex
*   inc EnStatus,x

.scope
LF699:
    jsr LF844
    lda $965B,y
    cmp EnResetAnimIndex,x
    beq _done
    jsr DoSomethingToAnimationIndecies
    ldy EnDataIndex,x
    lda $967B,y
    and #$7F
    beq _done
    tay
*   dec EnAnimIndex,x
    dey
    bne -
    _done:
.scend
    ldy EnDataIndex,x
    lda $96CB,y
    clc
    adc #$D1
    sta $00

    lda #$00
    adc #$97
    sta $01

    lda FrameCount
    eor RandomNumber1
    ldy #$00
    and ($00),y
    tay
    iny
    lda ($00),y
    sta $0408,x

;inlined $80B0
*   LDY EnDataIndex,X
    LDA $977B,Y
    ASL              

    bpl ++

    lda #$00
    sta EnCounter,x
    sta $0407,x

    ldy $0408,x
    lda $972B,y
    sta $6AFE,x

    lda $973F,y
    sta $6AFF,x

    lda $9753,y
    sta $0402,x

    lda $9767,y
    sta $0403,x

    lda $0405,x
    bmi +
    lsr
    bcc ++
    jsr $81D1
    jmp ++

*   and #$04
    beq +
    jsr $8206

*   lda #$DF
    and $0405,x
    sta $0405,x
    rts

DoSomethingToEnDataIndex:
    lda $0405,x
    jmp +

LF844:
    lda $0405,x
    bpl +
    lsr
    lsr
*   lsr
    lda EnDataIndex,x
    rol
    tay
Exit33:
    rts

; This is used in Game_Start_Common.asm in all 5 banks
; TODO: Move to Game_Start_Common.asm or inline it?
DoSomethingToFrameCount:
    txa
    lsr
    lsr
    lsr
    adc FrameCount
    lsr
Exit_45:
    rts

; Used only in Other Banks
; TODO: Move to Game_Start_Common.asm or inline it?
Bank07_LF870:  
    lda EnAttr_05,x
    and #$10
    beq Exit_45

    lda $87
    and EnStatus,x
    beq Exit_45

    lda $87
    bpl LF8E8
    
        ldy $6B01,x
        bne Exit_45

LF8E8:                  ; inlined
    ldy #$60
    ; clc
LavaJumpLoop:
    lda EnStatus,y
    beq AfterLavaJumpLoop
    tya
    clc
    adc #$10
    tay
    cmp #$C0
    bne LavaJumpLoop
AfterLavaJumpLoop:

    bcs Exit33
    sta EnHasBeenHit,y
    
    lda #$02
    sta EnRadY,y
    sta EnRadX,y
    ora $0405,y
    sta $0405,y

    lda EnAttr_05,x
    lsr
    lda $85
    pha
    rol
    tax
    lda $978B,x
    pha
    tya
    tax
    pla
    jsr DoSomethingToAnimationIndecies

    ldx PageIndex

    lda #$01
    sta EnStatus,y
    and EnAttr_05,x
    tax
    lda Table15,x
    sta $0403,y

    lda #$00
    sta $0402,y

    ldx PageIndex

;LF8F8:
    lda $85
    cmp #$02
    bcc +
        lda $0405,x
        lsr
        lda $88
        rol
        and #$07
        sta $040A,y
        lda #$02
        sta EnStatus,y
        lda #$00
        sta EnDelay,y
        sta EnAnimDelay,y
        sta $0408,y
*   lda $0405,x
    lsr
    pla
    tax
    lda $97A3,x
    sta $04
    txa
    rol
    tax
    lda $979B,x
    sta $05

LF91D:
    ldx PageIndex
    jsr GetXEnemyRoomPosition_09_08_0B
    tya
    tax
    jsr Bank07_LFD8F
    jsr LFA49

    ldx PageIndex
    bit $87
    bvc Exit19
    lda $0405,x
    and #$01
    tay
    lda $0083,y
    jmp LF690

Exit19:
    rts

DoOneKnRUpdate:
    lda KnRTable_Lo - 1, y
    sta CodePtr
    lda KnRTable_Hi - 1, y
    sta CodePtr + 1
    jmp (CodePtr)

; Pointer table to code
KnRTable_Hi:
    .byte >KnRRoutine_1
    .byte >KnRRoutine_2     ; spit dragon's fireball
    .byte >ExitSub          ;($C45C) rts
    .byte >KnRRoutine_4
    .byte >KnRRoutine_5
KnRTable_Lo:
    .byte <KnRRoutine_1
    .byte <KnRRoutine_2       ; spit dragon's fireball
    .byte <ExitSub            ;($C45C) rts
    .byte <KnRRoutine_4
    .byte <KnRRoutine_5

KnRRoutine_1:
    jsr LFA5B
    jsr Bank07_LFA1E
    ldx PageIndex
    bcs LF97C
        lda EnStatus,x
        beq Exit19
            jsr LFA60
LF97C:
    lda #$01
LF97E:
    jsr UpdateEnemyAnim
    jmp SomethingAboutMovement

*   inc $0408,x
LF987:
    inc $0408,x
    lda #$00
    sta EnDelay,x
    beq +
KnRRoutine_2:
    jsr LFA5B
    LDA $040A,x
    AND #$FE
    TAY
    LDA $97A7,y
    STA $0A
    LDA $97A8,y
    STA $0B

*   LDY $0408,x
    LDA ($0A),y
    CMP #$FF
    BNE +
    STA $0408,x
    JMP LF987

*   CMP EnDelay,x
    BEQ ---
    INC EnDelay,x
    INY
    LDA ($0A),y
    JSR $8296
    LDX PageIndex
    STA $0402,x
    LDA ($0A),y
    JSR $832F
    LDX PageIndex
    STA $0403,x
    TAY
    LDA $040A,x
    LSR
    PHP
    BCC +
    TYA

    EOR #$FF
    ADC #$00    ;Carry always set here

    STA $0403,x
*   PLP
    BNE +
    LDA $0402,x
    BEQ +
    BMI +
    LDY $040A,x
    LDA $95E0,y
    STA EnResetAnimIndex,x
*   JSR Bank07_LFA1E
    LDX PageIndex
    BCS ++
    LDA EnStatus,x
    BEQ KillObjectExit
    LDY #$00
    LDA $040A,x
    LSR
    BEQ +
    INY
*   LDA $95E2,y
    JSR DoSomethingToAnimationIndecies
    lda #$04
    sta EnStatus,x
    LDA #$0A
    STA EnDelay,x
*   JMP LF97C

KillObject:
LFA18:  LDA #$00            ;
LFA1A:  STA EnStatus,x          ;Store #$00 as enemy status(enemy slot is open).
KillObjectExit:
LFA1D:  RTS             ;

; enemy<background crash detection

Bank07_LFA1E:
    lda InArea
    cmp #$11
    bne +
    lda EnStatus,x
    lsr
    bcc ++
;LFA7D:
*   ldx PageIndex

    lda EnNameTable,x
    and #$01
    ora #$18
    sta $05 

    lda EnYRoomPos,x
    and #$F8
    asl 
    rol $05 
    asl 
    rol $05 
    sta $04 

    lda EnXRoomPos,x
    lsr 
    lsr 
    lsr 
    ora $04
    sta $04 

    ldy #$00
    lda ($04),y
    cmp #$A0
    bcc ++
    ;ldx PageIndex
*   lda $0403,x
    sta $05
    lda $0402,x
    sta $04
LFA41:
    jsr GetXEnemyRoomPosition_09_08_0B
    jsr Bank07_LFD8F
    bcc KillObject          ;($FA18)Free enemy data slot.
LFA49:
    lda $08
    sta EnYRoomPos,x

    lda $09
    sta EnXRoomPos,x

    lda $0B
    and #$01
    sta EnNameTable,x

*   rts

KnRRoutine_4:
    lda EnAnimFrame,x
    cmp #$F7
    beq +
    dec EnDelay,x
    bne ++
*   jsr KillObject          ;($FA18)Free enemy data slot.
*   jmp LF97C

KnRRoutine_5:
    jsr KillObject          ;($FA18)Free enemy data slot.
    lda #$03                
    jsr DoSomethingToAnimationIndecies
    jmp LF97C
    ; safe

LFA5B:
    lda EnHasBeenHit,x
    beq Exit20
LFA60:  
    lda #$00
    sta EnHasBeenHit,x

    lda #$05
    sta EnStatus,x
Exit20: rts

DoDestroyOneEnemy:
    stx PageIndex
    dec EnCounter,x
    bne ++
    lda #$0C
    sta EnCounter,x
    dec $0407,x
    bmi +
    bne ++
*   jsr KillObject          ;($FA18)Free enemy data slot.
*   lda EnCounter,x
    cmp #$09
    bne +
    lda $0407,x
    asl
    tay
    lda Table16,y
    sta $04
    
    lda Table16+1,y
    sta $05

    jsr LFA41
*   lda #$80
    sta ObjectCntrl
    lda #$03
    jmp LF97E

DoOnePipeEnemy:  
    sty PageIndex
    ldx $0729,y
    lda EnStatus,x
    beq +

        lda EnAttr_05,x
        and #$02
        bne Exit29

*   sta EnHasBeenHit,x
    lda #$FF
    cmp EnDataIndex,x
    bne +
    dec EnDelay,x
    bne Exit29

    lda PipeEnemyStatus,y
    jsr GetEnemyType
    ldy PageIndex

    lda $072A,y
    sta EnYRoomPos,x

    lda $072B,y
    sta EnXRoomPos,x

    lda $072C,y
    sta EnNameTable,x

    lda #$18
    sta EnRadX,x

    lda #$0C
    sta EnRadY,x

    ldy #$00
    jsr GetSamusCoordData_06_08_0A
    jsr GetXEnemyRoomPosition_07_09_0B
    jsr DistFromEn0ToObj1
    jsr LF1FA
    bcc Exit29

    lda #$01
    sta EnDelay,x
    sta EnStatus,x
    and ScrollDir
    asl
    sta $0405,x
    jsr LFB7B
    jmp UpdateEnemyHitpoints

*   sta EnDataIndex,x

    lda #$01
    sta EnDelay,x

    lda #$00 
    sta EnStatus,x
Exit29:
    rts 

LFB7B:
;inlined $80B0
*   ldy EnDataIndex,x
    lda $977B,y
    asl              

    ror EnAttr_05,x
    lda EnemyInitDelayTbl,y     ;($96BB)Load initial delay for enemy movement.
    sta EnDelay,x       ;

Exit13: 
    rts             ;Exit from multiple routines.

Bank07_LFB88:
    ldx PageIndex
    jsr LF844
    lda $6B01,x
    inc $6B03,x
    dec $6B03,x
    bne +
    pha
    pla
*   bpl +

    EOR #$FF
    CLC                 ;TODO: Stick a breakpoint here and see what the carry bit is
    ADC #$01

*   cmp #$08
    bcc +
    cmp #$10
    bcs Exit13
    tya
    and #$01
    tay
    lda $0085,y
    cmp EnResetAnimIndex,x
    beq Exit13
    sta EnAnimIndex,x
    dec EnAnimIndex,x
Bank07_LFBB9:
    sta EnResetAnimIndex,x
    lda #$00
    sta EnAnimDelay,x
    rts

*   lda $963B,y
    cmp EnResetAnimIndex,x
    beq Exit13
    jmp DoSomethingToAnimationIndecies

; Move to Common?
Bank07_LFBCA:
    jsr LF844
    lda $965B,y
    cmp EnResetAnimIndex,x
    beq Exit13
    sta EnResetAnimIndex,x
    jmp LF690

DoOneSpinnerDestruction:
    dec $A0,x
    txa
    lsr
    tay
    lda Table17,y
    sta $04
    lda Table17+1,y
    sta $05
    lda $A1,x
    sta $08
    lda $A2,x
    sta $09
    lda $A3,x
    sta $0B
    jsr Bank07_LFD8F
    bcc +++

    lda #$40
    sta PageIndex
    lda $08
    sta $A1,x
    sta $034D
    lda $09
    sta $A2,x
    sta $034E
    lda $0B
    and #$01
    sta $A3,x
    sta $034C
    lda $A3,x
    sta $034C
    lda #$5A
    sta PowerUpAnimFrame        ;Save index to find object animation.
    txa
    pha
    jsr DrawFrame
    lda SamusBlink
    bne +
    ldy #$00
    ldx #$40
    jsr AreObjectsTouching      ;($DC7F)
    bcs +
    jsr IsScrewAttackActive     ;($CD9C)Check if screw attack active.
    ldy #$00
    bcc +
    clc
    jsr LF311
    lda #$50
    sta HealthLoChange
    jsr SubtractHealthNoGuard      ;($CE92)
*   pla
    tax
Exit34:
*   rts

*   lda #$00
    sta $A0,x
    rts

LFC65:
UpdateMellowMemu: 
    ldx #$F0
    stx PageIndex
    lda $6BE9
    cmp MemuByte
    bne +++
    lda #$03
    jsr UpdateEnemyAnim
    lda RandomNumber1
    sta $8A
    lda #$18
*   pha
    tax
    jsr ChooseMemuRoutine
    pla
    tax
    lda $B6,x
    and #$F8
    sta $B6,x
    txa
    sec
    sbc #$08
    bpl -
MemuExit:
*   rts

*  jmp KillObject           ;($FA18)Free enemy data slot.

ChooseMemuRoutine:
    lda $B0,x
    beq MemuExit
    cmp #$02
    beq LFCB1
    bcs LFCBA
    jsr LFD84
    
LFD08:
    lda #$00
    sta $B5,x
    tay
    lda ObjectX
    sec
    sbc $B2,x
    bpl +
    iny

    eor #$FF
    clc                 ;TODO: Stick a breakpoint here and see what the carry bit is
    adc #$01

*   cmp #$10
    bcs AfterLFD08
    tya
    sta $B4,x
    lda #$02
    sta $B0,x
AfterLFD08:

    jsr LFD25
    jmp SomethingAboutMovement

LFCB1:  
    jsr LFD84
    
LFCC1:
    jsr LFD5F
    lda $B4,x
    cmp #$02
    bcs +
    ldy $08
    cpy ObjectY
    bcc +
    ora #$02
    sta $B4,x
*   ldy #$01
    lda $B4,x
    lsr
    bcc +
    ldy #$FF
*   sty $05
    ldy #$04
    lsr
    lda $B5,x
    bcc +
    ldy #$FD
*   sty $04
    inc $B5,x
    jsr Bank07_LFD8F
    bcs +
    lda $B4,x
    ora #$02
    sta $B4,x
*   bcc +
    jsr LFD6C
*   lda $B5,x
    cmp #$50
    bcc AfterLFCC1
    lda #$01
    sta $B0,x
AfterLFCC1:
    jmp SomethingAboutMovement

LFCBA:
    lda #$00
    sta $B0,x
SFX_EnemyHit:
    lda #SFX_EN_HIT
    ora SQ1SFXFlag
    sta SQ1SFXFlag
    rts

LFD25:
    txa
    lsr
    lsr
    lsr
    adc $8A
    sta $8A
    lsr $8A
    and #$03
    tay
    lda Table18,y
    sta $04
    lda Table18+1,y
    sta $05
    jsr LFD5F
    lda $08
    sec
    sbc ScrollY
    tay
    lda #$02
    cpy #$20
    bcc +
    eor #$FF
    adc #$00    ; Carry always set here
    cpy #$80
    bcc ++
*   sta $04
*   jsr Bank07_LFD8F

LFD6C:
    lda $08
    sta $B1,x
    sta $04F0
    lda $09
    sta $B2,x
    sta $04F1
    lda $0B
    and #$01
    sta $B3,x
    sta $6BEB
    rts

LFD5F:
    lda $B3,x
    sta $0B
    lda $B1,x
    sta $08
    lda $B2,x
    sta $09
    rts

LFD84:
    lda $B6,x
    and #$04
    beq Exit21
    lda #$03
    sta $B0,x
Exit21:
    rts

Bank07_LFD8F:
    lda ScrollDir
    anc #$02
    sta $02

    lda $04
    ;clc
    bmi +++
    beq LFDBF

    adc $08
    bcs +
    cmp #$F0
    bcc ++
*   adc #$0F
    ldy $02
    bne ClcExit2
    inc $0B
*   sta $08
    jmp LFDBF

*   adc $08
    bcs +
    sbc #$0F
    ldy $02
    bne ClcExit2
    inc $0B
*   sta $08

LFDBF:
    lda $05
    clc
    bmi ++
    beq SecExit
    adc $09
    bcc +
    ldy $02
    beq ClcExit2
    inc $0B
*   jmp ++

*   adc $09
    bcs +
    ldy $02
    beq ClcExit2
    inc $0B

*   sta $09
    SecExit:
    sec
    rts

ClcExit2:
    clc
Exit26: 
    rts

; Tile degenerate/regenerate

; TODO: Inline
LFE14:
UpdateTiles:
    ldx #$C0
*   stx PageIndex
    lda TileRoutine,x
    beq +
        jsr DoOneTile
*   lax PageIndex
    sbx #$10
    bne --
; A bit of jank for seeing if you should skip the last one
    stx PageIndex
    lda TileRoutine
    beq Exit26

DoOneTile:
    ; 0                     = RTS
    ; 1 (001)               = LFE3D TileSubroutine1
    ; 2 and 4 (010 and 100) = LFE54 SetupTileAnimationAndDelay
    ; 3 (011)               = LFE59 TileSubroutine3
    ; 5 (101)               = LFE83 TileSubroutine5

    bit Div16Table+16 ; works like "Bit #$01" would work
    beq SetupTileAnimationAndDelay
    cmp #$03
    beq TileSubroutine3
    bcs TileSubroutine5
    ; fall through to LFE3D

TileSubroutine1:
    inc TileRoutine,x

    lda #$00
    sta TileAnimIndex,x
    sta $0505,x
    sta TileAnimDelay,x

    lda #$50
    sta TileDelay,x

    ; TODO : can probably delete the next 4 lines
    
    ; Looks like it might be duplicated in DrawTileBlast
    lda TileWRAMLo,x     ; low WRAM addr of blasted tile
    sta $00

    ; Looks like it might be duplicated in DrawTileBlast
    lda TileWRAMHi,x     ; high WRAM addr
    sta $01

SetupTileAnimationAndDelay:
    lda #$02
    ;LDX PageIndex
    ldy TileAnimDelay,x
    beq +
    dec TileAnimDelay,x
    bne ++
    * sta TileAnimDelay,x

    ldy TileAnimIndex,x
    lda TileBlastAnim,y
    cmp #$FE
    beq ++
    sta TileAnimFrame,x
    iny
    tya
    sta TileAnimIndex,x
    jsr DrawTileBlast
    bcc +
    ;ldx PageIndex
    dec TileAnimIndex,x
    * rts

    * inc TileRoutine,x
    pla 
    pla 
    rts 

TileSubroutine3:
    lda FrameCount
    and #$03
    bne +       ; only update tile timer every 4th frame
    dec TileDelay,x
    bne +       ; exit if timer not reached zero
    inc TileRoutine,x
    ldy TileType,x
    lda Table19,y
SetTileAnim:
    sta TileAnimIndex,x
    sta $0505,x
    lda #$00
    sta TileAnimDelay,x
Exit28:
*   rts

TileSubroutine5:
    lda #$00
    tay                     ; y = 0;
    sta TileRoutine,x       ; tile = respawned

    lda TileWRAMLo,x
    ;clc
    adc #$20        ; Carry is always set here so add #$20 instead of #$21 
    sta $00

    and #$E0
    sta $02

    lda TileWRAMHi,x
    sta $01
    lsr
    ror $02
    lsr
    ror $02

    lda $00
    ;and #$1F ; don't think it does anything
    asl
    asl
    asl       ; * 8
    sta $03
    sta $09

    lda $02
    sta $07

    lda $01
    lsr
    asr #$03
    sta $0B

    jsr GetSamusCoordData_06_08_0A  ; <== sets the carry bit to zero

    lda #$04
    ;clc
    adc ObjRadY
    sta $04

    lda #$04
    ;clc            ; ObjRadY + #$04 above won't set the carry bit. ObjRadY can't get that big
    adc ObjRadX
    sta $05

    jsr LF1FA
    bcs Exit23
    jsr LF311

    lda #$50
    sta HealthLoChange
    jmp SubtractHealthNoGuard      ;($CE92)
    ; safe

DrawTileBlast:
    lda PPUStrIndex
    cmp #$1F
    bcs Exit23

    ldx PageIndex
    lda TileWRAMLo,x
    sta $00

    lda TileWRAMHi,x
    sta $01
    
GetTileFramePtr:
    lda TileAnimFrame,x
    tay

    lda TileFramePtrTbl_Lo,y
    sta $02

    lda TileFramePtrTbl_Hi,y
    sta $03

    ldy #$00
    sty $11

    lax ($02),y
    lda Div16Table, x
    sta $04

    txa
    and #$0F
    sta $05

    iny
    sty $10

*   ldx $05
*   ldy $10
    lda ($02),y
    inc $10

    ldy $11
    sta ($00),y
    inc $11

    dex
    bne -

    lda $11
    clc
    adc #$20
    sec
    sbc $05
    sta $11

    dec $04
    bne --      ; outer loop

    lda $01
    and #$04
    beq +
    lda $01
    ora #$0C
    sta $01
*   lda $01
    and #$2F
    sta $01
    jsr EraseTile
    clc
Exit23:
    rts

; Preconditions
; A will be sound flags
; X will be set to the low bit of the desired jump table
; A != 0
; will pass back the index of Y used in the sound engine
.scope
    CheckFlagsRedux:
        sta CurrentSFXFlags
        bit CurrentSFXFlags
        bmi _JumpToSoundZone
        bvs _Second_Highest_Bit_Set
        tay
        txa
        clc
        adc CheckFlagTablePlus1 - 1, y       ; check the rest against a 63 bit table
        tax
        _JumpToSoundZone:
            lda SXFInitTables, x
            sta $E0
            lda SXFInitTables + 1, x
            sta $E1
            jmp ($00E0)
    
    _Second_Highest_Bit_Set:
        inx
        inx
        bne _JumpToSoundZone    ; branch always

    ; 63 bit table since table should be accessed at 
    CheckFlagTablePlus1:
        .byte      $0E, $0C, $0C, $0A, $0A, $0A, $0A, $08, $08, $08, $08, $08, $08, $08, $08
        .byte $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06
        .byte $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
        .byte $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
.scend


;-----------------------------------------[ Choose routine ]-----------------------------------------

;This is an indirect jump routine. A is used as an index into a code
;pointer table, and the routine at that position is executed. The programmers
;always put the pointer table itself directly after the JSR to _ChooseRoutine,
;meaning that its address can be popped from the stack.

ChooseRoutine:
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

;-----------------------------------------------[ TABLES ]--------------------------------------------

BrinstarGFXTable:
    .byte $16, $19, $06, $05, $04, $03, $1D, $1E
    
NorfairGFXTable:
    .byte $16, $19, $09, $08, $07, $05, $04

TourianGFXTable:
    .byte $16, $19, $1C, $1A, $0E ;$0D, Getting rid of the Japanese font
    .byte $0C, $0B, $0A, $05

RidleyGFXTable:
    .byte $16, $19, $13, $12, $0A, $05, $04

KraidGFXTable:
    .byte $16, $19, $11, $10, $0F, $0A, $05, $04

SamusGFXTable:
    .byte $16, $19, $18, $17, $14, $1B      ;$1B should only be loaded if JustInBailey

;The table below contains info for each tile data block in the ROM.
;Each entry is 7 bytes long. The format is as follows:
;byte 0: ROM bank where GFX data is located.
;byte 1-2: 16-bit ROM start address (src).
;byte 3-4: 16-bit PPU start address (dest).
;byte 5-6: data length (16-bit).

GFXInfo:
;[SPR]Samus, items. Entry $00.
LC6E0:  .byte $06
LC6E1:  .word GFXSuitedSamus, $0000, $09A0

;[SPR]Samus in ending. Entry $01.
LC6E7:  .byte $04
LC6E8:  .word GFXEndingSamus, $0000, $0520

;[BGR]Partial font, "The End". Entry $02.
LC6EE:  .byte $01
LC6EF:  .word GFXTheEndFont, $1000, $0400

;[BGR]Brinstar rooms. Entry $03.
LC6F5:  .byte $06
LC6F6:  .word GFXBrinstar1, $1000, $0150

;[BGR]Misc. objects. Entry $04.
LC6FC:  .byte $05
LC6FD:  .word GFXMiscObjects1, $1200, $0450

;[BGR]More Brinstar rooms. Entry $05.
LC703:  .byte $06
LC704:  .word GFXBrinstar2, $1800, $0280    ; originaly $0800, but those sprites might not be used

;[SPR]Brinstar enemies. Entry $06.
LC70A:  .byte $00
LC70B:  .word GFXBrinstarEnemies, $0C00, $0400

;[BGR]Norfair rooms. Entry $07.
LC711:  .byte $06
LC712:  .word GFXNorfair1, $1000, $0260

;[BGR]More Norfair rooms. Entry $08.
LC718:  .byte $06
LC719:  .word GFXNorfair2, $1700, $0070

;[SPR]Norfair enemies. Entry $09.
LC71F:  .byte $02
LC720:  .word GFXNorfairEnemies, $0C00, $0400

;[BGR]Tourian rooms. Entry $0A.
LC726:  .byte $06
LC727:  .word GFXTourian1, $1000, $02E0

LC72D:  .byte $06           ;[BGR]More Tourian rooms. Entry $0B.
LC72E:  .word GFXTourian2, $1200, $0600

LC734:  .byte $06           ;[BGR]Mother Brain room. Entry $0C.
LC735:  .word GFXMthrBrnRoom, $1900, $0090

; This is now unused
LC73B:  .byte $05           ;[BGR]Misc. object. Entry $0D.
LC73C:  .word GFXGameOverJapaneseFont, $1D00, $0300

LC742:  .byte $02           ;[SPR]Tourian enemies. Entry $0E.
LC743:  .word GFXTourianEnemies, $0C00, $0400

LC749:  .byte $00           ;[BGR]More Tourian rooms. Entry $0F.
LC74A:  .word GFXTourian3, $1700, $00C0

LC750:  .byte $04           ;[BGR]Misc. object and fonts. Entry $10.
LC751:  .word GFXMiscTiles, $1E00, $0200

LC757:  .byte $03               ;[SPR]Miniboss I enemies. Entry $11.
LC758:  .word GFXKraidEnemies, $0C00, $0400

LC75E:  .byte $00               ;[BGR]More Tourian Rooms. Entry $12.
LC75F:  .word GFXTourian4, $1700, $00C0

LC765:  .byte $03           ;[SPR]Miniboss II enemies. Entry $13.
LC766:  .word GFXRidleyEnemies, $0C00, $0400

LC76C:  .byte $01           ;[SPR]Inrto/End sprites. Entry $14.
LC76D:  .word GFXIntroEnd, $0C00, $0100

LC773:  .byte $06           ;[BGR]Title. Entry $15.
LC774:  .word GFXMetroidTitle, $1400, $0500

LC77A:  .byte $06           ;[BGR]Solid tiles.      Entry $16.
LC77B:  .word GFXBlankTiles, $1FC0, $0040

LC781:  .byte $06           ;[BGR]Complete font.        Entry $17.
LC782:  .word GFXFont, $1000, $0400

LC788:  .byte $06           ;[BGR]Complete font.        Entry $18.
LC789:  .word GFXFont, $0A00, $00A0

LC78F:  .byte $06           ;[BGR]Solid tiles.      Entry $19.
LC790:  .word GFXBlankTiles, $0FC0, $0040

LC796:  .byte $06           ;[BGR]Complete font.        Entry $1A.
LC797:  .word GFXFont, $1D00, $02A0

;[SPR]Suitless Samus.           Entry $1B.
LC79D:  .byte $06
LC79E:  .word GFXSuitlesSamus, $0000, $07B0

;[BGR]Exclaimation point.       Entry $1C.
LC7A4:  .byte $06
LC7A5:  .word GFXExPoint, $1F40, $0010

;Broken up brinstar graphics data  Entry $1D.
    .byte $06 
    .word GFXBrinstar3, $1B00, $0280    ; originaly $0800, but those sprites might not be used

;Broken up brinstar graphics data         Entry $1E.
    .byte $06
    .word GFXBrinstar4, $1E00, $0120

;The following table marks the time remaining in Timer2 when a palette change should occur during
;the Samus fade-in sequence. This creates the fade-in effect.

SamusFadeTmTbl:
    .byte $1E, $14, $0B, $04    ; Interleaved with FFLabel

;Table used by above subroutine.
;Each value is the area bank number plus one.

BankTable:
    .byte $02               ;Brinstar.
    .byte $03               ;Norfair.
    .byte $05               ;Kraid hideout.
    .byte $04               ;Tourian.
    .byte $06               ;Ridley hideout.

ActionTable:
    .byte sa_Run            ;Run right.
    .byte sa_Run            ;Run left.
    .byte sa_Roll
    .byte sa_PntUp

RunAnimationTbl:
    .byte an_SamusRun       ; $00
    .byte an_SamusRunPntUp  ; $37

RunAccelerationTbl:
    .byte $30           ;Accelerate right.
    .byte $D0           ;Accelerate left.

CartRamMulOffsetLoTable:
    .byte $00, $40, $80, $C0   ; low-byte part of X * $40 (X & 3)
    .byte $00, $40, $80, $C0
    .byte $00, $40, $80, $C0
    .byte $00, $40, $80, $C0

; The following table is used for finding the high byte of the proper name table to clear.
HiPPUTable:
    .byte $20               ;Name table 0.
    .byte $24               ;Name table 1.
    .byte $28               ;Name table 2.
    .byte $2C               ;Name table 3.

; TODO - My gut says these tables aren't needed (Table06 and Table04)
Table06:
    .byte $0C
    .byte $0C
    .byte $0C
Table04:
    .byte $35
    .byte $35
    .byte $35

; Used in Samus weapon fire routine
Table05:
    .byte $3F
    .byte $3B
    .byte $3D
    .byte $3F

; Table09 - Uninvestigated
Table09_A:
    .byte $01
    .byte $FF
Table09_B:
    .byte $EC
    .byte $F0

Table08:
    .byte $0C
    .byte $F4
    .byte $08
    .byte $F8

BulletSpeedTable:
    .byte $04
    .byte $FC

MissileAnims:
    .byte an_MissileRight
    .byte an_MissileLeft

; Some kinda wave math
Table0A:
    .word Table0C     ; pointer to table #1 below
    .word Table0D     ; pointer to table #2 below

; Table #1 (size: 25 bytes)

Table0C:
    .byte $01, $F3, $01, $D3, $01, $93, $01, $13, $01, $53, $01, $73, $01, $73, $01, $53
    .byte $01, $13, $01, $93, $01, $D3, $01, $F3
FFLabel:                    ; Interleaved with Table0C
    .byte $FF

; Table #2 (size: 25 bytes)

Table0D:
    .byte $01, $B7, $01, $B5, $01, $B1, $01, $B9, $01, $BD, $01, $BF, $01, $BF, $01, $BD
    .byte $01, $B9, $01, $B1, $01, $B5, $01, $B7
    .byte $FF

Table0E:
    .byte $30
    .byte $AC
    .byte $F0
    .byte $6C
Table1B:
    .byte $61
    .byte $60
    .byte $60
    .byte $60

; Table16 - Uninvestigated
Table16:
    .byte $00
    .byte $00
    .byte $0C
    .byte $1C
    .byte $10
    .byte $F0
    .byte $F0
    .byte $08

; Table17 - Uninvestigated
Table17:
    .byte $00
    .byte $FB
    .byte $FB
    .byte $FE
    .byte $FB
    .byte $02
    .byte $00
    .byte $05

; Table18 - Uninvestigated
Table18:
    .byte $02
    .byte $FE
    .byte $01
    .byte $FF
    .byte $02

; Table used for indexing the animations in TileBlastAnim
Table19:
    .byte $18, $1C, $20, $00, $04, $08, $0C, $10, $24, $14

; Unknown
LDA39:  
    .byte $88
    .byte $68

; This table lookup is easier as
; lda #$00/#$01 + ora #$65

LDA3B:
    .byte $65
    .byte $66

ExplodeRotationTbl:
    .byte $00           ;No sprite flipping.
    .byte $80           ;Flip sprite vertically.
    .byte $C0           ;Flip sprite vertically and horizontally.
    .byte $40           ;Flip sprite horizontally.

;----------------------------------------[ Item drop table ]-----------------------------------------

;The following table determines what, if any, items an enemy will drop when it is killed.
ItemDropTbl:
    .byte $80           ;Missile.
    .byte $81           ;Energy.
    .byte $89           ;No item.
    .byte $80           ;Missile.
    .byte $81           ;Energy.
    .byte $89           ;No item.
    .byte $81           ;Energy.
    .byte $89           ;No item.

;--------------------------------[ Explosion placement data ]---------------------------------------

;The following table has the index values into the table after it for finding the placement data
;for an exploding object.

ExplodeIndexTbl:
    .byte $00, $18, $30

;The following table is used to produce the arcing motion of exploding objects.  It is displacement
;data for the y directions only.  The x displacement is constant.

ExplodePlacementTbl:
;Bottom sprites.
    .byte $FC, $F8, $F4, $F0, $EE, $EC, $EA, $E8, $E7, $E6, $E6, $E5, $E5, $E4, $E4, $E3
    .byte $E5, $E7, $E9, $EB, $EF, $F3, $F7, $FB

;Middle sprites.
    .byte $FE, $FC, $FA, $F8, $F6, $F4, $F2, $F0, $EE, $ED, $EB, $EA, $E9, $E8, $E7, $E6
    .byte $E6, $E6, $E6, $E6, $E8, $EA, $EC, $EE

;Top sprites.
    .byte $FE, $FC, $FA, $F8, $F7, $F6, $F5, $F4, $F3, $F2, $F1, $F1, $F0, $F0, $EF, $EF
    .byte $EF, $EF, $EF, $EF, $F0, $F0, $F1, $F2

;-------------------------------------[ Status bar sprite data ]-------------------------------------

PPUWriteDirectionTable:
    .byte $20           ;Horizontal write. PPU inc = 1, length = 32 tiles.
    .byte $20           ;Horizontal write. PPU inc = 1, length = 32 tiles.
    .byte $9E           ;Vertical write... PPU inc = 32, length = 30 tiles.
    .byte $9E           ;Vertical write... PPU inc = 32, length = 30 tiles.

DoorXs:
    .byte $F0    ; X coord of RIGHT door
    .byte $10    ; X coord of LEFT door

LoadDoorTable:
    .byte $02
    .byte $01
    
LoadDoorTable_2:  
    .byte $80
    .byte $B0
    .byte $A0
    .byte $90

; Frame data for tile blasts
TileBlastAnim:
    .byte $06, $07, $00, $FE
    .byte $07, $06, $01, $FE
    .byte $07, $06; $02, $FE
Table15: .byte $02, $FE             ; Table15 is just $02, $FE. They are interwoven
    .byte $07, $06, $03, $FE
    .byte $07, $06, $04, $FE
    .byte $07, $06, $05, $FE
    .byte $07, $06, $09, $FE
    .byte $07, $06, $0A, $FE
    .byte $07, $06, $0B, $FE
    .byte $07, $06, $08, $FE
    .byte $00, $00

Div16Table:
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    .byte $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
    .byte $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
    .byte $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
    .byte $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    .byte $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
    .byte $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06
    .byte $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07
    .byte $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
    .byte $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09
    .byte $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A
    .byte $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B
    .byte $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
    .byte $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D
    .byte $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
    .byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F

;-----------------------------------------------[ RESET ]--------------------------------------------

RESET_Bank07:
LFFB0:  SEI                     ;Disables interrupt
LFFB1:  CLD                     ;Sets processor to binary mode
LFFB2:  LDX #$00                ;
LFFB4:  STX PPUControl0         ;Clear PPU control registers
LFFB7:  STX PPUControl1         ;
LFFBA:* LDA PPUStatus           ;
LFFBD:  BPL -                   ;Wait for VBlank
LFFBF:* LDA PPUStatus           ;
LFFC2:  BPL -                   ;
LFFC4:  ORA #$FF                ;
LFFC6:  STA MMC1Reg0            ;Reset MMC1 chip
LFFC9:  STA MMC1Reg1            ;(MSB is set)
LFFCC:  STA MMC1Reg2            ;
LFFCF:  STA MMC1Reg3            ;
LFFD2:  JMP Startup             ;($C01A)Do preliminary housekeeping.

; ^^^^^ Everything has been labled out and we can now 
.advance $FFFA

;-----------------------------------------[ Interrupt vectors ]--------------------------------------

; find the end 

.word NMI               ;($C0D9)NMI vector.
.word RESET_Bank07      ;($FFB0)Reset vector.
.word RESET_Bank07      ;($FFB0)IRQ vector.