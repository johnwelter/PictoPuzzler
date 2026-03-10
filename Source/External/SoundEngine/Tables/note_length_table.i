;note length constants (aliases)
thirtysecond = $80
sixteenth = $81
eighth = $82
quarter = $83
half = $84
whole = $85
d_sixteenth = $86
d_eighth = $87
d_quarter = $88
d_half = $89
d_whole = $8A   ;don't forget we are counting in hex
t_quarter = $8B
five_eighths =$8C
five_sixteenths=$8D
d_half_d_eight = $8E
whole_quarter_sixteenth = $8F
d_half_eighth = $90
whole_sixteenth = $91
quarterSwing = $87
halfSwing = $88
wholeSwing = $89
eighthSwing = $86
swingDown = $81
swingUp = $80
five_thirtyseconds = $92

d_halfSwing_p1 = $93
halfSwing_p1 = $94
halfSwing_p3 = $95
halfSwing_m1 = $96
wholeSwing_p1 = $97
quarterSwing_p1 = $98
d_quarterSwing = $99
d_halfSwing = $9A
wholeSwing_m1 = $9B


note_length_table:
    .byte $01   ;32nd note
    .byte $02   ;16th note
    .byte $04   ;8th note
    .byte $08   ;quarter note
    .byte $10   ;half note
    .byte $20   ;whole note
              ;---dotted notes
    .byte $03   ;dotted 16th note
    .byte $06   ;dotted 8th note
    .byte $0C   ;dotted quarter note
    .byte $18   ;dotted half note
    .byte $30   ;dotted whole note?
              ;---other
    .byte $07   ;modified quarter to fit after d_sixteenth triplets
    .byte $14   ;2 quarters plus an 8th
    .byte $0A	
	.byte $1E	;dotted half + dotted eighth
	.byte $2A
	.byte $1C
	.byte $22
	.byte $05
	.byte $13 	;dotted half swing with pick up swing
	.byte $0D 	;half swing with pick up swig
	.byte $0F	;half swing with extra d_sixteenth
	.byte $0B 	;half swing minus one sixteenth
	.byte $19 	;whole swing with pick up swing
	.byte $07 	;quarter swing with pick up sixteenth
	.byte $09 	;dotted quarter swing
	.byte $12	;dotted half swing
	.byte $17	;whole swing minus one ts