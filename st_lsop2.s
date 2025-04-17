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

//         mov     x6, 10
//         mov     x7, -1
//         mov     x4, xzr

        add     x1, x0, x1
        add     x2, x0, x2
        b       5f

1:      ldr     x0, [x2]

        bl      _st_p

        cmp     x0, 1
        beq     6f

4:      sub     x2, x2, 1
5:      cmp     x2, x1
        bgt     1b                      // Skips final iteration as first
                                        // character cannot be operator.
        mov     x0, 1
        b       7f

6:      mov     x0, 0

7:      
//        ldr     x0, [sp], 16
        add     sp, sp, 16
        ldp     x29, x30, [sp], 16
        
//        sub     x0, x2, x0
//        sub     x0, x7, x0
        ret

        .end
