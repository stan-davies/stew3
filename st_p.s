        .global _st_p
        .text

// x0 takes the ASCII code of the operator to get the precedence of. These can
// be '+' (43), '-' (45), '*', (42) or '/' (47).

_st_p:
        stp     x29, x30, [sp, -16]!

        cmp     x3, 43
        beq     1f
        cmp     x3, 45
        beq     1f
        cmp     x3, 42
        beq     2f
        cmp     x3, 47
        beq     2f

        mov     x3, -1
        b       3f

1:      mov     x3, 1
        b       3f
2:      mov     x3, 2

3:      ldp     x29, x30, [sp], 16
        ret

        .end
