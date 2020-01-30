// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm
// Jasmine Leu

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
(LOOP)
    @KBD
    D=M        // D = keyboard value

    @ON
    D;JGT      // if D > 0, go to ON

    @OFF
    0;JMP      // else, go to OFF

(ON)
    @R0
    M = -1
    @FILL
    0;JMP

(OFF)
    @R0
    M = 0
    @FILL
    0;JMP

(FILL)
    @8191
    D = A
    @R1
    M = D

    (NEXT)
        @R1
        D = M
        @pos
        M = D     // calculate position
        @SCREEN
        D = A
        @pos
        M = M+D

        @R0
        D = M
        @pos
        A = M
        M = D     // draw the value

        @R1
        D = M - 1
        M = D     // decrement counter

        @NEXT
        D;JGE

    @LOOP
    0;JMP
