
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

//draw black screen
(BLACK)	

	//D=-1
	@R0
	D=M
	
    @R1    
    //set current address to begin drawing
    A=M

    //draw first 16 pixels line 
    M=D
   
    //move to next line
    @R1
    M=M+1

    //D=Memory[R2]; decrease
    @R2
    M=M-1
    D=M
 
    @BLACK
    D;JGT

    @END
    0;JMP

(END)
    @END
    0;JMP
