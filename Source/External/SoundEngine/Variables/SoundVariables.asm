SQUARE_1 = $00 ;these are channel constants
SQUARE_2 = $01
TRIANGLE = $02
NOISE = $03
DPMC = $04

MUSIC_SQ1 	= $00 ;these are stream # constants
MUSIC_SQ2 	= $01 ;stream # is used to index into variables
MUSIC_TRI 	= $02
MUSIC_NOI 	= $03
SFX_1     	= $04
SFX_2     	= $05
MUSIC_DPMC 	= $06
SFX_DPMC	= $07

;these are aliases to use in the sound data.
endsound = $A0
loop = $A1
volume_envelope = $A2
duty = $A3
set_loop1_counter = $A4
loop1 = $A5
set_note_offset = $A6
adjust_note_offset = $A7
transpose = $A8
pitch_envelope = $A9
arpeggio = $AA

d_rest = $70

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

l_last = $FF
l_All = $FE
l_Part = $FD
l_Hold = $FC
l_cLast = $80
l_cAll = $81
l_cPart = $82
l_cHold = $83

sound_enable_flags .rs 1 	;updated and written to 4015 (reading 4015 is not the same as writing)
sound_disable_flag  .rs 1   ;a flag variable that keeps track of whether the sound engine is disabled or not. 
sound_temp1 .rs 1           ;temporary variables
sound_temp2 .rs 1
sound_sq1_old .rs 1  ;the last value written to $4003
sound_sq2_old .rs 1  ;the last value written to $4007
soft_apu_ports .rs 20

;reserve 6 bytes, one for each stream
stream_curr_sound .rs 8     ;current song/sfx loaded
stream_status .rs 8         ;status byte.   bit0: (1: stream enabled; 0: stream disabled)
stream_channel .rs 8        ;what channel is this stream playing on?
stream_ptr_LO .rs 8         ;low byte of pointer to data stream
stream_ptr_HI .rs 8         ;high byte of pointer to data stream
stream_ve .rs 8             ;current volume envelope
stream_ve_index .rs 8       ;current position within the volume envelope
stream_vol_duty .rs 8       ;stream volume/duty settings
stream_note_idx .rs 8
stream_note_LO .rs 8        ;low 8 bits of period for the current note on a stream
stream_note_HI .rs 8        ;high 3 bits of period for the current note on a stream 
stream_tempo .rs 8          ;the value to add to our ticker total each frame
stream_ticker_total .rs 8   ;our running ticker total.
stream_note_length_counter .rs 8
stream_note_length .rs 8
stream_loop1 .rs 8          ;loop counter
stream_note_offset .rs 6
stream_pe .rs 8             ;current volume envelope
stream_pe_index .rs 8       ;current position within the volume envelope
stream_pe_offset .rs 8
stream_pe_delay .rs 8
stream_arp .rs 8
stream_arp_index .rs 8
stream_arp_offset .rs 8
