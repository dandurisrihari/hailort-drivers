	.arch armv8-a
	.file	"pcie_common.c"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_encode_desc_dma_address_range
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE1
	.text
.LPFE1:
	nop
	nop
	.type	hailo_pcie_encode_desc_dma_address_range, %function
hailo_pcie_encode_desc_dma_address_range:
	nop
	nop
	ret
	.size	hailo_pcie_encode_desc_dma_address_range, .-hailo_pcie_encode_desc_dma_address_range
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_get_loading_stage_info
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE2
	.text
.LPFE2:
	nop
	nop
	.type	hailo_pcie_get_loading_stage_info, %function
hailo_pcie_get_loading_stage_info:
	nop
	nop
	ubfiz	x4, x1, 1, 32
	ubfiz	x2, x0, 3, 32
	add	x1, x4, w1, uxtw
	sub	x2, x2, w0, uxtw
	adrp	x3, .LANCHOR0
	add	x3, x3, :lo12:.LANCHOR0
	lsl	x1, x1, 3
	add	x1, x1, 40
	add	x2, x1, x2, lsl 4
	add	x0, x3, x2
	ret
	.size	hailo_pcie_get_loading_stage_info, .-hailo_pcie_get_loading_stage_info
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_read_interrupt
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE3
	.text
.LPFE3:
	nop
	nop
	.type	hailo_pcie_read_interrupt, %function
hailo_pcie_read_interrupt:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x20, x1
	mov	x1, 396
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	str	xzr, [x20]
	bl	hailo_resource_read32
	cbnz	w0, .L22
	ldp	x19, x20, [sp, 16]
	mov	w0, 0
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L22:
	mov	w19, w0
	mov	w2, w0
	mov	x1, 396
	mov	x0, x21
	bl	hailo_resource_write32
	lsr	w0, w19, 24
	str	w0, [x20]
	tst	w19, 255
	bne	.L23
	tst	w19, 65280
	bne	.L8
.L10:
	mov	w0, 1
.L25:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L8:
	mov	x0, x21
	mov	x1, 1280
	bl	hailo_resource_read32
	mov	w19, w0
	cbnz	w0, .L24
.L9:
	ldr	w0, [x20, 4]
	orr	w0, w0, w19
	str	w0, [x20, 4]
	mov	w0, 1
	b	.L25
	.p2align 2,,3
.L23:
	mov	x0, x21
	mov	x1, 1024
	bl	hailo_resource_read32
	mov	w22, w0
	cbnz	w0, .L26
.L7:
	ldr	w0, [x20, 4]
	orr	w0, w0, w22
	str	w0, [x20, 4]
	tst	w19, 65280
	beq	.L10
	b	.L8
	.p2align 2,,3
.L26:
	mov	w2, w0
	mov	x1, 1024
	mov	x0, x21
	bl	hailo_resource_write32
	b	.L7
	.p2align 2,,3
.L24:
	mov	x0, x21
	mov	w2, w19
	mov	x1, 1280
	bl	hailo_resource_write32
	b	.L9
	.size	hailo_pcie_read_interrupt, .-hailo_pcie_read_interrupt
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_write_firmware_control
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE4
	.text
.LPFE4:
	nop
	nop
	.type	hailo_pcie_write_firmware_control, %function
hailo_pcie_write_firmware_control:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x20, x1
	str	x21, [sp, 32]
	ldr	w21, [x0, 48]
	cbnz	w21, .L28
	mov	x1, 1800
	bl	hailo_resource_read32
	mov	w1, 1610612736
	cmp	w0, w1
	bne	.L29
.L32:
	ldr	w2, [x20, 16]
	add	x19, x19, 32
	mov	x0, x19
	mov	x3, x20
	add	w2, w2, 23
	mov	x1, 0
	and	x2, x2, 4294967292
	bl	hailo_resource_write_buffer
	tbnz	w0, #31, .L27
	ubfiz	x1, x21, 3, 32
	adrp	x2, .LANCHOR0
	sub	x1, x1, w21, uxtw
	add	x2, x2, :lo12:.LANCHOR0
	ldr	w3, [x20, 1524]
	mov	x0, x19
	add	x1, x2, x1, lsl 4
	cmp	w3, 1
	cset	w2, eq
	ldr	w1, [x1, 24]
	add	w2, w2, 1
	bl	hailo_resource_write32
	mov	w0, 0
.L27:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L28:
	mov	x1, 1832
	bl	hailo_resource_read32
	cmp	w0, 2097152
	beq	.L32
.L29:
	mov	w0, -19
	b	.L27
	.size	hailo_pcie_write_firmware_control, .-hailo_pcie_write_firmware_control
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_read_firmware_control
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE5
	.text
.LPFE5:
	nop
	nop
	.type	hailo_pcie_read_firmware_control, %function
hailo_pcie_read_firmware_control:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	mov	x3, x1
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	add	x20, x0, 32
	mov	x2, 20
	mov	x0, x20
	mov	x1, 1600
	bl	hailo_resource_read_buffer
	ldr	w2, [x19, 16]
	cmp	w2, 1500
	bhi	.L42
	mov	x0, x20
	add	x3, x19, 20
	uxtw	x2, w2
	mov	x1, 1620
	bl	hailo_resource_read_buffer
	mov	w0, 0
.L40:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L42:
	mov	w0, -22
	b	.L40
	.size	hailo_pcie_read_firmware_control, .-hailo_pcie_read_firmware_control
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_write_firmware_driver_shutdown
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE6
	.text
.LPFE6:
	nop
	nop
	.type	hailo_pcie_write_firmware_driver_shutdown, %function
hailo_pcie_write_firmware_driver_shutdown:
	nop
	nop
	mov	x1, x0
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	adrp	x3, .LANCHOR0
	add	x3, x3, :lo12:.LANCHOR0
	mov	x29, sp
	ldr	w4, [x1, 48]
	add	x0, x0, 32
	mov	w2, 4
	lsl	x1, x4, 3
	sub	x1, x1, x4
	add	x1, x3, x1, lsl 4
	ldr	w1, [x1, 24]
	bl	hailo_resource_write32
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	ret
	.size	hailo_pcie_write_firmware_driver_shutdown, .-hailo_pcie_write_firmware_driver_shutdown
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_write_firmware_soft_reset
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE7
	.text
.LPFE7:
	nop
	nop
	.type	hailo_pcie_write_firmware_soft_reset, %function
hailo_pcie_write_firmware_soft_reset:
	nop
	nop
	mov	x1, x0
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	adrp	x3, .LANCHOR0
	add	x3, x3, :lo12:.LANCHOR0
	mov	x29, sp
	ldr	w4, [x1, 48]
	add	x0, x0, 32
	mov	w2, 8
	lsl	x1, x4, 3
	sub	x1, x1, x4
	add	x1, x3, x1, lsl 4
	ldr	w1, [x1, 24]
	bl	hailo_resource_write32
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	ret
	.size	hailo_pcie_write_firmware_soft_reset, .-hailo_pcie_write_firmware_soft_reset
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_configure_atr_table
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE8
	.text
.LPFE8:
	nop
	nop
	.type	hailo_pcie_configure_atr_table, %function
hailo_pcie_configure_atr_table:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #48
	mrs	x3, sp_el0
	mov	w4, 23
	orr	w4, w4, w2, lsl 12
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	ldr	x5, [x3, 1424]
	str	x5, [sp, 24]
	mov	x5, 0
	mov	w3, 6
	stp	w4, wzr, [sp, 4]
	str	x1, [sp, 12]
	str	w3, [sp, 20]
	cmp	w2, 3
	bhi	.L52
	add	w1, w2, 56
	add	x3, sp, 4
	mov	x2, 20
	lsl	w1, w1, 5
	bl	hailo_resource_write_buffer
	mrs	x1, sp_el0
	ldr	x3, [sp, 24]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L53
	ldp	x29, x30, [sp, 32]
	add	sp, sp, 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L52:
#APP
// 467 "/home/sri/hailort-drivers/linux/pcie/../../common/pcie_common.c" 1
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "/home/sri/hailort-drivers/linux/pcie/../../common/pcie_common.c"; .popsection; .long 14472b - .; .short 467; .short 0; .align 2; .popsection; 14471: brk 0x800
// 0 "" 2
#NO_APP
.L53:
	bl	__stack_chk_fail
	.size	hailo_pcie_configure_atr_table, .-hailo_pcie_configure_atr_table
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE9
	.text
.LPFE9:
	nop
	nop
	.type	read_memory, %function
read_memory:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #128
	mrs	x4, sp_el0
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	stp	x19, x20, [sp, 48]
	stp	x21, x22, [sp, 64]
	mov	x22, x0
	mov	w21, 0
	stp	x23, x24, [sp, 80]
	mov	x23, x1
	mov	x24, x2
	str	x27, [sp, 112]
	mov	w27, w3
	add	x3, sp, 4
	mov	x2, 20
	ldr	x1, [x4, 1424]
	str	x1, [sp, 24]
	mov	x1, 0
	str	wzr, [sp, 20]
	mov	x1, 1792
	stp	xzr, xzr, [x3]
	bl	hailo_resource_read_buffer
	tst	x23, -4294963201
	bne	.L66
.L55:
	cmp	w27, w21
	bls	.L57
	stp	x25, x26, [sp, 96]
	add	x26, x22, 32
	mov	w25, 4096
	b	.L59
	.p2align 2,,3
.L58:
	mov	w2, 0
	mov	x0, x22
	bl	hailo_pcie_configure_atr_table
	add	w21, w21, w20
	mov	x3, x19
	uxtw	x2, w20
	mov	x0, x26
	mov	x1, 0
	bl	hailo_resource_read_buffer
	cmp	w27, w21
	bls	.L67
.L59:
	ldr	x0, [x22, 40]
	sub	w20, w27, w21
	cmp	w20, 4096
	uxtw	x3, w21
	csel	w20, w20, w25, ls
	add	x1, x3, x23
	add	x19, x24, x3
	cmp	w20, w0
	bls	.L58
#APP
// 497 "/home/sri/hailort-drivers/linux/pcie/../../common/pcie_common.c" 1
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "/home/sri/hailort-drivers/linux/pcie/../../common/pcie_common.c"; .popsection; .long 14472b - .; .short 497; .short 0; .align 2; .popsection; 14471: brk 0x800
// 0 "" 2
	.p2align 2,,3
#NO_APP
.L67:
	ldp	x25, x26, [sp, 96]
.L57:
	mov	w2, 0
	ldr	x1, [sp, 12]
	mov	x0, x22
	bl	hailo_pcie_configure_atr_table
	mrs	x0, sp_el0
	ldr	x2, [sp, 24]
	ldr	x1, [x0, 1424]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L68
	ldp	x29, x30, [sp, 32]
	ldp	x19, x20, [sp, 48]
	ldp	x21, x22, [sp, 64]
	ldp	x23, x24, [sp, 80]
	ldr	x27, [sp, 112]
	add	sp, sp, 128
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L66:
	and	x1, x23, 4294963200
	sub	w21, w1, w23
	sub	w19, w23, w1
	add	w21, w21, 4096
	ldr	x0, [x22, 40]
	cmp	w21, w27
	csel	w21, w21, w27, ls
	add	w2, w19, w21
	cmp	w2, w0
	bhi	.L69
	mov	x0, x22
	mov	w2, 0
	bl	hailo_pcie_configure_atr_table
	mov	x3, x24
	uxtw	x1, w19
	uxtw	x2, w21
	add	x0, x22, 32
	bl	hailo_resource_read_buffer
	b	.L55
.L69:
	stp	x25, x26, [sp, 96]
#APP
// 497 "/home/sri/hailort-drivers/linux/pcie/../../common/pcie_common.c" 1
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "/home/sri/hailort-drivers/linux/pcie/../../common/pcie_common.c"; .popsection; .long 14472b - .; .short 497; .short 0; .align 2; .popsection; 14471: brk 0x800
// 0 "" 2
#NO_APP
.L68:
	stp	x25, x26, [sp, 96]
	bl	__stack_chk_fail
	.size	read_memory, .-read_memory
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE10
	.text
.LPFE10:
	nop
	nop
	.type	write_memory, %function
write_memory:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #128
	mrs	x4, sp_el0
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	stp	x19, x20, [sp, 48]
	stp	x21, x22, [sp, 64]
	mov	x22, x0
	mov	w21, 0
	stp	x23, x24, [sp, 80]
	mov	x23, x1
	mov	x24, x2
	str	x27, [sp, 112]
	mov	w27, w3
	add	x3, sp, 4
	mov	x2, 20
	ldr	x1, [x4, 1424]
	str	x1, [sp, 24]
	mov	x1, 0
	str	wzr, [sp, 20]
	mov	x1, 1792
	stp	xzr, xzr, [x3]
	bl	hailo_resource_read_buffer
	tst	x23, -4294963201
	bne	.L82
.L71:
	cmp	w27, w21
	bls	.L73
	stp	x25, x26, [sp, 96]
	add	x26, x22, 32
	mov	w25, 4096
	b	.L75
	.p2align 2,,3
.L74:
	mov	w2, 0
	mov	x0, x22
	bl	hailo_pcie_configure_atr_table
	add	w21, w21, w20
	mov	x3, x19
	uxtw	x2, w20
	mov	x0, x26
	mov	x1, 0
	bl	hailo_resource_write_buffer
	cmp	w27, w21
	bls	.L83
.L75:
	ldr	x0, [x22, 40]
	sub	w20, w27, w21
	cmp	w20, 4096
	uxtw	x3, w21
	csel	w20, w20, w25, ls
	add	x1, x3, x23
	add	x19, x24, x3
	cmp	w20, w0
	bls	.L74
#APP
// 487 "/home/sri/hailort-drivers/linux/pcie/../../common/pcie_common.c" 1
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "/home/sri/hailort-drivers/linux/pcie/../../common/pcie_common.c"; .popsection; .long 14472b - .; .short 487; .short 0; .align 2; .popsection; 14471: brk 0x800
// 0 "" 2
	.p2align 2,,3
#NO_APP
.L83:
	ldp	x25, x26, [sp, 96]
.L73:
	mov	w2, 0
	ldr	x1, [sp, 12]
	mov	x0, x22
	bl	hailo_pcie_configure_atr_table
	mrs	x0, sp_el0
	ldr	x2, [sp, 24]
	ldr	x1, [x0, 1424]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L84
	ldp	x29, x30, [sp, 32]
	ldp	x19, x20, [sp, 48]
	ldp	x21, x22, [sp, 64]
	ldp	x23, x24, [sp, 80]
	ldr	x27, [sp, 112]
	add	sp, sp, 128
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L82:
	and	x1, x23, 4294963200
	sub	w21, w1, w23
	sub	w19, w23, w1
	add	w21, w21, 4096
	ldr	x0, [x22, 40]
	cmp	w21, w27
	csel	w21, w21, w27, ls
	add	w2, w19, w21
	cmp	w2, w0
	bhi	.L85
	mov	x0, x22
	mov	w2, 0
	bl	hailo_pcie_configure_atr_table
	mov	x3, x24
	uxtw	x1, w19
	uxtw	x2, w21
	add	x0, x22, 32
	bl	hailo_resource_write_buffer
	b	.L71
.L85:
	stp	x25, x26, [sp, 96]
#APP
// 487 "/home/sri/hailort-drivers/linux/pcie/../../common/pcie_common.c" 1
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "/home/sri/hailort-drivers/linux/pcie/../../common/pcie_common.c"; .popsection; .long 14472b - .; .short 487; .short 0; .align 2; .popsection; 14471: brk 0x800
// 0 "" 2
#NO_APP
.L84:
	stp	x25, x26, [sp, 96]
	bl	__stack_chk_fail
	.size	write_memory, .-write_memory
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_read_atr_table
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE11
	.text
.LPFE11:
	nop
	nop
	.type	hailo_pcie_read_atr_table, %function
hailo_pcie_read_atr_table:
	nop
	nop
	cmp	w2, 3
	bhi	.L90
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	mov	x3, x1
	add	w1, w2, 56
	mov	x29, sp
	mov	x2, 20
	lsl	w1, w1, 5
	bl	hailo_resource_read_buffer
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L90:
#APP
// 477 "/home/sri/hailort-drivers/linux/pcie/../../common/pcie_common.c" 1
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "/home/sri/hailort-drivers/linux/pcie/../../common/pcie_common.c"; .popsection; .long 14472b - .; .short 477; .short 0; .align 2; .popsection; 14471: brk 0x800
// 0 "" 2
#NO_APP
	.size	hailo_pcie_read_atr_table, .-hailo_pcie_read_atr_table
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_configure_ep_registers_for_dma_transaction
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE12
	.text
.LPFE12:
	nop
	nop
	.type	hailo_pcie_configure_ep_registers_for_dma_transaction, %function
hailo_pcie_configure_ep_registers_for_dma_transaction:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #48
	mrs	x1, sp_el0
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	adrp	x20, .LANCHOR0
	add	x20, x20, :lo12:.LANCHOR0
	ldr	w2, [x0, 48]
	ldr	x3, [x1, 1424]
	str	x3, [sp, 8]
	mov	x3, 0
	str	wzr, [sp, 4]
	lsl	x1, x2, 3
	sub	x1, x1, x2
	add	x1, x20, x1, lsl 4
	ldr	w1, [x1, 32]
	cbz	w1, .L95
	mov	x19, x0
	uxtw	x1, w1
	add	x2, sp, 4
	mov	w3, 4
	bl	read_memory
	ldr	w4, [sp, 4]
	ldr	w5, [x19, 48]
	mov	w3, 4
	orr	w4, w4, w3
	add	x2, sp, 4
	mov	x0, x19
	str	w4, [sp, 4]
	lsl	x1, x5, 3
	sub	x1, x1, x5
	add	x1, x20, x1, lsl 4
	ldr	w1, [x1, 32]
	bl	write_memory
	mrs	x0, sp_el0
	ldr	x2, [sp, 8]
	ldr	x1, [x0, 1424]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L96
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	add	sp, sp, 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L95:
#APP
// 568 "/home/sri/hailort-drivers/linux/pcie/../../common/pcie_common.c" 1
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "/home/sri/hailort-drivers/linux/pcie/../../common/pcie_common.c"; .popsection; .long 14472b - .; .short 568; .short 0; .align 2; .popsection; 14471: brk 0x800
// 0 "" 2
#NO_APP
.L96:
	bl	__stack_chk_fail
	.size	hailo_pcie_configure_ep_registers_for_dma_transaction, .-hailo_pcie_configure_ep_registers_for_dma_transaction
	.align	2
	.p2align 3,,7
	.global	hailo_trigger_firmware_boot
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE13
	.text
.LPFE13:
	nop
	nop
	.type	hailo_trigger_firmware_boot, %function
hailo_trigger_firmware_boot:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #32
	ubfiz	x3, x1, 1, 32
	adrp	x4, .LANCHOR0
	add	x1, x3, w1, uxtw
	add	x4, x4, :lo12:.LANCHOR0
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	mrs	x2, sp_el0
	ldr	w6, [x0, 48]
	mov	w7, 1
	ldr	x3, [x2, 1424]
	str	x3, [sp, 8]
	mov	x3, 0
	mov	w3, 4
	add	x2, sp, 4
	lsl	x5, x6, 3
	str	w7, [sp, 4]
	sub	x5, x5, x6
	lsl	x5, x5, 4
	add	x1, x5, x1, lsl 3
	add	x4, x4, x1
	ldr	w1, [x4, 48]
	bl	write_memory
	mrs	x0, sp_el0
	ldr	x2, [sp, 8]
	ldr	x1, [x0, 1424]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L100
	ldp	x29, x30, [sp, 16]
	add	sp, sp, 32
	hint	29 // autiasp
	ret
.L100:
	bl	__stack_chk_fail
	.size	hailo_trigger_firmware_boot, .-hailo_trigger_firmware_boot
	.align	2
	.p2align 3,,7
	.global	hailo_get_boot_status
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE14
	.text
.LPFE14:
	nop
	nop
	.type	hailo_get_boot_status, %function
hailo_get_boot_status:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #32
	mrs	x1, sp_el0
	adrp	x4, .LANCHOR0
	add	x4, x4, :lo12:.LANCHOR0
	mov	w3, 4
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	ldr	w5, [x0, 48]
	ldr	x2, [x1, 1424]
	str	x2, [sp, 8]
	mov	x2, 0
	str	wzr, [sp, 4]
	add	x2, sp, 4
	lsl	x1, x5, 3
	sub	x1, x1, x5
	add	x1, x4, x1, lsl 4
	ldr	w1, [x1, 28]
	bl	read_memory
	ldr	w0, [sp, 4]
	mrs	x1, sp_el0
	ldr	x3, [sp, 8]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L104
	ldp	x29, x30, [sp, 16]
	add	sp, sp, 32
	hint	29 // autiasp
	ret
.L104:
	bl	__stack_chk_fail
	.size	hailo_get_boot_status, .-hailo_get_boot_status
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Writing file %s\n"
	.align	3
.LC1:
	.string	"\0014Failed to write file %s\n"
	.align	3
.LC2:
	.string	"File %s written successfully\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_write_firmware_batch
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE15
	.text
.LPFE15:
	nop
	nop
	.type	hailo_pcie_write_firmware_batch, %function
hailo_pcie_write_firmware_batch:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #192
	stp	x29, x30, [sp, 96]
	add	x29, sp, 96
	stp	x21, x22, [sp, 128]
	mov	x21, x1
	uxtw	x1, w2
	stp	x19, x20, [sp, 112]
	mov	x20, x0
	add	x2, x1, w2, uxtw 1
	stp	x23, x24, [sp, 144]
	stp	x25, x26, [sp, 160]
	adrp	x25, .LANCHOR0
	add	x25, x25, :lo12:.LANCHOR0
	ldr	w3, [x21, 48]
	str	x1, [sp, 40]
	mrs	x1, sp_el0
	lsl	x0, x3, 3
	ldr	x4, [x1, 1424]
	str	x4, [sp, 88]
	mov	x4, 0
	sub	x0, x0, x3
	lsl	x0, x0, 4
	add	x2, x0, x2, lsl 3
	add	x0, x25, x2
	ldrb	w22, [x0, 56]
	ldr	x19, [x0, 40]
	cbz	w22, .L106
	sub	w22, w22, #1
	add	x0, x19, 32
	mov	w1, 32
	adrp	x26, .LC0
	adrp	x2, .LC1
	add	x26, x26, :lo12:.LC0
	add	x2, x2, :lo12:.LC1
	umaddl	x22, w22, w1, x0
	str	x2, [sp, 24]
	stp	x27, x28, [sp, 176]
	adrp	x27, .LC2
	add	x27, x27, :lo12:.LC2
	b	.L116
	.p2align 2,,3
.L133:
	ldr	w23, [x21, 48]
	add	x3, sp, 52
	add	x4, sp, 64
	mov	x1, x24
	mov	x0, x28
	mov	w5, w23
	mov	w2, 262144
	str	wzr, [sp, 52]
	stp	xzr, xzr, [sp, 64]
	str	xzr, [sp, 80]
	bl	FW_VALIDATION__validate_fw_header
	cbnz	w0, .L111
	add	x3, sp, 80
	add	x2, sp, 52
	mov	x1, x24
	mov	x0, x28
	bl	FW_VALIDATION__validate_cert_header
	cbnz	w0, .L111
	cmp	w23, 3
	beq	.L112
	mov	w5, w23
	add	x3, sp, 52
	mov	x0, x28
	add	x4, sp, 72
	mov	x1, x24
	mov	w2, 131072
	bl	FW_VALIDATION__validate_fw_header
	cbnz	w0, .L111
.L112:
	ldr	w0, [sp, 52]
	cmp	x24, x0
	bne	.L111
	ldr	w2, [x21, 48]
	mov	x0, x21
	ldr	x28, [sp, 80]
	mov	w3, 24
	lsl	x1, x2, 3
	sub	x1, x1, x2
	mov	x4, x28
	ldp	x2, x5, [sp, 64]
	lsl	x1, x1, 4
	add	x23, x25, x1
	ldr	w24, [x4], 8
	stp	x2, x4, [sp, 8]
	ldr	w1, [x25, x1]
	add	x24, x4, x24
	str	x5, [sp, 32]
	bl	write_memory
	ldr	x2, [sp, 8]
	mov	x0, x21
	ldr	w1, [x23, 4]
	add	x2, x2, 24
	ldr	w3, [x2, -4]
	bl	write_memory
	ldr	x4, [sp, 16]
	mov	x0, x21
	ldr	w1, [x23, 8]
	ldr	w3, [x28]
	mov	x2, x4
	bl	write_memory
	ldr	w1, [x23, 12]
	mov	x0, x21
	ldr	w3, [x28, 4]
	mov	x2, x24
	bl	write_memory
	ldrb	w0, [x19, 26]
	cbnz	w0, .L130
.L113:
	ldr	x0, [sp, 56]
	bl	release_firmware
.L114:
	ldr	x2, [x19], 32
	mov	x1, x27
	mov	x0, x20
	bl	_dev_notice
	cmp	x19, x22
	beq	.L131
.L116:
	ldr	x2, [x19]
	mov	x1, x26
	mov	x0, x20
	bl	_dev_notice
	str	xzr, [sp, 56]
	mov	x2, x20
	add	x0, sp, 56
	ldr	x1, [x19]
	bl	request_firmware_direct
	mov	w23, w0
	tbnz	w0, #31, .L107
	ldr	x0, [sp, 56]
	ldr	x1, [x19, 16]
	ldr	x24, [x0]
	cmp	x24, x1
	bhi	.L132
	ldrb	w1, [x19, 25]
	ldr	x28, [x0, 8]
	cbnz	w1, .L133
	ldr	w1, [x19, 8]
	mov	w3, w24
	mov	x2, x28
	mov	x0, x21
	bl	write_memory
	b	.L113
	.p2align 2,,3
.L111:
	ldr	x0, [sp, 56]
	mov	w23, -22
	bl	release_firmware
.L107:
	ldr	x1, [x19]
	ldr	x0, [sp, 24]
	bl	_printk
	ldrb	w0, [x19, 24]
	cbz	w0, .L114
	ldp	x27, x28, [sp, 176]
	b	.L105
	.p2align 2,,3
.L130:
	ldr	w1, [x21, 48]
	mov	x0, x21
	ldr	x24, [sp, 32]
	lsl	x23, x1, 3
	sub	x23, x23, x1
	add	x2, x24, 24
	ldr	w3, [x24, 20]
	add	x23, x25, x23, lsl 4
	ldr	w1, [x23, 16]
	bl	write_memory
	ldr	w1, [x23, 20]
	mov	x2, x24
	mov	x0, x21
	mov	w3, 24
	bl	write_memory
	b	.L113
	.p2align 2,,3
.L131:
	ldp	x27, x28, [sp, 176]
	ldr	w3, [x21, 48]
.L106:
	ldr	x0, [sp, 40]
	lsl	x2, x3, 3
	sub	x2, x2, x3
	mov	w4, 1
	mov	w23, 0
	mov	w3, 4
	add	x1, x0, x0, lsl 1
	lsl	x2, x2, 4
	mov	x0, x21
	str	w4, [sp, 80]
	add	x1, x2, x1, lsl 3
	add	x2, sp, 80
	add	x25, x25, x1
	ldr	w1, [x25, 48]
	bl	write_memory
.L105:
	mrs	x0, sp_el0
	ldr	x2, [sp, 88]
	ldr	x1, [x0, 1424]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L134
	ldp	x29, x30, [sp, 96]
	mov	w0, w23
	ldp	x19, x20, [sp, 112]
	ldp	x21, x22, [sp, 128]
	ldp	x23, x24, [sp, 144]
	ldp	x25, x26, [sp, 160]
	add	sp, sp, 192
	hint	29 // autiasp
	ret
.L132:
	mov	w23, -27
	bl	release_firmware
	b	.L107
.L134:
	stp	x27, x28, [sp, 176]
	bl	__stack_chk_fail
	.size	hailo_pcie_write_firmware_batch, .-hailo_pcie_write_firmware_batch
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_is_firmware_loaded
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE16
	.text
.LPFE16:
	nop
	nop
	.type	hailo_pcie_is_firmware_loaded, %function
hailo_pcie_is_firmware_loaded:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	w1, [x0, 48]
	cbnz	w1, .L136
	mov	x1, 1800
	bl	hailo_resource_read32
	mov	w1, 1610612736
	cmp	w0, w1
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	cset	w0, eq
	ret
	.p2align 2,,3
.L136:
	mov	x1, 1832
	bl	hailo_resource_read32
	cmp	w0, 2097152
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	cset	w0, eq
	ret
	.size	hailo_pcie_is_firmware_loaded, .-hailo_pcie_is_firmware_loaded
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_wait_for_firmware
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE17
	.text
.LPFE17:
	nop
	nop
	.type	hailo_pcie_wait_for_firmware, %function
hailo_pcie_wait_for_firmware:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x19, 100
	str	x21, [sp, 32]
	mov	w21, 1610612736
	b	.L142
	.p2align 2,,3
.L151:
	bl	hailo_resource_read32
	cmp	w0, w21
	beq	.L141
.L144:
	mov	w0, 50
	bl	msleep
	subs	x19, x19, #1
	beq	.L150
.L142:
	ldr	w2, [x20, 48]
	mov	x0, x20
	mov	x1, 1800
	cbz	w2, .L151
	mov	x1, 1832
	bl	hailo_resource_read32
	cmp	w0, 2097152
	bne	.L144
.L141:
	ldp	x19, x20, [sp, 16]
	mov	w0, 1
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
.L150:
	ldp	x19, x20, [sp, 16]
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.size	hailo_pcie_wait_for_firmware, .-hailo_pcie_wait_for_firmware
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_update_channel_interrupts_mask
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE18
	.text
.LPFE18:
	nop
	nop
	.type	hailo_pcie_update_channel_interrupts_mask, %function
hailo_pcie_update_channel_interrupts_mask:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	w20, w1
	mov	x19, x0
	mov	x1, 392
	bl	hailo_resource_read32
	mov	x3, 0
	and	w2, w0, -65536
	mov	x1, 1
	mov	w0, 1
	.p2align 3,,7
.L154:
	lsr	x6, x3, 1
	lsl	w4, w3, 3
	and	w6, w6, 8
	lsl	w5, w0, w3
	add	w4, w6, w4, asr 5
	tst	w5, w20
	add	x3, x3, 1
	beq	.L153
	lsl	x4, x1, x4
	orr	w2, w2, w4
.L153:
	cmp	x3, 32
	bne	.L154
	mov	x0, x19
	mov	x1, 392
	bl	hailo_resource_write32
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.size	hailo_pcie_update_channel_interrupts_mask, .-hailo_pcie_update_channel_interrupts_mask
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_enable_interrupts
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE19
	.text
.LPFE19:
	nop
	nop
	.type	hailo_pcie_enable_interrupts, %function
hailo_pcie_enable_interrupts:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	mov	x1, 392
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	bl	hailo_resource_read32
	mov	w2, -1
	mov	w20, w0
	mov	x1, 396
	mov	x0, x19
	bl	hailo_resource_write32
	mov	x0, x19
	mov	w2, -1
	mov	x1, 1280
	bl	hailo_resource_write32
	mov	x0, x19
	mov	w2, -1
	mov	x1, 1024
	bl	hailo_resource_write32
	orr	w2, w20, -16777216
	mov	x0, x19
	mov	x1, 392
	bl	hailo_resource_write32
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.size	hailo_pcie_enable_interrupts, .-hailo_pcie_enable_interrupts
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_disable_interrupts
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE20
	.text
.LPFE20:
	nop
	nop
	.type	hailo_pcie_disable_interrupts, %function
hailo_pcie_disable_interrupts:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	mov	w2, 0
	mov	x29, sp
	mov	x1, 392
	bl	hailo_resource_write32
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	ret
	.size	hailo_pcie_disable_interrupts, .-hailo_pcie_disable_interrupts
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_memory_transfer
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE21
	.text
.LPFE21:
	nop
	nop
	.type	hailo_pcie_memory_transfer, %function
hailo_pcie_memory_transfer:
	nop
	nop
	ldr	x3, [x1, 16]
	cmp	x3, 4096
	bhi	.L174
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	mov	x2, x1
	mov	x29, sp
	ldr	w4, [x1, 4]
	cmp	w4, 512
	beq	.L186
	mov	x5, x0
	bls	.L188
	cmp	w4, 514
	beq	.L169
	add	x0, x0, 32
	cmp	w4, 516
	bne	.L187
.L186:
	bl	hailo_resource_transfer
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L188:
	cbz	w4, .L168
	cmp	w4, 256
	bne	.L187
.L169:
	mov	x1, x2
	add	x0, x5, 16
	bl	hailo_resource_transfer
.L164:
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L168:
	ldr	w1, [x1]
	cbz	w1, .L171
	cmp	w1, 1
	bne	.L187
	ldr	x1, [x2, 8]
	add	x2, x2, 24
	bl	write_memory
	mov	w0, 0
	b	.L164
	.p2align 2,,3
.L187:
	mov	w0, -22
	b	.L164
	.p2align 2,,3
.L171:
	ldr	x1, [x2, 8]
	add	x2, x2, 24
	bl	read_memory
	mov	w0, 0
	b	.L164
	.p2align 2,,3
.L174:
	mov	w0, -22
	ret
	.size	hailo_pcie_memory_transfer, .-hailo_pcie_memory_transfer
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_is_device_connected
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE22
	.text
.LPFE22:
	nop
	nop
	.type	hailo_pcie_is_device_connected, %function
hailo_pcie_is_device_connected:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	mov	x1, 152
	mov	x29, sp
	bl	hailo_resource_read16
	mov	w1, 7776
	cmp	w1, w0, uxth
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	cset	w0, eq
	ret
	.size	hailo_pcie_is_device_connected, .-hailo_pcie_is_device_connected
	.align	2
	.p2align 3,,7
	.global	hailo_set_device_type
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE23
	.text
.LPFE23:
	nop
	nop
	.type	hailo_set_device_type, %function
hailo_set_device_type:
	nop
	nop
	ldr	w1, [x0, 48]
	mov	x2, x0
	cmp	w1, 3
	beq	.L195
	bhi	.L193
	and	w1, w1, -3
	mov	w0, -22
	cmp	w1, 1
	bne	.L192
.L191:
	ret
	.p2align 2,,3
.L193:
	mov	w0, -22
	cmp	w1, 4
	bne	.L191
	mov	w1, 0
.L192:
	mov	w0, 0
	str	w1, [x2, 52]
	ret
	.p2align 2,,3
.L195:
	mov	w1, 1
	b	.L192
	.size	hailo_set_device_type, .-hailo_set_device_type
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_soc_write_request
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE24
	.text
.LPFE24:
	nop
	nop
	.type	hailo_pcie_soc_write_request, %function
hailo_pcie_soc_write_request:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	mov	x4, x0
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	add	x20, x0, 32
	mov	x3, x1
	ldr	w19, [x4, 48]
	mov	x0, x20
	mov	x2, 20
	mov	x1, 0
	bl	hailo_resource_write_buffer
	ubfiz	x1, x19, 3, 32
	adrp	x3, .LANCHOR0
	sub	x1, x1, w19, uxtw
	add	x3, x3, :lo12:.LANCHOR0
	mov	x0, x20
	mov	w2, 8
	add	x1, x3, x1, lsl 4
	ldr	w1, [x1, 24]
	bl	hailo_resource_write32
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.size	hailo_pcie_soc_write_request, .-hailo_pcie_soc_write_request
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_soc_read_response
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_encode_desc_dma_address_range
	.align	3
	.8byte	.LPFE25
	.text
.LPFE25:
	nop
	nop
	.type	hailo_pcie_soc_read_response, %function
hailo_pcie_soc_read_response:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	mov	x3, x1
	mov	x29, sp
	add	x0, x0, 32
	mov	x2, 24
	mov	x1, 0
	bl	hailo_resource_read_buffer
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	ret
	.size	hailo_pcie_soc_read_response, .-hailo_pcie_soc_read_response
	.global	hailo_pcie_vdma_hw
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"hailo/hailo15l_fw.bin"
	.align	3
.LC4:
	.string	"hailo/hailo15_fw.bin"
	.align	3
.LC5:
	.string	"hailo/hailo8_fw.bin"
	.align	3
.LC6:
	.string	"hailo/hailo8_board_cfg.bin"
	.align	3
.LC7:
	.string	"hailo/hailo8_fw_cfg.bin"
	.align	3
.LC8:
	.string	"hailo/hailo10h/u-boot-spl.bin"
	.align	3
.LC9:
	.string	"hailo/hailo10h/u-boot-tfa.itb"
	.align	3
.LC10:
	.string	"hailo/hailo10h/fitImage"
	.align	3
.LC11:
	.string	"hailo/hailo10h/image-fs"
	.align	3
.LC12:
	.string	"hailo/hailo10h/customer_certificate.bin"
	.align	3
.LC13:
	.string	"hailo/hailo10h/u-boot.dtb.signed"
	.align	3
.LC14:
	.string	"hailo/hailo10h/scu_fw.bin"
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	compat, %object
	.size	compat, 560
compat:
	.word	917552
	.word	393216
	.word	917576
	.word	918416
	.word	786432
	.word	655360
	.word	5764
	.word	917504
	.zero	4
	.zero	4
	.xword	hailo8_files_stg1
	.word	919936
	.word	5000
	.byte	3
	.zero	7
	.zero	48
	.zero	112
	.word	557056
	.word	131072
	.word	557080
	.word	558760
	.word	393216
	.word	786432
	.word	5964
	.word	524288
	.zero	4
	.zero	4
	.xword	hailo15l_files_stg1
	.word	560280
	.word	5000
	.byte	1
	.zero	7
	.zero	48
	.word	557056
	.word	131072
	.word	557080
	.word	558760
	.word	0
	.word	0
	.word	5972
	.word	524288
	.word	2099676
	.zero	4
	.xword	hailo10h_files_stg1
	.word	560280
	.word	5000
	.byte	3
	.zero	7
	.xword	hailo10h_files_stg2
	.word	-2080374784
	.word	40000
	.byte	4
	.zero	7
	.xword	hailo10h_files_stg2_linux_in_emmc
	.word	-2080374784
	.word	5000
	.byte	2
	.zero	7
	.word	557056
	.word	131072
	.word	557080
	.word	558760
	.word	393216
	.word	786432
	.word	5972
	.word	524288
	.zero	4
	.zero	4
	.xword	hailo10h_legacy_files_stg1
	.word	560280
	.word	5000
	.byte	1
	.zero	7
	.zero	48
	.type	hailo15l_files_stg1, %object
	.size	hailo15l_files_stg1, 64
hailo15l_files_stg1:
	.xword	.LC3
	.word	131072
	.zero	4
	.xword	1048576
	.byte	1
	.byte	1
	.byte	1
	.zero	5
	.xword	0
	.word	0
	.zero	4
	.xword	0
	.byte	0
	.byte	0
	.byte	0
	.zero	5
	.type	hailo10h_legacy_files_stg1, %object
	.size	hailo10h_legacy_files_stg1, 64
hailo10h_legacy_files_stg1:
	.xword	.LC4
	.word	131072
	.zero	4
	.xword	1048576
	.byte	1
	.byte	1
	.byte	1
	.zero	5
	.xword	0
	.word	0
	.zero	4
	.xword	0
	.byte	0
	.byte	0
	.byte	0
	.zero	5
	.type	hailo8_files_stg1, %object
	.size	hailo8_files_stg1, 128
hailo8_files_stg1:
	.xword	.LC5
	.word	131072
	.zero	4
	.xword	327680
	.byte	1
	.byte	1
	.byte	1
	.zero	5
	.xword	.LC6
	.word	1610616832
	.zero	4
	.xword	1280
	.byte	0
	.byte	0
	.byte	0
	.zero	5
	.xword	.LC7
	.word	1610618112
	.zero	4
	.xword	1280
	.byte	0
	.byte	0
	.byte	0
	.zero	5
	.xword	0
	.word	0
	.zero	4
	.xword	0
	.byte	0
	.byte	0
	.byte	0
	.zero	5
	.type	hailo10h_files_stg2_linux_in_emmc, %object
	.size	hailo10h_files_stg2_linux_in_emmc, 96
hailo10h_files_stg2_linux_in_emmc:
	.xword	.LC8
	.word	-2063597568
	.zero	4
	.xword	16777216
	.byte	1
	.byte	0
	.byte	0
	.zero	5
	.xword	.LC9
	.word	-2046820352
	.zero	4
	.xword	16777216
	.byte	1
	.byte	0
	.byte	0
	.zero	5
	.xword	0
	.word	0
	.zero	4
	.xword	0
	.byte	0
	.byte	0
	.byte	0
	.zero	5
	.type	hailo10h_files_stg2, %object
	.size	hailo10h_files_stg2, 128
hailo10h_files_stg2:
	.xword	.LC8
	.word	-2063597568
	.zero	4
	.xword	16777216
	.byte	1
	.byte	0
	.byte	0
	.zero	5
	.xword	.LC9
	.word	-2046820352
	.zero	4
	.xword	16777216
	.byte	1
	.byte	0
	.byte	0
	.zero	5
	.xword	.LC10
	.word	-2030043136
	.zero	4
	.xword	16777216
	.byte	1
	.byte	0
	.byte	0
	.zero	5
	.xword	.LC11
	.word	-2013265920
	.zero	4
	.xword	536870912
	.byte	1
	.byte	0
	.byte	0
	.zero	5
	.type	hailo10h_files_stg1, %object
	.size	hailo10h_files_stg1, 128
hailo10h_files_stg1:
	.xword	.LC12
	.word	655360
	.zero	4
	.xword	32772
	.byte	1
	.byte	0
	.byte	0
	.zero	5
	.xword	.LC13
	.word	688132
	.zero	4
	.xword	131072
	.byte	1
	.byte	0
	.byte	0
	.zero	5
	.xword	.LC14
	.word	131072
	.zero	4
	.xword	262144
	.byte	1
	.byte	1
	.byte	0
	.zero	5
	.xword	0
	.word	0
	.zero	4
	.xword	0
	.byte	0
	.byte	0
	.byte	0
	.zero	5
	.data
	.align	3
	.type	hailo_pcie_vdma_hw, %object
	.size	hailo_pcie_vdma_hw, 40
hailo_pcie_vdma_hw:
	.xword	hailo_pcie_encode_desc_dma_address_range
	.byte	0
	.zero	7
	.xword	32
	.xword	16
	.word	65535
	.zero	4
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
