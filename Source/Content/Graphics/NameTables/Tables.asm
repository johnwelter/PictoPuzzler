Palettes:

  .word Title_Palette, Game_Palette, GameOver_Palette, Title_Palette

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
Objects:

	.word Title_Objects, Game_Objects, GameOver_Objects, Credits_Objects
	
ObjectCounts:
	
	.db 5, 3, 2, 1
	
	
;;;;;; Object Tables
	
Title_Objects:

	.word TitleLogo
	.word SeparatorLine
	.word BankList
	.word PuzzleInfo
	.word PuzzleList
	
Game_Objects:

	.word PuzzleWindow
	.word TimeBoxContent	
	.word TimeBoxWindow
	
GameOver_Objects:

	.word GameOverWindow	;; window
	.word Reminder			;; raw table
	
Credits_Objects:

	.word TitleLogo

;;;;;; Objects

END_OBJECT = $FF
WRAP_LINE = $FE

TitleLogo:

	.db 2, 4, 0	;; start at palcement X=2, Y=4 on screen, table idx
	.db $00		;; type = raw object
	.db $28,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$29,WRAP_LINE
	.db $2b,$81,$91,$83,$a0,$24,$24,$80,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$80,$24,$24,$81,$91,$83,$3b,WRAP_LINE
	.db $2b,$91,$93,$91,$80,$81,$82,$91,$82,$81,$91,$83,$81,$91,$83,$80,$80,$a2,$83,$a2,$83,$91,$81,$82,$91,$93,$a3,$3b,WRAP_LINE
	.db $2b,$91,$91,$a3,$91,$91,$85,$91,$85,$91,$93,$91,$91,$93,$91,$91,$91,$81,$a3,$81,$a3,$91,$91,$82,$91,$91,$83,$3b,WRAP_LINE
	.db $2b,$90,$95,$24,$90,$a1,$82,$a1,$82,$a1,$91,$a3,$91,$91,$a3,$a1,$a3,$a1,$82,$a1,$82,$90,$a1,$82,$90,$84,$90,$3b,WRAP_LINE
	.db $38,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3e,$24,$90,$95,$24,$24,$24,$3f,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$39,WRAP_LINE
	.db $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,WRAP_LINE
	.db $24,$24,$24,$92,$02,$00,$02,$05,$24,$0c,$0a,$1d,$0f,$18,$1b,$1d,$24,$1c,$18,$0f,$1d,$20,$0a,$1b,$0e,$24,$24,$24,END_OBJECT

SeparatorLine:

	.db 0, 16, 0
	.db $03
	.db $2A
	
BankList:

	.db 13, 20, 0
	.db $00
	.db $0b,$0a,$17,$14,$24,$00,WRAP_LINE
	.db $24,$24,$24,$24,$24,$24,WRAP_LINE
	.db $0b,$0a,$17,$14,$24,$01,WRAP_LINE
	.db $24,$24,$24,$24,$24,$24,WRAP_LINE
	.db $0b,$0a,$17,$14,$24,$02,END_OBJECT

PuzzleInfo:

	.db 7, 18, 1
	.db $00
	.db $63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,$63,WRAP_LINE
	.db $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$68,$69,$6a,WRAP_LINE
	.db $24,$24,$24,$1d,$12,$16,$0e,$24,$60,$60,$61,$60,$60,$78,$79,$7a,WRAP_LINE
	.db $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$88,$89,$8a,END_OBJECT
	
PuzzleList:

	.db 3, 22, 1
	.db $00
	.db $01,$24,$24,$02,$24,$24,$03,$24,$24,$04,$24,$24,$05,$24,$24,$06,$24,$24,$07,$24,$24,$08,$24,$24,$09,WRAP_LINE,WRAP_LINE
	.db $0a,$24,$24,$0b,$24,$24,$0c,$24,$24,$0d,$24,$24,$0e,$24,$24,$0f,$24,$24,$10,$24,$24,$11,$24,$24,$12,WRAP_LINE,WRAP_LINE
	.db $13,$24,$24,$14,$24,$24,$15,$24,$24,$16,$24,$24,$17,$24,$24,$18,$24,$24,$19,$24,$24,$1a,$24,$24,$1b,END_OBJECT
	
TimeBoxWindow:
	.db 2, 2, 0
	.db $01
	.db 9, 6
	
TimeBoxContent:
	
	.db 4, 5, 0
	.db $00
	.db $0b,$0a,$17,$14,$00,$60,$00,WRAP_LINE
	.db $24,$24,$24,$24,$24,$24,$24,WRAP_LINE
	.db $24,$24,$24,$61,$24,$24,$24,END_OBJECT
	
PuzzleWindow:

	.db 13, 11, 0
	.db $02
	;; size is determined from a variable - we just need to position it

GameOverWindow:

	.db 5, 5, 0
	.db $01
	.db 20, 8
	
Reminder:

	.db 5, 16, 0
	.db $00
	.db $24,$24,$24,$24,$24,$24,$24,$0c,$0a,$1e,$1d,$12,$18,$17,$61,$24,$24,$24,$24,$24,$24,$24,WRAP_LINE
	.db $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,WRAP_LINE
	.db $1b,$0e,$16,$0e,$16,$0b,$0e,$1b,$24,$1d,$18,$24,$11,$18,$15,$0d,$24,$1b,$0e,$1c,$0e,$1d,WRAP_LINE
	.db $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,WRAP_LINE
	.db $20,$11,$0e,$17,$24,$19,$18,$20,$0e,$1b,$12,$17,$10,$24,$18,$0f,$0f,$24,$1d,$11,$0e,$24,WRAP_LINE
	.db $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,WRAP_LINE
	.db $1c,$22,$1c,$1d,$0e,$16,$24,$1d,$18,$24,$0a,$1f,$18,$12,$0d,$24,$15,$18,$1c,$12,$17,$10,WRAP_LINE
	.db $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,WRAP_LINE
	.db $22,$18,$1e,$1b,$24,$1c,$0a,$1f,$0e,$0d,$24,$19,$1b,$18,$10,$1b,$0e,$1c,$1c,$24,$24,$24,END_OBJECT

WindowRows:
  .db $28, $2a, $29
  .db $2b, $24, $3b
  .db $38, $3a, $39 
  
PuzzleWindowRows:
  .db $28, $2a, $29
  .db $2b, $00, $3b
  .db $38, $3a, $39 
    
GameInfoText:

  .db $0B, $0A, $17, $14, $00, $60, $00
  .db $24, $24, $24, $24, $24, $24, $24
  .db $24, $24, $24, $61, $24, $24, $24 
  
Pause_Window:
  .db $28,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$2a,$29
  .db $2b,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$3b
  .db $2b,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$3b
  .db $2b,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$3b
  .db $2b,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$3b
  .db $38,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$3a,$39

Pause_Menu:
  .db $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
  .db $24,$24,$24,$1b,$0e,$1c,$1e,$16,$0e,$24,$24
  .db $24,$24,$24,$0e,$21,$12,$1d,$24,$24,$24,$24
  .db $24,$24,$24,$1b,$0e,$1c,$0e,$1d,$24,$24,$24


Pause_Quit:	;since we're drawing it while rendering, we can just pack in the whole thing
  .db $24,$1c,$0a,$1f,$0e,$62,$0e,$21,$12,$1d,$24
  .db $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
  .db $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
  .db $24,$24,$22,$0e,$1c,$24,$24,$17,$18,$24,$24

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
  


 
	