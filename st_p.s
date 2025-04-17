        .global _st_p
        .text

// x3 takes the ASCII code of the operator to get the precedence of. These can
// be '+' (43), '-' (45), '*', (42) or '/' (47).

// It is x3 rather than x0 because that is more convenient for st_lsop.

_st_p:
        cmp     x3, 43
        beq     _min
        cmp     x3, 45
        beq     _min
        cmp     x3, 42
        beq     _maj
        cmp     x3, 47
        beq     _maj

        mov     x3, -1
        b       _ext

_min:   mov     x3, 1
        b       _ext
_maj:   mov     x3, 2

_ext:   ret

        .end
