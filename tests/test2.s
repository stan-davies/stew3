        .global _tstd
        .text

_tstd:
        stp     x29, x30, [sp, -16]!

        adrp    x0, _inf@PAGE
        add     x0, x0, _inf@PAGEOFF
        mov     x1, 0
        mov     x2, 7
        adrp    x3, _pof@PAGE
        add     x3, x3, _pof@PAGEOFF
        mov     x4, 0
        bl      _st_proc

//        str     xzr, [x3, x4]
//        mov     x0, x3
//        bl      _puts

        ldp     x29, x30, [sp], 16
        ret

        .data
_inf:   .asciz  "5*(12-4)"
_pof:   .asciz  "aaaaaaaa"
//_fmt:   .asciz  "got: '%ld'\n"

        .end
