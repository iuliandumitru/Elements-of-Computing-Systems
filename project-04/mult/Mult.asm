// This file is part of the materials accompanying the book 
// "The Elements of Computing Systems" by Nisan and Schocken, 
// MIT Press. Book site: www.idc.ac.il/tecs
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[3], respectively.)

// Put your code here.

	@R2
    M=0   // init R2 = 0

	//if R0 = 1 => R0*R1=R1
	@R0
	D=M-1
	@ONE
	D;JEQ

	//if R1 = 1 => R0*R1=R0
	@R1
	D=M-1
	@TWO
	D;JEQ
	
	@temp
	M=0

(LOOP)

	@R0
	D=M
	
	@R2
	M=M+D

	@sum
	
	@R1
	temp=M-1

	@END
	temp;JEQ

	@LOOP
    0;JMP  // Goto LOOP


(ONE)

	@R1
	A=M

	@R2
	M=A

	//go to end
	@END
   	0;JMP


(TWO)

	@R0
	A=M

	@R2
	M=A

	//go to end
	@END
   	0;JMP


(END)
   	@END
   	0;JMP  // Infinite loop	

