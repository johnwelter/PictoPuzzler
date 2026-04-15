B1m_header:
    .byte $05

    .byte MUSIC_SQ1
    .byte $01
    .byte SQUARE_1
    .byte $30
    .byte $00
    .word B1m_square_1
    .byte $46

    .byte MUSIC_SQ2
    .byte $01
    .byte SQUARE_2
    .byte $30
    .byte $00
    .word B1m_square_2
    .byte $46

    .byte MUSIC_TRI
    .byte $01
    .byte TRIANGLE
    .byte $80
    .byte $00
    .word B1m_triangle
    .byte $46

    .byte MUSIC_NOI
    .byte $01
    .byte NOISE
    .byte $30
    .byte $00
    .word B1m_noise
    .byte $46

    .byte MUSIC_DPMC
    .byte $01
    .byte DPMC
    .byte $00
    .byte $00
    .word B1m_dpmc
    .byte $46

B1m_square_1:
    .byte  $A4, $05
B1m_square_1_sublp_1:
    .byte $82, $A2, $02, $A9, $00, $AA, $00, $A3, $B0, $11, $18, $1D, $1B, $22, $21, $11
    .byte $18, $1D, $1B, $22, $21, $11, $18, $1D, $1B, $22, $21, $24, $1F, $21, $1D, $1F
    .byte $1B
    .byte $A5
    .word B1m_square_1_sublp_1
    .byte  $A4, $03
B1m_square_1_sublp_2:
    .byte $82, $A2, $02, $A3, $B0, $11, $18, $1D, $1B, $22, $21
    .byte $A5
    .word B1m_square_1_sublp_2
    .byte $83, $A2, $02, $24, $A2, $02, $24, $A2, $07, $24, $89, $A2, $0F, $A9, $02, $21
    .byte $24, $1F, $21, $89, $1A, $89, $5E, $89, $5E, $89, $5E
    .byte $A1
    .word B1m_square_1

B1m_square_2:
    .byte $82, $5E
    .byte  $A4, $05
B1m_square_2_sublp_1:
    .byte $82, $A2, $01, $A3, $B0, $11, $18, $1D, $1B, $22, $21, $82, $A3, $B0, $11, $18
    .byte $1D, $1B, $22, $21, $82, $A3, $B0, $11, $18, $1D, $1B, $22, $21, $24, $1F, $21
    .byte $1D, $1F, $1B
    .byte $A5
    .word B1m_square_2_sublp_1
    .byte  $A4, $03
B1m_square_2_sublp_2:
    .byte $82, $A2, $01, $A3, $B0, $11, $18, $1D, $1B, $22, $21
    .byte $A5
    .word B1m_square_2_sublp_2
    .byte $83, $A2, $02, $24, $A2, $07, $24, $82, $A2, $07, $24, $89, $5E, $5E, $5E, $5E
    .byte $5E, $5E, $5E, $5E
    .byte $A1
    .word B1m_square_2

B1m_triangle:
    .byte $89, $A2, $0B, $A9, $00, $5E, $5E, $5E, $5E
    .byte  $A4, $02
B1m_triangle_sublp_1:
    .byte $88, $1D, $83, $A2, $00, $1D, $82, $1D, $83, $A2, $0F, $1D, $18, $1A, $88, $A2
    .byte $0B, $1B, $83, $A2, $00, $1B, $82, $1B, $83, $A2, $0F, $1B, $16, $18, $88, $1D
    .byte $83, $A2, $00, $1D, $82, $1D, $83, $A2, $0F, $1D, $A9, $02, $1F, $82, $1F, $A9
    .byte $00, $1D, $88, $A2, $0B, $1B, $83, $A2, $00, $1B, $82, $1B, $83, $A2, $0F, $1B
    .byte $16, $15
    .byte $A5
    .word B1m_triangle_sublp_1
    .byte $89, $5E, $5E, $5E, $5E, $89, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E
    .byte $A1
    .word B1m_triangle

B1m_noise:
    .byte $89, $A2, $0F, $20, $20, $20, $20, $00, $20, $20, $20, $00, $20, $20, $84, $20
    .byte $83, $A2, $01, $02, $83, $A2, $0A, $20, $88, $20, $82, $20, $20, $81, $04, $81
    .byte $04, $88, $20, $82, $20, $88, $20, $83, $20, $82, $20, $83, $20, $82, $20, $81
    .byte $04, $04, $83, $20, $89, $A2, $0F, $20, $20, $20, $20, $02, $20, $00, $84, $20
    .byte $83, $A2, $01, $02, $89, $A2, $0F, $04, $89, $A2, $0F, $04, $89, $A2, $0F, $04
    .byte $89, $A2, $0F, $04, $89, $A2, $0F, $04, $20, $20, $20
    .byte $A1
    .word B1m_noise

B1m_dpmc:
    .byte  $A4, $06
B1m_dpmc_sublp_1:
    .byte $89, $70, $70
    .byte $A5
    .word B1m_dpmc_sublp_1
    .byte $83, $0E, $88, $70, $82, $0E, $1E, $70, $88, $1E, $82, $0E, $88, $0E, $83, $0E
    .byte $82, $1E, $83, $0E, $82, $0E, $82, $70, $81, $1F, $1E, $0F, $0E, $83, $0E, $88
    .byte $70, $82, $0E, $1E, $80, $0E, $0E, $0E, $0E, $82, $1E, $1E, $1E, $1E, $82, $1E
    .byte $83, $0E, $83, $1E, $82, $1E, $83, $0E, $82, $1E, $80, $0E, $0E, $0E, $0E, $82
    .byte $1E, $82, $1E, $84, $0E, $82, $70, $0E, $84, $0E, $82, $70, $0E, $84, $0E, $82
    .byte $70, $0E, $89, $0E, $89, $1E, $1E, $1E, $1E, $89, $0E, $7E, $7E, $7E
    .byte $A1
    .word B1m_dpmc

