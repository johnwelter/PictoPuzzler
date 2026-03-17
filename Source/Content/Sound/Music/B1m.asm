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
    .byte $00

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
    .byte $83, $A2, $02, $A9, $00, $AA, $00, $24, $81, $1F, $24, $83, $2B, $82, $2B, $83
    .byte $27, $26, $22, $83, $20, $24, $26, $1F, $22, $82, $27, $26
    .byte $A1
    .word B1m_square_1

B1m_triangle:
    .byte $88, $A2, $09, $18, $83, $18, $82, $18, $83, $14, $0F, $16, $88, $14, $83, $0F
    .byte $82, $20, $83, $1B, $1A, $16
    .byte $A1
    .word B1m_triangle

B1m_noise:
    .byte $81, $A2, $0A, $03, $82, $01, $01, $81, $01, $01
    .byte $A1
    .word B1m_noise

B1m_dpmc:
    .byte $83, $0E, $81, $1E, $1E, $82, $0E, $82, $1E, $82, $1E, $83, $0E, $81, $1E, $1E
    .byte $1E, $0E, $1E, $0E, $1E, $1E
    .byte $A1
    .word B1m_dpmc

