LoadFullBackgroundFromTable:

    ;;use A as an index for which nametable to write to
	JSR SetNametableFromIndex
	TXA
	LSR A
	AND #$01
	BNE .copyScreenB
	MACROGetLabelPointer Screen_Copy, pointer_address
	MACROGetLabelPointer SaveScreen_Copy, pointerB_address
	JMP .setCounters
	
.copyScreenB:
	MACROGetLabelPointer ScreenB_Copy, pointer_address
	LDA mode_loadFlags
	AND $%11011111
	STA mode_loadFlags ;kill the save flag, just in case - NEVER save screen B data
	
	;;set pointer
	;; set counters
.setCounters:
	LDY #$00
	LDX #$00
	
	;;start loop

.outerloop:

.innerloop:

	LDA [table_address], y
	STA PPU_DATA
	STA [pointer_address],y
    LDA mode_loadFlags
    AND #%00100000	;check save flag
	BEQ .skipSaveCopy
    LDA [table_address], y
	STA [pointerB_address],y

.skipSaveCopy:
	INY
	CPY #$00
	BNE .innerloop

	INC pointer_address+1
	INC table_address+1
	INC pointerB_address+1
	
	INX
	CPX #$04
	BNE .outerloop
	RTS