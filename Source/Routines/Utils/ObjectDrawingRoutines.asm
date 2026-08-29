;;Object drawing utils
;;when loading objects, we have a few choices:
;;0	raw object - load directly from a table, use commands in table to control addresses
;;1	window Object - load a window from a small 3x3 table of data
;;2 	-puzzle widow - same as above, but with a special fill type
;;3 separator - load a line across the screen of a given tile

DropLine:

	MACROAdd32ToPointer pointer_address
	MACROAdd32ToPointer pointerB_address
	MACROAdd32ToPointer ppu_startAddress
	MACROSetPPUAddressVariable ppu_startAddress
	RTS

ReZeroTable:

	INY
	TYA
	JSR AddToTableAddress
	LDY #$00
	RTS

;;--------------------------;;
ALLOW_SAVEOBJECT = temp1
TILE_TO_DRAW = temp2

DrawObject:

  ;; table_address should contain the pointer to the beginning of an Object

  LDY #$00
  ;;0th = X position
  LDA [table_address], y
  TAX
  INY
  ;;1st = Y position
  LDA [table_address], y
  INY
  
  JSR StoreXYOffset
  
  ;;2nd = nametable
  LDA [table_address], y
  INY
  JSR GetNametableFromIndex	;;put nametable in PPU start
  TXA
  LSR A
  AND #$01
  BNE .loadScreenB
  MACROGetLabelPointer Screen_Copy, pointer_address
  MACROGetLabelPointer SaveScreen_Copy, pointerB_address
  LDA #MODELOAD_WRITESAVE
  STA ALLOW_SAVEOBJECT
  JMP .initOffsets
  
.loadScreenB:
  MACROGetLabelPointer ScreenB_Copy, pointer_address
  LDA #$00
  STA ALLOW_SAVEOBJECT
  
.initOffsets:

  ;;add offsets to copy data
  MACROSAddXYOffset ppu_startAddress
  MACROSAddXYOffset pointer_address
  MACROSAddXYOffset pointerB_address
  MACROSetPPUAddressVariable ppu_startAddress
  
  ;;3rd = object type
  LDA [table_address], y
  INY
  
  JSR Dynamic_Jump
  
DrawObjectJumpTable:

	.word DrawRaw
	.word DrawWindow
	.word DrawPuzzleWindow
	.word DrawSeparator

DrawRaw:

	LDA #$04
	JSR AddToTableAddress
	LDY #$00
  
.loop:

	LDA [table_address], y	;;load tile
	CMP #$FF
	BEQ .finishObject
	CMP #$FE
	BNE .drawTile
	;; wrap line - AKA, add 32 to addresses
	
	JSR DropLine
	JSR ReZeroTable
	JMP .loop
	
.drawTile:
	
	LDA [table_address], y
	STA TILE_TO_DRAW
	JSR DrawObjectTile
	JMP .loop
	
.finishObject:
	
	RTS


;;----------------;;
WIN_WIDTH = temp3
WIN_HEIGHT = temp4
WIN_GRIDX = temp5
WIN_GRIDY = temp6

DrawWindow:

	LDA [table_address], y
	INY
	STA WIN_WIDTH
	INC WIN_WIDTH
	LDA [table_address], y
	STA WIN_HEIGHT
	INC WIN_HEIGHT
	;;trust the process!
	

	;;table address is about to be reset anyhow, just need to reset Y 
	LDY #$00
	
	LDA #$00 
	STA tempx
	STA tempy

	MACROGetLabelPointer WindowRows, table_address
	JMP WindowsLoop
	
DrawPuzzleWindow:
	
	LDY #$00
	LDA mode_loadFlags	;;turns out, puzzle size is in here!
	AND #$03			;;get first two bits
	TAX
	LDA PuzzleSizes, x
	STA WIN_WIDTH
	INC WIN_WIDTH
	STA WIN_HEIGHT
	INC WIN_HEIGHT
	
	LDA #$00
	STA tempx
	STA tempy
	STA WIN_GRIDX
	STA WIN_GRIDY
	MACROGetLabelPointer PuzzleWindowRows, table_address
	JMP WindowsLoop
	
WindowsLoop:
.loop:

	TYA
	PHA

	LDA tempx
	BNE .checkXEnd
	LDY #$00
	BEQ .drawTile
.checkXEnd:
	CMP WIN_WIDTH
	BNE .getXFill
	LDY #$02
	BNE .drawTile
.getXFill:
	LDY #$01
.drawTile:

	LDA [table_address], y
	BNE .storeTile
	JSR GetCurrentPuzzleFill
.storeTile
	STA TILE_TO_DRAW

	PLA
	TAY
	
	JSR DrawObjectTile
	INC tempx
	JSR IncHoriFill
	LDA tempx
	CMP WIN_WIDTH
	BCC .loop
	BEQ .loop

	LDA #$00
	STA tempx
	STA WIN_GRIDX

	JSR DropLine
	LDY #$00

	LDA tempy
	BNE .incY
	INC tempy
	JSR IncVertFill
	
.incRow:
	LDA #$03
	JSR AddToTableAddress
	BNE .loop
	
.incY:
	INC tempy
	JSR IncVertFill
	LDA tempy
	CMP WIN_HEIGHT
	BCC .loop
	BEQ .incRow

	RTS

IncVertFill:

	INC WIN_GRIDY
	LDA WIN_GRIDY
	CMP #$06
	BNE .leave
	LDA #$01
	STA WIN_GRIDY
	
.leave:
	RTS
	
IncHoriFill:

	INC WIN_GRIDX
	LDA WIN_GRIDX
	CMP #$06
	BNE .leave
	LDA #$01
	STA WIN_GRIDX
	
.leave:
	RTS

GetCurrentPuzzleFill:

	LDA WIN_GRIDY
	CMP #$05
	BNE .noHLine
	LDX #$02
	JMP .checkVLine
.noHLine:
	LDX #$00
.checkVLine:	

	LDA WIN_GRIDX
	CMP #$05
	BNE .noVLine
	INX
	
.noVLine:
	
	TXA
	CLC
	ADC #$6C
	
	RTS

AddToTableAddress:

	;; A is amount to add
	CLC
	ADC table_address
	STA table_address
	LDA table_address+1
	ADC #$00
	STA table_address+1
	RTS
	
;;------------------------;;
SEP_LENGTH = temp3

DrawSeparator:

	LDA ppu_startAddress
	AND #$1F
	STA SEP_LENGTH
	
	LDA #$1F
	SEC
	SBC SEP_LENGTH
	STA tempx
	INC tempx
	
	LDA [table_address], y
	STA TILE_TO_DRAW
	
	LDA #$05
	JSR AddToTableAddress
	LDY #$00
	
.loop:

	JSR DrawObjectTile
	
	DEC tempx
	BEQ .finish
	
	JMP .loop
	
.finish:
	
	RTS
	
DrawObjectTile:

	LDA TILE_TO_DRAW
	STA PPU_DATA
	STA [pointer_address], y
	LDA mode_loadFlags
    AND #MODELOAD_WRITESAVE	;check save flag
	AND ALLOW_SAVEOBJECT
	BEQ .skipSave
	LDA TILE_TO_DRAW
	STA [pointerB_address],y

.skipSave:
	INY

	RTS
