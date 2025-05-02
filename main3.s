        .global _main
        .text

_main:
        stp     x29, x30, [sp, -16]!

        adrp    x0, _inf@PAGE
        add     x0, x0, _inf@PAGEOFF
        mov     x1, 0
        mov     x2, 6
        adrp    x3, _pof@PAGE
        add     x3, x3, _pof@PAGEOFF
        mov     x4, 0
        bl      _st_proc

        bl      _puts

        ldp     x29, x30, [sp], 16
        ret

        .data
_inf:   .asciz  "554+673"
_pof:   .asciz  "aaaaaaa"
_fmt:   .asciz  "got: '%ld'\n"

        .end
