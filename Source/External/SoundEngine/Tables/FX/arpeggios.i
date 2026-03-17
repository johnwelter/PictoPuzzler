arpeggios:
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
	.byte $00
	.byte $80

se_arp_lowerThird:
	.byte $00, $00, $F8, $F8
	.byte $80
	
se_arp_dimTriad:
	.byte $00, $03, $06
	.byte $80

se_arp_minInvn1:
	.byte $FB, $00, $03
	.byte $80
	
se_arp_sharp5:
	.byte $00, $04, $08
	.byte $80

se_arp_maj7:
	.byte $00, $04, $07, $0B
	.byte $80
	
se_arp_min7:
	.byte $00, $03, $07, $0A
	.byte $80

se_arp_minFlat6:
	.byte $00, $03, $07, $08
	.byte $80
	
se_arp_spread5thlowerThird:

	.byte $F8, $00, $07, $0C
	.byte $80
	
se_arp_min7Invn1:

	.byte $FE, $00, $03, $07
	.byte $80

se_arp_dom7Invn2:
	
	.byte $FB, $FE, $00, $04
	.byte $80

se_arp_dim7:
	
	.byte $00, $03, $06, $09
	.byte $80

se_arp_majPlusOct:

	.byte $00, $04, $07, $0C
	.byte $80
	


arp_none = $00
arp_lowerThird = $01
arp_dimTriad = $02
arp_minInvn1 = $03
arp_sharp5 = $04
arp_maj7 = $05
arp_min7 = $06
arp_minFlat6 = $07
arp_spread5thlowerThird = $08
arp_min7Invn1 = $09
arp_dom7Invn2 = $0A
arp_dim7 = $0B
arp_majPlusOct = $0C




