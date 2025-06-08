MEMORY
{
    MEM : ORIGIN = 0x0, LENGTH = 16K
    RAM : ORIGIN = 0x20000000, LENGTH = 800
}

SECTIONS
{
    .text : {
        *(.vectors*)
        *(.text*)
    } > MEM

    .data : {
        *(.data*)
    } > RAM
}