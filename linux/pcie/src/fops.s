	.arch armv8-a
	.file	"fops.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC1:
	.string	"/home/sri/hailort-drivers/linux/pcie/src/fops.c"
	.align	3
.LC2:
	.string	"\0016IOCTL_HANDLER: Function hailo_pcie_fops_open called at %s:%d\n"
	.align	3
.LC3:
	.string	"\0013hailo: fops_open: PCIe board not found for /dev/hailo%d node.\n"
	.align	3
.LC4:
	.string	"fops_open down_interruptible fail tgid:%d\n"
	.align	3
.LC5:
	.string	"\0013"
	.align	3
.LC6:
	.string	"Failed to alloc file context (required size %zu)\n"
	.align	3
.LC7:
	.string	"Waking up board change state from %d to PCI_D0\n"
	.align	3
.LC8:
	.string	"\0016"
	.align	3
.LC9:
	.string	"Failed waking up board %d"
	.align	3
.LC10:
	.string	"Device disconnected while opening device\n"
	.align	3
.LC11:
	.string	"Failed Enabling interrupts %d\n"
	.align	3
.LC12:
	.string	"(%d: %d-%d): fops_open: SUCCESS on /dev/hailo%d\n"
	.align	3
.LC13:
	.string	"\0017"
	.align	3
.LC14:
	.string	"Power changing state from %d to %d\n"
	.align	3
.LC15:
	.string	"Failed setting power state back to %d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_fops_open
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_fops_open
	.align	3
	.8byte	.LPFE1
	.text
.LPFE1:
	nop
	nop
	.type	hailo_pcie_fops_open, %function
hailo_pcie_fops_open:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -96]!
	mov	w2, 95
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	stp	x21, x22, [sp, 32]
	mov	x22, x1
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	bl	_printk
	ldr	w25, [x19, 76]
	and	w24, w25, 1048575
	mov	w0, w24
	bl	hailo_pcie_get_board_index
	cbz	x0, .L38
	mov	x19, x0
	str	x19, [x22, 32]
	mov	x0, 4824
	add	x23, x19, x0
	mov	x0, x23
	bl	down_interruptible
	mov	w21, w0
	cbz	w0, .L4
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L39
	mov	w21, -512
	.p2align 3,,7
.L6:
#APP
// 232 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h" 1
	.if 1 == 1
661:
	b	.L30
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
	mov	w0, -1
	add	x1, x19, 28
#APP
// 27 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h" 1
	.arch_extension lse
	stadd	w0, [x1]

// 0 "" 2
#NO_APP
.L1:
	ldp	x19, x20, [sp, 16]
	mov	w0, w21
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L4:
	adrp	x0, kmalloc_caches+56
	mov	x2, 128
	mov	w1, 3520
	ldr	x0, [x0, #:lo12:kmalloc_caches+56]
	bl	__kmalloc_cache_noprof
	mov	x20, x0
	cbz	x0, .L40
	str	x22, [x20, 16]
	add	x0, x0, 24
	bl	hailo_vdma_file_context_init
	mov	x0, x19
	mov	w2, 1
	ldr	x1, [x0, 32]!
	str	x20, [x1, 8]
	stp	x1, x0, [x20]
	str	x20, [x19, 32]
	strb	w2, [x20, 120]
	cmn	x20, #4096
	bhi	.L9
	str	x27, [sp, 80]
	ldr	x0, [x19, 16]
	ldr	w22, [x0, 160]
	cbz	w22, .L12
	adrp	x27, o_dbg
	ldr	w1, [x27, #:lo12:o_dbg]
	cmp	w1, 5
	bgt	.L41
.L13:
	mov	w1, 0
	bl	pci_set_power_state
	mov	w26, w0
	tbnz	w0, #31, .L42
.L12:
	add	x0, x19, 48
	bl	hailo_pcie_is_device_connected
	ands	w26, w0, 255
	beq	.L43
	add	x0, x19, 12288
	ldrb	w0, [x0, 888]
	cbz	w0, .L44
	mov	w26, 0
.L18:
	ldr	w0, [x19, 100]
	mov	x1, x20
	cbnz	w0, .L20
	mov	x0, x19
	bl	hailo_nnc_file_context_init
	mov	w27, w0
.L21:
	tbnz	w27, #31, .L45
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 6
	bgt	.L46
.L25:
	mov	x0, x23
	bl	up
	ldp	x19, x20, [sp, 16]
	mov	w0, w21
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L39:
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x0, sp_el0
// 0 "" 2
#NO_APP
	ldr	w3, [x0, 1420]
	adrp	x2, .LC4
	ldr	x1, [x19, 16]
	add	x2, x2, :lo12:.LC4
	adrp	x0, .LC5
	mov	w21, -512
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L6
	.p2align 2,,3
.L41:
	add	x1, x0, 200
	mov	w3, w22
	adrp	x2, .LC7
	adrp	x0, .LC8
	add	x2, x2, :lo12:.LC7
	add	x0, x0, :lo12:.LC8
	bl	_dev_printk
	ldr	x0, [x19, 16]
	b	.L13
	.p2align 2,,3
.L44:
	mov	x0, x19
	bl	hailo_enable_interrupts
	mov	w27, w0
	tbz	w0, #31, .L18
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L24
	ldr	x1, [x19, 16]
	adrp	x2, .LC11
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC11
	add	x0, x0, :lo12:.LC5
	mov	w3, w27
	add	x1, x1, 200
	bl	_dev_printk
	.p2align 3,,7
.L24:
	mov	w21, w27
	b	.L17
	.p2align 2,,3
.L30:
	mov	w0, 1
	add	x3, x19, 28
#APP
// 96 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h" 1
	// atomic_sub
	prfm	pstl1strm, [x3]
1:	ldxr	w1, [x3]
	sub	w1, w1, w0
	stxr	w2, w1, [x3]
	cbnz	w2, 1b

// 0 "" 2
#NO_APP
	ldp	x19, x20, [sp, 16]
	mov	w0, w21
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L43:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L47
.L16:
	mov	w21, -6
.L17:
	ldr	x0, [x19, 16]
	ldr	w4, [x0, 160]
	cmp	w4, w22
	beq	.L29
	adrp	x27, o_dbg
	ldr	w1, [x27, #:lo12:o_dbg]
	cmp	w1, 5
	bgt	.L48
.L27:
	mov	w1, w22
	bl	pci_set_power_state
	tbnz	w0, #31, .L49
.L29:
	ldp	x2, x1, [x20]
	strb	wzr, [x20, 120]
	str	x1, [x2, 8]
	mov	x4, 256
	mov	x3, 290
	movk	x4, 0xdead, lsl 48
	movk	x3, 0xdead, lsl 48
	mov	x0, x20
	str	x2, [x1]
	stp	x4, x3, [x20]
	bl	kfree
	ldr	x27, [sp, 80]
.L11:
	mov	x0, x23
	bl	up
	b	.L6
	.p2align 2,,3
.L20:
	mov	x0, x19
	bl	hailo_soc_file_context_init
	mov	w27, w0
	b	.L21
	.p2align 2,,3
.L42:
	ldr	w0, [x27, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L50
	mov	w21, w26
	b	.L29
	.p2align 2,,3
.L45:
	cbz	w26, .L24
	mov	x0, x19
	mov	w21, w27
	bl	hailo_disable_interrupts
	b	.L17
	.p2align 2,,3
.L46:
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x0, sp_el0
// 0 "" 2
#NO_APP
	ldr	w3, [x0, 1420]
	lsr	w4, w25, 20
	ldr	x1, [x19, 16]
	mov	w6, w24
	mov	w5, w24
	adrp	x2, .LC12
	add	x1, x1, 200
	add	x2, x2, :lo12:.LC12
	adrp	x0, .LC13
	add	x0, x0, :lo12:.LC13
	bl	_dev_printk
	b	.L25
	.p2align 2,,3
.L47:
	ldr	x1, [x19, 16]
	adrp	x2, .LC10
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC10
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L16
	.p2align 2,,3
.L50:
	ldr	x1, [x19, 16]
	mov	w3, w26
	adrp	x2, .LC9
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC9
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	mov	w21, w26
	bl	_dev_printk
	b	.L29
	.p2align 2,,3
.L49:
	ldr	w0, [x27, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L29
	ldr	x1, [x19, 16]
	mov	w3, w22
	adrp	x2, .LC15
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC15
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L29
.L40:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L51
	mov	x20, -12
	.p2align 3,,7
.L9:
	mov	w21, w20
	b	.L11
	.p2align 2,,3
.L48:
	add	x1, x0, 200
	mov	w3, w22
	adrp	x2, .LC14
	adrp	x0, .LC8
	add	x2, x2, :lo12:.LC14
	add	x0, x0, :lo12:.LC8
	bl	_dev_printk
	ldr	x0, [x19, 16]
	b	.L27
.L38:
	mov	w1, w24
	adrp	x0, .LC3
	mov	w21, -19
	add	x0, x0, :lo12:.LC3
	bl	_printk
	b	.L1
.L51:
	ldr	x1, [x19, 16]
	adrp	x2, .LC6
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC6
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	mov	x3, 128
	mov	x20, -12
	bl	_dev_printk
	b	.L9
	.size	hailo_pcie_fops_open, .-hailo_pcie_fops_open
	.section	.rodata.str1.8
	.align	3
.LC16:
	.string	"\0016IOCTL_HANDLER: Function hailo_pcie_fops_release called at %s:%d\n"
	.align	3
.LC17:
	.string	"(%d: %d-%d): fops_release\n"
	.align	3
.LC18:
	.string	"Invalid driver state, file context does not exist\n"
	.align	3
.LC19:
	.string	"Invalid file context\n"
	.align	3
.LC20:
	.string	"Power change state to PCI_D3hot\n"
	.align	3
.LC21:
	.string	"Failed setting power state to D3hot"
	.align	3
.LC22:
	.string	"fops_release, freed board\n"
	.align	3
.LC23:
	.string	"fops_release, released resources for board\n"
	.align	3
.LC24:
	.string	"(%d: %d-%d): fops_release: SUCCESS on /dev/hailo%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_fops_release
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_fops_open
	.align	3
	.8byte	.LPFE2
	.text
.LPFE2:
	nop
	nop
	.type	hailo_pcie_fops_release, %function
hailo_pcie_fops_release:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -80]!
	mov	w2, 192
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x20, x1
	mov	x19, x0
	adrp	x1, .LC1
	adrp	x0, .LC16
	add	x1, x1, :lo12:.LC1
	add	x0, x0, :lo12:.LC16
	stp	x21, x22, [sp, 32]
	str	x25, [sp, 64]
	bl	_printk
	ldr	x25, [x20, 32]
	ldr	w21, [x19, 76]
	cbz	x25, .L80
	adrp	x22, o_dbg
	stp	x23, x24, [sp, 48]
	lsr	w24, w21, 20
	ldr	w0, [x22, #:lo12:o_dbg]
	and	w21, w21, 1048575
	cmp	w0, 5
	bgt	.L88
.L55:
	mov	x1, 4824
	add	x23, x25, x1
	mov	x0, x23
	bl	down
	mov	x1, x25
	ldr	x19, [x1, 32]!
	cmp	x19, x1
	bne	.L58
	b	.L56
	.p2align 2,,3
.L89:
	ldr	x19, [x19]
	cmp	x19, x1
	beq	.L56
.L58:
	ldr	x0, [x19, 16]
	cmp	x20, x0
	bne	.L89
	cbz	x19, .L56
	ldrb	w0, [x19, 120]
	cbnz	w0, .L61
	ldr	w0, [x22, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L90
.L61:
	ldr	w0, [x25, 100]
	mov	x1, x19
	cbz	w0, .L91
.L62:
	mov	x0, x25
	bl	hailo_soc_file_context_finalize
.L63:
	mov	x0, 4848
	mov	x2, x20
	add	x1, x25, x0
	add	x0, x19, 24
	bl	hailo_vdma_file_context_finalize
	strb	wzr, [x19, 120]
	ldp	x2, x1, [x19]
	str	x1, [x2, 8]
	mov	x4, 256
	mov	x3, 290
	movk	x4, 0xdead, lsl 48
	movk	x3, 0xdead, lsl 48
	mov	x0, x19
	str	x2, [x1]
	stp	x4, x3, [x19]
	bl	kfree
#APP
// 232 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h" 1
	.if 1 == 1
661:
	b	.L64
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
	mov	w0, -1
	add	x1, x25, 28
#APP
// 62 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h" 1
	.arch_extension lse
	ldaddal	w0, w0, [x1]
// 0 "" 2
#NO_APP
	sub	w0, w0, #1
.L65:
	cbnz	w0, .L66
	mov	x0, x25
	bl	hailo_disable_interrupts
	bl	power_mode_enabled
	tst	w0, 255
	ldr	w0, [x22, #:lo12:o_dbg]
	beq	.L68
	cmp	w0, 5
	bgt	.L92
.L69:
	ldr	x0, [x25, 16]
	cbz	x0, .L93
	mov	w1, 3
	bl	pci_set_power_state
	tbnz	w0, #31, .L72
	ldr	w0, [x22, #:lo12:o_dbg]
.L68:
	ldr	x1, [x25, 16]
	cbz	x1, .L71
	cmp	w0, 6
	bgt	.L94
.L66:
	mov	x0, x23
	bl	up
.L77:
	ldr	w0, [x22, #:lo12:o_dbg]
	cmp	w0, 6
	bgt	.L95
	ldp	x23, x24, [sp, 48]
.L80:
	mov	w0, 0
.L52:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L91:
	mov	x0, x25
	bl	hailo_nnc_file_context_finalize
	b	.L63
	.p2align 2,,3
.L88:
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x0, sp_el0
// 0 "" 2
#NO_APP
	ldr	w3, [x0, 1420]
	mov	w5, w21
	ldr	x1, [x25, 16]
	mov	w4, w24
	adrp	x2, .LC17
	adrp	x0, .LC8
	add	x2, x2, :lo12:.LC17
	add	x0, x0, :lo12:.LC8
	add	x1, x1, 200
	bl	_dev_printk
	b	.L55
	.p2align 2,,3
.L64:
	add	x3, x25, 28
	mov	w1, 1
#APP
// 96 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h" 1
	// atomic_sub_return
	prfm	pstl1strm, [x3]
1:	ldxr	w0, [x3]
	sub	w0, w0, w1
	stlxr	w2, w0, [x3]
	cbnz	w2, 1b
	dmb ish
// 0 "" 2
#NO_APP
	b	.L65
	.p2align 2,,3
.L95:
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x0, sp_el0
// 0 "" 2
#NO_APP
	ldr	w3, [x0, 1420]
	mov	w4, w24
	ldr	x1, [x25, 16]
	mov	w6, w21
	mov	w5, w21
	adrp	x2, .LC24
	add	x1, x1, 200
	add	x2, x2, :lo12:.LC24
	adrp	x0, .LC13
	add	x0, x0, :lo12:.LC13
	bl	_dev_printk
	ldp	x23, x24, [sp, 48]
	b	.L80
	.p2align 2,,3
.L90:
	ldr	x1, [x25, 16]
	adrp	x2, .LC19
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC19
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	ldr	w0, [x25, 100]
	mov	x1, x19
	cbnz	w0, .L62
	b	.L91
	.p2align 2,,3
.L94:
	add	x1, x1, 200
	adrp	x2, .LC23
	adrp	x0, .LC13
	add	x2, x2, :lo12:.LC23
	add	x0, x0, :lo12:.LC13
	bl	_dev_printk
	b	.L66
	.p2align 2,,3
.L93:
	ldr	w0, [x22, #:lo12:o_dbg]
.L71:
	cmp	w0, 6
	ble	.L74
	adrp	x2, .LC22
	adrp	x0, .LC13
	add	x2, x2, :lo12:.LC22
	add	x0, x0, :lo12:.LC13
	mov	x1, 200
	bl	_dev_printk
.L74:
	mov	x0, x23
	bl	up
	mov	x0, x25
	mov	x25, 0
	bl	kfree
	b	.L77
.L92:
	ldr	x1, [x25, 16]
	adrp	x2, .LC20
	adrp	x0, .LC8
	add	x2, x2, :lo12:.LC20
	add	x0, x0, :lo12:.LC8
	add	x1, x1, 200
	bl	_dev_printk
	b	.L69
.L72:
	ldr	w0, [x22, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L73
	ldr	x0, [x25, 16]
	cbnz	x0, .L66
	b	.L74
.L73:
	ldr	x1, [x25, 16]
	adrp	x2, .LC21
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC21
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	ldr	w0, [x22, #:lo12:o_dbg]
	b	.L68
	.p2align 2,,3
.L56:
	ldr	w0, [x22, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L96
.L60:
	mov	x0, x23
	bl	up
	ldp	x23, x24, [sp, 48]
	mov	w0, -22
	b	.L52
.L96:
	ldr	x1, [x25, 16]
	adrp	x2, .LC18
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC18
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L60
	.size	hailo_pcie_fops_release, .-hailo_pcie_fops_release
	.section	.rodata.str1.8
	.align	3
.LC25:
	.string	"hailo_irqhandler\n"
	.align	3
.LC26:
	.string	"Device disconnected while handling irq\n"
	.align	3
.LC27:
	.string	"soft reset trigger IRQ\n"
	.align	3
.LC28:
	.string	"boot trigger IRQ\n"
	.align	3
.LC29:
	.string	"boot vDMA data IRQ - channel_bitmap = 0x%x\n"
	.align	3
.LC30:
	.string	"boot vDMA data trigger IRQ\n"
	.align	3
.LC31:
	.string	"Failed reading firmware notification"
	.align	3
.LC32:
	.string	"soc_irq_handler - HAILO_PCIE_SOC_CLOSE_IRQ\n"
	.align	3
.LC33:
	.string	"Invalid accelerator type %d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_irqhandler
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_fops_open
	.align	3
	.8byte	.LPFE3
	.text
.LPFE3:
	nop
	nop
	.type	hailo_irqhandler, %function
hailo_irqhandler:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #96
	mrs	x0, sp_el0
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x21, x22, [sp, 48]
	adrp	x22, o_dbg
	stp	x19, x20, [sp, 32]
	mov	x19, x1
	ldr	w2, [x22, #:lo12:o_dbg]
	stp	x23, x24, [sp, 64]
	str	x25, [sp, 80]
	ldr	x3, [x0, 1424]
	str	x3, [sp, 8]
	mov	x3, 0
	str	xzr, [sp]
	cmp	w2, 6
	bgt	.L148
.L98:
	mov	x5, 4848
	mov	x6, 8984
	add	x21, x19, 48
	add	x23, x19, x5
	add	x24, x19, x6
	mov	x0, x21
	mov	w20, 0
	bl	hailo_pcie_is_device_connected
	tst	w0, 255
	beq	.L149
	.p2align 3,,7
.L100:
	mov	x1, sp
	mov	x0, x21
	bl	hailo_pcie_read_interrupt
	tst	w0, 255
	beq	.L97
	add	x20, x19, 8192
	ldrb	w0, [x20, 784]
	cbnz	w0, .L150
	ldr	w3, [x19, 100]
	cbz	w3, .L151
	cmp	w3, 1
	beq	.L152
	ldr	w0, [x22, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L153
.L115:
	ldr	w2, [sp, 4]
	cbnz	w2, .L154
.L108:
	mov	w20, 1
.L157:
	mov	x0, x21
	bl	hailo_pcie_is_device_connected
	tst	w0, 255
	bne	.L100
.L149:
	ldr	w0, [x22, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L155
.L97:
	mrs	x0, sp_el0
	ldr	x2, [sp, 8]
	ldr	x1, [x0, 1424]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L156
	ldp	x29, x30, [sp, 16]
	mov	w0, w20
	ldp	x19, x20, [sp, 32]
	ldp	x21, x22, [sp, 48]
	ldp	x23, x24, [sp, 64]
	ldr	x25, [sp, 80]
	add	sp, sp, 96
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L154:
	mov	x0, x23
	mov	x1, 0
	mov	w20, 1
	bl	hailo_vdma_irq_handler
	b	.L157
	.p2align 2,,3
.L150:
	ldr	w0, [sp]
	tbnz	x0, 0, .L146
	adrp	x25, o_dbg
	add	x25, x25, :lo12:o_dbg
.L104:
	ldr	w1, [x25]
	tbz	x0, 1, .L106
	cmp	w1, 6
	bgt	.L158
.L107:
	mov	x0, x24
	mov	w20, 1
	bl	complete_all
	b	.L157
	.p2align 2,,3
.L151:
	ldr	w0, [sp]
	tbnz	x0, 2, .L159
	tbnz	x0, 3, .L160
.L113:
	tbz	x0, 1, .L115
.L161:
	add	x25, x19, 1688
	mov	x0, x25
	bl	_raw_spin_lock_irqsave
	add	x1, x19, 1712
	mov	x20, x0
	add	x0, x19, 80
	bl	hailo_pcie_read_firmware_notification
	mov	x1, x20
	mov	w20, w0
	mov	x0, x25
	bl	_raw_spin_unlock_irqrestore
	tbz	w20, #31, .L116
	ldr	w0, [x22, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L115
	ldr	x1, [x19, 16]
	adrp	x2, .LC31
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC31
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L115
	.p2align 2,,3
.L160:
	mov	x2, 4760
	add	x0, x19, x2
	bl	complete
	ldr	w0, [sp]
	tbz	x0, 1, .L115
	b	.L161
	.p2align 2,,3
.L159:
	add	x0, x19, 128
	bl	complete
	ldr	w0, [sp]
	tbz	x0, 3, .L113
	b	.L160
	.p2align 2,,3
.L106:
	ldrh	w0, [x20, 786]
	ldr	w3, [sp, 4]
	bic	w0, w0, w3
	and	w0, w0, 65535
	strh	w0, [x20, 786]
	cmp	w1, 6
	bgt	.L162
	cbnz	w0, .L108
.L166:
	mov	x3, 9016
	add	x0, x19, x3
	bl	complete_all
	ldr	w0, [x25]
	cmp	w0, 6
	ble	.L108
	ldr	x1, [x19, 16]
	adrp	x2, .LC30
	adrp	x0, .LC13
	add	x2, x2, :lo12:.LC30
	add	x0, x0, :lo12:.LC13
	add	x1, x1, 200
	mov	w20, 1
	bl	_dev_printk
	b	.L157
	.p2align 2,,3
.L146:
	ldr	w0, [x22, #:lo12:o_dbg]
	add	x25, x22, :lo12:o_dbg
	cmp	w0, 6
	bgt	.L163
.L105:
	mov	x4, 4792
	add	x0, x19, x4
	bl	complete
	ldr	w0, [sp]
	b	.L104
	.p2align 2,,3
.L153:
	ldr	x1, [x19, 16]
	adrp	x2, .LC33
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC33
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L115
	.p2align 2,,3
.L152:
	ldr	w0, [sp]
	tbnz	x0, 4, .L164
	tbz	x0, 5, .L115
.L167:
	ldr	w0, [x22, #:lo12:o_dbg]
	cmp	w0, 5
	bgt	.L165
.L122:
	ldr	x1, [x19, 4880]
	mov	w2, -1
	mov	x0, 4848
	add	x0, x19, x0
	bl	hailo_vdma_wakeup_interrupts
	b	.L115
	.p2align 2,,3
.L162:
	ldr	x1, [x19, 16]
	adrp	x2, .LC29
	adrp	x0, .LC13
	add	x2, x2, :lo12:.LC29
	add	x0, x0, :lo12:.LC13
	add	x1, x1, 200
	bl	_dev_printk
	ldrh	w0, [x20, 786]
	cbnz	w0, .L108
	b	.L166
	.p2align 2,,3
.L116:
	bl	__rcu_read_lock
	add	x25, x19, 1696
	ldr	x20, [x19, 1696]
	cmp	x20, x25
	beq	.L119
	.p2align 3,,7
.L118:
	add	x0, x20, 32
	bl	complete
	ldr	x20, [x20]
	cmp	x20, x25
	bne	.L118
.L119:
	bl	__rcu_read_unlock
	b	.L115
	.p2align 2,,3
.L164:
	mov	x1, 4728
	add	x0, x19, x1
	bl	complete_all
	ldr	w0, [sp]
	tbz	x0, 5, .L115
	b	.L167
	.p2align 2,,3
.L158:
	ldr	x1, [x19, 16]
	adrp	x2, .LC28
	adrp	x0, .LC13
	add	x2, x2, :lo12:.LC28
	add	x0, x0, :lo12:.LC13
	add	x1, x1, 200
	bl	_dev_printk
	b	.L107
	.p2align 2,,3
.L163:
	ldr	x1, [x19, 16]
	adrp	x2, .LC27
	adrp	x0, .LC13
	add	x2, x2, :lo12:.LC27
	add	x0, x0, :lo12:.LC13
	add	x1, x1, 200
	bl	_dev_printk
	b	.L105
	.p2align 2,,3
.L148:
	ldr	x1, [x1, 16]
	adrp	x2, .LC25
	adrp	x0, .LC13
	add	x2, x2, :lo12:.LC25
	add	x0, x0, :lo12:.LC13
	add	x1, x1, 200
	bl	_dev_printk
	b	.L98
	.p2align 2,,3
.L155:
	ldr	x1, [x19, 16]
	adrp	x2, .LC26
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC26
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L97
	.p2align 2,,3
.L165:
	ldr	x1, [x19, 16]
	adrp	x2, .LC32
	adrp	x0, .LC8
	add	x2, x2, :lo12:.LC32
	add	x0, x0, :lo12:.LC8
	add	x1, x1, 200
	bl	_dev_printk
	b	.L122
.L156:
	bl	__stack_chk_fail
	.size	hailo_irqhandler, .-hailo_irqhandler
	.section	.rodata.str1.8
	.align	3
.LC34:
	.string	"\0016IOCTL_HANDLER: Function hailo_pcie_fops_unlockedioctl called at %s:%d\n"
	.align	3
.LC35:
	.string	"(%d): fops_unlockedioctl. cmd:%d\n"
	.align	3
.LC36:
	.string	"Invalid ioctl parameter access 0x%x"
	.align	3
.LC37:
	.string	"unlockedioctl down_interruptible failed"
	.align	3
.LC38:
	.string	"\0016IOCTL_HANDLER: Function hailo_general_ioctl called at %s:%d\n"
	.align	3
.LC39:
	.string	"\0016IOCTL_HANDLER: Function hailo_memory_transfer_ioctl called at %s:%d\n"
	.align	3
.LC40:
	.string	"Start memory transfer ioctl\n"
	.align	3
.LC41:
	.string	"\0016USER_COPY: About to call copy_from_user from function %s at %s:%d\n"
	.align	3
.LC42:
	.string	"\0016USER_COPY_CONTEXT: Process PID=%d, COMM=%s\n"
	.align	3
.LC43:
	.string	"copy_from_user fail\n"
	.align	3
.LC44:
	.string	"memory transfer failed %ld"
	.align	3
.LC45:
	.string	"\0016USER_COPY: About to call copy_to_user from function %s at %s:%d\n"
	.align	3
.LC46:
	.string	"copy_to_user fail\n"
	.align	3
.LC47:
	.string	"HAILO_QUERY_DEVICE_PROPERTIES: desc_max_page_size=%u\n"
	.align	3
.LC48:
	.string	"HAILO_QUERY_DEVICE_PROPERTIES, copy_to_user failed\n"
	.align	3
.LC49:
	.string	"HAILO_QUERY_DRIVER_INFO: major=%u, minor=%u, revision=%u\n"
	.align	3
.LC50:
	.string	"HAILO_QUERY_DRIVER_INFO, copy_to_user failed\n"
	.align	3
.LC51:
	.string	"Invalid general ioctl code 0x%x (nr: %d)\n"
	.align	3
.LC52:
	.string	"Ioctl %d is not supported on this accelerator type\n"
	.align	3
.LC53:
	.string	"Invalid ioctl type %d\n"
	.align	3
.LC54:
	.string	"(%d): fops_unlockedioct: SUCCESS\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_fops_unlockedioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_fops_open
	.align	3
	.8byte	.LPFE4
	.text
.LPFE4:
	nop
	nop
	.type	hailo_pcie_fops_unlockedioctl, %function
hailo_pcie_fops_unlockedioctl:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #128
	mrs	x4, sp_el0
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	stp	x19, x20, [sp, 48]
	mov	x19, x0
	stp	x21, x22, [sp, 64]
	mov	w21, w1
	mov	x22, x2
	stp	x23, x24, [sp, 80]
	adrp	x23, .LC1
	add	x23, x23, :lo12:.LC1
	ldr	x0, [x4, 1424]
	str	x0, [sp, 24]
	mov	x0, 0
	mov	x1, x23
	adrp	x0, .LC34
	mov	w2, 469
	add	x0, x0, :lo12:.LC34
	bl	_printk
	ldr	x20, [x19, 32]
	mov	w0, 1
	strb	w0, [sp]
	cbz	x20, .L244
	ldr	x1, [x20, 16]
	cbz	x1, .L244
	adrp	x24, o_dbg
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 6
	bgt	.L278
	tbnz	w21, #31, .L277
.L171:
	tbnz	x21, 30, .L277
.L174:
	mov	x5, 4824
	stp	x25, x26, [sp, 96]
	add	x25, x20, x5
	mov	x0, x25
	bl	down_interruptible
	cbnz	w0, .L279
	ldr	w0, [x20, 4828]
	cbnz	w0, .L280
	mov	x0, x20
	ldr	x1, [x0, 32]!
	cmp	x0, x1
	bne	.L185
	b	.L183
	.p2align 2,,3
.L281:
	ldr	x1, [x1]
	cmp	x1, x0
	beq	.L183
.L185:
	ldr	x3, [x1, 16]
	cmp	x19, x3
	bne	.L281
	cbz	x1, .L183
	ldrb	w0, [x1, 120]
	cbz	w0, .L282
	ubfx	x3, x21, 8, 8
	cmp	w3, 115
	beq	.L191
	bhi	.L192
	cmp	w3, 103
	beq	.L193
	cmp	w3, 110
	bne	.L195
	ldr	w0, [x20, 100]
	cbz	w0, .L237
.L274:
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L283
	mov	x19, -22
	.p2align 3,,7
.L207:
	ldrb	w0, [sp]
	cbnz	w0, .L284
.L239:
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 6
	bgt	.L285
.L269:
	ldp	x25, x26, [sp, 96]
.L168:
	mrs	x0, sp_el0
	ldr	x2, [sp, 24]
	ldr	x1, [x0, 1424]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L286
	ldp	x29, x30, [sp, 32]
	mov	x0, x19
	ldp	x19, x20, [sp, 48]
	ldp	x21, x22, [sp, 64]
	ldp	x23, x24, [sp, 80]
	add	sp, sp, 128
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L192:
	cmp	w3, 118
	bne	.L195
	mov	x4, x19
	add	x0, x1, 24
	mov	x3, x22
	mov	w2, w21
	mov	x6, sp
	mov	x5, x25
	mov	x1, 4848
	add	x1, x20, x1
	bl	hailo_vdma_ioctl
	mov	x19, x0
	ldrb	w0, [sp]
	cbz	w0, .L239
	.p2align 3,,7
.L284:
	mov	x0, x25
	bl	up
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 6
	ble	.L269
.L285:
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x0, sp_el0
// 0 "" 2
#NO_APP
	ldr	w3, [x0, 1420]
	adrp	x2, .LC54
	ldr	x1, [x20, 16]
	add	x2, x2, :lo12:.LC54
	adrp	x0, .LC13
	add	x0, x0, :lo12:.LC13
	add	x1, x1, 200
	bl	_dev_printk
	ldp	x25, x26, [sp, 96]
	b	.L168
	.p2align 2,,3
.L278:
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x0, sp_el0
// 0 "" 2
#NO_APP
	ldr	w3, [x0, 1420]
	adrp	x2, .LC35
	adrp	x0, .LC13
	add	x1, x1, 200
	add	x2, x2, :lo12:.LC35
	and	w4, w21, 255
	add	x0, x0, :lo12:.LC13
	bl	_dev_printk
	tbz	w21, #31, .L171
	.p2align 3,,7
.L277:
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x0, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x0, 44]
	ubfx	x2, x21, 16, 14
	tbz	x1, 21, .L287
.L176:
	sbfx	x1, x22, 0, 56
	and	x1, x1, x22
.L177:
	mov	x0, 140737488355328
	sub	x0, x0, x2
	cmp	x1, x0
	bls	.L174
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L178
	mov	x19, -14
	b	.L168
	.p2align 2,,3
.L283:
	ldr	x1, [x20, 16]
	adrp	x2, .LC52
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC52
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	mov	x19, -22
	bl	_dev_printk
	b	.L207
.L237:
	mov	x3, x19
	mov	x2, x22
	mov	w1, w21
	mov	x4, sp
	mov	x0, x20
	bl	hailo_nnc_ioctl
	mov	x19, x0
	b	.L207
	.p2align 2,,3
.L191:
	ldr	w0, [x20, 100]
	cmp	w0, 1
	bne	.L274
	mov	x0, 4848
	mov	x4, x22
	add	x2, x20, x0
	mov	w3, w21
	mov	x0, x20
	bl	hailo_soc_ioctl
	mov	x19, x0
	b	.L207
	.p2align 2,,3
.L193:
	mov	x1, x23
	adrp	x0, .LC38
	mov	w2, 453
	add	x0, x0, :lo12:.LC38
	bl	_printk
	mov	w0, 26369
	movk	w0, 0x4017, lsl 16
	cmp	w21, w0
	beq	.L197
	mov	w0, 26368
	movk	w0, 0xd018, lsl 16
	cmp	w21, w0
	beq	.L198
	mov	w0, 26370
	movk	w0, 0x400c, lsl 16
	cmp	w21, w0
	beq	.L288
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L289
.L234:
	mov	x19, -25
	b	.L207
	.p2align 2,,3
.L195:
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L234
	ldr	x1, [x20, 16]
	adrp	x2, .LC53
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC53
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	mov	x19, -25
	bl	_dev_printk
	b	.L207
	.p2align 2,,3
.L287:
	ldr	x0, [x0]
	mov	x1, x22
	tst	w0, 67108864
	beq	.L177
	b	.L176
	.p2align 2,,3
.L280:
	stp	x27, x28, [sp, 112]
#APP
// 498 "/home/sri/hailort-drivers/linux/pcie/src/fops.c" 1
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "/home/sri/hailort-drivers/linux/pcie/src/fops.c"; .popsection; .long 14472b - .; .short 498; .short 0; .align 2; .popsection; 14471: brk 0x800
// 0 "" 2
#NO_APP
.L289:
	ldr	x1, [x20, 16]
	and	w4, w21, 255
	mov	w3, w21
	adrp	x2, .LC51
	add	x1, x1, 200
	add	x2, x2, :lo12:.LC51
	adrp	x0, .LC5
	mov	x19, -25
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	b	.L207
.L178:
	ldr	x1, [x20, 16]
	mov	w3, w21
	adrp	x2, .LC36
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC36
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	mov	x19, -14
	bl	_dev_printk
	b	.L168
	.p2align 2,,3
.L197:
	ldr	w1, [x20, 13168]
	add	x0, x20, 48
	strh	w1, [sp, 1]
	ldr	w1, [x20, 96]
	str	w1, [sp, 3]
	ldr	w1, [x20, 13172]
	str	w1, [sp, 7]
	str	wzr, [sp, 11]
	ldr	x1, [x20, 4872]
	str	x1, [sp, 15]
	bl	hailo_pcie_is_firmware_loaded
	strb	w0, [sp, 23]
	ldr	w1, [x24, #:lo12:o_dbg]
	cmp	w1, 5
	bgt	.L290
.L217:
	adrp	x1, .LANCHOR0
	add	x1, x1, :lo12:.LANCHOR0
	mov	x2, x23
	add	x1, x1, 32
	mov	w3, 420
	adrp	x0, .LC45
	add	x0, x0, :lo12:.LC45
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x19, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x19, 1416]
	add	x2, x19, 1904
	adrp	x0, .LC42
	add	x0, x0, :lo12:.LC42
	bl	_printk
	ldr	w0, [x19, 44]
	tbz	x0, 21, .L291
.L218:
	sbfx	x0, x22, 0, 56
	and	x0, x0, x22
.L219:
	mov	w1, 4294967273
	movk	x1, 0x7fff, lsl 32
	cmp	x0, x1
	bls	.L220
.L223:
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L292
.L230:
	mov	x19, -12
	b	.L207
.L292:
	ldr	x1, [x20, 16]
	adrp	x2, .LC48
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC48
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	mov	x19, -12
	bl	_dev_printk
	b	.L207
	.p2align 2,,3
.L288:
	adrp	x21, .LANCHOR0
	add	x21, x21, :lo12:.LANCHOR0
	ldr	w0, [x24, #:lo12:o_dbg]
	ldr	x1, [x21, 64]
	str	x1, [sp, 1]
	ldr	w1, [x21, 72]
	str	w1, [sp, 9]
	cmp	w0, 5
	bgt	.L293
.L225:
	mov	x2, x23
	add	x1, x21, 80
	mov	w3, 441
	adrp	x0, .LC45
	add	x0, x0, :lo12:.LC45
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x19, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x19, 1416]
	add	x2, x19, 1904
	adrp	x0, .LC42
	add	x0, x0, :lo12:.LC42
	bl	_printk
	ldr	w0, [x19, 44]
	tbz	x0, 21, .L294
.L226:
	sbfx	x0, x22, 0, 56
	and	x0, x0, x22
.L227:
	mov	w1, 4294967284
	movk	x1, 0x7fff, lsl 32
	cmp	x0, x1
	bls	.L228
.L231:
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L230
	ldr	x1, [x20, 16]
	adrp	x2, .LC50
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC50
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	mov	x19, -12
	bl	_dev_printk
	b	.L207
	.p2align 2,,3
.L198:
	mov	x1, x23
	adrp	x0, .LC39
	mov	w2, 260
	add	x0, x0, :lo12:.LC39
	stp	x27, x28, [sp, 112]
	bl	_printk
	ldr	w0, [x24, #:lo12:o_dbg]
	mov	x4, 9048
	add	x27, x20, x4
	cmp	w0, 6
	bgt	.L295
.L201:
	adrp	x21, .LANCHOR0
	add	x21, x21, :lo12:.LANCHOR0
	mov	x1, x21
	mov	x2, x23
	mov	w3, 266
	adrp	x0, .LC41
	add	x0, x0, :lo12:.LC41
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x19, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x19, 1416]
	adrp	x26, .LC42
	add	x26, x26, :lo12:.LC42
	add	x2, x19, 1904
	mov	x0, x26
	bl	_printk
	ldr	w0, [x19, 44]
	tbz	x0, 21, .L296
.L202:
	sbfx	x0, x22, 0, 56
	and	x0, x0, x22
.L203:
	mov	w1, 4294963176
	movk	x1, 0x7fff, lsl 32
	cmp	x0, x1
	bhi	.L248
	mov	x28, x22
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x22, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 4120
	mov	x0, x27
	bl	__arch_copy_from_user
	mov	x2, x0
	cbnz	x0, .L297
	mov	x1, x27
	add	x0, x20, 48
	bl	hailo_pcie_memory_transfer
	sxtw	x19, w0
	tbnz	x0, 31, .L298
.L209:
	mov	x1, x21
	mov	x2, x23
	mov	w3, 278
	adrp	x0, .LC45
	add	x0, x0, :lo12:.LC45
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x21, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x21, 1416]
	mov	x0, x26
	add	x2, x21, 1904
	bl	_printk
	ldr	w0, [x21, 44]
	tbz	x0, 21, .L299
.L211:
	sbfx	x0, x22, 0, 56
	and	x22, x22, x0
.L212:
	mov	w0, 4294963176
	movk	x0, 0x7fff, lsl 32
	cmp	x22, x0
	bls	.L213
.L216:
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L300
.L210:
	ldp	x27, x28, [sp, 112]
	mov	x19, -12
	b	.L207
.L220:
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x0, x22, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 23
	add	x1, sp, 1
	bl	__arch_copy_to_user
	cbnz	x0, .L223
	mov	x19, 0
	b	.L207
.L248:
	mov	x2, 4120
.L204:
	mov	x0, x27
	mov	w1, 0
	bl	memset
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L210
	ldr	x1, [x20, 16]
	adrp	x2, .LC43
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC43
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L210
	.p2align 2,,3
.L228:
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x0, x22, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 12
	add	x1, sp, 1
	bl	__arch_copy_to_user
	cbnz	x0, .L231
	mov	x19, 0
	b	.L207
.L213:
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x0, x28, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 4120
	mov	x1, x27
	bl	__arch_copy_to_user
	cbnz	x0, .L216
	ldp	x27, x28, [sp, 112]
	b	.L207
.L298:
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L209
	ldr	x1, [x20, 16]
	mov	x3, x19
	adrp	x2, .LC44
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC44
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L209
.L299:
	ldr	x0, [x21]
	tst	w0, 67108864
	beq	.L212
	b	.L211
.L290:
	ldrh	w3, [sp, 1]
	adrp	x2, .LC47
	ldr	x1, [x20, 16]
	add	x2, x2, :lo12:.LC47
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	add	x1, x1, 200
	bl	_dev_printk
	b	.L217
.L291:
	ldr	x1, [x19]
	mov	x0, x22
	tst	w1, 67108864
	beq	.L219
	b	.L218
.L296:
	ldr	x1, [x19]
	mov	x0, x22
	tst	w1, 67108864
	beq	.L203
	b	.L202
.L295:
	ldr	x1, [x20, 16]
	adrp	x2, .LC40
	adrp	x0, .LC13
	add	x2, x2, :lo12:.LC40
	add	x0, x0, :lo12:.LC13
	add	x1, x1, 200
	bl	_dev_printk
	b	.L201
.L294:
	ldr	x1, [x19]
	mov	x0, x22
	tst	w1, 67108864
	beq	.L227
	b	.L226
.L293:
	ldr	x1, [x20, 16]
	adrp	x2, .LC49
	adrp	x0, .LC8
	add	x2, x2, :lo12:.LC49
	add	x0, x0, :lo12:.LC8
	add	x1, x1, 200
	mov	w5, 0
	mov	w4, 20
	mov	w3, 4
	bl	_dev_printk
	b	.L225
.L279:
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L301
.L181:
	ldp	x25, x26, [sp, 96]
	mov	x19, -512
	b	.L168
.L282:
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L302
.L190:
	mov	x0, x25
	mov	x19, -22
	bl	up
	ldp	x25, x26, [sp, 96]
	b	.L168
.L244:
	mov	x19, -19
	b	.L168
	.p2align 2,,3
.L183:
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L190
	ldr	x1, [x20, 16]
	adrp	x2, .LC18
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC18
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L190
.L301:
	ldr	x1, [x20, 16]
	adrp	x2, .LC37
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC37
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L181
.L302:
	ldr	x1, [x20, 16]
	adrp	x2, .LC19
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC19
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L190
.L297:
	sub	x27, x27, x0
	mov	x3, 4120
	add	x27, x27, x3
	b	.L204
.L286:
	stp	x25, x26, [sp, 96]
	stp	x27, x28, [sp, 112]
	bl	__stack_chk_fail
.L300:
	ldr	x1, [x20, 16]
	adrp	x2, .LC46
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC46
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L210
	.size	hailo_pcie_fops_unlockedioctl, .-hailo_pcie_fops_unlockedioctl
	.section	.rodata.str1.8
	.align	3
.LC55:
	.string	"%d fops_mmap\n"
	.align	3
.LC56:
	.string	"hailo_pcie_fops_mmap down_interruptible fail tgid:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_pcie_fops_mmap
	.section	__patchable_function_entries,"awo",@progbits,hailo_pcie_fops_open
	.align	3
	.8byte	.LPFE5
	.text
.LPFE5:
	nop
	nop
	.type	hailo_pcie_fops_mmap, %function
hailo_pcie_fops_mmap:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	stp	x21, x22, [sp, 32]
	mov	x21, x1
	stp	x23, x24, [sp, 48]
	adrp	x24, o_dbg
	ldr	x22, [x1, 120]
	ldr	w0, [x24, #:lo12:o_dbg]
	ldr	x20, [x19, 32]
	str	xzr, [x1, 120]
	lsl	x22, x22, 14
	cmp	w0, 5
	bgt	.L321
.L304:
	cbz	x20, .L318
	ldr	x0, [x20, 16]
	cbz	x0, .L318
	mov	x1, 4824
	add	x23, x20, x1
	mov	x0, x23
	bl	down_interruptible
	cbnz	w0, .L322
	mov	x0, x20
	ldr	x4, [x0, 32]!
	cmp	x0, x4
	bne	.L311
	b	.L309
	.p2align 2,,3
.L323:
	ldr	x4, [x4]
	cmp	x0, x4
	beq	.L309
.L311:
	ldr	x3, [x4, 16]
	cmp	x19, x3
	bne	.L323
	cbz	x4, .L309
	ldrb	w0, [x4, 120]
	cbz	w0, .L324
	mov	x0, 4848
	mov	x3, x22
	add	x1, x20, x0
	mov	x2, x21
	add	x0, x4, 24
	bl	hailo_vdma_mmap
	mov	w19, w0
	mov	x0, x23
	bl	up
.L303:
	ldp	x21, x22, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L321:
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x0, sp_el0
// 0 "" 2
#NO_APP
	ldr	w3, [x0, 1420]
	adrp	x2, .LC55
	ldr	x1, [x20, 16]
	add	x2, x2, :lo12:.LC55
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	add	x1, x1, 200
	bl	_dev_printk
	b	.L304
.L318:
	mov	w19, -19
	b	.L303
.L322:
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L307
	mov	w19, -512
	b	.L303
.L307:
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x0, sp_el0
// 0 "" 2
#NO_APP
	ldr	w3, [x0, 1420]
	adrp	x2, .LC56
	ldr	x1, [x20, 16]
	add	x2, x2, :lo12:.LC56
	adrp	x0, .LC5
	mov	w19, -512
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L303
.L324:
	mov	x0, x23
	bl	up
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L325
.L314:
	mov	w19, -22
	b	.L303
	.p2align 2,,3
.L325:
	ldr	x1, [x20, 16]
	adrp	x2, .LC19
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC19
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	mov	w19, -22
	bl	_dev_printk
	b	.L303
	.p2align 2,,3
.L309:
	mov	x0, x23
	bl	up
	ldr	w0, [x24, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L314
	ldr	x1, [x20, 16]
	adrp	x2, .LC18
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC18
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	mov	w19, -22
	bl	_dev_printk
	b	.L303
	.size	hailo_pcie_fops_mmap, .-hailo_pcie_fops_mmap
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	__func__.2, %object
	.size	__func__.2, 28
__func__.2:
	.string	"hailo_memory_transfer_ioctl"
	.zero	4
	.type	__func__.1, %object
	.size	__func__.1, 30
__func__.1:
	.string	"hailo_query_device_properties"
	.zero	2
.LC0:
	.word	4
	.word	20
	.word	0
	.zero	4
	.type	__func__.0, %object
	.size	__func__.0, 24
__func__.0:
	.string	"hailo_query_driver_info"
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
