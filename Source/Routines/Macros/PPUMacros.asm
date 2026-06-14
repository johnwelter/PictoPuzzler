;;macro to load a full name table
;; \1 = address to set
;; \2 = flags to set
;; all registers clobbered, as well as table_address
MACROSetPPUControl .macro

  LDA #\1  ; enable NMI, sprites from Pattern Table 0, background from Pattern Table 1
  STA PPU_CTRL
  LDA #\2   ; enable sprites, enable background, no clipping on left side
  STA PPU_MASK
	
  .endm
  
MACROSetPPUAddress .macro

  LDA PPU_STATUS             ; read PPU status to reset the high/low latch
  LDA #HIGH(\1)
  STA PPU_ADDR            ; write the high byte of $2000 address
  LDA #LOW(\1)
  STA PPU_ADDR           ; write the low byte of $2000 address
  
  .endm

MACROSetPPUAddressVariable .macro

  LDA PPU_STATUS
  LDA \1+1
  STA PPU_ADDR
  LDA \1
  STA PPU_ADDR

  .endm
  
MACROSAddXYOffset .macro

  LDA \1+1
  LDX \1
  JSR GetAddressWithXYOffset
  STA \1+1
  STX \1
	
  .endm
  
MACROAddPPUStringEntryRawData .macro

  LDA #$01
  STA PPU_PendingWrite
  LDA \1
  JSR WriteToPPUString
  LDA \2
  JSR WriteToPPUString
  LDA \3
  JSR WriteToPPUString
  LDA \4 
  JSR WriteToPPUString
  
  .endm

MACROAddPPUStringEntryRepeat .macro

  LDA #$01
  STA PPU_PendingWrite
  LDA \1
  JSR WriteToPPUString
  LDA \2
  JSR WriteToPPUString
  LDA #$40
  ORA \3
  ORA \4
  JSR WriteToPPUString
  LDA \5
  JSR WriteToPPUString
  
  .endm
  
MACROAddPPUStringEntryTable .macro
 
  LDA #$01
  STA PPU_PendingWrite
  LDA \1
  JSR WriteToPPUString
  LDA \2
  JSR WriteToPPUString
  LDA #$20
  ORA \3
  JSR WriteToPPUString
  LDA #LOW(\4)
  JSR WriteToPPUString
  LDA #HIGH(\4)
  JSR WriteToPPUString
 
  .endm

MACROAddPPUStringEntryTablePtr .macro
 
  LDA #$01
  STA PPU_PendingWrite
  LDA \1
  JSR WriteToPPUString
  LDA \2
  JSR WriteToPPUString
  LDA #$20
  ORA \3
  JSR WriteToPPUString
  LDA \4
  JSR WriteToPPUString
  LDA \4+1
  JSR WriteToPPUString
 
  .endm

