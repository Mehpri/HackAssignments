@R1
D=M
@invalid_array
D;JLE

@R0
D=M
@ptr
M=D

@R2
M=0

(sum_loop)
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
@sum_loop
D;JGT

@end
0;JMP

(invalid_array)
@R2
M=0

(end)
@end
0;JMP