@R1
D=M
@check_empty
D;JLE

@R0
D=M
@current
M=D

@R2
M=0

(main_loop)
@current
A=M
D=M
@R2
M=D+M

@current
M=M+1

@R1
M=M-1
D=M
@main_loop
D;JGT

@finish
0;JMP

(check_empty)
@R2
M=0

(finish)
@finish
0;JMP