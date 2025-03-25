@R1
D=M
@ZERO_CASE
D;JLE      // If R1 <= 0, set sum = 0

// Initialize pointer and counter
@R0
D=M
@ptr
M=D        // Store array base address
@R1
D=M
@counter
M=D        // Store element count in counter

@sum
M=0        // Initialize sum to 0

(LOOP)
@counter
D=M
@END_LOOP
D;JLE      // If counter <= 0, end loop

// Load current array value and add to sum
@ptr
A=M        // Get array address
D=M        // Load current element
@sum
M=M+D      // sum += current element

// Move pointer to next element
@ptr
M=M+1

// Decrement counter
@counter
M=M-1

@LOOP
0;JMP      // Repeat until counter = 0

(END_LOOP)
@sum
D=M
@STORE
0;JMP      // Store the sum

(ZERO_CASE)
@0
D=A        // Set sum = 0 if R1 <= 0

(STORE)
@R2
M=D        // Store result in R2

(END)
@END
0;JMP      // Infinite loop