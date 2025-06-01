.section .vectors
vector_table:
    .word 0x20001000  // Initial stack pointer
    .word reset_handler // Reset handler addres
    .zero 100 * 4 // Reserved space for other handlers

.section .text
.align 1
.type reset_handler, %function
reset_handler:
    mov r1, #1
    mov r2, #2
    push {r1, r2} // Save registers r1 and r2 on stack
    mov r2, #0 // Initialize r3 with 10
    mov r1, #0 // Initialize r3 with 10
    pop {r1, r2} // Restore registers r1 and r2 from stack
    ADD r3, r1, r2
    LSL	r3, r3, #2
    B shivam

sam:
    ADD	r4, r3, #4
    B LOOP
shivam:
    SUB	r3, r3, r2
    B sam

LOOP:
    b .
