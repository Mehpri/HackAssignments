@R1
D=M
@invalid
D;JLE

@R0
D=M
@ptr
M=D

@R2
M=0

(loop)
@ptr
A=M
D=M
@R2
M=D+M

@ptr
M=M+1

@R1
M=M-1
D=M
@loop
D;JGT

@done
0;JMP

(invalid)
@R2
M=0

(done)
@done
0;JMP