        .global _st_lsop
        .text

// x0 is pointer to buffer, later used as current character and then finally
// as the returned index
// x1 is start offset (as an index, e.g. 0)
// x2 is end offset (as an index, e.g. len - 1)
// x4 will be br_o
// x5 will be sig
// x6 will be l_sig
// x7 will be lsoi

_st_lsop:
        stp     x29, x30, [sp, -16]!
        str     x0, [sp, -16]!

        mov     x6, 10
        mov     x7, -1
        mov     x4, xzr

        add     x1, x0, x1, lsl 3
        add     x2, x0, x2, lsl 3
        b       5f

1:      ldr     x0, [x2]

        cmp     x0, 40
        beq     2f
        cmp     x0, 41
        beq     3f

// This function *only* uses `x0`. Currently, `x0` is the character that we are
// looking at. We don't need this value again, so we will just let it go.
        bl      _st_p

        cmp     x0, -1
        beq     4f

        add     x5, x0, x4

        cmp     x5, 1
        beq     6f
        cmp     x5, x6
        bge     4f
        mov     x6, x5
        mov     x7, x2
        b       4f

2:      sub     x4, x4, 2
        b       4f
3:      add     x4, x4, 2

4:      sub     x2, x2, 8
5:      cmp     x2, x1
        bgt     1b
        b       7f

6:      mov     x7, x2

7:      
        ldr     x0, [sp], 16
        ldp     x29, x30, [sp], 16

        sub     x0, x7, x0
        lsr     x0, x0, 3
        ret

        .end
