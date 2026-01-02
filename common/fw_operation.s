	.arch armv8-a
	.file	"fw_operation.c"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_read_firmware_notification
	.section	__patchable_function_entries,"awo",@progbits,hailo_read_firmware_notification
	.align	3
	.8byte	.LPFE1
	.text
.LPFE1:
	nop
	nop
	.type	hailo_read_firmware_notification, %function
hailo_read_firmware_notification:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #48
	mrs	x2, sp_el0
	add	x3, sp, 4
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	mov	x19, x1
	mov	x20, x0
	ldr	x1, [x2, 1424]
	str	x1, [sp, 8]
	mov	x1, 0
	mov	x2, 4
	str	wzr, [sp, 4]
	bl	hailo_resource_read_buffer
	ldrh	w2, [sp, 6]
	cmp	w2, 1500
	bhi	.L5
	ldrh	w0, [sp, 4]
	cbz	w0, .L5
	mov	x3, x19
	mov	x0, x20
	mov	x1, 4
	str	x2, [x3], 8
	bl	hailo_resource_read_buffer
	mov	x0, x20
	mov	w2, 0
	mov	x1, 0
	bl	hailo_resource_write16
	mov	w0, 0
.L1:
	mrs	x1, sp_el0
	ldr	x3, [sp, 8]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L8
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	add	sp, sp, 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L5:
	mov	w0, -22
	b	.L1
.L8:
	bl	__stack_chk_fail
	.size	hailo_read_firmware_notification, .-hailo_read_firmware_notification
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_read_firmware_notification
	.section	__patchable_function_entries,"awo",@progbits,hailo_read_firmware_notification
	.align	3
	.8byte	.LPFE2
	.text
.LPFE2:
	nop
	nop
	.type	hailo_pcie_read_firmware_notification, %function
hailo_pcie_read_firmware_notification:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #48
	mrs	x2, sp_el0
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	ldr	x3, [x2, 1424]
	str	x3, [sp, 24]
	mov	x3, 0
	ldr	x2, [x0, 8]
	stp	xzr, xzr, [sp, 8]
	cmp	x2, 3199
	bls	.L12
	ldr	x2, [x0]
	mov	x3, 1508
	add	x0, sp, 8
	add	x2, x2, 3200
	stp	x2, x3, [sp, 8]
	bl	hailo_read_firmware_notification
.L9:
	mrs	x1, sp_el0
	ldr	x3, [sp, 24]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L14
	ldp	x29, x30, [sp, 32]
	add	sp, sp, 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L12:
	mov	w0, -22
	b	.L9
.L14:
	bl	__stack_chk_fail
	.size	hailo_pcie_read_firmware_notification, .-hailo_pcie_read_firmware_notification
	.align	2
	.p2align 3,,7
	.global	hailo_read_firmware_log
	.section	__patchable_function_entries,"awo",@progbits,hailo_read_firmware_notification
	.align	3
	.8byte	.LPFE3
	.text
.LPFE3:
	nop
	nop
	.type	hailo_read_firmware_log, %function
hailo_read_firmware_log:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #96
	mrs	x2, sp_el0
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	mov	x20, x1
	stp	x23, x24, [sp, 64]
	add	x24, x1, 512
	ldr	x1, [x2, 1424]
	str	x1, [sp, 8]
	mov	x1, 0
	str	xzr, [sp]
	ldr	x1, [x24, 4]
	cmp	x1, 512
	bhi	.L22
	mov	x1, 0
	mov	x3, sp
	mov	x2, 8
	stp	x21, x22, [sp, 48]
	mov	x22, x0
	bl	hailo_resource_read_buffer
	ldp	w21, w1, [sp]
	add	x19, x1, 4088
	cmp	x21, x1
	sub	x19, x19, x21
	sub	x1, x1, x21
	csel	x19, x19, x1, hi
	cbz	x19, .L19
	str	x25, [sp, 80]
	add	x20, x20, 4
	add	x23, x21, 8
	ldr	x0, [x24, 4]
	cmp	x19, x0
	csel	x19, x19, x0, ls
	add	x0, x19, x21
	mov	x25, x19
	cmp	x0, 4087
	bhi	.L28
.L20:
	mov	x3, x20
	mov	x2, x25
	mov	x1, x23
	mov	x0, x22
	bl	hailo_resource_read_buffer
	add	x2, x23, x25
	mov	x0, x22
	sub	w2, w2, #8
	mov	x1, 0
	bl	hailo_resource_write32
	ldr	x25, [sp, 80]
.L19:
	str	x19, [x24, 12]
	mov	x0, 0
	ldp	x21, x22, [sp, 48]
.L15:
	mrs	x1, sp_el0
	ldr	x3, [sp, 8]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L29
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	ldp	x23, x24, [sp, 64]
	add	sp, sp, 96
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L28:
	mov	x25, 4088
	sub	x25, x25, x21
	mov	x2, x25
	mov	x3, x20
	mov	x1, x23
	mov	x0, x22
	bl	hailo_resource_read_buffer
	sub	x21, x21, #4088
	ldr	w0, [sp]
	add	x20, x20, x25
	add	x25, x21, x19
	sub	x23, x23, x0
	b	.L20
	.p2align 2,,3
.L22:
	mov	x0, -22
	b	.L15
.L29:
	stp	x21, x22, [sp, 48]
	str	x25, [sp, 80]
	bl	__stack_chk_fail
	.size	hailo_read_firmware_log, .-hailo_read_firmware_log
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_read_firmware_log
	.section	__patchable_function_entries,"awo",@progbits,hailo_read_firmware_notification
	.align	3
	.8byte	.LPFE4
	.text
.LPFE4:
	nop
	nop
	.type	hailo_pcie_read_firmware_log, %function
hailo_pcie_read_firmware_log:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #48
	mrs	x2, sp_el0
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	ldr	x3, [x2, 1424]
	str	x3, [sp, 24]
	mov	x3, 0
	mov	x2, 4096
	str	x2, [sp, 16]
	ldr	w2, [x1]
	ldr	x0, [x0]
	cbnz	w2, .L31
	add	x2, x1, 512
	add	x0, x0, 8192
	str	x0, [sp, 8]
	ldr	x0, [x2, 4]
	cbnz	x0, .L34
.L39:
	str	xzr, [x2, 12]
.L30:
	mrs	x1, sp_el0
	ldr	x3, [sp, 24]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L38
	ldp	x29, x30, [sp, 32]
	add	sp, sp, 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L31:
	cmp	w2, 1
	bne	.L36
	add	x2, x1, 512
	add	x0, x0, 12288
	str	x0, [sp, 8]
	ldr	x0, [x2, 4]
	cbz	x0, .L39
.L34:
	add	x0, sp, 8
	bl	hailo_read_firmware_log
	b	.L30
	.p2align 2,,3
.L36:
	mov	x0, -22
	b	.L30
.L38:
	bl	__stack_chk_fail
	.size	hailo_pcie_read_firmware_log, .-hailo_pcie_read_firmware_log
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
