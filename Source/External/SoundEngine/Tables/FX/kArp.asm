kArp:
    .word se_arp_none
    .word se_arp_lowerThird
    .word se_arp_dimTriad
    .word se_arp_minInvn1
    .word se_arp_sharp5
    .word se_arp_maj7
    .word se_arp_min7
    .word se_arp_minFlat6
    .word se_arp_spread5thlowerThird
    .word se_arp_min7Invn1
    .word se_arp_dom7Invn2
    .word se_arp_dim7
    .word se_arp_majPlusOct

se_arp_none:
    .byte $00, $81

se_arp_lowerThird:
    .byte $00, $00, $F8, $F8, $81

se_arp_dimTriad:
    .byte $00, $03, $06, $81

se_arp_minInvn1:
    .byte $FB, $00, $03, $81

se_arp_sharp5:
    .byte $00, $04, $08, $81

se_arp_maj7:
    .byte $00, $04, $07, $0B, $81

se_arp_min7:
    .byte $00, $03, $07, $0A, $81

se_arp_minFlat6:
    .byte $00, $03, $07, $08, $81

se_arp_spread5thlowerThird:
    .byte $F8, $00, $07, $0C, $81

se_arp_min7Invn1:
    .byte $FE, $00, $03, $07, $81

se_arp_dom7Invn2:
    .byte $FB, $FE, $00, $04, $81

se_arp_dim7:
    .byte $00, $03, $06, $09, $81

se_arp_majPlusOct:
    .byte $00, $04, $07, $0C, $81



