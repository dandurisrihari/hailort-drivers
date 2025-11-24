	.arch armv8-a
	.file	"fw_validation.c"
	.text
	.align	2
	.p2align 3,,7
	.global	FW_VALIDATION__validate_fw_header
	.section	__patchable_function_entries,"awo",@progbits,FW_VALIDATION__validate_fw_header
	.align	3
	.8byte	.LPFE1
	.text
.LPFE1:
	nop
	nop
	.type	FW_VALIDATION__validate_fw_header, %function
FW_VALIDATION__validate_fw_header:
	nop
	nop
	ldr	w7, [x3]
	add	w6, w7, 24
	add	x9, x0, w7, uxtw
	cmp	x1, 23
	bls	.L9
	cmp	x1, w6, uxtw
	ccmp	w5, 4, 2, cs
	bhi	.L9
	adrp	x8, .LANCHOR0
	add	x8, x8, :lo12:.LANCHOR0
	ldr	w7, [x0, w7, uxtw]
	ldr	w0, [x8, w5, uxtw 2]
	cmp	w7, w0
	bne	.L9
	ldr	w0, [x9, 4]
	cbnz	w0, .L9
	ldr	w0, [x9, 20]
	cmp	w0, 79
	ccmp	w0, w2, 2, hi
	bhi	.L9
	add	w6, w0, w6
	cmp	x1, w0, uxtw
	bcc	.L9
	cmp	x1, w6, uxtw
	bcc	.L9
	str	w6, [x3]
	mov	w0, 0
	str	x9, [x4]
	ret
	.p2align 2,,3
.L9:
.L2:
	mov	w0, -22
	ret
	.size	FW_VALIDATION__validate_fw_header, .-FW_VALIDATION__validate_fw_header
	.align	2
	.p2align 3,,7
	.global	FW_VALIDATION__validate_cert_header
	.section	__patchable_function_entries,"awo",@progbits,FW_VALIDATION__validate_fw_header
	.align	3
	.8byte	.LPFE2
	.text
.LPFE2:
	nop
	nop
	.type	FW_VALIDATION__validate_cert_header, %function
FW_VALIDATION__validate_cert_header:
	nop
	nop
	ldr	w5, [x2]
	add	w4, w5, 8
	add	x6, x0, w5, uxtw
	cmp	x1, 7
	bls	.L20
	cmp	x1, w4, uxtw
	bcc	.L20
	ldr	w0, [x0, w5, uxtw]
	cmp	w0, 4096
	bhi	.L20
	ldr	w5, [x6, 4]
	cmp	w5, 4096
	bhi	.L20
	add	w4, w0, w4
	cmp	x1, w0, uxtw
	bcc	.L20
	cmp	x1, w4, uxtw
	bcc	.L20
	add	w4, w5, w4
	cmp	x1, w5, uxtw
	bcc	.L20
	cmp	x1, w4, uxtw
	bcc	.L20
	str	w4, [x2]
	mov	w0, 0
	str	x6, [x3]
	ret
	.p2align 2,,3
.L20:
.L12:
	mov	w0, -22
	ret
	.size	FW_VALIDATION__validate_cert_header, .-FW_VALIDATION__validate_cert_header
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	CSWTCH.1, %object
	.size	CSWTCH.1, 20
CSWTCH.1:
	.word	500735456
	.word	-385492309
	.word	-112772693
	.word	-385492309
	.word	-385492309
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
