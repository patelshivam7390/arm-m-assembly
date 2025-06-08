# constants
.equ SYST_CSR, 0xE000E010
.equ SYST_RVR, 0xE000E014
.equ SYST_CVR, 0xE000E018

.equ timeout, 0x00ffffff



.section .vectors
vector_table:
    .word 0x20001000  // Initial stack pointer
    .word reset_handler // Reset handler addres
.org 0x3C
    .word systick_handler // SysTick handler address
    .zero 100 * 4 // Reserved space for other handlers

.section .text
.align 1
.type reset_handler, %function
reset_handler:
    ldr r0, =SYST_CSR
    ldr	r1, =SYST_RVR
    ldr r2, =SYST_CVR
    ldr r3, =timeout

    str r3, [r1]
    mov r3, #0x00
    str r3, [r2]
    mov r3, #0x07
    str r3, [r0] // Enable SysTick with interrupt and clock source
    mov r3, #0x00

    b .
.section .text
.align 1
.type systick_handler, %function
systick_handler:
    push {r4-r7}

    mov r0, r8
    MOV	r1, r9
    mov r2, r10
    mov r3, r11

    push {r0-r3}
Break:

    pop {r0-r3}

    mov r8, r0
    mov r9, r1
    mov r10, r2
    mov r11, r3

    pop {r4-r7}

    bx lr

.section .text
.p2align 4
.global main1
.type main1, %function
main1:
    NOP
    add r0, r0, #1
    b main1

.section .text
.p2align 4
.global main2
.type main2, %function
main2:
    NOP
    add r1, r1, #1
    b main2

.section .text
.p2align 4
.global main3
.type main3, %function
main3:
    NOP
    add r2, r2, #1
    b main3

.data
.align 4
stack_1:
    .word 0x18
    .word 0x19
    .word 0x1A
    .word 0x1B
    .word 0x14
    .word 0x15
    .word 0x16
    .word 0x17
    .word 0x10
    .word 0x11
    .word 0x12
    .word 0x13
    .word 0x1C
    .word 0x309
    .word main1
    .word 0x01000000

    .zero 64 // Reserved space for stack pointer
    .align 4
stack_2:
    .word 0x28
    .word 0x29
    .word 0x2A
    .word 0x2B
    .word 0x24
    .word 0x25
    .word 0x26
    .word 0x27
    .word 0x20
    .word 0x21
    .word 0x22
    .word 0x23
    .word 0x2C
    .word 0x309
    .word main2
    .word 0x01000000

.zero 64 // Reserved space for stack pointer
.align 4
stack_3:
    .word 0x38
    .word 0x39
    .word 0x3A
    .word 0x3B
    .word 0x34
    .word 0x35
    .word 0x36
    .word 0x37
    .word 0x30
    .word 0x31
    .word 0x32
    .word 0x33
    .word 0x3C
    .word 0x309
    .word main3
    .word 0x01000000
    .zero 100
