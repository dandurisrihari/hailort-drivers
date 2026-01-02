	.arch armv8-a
	.file	"vdma_common.c"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_program_descriptors_in_chunk
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_program_descriptors_in_chunk
	.align	3
	.8byte	.LPFE1
	.text
.LPFE1:
	nop
	nop
	.type	hailo_vdma_program_descriptors_in_chunk, %function
hailo_vdma_program_descriptors_in_chunk:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -80]!
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	sub	w23, w2, #1
	ldrh	w22, [x3, 16]
	adds	w23, w22, w23
	bcs	.L3
	udiv	w23, w23, w22
	add	w5, w5, 1
	stp	x19, x20, [sp, 16]
	mov	w19, w4
	add	w21, w23, w4
	cmp	w21, w5
	bhi	.L20
	mov	w24, w2
	mov	x2, x0
	str	x25, [sp, 64]
	and	w6, w6, 255
	cmp	w6, 32
	and	w6, w6, 15
	ldr	x4, [x2]
	mov	x0, x1
	and	w25, w7, 255
	mov	x20, x3
	add	x1, x1, w24, uxtw
	mov	w2, w22
	mov	w3, 255
	csel	w3, w6, w3, cc
	blr	x4
	mov	x7, x0
	cbz	x0, .L12
	sub	w8, w21, #1
	cmp	w19, w8
	bcs	.L13
	lsl	w2, w22, 8
	uxtw	x10, w22
	add	w2, w2, 2
	mov	x4, x0
	.p2align 3,,7
.L7:
	ldr	w1, [x20, 12]
	and	w6, w4, -64
	ldr	x3, [x20]
	and	w1, w19, w1
	lsr	x9, x4, 32
	orr	w6, w6, w25
	lsl	x1, x1, 4
	add	w19, w19, 1
	add	x5, x3, x1
	add	x4, x4, x10
	str	w2, [x3, x1]
	stp	w6, w9, [x5, 4]
	str	wzr, [x5, 12]
	cmp	w19, w8
	bne	.L7
	sub	w0, w23, #2
	madd	x10, x0, x10, x10
	add	x7, x7, x10
.L6:
	udiv	w1, w24, w22
	ldr	w0, [x20, 12]
	ldr	x4, [x20]
	and	w8, w8, w0
	and	w3, w7, -64
	lsr	x7, x7, 32
	msub	w1, w1, w22, w24
	lsl	x8, x8, 4
	add	x2, x4, x8
	orr	w3, w3, w25
	cmp	w1, 0
	mov	w0, w23
	csel	w1, w22, w1, eq
	lsl	w1, w1, 8
	add	w1, w1, 2
	str	w1, [x4, x8]
	stp	w3, w7, [x2, 4]
	str	wzr, [x2, 12]
	ldp	x19, x20, [sp, 16]
	ldr	x25, [sp, 64]
.L1:
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L13:
	mov	w8, w19
	b	.L6
.L20:
	ldp	x19, x20, [sp, 16]
	mov	w0, -34
	b	.L1
.L12:
	ldp	x19, x20, [sp, 16]
	mov	w0, -14
	ldr	x25, [sp, 64]
	b	.L1
.L3:
	mov	w0, 0
	b	.L1
	.size	hailo_vdma_program_descriptors_in_chunk, .-hailo_vdma_program_descriptors_in_chunk
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_program_descriptors_list
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_program_descriptors_in_chunk
	.align	3
	.8byte	.LPFE2
	.text
.LPFE2:
	nop
	nop
	.type	hailo_vdma_program_descriptors_list, %function
hailo_vdma_program_descriptors_list:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -112]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	w19, w2
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	and	w0, w5, 255
	stp	x23, x24, [sp, 48]
	mov	x23, x1
	stp	w0, w6, [sp, 100]
	and	w0, w7, 255
	str	w0, [sp, 108]
	ldr	w24, [x1, 8]
	ldr	w21, [x3, 8]
	tst	w4, 255
	beq	.L22
	cmp	w2, w24
	bcs	.L25
	stp	x25, x26, [sp, 64]
	mov	x26, x3
	ldrh	w0, [x1, 16]
	ldr	w12, [x3, 12]
	udiv	w20, w12, w0
	msub	w20, w20, w0, w12
	cbnz	w20, .L57
	stp	x27, x28, [sp, 80]
	sub	w0, w2, #1
	add	w0, w0, w24
	ldrb	w3, [x1, 18]
	sub	w24, w24, #1
	ldr	x1, [x26]
	cmp	w3, 0
	csel	w24, w24, w0, eq
	mov	w25, 0
	ldr	w2, [x1, 8]
	ldr	x27, [x1]
	cbz	w2, .L28
	mov	x28, 0
	b	.L31
	.p2align 2,,3
.L60:
	ldr	x1, [x27, 16]
	add	w11, w2, w28
	cmp	x7, x28
	bls	.L30
	add	x1, x7, x1
	sub	w2, w11, w12
	sub	x1, x1, x28
.L30:
	ldrb	w7, [x22, 8]
	cmp	w2, w21
	csel	w2, w2, w21, ls
	sub	w21, w21, w2
	bl	hailo_vdma_program_descriptors_in_chunk
	tbnz	w0, #31, .L58
	ldr	w1, [x27, 24]
	add	w25, w25, w0
	add	w19, w19, w0
	mov	x0, x27
	add	x28, x28, x1
	add	w20, w20, 1
	bl	sg_next
	mov	x27, x0
	ldr	x1, [x26]
	ldr	w0, [x1, 8]
	cmp	w20, w0
	bcs	.L28
.L61:
	ldr	w12, [x26, 12]
.L31:
	ldr	w2, [x27, 24]
	uxtw	x7, w12
	ldrb	w6, [sp, 100]
	mov	w4, w19
	mov	w5, w24
	mov	x3, x23
	add	x1, x28, w2, uxtw
	mov	x0, x22
	cmp	x1, x7
	bcs	.L60
	mov	x28, x1
	mov	x0, x27
	bl	sg_next
	mov	x27, x0
	ldr	x1, [x26]
	add	w20, w20, 1
	ldr	w0, [x1, 8]
	cmp	w20, w0
	bcc	.L61
.L28:
	cbnz	w21, .L59
	ldr	w0, [sp, 104]
	and	w2, w0, 2
	tbnz	x0, 0, .L32
	cbz	w2, .L34
	mov	x0, 0
.L33:
	ldr	x1, [x22, 16]
	orr	x0, x0, x1
.L35:
	mov	w2, 0
	cbz	x0, .L34
	ldr	w1, [sp, 108]
	orr	x2, x0, 15
	orr	x0, x0, 12
	cmp	w1, 0
	csel	w2, w0, w2, eq
.L34:
	ldr	w3, [x23, 8]
	sub	w19, w19, #1
	ldr	x4, [x23]
	mov	w0, w25
	udiv	w1, w19, w3
	msub	w1, w1, w3, w19
	lsl	x1, x1, 4
	ldr	w3, [x4, x1]
	orr	w2, w3, w2
	str	w2, [x4, x1]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L22:
	ldr	w0, [sp, 104]
	ldr	x5, [x23]
	ldrh	w4, [x1, 16]
	and	w1, w0, 2
	tbnz	x0, 0, .L37
	mov	w3, 2
	cbnz	w1, .L62
.L39:
	sub	w0, w21, #1
	sub	w19, w19, #1
	add	w0, w0, w4
	udiv	w0, w0, w4
	add	w19, w19, w0
	sub	w2, w0, #1
	udiv	w1, w19, w24
	msub	w2, w2, w4, w21
	add	w2, w3, w2, lsl 8
	msub	w1, w1, w24, w19
	lsl	x1, x1, 4
	str	w2, [x5, x1]
.L21:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L37:
	ldr	x0, [x22, 24]
	cbnz	w1, .L38
.L40:
	mov	w3, 2
	cbz	x0, .L39
	ldr	w1, [sp, 108]
	orr	w3, w0, 14
	orr	w0, w0, 15
	and	w3, w3, 255
	and	w0, w0, 255
	cmp	w1, 0
	csel	w3, w0, w3, ne
	b	.L39
	.p2align 2,,3
.L62:
	mov	x0, 0
.L38:
	ldr	x1, [x22, 16]
	orr	x0, x0, x1
	b	.L40
	.p2align 2,,3
.L32:
	ldr	x0, [x22, 24]
	cbz	w2, .L35
	b	.L33
	.p2align 2,,3
.L58:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	hint	29 // autiasp
	ret
.L57:
	ldp	x25, x26, [sp, 64]
.L25:
	mov	w0, -14
	b	.L21
.L59:
	ldp	x25, x26, [sp, 64]
	mov	w0, -14
	ldp	x27, x28, [sp, 80]
	b	.L21
	.size	hailo_vdma_program_descriptors_list, .-hailo_vdma_program_descriptors_list
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_set_num_avail
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_program_descriptors_in_chunk
	.align	3
	.8byte	.LPFE3
	.text
.LPFE3:
	nop
	nop
	.type	hailo_vdma_set_num_avail, %function
hailo_vdma_set_num_avail:
	nop
	nop
.L64:
.L65:
.L66:
.L67:
	and	w1, w1, 65535
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w2, [x0]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 95
 .byte 662b-661b
 .byte 664f-663f
.popsection
.subsection 1
663:
	ldar w2, [x0]
664:
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
	.previous
.endif

// 0 "" 2
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshld
// 0 "" 2
#NO_APP
	uxtw	x3, w2
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x3, x3, x3
cbnz	x3, .
// 0 "" 2
#NO_APP
	bfi	w2, w1, 16, 16
#APP
// 277 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshst
// 0 "" 2
// 42 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	str w2, [x0]
// 0 "" 2
#NO_APP
	ret
	.size	hailo_vdma_set_num_avail, .-hailo_vdma_set_num_avail
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_get_num_proc
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_program_descriptors_in_chunk
	.align	3
	.8byte	.LPFE4
	.text
.LPFE4:
	nop
	nop
	.type	hailo_vdma_get_num_proc, %function
hailo_vdma_get_num_proc:
	nop
	nop
.L69:
.L70:
	add	x0, x0, 4
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w0, [x0]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 95
 .byte 662b-661b
 .byte 664f-663f
.popsection
.subsection 1
663:
	ldar w0, [x0]
664:
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
	.previous
.endif

// 0 "" 2
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshld
// 0 "" 2
#NO_APP
	uxtw	x1, w0
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x1, x1, x1
cbnz	x1, .
// 0 "" 2
#NO_APP
	ret
	.size	hailo_vdma_get_num_proc, .-hailo_vdma_get_num_proc
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"\0013Inconsistent desc list given to channel %d\n"
	.align	3
.LC1:
	.string	"\0013Channel %d hw state out of sync. num available is %d, expected %d\n"
	.align	3
.LC2:
	.string	"\0013Channel %d state out of sync. num available is %d, expected %d\n"
	.align	3
.LC3:
	.string	"\0013Too many buffers %u for single transfer\n"
	.align	3
.LC4:
	.string	"\0013Failed push ongoing transfer to channel %d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_launch_transfer
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_program_descriptors_in_chunk
	.align	3
	.8byte	.LPFE5
	.text
.LPFE5:
	nop
	nop
	.type	hailo_vdma_launch_transfer, %function
hailo_vdma_launch_transfer:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #224
	stp	x29, x30, [sp, 128]
	add	x29, sp, 128
	str	w7, [sp, 40]
	stp	x19, x20, [sp, 144]
	mov	x20, x0
	and	w0, w6, 255
	str	w0, [sp, 24]
	mov	w19, w3
	stp	x21, x22, [sp, 160]
	mov	x22, x2
	and	w21, w4, 255
	stp	x23, x24, [sp, 176]
	mov	x2, 72
	ldrb	w23, [sp, 232]
	stp	x27, x28, [sp, 208]
	mov	x28, x1
	mrs	x1, sp_el0
	ldr	x0, [x1, 1424]
	str	x0, [sp, 120]
	mov	x0, 0
	mov	x27, x5
	mov	w1, 0
	add	x0, sp, 48
	bl	memset
	ldr	x1, [x28, 24]
	ldr	w0, [x22, 8]
	sub	w0, w0, #1
	str	w0, [x28, 36]
	cbz	x1, .L107
	cmp	x1, x22
	bne	.L108
.L73:
.L75:
.L76:
	ldr	x0, [x28, 8]
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w0, [x0]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 95
 .byte 662b-661b
 .byte 664f-663f
.popsection
.subsection 1
663:
	ldar w0, [x0]
664:
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
	.previous
.endif

// 0 "" 2
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshld
// 0 "" 2
#NO_APP
	uxtw	x1, w0
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x1, x1, x1
cbnz	x1, .
// 0 "" 2
#NO_APP
	lsr	w2, w0, 16
	tbz	x0, 0, .L96
	stp	x25, x26, [sp, 192]
	ldrh	w25, [x28, 32]
	cmp	w2, w25
	bne	.L109
	cmp	w2, w19, uxth
	bne	.L110
	cmp	w21, 2
	bhi	.L111
	add	w24, w21, 1
	and	w0, w24, 255
	str	w0, [sp, 44]
	cbz	w21, .L97
	cmp	w21, 1
	add	x26, sp, 56
	cset	w0, ne
	mov	w2, w19
	mov	x3, x27
	mov	w24, 0
	mov	x27, 0
	str	w0, [sp, 28]
	uxtw	x0, w21
	str	x0, [sp, 32]
.L84:
	ldr	w0, [sp, 28]
	mov	w7, w23
	ldrb	w5, [x28]
	mov	x1, x22
	ldrb	w4, [sp, 24]
	cmp	w0, w27
	ldr	w0, [sp, 224]
	add	x26, x26, 24
	str	w2, [sp, 12]
	csel	w6, w0, wzr, eq
	mov	x0, x20
	str	x3, [sp, 16]
	bl	hailo_vdma_program_descriptors_list
	ldr	w2, [sp, 12]
	add	x1, sp, 48
	ldr	w4, [x22, 8]
	add	x13, x1, x27, lsl 1
	add	w2, w0, w2
	add	w24, w24, w0
	sub	w5, w2, #1
	add	x27, x27, 1
	ldr	x3, [sp, 16]
	udiv	w1, w5, w4
	add	x3, x3, 24
	udiv	w0, w2, w4
	ldp	x6, x7, [x3, -24]
	msub	w1, w1, w4, w5
	and	w5, w1, 65535
	strh	w5, [x13, 60]
	stp	x6, x7, [x26, -24]
	msub	w2, w0, w4, w2
	ldr	x0, [x3, -8]
	str	x0, [x26, -8]
	ldr	x0, [sp, 32]
	cmp	x0, x27
	bne	.L84
	ldr	w2, [sp, 40]
	and	w0, w2, 2
	tbnz	x2, 0, .L85
.L113:
	cbnz	w0, .L99
.L87:
	ldr	x3, [x22]
	ubfiz	x19, x19, 4, 32
	add	x4, x28, 40
	ldr	w2, [x3, x19]
	orr	w0, w2, w0
	str	w0, [x3, x19]
	ldr	x2, [x4, 8]
	ldr	x0, [x28, 40]
	sub	x2, x2, #1
	sub	x2, x2, x0
	tst	x2, 127
	beq	.L90
.L91:
.L92:
.L93:
.L94:
	add	x3, x0, x0, lsl 3
	strh	w5, [sp, 48]
	strb	w21, [sp, 50]
	add	x0, x0, 1
	add	x3, x4, x3, lsl 3
	ldrb	w2, [sp, 44]
	ldp	x4, x5, [sp, 48]
	strb	w2, [sp, 104]
	stp	x4, x5, [x3, 16]
	add	x2, x3, 16
	and	x0, x0, 127
	ldp	x4, x5, [sp, 64]
	strh	w25, [sp, 106]
	stp	x4, x5, [x3, 32]
	add	w1, w1, 1
	ldp	x4, x5, [sp, 80]
	strb	w23, [sp, 112]
	stp	x4, x5, [x3, 48]
	ldp	x4, x5, [sp, 96]
	stp	x4, x5, [x3, 64]
	ldr	x3, [sp, 112]
	str	x3, [x2, 64]
	str	x0, [x28, 40]
	ldr	x2, [x28, 8]
	ldr	w3, [x22, 8]
	udiv	w0, w1, w3
	msub	w1, w0, w3, w1
	strh	w1, [x28, 32]
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w0, [x2]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 95
 .byte 662b-661b
 .byte 664f-663f
.popsection
.subsection 1
663:
	ldar w0, [x2]
664:
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
	.previous
.endif

// 0 "" 2
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshld
// 0 "" 2
#NO_APP
	uxtw	x3, w0
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x3, x3, x3
cbnz	x3, .
// 0 "" 2
#NO_APP
	bfi	w0, w1, 16, 16
#APP
// 277 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshst
// 0 "" 2
// 42 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	str w0, [x2]
// 0 "" 2
#NO_APP
	ldp	x25, x26, [sp, 192]
	mov	w0, w24
.L71:
	mrs	x1, sp_el0
	ldr	x3, [sp, 120]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L112
	ldp	x29, x30, [sp, 128]
	ldp	x19, x20, [sp, 144]
	ldp	x21, x22, [sp, 160]
	ldp	x23, x24, [sp, 176]
	ldp	x27, x28, [sp, 208]
	add	sp, sp, 224
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L97:
	ldr	w2, [sp, 40]
	mov	w5, 65535
	mov	w1, -1
	mov	w24, 0
	and	w0, w2, 2
	tbz	x2, 0, .L113
.L85:
	ldr	x2, [x20, 24]
	cbnz	w0, .L86
.L88:
	mov	w0, 0
	cbz	x2, .L87
	orr	x0, x2, 15
	cmp	w23, 0
	orr	x2, x2, 12
	csel	w0, w2, w0, eq
	b	.L87
	.p2align 2,,3
.L99:
	mov	x2, 0
.L86:
	ldr	x0, [x20, 16]
	orr	x2, x2, x0
	b	.L88
	.p2align 2,,3
.L107:
	str	x22, [x28, 24]
	b	.L73
.L90:
	ldrb	w1, [x28]
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	_printk
.L80:
	ldp	x25, x26, [sp, 192]
	mov	w0, -14
	b	.L71
.L96:
	mov	w0, -104
	b	.L71
.L109:
	ldrb	w1, [x28]
	mov	w3, w25
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	_printk
	b	.L80
.L108:
	ldrb	w1, [x28]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	_printk
	mov	w0, -22
	b	.L71
.L110:
	ldrb	w1, [x28]
	and	w3, w19, 65535
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	_printk
	b	.L80
.L111:
	mov	w1, w21
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	_printk
	ldp	x25, x26, [sp, 192]
	mov	w0, -22
	b	.L71
.L112:
	stp	x25, x26, [sp, 192]
	bl	__stack_chk_fail
	.size	hailo_vdma_launch_transfer, .-hailo_vdma_launch_transfer
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_engine_init
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_program_descriptors_in_chunk
	.align	3
	.8byte	.LPFE6
	.text
.LPFE6:
	nop
	nop
	.type	hailo_vdma_engine_init, %function
hailo_vdma_engine_init:
	nop
	nop
	mov	x5, 9288
	add	x4, x0, 16
	add	x6, x0, x5
	mov	w10, 1
	mov	x5, 0
	mov	w9, -1
	mov	x7, 11848
	strb	w1, [x0]
	str	xzr, [x0, 4]
	.p2align 3,,7
.L116:
	ldr	x0, [x2]
	lsl	w1, w10, w5
	ands	w1, w1, w3
	strb	w5, [x4]
	add	x0, x0, x5, lsl 5
	add	x5, x5, 1
	add	x1, x0, 16
	mov	x8, x0
	csel	x0, x0, x1, eq
	csel	x1, x1, x8, eq
	stp	x1, x0, [x4, 8]
	strb	wzr, [x6]
	add	x6, x6, x7
	str	xzr, [x4, 24]
	stp	wzr, w9, [x4, 32]
	stp	xzr, xzr, [x4, 40]
	add	x4, x4, x7
	cmp	x5, 32
	bne	.L116
	ret
	.size	hailo_vdma_engine_init, .-hailo_vdma_engine_init
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_engine_enable_channels
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_program_descriptors_in_chunk
	.align	3
	.8byte	.LPFE7
	.text
.LPFE7:
	nop
	nop
	.type	hailo_vdma_engine_enable_channels, %function
hailo_vdma_engine_enable_channels:
	nop
	nop
	mov	x3, 9288
	and	w2, w2, 255
	add	x5, x0, x3
	mov	w7, 1
	mov	w3, 0
	mov	x6, 11848
	.p2align 3,,7
.L122:
	lsl	w4, w7, w3
	add	w3, w3, 1
	tst	w4, w1
	beq	.L121
	strb	w2, [x5]
	stp	wzr, wzr, [x5, 4]
.L121:
	add	x5, x5, x6
	cmp	w3, 32
	bne	.L122
	ldr	w2, [x0, 4]
	orr	w1, w2, w1
	str	w1, [x0, 4]
	ret
	.size	hailo_vdma_engine_enable_channels, .-hailo_vdma_engine_enable_channels
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	"\0013Channel %d has ongoing transfers but no desc list\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_engine_disable_channels
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_program_descriptors_in_chunk
	.align	3
	.8byte	.LPFE8
	.text
.LPFE8:
	nop
	nop
	.type	hailo_vdma_engine_disable_channels, %function
hailo_vdma_engine_disable_channels:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #160
	mrs	x2, sp_el0
	stp	x29, x30, [sp, 80]
	add	x29, sp, 80
	stp	x19, x20, [sp, 96]
	adrp	x19, .LC5
	mov	w20, -1
	stp	x21, x22, [sp, 112]
	add	x19, x19, :lo12:.LC5
	add	x21, x0, 16
	stp	x23, x24, [sp, 128]
	mov	w24, w1
	add	x1, x2, 1424
	str	x25, [sp, 144]
	mov	w22, 0
	mov	w25, 1
	ldr	w2, [x0, 4]
	ldr	x3, [x1]
	str	x3, [sp, 72]
	mov	x3, 0
	bic	w1, w2, w24
	str	w1, [x0, 4]
	b	.L136
	.p2align 2,,3
.L128:
	add	w22, w22, 1
	mov	x0, 11848
	add	x21, x21, x0
	cmp	w22, 32
	beq	.L151
.L136:
	lsl	w0, w25, w22
	tst	w0, w24
	beq	.L128
	mov	x23, x21
	stp	wzr, w20, [x21, 32]
	ldr	x0, [x21, 48]
	ldr	x6, [x23, 40]!
.L150:
	sub	x1, x6, x0
	tst	x1, 127
	beq	.L152
.L129:
	add	x1, x0, x0, lsl 3
	add	x0, x0, 1
	ldr	x4, [x21, 24]
	add	x1, x23, x1, lsl 3
	add	x5, x1, 16
	and	x0, x0, 127
	ldp	x2, x3, [x1, 16]
	stp	x2, x3, [sp]
	ldrb	w1, [x1, 72]
	ldp	x2, x3, [x5, 16]
	stp	x2, x3, [sp, 16]
	ldp	x2, x3, [x5, 32]
	stp	x2, x3, [sp, 32]
	ldp	x2, x3, [x5, 48]
	stp	x2, x3, [sp, 48]
	ldr	x2, [x5, 64]
	str	x0, [x21, 48]
	str	x2, [sp, 64]
	cbz	x4, .L153
	cmp	w1, 3
	bhi	.L132
	mov	x2, 0
	cbz	w1, .L150
	.p2align 3,,7
.L133:
	mov	x0, sp
	add	x3, x0, x2, lsl 1
	ldrh	w0, [x4, 16]
	ldr	x5, [x4]
	add	x2, x2, 1
	ldrh	w3, [x3, 58]
	lsl	w0, w0, 8
	add	w0, w0, 2
	lsl	x3, x3, 4
	str	w0, [x5, x3]
	cmp	w1, w2, uxtb
	bhi	.L133
	ldp	x6, x0, [x21, 40]
	sub	x1, x6, x0
	tst	x1, 127
	bne	.L129
.L152:
	add	w22, w22, 1
	str	xzr, [x21, 24]
	mov	x0, 11848
	add	x21, x21, x0
	cmp	w22, 32
	bne	.L136
.L151:
	mrs	x0, sp_el0
	ldr	x2, [sp, 72]
	ldr	x1, [x0, 1424]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L154
	ldp	x29, x30, [sp, 80]
	ldp	x19, x20, [sp, 96]
	ldp	x21, x22, [sp, 112]
	ldp	x23, x24, [sp, 128]
	ldr	x25, [sp, 144]
	add	sp, sp, 160
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L153:
	ldrb	w1, [x21]
	mov	x0, x19
	bl	_printk
	ldp	x6, x0, [x21, 40]
	b	.L150
	.p2align 2,,3
.L132:
#APP
// 114 "/home/sri/hailort-drivers/linux/pcie/../../common/vdma_common.c" 1
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "/home/sri/hailort-drivers/linux/pcie/../../common/vdma_common.c"; .popsection; .long 14472b - .; .short 114; .short 0; .align 2; .popsection; 14471: brk 0x800
// 0 "" 2
#NO_APP
.L154:
	bl	__stack_chk_fail
	.size	hailo_vdma_engine_disable_channels, .-hailo_vdma_engine_disable_channels
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_engine_push_timestamps
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_program_descriptors_in_chunk
	.align	3
	.8byte	.LPFE9
	.text
.LPFE9:
	nop
	nop
	.type	hailo_vdma_engine_push_timestamps, %function
hailo_vdma_engine_push_timestamps:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -80]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	add	x20, x0, 16
	mov	w19, 0
	stp	x21, x22, [sp, 32]
	mov	w21, w1
	mov	x22, 11848
	stp	x23, x24, [sp, 48]
	mov	w23, 1
	b	.L161
	.p2align 2,,3
.L157:
	add	w19, w19, 1
	add	x20, x20, x22
	cmp	w19, 32
	beq	.L171
.L161:
	lsl	w0, w23, w19
	tst	w0, w21
	beq	.L157
	add	x0, x20, 8192
	ldrb	w0, [x0, 1080]
	cbz	w0, .L157
.L159:
.L160:
	str	x25, [sp, 64]
	ldr	x24, [x20, 8]
	add	x24, x24, 4
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w24, [x24]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 95
 .byte 662b-661b
 .byte 664f-663f
.popsection
.subsection 1
663:
	ldar w24, [x24]
664:
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
	.previous
.endif

// 0 "" 2
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshld
// 0 "" 2
#NO_APP
	uxtw	x0, w24
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x0, x0, x0
cbnz	x0, .
// 0 "" 2
#NO_APP
	ldr	w0, [x20, 9280]
	ldr	w25, [x20, 9276]
	sub	w0, w0, #1
	sub	w0, w0, w25
	tst	w0, 255
	bne	.L172
	add	w19, w19, 1
	add	x20, x20, x22
	ldr	x25, [sp, 64]
	cmp	w19, 32
	bne	.L161
.L171:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	hint	29 // autiasp
	ret
.L172:
	bl	ktime_get
	sbfiz	x1, x25, 2, 32
	mov	x2, 9276
	add	x1, x1, w25, sxtw
	add	x2, x20, x2
	add	x1, x2, x1, lsl 1
	str	x0, [x1, 8]
	ldr	w0, [x20, 9276]
	add	w1, w0, 1
	sbfiz	x3, x0, 2, 32
	and	w1, w1, 255
	add	x0, x3, w0, sxtw
	add	x0, x2, x0, lsl 1
	strh	w24, [x0, 16]
	str	w1, [x20, 9276]
	ldr	x25, [sp, 64]
	b	.L157
	.size	hailo_vdma_engine_push_timestamps, .-hailo_vdma_engine_push_timestamps
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_engine_read_timestamps
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_program_descriptors_in_chunk
	.align	3
	.8byte	.LPFE10
	.text
.LPFE10:
	nop
	nop
	.type	hailo_vdma_engine_read_timestamps, %function
hailo_vdma_engine_read_timestamps:
	nop
	nop
	ldrb	w4, [x1, 1]
	cmp	w4, 31
	bhi	.L177
	uxtw	x3, w4
	mov	x7, 11848
	mov	x2, 9232
	mov	w6, 0
	madd	x3, x3, x7, x0
	add	x3, x3, x2
	add	x2, x3, 60
	ldr	w5, [x3, 60]
	ldr	w3, [x2, 4]
	sub	w5, w5, w3
	tst	w5, 255
	beq	.L175
	sbfiz	x5, x3, 2, 32
	sxtw	x4, w4
	add	x5, x5, w3, sxtw
	add	x3, x1, 16
	add	x5, x2, x5, lsl 1
	madd	x4, x4, x7, x0
	ldr	x0, [x5, 8]
	str	x0, [x1, 6]
	ldrh	w0, [x5, 16]
	strh	w0, [x1, 14]
	ldr	w0, [x2, 4]
	add	w0, w0, 1
	and	w0, w0, 255
	str	w0, [x2, 4]
.L176:
	ldrh	w5, [x3, -2]
	add	w6, w6, 1
	ldr	w0, [x4, 52]
	and	w0, w0, w5
	strh	w0, [x3, -2]
	ldp	w5, w0, [x2]
	sub	w5, w5, w0
	sbfiz	x7, x0, 2, 32
	tst	w5, 255
	beq	.L175
	add	x0, x7, w0, sxtw
	add	x3, x3, 10
	add	x0, x2, x0, lsl 1
	ldr	x5, [x0, 8]
	str	x5, [x3, -10]
	ldrh	w0, [x0, 16]
	strh	w0, [x3, -2]
	ldr	w0, [x2, 4]
	add	w0, w0, 1
	and	w0, w0, 255
	str	w0, [x2, 4]
	cmp	w6, 256
	bne	.L176
.L175:
	mov	w0, 0
	str	w6, [x1, 2]
	ret
.L177:
	mov	w0, -22
	ret
	.size	hailo_vdma_engine_read_timestamps, .-hailo_vdma_engine_read_timestamps
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_engine_clear_channel_interrupts
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_program_descriptors_in_chunk
	.align	3
	.8byte	.LPFE11
	.text
.LPFE11:
	nop
	nop
	.type	hailo_vdma_engine_clear_channel_interrupts, %function
hailo_vdma_engine_clear_channel_interrupts:
	nop
	nop
	ldr	w2, [x0, 8]
	bic	w1, w2, w1
	str	w1, [x0, 8]
	ret
	.size	hailo_vdma_engine_clear_channel_interrupts, .-hailo_vdma_engine_clear_channel_interrupts
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_engine_set_channel_interrupts
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_program_descriptors_in_chunk
	.align	3
	.8byte	.LPFE12
	.text
.LPFE12:
	nop
	nop
	.type	hailo_vdma_engine_set_channel_interrupts, %function
hailo_vdma_engine_set_channel_interrupts:
	nop
	nop
	ldr	w2, [x0, 8]
	orr	w2, w2, w1
	str	w2, [x0, 8]
	ret
	.size	hailo_vdma_engine_set_channel_interrupts, .-hailo_vdma_engine_set_channel_interrupts
	.section	.rodata.str1.8
	.align	3
.LC6:
	.string	"\0013Expecting desc %d to be done\n"
	.align	3
.LC7:
	.string	"\0013Got unexpected error on desc %d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_engine_fill_irq_data
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_program_descriptors_in_chunk
	.align	3
	.8byte	.LPFE13
	.text
.LPFE13:
	nop
	nop
	.type	hailo_vdma_engine_fill_irq_data, %function
hailo_vdma_engine_fill_irq_data:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -128]!
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	add	x0, x1, 376832
	add	x0, x0, 2320
	mov	w22, w2
	stp	x19, x20, [sp, 16]
	mov	x20, x3
	mov	x19, x4
	stp	x23, x24, [sp, 48]
	stp	x27, x28, [sp, 80]
	add	x28, x1, 16
	str	x0, [sp, 96]
	mov	w0, 1
	mov	w24, w0
	stp	x25, x26, [sp, 64]
	str	w0, [sp, 108]
	str	x1, [sp, 112]
.L211:
	ldrb	w0, [x28]
	lsl	w0, w24, w0
	tst	w0, w22
	beq	.L187
	ldr	x0, [x28, 24]
	cbz	x0, .L187
	ldrb	w0, [x21, 12]
	cmp	w0, 95
	bhi	.L212
.L189:
.L190:
	ldr	x0, [x28, 8]
	add	x0, x0, 4
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w0, [x0]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 95
 .byte 662b-661b
 .byte 664f-663f
.popsection
.subsection 1
663:
	ldar w0, [x0]
664:
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
	.previous
.endif

// 0 "" 2
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshld
// 0 "" 2
#NO_APP
	uxtw	x1, w0
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x1, x1, x1
cbnz	x1, .
// 0 "" 2
#NO_APP
	ldp	x1, x23, [x28, 40]
	mov	w27, 0
	ldr	w8, [x28, 36]
	and	w8, w8, w0
	and	w25, w8, 65535
	sub	x1, x1, x23
	tst	x1, 127
	beq	.L191
	.p2align 3,,7
.L201:
	lsl	x26, x23, 3
	ldrh	w1, [x28, 32]
	add	x0, x26, x23
	lsl	x0, x0, 3
	add	x7, x0, 56
	add	x7, x28, x7
	cmp	w1, w25
	beq	.L192
	add	x0, x28, x0
	ldrh	w1, [x28, 34]
	ldrh	w2, [x0, 56]
	cmp	w25, w1
	beq	.L191
	cmp	w25, w2
	cset	w0, hi
	cmp	w1, w2
	cset	w2, ls
	cmp	w25, w1
	and	w1, w0, w2
	orr	w0, w0, w2
	csel	w0, w0, w1, ls
	cbz	w0, .L191
.L192:
	add	x0, x26, x23
	ldr	x3, [x28, 24]
	add	x0, x28, x0, lsl 3
	ldrb	w0, [x0, 120]
	cbnz	w0, .L235
.L195:
	add	x11, x26, x23
	add	x12, x28, x11, lsl 3
	ldrb	w0, [x12, 112]
	cmp	w0, 3
	bhi	.L197
.L238:
	lsl	x11, x11, 2
	mov	w1, 0
	cbz	w0, .L200
	.p2align 3,,7
.L198:
	add	x0, x11, w1, sxtw
	ldrh	w5, [x3, 16]
	ldr	x10, [x3]
	add	x0, x28, x0, lsl 1
	lsl	w5, w5, 8
	add	w2, w1, 1
	add	w5, w5, 2
	and	w1, w2, 255
	ldrh	w0, [x0, 114]
	lsl	x0, x0, 4
	str	w5, [x10, x0]
	ldrb	w0, [x12, 112]
	cmp	w0, w2, uxtb
	bhi	.L198
.L200:
	mov	x0, x7
	mov	x1, x19
	blr	x20
	add	x6, x26, x23
	ldr	w3, [x28, 36]
	ldp	x1, x4, [x28, 40]
	add	x6, x28, x6, lsl 3
	ldrh	w0, [x6, 56]
	sub	x2, x1, x4
	add	w0, w0, 1
	and	w0, w0, w3
	strh	w0, [x28, 34]
	tst	x2, 127
	beq	.L236
	add	x4, x4, 1
	add	w9, w27, 1
	and	x23, x4, 127
	str	x23, [x28, 48]
	sub	x1, x1, x23
	and	w27, w9, 255
	tst	x1, 127
	bne	.L201
	.p2align 3,,7
.L191:
.L202:
.L203:
.L204:
.L205:
.L207:
.L208:
.L209:
.L210:
	ldr	x2, [x28, 8]
	ldrb	w3, [x21, 12]
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w2, [x2]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 95
 .byte 662b-661b
 .byte 664f-663f
.popsection
.subsection 1
663:
	ldar w2, [x2]
664:
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
	.previous
.endif

// 0 "" 2
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshld
// 0 "" 2
#NO_APP
	uxtw	x0, w2
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x0, x0, x0
cbnz	x0, .
// 0 "" 2
#NO_APP
	ldr	x1, [x28, 16]
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w1, [x1]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 95
 .byte 662b-661b
 .byte 664f-663f
.popsection
.subsection 1
663:
	ldar w1, [x1]
664:
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
	.previous
.endif

// 0 "" 2
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshld
// 0 "" 2
#NO_APP
	uxtw	x0, w1
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x0, x0, x0
cbnz	x0, .
// 0 "" 2
#NO_APP
	ldr	x4, [sp, 112]
	ubfiz	x0, x3, 3, 8
	sub	x0, x0, w3, uxtb
	tst	x2, 1
	add	x0, x21, x0
	csel	w1, w1, wzr, ne
	ldrb	w4, [x4]
	and	w1, w1, 1
	strb	w4, [x0, 13]
	ldrb	w2, [x28]
	strb	w2, [x0, 14]
	strb	w1, [x0, 15]
	strb	w27, [x0, 16]
	ldr	x1, [x28, 8]
	add	x1, x1, 8
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w1, [x1]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 95
 .byte 662b-661b
 .byte 664f-663f
.popsection
.subsection 1
663:
	ldar w1, [x1]
664:
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
	.previous
.endif

// 0 "" 2
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshld
// 0 "" 2
#NO_APP
	uxtw	x2, w1
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x2, x2, x2
cbnz	x2, .
// 0 "" 2
#NO_APP
	strb	w1, [x0, 17]
	ldr	x1, [x28, 16]
	add	x1, x1, 8
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w1, [x1]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 95
 .byte 662b-661b
 .byte 664f-663f
.popsection
.subsection 1
663:
	ldar w1, [x1]
664:
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
	.previous
.endif

// 0 "" 2
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshld
// 0 "" 2
#NO_APP
	uxtw	x2, w1
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x2, x2, x2
cbnz	x2, .
// 0 "" 2
#NO_APP
	strb	w1, [x0, 18]
	ldrb	w1, [sp, 108]
	strb	w1, [x0, 19]
	ldrb	w0, [x21, 12]
	add	w0, w0, 1
	strb	w0, [x21, 12]
.L187:
	mov	x0, 11848
	add	x28, x28, x0
	ldr	x0, [sp, 96]
	cmp	x28, x0
	bne	.L211
	mov	w0, 0
.L186:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L235:
	ldrh	w1, [x7]
	ldr	x0, [x3]
	ubfiz	x2, x1, 4, 16
	add	x0, x0, x2
	ldr	w0, [x0, 12]
	tbz	x0, 0, .L237
	tbz	x0, 1, .L195
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	str	x7, [sp, 120]
	bl	_printk
	add	x11, x26, x23
	str	wzr, [sp, 108]
	ldr	x3, [x28, 24]
	add	x12, x28, x11, lsl 3
	ldr	x7, [sp, 120]
	ldrb	w0, [x12, 112]
	cmp	w0, 3
	bls	.L238
	.p2align 3,,7
.L197:
#APP
// 114 "/home/sri/hailort-drivers/linux/pcie/../../common/vdma_common.c" 1
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "/home/sri/hailort-drivers/linux/pcie/../../common/vdma_common.c"; .popsection; .long 14472b - .; .short 114; .short 0; .align 2; .popsection; 14471: brk 0x800
// 0 "" 2
#NO_APP
.L237:
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	str	wzr, [sp, 108]
	str	x7, [sp, 120]
	bl	_printk
	ldr	x3, [x28, 24]
	ldr	x7, [sp, 120]
	b	.L195
.L212:
	mov	w0, -22
	b	.L186
.L236:
	add	w9, w27, 1
	and	w27, w9, 255
	b	.L191
	.size	hailo_vdma_engine_fill_irq_data, .-hailo_vdma_engine_fill_irq_data
	.section	.rodata.str1.8
	.align	3
.LC8:
	.string	"\0013Timeout occured while waiting for channel to become idle\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_stop_channel
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_program_descriptors_in_chunk
	.align	3
	.8byte	.LPFE14
	.text
.LPFE14:
	nop
	nop
	.type	hailo_vdma_stop_channel, %function
hailo_vdma_stop_channel:
	nop
	nop
.L240:
.L241:
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [sp, 16]
	mov	x19, x0
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w0, [x0]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 95
 .byte 662b-661b
 .byte 664f-663f
.popsection
.subsection 1
663:
	ldar w0, [x0]
664:
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
	.previous
.endif

// 0 "" 2
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshld
// 0 "" 2
#NO_APP
	uxtw	x1, w0
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x1, x1, x1
cbnz	x1, .
// 0 "" 2
#NO_APP
	and	w0, w0, 3
	cmp	w0, 2
	beq	.L239
.L243:
.L244:
.L245:
.L246:
.L247:
.L248:
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w0, [x19]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 95
 .byte 662b-661b
 .byte 664f-663f
.popsection
.subsection 1
663:
	ldar w0, [x19]
664:
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
	.previous
.endif

// 0 "" 2
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshld
// 0 "" 2
#NO_APP
	uxtw	x1, w0
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x1, x1, x1
cbnz	x1, .
// 0 "" 2
#NO_APP
	and	w0, w0, -256
	orr	w0, w0, 3
#APP
// 277 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshst
// 0 "" 2
// 42 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	str w0, [x19]
// 0 "" 2
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w0, [x19]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 95
 .byte 662b-661b
 .byte 664f-663f
.popsection
.subsection 1
663:
	ldar w0, [x19]
664:
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
	.previous
.endif

// 0 "" 2
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshld
// 0 "" 2
#NO_APP
	uxtw	x1, w0
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x1, x1, x1
cbnz	x1, .
// 0 "" 2
#NO_APP
	ubfx	x0, x0, 11, 4
	mov	w2, 1
	add	x7, x19, 4
	mov	w6, 10000
	lsl	w2, w2, w0
	sxtw	x2, w2
	b	.L252
	.p2align 2,,3
.L265:
	subs	w6, w6, #1
	beq	.L264
.L252:
.L249:
.L250:
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w1, [x7]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 95
 .byte 662b-661b
 .byte 664f-663f
.popsection
.subsection 1
663:
	ldar w1, [x7]
664:
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
	.previous
.endif

// 0 "" 2
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshld
// 0 "" 2
#NO_APP
	uxtw	x3, w1
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x3, x3, x3
cbnz	x3, .
// 0 "" 2
#NO_APP
	and	x5, x1, 65535
	lsr	w1, w1, 16
	udiv	x4, x5, x2
	udiv	x3, x1, x2
	msub	x4, x4, x2, x5
	msub	x1, x3, x2, x1
	cmp	x4, x1
	bne	.L265
.L254:
.L255:
.L256:
.L257:
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w0, [x19]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 95
 .byte 662b-661b
 .byte 664f-663f
.popsection
.subsection 1
663:
	ldar w0, [x19]
664:
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
	.previous
.endif

// 0 "" 2
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshld
// 0 "" 2
#NO_APP
	uxtw	x1, w0
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x1, x1, x1
cbnz	x1, .
// 0 "" 2
#NO_APP
	and	w0, w0, -256
#APP
// 277 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshst
// 0 "" 2
// 42 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	str w0, [x19]
// 0 "" 2
#NO_APP
.L239:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
.L264:
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	_printk
	b	.L254
	.size	hailo_vdma_stop_channel, .-hailo_vdma_stop_channel
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_start_channel
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_program_descriptors_in_chunk
	.align	3
	.8byte	.LPFE15
	.text
.LPFE15:
	nop
	nop
	.type	hailo_vdma_start_channel, %function
hailo_vdma_start_channel:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	mov	w4, 0
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	and	x0, x1, 65535
	stp	x21, x22, [sp, 32]
	mov	x21, x1
	and	w22, w3, 255
	cmp	w2, 1
	bls	.L291
	.p2align 3,,7
.L267:
	add	w5, w2, 1
	add	w4, w4, 1
	and	w4, w4, 255
	lsr	w2, w5, 1
	cmp	w5, 3
	bhi	.L267
	cmp	x0, 0
	ccmp	w4, 16, 2, eq
	bhi	.L285
	cmp	w4, 16
	lsl	w4, w4, 11
	csel	w19, w4, wzr, ne
.L270:
.L271:
.L272:
.L273:
.L274:
.L275:
.L276:
.L277:
.L278:
.L279:
.L280:
.L281:
.L282:
	mov	x0, x20
	bl	hailo_vdma_stop_channel
	lsr	w3, w21, 16
	add	x1, x20, 8
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w0, [x1]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 95
 .byte 662b-661b
 .byte 664f-663f
.popsection
.subsection 1
663:
	ldar w0, [x1]
664:
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
	.previous
.endif

// 0 "" 2
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshld
// 0 "" 2
#NO_APP
	uxtw	x2, w0
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x2, x2, x2
cbnz	x2, .
// 0 "" 2
#NO_APP
	bfi	w0, w3, 16, 16
#APP
// 277 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshst
// 0 "" 2
// 42 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	str w0, [x1]
// 0 "" 2
#NO_APP
	lsr	x21, x21, 32
	add	x0, x20, 12
#APP
// 277 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshst
// 0 "" 2
// 42 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	str w21, [x0]
// 0 "" 2
#NO_APP
	orr	w22, w19, w22, lsl 8
#APP
// 277 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshst
// 0 "" 2
// 42 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	str w22, [x20]
// 0 "" 2
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w0, [x20]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 95
 .byte 662b-661b
 .byte 664f-663f
.popsection
.subsection 1
663:
	ldar w0, [x20]
664:
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
	.previous
.endif

// 0 "" 2
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshld
// 0 "" 2
#NO_APP
	uxtw	x1, w0
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x1, x1, x1
cbnz	x1, .
// 0 "" 2
#NO_APP
	and	w0, w0, -256
	orr	w0, w0, 1
#APP
// 277 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshst
// 0 "" 2
// 42 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	str w0, [x20]
// 0 "" 2
#NO_APP
	mov	w0, 0
.L266:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L291:
	cbnz	x0, .L285
	mov	w19, 0
	b	.L270
.L285:
	mov	w0, -22
	b	.L266
	.size	hailo_vdma_start_channel, .-hailo_vdma_start_channel
	.align	2
	.p2align 3,,7
	.global	hailo_check_channel_index
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_program_descriptors_in_chunk
	.align	3
	.8byte	.LPFE16
	.text
.LPFE16:
	nop
	nop
	.type	hailo_check_channel_index, %function
hailo_check_channel_index:
	nop
	nop
	mov	w3, 1
	lsl	w0, w3, w0
	and	w0, w0, w1
	tst	w2, 255
	beq	.L293
	cmp	w0, 0
	cset	w0, ne
	ret
	.p2align 2,,3
.L293:
	cmp	w0, 0
	cset	w0, eq
	ret
	.size	hailo_check_channel_index, .-hailo_check_channel_index
	.ident	"GCC: (Debian 12.2.0-14+deb12u1) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align	3
	.word	4
	.word	16
	.word	5
	.string	"GNU"
	.word	3221225472
	.word	4
	.word	2
	.align	3
