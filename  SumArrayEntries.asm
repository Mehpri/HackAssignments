@R1
D=M
@STORE_ZERO
D;JLE       // If R1 ≤ 0, store 0 in R2 and exit

// Initialize sum = 0
@sum
M=0

// Store array starting address in R3 (to avoid modifying R0)
@R0
D=M
@R3
M=D         // R3 = base address of array

// Store counter in R4 (to avoid modifying R1)
@R1
D=M
@R4
M=D         // R4 = number of elements

(LOOP)
@R4
D=M
@END_LOOP
D;JLE       // If counter ≤ 0, exit loop

// Load the current array value
@R3
A=M         // Load memory at address stored in R3
D=M         // D = current element
@sum
M=M+D       // sum += current element

// Move to the next element (increment pointer)
@R3
M=M+1       // R3 = R3 + 1 (move to next array item)

// Decrement counter
@R4
M=M-1

@LOOP
0;JMP       // Repeat until counter = 0

(END_LOOP)
@sum
D=M
@STORE
0;JMP

// Case where R1 was ≤ 0, store 0 in R2
(STORE_ZERO)
@0
D=A

(STORE)
@R2
M=D         // Store the computed sum in R2

(END)
@END
0;JMP 