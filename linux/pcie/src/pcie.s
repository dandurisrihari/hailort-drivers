	.arch armv8-a
	.file	"pcie.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"/home/sri/hailort-drivers/linux/pcie/src/pcie.c"
	.align	3
.LC1:
	.string	"\0016FUNC_ENTRY: Entering function hailo_bar_iomap at %s:%d\n"
	.align	3
.LC2:
	.string	"Probing: Invalid PCIe BAR %d"
	.align	3
.LC3:
	.string	"Probing: mapped bar %d - %p %zu\n"
	.text
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,hailo_bar_iomap
	.align	3
	.8byte	.LPFE1
	.text
.LPFE1:
	nop
	nop
	.type	hailo_bar_iomap, %function
hailo_bar_iomap:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x21, [sp, 32]
	mov	w21, w1
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x20, x2
	adrp	x0, .LC1
	mov	w2, 1033
	add	x0, x0, :lo12:.LC1
	bl	_printk
	sbfiz	x0, x21, 6, 32
	add	x0, x19, x0
	ldr	x2, [x0, 904]
	cbz	x2, .L2
	ldr	x0, [x0, 896]
	add	x2, x2, 1
	sub	x2, x2, x0
.L2:
	str	x2, [x20, 8]
	mov	w1, w21
	mov	x0, x19
	bl	pci_iomap
	mov	x3, x0
	ldr	x4, [x20, 8]
	str	x3, [x20]
	cmp	x0, 0
	mov	w2, w21
	add	x0, x19, 200
	ccmp	x4, 0, 4, ne
	beq	.L10
	adrp	x1, .LC3
	add	x1, x1, :lo12:.LC3
	bl	_dev_notice
	mov	w0, 0
.L1:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L10:
	adrp	x1, .LC2
	add	x1, x1, :lo12:.LC2
	bl	_dev_err
	mov	w0, -22
	b	.L1
	.size	hailo_bar_iomap, .-hailo_bar_iomap
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"\0016FUNC_ENTRY: Entering function update_channel_interrupts at %s:%d\n"
	.align	3
.LC5:
	.string	"Invalid engine index %zu"
	.align	3
.LC6:
	.string	"\0013"
	.text
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,hailo_bar_iomap
	.align	3
	.8byte	.LPFE2
	.text
.LPFE2:
	nop
	nop
	.type	update_channel_interrupts, %function
update_channel_interrupts:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x19, x1
	adrp	x0, .LC4
	adrp	x1, .LC0
	add	x0, x0, :lo12:.LC4
	add	x1, x1, :lo12:.LC0
	str	x21, [sp, 32]
	mov	w21, w2
	mov	w2, 1135
	bl	_printk
	ldr	x0, [x20, 16]
	ldr	x0, [x0, 120]
	ldr	x1, [x0, 4872]
	cmp	x1, x19
	bhi	.L12
	adrp	x1, o_dbg
	ldr	w1, [x1, #:lo12:o_dbg]
	cmp	w1, 2
	bgt	.L15
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L12:
	mov	w1, w21
	add	x0, x0, 48
	bl	hailo_pcie_update_channel_interrupts_mask
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L15:
	ldr	x1, [x0, 16]
	mov	x3, x19
	adrp	x2, .LC5
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC5
	add	x1, x1, 200
	add	x0, x0, :lo12:.LC6
	bl	_dev_printk
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.size	update_channel_interrupts, .-update_channel_interrupts
	.section	.rodata.str1.8
	.align	3
.LC7:
	.string	"\0016FUNC_ENTRY: Entering function pcie_vdme_release_boot_resources at %s:%d\n"
	.align	3
.LC8:
	.string	"\0016FUNC_ENTRY: Entering function pcie_vdma_release_noncontinuous_memory at %s:%d\n"
	.align	3
.LC9:
	.string	"\0016DMA_INSTRUMENT: About to call dma_unmap_sg from function %s at %s:%d\n"
	.align	3
.LC10:
	.string	"\0016DMA_STACK_START: Stack trace for dma_unmap_sg called from %s\n"
	.align	3
.LC11:
	.string	"\0016DMA_STACK_END: End of stack trace for dma_unmap_sg\n"
	.text
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,hailo_bar_iomap
	.align	3
	.8byte	.LPFE3
	.text
.LPFE3:
	nop
	nop
	.type	pcie_vdme_release_boot_resources, %function
pcie_vdme_release_boot_resources:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -96]!
	mov	x29, sp
	stp	x25, x26, [sp, 64]
	mov	x25, x2
	adrp	x26, .LANCHOR0
	add	x26, x26, :lo12:.LANCHOR0
	stp	x19, x20, [sp, 16]
	add	x19, x25, 144
	add	x25, x25, 1616
	str	x27, [sp, 80]
	adrp	x27, .LC8
	add	x27, x27, :lo12:.LC8
	stp	x23, x24, [sp, 48]
	adrp	x23, .LC0
	add	x23, x23, :lo12:.LC0
	mov	x24, x0
	add	x20, x1, 24
	adrp	x0, .LC7
	mov	x1, x23
	add	x0, x0, :lo12:.LC7
	mov	w2, 629
	stp	x21, x22, [sp, 32]
	bl	_printk
	.p2align 3,,7
.L20:
	sub	x1, x19, #144
	ldr	x0, [x19, -120]
	cbz	x0, .L17
	ldr	x0, [x24, 16]
	add	x0, x0, 200
	bl	hailo_desc_list_release
.L17:
	ldr	x2, [x19, -48]
	sub	x1, x19, #72
	cbz	x2, .L18
	ldr	x0, [x24, 16]
	add	x0, x0, 200
	bl	hailo_desc_list_release
.L18:
	ldr	x0, [x20]
	bl	hailo_vdma_stop_channel
	ldr	x0, [x20, 8]
	mov	x1, 11848
	add	x20, x20, x1
	bl	hailo_vdma_stop_channel
	ldr	x21, [x19, 24]
	mov	x1, x23
	mov	x0, x27
	mov	w2, 522
	cbz	x21, .L19
	ldr	x22, [x24, 16]
	bl	_printk
	mov	x2, x23
	mov	w3, 523
	mov	x1, x26
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_printk
	mov	x1, x26
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	bl	_printk
	add	x22, x22, 200
	bl	dump_stack
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	bl	_printk
	ldr	x1, [x19]
	mov	x4, 0
	ldr	w2, [x19, 12]
	mov	w3, 1
	mov	x0, x22
	bl	dma_unmap_sg_attrs
	mov	x0, x19
	bl	sg_free_table
	mov	x0, x21
	bl	vfree
.L19:
	add	x19, x19, 184
	cmp	x19, x25
	bne	.L20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	hint	29 // autiasp
	ret
	.size	pcie_vdme_release_boot_resources, .-pcie_vdme_release_boot_resources
	.section	.rodata.str1.8
	.align	3
.LC12:
	.string	"\0016FUNC_ENTRY: Entering function hailo_pcie_module_init at %s:%d\n"
	.align	3
.LC13:
	.string	"4.20.0"
	.align	3
.LC14:
	.string	"\0015hailo: Init module. driver version %s\n"
	.align	3
.LC15:
	.string	"\0016FUNC_ENTRY: Entering function hailo_pcie_register_chrdev at %s:%d\n"
	.align	3
.LC16:
	.string	"hailo"
	.align	3
.LC17:
	.string	"hailo_chardev"
	.align	3
.LC18:
	.string	"\0013hailo: Init Error, failed to call register_chrdev.\n"
	.align	3
.LC19:
	.string	"hailo_pci"
	.align	3
.LC20:
	.string	"\0013hailo: Init Error, failed to call pci_register_driver.\n"
	.align	3
.LC21:
	.string	"\0016FUNC_ENTRY: Entering function hailo_pcie_unregister_chrdev at %s:%d\n"
	.section	.init.text,"ax",@progbits
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,hailo_bar_iomap
	.align	3
	.8byte	.LPFE4
	.section	.init.text
.LPFE4:
	nop
	nop
	.type	hailo_pcie_module_init, %function
hailo_pcie_module_init:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -64]!
	mov	w2, 1562
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	adrp	x19, .LC0
	add	x19, x19, :lo12:.LC0
	mov	x1, x19
	adrp	x0, .LC12
	add	x0, x0, :lo12:.LC12
	stp	x21, x22, [sp, 32]
	adrp	x21, .LANCHOR1
	stp	x23, x24, [sp, 48]
	bl	_printk
	adrp	x1, .LC13
	adrp	x0, .LC14
	add	x1, x1, :lo12:.LC13
	add	x0, x0, :lo12:.LC14
	bl	_printk
	mov	x1, x19
	mov	w2, 1543
	add	x21, x21, :lo12:.LANCHOR1
	adrp	x0, .LC15
	adrp	x22, .LC16
	add	x0, x0, :lo12:.LC15
	add	x22, x22, :lo12:.LC16
	bl	_printk
	mov	x4, x21
	mov	x3, x22
	adrp	x23, .LANCHOR2
	add	x24, x23, :lo12:.LANCHOR2
	mov	w2, 256
	mov	w1, 0
	mov	w0, 0
	bl	__register_chrdev
	mov	w20, w0
	adrp	x0, .LC17
	add	x0, x0, :lo12:.LC17
	bl	class_create
	str	x0, [x23, #:lo12:.LANCHOR2]
	str	w20, [x24, 8]
	tbnz	w20, #31, .L39
	add	x0, x21, 264
	adrp	x2, .LC19
	adrp	x1, __this_module
	add	x2, x2, :lo12:.LC19
	add	x1, x1, :lo12:__this_module
	bl	__pci_register_driver
	mov	w20, w0
	cbnz	w0, .L40
	ldp	x21, x22, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L39:
	adrp	x0, .LC18
	add	x0, x0, :lo12:.LC18
	bl	_printk
	ldr	w20, [x24, 8]
	ldp	x21, x22, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L40:
	adrp	x0, .LC20
	add	x0, x0, :lo12:.LC20
	bl	_printk
	ldr	x0, [x23, #:lo12:.LANCHOR2]
	bl	class_destroy
	ldr	w21, [x24, 8]
	mov	x1, x19
	mov	w2, 1555
	adrp	x0, .LC21
	add	x0, x0, :lo12:.LC21
	bl	_printk
	ldr	x0, [x23, #:lo12:.LANCHOR2]
	bl	class_destroy
	mov	x3, x22
	mov	w0, w21
	mov	w2, 256
	mov	w1, 0
	bl	__unregister_chrdev
	ldp	x21, x22, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	hint	29 // autiasp
	ret
	.size	hailo_pcie_module_init, .-hailo_pcie_module_init
	.global	init_module
	.set	init_module,hailo_pcie_module_init
	.section	.rodata.str1.8
	.align	3
.LC22:
	.string	"\0016FUNC_ENTRY: Entering function hailo_pcie_module_exit at %s:%d\n"
	.align	3
.LC23:
	.string	"\0015hailo: Exit module.\n"
	.align	3
.LC24:
	.string	"\0015hailo: Hailo PCIe driver unloaded.\n"
	.section	.exit.text,"ax",@progbits
	.align	2
	.p2align 3,,7
	.type	hailo_pcie_module_exit, %function
hailo_pcie_module_exit:
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	mov	w2, 1587
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	adrp	x19, .LC0
	add	x19, x19, :lo12:.LC0
	mov	x1, x19
	adrp	x0, .LC22
	add	x0, x0, :lo12:.LC22
	bl	_printk
	adrp	x0, .LC23
	add	x0, x0, :lo12:.LC23
	bl	_printk
	adrp	x20, .LANCHOR2
	adrp	x0, .LANCHOR1
	add	x0, x0, :lo12:.LANCHOR1
	add	x0, x0, 264
	bl	pci_unregister_driver
	add	x3, x20, :lo12:.LANCHOR2
	mov	x1, x19
	mov	w2, 1555
	adrp	x0, .LC21
	add	x0, x0, :lo12:.LC21
	ldr	w19, [x3, 8]
	bl	_printk
	ldr	x0, [x20, #:lo12:.LANCHOR2]
	bl	class_destroy
	adrp	x3, .LC16
	add	x3, x3, :lo12:.LC16
	mov	w2, 256
	mov	w1, 0
	mov	w0, w19
	bl	__unregister_chrdev
	adrp	x0, .LC24
	add	x0, x0, :lo12:.LC24
	bl	_printk
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.size	hailo_pcie_module_exit, .-hailo_pcie_module_exit
	.global	cleanup_module
	.set	cleanup_module,hailo_pcie_module_exit
	.section	.rodata.str1.8
	.align	3
.LC25:
	.string	"\0016FUNC_ENTRY: Entering function hailo_pci_reset_prepare at %s:%d\n"
	.align	3
.LC26:
	.string	"Reset preparation for PCI device \n"
	.align	3
.LC27:
	.string	"\0016FUNC_ENTRY: Entering function driver_down at %s:%d\n"
	.align	3
.LC28:
	.string	"Error while trying to call FW to close vdma channels (errno %d)\n"
	.text
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,hailo_bar_iomap
	.align	3
	.8byte	.LPFE5
	.text
.LPFE5:
	nop
	nop
	.type	hailo_pci_reset_prepare, %function
hailo_pci_reset_prepare:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	mov	w2, 1465
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	add	x19, x0, 200
	adrp	x20, .LC0
	add	x20, x20, :lo12:.LC0
	adrp	x0, .LC25
	mov	x1, x20
	add	x0, x0, :lo12:.LC25
	stp	x21, x22, [sp, 32]
	bl	_printk
	adrp	x1, .LC26
	ldr	x21, [x19, 120]
	mov	x0, x19
	add	x1, x1, :lo12:.LC26
	bl	_dev_err
	cbz	x21, .L43
	mov	x0, 4824
	add	x22, x21, x0
	mov	x0, x22
	bl	down
	ldr	x0, [x21, 4920]
	cbz	x0, .L46
	mov	x1, x20
	adrp	x0, .LC27
	mov	w2, 1402
	add	x0, x0, :lo12:.LC27
	bl	_printk
	ldr	w0, [x21, 100]
	cbnz	w0, .L47
	mov	x0, x21
	bl	hailo_nnc_driver_down
.L48:
	tbz	w0, #31, .L46
	mov	w2, w0
	adrp	x1, .LC28
	mov	x0, x19
	add	x1, x1, :lo12:.LC28
	bl	_dev_err
	.p2align 3,,7
.L46:
	mov	x0, x22
	bl	up
.L43:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L47:
	mov	x0, x21
	bl	hailo_soc_driver_down
	b	.L48
	.size	hailo_pci_reset_prepare, .-hailo_pci_reset_prepare
	.section	.rodata.str1.8
	.align	3
.LC29:
	.string	"\0016FUNC_ENTRY: Entering function power_mode_enabled at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	power_mode_enabled
	.section	__patchable_function_entries,"awo",@progbits,hailo_bar_iomap
	.align	3
	.8byte	.LPFE6
	.text
.LPFE6:
	nop
	nop
	.type	power_mode_enabled, %function
power_mode_enabled:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	mov	w2, 82
	mov	x29, sp
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
	adrp	x0, .LC29
	add	x0, x0, :lo12:.LC29
	bl	_printk
	adrp	x0, .LANCHOR1+544
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	ldrb	w0, [x0, #:lo12:.LANCHOR1+544]
	ret
	.size	power_mode_enabled, .-power_mode_enabled
	.section	.rodata.str1.8
	.align	3
.LC30:
	.string	"\0016FUNC_ENTRY: Entering function hailo_pcie_get_board_index at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_get_board_index
	.section	__patchable_function_entries,"awo",@progbits,hailo_bar_iomap
	.align	3
	.8byte	.LPFE7
	.text
.LPFE7:
	nop
	nop
	.type	hailo_pcie_get_board_index, %function
hailo_pcie_get_board_index:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	adrp	x1, .LC0
	mov	x29, sp
	add	x1, x1, :lo12:.LC0
	str	x21, [sp, 32]
	adrp	x21, .LANCHOR1
	add	x21, x21, :lo12:.LANCHOR1
	mov	w2, 147
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	adrp	x0, .LC30
	add	x0, x0, :lo12:.LC30
	bl	_printk
	add	x0, x21, 552
	bl	down
	ldr	x19, [x21, 576]
	add	x0, x21, 576
	cmp	x19, x0
	bne	.L61
	b	.L62
	.p2align 2,,3
.L58:
	ldr	x19, [x19]
	cmp	x19, x0
	beq	.L62
.L61:
	ldr	w1, [x19, 24]
	cmp	w1, w20
	bne	.L58
#APP
// 232 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h" 1
	.if 1 == 1
661:
	b	.L59
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word alt_cb_patch_nops- .
 .hword (1 << 15) | (37)
 .byte 662b-661b
 .byte 664f-663f
.popsection
663:
	664:
	.endif

// 0 "" 2
#NO_APP
	mov	w0, 1
	add	x1, x19, 28
#APP
// 27 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h" 1
	.arch_extension lse
	stadd	w0, [x1]

// 0 "" 2
#NO_APP
	add	x0, x21, 552
	bl	up
	ldr	x21, [sp, 32]
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L62:
	add	x0, x21, 552
	mov	x19, 0
	bl	up
	ldr	x21, [sp, 32]
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L59:
	add	x2, x19, 28
#APP
// 95 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h" 1
	// atomic_add
	prfm	pstl1strm, [x2]
1:	ldxr	w0, [x2]
	add	w0, w0, 1
	stxr	w1, w0, [x2]
	cbnz	w1, 1b

// 0 "" 2
#NO_APP
	add	x0, x21, 552
	bl	up
	ldr	x21, [sp, 32]
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.size	hailo_pcie_get_board_index, .-hailo_pcie_get_board_index
	.section	.rodata.str1.8
	.align	3
.LC31:
	.string	"\0016FUNC_ENTRY: Entering function hailo_pcie_soft_reset at %s:%d\n"
	.align	3
.LC32:
	.string	"\0016FUNC_ENTRY: Entering function wait_for_firmware_completion at %s:%d\n"
	.align	3
.LC33:
	.string	"\0014hailo reset firmware, timeout waiting for shutdown response (timeout_ms=%d)\n"
	.align	3
.LC34:
	.string	"\0015hailo_driver_down finished\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_soft_reset
	.section	__patchable_function_entries,"awo",@progbits,hailo_bar_iomap
	.align	3
	.8byte	.LPFE8
	.text
.LPFE8:
	nop
	nop
	.type	hailo_pcie_soft_reset, %function
hailo_pcie_soft_reset:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	adrp	x3, .LC31
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	adrp	x20, .LC0
	add	x20, x20, :lo12:.LC0
	mov	x19, x1
	mov	x1, x20
	mov	w2, 887
	str	x21, [sp, 32]
	mov	x21, x0
	add	x0, x3, :lo12:.LC31
	bl	_printk
	mov	x0, x21
	bl	hailo_pcie_write_firmware_soft_reset
	str	wzr, [x19]
	mov	w2, 320
	mov	x1, x20
	adrp	x0, .LC32
	add	x0, x0, :lo12:.LC32
	bl	_printk
	mov	x0, x19
	mov	x1, 313
	bl	wait_for_completion_timeout
	cbz	x0, .L69
	mov	w0, 10
	bl	msleep
	adrp	x0, .LC34
	add	x0, x0, :lo12:.LC34
	bl	_printk
	mov	w0, 0
.L65:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L69:
	adrp	x0, .LC33
	mov	w1, 5000
	add	x0, x0, :lo12:.LC33
	bl	_printk
	mov	w0, -110
	b	.L65
	.size	hailo_pcie_soft_reset, .-hailo_pcie_soft_reset
	.section	.rodata.str1.8
	.align	3
.LC35:
	.string	"\0016FUNC_ENTRY: Entering function hailo_enable_interrupts at %s:%d\n"
	.align	3
.LC36:
	.string	"Failed enabling interrupts (already enabled)\n"
	.align	3
.LC37:
	.string	"\0012"
	.align	3
.LC38:
	.string	"Failed to enable MSI %d\n"
	.align	3
.LC39:
	.string	"Enabled MSI interrupt\n"
	.align	3
.LC40:
	.string	"\0016"
	.align	3
.LC41:
	.string	"request_irq failed %d\n"
	.align	3
.LC42:
	.string	"irq enabled %u\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_enable_interrupts
	.section	__patchable_function_entries,"awo",@progbits,hailo_bar_iomap
	.align	3
	.8byte	.LPFE9
	.text
.LPFE9:
	nop
	nop
	.type	hailo_enable_interrupts, %function
hailo_enable_interrupts:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	adrp	x1, .LC0
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	add	x21, x0, 12288
	add	x1, x1, :lo12:.LC0
	mov	w2, 983
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	adrp	x0, .LC35
	add	x0, x0, :lo12:.LC35
	bl	_printk
	ldrb	w0, [x21, 888]
	cbnz	w0, .L81
	ldr	x0, [x20, 16]
	bl	pci_enable_msi
	mov	w19, w0
	cbnz	w0, .L82
	adrp	x22, o_dbg
	ldr	w0, [x22, #:lo12:o_dbg]
	cmp	w0, 5
	bgt	.L83
.L76:
	ldr	x0, [x20, 16]
	mov	x3, 128
	mov	x5, x20
	movk	x3, 0x20, lsl 16
	adrp	x4, .LC16
	adrp	x1, hailo_irqhandler
	ldr	w0, [x0, 892]
	add	x4, x4, :lo12:.LC16
	add	x1, x1, :lo12:hailo_irqhandler
	mov	x2, 0
	bl	request_threaded_irq
	mov	w19, w0
	ldr	w0, [x22, #:lo12:o_dbg]
	cbnz	w19, .L84
	cmp	w0, 5
	bgt	.L85
.L79:
	add	x0, x20, 48
	bl	hailo_pcie_enable_interrupts
	mov	w0, 1
	strb	w0, [x21, 888]
.L70:
	ldp	x21, x22, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L84:
	cmp	w0, 2
	bgt	.L86
.L78:
	ldr	x0, [x20, 16]
	bl	pci_disable_msi
	ldp	x21, x22, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L83:
	ldr	x1, [x20, 16]
	adrp	x2, .LC39
	adrp	x0, .LC40
	add	x2, x2, :lo12:.LC39
	add	x0, x0, :lo12:.LC40
	add	x1, x1, 200
	bl	_dev_printk
	b	.L76
	.p2align 2,,3
.L82:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L70
	ldr	x1, [x20, 16]
	mov	w3, w19
	adrp	x2, .LC38
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC38
	add	x0, x0, :lo12:.LC6
	add	x1, x1, 200
	bl	_dev_printk
	ldp	x21, x22, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L86:
	ldr	x1, [x20, 16]
	mov	w3, w19
	adrp	x2, .LC41
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC41
	add	x0, x0, :lo12:.LC6
	add	x1, x1, 200
	bl	_dev_printk
	b	.L78
	.p2align 2,,3
.L85:
	ldr	x3, [x20, 16]
	adrp	x2, .LC42
	adrp	x0, .LC40
	add	x2, x2, :lo12:.LC42
	add	x1, x3, 200
	add	x0, x0, :lo12:.LC40
	ldr	w3, [x3, 892]
	bl	_dev_printk
	b	.L79
	.p2align 2,,3
.L81:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 1
	bgt	.L87
	mov	w19, -22
	b	.L70
	.p2align 2,,3
.L87:
	ldr	x1, [x20, 16]
	adrp	x2, .LC36
	adrp	x0, .LC37
	add	x2, x2, :lo12:.LC36
	add	x0, x0, :lo12:.LC37
	add	x1, x1, 200
	mov	w19, -22
	bl	_dev_printk
	b	.L70
	.size	hailo_enable_interrupts, .-hailo_enable_interrupts
	.section	.rodata.str1.8
	.align	3
.LC43:
	.string	"\0016FUNC_ENTRY: Entering function hailo_disable_interrupts at %s:%d\n"
	.align	3
.LC44:
	.string	"\0013Failed to access board or device\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_disable_interrupts
	.section	__patchable_function_entries,"awo",@progbits,hailo_bar_iomap
	.align	3
	.8byte	.LPFE10
	.text
.LPFE10:
	nop
	nop
	.type	hailo_disable_interrupts, %function
hailo_disable_interrupts:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	adrp	x1, .LC0
	mov	x29, sp
	add	x1, x1, :lo12:.LC0
	mov	w2, 1014
	str	x19, [sp, 16]
	mov	x19, x0
	adrp	x0, .LC43
	add	x0, x0, :lo12:.LC43
	bl	_printk
	cbz	x19, .L89
	ldr	x0, [x19, 16]
	cbz	x0, .L89
	add	x0, x19, 12288
	ldrb	w1, [x0, 888]
	cbnz	w1, .L99
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L99:
	strb	wzr, [x0, 888]
	add	x0, x19, 48
	bl	hailo_pcie_disable_interrupts
	ldr	x0, [x19, 16]
	mov	x1, x19
	ldr	w0, [x0, 892]
	bl	free_irq
	ldr	x0, [x19, 16]
	bl	pci_disable_msi
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L89:
	adrp	x0, .LC44
	add	x0, x0, :lo12:.LC44
	bl	_printk
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.size	hailo_disable_interrupts, .-hailo_disable_interrupts
	.section	.rodata.str1.8
	.align	3
.LC45:
	.string	"\0016FUNC_ENTRY: Entering function hailo_pcie_remove at %s:%d\n"
	.align	3
.LC46:
	.string	"Remove: Releasing board\n"
	.align	3
.LC47:
	.string	"\0016FUNC_ENTRY: Entering function hailo_pcie_remove_board at %s:%d\n"
	.align	3
.LC48:
	.string	"\0016FUNC_ENTRY: Entering function pcie_resources_release at %s:%d\n"
	.align	3
.LC49:
	.string	"\0016FUNC_ENTRY: Entering function hailo_bar_iounmap at %s:%d\n"
	.align	3
.LC50:
	.string	"Remove: Freed board, /dev/hailo%d\n"
	.align	3
.LC51:
	.string	"Remove: Scheduled for board removal, /dev/hailo%d\n"
	.text
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,hailo_bar_iomap
	.align	3
	.8byte	.LPFE11
	.text
.LPFE11:
	nop
	nop
	.type	hailo_pcie_remove, %function
hailo_pcie_remove:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -80]!
	mov	w2, 1348
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	add	x22, x0, 200
	mov	x21, x0
	stp	x19, x20, [sp, 16]
	adrp	x20, .LC0
	add	x20, x20, :lo12:.LC0
	mov	x1, x20
	adrp	x0, .LC45
	add	x0, x0, :lo12:.LC45
	bl	_printk
	ldr	x19, [x22, 120]
	adrp	x1, .LC46
	mov	x0, x22
	add	x1, x1, :lo12:.LC46
	bl	_dev_notice
	cbz	x19, .L100
	mov	x0, 4824
	stp	x23, x24, [sp, 48]
	add	x24, x19, x0
	mov	x0, x24
	str	x25, [sp, 64]
	bl	down
	adrp	x23, .LANCHOR1
	mov	x1, x20
	mov	w2, 302
	add	x23, x23, :lo12:.LANCHOR1
	adrp	x0, .LC47
	add	x23, x23, 552
	add	x0, x0, :lo12:.LC47
	bl	_printk
	mov	x0, x23
	bl	down
	ldp	x2, x1, [x19]
	str	x1, [x2, 8]
	mov	x4, 256
	mov	x3, 290
	movk	x4, 0xdead, lsl 48
	movk	x3, 0xdead, lsl 48
	mov	x0, x23
	adrp	x23, .LC49
	add	x23, x23, :lo12:.LC49
	str	x2, [x1]
	stp	x4, x3, [x19]
	bl	up
	adrp	x0, .LANCHOR2
	add	x2, x0, :lo12:.LANCHOR2
	ldr	w1, [x19, 24]
	ldr	x0, [x0, #:lo12:.LANCHOR2]
	ldr	w2, [x2, 8]
	orr	w1, w1, w2, lsl 20
	bl	device_destroy
	mov	x0, x19
	bl	hailo_disable_interrupts
	ldr	x25, [x19, 16]
	mov	x1, x20
	mov	w2, 1125
	adrp	x0, .LC48
	add	x0, x0, :lo12:.LC48
	bl	_printk
	mov	x1, x20
	mov	x0, x23
	mov	w2, 1049
	bl	_printk
	ldr	x1, [x19, 48]
	cbnz	x1, .L119
	mov	x1, x20
	mov	x0, x23
	mov	w2, 1049
	bl	_printk
	ldr	x1, [x19, 64]
	cbnz	x1, .L120
.L103:
	mov	x1, x20
	mov	x0, x23
	mov	w2, 1049
	bl	_printk
	ldr	x1, [x19, 80]
	cbnz	x1, .L121
.L104:
	mov	x0, x25
	bl	pci_release_regions
	str	xzr, [x19, 16]
	mov	x0, x21
	str	xzr, [x19, 4864]
	bl	pci_disable_device
	str	xzr, [x22, 120]
	add	x0, x19, 104
	bl	hailo_nnc_finalize
	mov	x0, x24
	bl	up
	ldr	w0, [x19, 28]
	ldr	w2, [x19, 24]
	cbnz	w0, .L105
	adrp	x1, .LC50
	add	x1, x1, :lo12:.LC50
	mov	x0, x22
	bl	_dev_notice
	mov	x0, x19
	bl	kfree
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
.L100:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L105:
	mov	x0, x22
	adrp	x1, .LC51
	add	x1, x1, :lo12:.LC51
	bl	_dev_notice
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L121:
	mov	x0, x25
	bl	pci_iounmap
	stp	xzr, xzr, [x19, 80]
	b	.L104
	.p2align 2,,3
.L119:
	mov	x0, x25
	bl	pci_iounmap
	stp	xzr, xzr, [x19, 48]
	mov	x1, x20
	mov	x0, x23
	mov	w2, 1049
	bl	_printk
	ldr	x1, [x19, 64]
	cbz	x1, .L103
.L120:
	mov	x0, x25
	bl	pci_iounmap
	stp	xzr, xzr, [x19, 64]
	mov	x1, x20
	mov	x0, x23
	mov	w2, 1049
	bl	_printk
	ldr	x1, [x19, 80]
	cbz	x1, .L104
	b	.L121
	.size	hailo_pcie_remove, .-hailo_pcie_remove
	.section	.rodata.str1.8
	.align	3
.LC52:
	.string	"\0016FUNC_ENTRY: Entering function hailo_pcie_probe at %s:%d\n"
	.align	3
.LC53:
	.string	"Probing on: %04x:%04x...\n"
	.align	3
.LC54:
	.string	"PCIe driver was compiled with power modes disabled\n"
	.align	3
.LC55:
	.string	"Probing: Allocate memory for device extension, %zu\n"
	.align	3
.LC56:
	.string	"Probing: Failed to allocate memory for device extension structure\n"
	.align	3
.LC57:
	.string	"Probing: Failed calling pci_enable_device %d\n"
	.align	3
.LC58:
	.string	"Probing: Device enabled\n"
	.align	3
.LC59:
	.string	"\0016FUNC_ENTRY: Entering function pcie_resources_init at %s:%d\n"
	.align	3
.LC60:
	.string	"Probing: Invalid board type %d\n"
	.align	3
.LC61:
	.string	"Probing: Error allocating bars %d\n"
	.align	3
.LC62:
	.string	"Probing: Failed reading device BARs, device may be disconnected\n"
	.align	3
.LC63:
	.string	"\0016FUNC_ENTRY: Entering function hailo_get_desc_page_size at %s:%d\n"
	.align	3
.LC64:
	.string	"Probing: Failed init pcie resources"
	.align	3
.LC65:
	.string	"force_desc_page_size must be a power of 2\n"
	.align	3
.LC66:
	.string	"force_desc_page_size %d mustn't be larger than %u"
	.align	3
.LC67:
	.string	"Probing: Force setting max_desc_page_size to %d (recommended value is %lu)\n"
	.align	3
.LC68:
	.string	"Couldn't read DEVCTL capability\n"
	.align	3
.LC69:
	.string	"Probing: Setting max_desc_page_size to 128 (recommended value is %u)\n"
	.align	3
.LC70:
	.string	"Probing: Setting max_desc_page_size to 256 (recommended value is %u)\n"
	.align	3
.LC71:
	.string	"Probing: Setting max_desc_page_size to %u, (page_size=%lu)\n"
	.align	3
.LC72:
	.string	"&x->wait"
	.align	3
.LC73:
	.string	"\0016FUNC_ENTRY: Entering function hailo_pcie_vdma_controller_init at %s:%d\n"
	.align	3
.LC74:
	.string	"Failed init vdma controller %d\n"
	.align	3
.LC75:
	.string	"\0016FUNC_ENTRY: Entering function hailo_get_allocation_mode at %s:%d\n"
	.align	3
.LC76:
	.string	"Probing: Using userspace allocated vdma buffers\n"
	.align	3
.LC77:
	.string	"Probing: Using driver allocated vdma buffers\n"
	.align	3
.LC78:
	.string	"Invalid value for force allocation driver paramater - value given: %d!\n"
	.align	3
.LC79:
	.string	"Failed determining allocation of buffers from driver. error type: %d\n"
	.align	3
.LC80:
	.string	"\0016FUNC_ENTRY: Entering function is_kmalloc_dma_capable at %s:%d\n"
	.align	3
.LC81:
	.string	"failed allocating page!\n"
	.align	3
.LC82:
	.string	"\0016FUNC_ENTRY: Entering function hailo_activate_board at %s:%d\n"
	.align	3
.LC83:
	.string	"\0016FUNC_ENTRY: Entering function hailo_pcie_disable_aspm at %s:%d\n"
	.align	3
.LC84:
	.string	"Couldn't read LNKCTL capability\n"
	.align	3
.LC85:
	.string	"Couldn't read slot LNKCTL capability\n"
	.align	3
.LC86:
	.string	""
	.align	3
.LC87:
	.string	"L0s"
	.align	3
.LC88:
	.string	"Disabling ASPM %s %s\n"
	.align	3
.LC89:
	.string	"\0015"
	.align	3
.LC90:
	.string	"Successfully disabled ASPM %s %s\n"
	.align	3
.LC91:
	.string	"Manually disabled ASPM %s %s\n"
	.align	3
.LC92:
	.string	"\0016FUNC_ENTRY: Entering function enable_boot_interrupts at %s:%d\n"
	.align	3
.LC93:
	.string	"Failed enabling interrupts %d\n"
	.align	3
.LC94:
	.string	"\0016FUNC_ENTRY: Entering function load_firmware at %s:%d\n"
	.align	3
.LC95:
	.string	"\0016FUNC_ENTRY: Entering function load_soc_firmware at %s:%d\n"
	.align	3
.LC96:
	.string	"SOC Firmware batch was already loaded\n"
	.align	3
.LC97:
	.string	"\0014"
	.align	3
.LC98:
	.string	"Failed writing SOC FIRST_STAGE firmware files. err %d\n"
	.align	3
.LC99:
	.string	"Timeout waiting for SOC FIRST_STAGE firmware file, boot status %u\n"
	.align	3
.LC100:
	.string	"\0016FUNC_ENTRY: Entering function pcie_write_firmware_batch_over_dma at %s:%d\n"
	.align	3
.LC101:
	.string	"\0016FUNC_ENTRY: Entering function pcie_vdme_allocate_boot_resources at %s:%d\n"
	.align	3
.LC102:
	.string	"failed to allocate host descriptors list buffer\n"
	.align	3
.LC103:
	.string	"failed to allocate device descriptors list buffer\n"
	.align	3
.LC104:
	.string	"Error starting host vdma channel\n"
	.align	3
.LC105:
	.string	"Error starting device vdma channel\n"
	.align	3
.LC106:
	.string	"\0016FUNC_ENTRY: Entering function pcie_vdma_allocate_noncontinuous_memory at %s:%d\n"
	.align	3
.LC107:
	.string	"Failed to allocate memory for kernel_addrs\n"
	.align	3
.LC108:
	.string	"Failed to allocate memory for pages\n"
	.align	3
.LC109:
	.string	"Failed to get page from vmap address\n"
	.align	3
.LC110:
	.string	"sg table alloc failed (err %ld)..\n"
	.align	3
.LC111:
	.string	"\0016DMA_INSTRUMENT: About to call dma_map_sg from function %s at %s:%d\n"
	.align	3
.LC112:
	.string	"\0016DMA_STACK_START: Stack trace for dma_map_sg called from %s\n"
	.align	3
.LC113:
	.string	"\0016DMA_STACK_END: End of stack trace for dma_map_sg\n"
	.align	3
.LC114:
	.string	"failed to map sg list for user buffer\n"
	.align	3
.LC115:
	.string	"Failed to allocate noncontinuous memory\n"
	.align	3
.LC116:
	.string	"\0016FUNC_ENTRY: Entering function pcie_vdma_program_entire_batch at %s:%d\n"
	.align	3
.LC117:
	.string	"Failed to create descriptors and start channels\n"
	.align	3
.LC118:
	.string	"The amount of files wasn't specified for stage %d\n"
	.align	3
.LC119:
	.string	"\0016FUNC_ENTRY: Entering function pcie_vdma_program_one_file at %s:%d\n"
	.align	3
.LC120:
	.string	"Programing file %s for dma transfer\n"
	.align	3
.LC121:
	.string	"Failed to allocate memory for file %s\n"
	.align	3
.LC122:
	.string	"desc_program_num = 0x%x, desc_page_size = 0x%x, on channel = %d\n"
	.align	3
.LC123:
	.string	"\0017"
	.align	3
.LC124:
	.string	"There is not enough memory allocated to copy file %s\n"
	.align	3
.LC125:
	.string	"\0016FUNC_ENTRY: Entering function pcie_vdma_program_one_file_descriptors at %s:%d\n"
	.align	3
.LC126:
	.string	"channel_index = %d, file_name = %s, file_address = 0x%x, transfer_buffer.offset = 0x%x,        size_to_program = 0x%x, starting_desc/desc_index = 0x%x\n"
	.align	3
.LC127:
	.string	"Failed to program device descriptors, error = %u\n"
	.align	3
.LC128:
	.string	"Failed to program host descriptors, error = %u\n"
	.align	3
.LC129:
	.string	"Host and device descriptors should be the same\n"
	.align	3
.LC130:
	.string	"Failed to program descriptors for file %s, on cahnnel = %d\n"
	.align	3
.LC131:
	.string	"File %s programed successfully\n"
	.align	3
.LC132:
	.string	"Failed to program file %s\n"
	.align	3
.LC133:
	.string	"Failed to program entire batch\n"
	.align	3
.LC134:
	.string	"Set num avail to %u, on channel %u\n"
	.align	3
.LC135:
	.string	"Timeout waiting for vDMA boot data completion\n"
	.align	3
.LC136:
	.string	"vDMA transfer completed, triggering boot\n"
	.align	3
.LC137:
	.string	"Failed writing SOC SECOND_STAGE firmware files over vDMA. err %d\n"
	.align	3
.LC138:
	.string	"Timeout waiting for SOC SECOND_STAGE firmware file, boot status %u\n"
	.align	3
.LC139:
	.string	"SOC Firmware Batch loaded successfully\n"
	.align	3
.LC140:
	.string	"\0016FUNC_ENTRY: Entering function load_nnc_firmware at %s:%d\n"
	.align	3
.LC141:
	.string	"Failed hailo pcie soft reset. err %d\n"
	.align	3
.LC142:
	.string	"Soft reset done\n"
	.align	3
.LC143:
	.string	"NNC Firmware batch was already loaded\n"
	.align	3
.LC144:
	.string	"Failed writing NNC firmware files. err %d\n"
	.align	3
.LC145:
	.string	"Timeout waiting for NNC firmware file, boot status %u\n"
	.align	3
.LC146:
	.string	"NNC Firmware loaded successfully\n"
	.align	3
.LC147:
	.string	"Invalid board type %d\n"
	.align	3
.LC148:
	.string	"Firmware load failed\n"
	.align	3
.LC149:
	.string	"Power change state  to PCI_D3hot\n"
	.align	3
.LC150:
	.string	"Set power state failed %d\n"
	.align	3
.LC151:
	.string	"Failed activating board %d\n"
	.align	3
.LC152:
	.string	"\0016FUNC_ENTRY: Entering function hailo_pcie_insert_board at %s:%d\n"
	.align	3
.LC153:
	.string	"hailo%d"
	.align	3
.LC154:
	.string	"Failed creating dynamic device %d\n"
	.align	3
.LC155:
	.string	"Probing: Added board %0x-%0x, /dev/hailo%d\n"
	.align	3
.LC156:
	.string	"\0016FUNC_ENTRY: Entering function disable_boot_interrupts at %s:%d\n"
	.align	3
.LC157:
	.string	"FW loaded, took %lld ms\n"
	.text
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,hailo_bar_iomap
	.align	3
	.8byte	.LPFE12
	.text
.LPFE12:
	nop
	nop
	.type	hailo_pcie_probe, %function
hailo_pcie_probe:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #416
	mrs	x2, sp_el0
	stp	x29, x30, [sp, 320]
	add	x29, sp, 320
	stp	x19, x20, [sp, 336]
	mov	x20, x0
	adrp	x0, .LC0
	stp	x21, x22, [sp, 352]
	stp	x23, x24, [sp, 368]
	mov	x23, x1
	stp	x25, x26, [sp, 384]
	stp	x27, x28, [sp, 400]
	add	x27, x0, :lo12:.LC0
	mov	x1, x27
	ldr	x0, [x2, 1424]
	str	x0, [sp, 312]
	mov	x0, 0
	mov	w2, 1223
	adrp	x0, .LC52
	add	x0, x0, :lo12:.LC52
	bl	_printk
	ldrh	w3, [x20, 62]
	add	x0, x20, 200
	ldrh	w2, [x20, 60]
	adrp	x1, .LC53
	add	x1, x1, :lo12:.LC53
	str	x0, [sp, 16]
	bl	_dev_notice
	adrp	x0, .LANCHOR1
	add	x25, x0, :lo12:.LANCHOR1
	ldrb	w0, [x25, 544]
	cbz	w0, .L391
.L123:
	ldr	x0, [sp, 16]
	adrp	x22, kmalloc_caches
	add	x22, x22, :lo12:kmalloc_caches
	mov	x2, 13184
	adrp	x1, .LC55
	add	x1, x1, :lo12:.LC55
	bl	_dev_notice
	ldr	x0, [x22, 112]
	mov	x2, 13184
	mov	w1, 3520
	bl	__kmalloc_cache_noprof
	mov	x19, x0
	cbz	x0, .L392
	str	x20, [x19, 16]
	mov	x0, x20
	bl	pci_enable_device
	str	w0, [sp, 96]
	cbnz	w0, .L393
	ldr	x0, [sp, 16]
	adrp	x1, .LC58
	add	x1, x1, :lo12:.LC58
	bl	_dev_notice
	mov	x0, x20
	bl	pci_set_master
	ldr	x23, [x23, 24]
	adrp	x0, .LC59
	mov	x1, x27
	add	x0, x0, :lo12:.LC59
	mov	w24, w23
	mov	w2, 1060
	bl	_printk
	cmp	w23, 4
	bhi	.L394
	mov	x0, x20
	adrp	x1, .LC16
	add	x1, x1, :lo12:.LC16
	bl	pci_request_regions
	mov	w26, w0
	tbnz	w0, #31, .L395
	add	x0, x19, 48
	mov	w1, 0
	mov	x2, x0
	str	x0, [sp, 40]
	mov	x0, x20
	bl	hailo_bar_iomap
	mov	w26, w0
	tbnz	w0, #31, .L131
	add	x0, x19, 64
	mov	w1, 2
	mov	x2, x0
	str	x0, [sp, 32]
	mov	x0, x20
	bl	hailo_bar_iomap
	mov	w26, w0
	tbnz	w0, #31, .L396
	add	x2, x19, 80
	mov	x0, x20
	mov	w1, 4
	bl	hailo_bar_iomap
	mov	w26, w0
	tbnz	w0, #31, .L397
	cmp	w23, 3
	bne	.L134
	adrp	x0, .LANCHOR2+12
	ldrb	w24, [x0, #:lo12:.LANCHOR2+12]
	add	w24, w24, 3
.L134:
	ldr	x21, [sp, 40]
	mov	x0, x21
	str	w24, [x21, 48]
	bl	hailo_set_device_type
	mov	w26, w0
	tbnz	w0, #31, .L135
	mov	x0, x21
	bl	hailo_pcie_is_device_connected
	tst	w0, 255
	beq	.L398
	adrp	x0, .LANCHOR2
	add	x26, x0, :lo12:.LANCHOR2
	mov	w2, 97
	mov	x1, x27
	adrp	x0, .LC63
	add	x0, x0, :lo12:.LC63
	bl	_printk
	strh	wzr, [sp, 288]
	ldr	w2, [x26, 16]
	cbz	w2, .L399
	sub	w0, w2, #1
	tst	w0, w2
	bne	.L400
	cmp	w2, 32768
	bhi	.L401
	ldr	x0, [sp, 16]
	adrp	x1, .LC67
	mov	x3, 16384
	add	x1, x1, :lo12:.LC67
	bl	_dev_notice
	ldr	w1, [x26, 16]
.L146:
	add	x0, x19, 12288
	add	x3, x19, 8192
	str	w1, [x19, 13168]
	mov	x8, 9216
	add	x4, x19, x8
	mov	x9, 5120
	strb	wzr, [x0, 888]
	mov	x10, 4792
	strb	wzr, [x3, 784]
	mov	x11, 8984
	add	x1, x19, x11
	str	wzr, [x19, 8984]
	add	x28, x1, 8
	adrp	x23, .LC72
	add	x23, x23, :lo12:.LC72
	add	x24, x19, x9
	add	x21, x19, x10
	add	x2, x26, 24
	mov	x0, x28
	str	x2, [sp, 24]
	str	x3, [sp, 48]
	stp	x4, x1, [sp, 80]
	mov	x1, x23
	bl	__init_swait_queue_head
	sub	x3, x24, #296
	mov	x0, 4294967296
	str	x0, [x19, 4824]
	mov	x12, 4832
	add	x4, x19, x12
	add	x1, x19, 32
	stp	x4, x4, [x3, 8]
	add	x0, x19, 104
	str	wzr, [x19, 28]
	str	x1, [x19, 32]
	str	x1, [x19, 40]
	bl	hailo_nnc_init
	mov	x13, 4728
	add	x0, x19, x13
	bl	hailo_soc_init
	sub	x3, x24, #360
	mov	x14, 4768
	ldr	x2, [sp, 24]
	sub	x24, x24, #328
	str	wzr, [x3]
	add	x0, x19, x14
	mov	x1, x23
	bl	__init_swait_queue_head
	str	wzr, [x24]
	ldr	x2, [sp, 24]
	mov	x1, x23
	add	x0, x21, 8
	bl	__init_swait_queue_head
	mov	x15, 9048
	mov	x2, 4120
	add	x0, x19, x15
	mov	w1, 0
	bl	memset
	ldr	x24, [x19, 16]
	mov	x1, x27
	mov	w2, 1153
	adrp	x0, .LC73
	add	x0, x0, :lo12:.LC73
	bl	_printk
	ldr	x4, [sp, 32]
	mov	x16, 4848
	add	x24, x24, 200
	adrp	x0, hailo_pcie_vdma_hw
	add	x0, x0, :lo12:hailo_pcie_vdma_hw
	mov	x1, x24
	mov	x2, x0
	add	x3, x25, 592
	mov	x5, 1
	str	x0, [sp, 56]
	add	x0, x19, x16
	bl	hailo_vdma_controller_init
	mov	w24, w0
	tbnz	w0, #31, .L402
	mov	w2, 1190
	mov	x1, x27
	adrp	x0, .LC75
	add	x0, x0, :lo12:.LC75
	bl	_printk
	ldr	w2, [x26, 24]
	cbz	w2, .L154
	cmp	w2, 1
	beq	.L378
	cmp	w2, 2
	bne	.L157
.L160:
	ldr	x0, [sp, 16]
	mov	w2, 1
	str	w2, [x19, 13172]
	adrp	x1, .LC77
	add	x1, x1, :lo12:.LC77
	bl	_dev_notice
.L156:
	ldr	x4, [sp, 48]
	mov	w3, 1
	mov	x7, 7496
	mov	x2, 1480
	add	x0, x19, x7
	mov	w1, 0
	strh	w3, [x4, 786]
	str	x0, [sp, 152]
	bl	memset
	mov	x1, x27
	mov	w2, 946
	adrp	x0, .LC82
	add	x0, x0, :lo12:.LC82
	bl	_printk
	mov	x1, x27
	mov	w2, 175
	adrp	x0, .LC83
	add	x0, x0, :lo12:.LC83
	bl	_printk
	add	x2, sp, 264
	ldr	x22, [x19, 16]
	mov	w1, 16
	mov	x0, x22
	ldr	x3, [x22, 16]
	ldr	x24, [x3, 56]
	strh	wzr, [sp, 264]
	strh	wzr, [sp, 288]
	bl	pcie_capability_read_word
	tbnz	w0, #31, .L403
	ldrh	w0, [sp, 264]
	and	w0, w0, 3
	strh	w0, [sp, 264]
	cbz	x24, .L170
	add	x2, sp, 288
	mov	x0, x24
	mov	w1, 16
	bl	pcie_capability_read_word
	tbnz	w0, #31, .L404
	ldrh	w0, [sp, 288]
	and	w0, w0, 3
	strh	w0, [sp, 288]
.L170:
	adrp	x0, o_dbg
	str	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 4
	bgt	.L405
.L173:
	mov	w1, 3
	mov	x0, x22
	bl	pci_disable_link_state
	add	x2, sp, 264
	mov	x0, x22
	mov	w1, 16
	bl	pcie_capability_read_word
	tbnz	w0, #31, .L389
	ldrh	w0, [sp, 264]
	and	w1, w0, 3
	strh	w1, [sp, 264]
	tbnz	x0, 0, .L175
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 4
	ble	.L169
	ldr	x1, [x19, 16]
	adrp	x4, .LC86
	adrp	x3, .LC87
	adrp	x2, .LC90
	adrp	x0, .LC89
	add	x4, x4, :lo12:.LC86
	add	x3, x3, :lo12:.LC87
	add	x2, x2, :lo12:.LC90
	add	x0, x0, :lo12:.LC89
	add	x1, x1, 200
	bl	_dev_printk
	.p2align 3,,7
.L169:
	mov	x1, x27
	mov	w2, 926
	adrp	x0, .LC92
	add	x0, x0, :lo12:.LC92
	bl	_printk
	mov	x0, x19
	bl	hailo_enable_interrupts
	mov	w8, w0
	tbnz	w0, #31, .L406
	ldr	x1, [sp, 48]
	mov	w0, 1
	strb	w0, [x1, 784]
	bl	ktime_get
	str	x0, [sp, 168]
	mov	x1, x27
	mov	w2, 912
	adrp	x0, .LC94
	add	x0, x0, :lo12:.LC94
	bl	_printk
	ldr	w3, [x19, 100]
	cbz	w3, .L181
	cmp	w3, 1
	bne	.L182
	ldr	x3, [x19, 16]
	mov	x1, x27
	mov	w2, 796
	adrp	x0, .LC95
	add	x3, x3, 200
	add	x0, x0, :lo12:.LC95
	str	x3, [sp, 184]
	bl	_printk
	ldrb	w0, [x26, 28]
	str	w0, [sp, 100]
	ldr	x0, [sp, 40]
	bl	hailo_pcie_is_firmware_loaded
	tst	w0, 255
	beq	.L183
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 3
	bgt	.L407
.L185:
	bl	ktime_get
	ldr	x1, [sp, 32]
	ldr	w1, [x1, #:lo12:o_dbg]
	cmp	w1, 4
	bgt	.L408
.L386:
	mov	x1, x27
	mov	w2, 939
	adrp	x0, .LC156
	add	x0, x0, :lo12:.LC156
	bl	_printk
	ldr	x0, [sp, 48]
	strb	wzr, [x0, 784]
	mov	x0, x19
	bl	hailo_disable_interrupts
	mov	x1, x27
	adrp	x0, .LC29
	mov	w2, 82
	add	x0, x0, :lo12:.LC29
	bl	_printk
	ldrb	w0, [x25, 544]
	cbz	w0, .L277
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 5
	bgt	.L409
.L278:
	ldr	x0, [x19, 16]
	mov	w1, 3
	bl	pci_set_power_state
	mov	w8, w0
	tbnz	w0, #31, .L410
.L277:
	ldr	x0, [sp, 16]
	mov	x1, x27
	mov	w2, 267
	str	x19, [x0, 120]
	adrp	x0, .LC152
	add	x0, x0, :lo12:.LC152
	bl	_printk
	add	x0, x25, 552
	bl	down
	add	x4, x25, 576
	add	x0, x25, 512
	ldr	x1, [x0, 64]
	ldr	x3, [x0, 64]
	cmp	x1, x4
	beq	.L281
	ldr	w1, [x3, 24]
	cbnz	w1, .L281
	ldr	x0, [x3]
	mov	x5, x3
	cmp	x3, x4
	bne	.L285
	b	.L309
	.p2align 2,,3
.L411:
	ldr	w1, [x0, 24]
	cmp	w2, w1
	bne	.L284
	mov	x5, x0
	mov	x3, x0
	ldr	x0, [x0]
.L285:
	add	w2, w1, 1
	cmp	x0, x4
	bne	.L411
.L284:
	str	w2, [x19, 24]
	add	x0, x25, 552
	ldr	x1, [x3]
	str	x19, [x1, 8]
	stp	x1, x5, [x19]
	str	x19, [x3]
	bl	up
.L283:
	adrp	x1, g_hailo_dev_groups
	adrp	x0, .LANCHOR2
	ldr	w6, [x19, 24]
	mov	x3, x19
	ldr	x4, [x1, #:lo12:g_hailo_dev_groups]
	adrp	x5, .LC153
	ldr	x0, [x0, #:lo12:.LANCHOR2]
	add	x5, x5, :lo12:.LC153
	ldr	w2, [x26, 8]
	mov	x1, 0
	orr	w2, w6, w2, lsl 20
	bl	device_create_with_groups
	mov	x21, x0
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmn	x21, #4096
	bhi	.L412
	cmp	w0, 4
	ble	.L122
	ldrh	w4, [x20, 62]
	adrp	x2, .LC155
	ldrh	w3, [x20, 60]
	add	x2, x2, :lo12:.LC155
	ldr	w5, [x19, 24]
	adrp	x0, .LC89
	ldr	x1, [x19, 16]
	add	x0, x0, :lo12:.LC89
	add	x1, x1, 200
	bl	_dev_printk
	b	.L122
	.p2align 2,,3
.L396:
	adrp	x23, .LC49
	add	x23, x23, :lo12:.LC49
.L132:
	mov	x1, x27
	mov	x0, x23
	mov	w2, 1049
	bl	_printk
	ldr	x1, [x19, 48]
	cbz	x1, .L131
	mov	x0, x20
	bl	pci_iounmap
	stp	xzr, xzr, [x19, 48]
	.p2align 3,,7
.L131:
	mov	x0, x20
	bl	pci_release_regions
.L129:
	ldr	x0, [sp, 16]
	adrp	x1, .LC64
	add	x1, x1, :lo12:.LC64
	str	w26, [sp, 96]
	bl	_dev_err
.L142:
	mov	x0, x20
	bl	pci_disable_device
.L127:
	mov	x0, x19
	bl	kfree
.L122:
	mrs	x0, sp_el0
	ldr	x2, [sp, 312]
	ldr	x1, [x0, 1424]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L413
	ldp	x29, x30, [sp, 320]
	ldp	x19, x20, [sp, 336]
	ldp	x21, x22, [sp, 352]
	ldp	x23, x24, [sp, 368]
	ldp	x25, x26, [sp, 384]
	ldp	x27, x28, [sp, 400]
	ldr	w0, [sp, 96]
	add	sp, sp, 416
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L393:
	ldr	x0, [sp, 16]
	adrp	x1, .LC57
	ldr	w2, [sp, 96]
	add	x1, x1, :lo12:.LC57
	bl	_dev_err
	b	.L127
	.p2align 2,,3
.L391:
	ldr	x0, [sp, 16]
	adrp	x1, .LC54
	add	x1, x1, :lo12:.LC54
	bl	_dev_notice
	b	.L123
	.p2align 2,,3
.L395:
	mov	w2, w0
	adrp	x1, .LC61
	ldr	x0, [sp, 16]
	add	x1, x1, :lo12:.LC61
	bl	_dev_err
	b	.L129
	.p2align 2,,3
.L399:
	mov	w1, 8
	add	x2, sp, 288
	mov	x0, x20
	bl	pcie_capability_read_word
	mov	w1, w0
	tbnz	w0, #31, .L414
	ldrh	w0, [sp, 288]
	ands	w0, w0, 28672
	beq	.L149
	cmp	w0, 4096
	beq	.L150
	ldr	x0, [sp, 16]
	mov	x3, 16384
	adrp	x1, .LC71
	mov	w2, w3
	add	x1, x1, :lo12:.LC71
	bl	_dev_notice
	mov	w1, 16384
	b	.L146
	.p2align 2,,3
.L402:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L415
.L153:
	ldr	x22, [x19, 16]
	str	w24, [sp, 96]
.L148:
	mov	x1, x27
	mov	w2, 1125
	adrp	x0, .LC48
	adrp	x23, .LC49
	add	x0, x0, :lo12:.LC48
	add	x23, x23, :lo12:.LC49
	bl	_printk
	mov	x1, x27
	mov	x0, x23
	mov	w2, 1049
	bl	_printk
	ldr	x1, [x19, 48]
	cbnz	x1, .L416
	mov	x1, x27
	mov	x0, x23
	mov	w2, 1049
	bl	_printk
	ldr	x1, [x19, 64]
	cbnz	x1, .L417
.L291:
	mov	x1, x27
	mov	x0, x23
	mov	w2, 1049
	bl	_printk
	ldr	x1, [x19, 80]
	cbnz	x1, .L418
.L292:
	mov	x0, x22
	bl	pci_release_regions
	b	.L142
	.p2align 2,,3
.L416:
	mov	x0, x22
	bl	pci_iounmap
	stp	xzr, xzr, [x19, 48]
	mov	x1, x27
	mov	x0, x23
	mov	w2, 1049
	bl	_printk
	ldr	x1, [x19, 64]
	cbz	x1, .L291
.L417:
	mov	x0, x22
	bl	pci_iounmap
	stp	xzr, xzr, [x19, 64]
	mov	x1, x27
	mov	x0, x23
	mov	w2, 1049
	bl	_printk
	ldr	x1, [x19, 80]
	cbz	x1, .L292
.L418:
	mov	x0, x22
	bl	pci_iounmap
	stp	xzr, xzr, [x19, 80]
	b	.L292
	.p2align 2,,3
.L398:
	ldr	x0, [sp, 16]
	adrp	x1, .LC62
	mov	w26, -19
	add	x1, x1, :lo12:.LC62
	bl	_dev_err
.L135:
	adrp	x23, .LC49
	add	x23, x23, :lo12:.LC49
	mov	x1, x27
	mov	x0, x23
	mov	w2, 1049
	bl	_printk
	ldr	x1, [x19, 80]
	cbnz	x1, .L419
.L133:
	mov	x1, x27
	mov	x0, x23
	mov	w2, 1049
	bl	_printk
	ldr	x1, [x19, 64]
	cbz	x1, .L132
	mov	x0, x20
	bl	pci_iounmap
	stp	xzr, xzr, [x19, 64]
	b	.L132
	.p2align 2,,3
.L154:
	mov	x1, x27
	adrp	x0, .LC80
	mov	w2, 1164
	add	x0, x0, :lo12:.LC80
	bl	_printk
	ldr	x0, [sp, 16]
	ldr	x0, [x0, 504]
	cbz	x0, .L160
	ldr	x0, [x22, 112]
	mov	x2, 16384
	mov	w1, 3264
	bl	__kmalloc_cache_noprof
	cbz	x0, .L420
	mov	x1, 140737488355328
	add	x3, x0, x1
	mov	x2, 70368744177663
	cmp	x3, x2
	bhi	.L161
	adrp	x2, memstart_addr
	ldr	x22, [x2, #:lo12:memstart_addr]
	add	x22, x22, x1
	add	x22, x22, x0
.L162:
	ldr	x1, [sp, 16]
	ldr	x2, [x1, 528]
	cbnz	x2, .L390
.L163:
	ldr	x2, [sp, 16]
	ldr	x1, [x2, 504]
	ldr	x24, [x2, 520]
	ldr	x1, [x1]
	cbz	x1, .L166
	cbz	x24, .L303
	cmp	x24, x1
	csel	x24, x24, x1, ls
.L166:
	bl	kfree
	cmp	x24, x22
	bcc	.L160
.L378:
	ldr	x0, [sp, 16]
	str	wzr, [x19, 13172]
	adrp	x1, .LC76
	add	x1, x1, :lo12:.LC76
	bl	_dev_notice
	b	.L156
	.p2align 2,,3
.L405:
	ldr	x1, [x19, 16]
	adrp	x4, .LC86
	adrp	x3, .LC87
	add	x4, x4, :lo12:.LC86
	add	x3, x3, :lo12:.LC87
	add	x1, x1, 200
	adrp	x2, .LC88
	adrp	x0, .LC89
	add	x2, x2, :lo12:.LC88
	add	x0, x0, :lo12:.LC89
	bl	_dev_printk
	b	.L173
	.p2align 2,,3
.L165:
	ldr	x1, [x2]
	subs	x1, x22, x1
	ccmp	x1, x3, 2, cs
	bcc	.L421
	add	x2, x2, 24
.L390:
	ldr	x3, [x2, 16]
	cbnz	x3, .L165
	mov	x22, -1
	b	.L163
	.p2align 2,,3
.L175:
	mov	x0, x22
	mov	w3, 0
	mov	w2, 1
	mov	w1, 16
	bl	pcie_capability_clear_and_set_word_locked
	tbnz	w0, #31, .L389
	cbz	x24, .L177
	mov	x0, x24
	mov	w3, 0
	mov	w2, 1
	mov	w1, 16
	bl	pcie_capability_clear_and_set_word_locked
	tbnz	w0, #31, .L422
.L177:
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 4
	ble	.L169
	ldr	x1, [x19, 16]
	adrp	x4, .LC86
	adrp	x3, .LC87
	add	x4, x4, :lo12:.LC86
	add	x3, x3, :lo12:.LC87
	add	x1, x1, 200
	adrp	x2, .LC91
	adrp	x0, .LC89
	add	x2, x2, :lo12:.LC91
	add	x0, x0, :lo12:.LC89
	bl	_dev_printk
	b	.L169
	.p2align 2,,3
.L419:
	mov	x0, x20
	bl	pci_iounmap
	stp	xzr, xzr, [x19, 80]
	b	.L133
	.p2align 2,,3
.L149:
	ldr	x0, [sp, 16]
	adrp	x1, .LC69
	mov	w2, 16384
	add	x1, x1, :lo12:.LC69
	bl	_dev_notice
	mov	w1, 128
	b	.L146
	.p2align 2,,3
.L150:
	ldr	x0, [sp, 16]
	adrp	x1, .LC70
	mov	w2, 16384
	add	x1, x1, :lo12:.LC70
	bl	_dev_notice
	mov	w1, 256
	b	.L146
.L157:
	ldr	x21, [sp, 16]
	adrp	x1, .LC78
	add	x1, x1, :lo12:.LC78
	mov	x0, x21
	bl	_dev_err
	adrp	x1, .LC79
	mov	x0, x21
	add	x1, x1, :lo12:.LC79
	mov	w2, -22
	bl	_dev_err
.L144:
	ldr	x22, [x19, 16]
	mov	w0, -22
	str	w0, [sp, 96]
	b	.L148
	.p2align 2,,3
.L397:
	adrp	x23, .LC49
	add	x23, x23, :lo12:.LC49
	b	.L133
	.p2align 2,,3
.L415:
	ldr	x1, [x19, 16]
	mov	w3, w24
	adrp	x2, .LC74
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC74
	add	x0, x0, :lo12:.LC6
	add	x1, x1, 200
	bl	_dev_printk
	b	.L153
	.p2align 2,,3
.L403:
	adrp	x0, o_dbg
	str	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L169
.L381:
	ldr	x1, [x19, 16]
	adrp	x2, .LC84
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC84
	add	x0, x0, :lo12:.LC6
	add	x1, x1, 200
	bl	_dev_printk
	b	.L169
	.p2align 2,,3
.L406:
	ldr	x0, [sp, 32]
	ldr	x22, [x19, 16]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L423
.L179:
	str	w8, [sp, 96]
	b	.L148
	.p2align 2,,3
.L423:
	adrp	x21, .LC6
	add	x21, x21, :lo12:.LC6
	mov	w3, w8
	add	x1, x22, 200
	mov	x0, x21
	adrp	x2, .LC93
	add	x2, x2, :lo12:.LC93
	str	w8, [sp, 16]
	str	w8, [sp, 96]
	bl	_dev_printk
	ldr	w8, [sp, 16]
.L180:
	ldr	x0, [sp, 32]
	ldr	x22, [x19, 16]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L148
	add	x1, x22, 200
	mov	w3, w8
	mov	x0, x21
	adrp	x2, .LC151
	add	x2, x2, :lo12:.LC151
	bl	_dev_printk
	ldr	x22, [x19, 16]
	b	.L148
	.p2align 2,,3
.L281:
	str	wzr, [x19, 24]
	add	x2, x25, 576
	str	x19, [x3, 8]
	add	x0, x25, 552
	stp	x3, x2, [x19]
	str	x19, [x25, 576]
	bl	up
	b	.L283
	.p2align 2,,3
.L389:
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L169
	b	.L381
	.p2align 2,,3
.L414:
	ldr	x0, [sp, 16]
	str	w1, [sp, 96]
	adrp	x1, .LC68
	add	x1, x1, :lo12:.LC68
	bl	_dev_err
	ldr	x22, [x19, 16]
	b	.L148
	.p2align 2,,3
.L182:
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L275
.L276:
	mov	w8, -22
.L190:
	str	w8, [sp, 16]
	bl	ktime_get
	ldr	x1, [sp, 32]
	ldr	w8, [sp, 16]
	ldr	w1, [x1, #:lo12:o_dbg]
	cmp	w1, 4
	bgt	.L424
	str	w8, [sp, 16]
.L385:
	mov	x1, x27
	mov	w2, 939
	adrp	x0, .LC156
	add	x0, x0, :lo12:.LC156
	bl	_printk
	ldr	x0, [sp, 48]
	strb	wzr, [x0, 784]
	mov	x0, x19
	bl	hailo_disable_interrupts
	ldr	w8, [sp, 16]
	ldr	x0, [sp, 32]
	ldr	x22, [x19, 16]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L179
	adrp	x21, .LC6
	add	x21, x21, :lo12:.LC6
	add	x1, x22, 200
	mov	x0, x21
	adrp	x2, .LC148
	add	x2, x2, :lo12:.LC148
	str	w8, [sp, 16]
	str	w8, [sp, 96]
	bl	_dev_printk
	ldr	w8, [sp, 16]
	b	.L180
.L275:
	ldr	x1, [x19, 16]
	adrp	x2, .LC147
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC147
	add	x0, x0, :lo12:.LC6
	add	x1, x1, 200
	bl	_dev_printk
	b	.L276
	.p2align 2,,3
.L181:
	mov	x1, x27
	adrp	x0, .LC140
	mov	w2, 847
	add	x0, x0, :lo12:.LC140
	bl	_printk
	ldr	x22, [x19, 16]
	ldr	x24, [sp, 40]
	add	x22, x22, 200
	mov	x0, x24
	bl	hailo_pcie_is_firmware_loaded
	tst	w0, 255
	beq	.L270
	ldrb	w0, [x25, 600]
	cbz	w0, .L268
	mov	x1, x21
	mov	x0, x24
	bl	hailo_pcie_soft_reset
	tbnz	w0, #31, .L425
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 4
	bgt	.L426
.L270:
	ldr	x3, [sp, 80]
	mov	x1, x23
	mov	x0, x28
	add	x2, x26, 24
	str	wzr, [x3, -232]
	bl	__init_swait_queue_head
	ldr	x1, [sp, 40]
	mov	x0, x22
	mov	w2, 0
	bl	hailo_pcie_write_firmware_batch
	mov	w8, w0
	tbnz	w0, #31, .L427
	ldr	w0, [x19, 96]
	mov	w1, 0
	bl	hailo_pcie_get_loading_stage_info
	mov	x3, x0
	mov	x1, x27
	mov	w2, 320
	adrp	x0, .LC32
	add	x0, x0, :lo12:.LC32
	ldr	w23, [x3, 12]
	bl	_printk
	mov	w0, w23
	bl	__msecs_to_jiffies
	mov	x1, x0
	ldr	x0, [sp, 88]
	bl	wait_for_completion_timeout
	cbz	x0, .L428
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 4
	ble	.L185
	mov	x1, x22
	adrp	x2, .LC146
	adrp	x0, .LC89
	add	x2, x2, :lo12:.LC146
	add	x0, x0, :lo12:.LC89
	bl	_dev_printk
	b	.L185
	.p2align 2,,3
.L161:
	adrp	x1, kimage_voffset
	ldr	x22, [x1, #:lo12:kimage_voffset]
	sub	x22, x0, x22
	b	.L162
	.p2align 2,,3
.L404:
	adrp	x0, o_dbg
	str	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L169
.L380:
	ldr	x1, [x19, 16]
	adrp	x2, .LC85
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC85
	add	x0, x0, :lo12:.LC6
	add	x1, x1, 200
	bl	_dev_printk
	b	.L169
	.p2align 2,,3
.L183:
	ldr	x24, [sp, 40]
	add	x22, x26, 24
	mov	x0, x24
	bl	hailo_pcie_configure_ep_registers_for_dma_transaction
	ldr	x21, [sp, 80]
	mov	x0, x28
	mov	x2, x22
	mov	x1, x23
	str	wzr, [x21, -232]
	bl	__init_swait_queue_head
	str	wzr, [x21, -200]
	mov	x6, 9016
	add	x2, x19, x6
	mov	x3, x2
	mov	x1, x23
	add	x0, x3, 8
	mov	x2, x22
	str	x3, [sp, 216]
	bl	__init_swait_queue_head
	ldr	x0, [sp, 184]
	mov	x1, x24
	mov	w2, 0
	bl	hailo_pcie_write_firmware_batch
	mov	w8, w0
	tbnz	w0, #31, .L429
	ldr	x0, [sp, 40]
	mov	w1, 0
	ldr	w0, [x0, 48]
	bl	hailo_pcie_get_loading_stage_info
	ldr	w22, [x0, 12]
	adrp	x3, .LC32
	add	x3, x3, :lo12:.LC32
	mov	x1, x27
	mov	w2, 320
	mov	x0, x3
	str	x3, [sp, 224]
	bl	_printk
	mov	w0, w22
	bl	__msecs_to_jiffies
	mov	x1, x0
	ldr	x0, [sp, 88]
	bl	wait_for_completion_timeout
	cbz	x0, .L430
	ldr	x3, [sp, 80]
	mov	x1, x27
	mov	w2, 742
	adrp	x0, .LC100
	add	x0, x0, :lo12:.LC100
	mov	x28, 0
	str	wzr, [x3, -232]
	bl	_printk
	ldr	x0, [x19, 4880]
	mov	x1, x27
	mov	w2, 667
	mov	x3, x0
	adrp	x0, .LC101
	add	x6, x3, 24
	add	x0, x0, :lo12:.LC101
	str	x6, [sp, 24]
	str	x3, [sp, 208]
	bl	_printk
	str	x20, [sp, 64]
	ldr	x6, [sp, 24]
	mov	x5, 7640
	adrp	x0, .LANCHOR0
	add	x4, x19, x5
	add	x0, x0, :lo12:.LANCHOR0
	mov	x22, x4
	mov	x24, x6
	stp	x0, x6, [sp, 112]
	add	x0, x0, 40
	str	x0, [sp, 104]
	adrp	x0, .LC106
	add	x0, x0, :lo12:.LC106
	str	x0, [sp, 72]
	str	x4, [sp, 128]
.L216:
	ldr	x0, [x19, 16]
	sub	x5, x22, #144
	mov	w4, 0
	mov	x3, 0
	add	x0, x0, 200
	mov	w2, 512
	mov	w1, 65536
	mov	w21, w28
	bl	hailo_desc_list_create
	sxtw	x5, w0
	tbnz	x0, 31, .L431
	ldr	x0, [x19, 16]
	sub	x5, x22, #72
	mov	w4, 0
	mov	x3, 0
	add	x0, x0, 200
	mov	w2, 512
	mov	w1, 65536
	bl	hailo_desc_list_create
	sxtw	x5, w0
	tbnz	x0, 31, .L432
	ldr	x3, [x19, 4848]
	ldr	x1, [x22, -112]
	ldr	x0, [x24]
	ldr	w2, [x22, -88]
	ldrb	w3, [x3, 8]
	bl	hailo_vdma_start_channel
	sxtw	x5, w0
	tbnz	x0, 31, .L433
	ldr	x0, [x19, 4848]
	ldr	x1, [x22, -40]
	ldrb	w3, [x0, 8]
	ldr	x0, [x24, 8]
	ldr	w2, [x22, -16]
	bl	hailo_vdma_start_channel
	sxtw	x5, w0
	tbnz	x0, 31, .L434
	mov	x23, 33554432
	str	x23, [x22, 16]
	ldr	x0, [sp, 72]
	mov	x1, x27
	ldr	x3, [x19, 16]
	mov	w2, 543
	add	x3, x3, 200
	str	x3, [sp, 24]
	bl	_printk
	mov	x0, x23
	bl	vmalloc_noprof
	str	x0, [x22, 24]
	cbz	x0, .L435
	mov	w2, -1
	mov	w1, 3264
	mov	x0, 16384
	bl	__kvmalloc_node_noprof
	mov	x23, x0
	cbz	x0, .L436
	mov	x20, 0
	b	.L203
	.p2align 2,,3
.L206:
	add	x20, x20, 1
	cmp	x20, 2048
	beq	.L437
.L203:
	ldr	x0, [x22, 24]
	add	x0, x0, x20, lsl 14
	bl	vmalloc_to_page
	str	x0, [x23, x20, lsl 3]
	cbnz	x0, .L206
	ldr	x0, [sp, 32]
	ldr	x20, [sp, 64]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L438
.L383:
	mov	x0, x23
	bl	kfree
.L382:
	sxtw	x1, w21
	add	x0, x1, w21, sxtw 1
	lsl	x0, x0, 3
	sub	x0, x0, x1
	add	x0, x19, x0, lsl 3
	ldr	x0, [x0, 7664]
	bl	vfree
.L205:
	mov	x5, -12
.L202:
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L194
	ldr	x1, [x19, 16]
	adrp	x2, .LC115
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC115
	add	x0, x0, :lo12:.LC6
	add	x1, x1, 200
	str	x5, [sp, 24]
	bl	_dev_printk
	ldr	x5, [sp, 24]
.L194:
	mov	x0, x19
	ldr	x2, [sp, 152]
	str	x5, [sp, 24]
	ldr	x1, [sp, 208]
	bl	pcie_vdme_release_boot_resources
	ldp	x5, x0, [sp, 24]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L439
	mov	w8, w5
	tbnz	w5, #31, .L190
.L223:
	ldr	x0, [sp, 40]
	mov	w1, 1
	ldr	w0, [x0, 48]
	bl	hailo_pcie_get_loading_stage_info
	ldr	w22, [x0, 12]
	ldr	x0, [sp, 224]
	mov	x1, x27
	mov	w2, 320
	bl	_printk
	mov	w0, w22
	bl	__msecs_to_jiffies
	mov	x1, x0
	ldr	x0, [sp, 88]
	bl	wait_for_completion_timeout
	cbz	x0, .L440
	ldr	x0, [sp, 32]
	ldr	x1, [sp, 80]
	ldr	w0, [x0, #:lo12:o_dbg]
	str	wzr, [x1, -232]
	str	wzr, [x1, -200]
	cmp	w0, 4
	ble	.L185
	ldr	x1, [sp, 184]
	adrp	x2, .LC139
	adrp	x0, .LC89
	add	x2, x2, :lo12:.LC139
	add	x0, x0, :lo12:.LC89
	bl	_dev_printk
	b	.L185
	.p2align 2,,3
.L437:
	mov	w3, 0
	mov	w2, w20
	mov	x1, x23
	mov	x0, x22
	mov	w6, 3264
	mov	w5, 65536
	mov	x4, 33554432
	bl	sg_alloc_table_from_pages_segment
	sxtw	x3, w0
	tbnz	w0, #31, .L209
	ldr	x3, [x22]
.L209:
	cmn	x3, #4096
	bhi	.L441
	ldr	x20, [sp, 104]
	mov	x2, x27
	mov	w3, 589
	adrp	x0, .LC111
	mov	x1, x20
	add	x0, x0, :lo12:.LC111
	bl	_printk
	mov	x1, x20
	adrp	x0, .LC112
	add	x0, x0, :lo12:.LC112
	bl	_printk
	bl	dump_stack
	adrp	x0, .LC113
	add	x0, x0, :lo12:.LC113
	bl	_printk
	ldr	x1, [x22]
	mov	x4, 0
	ldr	x0, [sp, 24]
	mov	w3, 1
	ldr	w2, [x22, 12]
	bl	dma_map_sg_attrs
	str	w0, [x22, 8]
	cbnz	w0, .L212
	ldr	x0, [sp, 32]
	ldr	x20, [sp, 64]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L442
.L213:
	ldr	x0, [sp, 112]
	mov	x2, x27
	mov	w3, 606
	add	x22, x0, 40
	adrp	x0, .LC9
	mov	x1, x22
	add	x0, x0, :lo12:.LC9
	bl	_printk
	mov	x1, x22
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	bl	_printk
	mov	x5, -6
	str	x5, [sp, 56]
	bl	dump_stack
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	bl	_printk
	sxtw	x2, w21
	mov	x4, 7496
	add	x22, x2, w21, sxtw 1
	add	x1, x19, x4
	ldr	x0, [sp, 24]
	lsl	x22, x22, 3
	sub	x22, x22, x2
	mov	x4, 0
	mov	w3, 1
	add	x22, x1, x22, lsl 3
	ldr	x1, [x22, 144]
	ldr	w2, [x22, 156]
	bl	dma_unmap_sg_attrs
	mov	x0, x23
	bl	kfree
	ldr	x0, [x22, 168]
	bl	vfree
	ldr	x5, [sp, 56]
	b	.L202
	.p2align 2,,3
.L408:
	ldr	x1, [sp, 168]
	mov	x4, 13531
	movk	x4, 0xd7b6, lsl 16
	adrp	x2, .LC157
	sub	x3, x0, x1
	movk	x4, 0xde82, lsl 32
	movk	x4, 0x431b, lsl 48
	add	x2, x2, :lo12:.LC157
	ldr	x1, [x19, 16]
	smulh	x4, x3, x4
	adrp	x0, .LC89
	add	x0, x0, :lo12:.LC89
	add	x1, x1, 200
	asr	x4, x4, 18
	sub	x3, x4, x3, asr 63
	bl	_dev_printk
	b	.L386
.L303:
	mov	x24, x1
	b	.L166
.L268:
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 3
	ble	.L185
	mov	x1, x22
	adrp	x2, .LC143
	adrp	x0, .LC97
	add	x2, x2, :lo12:.LC143
	add	x0, x0, :lo12:.LC97
	bl	_dev_printk
	b	.L185
.L394:
	ldr	x0, [sp, 16]
	mov	w2, w23
	adrp	x1, .LC60
	mov	w26, -22
	add	x1, x1, :lo12:.LC60
	bl	_dev_err
	b	.L129
.L412:
	cmp	w0, 2
	bgt	.L443
.L287:
	mov	x1, x27
	mov	w2, 302
	add	x25, x25, 552
	adrp	x0, .LC47
	add	x0, x0, :lo12:.LC47
	bl	_printk
	mov	x0, x25
	bl	down
	ldp	x2, x1, [x19]
	str	x1, [x2, 8]
	mov	x4, 256
	mov	x3, 290
	movk	x4, 0xdead, lsl 48
	movk	x3, 0xdead, lsl 48
	mov	x0, x25
	str	w21, [sp, 96]
	str	x2, [x1]
	stp	x4, x3, [x19]
	bl	up
	ldr	x22, [x19, 16]
	b	.L148
.L409:
	ldr	x1, [x19, 16]
	adrp	x2, .LC149
	adrp	x0, .LC40
	add	x2, x2, :lo12:.LC149
	add	x0, x0, :lo12:.LC40
	add	x1, x1, 200
	bl	_dev_printk
	b	.L278
.L401:
	ldr	x0, [sp, 16]
	adrp	x1, .LC66
	mov	w3, 32768
	add	x1, x1, :lo12:.LC66
	bl	_dev_err
	b	.L144
.L427:
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L190
	adrp	x2, .LC144
	mov	x1, x22
	add	x2, x2, :lo12:.LC144
	adrp	x0, .LC6
.L387:
	mov	w3, w8
	add	x0, x0, :lo12:.LC6
	str	w8, [sp, 16]
	bl	_dev_printk
	ldr	w8, [sp, 16]
	b	.L190
.L410:
	ldr	x0, [sp, 32]
	ldr	x22, [x19, 16]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L179
	adrp	x21, .LC6
	add	x21, x21, :lo12:.LC6
	mov	w3, w8
	add	x1, x22, 200
	mov	x0, x21
	adrp	x2, .LC150
	add	x2, x2, :lo12:.LC150
	str	w8, [sp, 16]
	str	w8, [sp, 96]
	bl	_dev_printk
	ldr	w8, [sp, 16]
	b	.L180
.L424:
	ldr	x1, [sp, 168]
	mov	x4, 13531
	movk	x4, 0xd7b6, lsl 16
	adrp	x2, .LC157
	sub	x3, x0, x1
	movk	x4, 0xde82, lsl 32
	movk	x4, 0x431b, lsl 48
	add	x2, x2, :lo12:.LC157
	ldr	x1, [x19, 16]
	smulh	x4, x3, x4
	adrp	x0, .LC89
	add	x0, x0, :lo12:.LC89
	add	x1, x1, 200
	str	w8, [sp, 16]
	asr	x4, x4, 18
	sub	x3, x4, x3, asr 63
	bl	_dev_printk
	b	.L385
.L429:
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L190
	ldr	x1, [sp, 184]
	adrp	x2, .LC98
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC98
	b	.L387
.L421:
	ldr	x22, [x2, 8]
	add	x22, x1, x22
	b	.L163
.L438:
	ldr	x1, [sp, 24]
	adrp	x2, .LC109
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC109
	add	x0, x0, :lo12:.LC6
	bl	_dev_printk
	b	.L383
.L407:
	ldr	x1, [sp, 184]
	adrp	x2, .LC96
	adrp	x0, .LC97
	add	x2, x2, :lo12:.LC96
	add	x0, x0, :lo12:.LC97
	bl	_dev_printk
	b	.L185
.L212:
	mov	x0, x23
	bl	kfree
.L214:
	add	x28, x28, 1
	mov	x3, 11848
	add	x22, x22, 184
	add	x24, x24, x3
	cmp	x28, 8
	bne	.L216
	ldr	x3, [sp, 80]
	mov	x1, x27
	ldp	x6, x4, [sp, 120]
	mov	w2, 483
	ldr	w0, [sp, 100]
	str	wzr, [x3, -200]
	ldr	x20, [sp, 64]
	add	w21, w0, 1
	adrp	x0, .LC116
	add	x0, x0, :lo12:.LC116
	str	x6, [sp, 24]
	str	x4, [sp, 64]
	bl	_printk
	ldr	x0, [sp, 40]
	mov	w1, w21
	str	wzr, [sp, 112]
	ldr	w0, [x0, 48]
	bl	hailo_pcie_get_loading_stage_info
	ldrb	w10, [x0, 16]
	ldr	x22, [x0]
	ldr	x6, [sp, 24]
	ldr	x4, [sp, 64]
	cbz	w10, .L384
	mov	x2, 7168
	add	x28, x19, x2
	add	x23, x28, 328
	str	x20, [sp, 144]
	mov	x20, x22
	adrp	x0, .LC119
	add	x0, x0, :lo12:.LC119
	str	x28, [sp, 160]
	str	x0, [sp, 192]
	stp	x6, x4, [sp, 232]
	stp	w10, w21, [sp, 248]
	.p2align 3,,7
.L251:
	ldr	x0, [x20]
	str	x0, [sp, 136]
	ldr	w1, [x20, 8]
	str	w1, [sp, 100]
	cbz	x0, .L444
	ldr	x0, [sp, 192]
	mov	x1, x27
	mov	w2, 388
	bl	_printk
	str	xzr, [sp, 256]
	ldr	x1, [sp, 32]
	add	x28, x1, :lo12:o_dbg
	ldr	w0, [x1, #:lo12:o_dbg]
	add	x1, sp, 512
	stp	xzr, xzr, [x1, -248]
	str	xzr, [sp, 280]
	cmp	w0, 4
	bgt	.L445
.L226:
	ldr	x1, [sp, 136]
	add	x0, sp, 256
	ldr	x2, [x19, 4864]
	bl	request_firmware_direct
	mov	w8, w0
	tbnz	w0, #31, .L446
	ldr	x0, [sp, 256]
	ldr	x24, [x0]
	cbz	x24, .L231
	adrp	x0, .LC123
	add	x0, x0, :lo12:.LC123
	str	x0, [sp, 128]
	adrp	x1, .LC122
	ldr	w0, [sp, 248]
	add	x1, x1, :lo12:.LC122
	str	xzr, [sp, 24]
	sub	w0, w0, #1
	str	w0, [sp, 120]
	str	x1, [sp, 176]
	str	x20, [sp, 200]
	b	.L246
	.p2align 2,,3
.L239:
	ldr	w0, [sp, 64]
	mov	w5, w21
	ldr	w2, [x22, 176]
	add	x3, sp, 288
	add	x1, x22, 48
	mov	w7, 0
	lsl	w6, w0, 1
	mov	w4, 1
	ldr	x0, [sp, 56]
	str	w8, [sp, 104]
	bl	hailo_vdma_program_descriptors_list
	ldr	w8, [sp, 104]
	tbnz	w0, #31, .L447
	cmp	w8, w0
	bne	.L448
	ldr	x1, [sp, 24]
	subs	x24, x24, x20
	ldr	w0, [x22, 176]
	add	x1, x1, x20
	str	x1, [sp, 24]
	add	w0, w0, w8
	str	w0, [x22, 176]
	beq	.L449
.L246:
	ldrb	w20, [x23, 1472]
	ldr	w0, [x28]
	mov	x21, x20
	cmp	w0, 6
	bgt	.L450
.L232:
	add	x0, x20, x20, lsl 1
	mov	w1, 65535
	lsl	x0, x0, 3
	sub	x0, x0, x20
	add	x0, x23, x0, lsl 3
	ldr	w0, [x0, 176]
	cmp	w0, w1
	beq	.L233
	mov	w9, 184
	mov	x0, 7496
	umaddl	x9, w9, w21, x0
	add	x22, x19, x9
.L234:
	ldr	w0, [x22, 176]
	mov	w5, 65535
	add	x1, x22, 144
	mov	w2, 1
	sub	w5, w5, w0
	str	x1, [sp, 64]
	str	w2, [sp, 64]
	lsl	w21, w0, 9
	lsl	x5, x5, 9
	mov	x1, 65535
	cmp	x5, x24
	csel	x5, x5, x24, ls
	and	x20, x5, 4294967295
	lsr	w2, w5, 9
	add	x0, x2, w0, uxtw
	cmp	x0, x1
	beq	.L235
	ldr	w0, [sp, 112]
	ldr	w1, [sp, 120]
	str	wzr, [sp, 64]
	cmp	w0, w1
	bne	.L235
	cmp	x20, x24
	cset	w0, eq
	str	w0, [sp, 64]
.L235:
	ldr	x2, [sp, 256]
	str	x5, [sp, 72]
	ldr	x5, [sp, 24]
	uxtw	x4, w21
	ldr	x0, [x22, 144]
	mov	x3, x20
	ldr	w1, [x22, 156]
	ldr	x2, [x2, 8]
	add	x2, x2, x5
	bl	sg_pcopy_from_buffer
	ldr	x5, [sp, 72]
	cmp	x20, x0
	bne	.L451
	ldr	x1, [x19, 16]
	add	x0, x22, 144
	str	x0, [sp, 264]
	mov	w2, 340
	add	x1, x1, 200
	str	x1, [sp, 72]
	ldr	x1, [sp, 280]
	str	x1, [sp, 304]
	add	x1, sp, 512
	str	w5, [sp, 272]
	str	w21, [sp, 276]
	adrp	x0, .LC125
	ldrb	w21, [x23, 1472]
	add	x0, x0, :lo12:.LC125
	ldp	x4, x5, [x1, -248]
	mov	x1, x27
	stp	x4, x5, [sp, 288]
	bl	_printk
	ldr	w2, [sp, 24]
	ldr	w1, [sp, 100]
	ldr	w0, [x28]
	add	w5, w1, w2
	cmp	w0, 6
	bgt	.L452
.L238:
	ldr	x0, [sp, 56]
	uxtw	x1, w5
	ldr	w4, [x22, 176]
	mov	w6, w21
	ldr	w2, [sp, 296]
	add	x3, x22, 120
	ldr	w5, [x22, 128]
	mov	w7, 6
	sub	w5, w5, #1
	bl	hailo_vdma_program_descriptors_in_chunk
	mov	w8, w0
	tbz	w0, #31, .L239
	ldr	x0, [sp, 32]
	ldr	x20, [sp, 144]
	ldr	w0, [x0, #:lo12:o_dbg]
	ldr	x28, [sp, 160]
	cmp	w0, 2
	bgt	.L240
.L249:
	sxtw	x21, w8
.L248:
	ldr	x0, [sp, 256]
	str	w8, [sp, 16]
	bl	release_firmware
	ldr	w8, [sp, 16]
.L230:
	ldr	x23, [sp, 32]
	str	w8, [sp, 16]
	ldr	w0, [x23, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L297
	ldr	x3, [sp, 136]
	adrp	x22, .LC6
	ldr	x1, [x19, 16]
	add	x22, x22, :lo12:.LC6
	mov	x0, x22
	adrp	x2, .LC132
	add	x1, x1, 200
	add	x2, x2, :lo12:.LC132
	bl	_dev_printk
	ldr	w8, [sp, 16]
	ldr	w0, [x23, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L297
	ldr	x1, [x19, 16]
	adrp	x2, .LC133
	add	x2, x2, :lo12:.LC133
	mov	x0, x22
	add	x1, x1, 200
	str	w8, [sp, 16]
	bl	_dev_printk
	ldr	x2, [sp, 152]
	mov	x0, x19
	ldr	x1, [sp, 208]
	bl	pcie_vdme_release_boot_resources
	ldr	w8, [sp, 16]
.L222:
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L190
	ldr	x1, [sp, 184]
	adrp	x2, .LC137
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC137
	b	.L387
	.p2align 2,,3
.L240:
	ldr	x1, [sp, 72]
	adrp	x21, .LC6
	add	x21, x21, :lo12:.LC6
	mov	w3, w8
	mov	x0, x21
	adrp	x2, .LC127
	add	x2, x2, :lo12:.LC127
	str	w8, [sp, 16]
	bl	_dev_printk
	ldr	w8, [sp, 16]
.L242:
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L249
	ldr	x3, [sp, 136]
	mov	x0, x21
	ldrb	w4, [x28, 1800]
	adrp	x2, .LC130
	ldr	x1, [x19, 16]
	add	x2, x2, :lo12:.LC130
	str	w8, [sp, 16]
	add	x1, x1, 200
	bl	_dev_printk
	ldr	w8, [sp, 16]
	b	.L249
	.p2align 2,,3
.L233:
	ldrb	w0, [x23, 1472]
	mov	w1, 1
	mov	x2, 7496
	mov	w9, 184
	add	w0, w0, w1
	and	w0, w0, 255
	strb	w0, [x23, 1472]
	lsl	w1, w1, w0
	umaddl	x9, w9, w0, x2
	ldr	x2, [sp, 48]
	add	x22, x19, x9
	ldrh	w0, [x2, 786]
	orr	w0, w1, w0
	strh	w0, [x2, 786]
	b	.L234
	.p2align 2,,3
.L450:
	add	x3, x20, x20, lsl 1
	mov	w5, w20
	ldr	x0, [sp, 128]
	lsl	x3, x3, 3
	sub	x3, x3, x20
	mov	w4, 512
	ldr	x2, [sp, 176]
	add	x3, x23, x3, lsl 3
	ldr	x1, [x19, 16]
	ldr	w3, [x3, 176]
	add	x1, x1, 200
	bl	_dev_printk
	b	.L232
	.p2align 2,,3
.L452:
	ldr	w0, [x22, 176]
	mov	w3, w21
	ldr	x1, [sp, 72]
	str	w0, [sp]
	ldr	x0, [sp, 128]
	adrp	x2, .LC126
	ldr	x4, [sp, 136]
	add	x2, x2, :lo12:.LC126
	ldr	w7, [sp, 296]
	ldr	w6, [sp, 300]
	str	w5, [sp, 104]
	bl	_dev_printk
	ldr	w5, [sp, 104]
	b	.L238
	.p2align 2,,3
.L447:
	mov	w3, w0
	ldr	x0, [sp, 32]
	ldr	x20, [sp, 144]
	ldr	w0, [x0, #:lo12:o_dbg]
	ldr	x28, [sp, 160]
	cmp	w0, 2
	bgt	.L244
	sxtw	x21, w3
	mov	w8, w3
	b	.L248
	.p2align 2,,3
.L445:
	ldr	x3, [sp, 136]
	adrp	x2, .LC120
	ldr	x1, [x19, 16]
	add	x2, x2, :lo12:.LC120
	adrp	x0, .LC89
	add	x0, x0, :lo12:.LC89
	add	x1, x1, 200
	bl	_dev_printk
	b	.L226
	.p2align 2,,3
.L244:
	ldr	x1, [sp, 72]
	adrp	x21, .LC6
	add	x21, x21, :lo12:.LC6
	adrp	x2, .LC128
	mov	x0, x21
	add	x2, x2, :lo12:.LC128
	str	w3, [sp, 16]
	bl	_dev_printk
	ldr	w8, [sp, 16]
	b	.L242
.L446:
	sxtw	x21, w0
	ldr	x0, [sp, 32]
	ldr	x20, [sp, 144]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L453
.L297:
	ldr	x2, [sp, 152]
	mov	x0, x19
	ldr	x1, [sp, 208]
	str	w21, [sp, 16]
	bl	pcie_vdme_release_boot_resources
	ldr	w8, [sp, 16]
	b	.L222
	.p2align 2,,3
.L449:
	ldr	x20, [sp, 200]
.L231:
	ldr	w0, [x28]
	cmp	w0, 4
	bgt	.L454
.L250:
	ldr	w1, [sp, 112]
	add	x20, x20, 32
	ldr	x0, [sp, 256]
	add	w1, w1, 1
	mov	w21, w1
	str	w1, [sp, 112]
	bl	release_firmware
	ldr	w0, [sp, 248]
	cmp	w21, w0
	bne	.L251
	ldp	x6, x4, [sp, 232]
	ldr	x20, [sp, 144]
	ldr	w21, [sp, 252]
.L384:
	ldr	x22, [x19, 16]
.L225:
	mov	x1, 9112
	mov	x28, x6
	add	x23, x19, x1
	mov	x24, x4
	b	.L254
	.p2align 2,,3
.L253:
	add	x24, x24, 184
	cmp	x23, x24
	beq	.L371
	ldr	x22, [x19, 16]
.L254:
	add	x0, x22, 200
	ldr	x1, [x0, 680]
	tbnz	x1, 38, .L253
	ldr	x1, [x24]
	mov	w3, 1
	ldr	w2, [x24, 12]
	bl	__dma_sync_sg_for_device
	b	.L253
.L451:
	ldr	x0, [sp, 32]
	ldr	x20, [sp, 144]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L455
.L237:
	ldr	x0, [sp, 256]
	mov	w8, -27
	mov	x21, -27
	str	w8, [sp, 16]
	bl	release_firmware
	ldr	w8, [sp, 16]
	b	.L230
.L453:
	ldr	x3, [sp, 136]
	adrp	x2, .LC121
	ldr	x1, [x19, 16]
	add	x2, x2, :lo12:.LC121
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	add	x1, x1, 200
	str	w8, [sp, 16]
	bl	_dev_printk
	ldr	w8, [sp, 16]
	b	.L230
.L454:
	ldr	x3, [sp, 136]
	adrp	x2, .LC131
	ldr	x1, [x19, 16]
	add	x2, x2, :lo12:.LC131
	adrp	x0, .LC89
	add	x0, x0, :lo12:.LC89
	add	x1, x1, 200
	bl	_dev_printk
	b	.L250
.L422:
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L169
	b	.L380
.L455:
	ldr	x3, [sp, 136]
	adrp	x2, .LC124
	ldr	x1, [x19, 16]
	add	x2, x2, :lo12:.LC124
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	add	x1, x1, 200
	bl	_dev_printk
	b	.L237
.L436:
	ldr	x0, [sp, 32]
	ldr	x20, [sp, 64]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L382
	ldr	x1, [sp, 24]
	adrp	x2, .LC108
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC108
	add	x0, x0, :lo12:.LC6
	bl	_dev_printk
	sxtw	x0, w28
	mov	x1, 184
	madd	x0, x0, x1, x19
	ldr	x0, [x0, 7664]
	bl	vfree
	b	.L205
.L371:
	mov	x0, 7672
	add	x23, x19, x0
	ldr	x0, [sp, 32]
	mov	x6, x28
	mov	x24, 0
	mov	x22, 11848
	add	x28, x0, :lo12:o_dbg
	str	x20, [sp, 24]
	mov	x20, x6
	b	.L258
	.p2align 2,,3
.L256:
	add	x24, x24, 1
	add	x23, x23, 184
	add	x20, x20, x22
	cmp	x24, 8
	beq	.L456
.L258:
	ldr	w1, [x23]
	cbz	w1, .L256
	ldr	x0, [x20]
	bl	hailo_vdma_set_num_avail
	ldr	x0, [x20, 8]
	ldrh	w1, [x23]
	bl	hailo_vdma_set_num_avail
	ldr	w0, [x28]
	cmp	w0, 6
	ble	.L256
	ldr	w3, [x23]
	mov	w4, w24
	ldr	x1, [x19, 16]
	adrp	x2, .LC134
	adrp	x0, .LC123
	add	x2, x2, :lo12:.LC134
	add	x0, x0, :lo12:.LC123
	add	x1, x1, 200
	bl	_dev_printk
	b	.L256
.L456:
	ldr	w0, [x19, 96]
	mov	w1, 1
	ldr	x20, [sp, 24]
	bl	hailo_pcie_get_loading_stage_info
	ldr	w22, [x0, 12]
	ldr	x0, [sp, 224]
	mov	x1, x27
	mov	w2, 320
	bl	_printk
	mov	w0, w22
	bl	__msecs_to_jiffies
	mov	x1, x0
	ldr	x0, [sp, 216]
	bl	wait_for_completion_timeout
	cbz	x0, .L457
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 4
	bgt	.L458
.L262:
	ldr	x2, [sp, 80]
	mov	w1, w21
	ldr	x0, [sp, 40]
	str	wzr, [x2, -232]
	bl	hailo_trigger_firmware_boot
	ldr	x2, [sp, 152]
	mov	x0, x19
	ldr	x1, [sp, 208]
	bl	pcie_vdme_release_boot_resources
	b	.L223
.L442:
	ldr	x1, [sp, 24]
	adrp	x2, .LC114
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC114
	add	x0, x0, :lo12:.LC6
	bl	_dev_printk
	b	.L213
.L443:
	ldr	w3, [x19, 24]
	adrp	x2, .LC154
	ldr	x1, [x19, 16]
	add	x2, x2, :lo12:.LC154
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	add	x1, x1, 200
	bl	_dev_printk
	b	.L287
.L425:
	ldr	x1, [sp, 32]
	ldr	w1, [x1, #:lo12:o_dbg]
	cmp	w1, 2
	ble	.L185
	mov	w3, w0
	mov	x1, x22
	adrp	x2, .LC141
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC141
	add	x0, x0, :lo12:.LC6
	bl	_dev_printk
	b	.L185
.L448:
	ldr	x0, [sp, 32]
	mov	x21, -22
	ldr	x20, [sp, 144]
	mov	w8, w21
	ldr	w0, [x0, #:lo12:o_dbg]
	ldr	x28, [sp, 160]
	cmp	w0, 2
	ble	.L248
	ldr	x1, [sp, 72]
	adrp	x21, .LC6
	add	x21, x21, :lo12:.LC6
	adrp	x2, .LC129
	mov	x0, x21
	add	x2, x2, :lo12:.LC129
	str	w8, [sp, 16]
	bl	_dev_printk
	ldr	w8, [sp, 16]
	b	.L242
.L426:
	mov	x1, x22
	adrp	x2, .LC142
	adrp	x0, .LC89
	add	x2, x2, :lo12:.LC142
	add	x0, x0, :lo12:.LC89
	bl	_dev_printk
	b	.L270
.L400:
	ldr	x0, [sp, 16]
	adrp	x1, .LC65
	add	x1, x1, :lo12:.LC65
	bl	_dev_err
	b	.L144
.L309:
	mov	w2, 0
	b	.L284
.L444:
	ldr	x0, [sp, 32]
	ldr	x22, [x19, 16]
	ldr	w0, [x0, #:lo12:o_dbg]
	ldr	x20, [sp, 144]
	ldp	x6, x4, [sp, 232]
	ldr	w21, [sp, 252]
	cmp	w0, 2
	ble	.L225
	add	x1, x22, 200
	mov	w3, w21
	adrp	x2, .LC118
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC118
	add	x0, x0, :lo12:.LC6
	str	x6, [sp, 24]
	str	x4, [sp, 56]
	bl	_dev_printk
	ldr	x22, [x19, 16]
	ldr	x6, [sp, 24]
	ldr	x4, [sp, 56]
	b	.L225
.L441:
	ldr	x0, [sp, 32]
	mov	x5, x3
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L459
.L211:
	mov	x0, x23
	str	x3, [sp, 24]
	str	x5, [sp, 136]
	bl	kfree
	ldr	x0, [x22, 24]
	bl	vfree
	ldr	x3, [sp, 24]
	ldr	x5, [sp, 136]
	tbz	x3, #63, .L214
	ldr	x20, [sp, 64]
	b	.L202
.L457:
	ldr	x0, [sp, 32]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L260
	ldr	x2, [sp, 152]
	mov	x0, x19
	ldr	x1, [sp, 208]
	bl	pcie_vdme_release_boot_resources
	mov	w8, -110
	b	.L222
.L439:
	ldr	x1, [x19, 16]
	adrp	x2, .LC117
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC117
	add	x0, x0, :lo12:.LC6
	add	x1, x1, 200
	str	x5, [sp, 24]
	bl	_dev_printk
	ldr	x5, [sp, 24]
	mov	w8, w5
	tbz	w5, #31, .L223
	b	.L222
.L458:
	ldr	x1, [x19, 16]
	adrp	x2, .LC136
	adrp	x0, .LC89
	add	x2, x2, :lo12:.LC136
	add	x0, x0, :lo12:.LC89
	add	x1, x1, 200
	bl	_dev_printk
	b	.L262
.L434:
	ldr	x0, [sp, 32]
	ldr	x20, [sp, 64]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L194
	ldr	x1, [x19, 16]
	adrp	x2, .LC105
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC105
	add	x0, x0, :lo12:.LC6
	add	x1, x1, 200
	str	x5, [sp, 24]
	bl	_dev_printk
	ldr	x5, [sp, 24]
	b	.L194
.L433:
	ldr	x0, [sp, 32]
	ldr	x20, [sp, 64]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L194
	ldr	x1, [x19, 16]
	adrp	x2, .LC104
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC104
	add	x0, x0, :lo12:.LC6
	add	x1, x1, 200
	str	x5, [sp, 24]
	bl	_dev_printk
	ldr	x5, [sp, 24]
	b	.L194
.L432:
	ldr	x0, [sp, 32]
	ldr	x20, [sp, 64]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L194
	ldr	x1, [x19, 16]
	adrp	x2, .LC103
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC103
	add	x0, x0, :lo12:.LC6
	add	x1, x1, 200
	str	x5, [sp, 24]
	bl	_dev_printk
	ldr	x5, [sp, 24]
	b	.L194
.L431:
	ldr	x0, [sp, 32]
	ldr	x20, [sp, 64]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L194
	ldr	x1, [x19, 16]
	adrp	x2, .LC102
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC102
	add	x0, x0, :lo12:.LC6
	add	x1, x1, 200
	str	x5, [sp, 24]
	bl	_dev_printk
	ldr	x5, [sp, 24]
	b	.L194
.L459:
	ldr	x1, [sp, 24]
	adrp	x2, .LC110
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC110
	add	x0, x0, :lo12:.LC6
	str	x3, [sp, 24]
	str	x3, [sp, 136]
	bl	_dev_printk
	ldr	x3, [sp, 24]
	ldr	x5, [sp, 136]
	b	.L211
.L413:
	bl	__stack_chk_fail
.L392:
	ldr	x0, [sp, 16]
	mov	w2, -12
	adrp	x1, .LC56
	add	x1, x1, :lo12:.LC56
	str	w2, [sp, 96]
	bl	_dev_err
	b	.L122
.L260:
	ldr	x1, [x19, 16]
	adrp	x2, .LC135
	add	x2, x2, :lo12:.LC135
	adrp	x0, .LC6
	add	x1, x1, 200
	add	x0, x0, :lo12:.LC6
	bl	_dev_printk
	ldr	x2, [sp, 152]
	mov	x0, x19
	ldr	x1, [sp, 208]
	bl	pcie_vdme_release_boot_resources
	mov	w8, -110
	b	.L222
.L430:
	ldr	x0, [sp, 40]
	bl	hailo_get_boot_status
	mov	w3, w0
	ldr	x1, [sp, 32]
	ldr	w1, [x1, #:lo12:o_dbg]
	cmp	w1, 2
	bgt	.L189
.L191:
	mov	w8, -110
	b	.L190
.L189:
	ldr	x1, [sp, 184]
	adrp	x2, .LC99
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC99
	add	x0, x0, :lo12:.LC6
	bl	_dev_printk
	mov	w8, -110
	b	.L190
.L440:
	ldr	x0, [sp, 40]
	bl	hailo_get_boot_status
	mov	w3, w0
	ldr	x1, [sp, 32]
	ldr	w1, [x1, #:lo12:o_dbg]
	cmp	w1, 2
	ble	.L191
	ldr	x1, [sp, 184]
	adrp	x2, .LC138
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC138
	add	x0, x0, :lo12:.LC6
	bl	_dev_printk
	mov	w8, -110
	b	.L190
.L420:
	ldr	x0, [sp, 16]
	adrp	x1, .LC81
	add	x1, x1, :lo12:.LC81
	bl	_dev_err
	b	.L160
.L428:
	ldr	x0, [sp, 40]
	bl	hailo_get_boot_status
	mov	w3, w0
	ldr	x1, [sp, 32]
	ldr	w1, [x1, #:lo12:o_dbg]
	cmp	w1, 2
	ble	.L191
	mov	x1, x22
	adrp	x2, .LC145
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC145
	add	x0, x0, :lo12:.LC6
	bl	_dev_printk
	mov	w8, -110
	b	.L190
.L435:
	ldr	x0, [sp, 32]
	ldr	x20, [sp, 64]
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L460
	mov	x5, -12
	b	.L194
.L460:
	ldr	x1, [sp, 24]
	adrp	x2, .LC107
	adrp	x0, .LC6
	add	x2, x2, :lo12:.LC107
	add	x0, x0, :lo12:.LC6
	bl	_dev_printk
	b	.L205
	.size	hailo_pcie_probe, .-hailo_pcie_probe
	.align	2
	.p2align 3,,7
	.global	driver_down
	.type	driver_down, %function
driver_down:
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	adrp	x1, .LC0
	mov	x29, sp
	str	x19, [sp, 16]
	mov	x19, x0
	add	x1, x1, :lo12:.LC0
	mov	w2, 1402
	adrp	x0, .LC27
	add	x0, x0, :lo12:.LC27
	bl	_printk
	ldr	w0, [x19, 100]
	cbnz	w0, .L462
	mov	x0, x19
	bl	hailo_nnc_driver_down
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L462:
	mov	x0, x19
	bl	hailo_soc_driver_down
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.size	driver_down, .-driver_down
	.global	__mod_pci__hailo_pcie_id_table_device_table
	.set	__mod_pci__hailo_pcie_id_table_device_table,hailo_pcie_id_table
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	__func__.5, %object
	.size	__func__.5, 39
__func__.5:
	.string	"pcie_vdma_release_noncontinuous_memory"
	.zero	1
	.type	__func__.4, %object
	.size	__func__.4, 40
__func__.4:
	.string	"pcie_vdma_allocate_noncontinuous_memory"
	.type	__param_str_support_soft_reset, %object
	.size	__param_str_support_soft_reset, 19
__param_str_support_soft_reset:
	.string	"support_soft_reset"
	.zero	5
	.type	__param_str_force_boot_linux_from_eemc, %object
	.size	__param_str_force_boot_linux_from_eemc, 27
__param_str_force_boot_linux_from_eemc:
	.string	"force_boot_linux_from_eemc"
	.zero	5
	.type	__param_str_force_hailo10h_legacy_mode, %object
	.size	__param_str_force_hailo10h_legacy_mode, 27
__param_str_force_hailo10h_legacy_mode:
	.string	"force_hailo10h_legacy_mode"
	.zero	5
	.type	__param_str_force_desc_page_size, %object
	.size	__param_str_force_desc_page_size, 21
__param_str_force_desc_page_size:
	.string	"force_desc_page_size"
	.zero	3
	.type	__param_str_force_allocation_from_driver, %object
	.size	__param_str_force_allocation_from_driver, 29
__param_str_force_allocation_from_driver:
	.string	"force_allocation_from_driver"
	.zero	3
	.type	__param_str_no_power_mode, %object
	.size	__param_str_no_power_mode, 14
__param_str_no_power_mode:
	.string	"no_power_mode"
	.zero	2
	.type	__param_str_o_dbg, %object
	.size	__param_str_o_dbg, 6
__param_str_o_dbg:
	.string	"o_dbg"
	.zero	2
	.type	hailo_pcie_err_handlers, %object
	.size	hailo_pcie_err_handlers, 56
hailo_pcie_err_handlers:
	.zero	24
	.xword	hailo_pci_reset_prepare
	.zero	24
	.type	hailo_pcie_pm_ops, %object
	.size	hailo_pcie_pm_ops, 184
hailo_pcie_pm_ops:
	.zero	184
	.data
	.align	3
	.set	.LANCHOR1,. + 0
	.type	hailo_pcie_fops, %object
	.size	hailo_pcie_fops, 264
hailo_pcie_fops:
	.xword	__this_module
	.zero	72
	.xword	hailo_pcie_fops_unlockedioctl
	.zero	8
	.xword	hailo_pcie_fops_mmap
	.xword	hailo_pcie_fops_open
	.zero	8
	.xword	hailo_pcie_fops_release
	.zero	136
	.type	hailo_pci_driver, %object
	.size	hailo_pci_driver, 280
hailo_pci_driver:
	.xword	.LC16
	.xword	hailo_pcie_id_table
	.xword	hailo_pcie_probe
	.xword	hailo_pcie_remove
	.zero	48
	.xword	hailo_pcie_err_handlers
	.zero	16
	.zero	120
	.xword	hailo_pcie_pm_ops
	.zero	16
	.zero	32
	.type	g_is_power_mode_enabled, %object
	.size	g_is_power_mode_enabled, 1
g_is_power_mode_enabled:
	.byte	1
	.zero	7
	.type	g_hailo_add_board_mutex, %object
	.size	g_hailo_add_board_mutex, 24
g_hailo_add_board_mutex:
	.word	0
	.word	1
	.xword	g_hailo_add_board_mutex+8
	.xword	g_hailo_add_board_mutex+8
	.type	g_hailo_board_list, %object
	.size	g_hailo_board_list, 16
g_hailo_board_list:
	.xword	g_hailo_board_list
	.xword	g_hailo_board_list
	.type	pcie_vdma_controller_ops, %object
	.size	pcie_vdma_controller_ops, 8
pcie_vdma_controller_ops:
	.xword	update_channel_interrupts
	.type	support_soft_reset, %object
	.size	support_soft_reset, 1
support_soft_reset:
	.byte	1
	.zero	7
	.type	hailo_pcie_id_table, %object
	.size	hailo_pcie_id_table, 160
hailo_pcie_id_table:
	.word	7776
	.word	10340
	.word	-1
	.word	-1
	.word	0
	.word	0
	.xword	0
	.zero	8
	.word	7776
	.word	17860
	.word	-1
	.word	-1
	.word	0
	.word	0
	.xword	3
	.zero	8
	.word	7776
	.word	17314
	.word	-1
	.word	-1
	.word	0
	.word	0
	.xword	2
	.zero	8
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.xword	0
	.zero	8
	.bss
	.align	3
	.set	.LANCHOR2,. + 0
	.type	chardev_class, %object
	.size	chardev_class, 8
chardev_class:
	.zero	8
	.type	char_major, %object
	.size	char_major, 4
char_major:
	.zero	4
	.type	force_hailo10h_legacy_mode, %object
	.size	force_hailo10h_legacy_mode, 1
force_hailo10h_legacy_mode:
	.zero	1
	.zero	3
	.type	force_desc_page_size, %object
	.size	force_desc_page_size, 4
force_desc_page_size:
	.zero	4
	.zero	4
	.type	__key.3, %object
	.size	__key.3, 0
__key.3:
	.type	force_allocation_from_driver, %object
	.size	force_allocation_from_driver, 4
force_allocation_from_driver:
	.zero	4
	.type	force_boot_linux_from_eemc, %object
	.size	force_boot_linux_from_eemc, 1
force_boot_linux_from_eemc:
	.zero	1
	.section	.exit.data,"aw"
	.align	3
	.type	__UNIQUE_ID___addressable_cleanup_module585, %object
	.size	__UNIQUE_ID___addressable_cleanup_module585, 8
__UNIQUE_ID___addressable_cleanup_module585:
	.xword	cleanup_module
	.section	.init.data,"aw"
	.align	3
	.type	__UNIQUE_ID___addressable_init_module584, %object
	.size	__UNIQUE_ID___addressable_init_module584, 8
__UNIQUE_ID___addressable_init_module584:
	.xword	init_module
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_version602, %object
	.size	__UNIQUE_ID_version602, 15
__UNIQUE_ID_version602:
	.string	"version=4.20.0"
	.type	__UNIQUE_ID_license601, %object
	.size	__UNIQUE_ID_license601, 15
__UNIQUE_ID_license601:
	.string	"license=GPL v2"
	.type	__UNIQUE_ID_description600, %object
	.size	__UNIQUE_ID_description600, 30
__UNIQUE_ID_description600:
	.string	"description=Hailo PCIe driver"
	.type	__UNIQUE_ID_author599, %object
	.size	__UNIQUE_ID_author599, 31
__UNIQUE_ID_author599:
	.string	"author=Hailo Technologies Ltd."
	.type	__UNIQUE_ID_support_soft_reset598, %object
	.size	__UNIQUE_ID_support_soft_reset598, 79
__UNIQUE_ID_support_soft_reset598:
	.string	"parm=support_soft_reset:enables driver reload to reload a new firmware as well"
	.type	__UNIQUE_ID_support_soft_resettype597, %object
	.size	__UNIQUE_ID_support_soft_resettype597, 33
__UNIQUE_ID_support_soft_resettype597:
	.string	"parmtype=support_soft_reset:bool"
	.type	__UNIQUE_ID_force_boot_linux_from_eemc596, %object
	.size	__UNIQUE_ID_force_boot_linux_from_eemc596, 88
__UNIQUE_ID_force_boot_linux_from_eemc596:
	.string	"parm=force_boot_linux_from_eemc:Boot the linux image from eemc (Requires special Image)"
	.type	__UNIQUE_ID_force_boot_linux_from_eemctype595, %object
	.size	__UNIQUE_ID_force_boot_linux_from_eemctype595, 41
__UNIQUE_ID_force_boot_linux_from_eemctype595:
	.string	"parmtype=force_boot_linux_from_eemc:bool"
	.type	__UNIQUE_ID_force_hailo10h_legacy_mode594, %object
	.size	__UNIQUE_ID_force_hailo10h_legacy_mode594, 97
__UNIQUE_ID_force_hailo10h_legacy_mode594:
	.string	"parm=force_hailo10h_legacy_mode:Forces work with Hailo10h in legacy mode(relevant for emulators)"
	.type	__UNIQUE_ID_force_hailo10h_legacy_modetype593, %object
	.size	__UNIQUE_ID_force_hailo10h_legacy_modetype593, 41
__UNIQUE_ID_force_hailo10h_legacy_modetype593:
	.string	"parmtype=force_hailo10h_legacy_mode:bool"
	.type	__UNIQUE_ID_force_desc_page_size592, %object
	.size	__UNIQUE_ID_force_desc_page_size592, 97
__UNIQUE_ID_force_desc_page_size592:
	.string	"parm=force_desc_page_size:Determines the maximum DMA descriptor page size (must be a power of 2)"
	.type	__UNIQUE_ID_force_desc_page_sizetype591, %object
	.size	__UNIQUE_ID_force_desc_page_sizetype591, 34
__UNIQUE_ID_force_desc_page_sizetype591:
	.string	"parmtype=force_desc_page_size:int"
	.type	__UNIQUE_ID_force_allocation_from_driver590, %object
	.size	__UNIQUE_ID_force_allocation_from_driver590, 105
__UNIQUE_ID_force_allocation_from_driver590:
	.string	"parm=force_allocation_from_driver:Determines whether to force buffer allocation from driver or userspace"
	.type	__UNIQUE_ID_force_allocation_from_drivertype589, %object
	.size	__UNIQUE_ID_force_allocation_from_drivertype589, 42
__UNIQUE_ID_force_allocation_from_drivertype589:
	.string	"parmtype=force_allocation_from_driver:int"
	.type	__UNIQUE_ID_no_power_mode588, %object
	.size	__UNIQUE_ID_no_power_mode588, 63
__UNIQUE_ID_no_power_mode588:
	.string	"parm=no_power_mode:Disables automatic D0->D3 PCIe transactions"
	.type	__UNIQUE_ID_no_power_modetype587, %object
	.size	__UNIQUE_ID_no_power_modetype587, 31
__UNIQUE_ID_no_power_modetype587:
	.string	"parmtype=no_power_mode:invbool"
	.type	__UNIQUE_ID_o_dbgtype586, %object
	.size	__UNIQUE_ID_o_dbgtype586, 19
__UNIQUE_ID_o_dbgtype586:
	.string	"parmtype=o_dbg:int"
	.section	__param,"a"
	.align	3
	.type	__param_support_soft_reset, %object
	.size	__param_support_soft_reset, 40
__param_support_soft_reset:
	.xword	__param_str_support_soft_reset
	.xword	__this_module
	.xword	param_ops_bool
	.hword	292
	.byte	-1
	.byte	0
	.zero	4
	.xword	support_soft_reset
	.type	__param_force_boot_linux_from_eemc, %object
	.size	__param_force_boot_linux_from_eemc, 40
__param_force_boot_linux_from_eemc:
	.xword	__param_str_force_boot_linux_from_eemc
	.xword	__this_module
	.xword	param_ops_bool
	.hword	292
	.byte	-1
	.byte	0
	.zero	4
	.xword	force_boot_linux_from_eemc
	.type	__param_force_hailo10h_legacy_mode, %object
	.size	__param_force_hailo10h_legacy_mode, 40
__param_force_hailo10h_legacy_mode:
	.xword	__param_str_force_hailo10h_legacy_mode
	.xword	__this_module
	.xword	param_ops_bool
	.hword	292
	.byte	-1
	.byte	0
	.zero	4
	.xword	force_hailo10h_legacy_mode
	.type	__param_force_desc_page_size, %object
	.size	__param_force_desc_page_size, 40
__param_force_desc_page_size:
	.xword	__param_str_force_desc_page_size
	.xword	__this_module
	.xword	param_ops_int
	.hword	292
	.byte	-1
	.byte	0
	.zero	4
	.xword	force_desc_page_size
	.type	__param_force_allocation_from_driver, %object
	.size	__param_force_allocation_from_driver, 40
__param_force_allocation_from_driver:
	.xword	__param_str_force_allocation_from_driver
	.xword	__this_module
	.xword	param_ops_int
	.hword	292
	.byte	-1
	.byte	0
	.zero	4
	.xword	force_allocation_from_driver
	.type	__param_no_power_mode, %object
	.size	__param_no_power_mode, 40
__param_no_power_mode:
	.xword	__param_str_no_power_mode
	.xword	__this_module
	.xword	param_ops_invbool
	.hword	292
	.byte	-1
	.byte	0
	.zero	4
	.xword	g_is_power_mode_enabled
	.type	__param_o_dbg, %object
	.size	__param_o_dbg, 40
__param_o_dbg:
	.xword	__param_str_o_dbg
	.xword	__this_module
	.xword	param_ops_int
	.hword	420
	.byte	-1
	.byte	0
	.zero	4
	.xword	o_dbg
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
