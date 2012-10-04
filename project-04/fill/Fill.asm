// This file is part of the materials accompanying the book 
// "The Elements of Computing Systems" by Nisan and Schocken, 
// MIT Press. Book site: www.idc.ac.il/tecs
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.


    //D=-1
    D=1
    D=!D
    D=D+1

    //R0=-1 (in binary this will allow us to draw a 16 pixel line)
    @R0
    M=D

    //R1=16384 (first screen address)
    @SCREEN
    D=A    
    @R1
    M=D

    //R2=32*256 (number of 16 bit pixel lines to cover the entire screen)
    @8192
    D=A
    @R2
    M=D


//main loop
(LOOP)

    //read the keyboard
    @KBD
    D=M

     //if a key is not pressed, draw white screen
    @WHITE
    D;JEQ

    //if a key is pressed, draw black screen
    @BLACK
    D;JNE
    
    //repeat
    @LOOP
    0;JMP


//draw white screen
(WHITE)
	
	//set address to begin drawing
    @R1    
    A=M

    //draw first 16 pixels white line 
    M=0
   
    //decrease value so we know when to stop iteration
    @R2
    M=M-1
    D=M

    //finished drawing
	@STOP
    D;JLE
 
    //save the next location of the white line
    @R1
    M=M+1

    @WHITE
    D;JGT

    @LOOP
    0;JMP


//draw black screen
(BLACK)	

	//D=-1
	@R0
	D=M
	
	//set address to begin drawing
    @R1    
    A=M

    //draw first 16 pixels black line 
    M=D
   
    //decrease value so we know when to stop iteration
    @R2
    M=M-1
    D=M

    //finished drawing
	@STOP
    D;JLE
 
    //save the next location of the black line
    @R1
    M=M+1

    @BLACK
    D;JGT

    @LOOP
    0;JMP


(STOP)
	
	//re-init R1, R2
    @SCREEN
    D=A    
    @R1
    M=D

    @8192
    D=A
    @R2
    M=D

	@LOOP
    0;JMP


