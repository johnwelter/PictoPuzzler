kVol:
    .word se_ve_short_staccato
    .word se_ve_fade_in
    .word se_ve_blip_echo
    .word se_ve_tgl_1
    .word se_ve_tgl_2
    .word se_ve_battlekid_1
    .word se_ve_battlekid_1b
    .word se_ve_battlekid_2
    .word se_ve_battlekid_2b
    .word se_ve_drum_decay
    .word se_ve_hiHat_decay
    .word se_ve_long_decay
    .word se_ve_tinyDecy
    .word se_ve_noDecay
    .word se_ve_long_tremelo
    .word se_ve_veryLong_decay

se_ve_short_staccato:
    .byte $0F, $0E, $0D, $0C, $09, $05, $00, $FF

se_ve_fade_in:
    .byte $01, $01, $02, $02, $03, $03, $04, $04, $07, $07, $08, $08, $0A, $0A, $0C, $0C
    .byte $0D, $0D, $0E, $0E, $0F, $0F, $FF

se_ve_blip_echo:
    .byte $0D, $0D, $0D, $0C, $0B, $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $06
    .byte $06, $05, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $03, $02
    .byte $01, $00, $FF

se_ve_tgl_1:
    .byte $0F, $0B, $09, $08, $07, $06, $00, $FF

se_ve_tgl_2:
    .byte $0B, $0B, $0A, $09, $08, $07, $06, $06, $06, $05, $FF

se_ve_battlekid_1:
    .byte $0F, $0E, $0C, $0A, $00, $FF

se_ve_battlekid_1b:
    .byte $0F, $0E, $0C, $0A, $09, $FF

se_ve_battlekid_2:
    .byte $09, $08, $06, $04, $00, $FF

se_ve_battlekid_2b:
    .byte $09, $08, $06, $04, $03, $FF

se_ve_drum_decay:
    .byte $0E, $09, $08, $06, $04, $03, $02, $01, $00, $FF

se_ve_hiHat_decay:
    .byte $0E, $06, $02, $00, $FF

se_ve_long_decay:
    .byte $0E, $0F, $0F, $0F, $0E, $0E, $0E, $0D, $0D, $0D, $0C, $0C, $0C, $0B, $0B, $0B
    .byte $0A, $0A, $0A, $0A, $0A, $0A, $09, $09, $09, $08, $08, $08, $07, $07, $07, $06
    .byte $06, $06, $05, $05, $05, $04, $04, $04, $03, $03, $03, $02, $02, $02, $01, $01
    .byte $01, $00, $FF

se_ve_tinyDecy:
    .byte $0F, $00, $FF

se_ve_noDecay:
    .byte $0F, $FF

se_ve_long_tremelo:
    .byte $0E, $0F, $0F, $0F, $09, $09, $09, $0E, $0E, $0E, $08, $08, $08, $0D, $0D, $0D
    .byte $07, $07, $07, $0C, $0C, $0C, $06, $06, $06, $0B, $0B, $0B, $05, $05, $05, $0A
    .byte $0A, $0A, $04, $04, $04, $09, $09, $09, $03, $03, $03, $08, $08, $08, $00, $FF


se_ve_veryLong_decay:
    .byte $08, $09, $0A, $0B, $0C, $0D, $0E, $0F, $0F, $0F, $0F, $0F, $0F, $0E, $0E, $0E
    .byte $0E, $0E, $0E, $0D, $0D, $0D, $0D, $0D, $0D, $0C, $0C, $0C, $0C, $0C, $0C, $0B
    .byte $0B, $0B, $0B, $0B, $0B, $0A, $0A, $0A, $0A, $0A, $0A, $09, $09, $09, $09, $09
    .byte $09, $08, $08, $08, $08, $08, $08, $07, $07, $07, $07, $07, $07, $06, $06, $06
    .byte $06, $06, $06, $05, $05, $05, $05, $05, $05, $04, $04, $04, $04, $04, $04, $03
    .byte $03, $03, $03, $03, $03, $02, $02, $02, $02, $02, $02, $01, $01, $01, $01, $01
    .byte $01, $00, $FF



