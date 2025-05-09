        .global _st_proc
        .text

// params
// x0 as expression string
// x1 as expression start
// x2 as expression end
// x3 as output string          - read as output
// x4 as output write head      - read as output
// locals
// x5 as lsoi
// x6 as current character

_st_proc:
        stp     x29, x30, [sp, -16]!

        // x1 will not be overwritten
        stp     x0, x2, [sp, -16]!
        stp     x3, x4, [sp, -16]!
        bl      _st_lsop
        mov     x5, x0
        ldp     x3, x4, [sp], 16
        ldp     x0, x2, [sp], 16

        cmp     x5, -1
        bne     _psid

        b       _cond

_loop:  ldr     x6, [x0, x1]
        and     x6, x6, 0xFF

        cmp     x6, 40
        beq     _cont
        cmp     x6, 41
        beq     _cont

        str     x6, [x3, x4]
        add     x4, x4, 1

_cont:  add     x1, x1, 1
_cond:  cmp     x1, x2
        ble     _loop

        b       _ext

_psid:
        // start: start
        // end  : lsoi - 1
        str     x1, [sp, -16]!
        stp     x2, x5, [sp, -16]!
        sub     x2, x5, 1                
        bl      _st_proc
        ldp     x2, x5, [sp], 16
        ldr     x1, [sp], 16

        // start: lsoi + 1
        // end  : end
        stp     x1, x5, [sp, -16]!
        add     x1, x5, 1
        bl      _st_proc
        ldp     x1, x5, [sp], 16

        // write operator
        ldr     x6, [x0, x5]
        str     x6, [x3, x4]
        add     x4, x4, 1

_ext:
        ldp     x29, x30, [sp], 16
        ret

        .end
