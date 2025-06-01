.section .vectors
vector_table:
    .word 0x20001000  // Initial stack pointer
    .word reset_handler // Reset handler addres
    .zero 100 * 4 // Reserved space for other handlers

.section .text
.align 1
.type reset_handler, %function
reset_handler:
    // Infinite loop to prevent returning from main
    mov r1, #1
    mov r2, #2
    add r3, r1, r2
    b .