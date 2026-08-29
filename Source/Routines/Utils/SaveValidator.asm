;;Clean up save data
  
  ;;go through our save times, and check for invalid time
  ;;check first byte for msb flag set- if so, check to make sure all values are less/equal to 9
  ;;if not, re-flip the msb
  
  ;get start of puzzle save data into pointer address
  MACROGetLabelPointer puzzle_clear_bank0, pointer_address
  LDY #$00
  LDX #$00	;up to 81, the total amount of puzzles
CleanUpSRAM:
  LDA [pointer_address], y
  AND #$80
  BPL .goToNext	;skip times without clear flag set- they can be whatever

  AND #$0F
  
.loopOverTime:
  CMP #$0A
  BCS .sanatizeData
  INY
  CPY #$04
  BEQ .goToNext
  LDA [pointer_address], y
  JMP .loopOverTime
   
.sanatizeData:

  LDY #$00
  LDA #$00
  STA [pointer_address], y
   	
.goToNext:
  LDA pointer_address
  CLC
  ADC #$04
  STA pointer_address
  LDA pointer_address+1
  ADC #$00
  STA pointer_address+1

  LDY #$00

  INX
  CPX #81
  BNE CleanUpSRAM
  
ValidateContinue:
	;if we have a continue, make sure it's valid-
	; make sure bank and puzzle values are valis
	; make sure game time is valid

  LDA hasContinue
  CMP #$01
  BCC .finishValidation
  BEQ .continueValidation
  BCS .sanitizeContinue

.continueValidation:
  
  LDA bank_index
  CMP #$03
  BCS .sanitizeContinue
  LDA puzzle_index
  CMP #27
  BCS .sanitizeContinue
  LDX #$00

.loopTime:
  LDA GameTime, x
  CMP #$0A
  BCS .sanitizeContinue
  INX
  CPX #$04
  BNE .loopTime
  jmp .finishValidation
  
.sanitizeContinue:

  LDA #$00
  STA hasContinue

.finishValidation: