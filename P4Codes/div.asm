@R0
D=M
@a             // a=RAM[0]
M=D
@R1
D=M
@b             // b=RAM[1]
M=D
@0
D=A          // D=0
@R2
M=D          // RAM[2]=0
(DIV)
    @a
    D=M      // D=a
    @b
    D=D-M  // D=a-b
    @END
    D;JLT      // if a-b < 0 (a < b) go to END
    @R2
    M=M+1  // M[2]=M[2]+1
    @b
    D=M      // D=b
    @a
    M=M-D  // a=a-b
    @DIV
    0;JMP
(END)
    @END
    0;JMP
