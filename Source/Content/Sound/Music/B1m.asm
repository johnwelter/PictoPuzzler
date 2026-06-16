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
    .byte $83, $A2, $02, $24, $A2, $02, $24, $A2, $07, $24, $82, $5E, $A2, $0B, $A9, $01
    .byte $A3, $70, $18, $1D, $1F, $21, $22, $89, $24, $82, $22, $83, $21, $82, $1D, $83
    .byte $18, $1A, $1B, $19, $88, $18, $89, $21, $88, $5E, $89, $5E, $5E, $82, $5E, $A2
    .byte $0B, $A9, $01, $A3, $70, $18, $1D, $1F, $21, $22, $89, $24, $82, $27, $83, $26
    .byte $88, $24, $83, $A9, $02, $2B, $A9, $01, $2D, $2E, $88, $2D, $89, $29, $5E, $5E
    .byte $88, $5E, $82, $A9, $01, $5E, $14, $1D, $1B, $19, $20, $5E, $20, $29, $27, $25
    .byte $2C, $83, $2B, $82, $29, $88, $27, $83, $2B, $27, $22, $89, $A2, $0E, $24, $1F
    .byte $21, $1B, $82, $5E, $A2, $0B, $14, $1D, $1B, $19, $20, $5E, $20, $29, $27, $25
    .byte $2C, $83, $2B, $82, $29, $88, $27, $83, $27, $27, $25, $89, $A2, $0B, $30, $89
    .byte $30, $89, $30, $89, $A2, $0E, $30
    .byte $A1
    .word B1m_square_1

B1m_square_2:
    .byte $82, $A2, $01, $A9, $00, $AA, $00, $A3, $B0, $5E
    .byte  $A4, $05
B1m_square_2_sublp_1:
    .byte $82, $11, $18, $1D, $1B, $22, $21, $82, $A3, $B0, $11, $18, $1D, $1B, $22, $21
    .byte $82, $A3, $B0, $11, $18, $1D, $1B, $22, $21, $24, $1F, $21, $1D, $1F, $1B
    .byte $A5
    .word B1m_square_2_sublp_1
    .byte  $A4, $03
B1m_square_2_sublp_2:
    .byte $82, $A2, $01, $A3, $B0, $11, $18, $1D, $1B, $22, $21
    .byte $A5
    .word B1m_square_2_sublp_2
    .byte $83, $A2, $02, $24, $A2, $07, $24, $82, $A2, $07, $24
    .byte  $A4, $04
B1m_square_2_sublp_3:
    .byte $82, $A3, $B0, $1D, $24, $29, $27, $2E, $2D, $82, $A3, $B0, $1D, $24, $29, $27
    .byte $2E, $2D, $82, $A3, $B0, $1D, $24, $29, $27, $2E, $2D, $30, $2B, $2D, $29, $2B
    .byte $27
    .byte $A5
    .word B1m_square_2_sublp_3
    .byte $89, $5E, $88, $A2, $0B, $A3, $70, $1F, $82, $1D, $83, $1B, $82, $1F, $16, $1D
    .byte $16, $1B, $16, $22, $1B, $21, $1B, $1F, $1B
    .byte  $A4, $04
B1m_square_2_sublp_4:
    .byte $82, $A2, $02, $A9, $00, $A3, $B0, $1D, $24, $29, $27, $2E, $2D
    .byte $A5
    .word B1m_square_2_sublp_4
    .byte $89, $5E, $88, $A2, $0B, $A3, $70, $1F, $82, $1D, $83, $1B, $82, $1F, $16, $1D
    .byte $16, $1B, $16, $22, $16, $22, $16, $22, $16
    .byte  $A4, $04
B1m_square_2_sublp_5:
    .byte $A2, $02, $A3, $B0, $18, $1F, $24, $22, $29, $28
    .byte $A5
    .word B1m_square_2_sublp_5
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
    .byte $89, $5E, $5E, $5E, $5E
    .byte  $A4, $04
B1m_triangle_sublp_2:
    .byte $88, $1D, $83, $A2, $00, $1D, $82, $1D, $83, $A2, $0F, $1D, $18, $1A, $88, $A2
    .byte $0B, $1B, $83, $A2, $00, $1B, $82, $1B, $83, $A2, $0F, $1B, $16, $18
    .byte $A5
    .word B1m_triangle_sublp_2
    .byte $88, $A9, $00, $19, $83, $A2, $00, $19, $82, $19, $A2, $0F, $19, $14, $A9, $02
    .byte $1D, $A9, $00, $14, $A9, $02, $19, $A9, $00, $14, $88, $A2, $0B, $1B, $83, $A2
    .byte $00, $1B, $82, $1B, $A2, $0F, $1B, $16, $A9, $02, $1F, $A9, $00, $16, $A9, $02
    .byte $1B, $A9, $00, $16, $88, $1D, $83, $A2, $00, $1D, $82, $1D, $83, $A2, $0F, $1D
    .byte $18, $1B, $88, $1D, $83, $A2, $00, $1D, $82, $1D, $83, $A2, $0F, $1D, $18, $1B
    .byte $88, $A9, $00, $19, $83, $A2, $00, $19, $82, $19, $A2, $0F, $19, $14, $A9, $02
    .byte $1D, $A9, $00, $14, $A9, $02, $19, $A9, $00, $14, $88, $A2, $0B, $1B, $83, $A2
    .byte $00, $1B, $82, $1B, $A2, $0F, $1B, $16, $A9, $02, $1F, $A9, $00, $16, $A9, $02
    .byte $1B, $A9, $00, $16, $88, $18, $83, $A2, $00, $18, $82, $18, $83, $A2, $0F, $18
    .byte $A9, $02, $1F, $A9, $02, $1F, $88, $A9, $00, $18, $83, $A2, $00, $18, $82, $18
    .byte $A2, $0F, $18, $A9, $02, $24, $A9, $00, $16, $A9, $02, $18, $A9, $02, $24, $A9
    .byte $00, $18
    .byte $A1
    .word B1m_triangle

B1m_noise:
    .byte $89, $A2, $0F, $20, $20, $20, $20, $00, $20, $20, $20, $00, $20, $20, $84, $20
    .byte $83, $A2, $01, $02, $83, $A2, $0A, $20, $88, $20, $82, $20, $20, $81, $04, $81
    .byte $04, $88, $20, $82, $20, $88, $20, $83, $20, $82, $20, $83, $20, $82, $20, $81
    .byte $04, $04, $83, $20, $89, $A2, $0F, $20, $20, $20, $20, $02, $20, $00, $84, $20
    .byte $83, $A2, $01, $02
    .byte  $A4, $10
B1m_noise_sublp_1:
    .byte $82, $A2, $0A, $02, $04, $04, $02, $04, $02, $02, $04, $04, $04, $02, $04
    .byte $A5
    .word B1m_noise_sublp_1
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
    .byte $70, $0E, $89, $0E
    .byte  $A4, $10
B1m_dpmc_sublp_2:
    .byte $83, $0E, $82, $0E, $83, $1E, $82, $1E, $83, $0E, $0E, $1E
    .byte $A5
    .word B1m_dpmc_sublp_2
    .byte $A1
    .word B1m_dpmc

