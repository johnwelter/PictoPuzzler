;;********************************;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  MMC1 Template - CATFORT2024   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;********************************;;

;;;; iNES header info ;;;;

 .include "Source/Defines/Header.asm"
  LIST	  ;; compiler directive- creates a useful file that shows relation between ASM and ROM - ophis21 *wishes*

;;;; Variables and Macros ;;;;

  .include "Source/Defines/Defines.asm"
  .include "Source/Routines/Macros/Macros.asm"

;;**************************;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;       PRG ROM            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;**************************;; 

  .include "Source/Banks/Bank0.asm"
  .include "Source/Banks/Bank1.asm"
  .include "Source/Banks/Bank2.asm"

  .bank 6
  .org $C000 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     Initialization       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  .include "Source/Routines/Common/Init.asm"

  .include "Source/Routines/Utils/SaveValidator.asm"
  
  jsr sound_init
  
;;Init title

  lda #$00
  sta current_song
  lda current_song
  jsr sound_load

  LDA #TITLE_IDX
  LDX #$00
  JSR ChangeGameMode
  JSR InitPPUControl
  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     Main Program         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Forever:

  INC sleeping

.loop
  LDA sleeping
  BNE .loop

  INC time  
  LDA pauseState
  BNE .skipScaleUpdate
  INC scaledTime
.skipScaleUpdate:
  JSR GameLoop


  JMP Forever     ;jump back to Forever, infinite loop
  
;; dynamic jump table

GameLoop:

  MACROCallDynamicJump game_mode
  ;; we'll pop the return address here as the table index, so 
  ;; the routine we pick will return us to whatever called Game Loop
  ;; when it returns

GameLoopJumpTable:

  .word UpdateTitle
  .word UpdateGame
  .word UpdateGameOver
  .word UpdateCredits
  

  ;;RTS is called in the subroutine

  
  .include "Source/Routines/Modes/GameModes/UpdateTitle.asm"
  .include "Source/Routines/Modes/GameModes/UpdateGame.asm"
  .include "Source/Routines/Modes/GameModes/UpdateGameOver.asm"
  .include "Source/Routines/Modes/GameModes/UpdateCredits.asm"
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     Routines             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


  .include "Source/Routines/Common/GameModeLoader.asm"
  .include "Source/Routines/Utils/PointerUtils.asm"
  .include "Source/Routines/Utils/PPUUtils.asm"
  .include "Source/Routines/Utils/MapperUtils.asm"
  .include "Source/Routines/Common/DrawingRoutines.asm"
  .include "Source/Routines/Utils/ObjectDrawingRoutines.asm"
  
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     NMI                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  .include "Source/Routines/Common/NMI.asm"
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    AUDIO                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;.include "External/sound_engine.asm"
	;;test out DPCM here?

	.ds (64-*)&63
sample0:						;MOTHER bass kick
	.incbin "Source/Content/Sound/DMC/EB0_Bass.dmc"
sample0End:
	.ds (64-*)&63
sample1:						;MOTHER snare
	.incbin "Source/Content/Sound/DMC/EB0_Snare.dmc"
sample1End:

SampleStart:
	.db low(sample0 >> 6)
	.db low(sample1 >> 6)

SampleLength:
	.db low((sample0End - sample0) >> 4)
	.db low((sample1End - sample1) >> 4)

;;**************************;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;       PRG ROM DATA       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;**************************;; 
  
  .bank 7
  .org $E000

  .include "Source/Content/Graphics/NameTables/Tables.asm"
  .include "Source/Content/Graphics/Sprites/Sprites.asm"
  .include "Source/External/SoundEngine/Source/sound_engine.asm"

  .org $FFFA     ;first of the three vectors starts here
  .dw NMI        ;when an NMI happens (once per frame if enabled) the 
                   ;processor will jump to the label NMI:
  .dw RESET      ;when the processor first turns on or is reset, it will jump
                   ;to the label RESET:
  .dw 0          ;external interrupt IRQ is not used in this tutorial
  
;;**************************;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;      CHR ROM DATA        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;**************************;; 
  
  .bank 8
  .org $0000
  .incbin "Source/Content/Graphics/CHRROM/FirstSixteenSprites.chr"
  .incbin "Source/Content/Graphics/CHRROM/B0Sprites.chr"  
  .incbin "Source/Content/Graphics/CHRROM/BGTiles.chr"
  
  .bank 9
  .org $0000
  .incbin "Source/Content/Graphics/CHRROM/FirstSixteenSprites.chr"
  .incbin "Source/Content/Graphics/CHRROM/B1Sprites.chr"  
  .incbin "Source/Content/Graphics/CHRROM/BGTiles.chr"
  
  .bank 10
  .org $0000
  .incbin "Source/Content/Graphics/CHRROM/FirstSixteenSprites.chr"
  .incbin "Source/Content/Graphics/CHRROM/B2Sprites.chr"  
  .incbin "Source/Content/Graphics/CHRROM/BGTiles.chr"
  
  .bank 11
  .org $0000
  .incbin "Source/Content/Graphics/CHRROM/FirstSixteenSprites.chr"
  .incbin "Source/Content/Graphics/CHRROM/B0Sprites.chr"  
  .incbin "Source/Content/Graphics/CHRROM/BGTiles.chr"