# Lagless Metroid Project

Inspired by the Metroid analysis videos done by Displaced Gamers:
* https://www.youtube.com/watch?v=3G6vkRz-_0I
* https://www.youtube.com/watch?v=1oCE-hYT3LY

Code based on the Metroid dissassembly archived by nmikstas:
* https://github.com/nmikstas/metroid-disassembly

The idea here is to attempt to take the Metroid lag as low as possible without adding more rom banks or changing the mapper chip.

## Problem Areas
* The main problem area is the map generation which causes 1 to 3 lag frame spikes while preparing the game
* General poor performance when there is lots of crap on the screen, pretty much what you would expect
* The "ChooseRoutine" call is used everywhere and costs about 65 frames.
* Xminus16, YPlus16, Adiv8, Adiv16, Adiv32, Amul8, Amul16, and Amul32 eat up lots of cycles
* Collision detection code in general eats lots of cycles as well. 

## Current Progress
* The baseline benchmark of Samus standing still in the opening room finishes all frame work in about 80% of the time the standard Metroid code does.
* ChooseRoutine has been reworked to just inline JMP and JSR instructions in maybe 40% of the places saving lots of cycles
* All of the Xminus16 and YPlus16 have been inlined and the original routines have been removed

## Folder Structure

* Original_Source_Files - These are the original dissassembly source files that I haven't messed with. They are useful for reference.
* Ophis - The Ophis assembler. Looks like it is only the Windows exe. Mad respect for the linux boiz out there, but it looks like this one is for Windows only for now.
* Source_Files - This is where all of the optimization changes are being done.

## Source File Notes

* Metroid_Defines - All of the variable names and most of the shared address info aliases
* Header - NES header
* Bank00 - Intro/End Game
* Bank01 - Brinstar
* Bank02 - Norfair
* Bank03 - Tourian
* Bank04 - Kraid Hideout
* Bank05 - Ridley Hideout
* Bank06 - Graphics
* Bank07 - Game Engine (This is where a bulk of the optimization would need to happen)
* Sound_Engine_Common_1 - The start of the sound engine code that is the same in Bank00 - Bank05
* Sound_Engine_Common_2 - This end of the sound engine code that is the same in Bank00 - Bank05

## Building the code

The original dissassembly built each of the banks 1 at a time and glued them all together to get the final rom.
In this project I have painstakingly reworked it to build with the following Ophis command:

```
../Ophis/ophis.exe ./build.asm ../assembled_metroid.nes
```

That command must be run from within the ./Source_Files folder.

## General Notes
The labels in Bank07 are the source of truth. For areas of code that Bank07 needs to call that must be in a specific place in memory, I am using a .alias for those in Metroid_Defines.asm and then making sure to .advance to them in the various banks where they need to all be in the exact spot.

I am inlining as much code as I can because a JSR + RTS ends up being 12 extra cycles every time. This seems to be working.

There are a good number of code caves in bank Bank01 - Bank05. The thought its that some of the code from the original Famicom Disk system stuck around and isn't called anywhere. I am using some of those caves to move code out of Bank07 and free up bytes that can used to inline more code and maybe add some tables that might help for some of the math operations.

Using these sites a lot:
* http://www.6502.org/users/obelisk/6502/instructions.html
* https://www.nesdev.org/wiki/6502_assembly_optimisations

I want to create some tables for the common multiplication operations that happen. Like a mul / div table for 16, and 32 (8 is just 2 shifts and a table lookup would be slower). If I could find the bytes for it, I would also like to try adding an identity table for the XMinus16 and YPlus16 calls so that way I could add numbers with code that looks like this:

```
LDA IdentityTable+#$10, X
tax
```

Should be even faster than the inlined +16 and -16 calls

## Bugs
* At some point I broke the code that make Samus explode when she dies