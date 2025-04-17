        .global _main
        .text

_main:
        stp     x29, x30, [sp, -16]!

        adrp    x0, _exp@PAGE
        add     x0, x0, _exp@PAGEOFF
        mov     x1, 0
        mov     x2, 10
        bl      _st_lsop

        adrp    x1, _exp@PAGE
        add     x1, x1, _exp@PAGEOFF
//        ldr     x0, [x1, x0]
        str     x0, [sp, -16]!          // Put data onto stack as paramter
        adrp    x0, _fmt@PAGE
        add     x0, x0, _fmt@PAGEOFF
        bl      _printf
        add     sp, sp, 16              // We need to change `sp` back but we
                                        // don't care about the value we gave.
                                        // Just add to `sp` then!

        ldp     x29, x30, [sp], 16

        mov     x0, xzr
        ret

        .data
_fmt:   .asciz  "got: '%ld'\n"
_exp:   .ascii  "3*(2-4)-6+3"

        .end
