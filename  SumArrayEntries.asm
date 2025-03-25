// Check if R1 (length) is ≤ 0
@R1
D=M
@STORE_ZERO
D;JLE       // If length ≤ 0, return 0

// Initialize pointer to array start (R0)
@R0
D=M
@ptr
M=D         // ptr = array base address

// Store counter in a separate register (R3)
@R1
D=M
@counter
M=D         // counter = R1 (number of elements)

// Initialize sum to 0
@sum
M=0

(LOOP)
@counter
D=M
@END_LOOP
D;JLE       // If counter ≤ 0, exit loop

// Load current array value
@ptr
A=M         // Load array address
D=M         // D = current element
@sum
M=M+D       // sum += current element

// Move to next element
@ptr
M=M+1       // ptr++

// Decrement counter
@counter
M=M-1

@LOOP
0;JMP       // Repeat until counter = 0

(END_LOOP)
@sum
D=M
@STORE
0;JMP

(STORE_ZERO)
@0
D=A         // Set sum = 0 if R1 ≤ 0

(STORE)
@R2
M=D         // Store sum result in R2

(END)
@END
0;JMP       // Infinite loop