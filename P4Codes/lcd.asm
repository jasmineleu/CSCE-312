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

    @LTZERO
    D;JLT      // if a-b < 0 (a < b) go to LTZERO

    @EQUAL
    D;JEQ      // if a-b == 0 (a == b)  go to EQUAL

    @b
    D = M      // D = b
    @a
    M = M - D  // a = a-b

    @MOD
    0;JEQ

(LTZERO)       // swap a and b
    @a
    D = M      // D = a
    @9999
    M = D      // RAM[9999] = a
    @b
    D = M      // D = b
    @a
    M = D      // a = b
    @9999
    D = M      // D = a
    @b
    M = D      // b = a
    @MOD
    0;JMP

(EQUAL)
    @a
    D = M      // D = a
    @R2
    M = D      // RAM[2] = a
    @END
    0;JMP

(END)
    @END
    0;JMP
