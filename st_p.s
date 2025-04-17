        .global _st_p
        .text

// x0 takes the ASCII code of the operator to get the precedence of. These can
// be '+' (43), '-' (45), '*', (42) or '/' (47).

_st_p:
        stp     x29, x30, [sp, -16]!

        cmp     x0, 43
        beq     1f
        cmp     x0, 45
        beq     1f
        cmp     x0, 42
        beq     2f
        cmp     x0, 47
        beq     2f

        mov     x0, -1
        b       3f

1:      mov     x0, 1
        b       3f
2:      mov     x0, 2

3:      ldp     x29, x30, [sp], 16
        ret

        .end
