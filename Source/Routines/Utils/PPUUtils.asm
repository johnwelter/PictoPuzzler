LoadFullPaletteFromTable:

  MACROSetPPUAddress $3F00
  LDY #$00              ; start out at 0
  LDX #$00
.loop:
  LDA [table_address], y        ; load data from address (palette + the value in x)
  STA Palette_Copy, x
  PHA 
  LDA mode_loadFlags
  AND #MODELOAD_BLACKPAL
  BNE .setBlack
  PLA 
  JMP .setPPUData
.setBlack:

  PLA 
  LDA #$0F
  
.setPPUData:
  STA PPU_DATA            ; write to PPU
  INY                   ; X = X + 1
  INX
  CPY #$20              ; Compare X to hex $10, decimal 16 - copying 16 bytes = 4 sprites
  BNE .loop  ; Branch to LoadPalettesLoop if compare was Not Equal to zero
  RTS

;;-------------------------------------;;

;;this gets called during mode load, which reserves temp1 for the word size mode index
ALLOW_WRITESAVE = temp2
TILE_TO_WRITE = temp3
MAX_CHUNKS = $03
LAST_CHUNK_LIMIT = $C0
BLANK_TILE = $24
COPY_ADDRESS = pointer_address
SAVECOPY_ADDRESS = pointerB_address

LoadFullBackgroundFromTable:

    ;;use A as an index for which nametable to write to
	JSR SetNametableFromIndex
	TXA
	LSR A
	AND #$01
	BNE .copyScreenB
	MACROGetLabelPointer Screen_Copy, pointer_address
	MACROGetLabelPointer SaveScreen_Copy, pointerB_address
	LDA #MODELOAD_WRITESAVE
	STA ALLOW_WRITESAVE
	JMP .setCounters
	
.copyScreenB:
	MACROGetLabelPointer ScreenB_Copy, pointer_address
	LDA #$00
	STA ALLOW_WRITESAVE
	
	;;set pointer
	;; set counters
.setCounters:
	LDY #$00
	LDX #$00
	
	;;start loop

.outerloop:

.innerloop:

	LDA mode_loadFlags
	AND #MODELOAD_DRAWBLANK		;check if we're drawing from a table, or making a blank screen
	BEQ .fromTable
	;;if we're not in the att table, write a tile
	;;else, write 0
	CPX #MAX_CHUNKS				;check if we're at the last chunk
	BCC .doTile				
	CPY #LAST_CHUNK_LIMIT		;check if we've reached the end of the last chunk
	BCC .doTile 
	LDA #$00					;if we're past the last chunk, write a default attribute of 0 to the table
	STA TILE_TO_WRITE
	JMP .writeToScreen
.doTile:
	LDA #BLANK_TILE				;load a blank tile
	STA TILE_TO_WRITE
	JMP .writeToScreen
.fromTable:					
	LDA [table_address], y		; load a tile from the table
	STA TILE_TO_WRITE
.writeToScreen:					; write to the nametable
	LDA TILE_TO_WRITE		
	STA PPU_DATA				; write the tile to the PPU
	STA [COPY_ADDRESS],y		; write to the copy in SRAM
    LDA mode_loadFlags		
    AND #MODELOAD_WRITESAVE		;check save flag
	AND ALLOW_WRITESAVE
	BEQ .skipSaveCopy
    LDA TILE_TO_WRITE
	STA [SAVECOPY_ADDRESS],y	; write to the save copy in SRAM

.skipSaveCopy:
	INY
	CPY #$00
	BNE .innerloop

	INC COPY_ADDRESS+1
	INC table_address+1
	INC SAVECOPY_ADDRESS+1
	
	INX
	CPX #$04
	BNE .outerloop
	RTS
;;----------------------------------;;

DATA_LEN = temp1
WRITE_SETTINGS = temp2
	
ProcessPPUString:

	LDA PPU_PendingWrite
	BNE .continueProcess
	RTS
	
.continueProcess:
	LDY #$00
	
	LDA #LOW(PPU_String)
	STA pointer_address
	LDA #HIGH(PPU_String)
	STA pointer_address + 1

.outerloop:
	LDA PPU_STATUS
	LDA [pointer_address], y
	BEQ .finish
	STA PPU_ADDR
	INY
	LDA [pointer_address], y
	STA PPU_ADDR
    INY 
	LDA [pointer_address], y
	STA WRITE_SETTINGS
	INY
	
	LDA PPU_CTRL
	AND #$FB
	STA PPU_CTRL
	
	LDA WRITE_SETTINGS	;check horizontal or vertical write
	AND #%10000000
	BEQ .checkRepeat
	ORA PPU_CTRL 
	STA PPU_CTRL 
	
	
.checkRepeat:
  LDA WRITE_SETTINGS
  AND #%01000000
  BEQ .checkTable
  
  LDA WRITE_SETTINGS
  AND #$3F
  STA DATA_LEN
  ;;the usual data length byte is now the repeatable byte
  LDX #$00
  
.repeatLoop:
  LDA [pointer_address], y
  STA PPU_DATA
  INX 
  CPX DATA_LEN
  BNE .repeatLoop
  INY
  JMP .outerloop
	
.checkTable:
	LDA WRITE_SETTINGS
	AND #%00100000
	BEQ .rawData
	
	LDA [pointer_address], y
	STA table_address
	INY 
	LDA [pointer_address], y
	STA table_address + 1
	INY
	TYA 
	PHA
	JSR WriteToPPUFromTable
	PLA
	TAY
	JMP .outerloop
	
.rawData:

	LDA [pointer_address], y
	INY
	STA DATA_LEN

	LDX #$00

.innerloop:
	
	LDA [pointer_address], y
	STA PPU_DATA
	INY
	INX
	CPX DATA_LEN
	BNE .innerloop
	JMP .outerloop
	
.finish:
	JSR ClearPPUString
.leave:
	RTS
	
WriteToPPUFromTable:
	LDY #$00
	LDA [table_address], y
	INY
	STA DATA_LEN
.innerloop:
	LDA [table_address], y
	STA PPU_DATA
	INY
	CPY DATA_LEN
	BCC .innerloop ;table should have the size in it, but since we count the byte count, we'll want to wait till we go over it
	BEQ .innerloop
	RTS
  
LoadSprites_impl:
  ;;A will be the amount of sprites to load
  STA DATA_LEN
  ASL DATA_LEN
  ASL DATA_LEN
  
  LDY #$00              ; start at 0
  
.loop:
  LDA [table_address], y; load data from address (sprites +  x)
  STA SPRITE_DATA, y    ; store into RAM address ($0200 + x)
  INY                   ; X = X + 1
  CPY DATA_LEN             ; Compare X to hex $10, decimal 16
  BNE .loop   ; Branch to LoadSpritesLoop if compare was Not Equal to zero
                        ; if compare was equal to 16, keep going down   
  RTS


WriteToPPUString:

	LDX PPU_StringIdx
	CPX #PPU_STRINGMAX
	BEQ .finish
	
	STA PPU_String, x
	INC PPU_StringIdx
	INX
	LDA #$00
	STA PPU_String, x
		
.finish:
	RTS

ClearPPUString:
	
	LDA #$00
	STA PPU_StringIdx
	STA PPU_String
	STA PPU_PendingWrite
	RTS

DetectSprite0:

  LDA PPU_MASK
  AND #%00011000
  BEQ LeaveDetect

WaitNotSprite0:
  lda PPU_STATUS
  and #SPRITE_0_MASK
  bne WaitNotSprite0   ; wait until sprite 0 not hit

WaitSprite0:
  lda $2002
  and #SPRITE_0_MASK
  beq WaitSprite0      ; wait until sprite 0 is hit

  ldx #$05				;do a scanline wait
WaitScanline:
  dex
  bne WaitScanline
  
LeaveDetect:
  RTS

;;--------------------------------;;
	
XOFFSET = temp1
YOFFSET = temp2
PPUPOS_HI = temp3

StoreXYOffset:
	;;A = Y offset, X = X offset
	STX XOFFSET
	STA YOFFSET
	LDA #$00
	STA PPUPOS_HI
	
	;;the goal here is to straddle the Y position across two bytes, to create a proper offset for the PPU
	;;where we move 5 of the bits over 
	ASL YOFFSET
	ROL PPUPOS_HI
	ASL YOFFSET
	ROL PPUPOS_HI
	ASL YOFFSET
	ROL PPUPOS_HI
	ASL YOFFSET
	ROL PPUPOS_HI
	ASL YOFFSET
	ROL PPUPOS_HI
	
	;;add them together
	LDA YOFFSET
	CLC
	ADC XOFFSET
	STA pointer_addOffset
	TAX
	LDA PPUPOS_HI
	ADC #$00
	STA pointer_addOffset+1
	RTS

;;----------------------------------;;

PPU_CURRENTPOS = temp_addAddress

GetAddressWithXYOffset:

	;;A is hi, X is lo
	STX PPU_CURRENTPOS
	STA PPU_CURRENTPOS+1
	
	LDA PPU_CURRENTPOS
	CLC
	ADC pointer_addOffset
	TAX
	LDA PPU_CURRENTPOS+1
	ADC pointer_addOffset+1
	;;A is new hi, X is new lo
	
	RTS

SetNametableFromIndex:

  PHA						;; Store the index
  LDA PPU_STATUS			;; load the PPU status to reset the write register
  PLA						;; Retrieve index
  ASL A						;; double it (indexing a 2 byte table)
  TAX						;; put it in X
  LDA NameTableMemList+1, x	;; get the nametable from the list, store it in the PPU Address
  STA PPU_ADDR				
  LDA NameTableMemList, x
  STA PPU_ADDR
  RTS

GetNametableFromIndex:

  ASL A						;; double it (indexing a 2 byte table)
  TAX						;; put it in X
  LDA NameTableMemList+1, x	;; get the nametable from the list, store it in the PPU Address
  STA ppu_startAddress+1			
  LDA NameTableMemList, x
  STA ppu_startAddress
  RTS
  
TurnOnSprites:
 
  LDA PPU_Mask
  ORA #%00010000
  STA PPU_Mask
  RTS
  
TurnOffSprites:
  
  LDA PPU_Mask
  AND #%11101111
  STA PPU_Mask
  RTS

DisableRendering:

  LDA PPU_Mask
  AND #%11100111
  STA PPU_Mask
  RTS
  
EnableRendering:

  LDA PPU_Mask
  ORA #%00011000
  STA PPU_Mask
  RTS

UpdatePPUControl:

  LDA PPU_Control
  AND #$FC
  ORA PPU_NT
  STA PPU_CTRL
  RTS
  
UpdatePPUMask:
  LDA PPU_Mask
  STA PPU_MASK
  RTS
  
InitPPUControl:
  
  ; enable NMI, sprites from Pattern Table 0, background from Pattern Table 1
  ; enable sprites, enable background, no clipping on left side
  LDA #%10010000
  STA PPU_CTRL
  STA PPU_Control
  LDA #%00011110
  ;;STA PPU_MASK
  STA PPU_Mask
  RTS

;;------------------------;;
  
STEP_RESULT = temp1
FadeOutPalettes:

;;take the current values, and decrement the lower nibbles
;;we can access from the palette copy 
;;we'll make this fade out one level per call
;;once all the palettes are blacked out we'll return true, so we'll keep the carry flag as a return result

;;go through the palette copy, decrement, make a raw data PPU string and add all the bytes into it
;;for any palette color already in the 0x range, change it to 0f to get black

  MACROGetLabelPointer Palette_Copy, table_address
;;palette copy address is now X accessable

  LDY #$00
  MACROAddPPUStringEntryRawData #$3F, #$00, #DRAW_HORIZONTAL, #$20  

  LDA #$00
  STA STEP_RESULT
  
.loop:

  LDA [table_address], y
  CMP #$0F
  BEQ .addToString
  CMP #$10
  BCC .setBlack
  
  LDA #$80
  STA STEP_RESULT
  
  LDA [table_address], y
  SEC
  SBC #$10
  JMP .setColor

.setBlack:

  LDA #$0F

.setColor:
  STA [table_address], y

.addToString:

  JSR WriteToPPUString

.incY:
  
  INY
  CPY #$20
  BNE .loop

  ASL STEP_RESULT	;get carry out, if we have one

  RTS
  
FadeInPalettes:

;;need to be able to store off a target palette first
;;we can use the palette copy we make during the game mode change as the target
  RTS

NameTableMemList:
  .word $2000, $2400, $2800, $2C00
PalettesMemList:
  .word $3F00, $3F04, $3F08, $3F0C
  .word $3F10, $3F14, $3F18, $3F1C  
  
BLANK_TILE = $24
