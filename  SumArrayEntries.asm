@R1
D=M
@ZERO_CASE
D;JLE      // Handle length <= 0 case

@R0
D=M
@ptr
M=D        // Initialize pointer to array start
@R1
D=M
@n
M=D        // Initialize counter
@sum
M=0        // Initialize sum

(LOOP)
@ptr
A=M        // Get current array address
D=M        // Load current element
@sum
M=M+D      // Add to sum

@ptr
M=M+1      // Move to next element
@n
M=M-1      // Decrement counter
D=M
@LOOP
D;JGT      // Continue if counter > 0

@sum
D=M
@STORE
0;JMP

(ZERO_CASE)
@0
D=A

(STORE)
@R2
M=D        // Store result

(END)
@END
0;JMP      // Infinite loop