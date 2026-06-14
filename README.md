# PictoPuzzler
 Homebrew NES nonogram game, copyright Catfort Software 2025-2026
 
## Useful tools

PictoPuzzler puzzle banks can be generated with https://github.com/johnwelter/NonogramTool. Bank files can be stored in `PuzzleData/`, and the binary files for the game itself should be stored in `Source/Content/Puzzles/`. 

A planned music editor is in the works at https://github.com/johnwelter/Catfort-Sound. It's not ready to export music files for the engine yet, but should be in a future update.

## Compiling a build
 
 You can easily make a build with `Make.bat` in the head folder. 
 
## UPDATE June 14 2026

 I finally got around to "compressing" nametables by splitting them up into objects that are loaded on top of a black background. This siginifigantly freed up space, finally allowing me to 
 put the sound engine in the non-swapped code bank! No need to do nasty extra compilation steps, everything should just work with running the single make bat from now on.
