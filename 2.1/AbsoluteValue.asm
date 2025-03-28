@R0
D=M
@positive
D;JGE

@R2
M=1

@32768    
D=D+A
@overflow
D;JEQ

@R0
D=M
D=-D
@R3
M=0
@store
0;JMP

(overflow)
@R3
M=1
@R0
D=M
@store
0;JMP

(positive)
@R2
M=0
@R3
M=0
@R0
D=M

(store)
@R1
M=D
(end)
@end
0;JMP