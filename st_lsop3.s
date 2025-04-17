        .global _st_lsop
        .text

// x0 is expression string and the current character
// x1 is start index
// x2 is end index
// x3 is the character
// x4 is the br_o

_st_lsop:
        stp     x29, x30, [sp, -16]!
        str     x0, [sp, -16]!

//        mov     x4, 0

        b       5f

1:      ldr     x0, [sp], 16
        ldr     x3, [x0, x2]
        and     x3, x3, 0xFF
        str     x0, [sp, -16]!
        mov     x0, x3

        cmp     x0, 41
        beq     2f
        cmp     x0, 40
        beq     3f

//        stp     x2, x1, [sp, -16]!

//        stp     x3, x0, [sp, -16]!              // Args, not backup
//        adrp    x0, _fmt@PAGE
//        add     x0, x0, _fmt@PAGEOFF
//        bl      _printf
//        add     sp, sp, 16

//        ldp     x2, x1, [sp], 16

        bl      _st_p
//        add     x0, x0, x4
//        cmp     x0, x4
//        blt     4f
        cmp     x0, 1
        beq     6f

2:      add     x4, x4, 2
        b       4f
3:      sub     x4, x4, 2
4:      sub     x2, x2, 1
5:      cmp     x2, x1
        bge     1b

6:
        ldr     x0, [sp], 16
        ldp     x29, x30, [sp], 16
        mov     x0, x2
        ret

        
        .data
_fmt:   .asciz  "got: %c -> %ld\n"
_msg:   .asciz  "hello"
