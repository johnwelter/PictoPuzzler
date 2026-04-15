kMod:
    .word se_me_none
    .word se_me_mod
    .word se_me_sweep
    .word se_me_bassKick

se_me_none:
    .byte $00, $81

se_me_mod:
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $FE, $FE, $FC
    .byte $FC, $FE, $FE, $00, $00, $02, $02, $04, $04, $02, $02, $82, $10

se_me_sweep:
    .byte $10, $0C, $08, $04, $00, $00, $FE, $FE, $FC, $FC, $FE, $FE, $00, $00, $02, $02
    .byte $04, $04, $02, $02, $82, $10

se_me_bassKick:
    .byte $90, $A0, $B0, $C0, $D0, $E0, $F0, $00, $10, $20, $30, $40, $50, $60, $70, $80




