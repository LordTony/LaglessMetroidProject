; --------------------------------- NOTES -----------------------------------
;
; I have made Bank07 the source of truth in order to build it in one command
; Everything is linked up with labels so nearly all of Bank 07 can be moved
; around and the final assembly addressed won't matter because all the rest
; of the code references it all by 
;
; ------------------- How to Build (Windows only for now) -------------------
;
; Go to the root folder and run:
;
; build.ps1
;

.text HEADER 
.org $0000
.include "Header.asm"

.include "Metroid_Defines.asm"

;----- Bank 00..06: switchable at $8000–$BFFF -----

.text BANK00
.org $8000
.include "Bank00.asm"
.advance $C000

.text BANK01
.org $8000
.include "Bank01.asm"
.advance $C000

.text BANK02
.org $8000
.scope
.include "Bank02.asm"
.scend
.advance $C000

.text BANK03
.org $8000
.include "Bank03.asm"
.advance $C000

.text BANK04
.org $8000
.include "Bank04.asm"
.advance $C000

.text Bank05
.org $8000
.include "Bank05.asm"
.advance $C000

.text BANK06
.org $8000
.include "Bank06.asm"
.advance $C000

; Bank 07: fixed at $C000–$FFFF
.text BANK07
.org $C000
.include "Bank07.asm"