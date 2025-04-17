        .global _st_lsop
        .text

// x0 is expression string
// x1 is start index
// x2 is end index
// x3 is the current character and then precedence of it
// x4 is the br_o
// x5 is l_sig
// x6 is lsoi

_st_lsop:
        stp     x29, x30, [sp, -16]!

        mov     x4, xzr
        mov     x5, 10
        mov     x6, -1

        b       _cond

_loop:  ldr     x3, [x0, x2]
        and     x3, x3, 0xFF

        cmp     x3, 41
        beq     _rb
        cmp     x3, 40
        beq     _lb

//        stp     x2, x1, [sp, -16]!

//        stp     x3, x0, [sp, -16]!              // Args, not backup
//        adrp    x0, _fmt@PAGE
//        add     x0, x0, _fmt@PAGEOFF
//        bl      _printf
//        add     sp, sp, 16

//        ldp     x2, x1, [sp], 16

        bl      _st_p
        add     x3, x3, x4

        cmp     x3, x4
        blt     _cont

        cmp     x3, 1
        beq     _brk

        cmp     x3, x5
        bge     _cont
        mov     x5, x3
        mov     x6, x2
        b       _cont
 
_rb:    add     x4, x4, 2
        b       _cont
_lb:    sub     x4, x4, 2

_cont:  sub     x2, x2, 1
_cond:  cmp     x2, x1
        bge     _loop
        b       _ext

_brk:   mov     x6, x2

_ext:
        ldp     x29, x30, [sp], 16
        mov     x0, x6
        ret

        
        .data
_fmt:   .asciz  "got: %c -> %ld\n"
_msg:   .asciz  "hello"
