Title_header:
    .byte $05

    .byte MUSIC_SQ1
    .byte $01
    .byte SQUARE_1
    .byte $30
    .byte $00
    .word Title_square_1
    .byte $3A

    .byte MUSIC_SQ2
    .byte $01
    .byte SQUARE_2
    .byte $30
    .byte $00
    .word Title_square_2
    .byte $3A

    .byte MUSIC_TRI
    .byte $01
    .byte TRIANGLE
    .byte $80
    .byte $00
    .word Title_triangle
    .byte $3A

    .byte MUSIC_NOI
    .byte $01
    .byte NOISE
    .byte $30
    .byte $00
    .word Title_noise
    .byte $3A

    .byte MUSIC_DPMC
    .byte $01
    .byte DPMC
    .byte $00
    .byte $00
    .word Title_dpmc
    .byte $3A

Title_square_1:
    .byte $83, $A2, $00, $A3, $30, $5E, $87, $24, $82, $24, $87, $22, $83, $5E, $83, $5E
    .byte $87, $21, $82, $21, $87, $1F, $82, $5E, $81, $1F, $88, $A2, $02, $1B, $85, $5E
    .byte $84, $5E, $87, $5E, $83, $A2, $00, $A3, $30, $5E, $87, $24, $82, $24, $87, $22
    .byte $83, $5E, $83, $5E, $87, $27, $82, $27, $87, $26, $82, $5E, $81, $26, $88, $A2
    .byte $02, $29, $85, $5E, $84, $5E, $87, $5E
    .byte $A1
    .word Title_square_1

Title_square_2:
    .byte $83, $A2, $00, $A3, $30, $5E, $87, $21, $82, $21, $87, $1F, $83, $5E, $83, $5E
    .byte $87, $1D, $82, $1D, $87, $1B, $82, $5E, $81, $1B, $88, $A2, $02, $15, $85, $5E
    .byte $84, $5E, $87, $5E, $83, $A2, $00, $A3, $30, $5E, $87, $21, $82, $21, $87, $1F
    .byte $83, $5E, $83, $5E, $87, $24, $82, $24, $87, $22, $82, $5E, $81, $22, $88, $A2
    .byte $02, $21, $85, $5E, $84, $5E, $87, $5E
    .byte $A1
    .word Title_square_2

Title_triangle:
    .byte  $A4, $04
Title_triangle_sublp_1:
    .byte $85, $A2, $0F, $A9, $01, $5E, $85, $A2, $09, $5E
    .byte $A5
    .word Title_triangle_sublp_1
    .byte  $A4, $03
Title_triangle_sublp_2:
    .byte $83, $A2, $0F, $A9, $01, $11, $87, $A2, $09, $1D, $81, $A2, $00, $A9, $02, $1D
    .byte $82, $A2, $09, $A9, $01, $11, $82, $A2, $0F, $11, $83, $A2, $09, $1D
    .byte $A5
    .word Title_triangle_sublp_2
    .byte $83, $A2, $0F, $A9, $01, $11, $87, $A2, $09, $1D, $81, $A2, $00, $A9, $02, $1D
    .byte $82, $A2, $0F, $A9, $01, $0E, $A9, $02, $1A, $A9, $01, $0F, $A9, $02, $1B
    .byte  $A4, $03
Title_triangle_sublp_3:
    .byte $83, $A2, $0F, $A9, $01, $11, $87, $A2, $09, $1D, $81, $A2, $00, $A9, $02, $1D
    .byte $82, $A2, $09, $A9, $01, $11, $82, $A2, $0F, $11, $83, $A2, $09, $1D
    .byte $A5
    .word Title_triangle_sublp_3
    .byte $83, $A2, $0F, $A9, $01, $11, $87, $A2, $09, $1D, $81, $A2, $00, $A9, $02, $1D
    .byte $82, $A2, $0F, $A9, $01, $0E, $A9, $02, $1A, $A9, $01, $0F, $A9, $02, $1B
    .byte $A1
    .word Title_triangle

Title_noise:
    .byte $81, $A2, $0A, $04, $82, $20, $04
    .byte $A1
    .word Title_noise

Title_dpmc:
    .byte $81, $0E, $0E, $82, $7E, $83, $1E, $0E, $1E, $81, $0E, $0E, $82, $7E, $87, $1E
    .byte $81, $1E, $82, $0E, $0E, $83, $1E
    .byte $A1
    .word Title_dpmc

