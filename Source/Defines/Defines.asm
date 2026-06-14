;; define 0 page stuff here, and SRAM stuff if we have it

  .rsset $0000
  .include "Source/Defines/GeneralVars.asm"
  .include "Source/Defines/ControllerVars.asm"
  .include "Source/Defines/PPUVariables.asm"
  .include "Source/Defines/MapperVars.asm"
  .include "Source/Defines/TitleVariables.asm"
  .include "Source/Defines/GameVariables.asm"
  .include "Source/External/SoundEngine/Variables/SoundVariables_ZP.asm"

;; 0100 is the stack
;; 0200 is sprite ram
  .rsset $0300
  ;; these need to be separate files while the sound engine is pre-compiled
  .include "Source/External/SoundEngine/Tables/FX/kVol_idx.asm"
  .include "Source/External/SoundEngine/Tables/FX/kMod_idx.asm"
  .include "Source/External/SoundEngine/Tables/FX/kArp_idx.asm"
  .include "Source/External/SoundEngine/Tables/note_idx.i"
  .include "Source/External/SoundEngine/Variables/SoundVariables.asm"
  .rsset $0400
  .rsset $0500
  .rsset $0600
  .rsset $0700
  .rsset $6000
  .include "Source/Defines/ScreenStateVariables.asm"
  .rsset $7000
  .include "Source/Defines/SaveVariables.asm"


;precompiled labels

  ;.include "Source/SoundEnginePreComp.fns"
  ;.include "Source/PictoPuzzler.fns"
  