UpdateCredits:

  JSR DoUpdateCredits 
  RTS
  
DoUpdateCredits:

  LDA mode_state
  JSR Dynamic_Jump
    
UpdateCreditsJumpTable:

  .word UpdateCreditsInit
  .word UpdateCreditsWaitInput
  .word UpdateCreditsFadeOut
  .word UpdateCreditsExit
  
UpdateCreditsInit:

  ;load the hasContinue flag
  ;choose the message to print based on the flag
  lda #$04
  sta current_song
  lda current_song
  jsr sound_load

  MACROSetFlags PPU_Mask, #%00011000
  
  INC mode_state

  RTS
  
UpdateCreditsWaitInput:

  LDA gamepadPressed
  BNE .loadTitle
.leaveEarly:
  RTS

.loadTitle:
  LDA #TITLE_IDX
  STA targetGameMode
  LDA #$00
  STA targetScreenLoad

  LDA #$00
  STA time
  INC mode_state
.leave:
  RTS

UpdateCreditsFadeOut:

  LDA time
  AND #$07
  BNE .leave
  ;;every 8 frames, decrement the palettes
  JSR FadeOutPalettes
  BCS .leave

.changeModeState:
  LDA #$00
  STA time
  INC mode_state
.leave:
  RTS

UpdateCreditsExit:

  LDA time
  AND #$0F
  BNE .leave

  LDA #$00
  STA startOnBankTable

  LDA targetScreenLoad
  ORA #%00001000
  TAX
  LDA targetGameMode

  JSR ChangeGameMode
  
  lda #$02
  sta current_song
  lda current_song
  jsr sound_load
  
.leave:
  RTS
  
