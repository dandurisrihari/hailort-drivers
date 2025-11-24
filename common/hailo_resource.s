	.arch armv8-a
	.file	"hailo_resource.c"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_resource_read8
	.section	__patchable_function_entries,"awo",@progbits,hailo_resource_read8
	.align	3
	.8byte	.LPFE1
	.text
.LPFE1:
	nop
	nop
	.type	hailo_resource_read8, %function
hailo_resource_read8:
	nop
	nop
.L2:
.L3:
	ldr	x2, [x0]
	add	x2, x1, x2
	and	x2, x2, -4
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
	uxtw	x3, w2
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x3, x3, x3
cbnz	x3, .
// 0 "" 2
#NO_APP
	ldr	x0, [x0]
	add	x1, x1, x0
	ubfiz	x1, x1, 3, 2
	lsr	w0, w2, w1
	ret
	.size	hailo_resource_read8, .-hailo_resource_read8
	.align	2
	.p2align 3,,7
	.global	hailo_resource_read16
	.section	__patchable_function_entries,"awo",@progbits,hailo_resource_read8
	.align	3
	.8byte	.LPFE2
	.text
.LPFE2:
	nop
	nop
	.type	hailo_resource_read16, %function
hailo_resource_read16:
	nop
	nop
.L6:
.L7:
	ldr	x2, [x0]
	add	x2, x1, x2
	and	x2, x2, -4
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
	uxtw	x3, w2
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x3, x3, x3
cbnz	x3, .
// 0 "" 2
#NO_APP
	ldr	x0, [x0]
	add	x1, x1, x0
	ubfiz	x1, x1, 3, 2
	lsr	w0, w2, w1
	ret
	.size	hailo_resource_read16, .-hailo_resource_read16
	.align	2
	.p2align 3,,7
	.global	hailo_resource_read32
	.section	__patchable_function_entries,"awo",@progbits,hailo_resource_read8
	.align	3
	.8byte	.LPFE3
	.text
.LPFE3:
	nop
	nop
	.type	hailo_resource_read32, %function
hailo_resource_read32:
	nop
	nop
.L9:
.L10:
	ldr	x0, [x0]
	add	x0, x1, x0
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
	.size	hailo_resource_read32, .-hailo_resource_read32
	.align	2
	.p2align 3,,7
	.global	hailo_resource_write8
	.section	__patchable_function_entries,"awo",@progbits,hailo_resource_read8
	.align	3
	.8byte	.LPFE4
	.text
.LPFE4:
	nop
	nop
	.type	hailo_resource_write8, %function
hailo_resource_write8:
	nop
	nop
.L12:
.L13:
.L14:
.L15:
	ldr	x3, [x0]
	and	w2, w2, 255
	add	x3, x1, x3
	and	x3, x3, -4
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w3, [x3]
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
	ldar w3, [x3]
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
	uxtw	x4, w3
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x4, x4, x4
cbnz	x4, .
// 0 "" 2
#NO_APP
	ldr	x4, [x0]
	mov	w0, 255
	add	x1, x1, x4
	and	x4, x1, -4
	ubfiz	x1, x1, 3, 2
	lsl	w0, w0, w1
	bic	w0, w3, w0
	lsl	w2, w2, w1
	orr	w0, w0, w2
#APP
// 277 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshst
// 0 "" 2
// 42 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	str w0, [x4]
// 0 "" 2
#NO_APP
	ret
	.size	hailo_resource_write8, .-hailo_resource_write8
	.align	2
	.p2align 3,,7
	.global	hailo_resource_write16
	.section	__patchable_function_entries,"awo",@progbits,hailo_resource_read8
	.align	3
	.8byte	.LPFE5
	.text
.LPFE5:
	nop
	nop
	.type	hailo_resource_write16, %function
hailo_resource_write16:
	nop
	nop
.L17:
.L18:
.L19:
.L20:
	ldr	x3, [x0]
	and	w2, w2, 65535
	add	x3, x1, x3
	and	x3, x3, -4
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w3, [x3]
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
	ldar w3, [x3]
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
	uxtw	x4, w3
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x4, x4, x4
cbnz	x4, .
// 0 "" 2
#NO_APP
	ldr	x4, [x0]
	mov	w0, 65535
	add	x1, x1, x4
	and	x4, x1, -4
	ubfiz	x1, x1, 3, 2
	lsl	w0, w0, w1
	bic	w0, w3, w0
	lsl	w2, w2, w1
	orr	w0, w0, w2
#APP
// 277 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshst
// 0 "" 2
// 42 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	str w0, [x4]
// 0 "" 2
#NO_APP
	ret
	.size	hailo_resource_write16, .-hailo_resource_write16
	.align	2
	.p2align 3,,7
	.global	hailo_resource_write32
	.section	__patchable_function_entries,"awo",@progbits,hailo_resource_read8
	.align	3
	.8byte	.LPFE6
	.text
.LPFE6:
	nop
	nop
	.type	hailo_resource_write32, %function
hailo_resource_write32:
	nop
	nop
.L22:
.L23:
	ldr	x0, [x0]
	add	x1, x1, x0
#APP
// 277 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshst
// 0 "" 2
// 42 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	str w2, [x1]
// 0 "" 2
#NO_APP
	ret
	.size	hailo_resource_write32, .-hailo_resource_write32
	.align	2
	.p2align 3,,7
	.global	hailo_resource_read_buffer
	.section	__patchable_function_entries,"awo",@progbits,hailo_resource_read8
	.align	3
	.8byte	.LPFE7
	.text
.LPFE7:
	nop
	nop
	.type	hailo_resource_read_buffer, %function
hailo_resource_read_buffer:
	nop
	nop
	cbnz	x2, .L25
	b	.L24
	.p2align 2,,3
.L31:
.L26:
.L27:
	and	x5, x5, -4
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w5, [x5]
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
	ldar w5, [x5]
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
	uxtw	x4, w5
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x4, x4, x4
cbnz	x4, .
// 0 "" 2
#NO_APP
	ldr	x4, [x0]
	subs	x2, x2, #1
	add	x4, x1, x4
	add	x1, x1, 1
	ubfiz	x4, x4, 3, 2
	lsr	w5, w5, w4
	strb	w5, [x3], 1
	beq	.L24
.L25:
	ldr	x4, [x0]
	add	x5, x1, x4
	orr	x6, x5, x3
	tst	x6, 3
	bne	.L31
	mov	x6, x1
	cmp	x2, 3
	bls	.L30
	sub	x8, x2, #4
	add	x6, x1, 4
	and	x8, x8, -4
	sub	x7, x3, x1
	add	x6, x6, x8
	b	.L35
	.p2align 2,,3
.L48:
	ldr	x4, [x0]
.L35:
.L33:
.L34:
	add	x4, x1, x4
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w4, [x4]
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
	ldar w4, [x4]
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
	uxtw	x5, w4
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x5, x5, x5
cbnz	x5, .
// 0 "" 2
#NO_APP
	str	w4, [x7, x1]
	add	x1, x1, 4
	cmp	x1, x6
	bne	.L48
	add	x3, x3, 4
	ands	x2, x2, 3
	add	x3, x3, x8
	beq	.L24
	ldr	x4, [x0]
.L30:
	mov	x1, x6
	sub	x3, x3, x1
	add	x6, x6, x2
.L38:
.L36:
.L37:
	add	x4, x1, x4
	and	x4, x4, -4
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w4, [x4]
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
	ldar w4, [x4]
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
	uxtw	x2, w4
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x2, x2, x2
cbnz	x2, .
// 0 "" 2
#NO_APP
	ldr	x2, [x0]
	add	x2, x1, x2
	ubfiz	x2, x2, 3, 2
	lsr	w4, w4, w2
	strb	w4, [x3, x1]
	add	x1, x1, 1
	cmp	x1, x6
	beq	.L24
	ldr	x4, [x0]
	b	.L38
	.p2align 2,,3
.L24:
	ret
	.size	hailo_resource_read_buffer, .-hailo_resource_read_buffer
	.align	2
	.p2align 3,,7
	.global	hailo_resource_write_buffer
	.section	__patchable_function_entries,"awo",@progbits,hailo_resource_read8
	.align	3
	.8byte	.LPFE8
	.text
.LPFE8:
	nop
	nop
	.type	hailo_resource_write_buffer, %function
hailo_resource_write_buffer:
	nop
	nop
	cbz	x2, .L60
	ldr	x5, [x0]
	add	x4, x1, x5
	orr	x6, x3, x4
	tst	x6, 3
	beq	.L52
	mov	w9, 255
	b	.L61
	.p2align 2,,3
.L59:
	add	x3, x3, 1
	add	x1, x1, 1
	subs	x2, x2, #1
	beq	.L60
	add	x4, x1, x5
	orr	x6, x4, x3
	tst	x6, 3
	beq	.L52
.L61:
.L53:
.L54:
.L55:
.L56:
.L57:
.L58:
	ldrb	w7, [x3]
	and	x4, x4, -4
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w4, [x4]
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
	ldar w4, [x4]
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
	uxtw	x5, w4
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x5, x5, x5
cbnz	x5, .
// 0 "" 2
#NO_APP
	ldr	x5, [x0]
	add	x5, x1, x5
	and	x8, x5, -4
	ubfiz	x5, x5, 3, 2
	lsl	w6, w9, w5
	bic	w4, w4, w6
	lsl	w5, w7, w5
	orr	w4, w4, w5
#APP
// 277 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshst
// 0 "" 2
// 42 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	str w4, [x8]
// 0 "" 2
#NO_APP
	ldr	x4, [x0]
	add	x4, x1, x4
	and	x4, x4, -4
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w4, [x4]
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
	ldar w4, [x4]
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
	uxtw	x5, w4
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x5, x5, x5
cbnz	x5, .
// 0 "" 2
#NO_APP
	ldr	x5, [x0]
	ldrb	w7, [x3]
	add	x6, x5, x1
	ubfiz	x6, x6, 3, 2
	lsr	w4, w4, w6
	cmp	w7, w4, uxtb
	beq	.L59
.L66:
	mov	w0, -5
	ret
	.p2align 2,,3
.L52:
	cmp	x2, 3
	bhi	.L67
	b	.L75
	.p2align 2,,3
.L90:
	sub	x2, x2, #4
	add	x3, x3, 4
	add	x1, x1, 4
	cmp	x2, 3
	bls	.L89
	ldr	x5, [x0]
.L67:
.L62:
.L63:
.L64:
.L65:
	add	x5, x1, x5
	ldr	w4, [x3]
#APP
// 277 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshst
// 0 "" 2
// 42 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	str w4, [x5]
// 0 "" 2
#NO_APP
	ldr	x4, [x0]
	add	x4, x1, x4
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w4, [x4]
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
	ldar w4, [x4]
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
	uxtw	x5, w4
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x5, x5, x5
cbnz	x5, .
// 0 "" 2
#NO_APP
	ldr	w5, [x3]
	cmp	w5, w4
	beq	.L90
	b	.L66
	.p2align 2,,3
.L89:
	cbz	x2, .L60
	ldr	x5, [x0]
.L75:
	mov	x6, x3
	sub	x1, x1, x6
	add	x3, x3, x2
	mov	w9, 255
	b	.L74
	.p2align 2,,3
.L91:
	add	x6, x6, 1
	cmp	x6, x3
	beq	.L60
.L74:
.L68:
.L69:
.L70:
.L71:
.L72:
.L73:
	add	x4, x6, x1
	ldrb	w8, [x6]
	add	x5, x5, x4
	and	x5, x5, -4
#APP
// 79 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	.if 1 == 1
661:
	ldr w5, [x5]
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
	ldar w5, [x5]
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
	uxtw	x2, w5
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x2, x2, x2
cbnz	x2, .
// 0 "" 2
#NO_APP
	ldr	x2, [x0]
	add	x2, x4, x2
	and	x10, x2, -4
	ubfiz	x2, x2, 3, 2
	lsl	w7, w9, w2
	bic	w5, w5, w7
	lsl	w2, w8, w2
	orr	w2, w5, w2
#APP
// 277 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	dmb oshst
// 0 "" 2
// 42 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/io.h" 1
	str w2, [x10]
// 0 "" 2
#NO_APP
	ldr	x2, [x0]
	add	x2, x4, x2
	and	x2, x2, -4
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
	uxtw	x5, w2
#APP
// 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/io.h" 1
	eor	x5, x5, x5
cbnz	x5, .
// 0 "" 2
#NO_APP
	ldr	x5, [x0]
	ldrb	w7, [x6]
	add	x4, x5, x4
	ubfiz	x4, x4, 3, 2
	lsr	w2, w2, w4
	cmp	w7, w2, uxtb
	beq	.L91
	b	.L66
	.p2align 2,,3
.L60:
	mov	w0, 0
	ret
	.size	hailo_resource_write_buffer, .-hailo_resource_write_buffer
	.align	2
	.p2align 3,,7
	.global	hailo_resource_transfer
	.section	__patchable_function_entries,"awo",@progbits,hailo_resource_read8
	.align	3
	.8byte	.LPFE9
	.text
.LPFE9:
	nop
	nop
	.type	hailo_resource_transfer, %function
hailo_resource_transfer:
	nop
	nop
	ldp	x4, x2, [x1, 8]
	ldr	x3, [x0, 8]
	cmp	x2, 4096
	add	x5, x4, x2
	ccmp	x5, x3, 2, ls
	bhi	.L96
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	w3, [x1]
	cbz	w3, .L94
	cmp	w3, 1
	beq	.L95
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	mov	w0, -22
	ret
	.p2align 2,,3
.L95:
	add	x3, x1, 24
	uxtw	x1, w4
	bl	hailo_resource_write_buffer
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L94:
	add	x3, x1, 24
	uxtw	x1, w4
	bl	hailo_resource_read_buffer
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L96:
	mov	w0, -22
	ret
	.size	hailo_resource_transfer, .-hailo_resource_transfer
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
