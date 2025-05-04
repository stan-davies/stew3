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

        .end
