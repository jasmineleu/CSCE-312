// Jasmine Leu

@R0
D = M
@a             // a = RAM[0]
M = D

@R1
D = M
@b             // b = RAM[1]
M = D

@0
D = A          // D = 0
@R2
M = D          // RAM[2] = 0


(MOD)
    @a
    D = M      // D = a
    @b
    D = D - M  // D = a-b

    @ZERO
    D;JEQ      // if a-b == 0 go to ZERO

    @LTZERO
    D;JLT      // if a-b < 0 (a < b) go to LTZERO

    @b
    D = M      // D = b
    @a
    M = M - D  // a = a-b

    @MOD
    0;JMP

(ZERO)
    @R2
    M = 0      // RAM[2] = 0
    @END
    0;JMP

(LTZERO)
    @a
    D = M      // D = a
    @R2
    M = D      // RAM[2] = a
    @END
    0;JMP

(END)
    @END
    0;JMP
