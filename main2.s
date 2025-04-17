        .global _main
        .text

_main:
        stp     x29, x30, [sp, -16]!

        adrp    x0, _inf@PAGE
        add     x0, x0, _inf@PAGEOFF
        mov     x1, 0
        mov     x2, 2
        adrp    x3, _pof@PAGE
        add     x3, x3, _pof@PAGEOFF
        mov     x4, 0
        bl      _st_proc

        mov     x0, x3
        bl      _printf

        ldp     x29, x30, [sp], 16

        mov     x0, xzr
        ret

        .data
_inf:   .ascii  "2+3"
_pof:   .ascii  "aaa"

        .end
