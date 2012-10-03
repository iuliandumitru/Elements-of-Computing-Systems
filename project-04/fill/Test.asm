
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


//draw black screen
(BLACK)	

	//load unit
	@R0
	D=M

	//draw first 16 pixels	
    @SCREEN
    M=D
    
    //draw next line
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

