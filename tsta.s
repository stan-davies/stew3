        .global _tsta
        .text

_tsta:
        stp     x29, x30, [sp, -16]!

        bl      _tstu
        bl      _tstd
        bl      _tstt
        bl      _tstq

        ldp     x29, x30, [sp], 16
        ret

        .data
_inf:   .asciz  "7+(3*(2-6))"
_pof:   .asciz  "aaaaaaaaaaa"
_fmt:   .asciz  "got: '%ld'\n"

        .end
