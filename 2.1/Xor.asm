@R0
D=M      // D = x
@R1
D=D|M    // D = x OR y
@temp
M=D      // temp = x OR y

@R0
D=M      // D = x
@R1
D=D&M    // D = x AND y
D=!D     // D = NOT (x AND y)

@temp
D=D&M    // D = (x OR y) AND (NOT (x AND y)) → x XOR y

@R2
M=D      // Store result in R2
(END)
@END
0;JMP