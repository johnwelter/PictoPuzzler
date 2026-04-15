bank2_header:
    .byte $05           ;4 streams
    
    .byte MUSIC_SQ1     	;which stream
    .byte $01           	;status byte (stream enabled)
    .byte SQUARE_1      	;which channel
    .byte $30           	;initial duty (01)
    .byte ve_veryLong_decay ;volume envelope
    .word bank2_square1 	;pointer to stream
    .byte $28           	;tempo
    
    .byte MUSIC_SQ2     	;which stream
    .byte $01           	;status byte (stream enabled)
    .byte SQUARE_2      	;which channel
    .byte $30           	;initial duty (10)
    .byte ve_veryLong_decay ;volume envelope
    .word bank2_square2 	;pointer to stream
    .byte $28           	;tempo
    
    .byte MUSIC_TRI     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial volume (on)
    .byte ve_tgl_1      ;volume envelope
    .word bank2_tri     ;pointer to stream
    .byte $28           ;tempo
    
    .byte MUSIC_NOI     ;which stream
    .byte $01           ;enabled
    .byte NOISE     
    .byte $30           ;initial duty_vol
    .byte ve_hiHat_decay ;volume envelope
    .word bank2_noise   ;pointer to stream
    .byte $28           ;tempo
	
	.byte MUSIC_DPMC
	.byte $01
	.byte DPMC
	.byte $30
	.byte ve_hiHat_decay
	.word bank2_dpcm  ;pointer to stream
    .byte $28           ;tempo

;;this will require funky timing to get it right. base everything on 32nd notes, using them as 24ths
    
bank2_square2:

	.byte duty, $30
	.byte arpeggio, arp_dimTriad
	.byte quarterSwing, Ds4
	.byte arpeggio, arp_minInvn1
	.byte quarterSwing, Fs4
	.byte arpeggio, arp_dimTriad
	.byte quarterSwing, Fs4
	.byte arpeggio, arp_sharp5
	.byte five_thirtyseconds, E4
	
	.byte wholeSwing
	.byte arpeggio, arp_maj7, E4, rest
	.byte arpeggio, arp_min7, Ds4, rest
	.byte arpeggio, arp_maj7, E4, rest
	.byte arpeggio, arp_min7, Ds4, rest
	.byte arpeggio, arp_maj7, E4, rest
	.byte arpeggio, arp_min7, Ds4, rest
	.byte arpeggio, arp_maj7, E4, rest
	.byte arpeggio, arp_minFlat6, Ds4, swingUp, rest
	.byte arpeggio, arp_spread5thlowerThird, wholeSwing, B4
	
	.byte arpeggio, arp_min7Invn1, A4
	.byte arpeggio, arp_dom7Invn2, D5
	.byte arpeggio, arp_min7Invn1, B4
	.byte arpeggio, arp_dim7, G4
	
	.byte arpeggio, arp_min7Invn1, A4
	.byte arpeggio, arp_dom7Invn2, D5
	.byte arpeggio, arp_majPlusOct, G4
	.byte rest
	
	.byte arpeggio, arp_min7Invn1, A4
	.byte arpeggio, arp_dom7Invn2, D5
	.byte arpeggio, arp_min7Invn1, B4
	.byte arpeggio, arp_dim7, G4
	
	.byte arpeggio, arp_min7Invn1, A4
	.byte arpeggio, arp_dom7Invn2, D5
	.byte arpeggio, arp_min7Invn1, C5
	
	.byte loop
    .word bank2_square2
	
bank2_square1:
	
	.byte duty, $30
	.byte pitch_envelope, me_none
	.byte quarterSwing, Ds5, Cs5, Fs5, five_thirtyseconds, E5
	.byte wholeSwing, Ds5, swingUp, rest, quarterSwing, rest
	
	.byte quarterSwing, Gs4, B4, five_thirtyseconds, Ds5 
	.byte wholeSwing, Cs5, swingUp, rest, quarterSwing, rest
	
	.byte quarterSwing, Fs4, Gs4, five_thirtyseconds, B4
	.byte wholeSwing, Ds5, swingUp, rest, quarterSwing, rest
	
	.byte quarterSwing, B4, Cs6, five_thirtyseconds, As5
	.byte wholeSwing, Fs5, swingUp, rest
	.byte wholeSwing_m1, Gs5
	
	.byte duty, $70
	.byte d_halfSwing_p1, Ds5, five_thirtyseconds, Fs5
	.byte halfSwing_p1, Cs5, halfSwing, Ds5
	.byte swingDown, As4, swingUp, Fs4, swingDown, B4, halfSwing_p1, As4, quarterSwing, Fs4
	.byte swingDown, Ds5, swingUp, B4, swingDown, E5, halfSwing_p3, Ds5, swingUp, E4, swingDown, Ds4
	.byte half, B4, d_sixteenth, Gs4, B4, swingDown, Ds5, halfSwing_p1, As4, halfSwing_m1, Fs4, wholeSwing_p1, B4
	.byte wholeSwing, rest
	
	.byte duty, $B0
	.byte pitch_envelope, me_none
	.byte volume_envelope, ve_blip_echo
	.byte d_sixteenth, rest, G4, G4, E4, G4, swingDown, E4, quarterSwing, A4, swingUp, D4
	.byte d_sixteenth, E4, G4, G4, E4, G4, swingDown, E4, quarterSwing, B4, swingUp, As4
	.byte d_sixteenth, B4, A4, G4, swingDown, Fs4, d_sixteenth, A4, swingUp, A4, d_sixteenth, G4, Fs4, E4
	.byte G4, Fs4, swingDown, E4, d_sixteenth, D4, d_quarterSwing, B3, swingUp, A3, swingDown, B3
	.byte eighth, C4, d_sixteenth, C4, swingDown, C4, eighth, A3, d_sixteenth, B3, swingDown, A3, d_sixteenth, G3, eighth, A3
	.byte d_sixteenth, rest, C4, swingDown, C4, eighth, A3, d_sixteenth, Fs4, swingDown, E4, d_sixteenth, D4, E4, swingUp, B3
	.byte d_sixteenth, D4, E4, swingDown, G4, d_sixteenth, E4, B4, swingUp, B4, swingDown, G4, swingUp, A4, swingDown, Fs4, swingUp, D4, swingDown, E4, swingUp, Fs4
	.byte swingDown, G4, swingUp, E4, swingDown, Fs4, swingUp, D4, swingDown, E4, swingUp, A3, swingDown, D4, halfSwing_p1, B3
	
	.byte duty, $70
	.byte pitch_envelope, me_none
	.byte volume_envelope, ve_veryLong_decay
	.byte quarterSwing, rest, E5, d_quarterSwing, G5, d_sixteenth, B5
	.byte quarterSwing, D5, halfSwing, E5, d_sixteenth, B4, C5
	.byte d_halfSwing, D5, quarterSwing, Fs5
	.byte wholeSwing, D5

	.byte quarterSwing, rest, E5, G5, B5
	.byte D6, halfSwing, A5, swingDown, E5, swingUp, Fs5, swingDown, E5, swingUp, D5
	.byte wholeSwing, G5
	
    .byte loop
    .word bank2_square1
    
bank2_tri:

	.byte volume_envelope, ve_tgl_1
	.byte set_loop1_counter, 2
	
	
	.byte halfSwing, rest

	
bank2_triFirstLoop:

	.byte pitch_envelope, me_bassKick
	.byte thirtysecond, B4, B4, B4, F4, F4, F4
	.byte swingDown, D4, swingUp, B3
	.byte swingDown, rest

	.byte pitch_envelope, me_none
	.byte d_sixteenth, E3
	.byte swingUp, E3
	.byte d_sixteenth, E2, E3, E2
	.byte five_thirtyseconds, E3
	.byte d_sixteenth, Cs2, Ds2
	.byte d_sixteenth, E3
	.byte swingUp, E3
	.byte d_sixteenth, E2, E3, E2
	.byte five_thirtyseconds, E3
	.byte d_sixteenth, E3, Fs3

	.byte d_sixteenth, B2
	.byte swingUp, B2
	.byte d_sixteenth, B1, B2, B1
	.byte five_thirtyseconds, B2
	.byte d_sixteenth, A1, As1
	.byte d_sixteenth, B2
	.byte swingUp, B2
	.byte d_sixteenth, B1, B2, B1
	.byte five_thirtyseconds, B2
	.byte d_sixteenth, A1, As1
	
	.byte d_sixteenth, E3
	.byte swingUp, E3
	.byte d_sixteenth, E2, E3, E2
	.byte five_thirtyseconds, E3
	.byte d_sixteenth, Cs2, Ds2
	.byte d_sixteenth, E3
	.byte swingUp, E3
	.byte d_sixteenth, E2, E3, E2
	.byte five_thirtyseconds, E3
	.byte d_sixteenth, E3, Fs3

	.byte d_sixteenth, B2
	.byte swingUp, B2
	.byte d_sixteenth, B1, B2, B1
	.byte five_thirtyseconds, B2
	.byte d_sixteenth, A1, As1
	.byte d_sixteenth, B2
	.byte swingUp, B2
	.byte d_sixteenth, B1, B2, B1
	
	.byte loop1
	.word bank2_triFirstLoop
	
	.byte pitch_envelope, me_bassKick
	.byte thirtysecond, B4, B4, B4, F4, F4, F4
	.byte swingDown, D4, swingUp, B3
	.byte d_sixteenth, rest
	
	.byte pitch_envelope, me_none
	.byte d_sixteenth, C3, C3
	.byte swingDown, C4
	.byte eighth, C3
	.byte swingDown, C3
	.byte d_sixteenth, rest
	.byte swingUp, C3
	.byte swingDown, C4
	.byte d_sixteenth, C3
	.byte swingUp, C3
	
	.byte d_sixteenth, Fs3, Fs3
	.byte swingDown, Fs4
	.byte eighth, Fs3
	.byte swingDown, Fs3
	.byte d_sixteenth, rest
	.byte swingUp, Fs3
	.byte swingDown, Fs4
	.byte d_sixteenth, Fs3
	.byte swingUp, Fs3
	
	.byte d_sixteenth, B2, B2
	.byte swingDown, B3
	.byte eighth, B2
	.byte swingDown, B2
	.byte d_sixteenth, rest
	.byte swingUp, B2
	.byte swingDown, B3
	.byte d_sixteenth, B2
	.byte swingUp, B2
	
	.byte d_sixteenth, E3, E3
	.byte swingDown, E4
	.byte eighth, E3
	.byte swingDown, E3
	.byte d_sixteenth, rest
	.byte swingUp, E3
	.byte swingDown, E4
	.byte d_sixteenth, E3
	.byte swingUp, E3
	
	.byte pitch_envelope, me_none
	.byte d_sixteenth, C3, C3
	.byte swingDown, C4
	.byte eighth, C3
	.byte swingDown, C3
	.byte d_sixteenth, rest
	.byte swingUp, C3
	.byte swingDown, C4
	.byte d_sixteenth, C3
	.byte swingUp, C3
	
	.byte d_sixteenth, Fs3, Fs3
	.byte swingDown, Fs4
	.byte eighth, Fs3
	.byte swingDown, Fs3
	.byte d_sixteenth, rest
	.byte swingUp, Fs3
	.byte swingDown, Fs4
	.byte d_sixteenth, Fs3
	.byte swingUp, Fs3
	
	.byte d_sixteenth, G3, G3
	.byte swingDown, G4
	.byte eighth, G3
	.byte swingDown, G3
	.byte d_sixteenth, rest
	.byte swingUp, G3
	.byte swingDown, G4
	.byte d_sixteenth, G3
	.byte swingUp, G3
	
	.byte d_sixteenth, E3, E3
	.byte swingDown, E4
	.byte eighth, E3
	
	.byte pitch_envelope, me_bassKick
	.byte thirtysecond, B4, B4, B4, F4, F4, F4
	.byte swingDown, D4, swingUp, B3
	.byte d_sixteenth, rest
	
	.byte pitch_envelope, me_none
	.byte d_sixteenth, C3, C3
	.byte swingDown, C4
	.byte eighth, C3
	.byte swingDown, C3
	.byte d_sixteenth, rest
	.byte swingUp, C3
	.byte swingDown, C4
	.byte d_sixteenth, C3
	.byte swingUp, C3
	
	.byte d_sixteenth, Fs3, Fs3
	.byte swingDown, Fs4
	.byte eighth, Fs3
	.byte swingDown, Fs3
	.byte d_sixteenth, rest
	.byte swingUp, Fs3
	.byte swingDown, Fs4
	.byte d_sixteenth, Fs3
	.byte swingUp, Fs3
	
	.byte d_sixteenth, B2, B2
	.byte swingDown, B3
	.byte eighth, B2
	.byte swingDown, B2
	.byte d_sixteenth, rest
	.byte swingUp, B2
	.byte swingDown, B3
	.byte d_sixteenth, B2
	.byte swingUp, B2
	
	.byte d_sixteenth, E3, E3
	.byte swingDown, E4
	.byte eighth, E3
	.byte swingDown, E3
	.byte d_sixteenth, rest
	.byte swingUp, E3
	.byte swingDown, E4
	.byte d_sixteenth, E3
	.byte swingUp, E3
	
	.byte pitch_envelope, me_none
	.byte d_sixteenth, C3, C3
	.byte swingDown, C4
	.byte eighth, C3
	.byte swingDown, C3
	.byte d_sixteenth, rest
	.byte swingUp, C3
	.byte swingDown, C4
	.byte d_sixteenth, C3
	.byte swingUp, C3
	
	.byte d_sixteenth, Fs3, Fs3
	.byte swingDown, Fs4
	.byte eighth, Fs3
	.byte swingDown, Fs3
	.byte d_sixteenth, rest
	.byte swingUp, Fs3
	.byte swingDown, Fs4
	.byte d_sixteenth, Fs3
	.byte swingUp, Fs3
	
	.byte d_sixteenth, Ds3, Ds3
	.byte swingDown, Ds4
	.byte eighth, Ds3
	.byte swingDown, Ds3
	.byte d_sixteenth, rest
	.byte swingUp, Ds3
	.byte swingDown, Ds4
	.byte d_sixteenth, Ds3
	.byte swingUp, Ds3
	
	.byte loop
    .word bank2_tri
   
   
   
bank2_noise:
	
	.byte volume_envelope, ve_drum_decay
    .byte quarterSwing, $04, $04, $04, $04
	 
	.byte set_loop1_counter, 14             	; repeat 14 times 
	
bank2_noiseMainLoop:

	.byte volume_envelope, ve_hiHat_decay
	.byte swingDown, $04, swingUp, $04, swingDown, $04, swingUp, $04	
	.byte volume_envelope, ve_drum_decay
	.byte swingDown, $04
	.byte volume_envelope, ve_hiHat_decay
	.byte swingUp, $04, swingDown, $04, swingUp, $04
	
	.byte loop1                             
    .word bank2_noiseMainLoop
	.byte loop
	.word bank2_noise

bank2_dpcm:

	.byte quarterSwing, $0B, $0B, $0B
	.byte swingDown, $1B, eighthSwing, $0B, swingUp, $01
	.byte set_loop1_counter, 7  

bank2_dpcmMainLoop:
	
	.byte quarterSwing, $0B, $1B, $0B
	.byte swingDown, $1B, eighthSwing, $0B, swingUp, $01
	
	.byte loop1
	.word bank2_dpcmMainLoop
	.byte loop
	.word bank2_dpcm
