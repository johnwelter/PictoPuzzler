ChangeGameMode:
  ;A - game mode index
  ;X - high nibble: palette start flag, low nibble: screen index
  STA game_mode
  STX mode_loadFlags
  MACROSetFlags mode_loadFlags, $80
  LDA #$00
  STA mode_state
  JSR ClearPPUString
  JSR LoadGameModeScreen
  RTS
  
LoadGameModeScreen:

  MACROSetFlags NMI_locks, BGLOAD_NMI_LOCK
  
  LDA #$00
  STA PPU_MASK    ; disable rendering- reenable on NMI when not updating

  JSR LoadGameModeBackground
  JSR LoadGameModeSprites

  MACROClearFlags NMI_locks, BGLOAD_NMI_LOCK

  
  ;; load the CHR bank for this mode
  JSR ResetMapper
  ;;remember, we're loading the SECOND set in each chr bank
  ;;so we'll take the index from the game mode chr table and add one mult 2
  LDX game_mode
  LDA gameModeInitCHRROMB, x
  ASL A
  CLC 
  ADC #$01
  JSR LoadCHRBankB
  
  JSR ResetMapper
  LDX game_mode
  LDA gameModeInitCHRROMA, x
  ASL A
  JSR LoadCHRBankA

  RTS
  
GAMEMODE_WORDIDX = temp1
LoadGameModeBackground:
	
  MACROGetDoubleIndex game_mode
  STY GAMEMODE_WORDIDX
	
  MACROGetLabelPointer Palettes, table_address
  JSR GetTableAtIndex

  JSR LoadFullPaletteFromTable
	
  LDY GAMEMODE_WORDIDX
  LDA mode_loadFlags
  AND #%01000000 ; copy from saved screen
  BEQ .loadTable
  MACROGetLabelPointer SaveScreen_Copy, table_address
  MACROClearFlags mode_loadFlags, $80
  
.loadTable:
  LDA #$00
  JSR LoadFullBackgroundFromTable

  MACROSetFlags mode_loadFlags, $80
  
  LDA #$01
  JSR LoadFullBackgroundFromTable

  LDA mode_loadFlags
  AND #%01000000
  BNE .finish

  LDX game_mode
  LDA ObjectCounts, x
  BEQ .finish
  PHA
  MACROGetLabelPointer Objects, table_address
  LDY GAMEMODE_WORDIDX
  JSR GetTableAtIndex 
  MACROGetPointer table_address, objectTable_address
   
.loadObjectLoop:

	MACROGetPointer objectTable_address, table_address
	PLA
	TAY
	PHA
	DEY
	TYA
	ASL A
	TAY
	JSR GetTableAtIndex
	JSR DrawObject
	
	PLA
	TAY 
	DEY
	BEQ .finish
	TYA
	PHA
	JMP .loadObjectLoop

.finish:
  RTS
  
LoadGameModeSprites:

  MACROGetDoubleIndex game_mode  
  MACROGetLabelPointer Sprites, table_address
  JSR GetTableAtIndex
  LDY #$00
  LDA [table_address],y
  INC table_address
  JSR LoadSprites_impl
  
  RTS
  
gameModeInitCHRROMB:
	.db $00, $02, $02
gameModeInitCHRROMA:
	.db $00, $02, $02
	
