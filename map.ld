MEMORY
{
    MEM : ORIGIN = 0x0, LENGTH = 16K
}

SECTIONS
{
    .text : {
        *(.vectors*)
        *(.text*)
    } > MEM
}