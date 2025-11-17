# Lagless Metroid Project

Inspired by the Metroid analysis videos done by Displaced Gamers:
* https://www.youtube.com/watch?v=3G6vkRz-_0I
* https://www.youtube.com/watch?v=1oCE-hYT3LY

Code based on the Metroid dissassembly archived by nmikstas:
* https://github.com/nmikstas/metroid-disassembly

The idea here is to attempt to take the Metroid lag as low as possible without adding more rom banks or changing the mapper chip.

## Original Problem Areas
* The main problem area is the map generation which causes 1 to 3 lag frame spikes while preparing the game
* General poor performance when there is lots of crap on the screen, pretty much what you would expect
* The "ChooseRoutine" call is used everywhere and costs about 65 frames.
* Xminus16, YPlus16, Adiv8, Adiv16, Adiv32, Amul8, Amul16, and Amul32 eat up lots of cycles
* Collision detection code in general eats lots of cycles as well.
* Ridley is too big for Smash <sub>and 60FPS</sub> 

### Benchmark Status
The baseline benchmark is Samus standing still in the opening room with 2 of the spikey bois both alive and crawing on the walls.

  * Metroid finishes all work for the benchmark frames in **137 to 149** scanlines
  * Lagless Metroid finishes in **86 to 103** scanlines
  * Lagless Metroid finishes in **%63 to %69** of the scanlines it takes Metroid
  * The limit might be something like **80** scanlines, so keep pushing

### Code Progress
* ChooseRoutine has been removed from bank07 and is now only called from outside
* Math operations for +/- 4,8, and 16 have been reworked to use the identity table in bank07.
  * It was only a once over, there are probably a few more here and there that either wouldn't save time, or need to be looked at more
* Unused code has been removed from bank07 to make room for the identity table.
* Most code that can be inlined in bank07 has been inlined. I would say I've probably done about 70% to 90% of the low hanging fruit
* Heavy loops have been at least partially unrolled wherever possible
* A huge win has been adjustments to the code to clear the Vram between frames.
  * Metroid always uses the first avaiable ram spot in order, so you don't have to keep blanking out RAM if you run into a spot that's already been blanked
    * This change alone saves about 5-8 scanlines
* The map generation code has had so many guard rails removed and it is still slow
  * It looks like sometimes we have prevented dropped frames though, so there are pseudo noticable improvements
* One function in the sound engine was heavily hammered and I think it ended up dropping like 10-12 scanlines from the full frame.
  * So far this was the biggest win of the project

### TODOs
* Get rid of the rest of ChooseRoutine. Move it into Bank01-Bank05
* Get rid of the Mul and Div routines
  * Consider placing Mul and Div tables in unused spots in Bank01-Bank05
* Refactor the common code in Bank01-Bank05
* Fight a little harder for inlining some of the UpdateSamus code

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
In this project I have painstakingly reworked it to build with the following command from the project root folder:

```
./build
```

## General Notes
The labels in Bank07 are the source of truth. For areas of code that Bank07 needs to call that must be in a specific place in memory, I am using a .alias for those in Metroid_Defines.asm and then making sure to .advance to them in the various banks where they need to all be in the exact spot.

I am inlining as much code as I can because a JSR + RTS ends up being 12 extra cycles every time. This seems to be working.

There are a good number of code caves in bank Bank01 - Bank05. The thought its that some of the code from the original Famicom Disk system stuck around and isn't called anywhere. I am using some of those caves to move code out of Bank07 and free up bytes that can used to inline more code and maybe add some tables that might help for some of the math operations.

Using these sites a lot:
* http://www.6502.org/users/obelisk/6502/instructions.html
* https://www.nesdev.org/wiki/6502_assembly_optimisations

I want to create some tables for the common multiplication operations that happen. Like a mul / div table for 16, and 32 (8 is just 2 shifts and a table lookup would be slower). If I could find the bytes for it, I would also like to try adding an identity table for the XMinus16 and YPlus16 calls so that way I could add numbers with code that looks like this:

```
LDA IdentityTable+16, X
tax
```

Now that I've gotten the identity table in, I can't help but wonder if those 256 + 32 bytes would be better spent just unrolling loops. Would need to do it and test it, and that might not be that simple of a change.

### Benchmarking
The "Visualize Hotspots" lua script can be run and tweaked to find places in the code that are hit more often. It helped me get some big wins.

## Bugs
* No known bugs