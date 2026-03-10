# PictoPuzzler
 Homebrew NES nonogram game, copyright Catfort Software 2025-2026
 
## Useful tools

PictoPuzzler puzzle banks can be generated with https://github.com/johnwelter/NonogramTool. Bank files can be stored in `PuzzleData/`, and the binary files for the game itself should be stored in `Source/Content/Puzzles/`. 

A planned music editor is in the works at https://github.com/johnwelter/Catfort-Sound. It's not ready to export music files for the engine yet, but should be in a future update.

## Compiling a build
 
 You can easily make a build with `Make.bat` in the head folder. 
 
## Compiling a build with sound engine or DMC changes
 
 Any changes to the DMC sample table in `Source/PictoPuzzler.asm`, or any changes to the sound engine located in the `Source/External/` folder, will require more of a delecate touch. 
 Because of some poor decision making, the nametables for each game mode are stored diectly in the static bank, which required putting the sound engine in the swappable banks. To avoid
 needing to make separate sound engines for each bank to avoid label duplication, the sound engine is precompiled into a binary file and included directly into the bank. 
 To accomplish this, just follow these steps:
 
 1. Make sure you have an FNS file already compiled for the game (`Source/PictoPuzzler.fns`) - this is an important file the sound engine needs to ensure it has the address to the DMC table
 2. In `Source/Defines/Defines.asm`, you'll find the following includes at the bottom:

```
;precompiled labels

    .include "Source/SoundEnginePreComp.fns"
    ;.include "Source/PictoPuzzler.fns"
```
comment out `.include "Source/SoundEnginePreComp.fns"` and uncomment `.include "Source/PictoPuzzler.fns"` to make sure we build the sound engine with access to the PictoPuzzler 
lables.

 3. run `BuildSoundEngine.bat`, which will create `Source/SoundEnginePreComp.nes`, as well as an FNS file and an LST file. 
 4. open `Source/SoundEnginePreComp.nes` in your hex editor of choice (I'm partial to ImHex), and open up `Source/SoundEnginePreComp.lst` in a text editor. in the LST file, look for the beginning of the sound engine's actual code. it should look something like this:

 ```
...
#[1]   Source/SoundEnginePreComp.asm
    3           A0D8              .org $A0D8
#[2]   Source/External/SoundEngine/Source/sound_Engine.asm
    4                             .include "Source/External/SoundEngine/Source/sound_Engine.asm"
    1  00:A0D8            sound_init:
    2  00:A0D8  A9 1F         lda #$1F
    3  00:A0DA  8D 15 40      sta $4015   ;enable Square 1, Square 2, Triangle and Noise channels
    4                         
    5  00:A0DD  A9 00         lda #$00
...
 ```
 The engine in this case starts with ```A9 1F 8D 15 40 A9 00``` and so on. In your hex editor,  remove ALL bytes before this string - we want to get rid of the NES header and extra buffer space the NES compiler inserted for us. 

 5. Back in the LST file, scroll to the very bottom and look for the last actual byte of the engine. Might look something like this:

 ```
...
  68  00:A93F            se_arp_majPlusOct:
   69                     
   70  00:A93F  00 04 07          .byte $00, $04, $07, $0C
       00:A942  0C        
   71  00:A943  FF                .byte $FF
...
```
 In this case, the engine ends with `00 04 07 0C FF`. remove ALL bytes from the end of the file after this string.

 6. once `Source/SoundEnginePreComp.nes` is trimmed, go back into `Source/Defines/Defines.asm` and swap the FNS files again, where `.include "Source/SoundEnginePreComp.fns"` should be uncommented and `.include "Source/PictoPuzzler.fns"` should be commented out. 

 7. rebuild the game with `Make.bat`

This should all be fixed up in a future update once I automate screen draws to remove the need for storing full screens of data.
