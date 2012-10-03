// This file is part of the materials accompanying the book 
// "The Elements of Computing Systems" by Nisan and Schocken, 
// MIT Press. Book site: www.idc.ac.il/tecs
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[3], respectively.)


// we ignore negative numbers
// a side effect is that we modify R1 value

    // init R2 = 0
    @R2
    M=0   

    //if R0 <= 0 => R2=R0*R1=0
    @R0
    D=M
    @END
    D;JLE
    
    //if R1 <= 0 => R2=R0*R1=0
    @R1
    D=M
    @END
    D;JLE
    
(LOOP)

    //D=R0
    @R0
    D=M
    
    // R2=R0+R0+ ... (R1 times)
    @R2
    M=M+D

    //decrease R1 value
    @R1
    D=M-1
    M=D

    //break loop
    @END
    D;JEQ

    //repeat
    @LOOP
    0;JMP 


(END)
    @END
    0;JMP  // Infinite loop 

