// This file is part of the materials accompanying the book 
// "The Elements of Computing Systems" by Nisan and Schocken, 
// MIT Press. Book site: www.idc.ac.il/tecs
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.



	D=1
	D=!D
	D=D+1

	//save unit in R0
	@R0
	M=D

	//set R1=
	@32
	D=M
	@R1
	M=D

//main loop
(LOOP)

     //read the keyboard
     @KBD
     D=M

     // if a key is not pressed the screen is white
    @WHITE
    D;JEQ

    // if a key is pressed the screen is black
    @BLACK
    D;JNE
    
    //repeat
    @LOOP
    0;JMP


//draw white screen
(WHITE)
    @SCREEN
    M=0
	

	//go to main loop
    @LOOP
    0;JMP


//draw black screen
(BLACK)	

	//load unit
	@R0
	D=M

	//draw first 16 pixels	
    @SCREEN
    M=D
    
    A=A+1
    M=D

    @R1	
    D=M
    D=D-1

    @BLACK
    D;JGT

  	//go to main loop
    @LOOP
    0;JMP






