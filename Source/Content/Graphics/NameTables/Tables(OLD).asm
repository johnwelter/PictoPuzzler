Palettes:

  .word Title_Palette, Game_Palette, GameOver_Palette

Title_Palette:

  .incbin "Source/Content/Graphics/NameTables/Title_PAL.pal"
  .incbin "Source/Content/Graphics/NameTables/Title_PAL.pal"
  
Game_Palette:

  .incbin "Source/Content/Graphics/NameTables/Game_PAL.pal"
  .incbin "Source/Content/Graphics/NameTables/Game_PAL.pal"
  
GameOver_Palette:

  .incbin "Source/Content/Graphics/NameTables/GameOver_PAL.pal"
  .incbin "Source/Content/Graphics/NameTables/GameOver_PAL.pal"
  
  
;;;;; GameMode Object Tables
ObjectsA:

	.word Title_ObjectsA, Game_ObjectsA, GameOver_ObjectsA
	
ObjectsB:

	.word Title_ObjectsB, Game_ObjectsB, GameOver_ObjectsB
	
;;;;;; Object Tables
	
Title_ObjectsA:

	.word TitleLogo
	.word SeparatorLine
	.word BankList
	
Title_ObjectsB:

	.word PuzzleList
	
Game_ObjectsA:

	.word TimeBox
	.word PuzzleWindow

Game_ObjectsB:

	.word EmptyObj			;; nothing
	
GameOver_ObjectsA:

	.word GameOverWindow	;; window
	.word Reminder			;; raw table

GameOver_ObjectsB:

	.word EmptyObj			;; nothing

;;;;;; Objects

END_OBJECT = $FF
WRAP_LINE = $FE

TitleLogo:

	.db $00			;; type = raw object
	.db $02 $04		;; 
	.db $28,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$29,$FE
	.db $2b,$81,$91,$83,$a0,$24,$24,$80,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$80,$24,$24,$81,$91,$83,$3b,$FE
	.db $2b,$91,$93,$91,$80,$81,$82,$91,$82,$81,$91,$83,$81,$91,$83,$80,$80,$a2,$83,$a2,$83,$91,$81,$82,$91,$93,$a3,$3b,$FE
	.db $2b,$91,$91,$a3,$91,$91,$85,$91,$85,$91,$93,$91,$91,$93,$91,$91,$91,$81,$a3,$81,$a3,$91,$91,$82,$91,$91,$83,$3b,$FE
	.db $2b,$90,$95,$24,$90,$a1,$82,$a1,$82,$a1,$91,$a3,$91,$91,$a3,$a1,$a3,$a1,$82,$a1,$82,$90,$a1,$82,$90,$84,$90,$3b,$FE
	.db $38,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3e,$24,$90,$95,$24,$24,$24,$3f,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$39,$FE
	.db $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$FE
	.db $24,$24,$24,$92,$02,$00,$02,$05,$24,$0c,$0a,$1d,$0f,$18,$1b,$1d,$24,$1c,$18,$0f,$1d,$20,$0a,$1b,$0e,$24,$24,$24,$FF



WindowTopRow:
  .db $28, $2a, $29

WindowRow:
  .db $2b, $24, $3b
  
WindowBottomRow:
  .db $38, $3a, $39 
  

  
GameInfoText:

  .db $0B, $0A, $17, $14, $00, $60, $00
  .db $24, $24, $24, $24, $24, $24, $24
  .db $24, $24, $24, $61, $24, $24, $24 

Pause_Menu:	;since we're drawing it while rendering, we can just pack in the whole thing
  .db $28,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$29
  .db $2b,$24,$1c,$0a,$1f,$0e,$62,$0e,$21,$12,$1d,$24,$3b
  .db $2b,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$3b
  .db $2b,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$3b
  .db $2b,$24,$24,$22,$0e,$1c,$24,$24,$17,$18,$24,$24,$3b
  .db $38,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$39

EndScreens:

  .word PuzzleClearLines, PuzzleSavedLines
  
PuzzleClearLines:

  .db $EA, $20
  .db $0D, $19,$1e,$23,$23,$15,$0e,$24,$0c,$15,$0e,$0a,$1b,$64
  .db $07, $1d,$12,$16,$0e,$61,$24,$24 ;print the time here as a separate call, similar to how it's printed in update game at 2131
  .db $0C, $17,$0e,$21,$1d,$24,$19,$1e,$23,$23,$15,$0e,$63
  .db $09, $24,$24,$22,$0e,$1c,$24,$24,$17,$18

PuzzleSavedLines:
  
  .db $2A, $21 
  .db $0D, $19,$1e,$23,$23,$15,$0e,$24,$1c,$0a,$1f,$0e,$0d,$64
  
SelectDefaultName:
 
  .db $47, $26 
  .db $10, $63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63

SelectDefaultTime:

  .db $8F, $26 
  
DefaultTimeString:
  .db $05, $60, $60, $61, $60, $60
  
ClearBackgroundTable:
	.db $24, $FD
  


 
	