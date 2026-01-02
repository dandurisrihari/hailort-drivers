	.arch armv8-a
	.file	"vdma.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"/home/sri/hailort-drivers/linux/pcie/../vdma/vdma.c"
	.align	3
.LC1:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_controller_init at %s:%d\n"
	.align	3
.LC2:
	.string	"\0016FUNC_ENTRY: Entering function init_vdma_engines at %s:%d\n"
	.align	3
.LC3:
	.string	"Failed allocating vdma engines\n"
	.align	3
.LC4:
	.string	"Failed initialized vdma engines\n"
	.align	3
.LC5:
	.string	"&controller->interrupts_wq"
	.align	3
.LC6:
	.string	"\0016FUNC_ENTRY: Entering function hailo_set_dma_mask at %s:%d\n"
	.align	3
.LC7:
	.string	"Probing: Enabled 64 bit dma\n"
	.align	3
.LC8:
	.string	"Probing: Enabled 48 bit dma\n"
	.align	3
.LC9:
	.string	"Probing: Enabled 40 bit dma\n"
	.align	3
.LC10:
	.string	"Probing: Enabled 36 bit dma\n"
	.align	3
.LC11:
	.string	"Probing: Enabled 32 bit dma\n"
	.align	3
.LC12:
	.string	"Probing: Error enabling dma %d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_controller_init
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_controller_init
	.align	3
	.8byte	.LPFE1
	.text
.LPFE1:
	nop
	nop
	.type	hailo_vdma_controller_init, %function
hailo_vdma_controller_init:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -96]!
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x21, x3
	stp	x19, x20, [sp, 16]
	mov	x19, x2
	mov	x20, x5
	stp	x27, x28, [sp, 80]
	adrp	x27, .LC0
	add	x27, x27, :lo12:.LC0
	mov	w2, 78
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	stp	x23, x24, [sp, 48]
	mov	x23, x4
	mov	x24, 51472
	stp	x25, x26, [sp, 64]
	mov	x25, x1
	mov	x1, x27
	bl	_printk
	stp	x19, x21, [x22]
	movk	x24, 0x5, lsl 16
	mov	x1, x27
	stp	x25, x20, [x22, 16]
	adrp	x0, .LC2
	mov	w2, 33
	ldr	w26, [x19, 32]
	add	x0, x0, :lo12:.LC2
	bl	_printk
	umulh	x0, x20, x24
	mul	x1, x20, x24
	cmp	x0, 0
	bne	.L4
	cset	x19, ne
	mov	x0, x25
	mov	w2, 3264
	bl	devm_kmalloc
	mov	x21, x0
	cbz	x0, .L4
	mov	w28, 0
	cbz	x20, .L8
	.p2align 3,,7
.L5:
	madd	x0, x19, x24, x21
	add	x2, x23, x19, lsl 4
	mov	w1, w28
	mov	w3, w26
	bl	hailo_vdma_engine_init
	add	w2, w28, 1
	and	w28, w2, 255
	and	x19, x2, 255
	cmp	x20, w2, uxtb
	bhi	.L5
.L8:
	str	x21, [x22, 32]
	cmn	x21, #4096
	bhi	.L6
	str	wzr, [x22, 40]
	add	x0, x22, 48
	str	xzr, [x22, 72]
	adrp	x2, .LANCHOR0
	adrp	x1, .LC5
	add	x2, x2, :lo12:.LANCHOR0
	add	x1, x1, :lo12:.LC5
	bl	__init_waitqueue_head
	mov	w2, 52
	mov	x1, x27
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	_printk
	mov	x0, x25
	mov	x1, -1
	bl	dma_set_mask
	cbz	w0, .L28
	mov	x0, x25
	mov	x1, 281474976710655
	bl	dma_set_mask
	cbz	w0, .L29
	mov	x0, x25
	mov	x1, 1099511627775
	bl	dma_set_mask
	cbz	w0, .L30
	mov	x0, x25
	mov	x1, 68719476735
	bl	dma_set_mask
	cbz	w0, .L31
	mov	x0, x25
	mov	x1, 4294967295
	bl	dma_set_mask
	mov	w19, w0
	cbz	w0, .L32
	mov	x0, x25
	mov	w2, w19
	adrp	x1, .LC12
	add	x1, x1, :lo12:.LC12
	bl	_dev_err
	cmp	w19, 0
	csel	w0, w19, wzr, le
	b	.L1
	.p2align 2,,3
.L29:
	mov	x1, 281474976710655
	mov	x0, x25
	bl	dma_set_coherent_mask
	adrp	x1, .LC8
	mov	x0, x25
	add	x1, x1, :lo12:.LC8
	bl	_dev_notice
.L11:
	mov	w0, 0
.L1:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L28:
	mov	x0, x25
	mov	x1, -1
	bl	dma_set_coherent_mask
	mov	x0, x25
	adrp	x1, .LC7
	add	x1, x1, :lo12:.LC7
	bl	_dev_notice
	b	.L11
.L31:
	mov	x0, x25
	mov	x1, 68719476735
	bl	dma_set_coherent_mask
	mov	x0, x25
	adrp	x1, .LC10
	add	x1, x1, :lo12:.LC10
	bl	_dev_notice
	b	.L11
	.p2align 2,,3
.L30:
	mov	x0, x25
	mov	x1, 1099511627775
	bl	dma_set_coherent_mask
	mov	x0, x25
	adrp	x1, .LC9
	add	x1, x1, :lo12:.LC9
	bl	_dev_notice
	b	.L11
	.p2align 2,,3
.L4:
	mov	x0, x25
	adrp	x1, .LC3
	add	x1, x1, :lo12:.LC3
	bl	_dev_err
	mov	x0, -12
	str	x0, [x22, 32]
.L6:
	mov	x0, x25
	adrp	x1, .LC4
	add	x1, x1, :lo12:.LC4
	bl	_dev_err
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldr	w0, [x22, 32]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	hint	29 // autiasp
	ret
.L32:
	mov	x0, x25
	mov	x1, 4294967295
	bl	dma_set_coherent_mask
	mov	x0, x25
	adrp	x1, .LC11
	add	x1, x1, :lo12:.LC11
	bl	_dev_notice
	b	.L11
	.size	hailo_vdma_controller_init, .-hailo_vdma_controller_init
	.section	.rodata.str1.8
	.align	3
.LC13:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_file_context_init at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_file_context_init
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_controller_init
	.align	3
	.8byte	.LPFE2
	.text
.LPFE2:
	nop
	nop
	.type	hailo_vdma_file_context_init, %function
hailo_vdma_file_context_init:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	mov	w2, 111
	mov	x29, sp
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
	str	x19, [sp, 16]
	mov	x19, x0
	adrp	x0, .LC13
	add	x0, x0, :lo12:.LC13
	bl	_printk
	mov	x0, x19
	add	x3, x19, 32
	add	x2, x19, 48
	add	x1, x19, 64
	str	wzr, [x0], 8
	str	x0, [x19, 8]
	str	x0, [x19, 16]
	str	wzr, [x19, 24]
	str	x3, [x19, 32]
	str	x3, [x19, 40]
	str	x2, [x19, 48]
	str	x2, [x19, 56]
	str	x1, [x19, 64]
	str	x1, [x19, 72]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.size	hailo_vdma_file_context_init, .-hailo_vdma_file_context_init
	.section	.rodata.str1.8
	.align	3
.LC14:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_update_interrupts_mask at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_update_interrupts_mask
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_controller_init
	.align	3
	.8byte	.LPFE3
	.text
.LPFE3:
	nop
	nop
	.type	hailo_vdma_update_interrupts_mask, %function
hailo_vdma_update_interrupts_mask:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	mov	w2, 127
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x19, x1
	adrp	x0, .LC14
	adrp	x1, .LC0
	add	x0, x0, :lo12:.LC14
	add	x1, x1, :lo12:.LC0
	bl	_printk
	ldr	x0, [x20, 32]
	mov	x3, 51472
	movk	x3, 0x5, lsl 16
	mov	x1, x19
	ldr	x2, [x20, 8]
	madd	x19, x19, x3, x0
	mov	x0, x20
	ldr	x3, [x2]
	ldr	w2, [x19, 4]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.size	hailo_vdma_update_interrupts_mask, .-hailo_vdma_update_interrupts_mask
	.section	.rodata.str1.8
	.align	3
.LC15:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_file_context_finalize at %s:%d\n"
	.align	3
.LC16:
	.string	"Disabling channels for engine %zu, channels bitmap 0x%x\n"
	.align	3
.LC17:
	.string	"\0016"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_file_context_finalize
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_controller_init
	.align	3
	.8byte	.LPFE4
	.text
.LPFE4:
	nop
	nop
	.type	hailo_vdma_file_context_finalize, %function
hailo_vdma_file_context_finalize:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -128]!
	mov	x29, sp
	stp	x25, x26, [sp, 64]
	mov	x25, x1
	stp	x23, x24, [sp, 48]
	adrp	x24, .LC0
	add	x24, x24, :lo12:.LC0
	mov	x1, x24
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	adrp	x0, .LC15
	add	x0, x0, :lo12:.LC15
	str	x2, [sp, 120]
	mov	w2, 135
	bl	_printk
	ldr	x0, [x25, 24]
	cbz	x0, .L45
	stp	x21, x22, [sp, 32]
	adrp	x26, .LC14
	add	x23, x19, 80
	stp	x27, x28, [sp, 80]
	adrp	x27, o_dbg
	mov	x28, 51472
	ldr	x1, [x25, 32]
	add	x27, x27, :lo12:o_dbg
	ldr	x2, [x25, 16]
	mov	x20, x1
	movk	x28, 0x5, lsl 16
	str	x2, [sp, 104]
	add	x2, x26, :lo12:.LC14
	mov	x26, 0
	str	x2, [sp, 112]
.L44:
	ldr	w4, [x23, x26, lsl 2]
	add	x21, x25, 40
	cbz	w4, .L41
	ldr	w0, [x27]
	cmp	w0, 5
	bgt	.L54
.L42:
	mov	x0, x20
	mov	w1, w4
	bl	hailo_vdma_engine_disable_channels
	ldp	x3, x0, [sp, 104]
	mov	x1, x24
	mov	w2, 127
	cbz	x3, .L43
	bl	_printk
	ldr	x2, [x25, 32]
	mov	x1, x26
	ldr	x4, [x25, 8]
	add	x2, x2, x28
	sub	x2, x2, #376832
	mov	x0, x25
	sub	x2, x2, #2048
	sub	x2, x2, #272
	ldr	x4, [x4]
	ldr	w2, [x2, 4]
	blr	x4
.L43:
	mov	x0, x21
	bl	_raw_spin_lock_irqsave
	ldr	w1, [x23, x26, lsl 2]
	mov	x22, x0
	mov	x0, x20
	bl	hailo_vdma_engine_clear_channel_interrupts
	mov	x1, x22
	mov	x0, x21
	bl	_raw_spin_unlock_irqrestore
	ldp	x0, x1, [x25, 24]
.L41:
	add	x20, x1, x28
	add	x26, x26, 1
	add	x28, x28, 376832
	add	x28, x28, 2320
	cmp	x0, x26
	bhi	.L44
	ldp	x21, x22, [sp, 32]
	ldp	x27, x28, [sp, 80]
.L45:
	mov	x1, x25
	mov	x0, x19
	bl	hailo_vdma_clear_mapped_user_buffer_list
	mov	x1, x25
	mov	x0, x19
	bl	hailo_vdma_clear_descriptors_buffer_list
	mov	x0, x19
	bl	hailo_vdma_clear_low_memory_buffer_list
	mov	x1, x25
	mov	x0, x19
	bl	hailo_vdma_clear_continuous_buffer_list
	ldr	x0, [x25, 72]
	ldr	x1, [sp, 120]
	cmp	x0, x1
	beq	.L55
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 128
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L54:
	ldr	x1, [x25, 16]
	mov	x3, x26
	adrp	x2, .LC16
	adrp	x0, .LC17
	add	x2, x2, :lo12:.LC16
	add	x0, x0, :lo12:.LC17
	bl	_dev_printk
	ldr	w4, [x23, x26, lsl 2]
	b	.L42
	.p2align 2,,3
.L55:
	str	xzr, [x25, 72]
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 128
	hint	29 // autiasp
	ret
	.size	hailo_vdma_file_context_finalize, .-hailo_vdma_file_context_finalize
	.section	.rodata.str1.8
	.align	3
.LC18:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_wakeup_interrupts at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_wakeup_interrupts
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_controller_init
	.align	3
	.8byte	.LPFE5
	.text
.LPFE5:
	nop
	nop
	.type	hailo_vdma_wakeup_interrupts, %function
hailo_vdma_wakeup_interrupts:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	mov	x21, x1
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
	mov	w22, w2
	mov	w2, 171
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	adrp	x0, .LC18
	add	x0, x0, :lo12:.LC18
	str	x23, [sp, 48]
	bl	_printk
	add	x23, x19, 40
	mov	x0, x23
	bl	_raw_spin_lock_irqsave
	mov	w1, w22
	mov	x20, x0
	mov	x0, x21
	bl	hailo_vdma_engine_set_channel_interrupts
	mov	x1, x20
	mov	x0, x23
	bl	_raw_spin_unlock_irqrestore
	add	x0, x19, 48
	mov	x3, 0
	mov	w2, 0
	mov	w1, 1
	bl	__wake_up
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	hint	29 // autiasp
	ret
	.size	hailo_vdma_wakeup_interrupts, .-hailo_vdma_wakeup_interrupts
	.section	.rodata.str1.8
	.align	3
.LC19:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_irq_handler at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_irq_handler
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_controller_init
	.align	3
	.8byte	.LPFE6
	.text
.LPFE6:
	nop
	nop
	.type	hailo_vdma_irq_handler, %function
hailo_vdma_irq_handler:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x19, x1
	stp	x21, x22, [sp, 32]
	adrp	x21, .LC0
	add	x21, x21, :lo12:.LC0
	mov	w22, w2
	mov	x1, x21
	adrp	x0, .LC19
	mov	w2, 184
	add	x0, x0, :lo12:.LC19
	str	x23, [sp, 48]
	bl	_printk
	ldr	x0, [x20, 24]
	cmp	x0, x19
	bls	.L61
	ldr	x0, [x20, 32]
	mov	x2, 51472
	movk	x2, 0x5, lsl 16
	mov	w1, w22
	add	x23, x20, 40
	madd	x19, x19, x2, x0
	mov	x0, x19
	bl	hailo_vdma_engine_push_timestamps
	mov	x1, x21
	mov	w2, 171
	adrp	x0, .LC18
	add	x0, x0, :lo12:.LC18
	bl	_printk
	mov	x0, x23
	bl	_raw_spin_lock_irqsave
	mov	x2, x0
	mov	w1, w22
	mov	x0, x19
	mov	x19, x2
	bl	hailo_vdma_engine_set_channel_interrupts
	mov	x1, x19
	mov	x0, x23
	bl	_raw_spin_unlock_irqrestore
	add	x0, x20, 48
	mov	x3, 0
	mov	w2, 0
	mov	w1, 1
	bl	__wake_up
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L61:
#APP
// 187 "/home/sri/hailort-drivers/linux/pcie/../vdma/vdma.c" 1
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "/home/sri/hailort-drivers/linux/pcie/../vdma/vdma.c"; .popsection; .long 14472b - .; .short 187; .short 0; .align 2; .popsection; 14471: brk 0x800
// 0 "" 2
#NO_APP
	.size	hailo_vdma_irq_handler, .-hailo_vdma_irq_handler
	.section	.rodata.str1.8
	.align	3
.LC20:
	.string	"\0016IOCTL_HANDLER: Function hailo_vdma_ioctl called at %s:%d\n"
	.align	3
.LC21:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_ioctl at %s:%d\n"
	.align	3
.LC22:
	.string	"Invalid vDMA ioctl code 0x%x (nr: %d)\n"
	.align	3
.LC23:
	.string	"\0013"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_ioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_controller_init
	.align	3
	.8byte	.LPFE7
	.text
.LPFE7:
	nop
	nop
	.type	hailo_vdma_ioctl, %function
hailo_vdma_ioctl:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -80]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	adrp	x20, .LC0
	add	x20, x20, :lo12:.LC0
	mov	w19, w2
	mov	w2, 198
	stp	x21, x22, [sp, 32]
	mov	x22, x3
	mov	x21, x1
	mov	x1, x20
	stp	x23, x24, [sp, 48]
	mov	x24, x4
	mov	x23, x0
	adrp	x0, .LC20
	add	x0, x0, :lo12:.LC20
	stp	x25, x26, [sp, 64]
	mov	x25, x5
	mov	x26, x6
	bl	_printk
	mov	x1, x20
	adrp	x0, .LC21
	mov	w2, 199
	add	x0, x0, :lo12:.LC21
	bl	_printk
	mov	w0, 30217
	movk	w0, 0x802b, lsl 16
	cmp	w19, w0
	beq	.L63
	bhi	.L64
	mov	w0, 30222
	movk	w0, 0x8008, lsl 16
	cmp	w19, w0
	beq	.L65
	bls	.L88
	mov	w0, 30208
	movk	w0, 0x800d, lsl 16
	cmp	w19, w0
	beq	.L73
	mov	w0, 30214
	movk	w0, 0x801c, lsl 16
	cmp	w19, w0
	bne	.L89
	mov	x2, x22
	mov	x1, x21
	mov	x0, x23
	bl	hailo_vdma_buffer_sync_ioctl
.L62:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L64:
	mov	w0, 30212
	movk	w0, 0xc028, lsl 16
	cmp	w19, w0
	beq	.L76
	bls	.L90
	mov	w0, 30210
	movk	w0, 0xc2ad, lsl 16
	cmp	w19, w0
	beq	.L81
	mov	w0, 30211
	movk	w0, 0xca06, lsl 16
	cmp	w19, w0
	bne	.L91
	mov	x1, x22
	mov	x0, x21
	bl	hailo_vdma_interrupts_read_timestamps_ioctl
	b	.L62
	.p2align 2,,3
.L89:
	mov	w0, 30209
	movk	w0, 0x800c, lsl 16
	cmp	w19, w0
	bne	.L71
	mov	x2, x23
	mov	x1, x22
	mov	x0, x21
	bl	hailo_vdma_disable_channels_ioctl
	b	.L62
	.p2align 2,,3
.L88:
	sub	w0, w0, #6
	cmp	w19, w0
	beq	.L67
	bls	.L92
	mov	w0, 30219
	movk	w0, 0x8008, lsl 16
	cmp	w19, w0
	bne	.L71
	mov	x2, x22
	mov	x1, x21
	mov	x0, x23
	bl	hailo_vdma_low_memory_buffer_free_ioctl
	b	.L62
	.p2align 2,,3
.L91:
	mov	w0, 30223
	movk	w0, 0xc041, lsl 16
	cmp	w19, w0
	bne	.L71
	mov	x2, x22
	mov	x1, x21
	mov	x0, x23
	bl	hailo_vdma_launch_transfer_ioctl
	b	.L62
	.p2align 2,,3
.L90:
	mov	w0, 30221
	movk	w0, 0xc018, lsl 16
	cmp	w19, w0
	beq	.L78
	mov	w0, 30215
	movk	w0, 0xc01b, lsl 16
	cmp	w19, w0
	bne	.L93
	mov	x2, x22
	mov	x1, x21
	mov	x0, x23
	bl	hailo_desc_list_create_ioctl
	b	.L62
	.p2align 2,,3
.L92:
	mov	w0, 30220
	movk	w0, 0x4001, lsl 16
	cmp	w19, w0
	beq	.L69
	mov	w0, 30213
	movk	w0, 0x8008, lsl 16
	cmp	w19, w0
	bne	.L71
	mov	x2, x22
	mov	x1, x21
	mov	x0, x23
	bl	hailo_vdma_buffer_unmap_ioctl
	b	.L62
	.p2align 2,,3
.L93:
	mov	w0, 30218
	movk	w0, 0xc010, lsl 16
	cmp	w19, w0
	bne	.L71
	mov	x2, x22
	mov	x1, x21
	mov	x0, x23
	bl	hailo_vdma_low_memory_buffer_alloc_ioctl
	b	.L62
	.p2align 2,,3
.L63:
	mov	x2, x22
	mov	x1, x21
	mov	x0, x23
	bl	hailo_desc_list_program_ioctl
	b	.L62
	.p2align 2,,3
.L65:
	mov	x2, x22
	mov	x1, x21
	mov	x0, x23
	bl	hailo_vdma_continuous_buffer_free_ioctl
	b	.L62
	.p2align 2,,3
.L73:
	mov	x2, x23
	mov	x1, x22
	mov	x0, x21
	bl	hailo_vdma_enable_channels_ioctl
	b	.L62
	.p2align 2,,3
.L76:
	mov	x2, x22
	mov	x1, x21
	mov	x0, x23
	bl	hailo_vdma_buffer_map_ioctl
	b	.L62
	.p2align 2,,3
.L81:
	mov	x3, x26
	mov	x2, x25
	mov	x1, x22
	mov	x0, x21
	bl	hailo_vdma_interrupts_wait_ioctl
	b	.L62
	.p2align 2,,3
.L71:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L85
	mov	x0, -25
	b	.L62
	.p2align 2,,3
.L67:
	mov	x2, x22
	mov	x1, x21
	mov	x0, x23
	bl	hailo_desc_list_release_ioctl
	b	.L62
	.p2align 2,,3
.L78:
	mov	x2, x22
	mov	x1, x21
	mov	x0, x23
	bl	hailo_vdma_continuous_buffer_alloc_ioctl
	b	.L62
	.p2align 2,,3
.L69:
	mov	x2, x24
	mov	x1, x22
	mov	x0, x21
	bl	hailo_mark_as_in_use
	b	.L62
	.p2align 2,,3
.L85:
	ldr	x1, [x21, 16]
	and	w4, w19, 255
	mov	w3, w19
	adrp	x2, .LC22
	adrp	x0, .LC23
	add	x2, x2, :lo12:.LC22
	add	x0, x0, :lo12:.LC23
	bl	_dev_printk
	mov	x0, -25
	b	.L62
	.size	hailo_vdma_ioctl, .-hailo_vdma_ioctl
	.section	.rodata.str1.8
	.align	3
.LC24:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_mmap at %s:%d\n"
	.align	3
.LC25:
	.string	"Map vdma_handle %llu\n"
	.align	3
.LC26:
	.string	"\0016FUNC_ENTRY: Entering function low_memory_buffer_mmap at %s:%d\n"
	.align	3
.LC27:
	.string	"mmap size should be %lu (given %lu)\n"
	.align	3
.LC28:
	.string	" fops_mmap failed mapping kernel page %d\n"
	.align	3
.LC29:
	.string	"\0016FUNC_ENTRY: Entering function continuous_buffer_mmap at %s:%d\n"
	.align	3
.LC30:
	.string	"mmap size should be less than %zu (given %lu)\n"
	.align	3
.LC31:
	.string	" vdma_mmap failed dma_mmap_coherent %d\n"
	.align	3
.LC32:
	.string	"Can't mmap vdma handle: %llu (not existing)\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_mmap
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_controller_init
	.align	3
	.8byte	.LPFE8
	.text
.LPFE8:
	nop
	nop
	.type	hailo_vdma_mmap, %function
hailo_vdma_mmap:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -112]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	adrp	x20, .LC0
	add	x20, x20, :lo12:.LC0
	stp	x25, x26, [sp, 64]
	adrp	x25, o_dbg
	mov	x19, x2
	mov	w2, 303
	stp	x21, x22, [sp, 32]
	mov	x21, x3
	stp	x23, x24, [sp, 48]
	mov	x23, x0
	adrp	x0, .LC24
	add	x0, x0, :lo12:.LC24
	stp	x27, x28, [sp, 80]
	str	x1, [sp, 96]
	mov	x1, x20
	bl	_printk
	ldr	w0, [x25, #:lo12:o_dbg]
	cmp	w0, 5
	bgt	.L116
.L95:
	mov	x1, x21
	mov	x0, x23
	bl	hailo_vdma_find_low_memory_buffer
	mov	x27, x0
	cbz	x0, .L96
	mov	x1, x20
	adrp	x0, .LC26
	mov	w2, 242
	add	x0, x0, :lo12:.LC26
	bl	_printk
	ldp	x26, x1, [x19]
	str	x1, [sp, 104]
	ldr	x0, [x27, 24]
	sub	x4, x1, x26
	lsl	x3, x0, 14
	cmp	x4, x3
	bne	.L97
	mov	x1, x26
	mov	x22, 0
	cbz	x0, .L107
	mov	x20, 140737488355328
	mov	x21, 70368744177663
	adrp	x24, kimage_voffset
	adrp	x23, memstart_addr
	b	.L108
	.p2align 2,,3
.L118:
	ldr	x0, [x23, #:lo12:memstart_addr]
	mov	x3, 16384
	ldr	x4, [x19, 24]
	add	x0, x0, x20
	add	x2, x0, x2
	add	x22, x22, 1
	mov	x0, x19
	lsr	x2, x2, 14
	bl	remap_pfn_range
	mov	w28, w0
	cbnz	w0, .L117
.L104:
	ldr	x0, [x27, 24]
	cmp	x22, x0
	bcs	.L107
	ldr	x1, [x19, 8]
	str	x1, [x19]
.L108:
	add	x0, x1, 16384
	str	x0, [x19, 8]
	ldr	x0, [x27, 32]
	ldr	x2, [x0, x22, lsl 3]
	add	x0, x2, x20
	cmp	x0, x21
	bls	.L118
	ldr	x0, [x24, #:lo12:kimage_voffset]
	mov	x3, 16384
	ldr	x4, [x19, 24]
	sub	x2, x2, x0
	add	x22, x22, 1
	mov	x0, x19
	lsr	x2, x2, 14
	bl	remap_pfn_range
	mov	w28, w0
	cbz	w0, .L104
.L117:
	ldr	w0, [x25, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L94
	ldr	x0, [sp, 96]
	mov	w3, w28
	adrp	x2, .LC28
	add	x2, x2, :lo12:.LC28
	ldr	x1, [x0, 16]
	adrp	x0, .LC23
	add	x0, x0, :lo12:.LC23
	bl	_dev_printk
	b	.L94
	.p2align 2,,3
.L96:
	mov	x0, x23
	mov	x1, x21
	bl	hailo_vdma_find_continuous_buffer
	mov	x23, x0
	cbz	x0, .L109
	mov	x1, x20
	adrp	x0, .LC29
	mov	w2, 280
	add	x0, x0, :lo12:.LC29
	bl	_printk
	ldp	x0, x4, [x19]
	ldr	x3, [x23, 40]
	sub	x4, x4, x0
	cmp	x4, x3
	bhi	.L119
	ldr	x0, [sp, 96]
	mov	x1, x19
	ldp	x2, x3, [x23, 24]
	mov	x5, 0
	ldr	x0, [x0, 16]
	bl	dma_mmap_attrs
	mov	w28, w0
	tbnz	w0, #31, .L112
.L99:
	mov	w28, 0
.L94:
	ldp	x19, x20, [sp, 16]
	mov	w0, w28
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L116:
	ldr	x0, [sp, 96]
	mov	x3, x21
	adrp	x2, .LC25
	add	x2, x2, :lo12:.LC25
	ldr	x1, [x0, 16]
	adrp	x0, .LC17
	add	x0, x0, :lo12:.LC17
	bl	_dev_printk
	b	.L95
	.p2align 2,,3
.L107:
	ldr	x0, [sp, 104]
	stp	x26, x0, [x19]
	b	.L99
	.p2align 2,,3
.L112:
	ldr	w0, [x25, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L94
	ldr	x0, [sp, 96]
	mov	w3, w28
	adrp	x2, .LC31
	add	x2, x2, :lo12:.LC31
	ldr	x1, [x0, 16]
	adrp	x0, .LC23
	add	x0, x0, :lo12:.LC23
	bl	_dev_printk
	b	.L94
.L97:
	ldr	w0, [x25, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L120
.L101:
	mov	w28, -22
	b	.L94
	.p2align 2,,3
.L120:
	ldr	x0, [sp, 96]
	adrp	x2, .LC27
	mov	w28, -22
	add	x2, x2, :lo12:.LC27
	ldr	x1, [x0, 16]
	adrp	x0, .LC23
	add	x0, x0, :lo12:.LC23
	bl	_dev_printk
	b	.L94
.L119:
	ldr	w0, [x25, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L101
	ldr	x0, [sp, 96]
	adrp	x2, .LC30
	mov	w28, -22
	add	x2, x2, :lo12:.LC30
	ldr	x1, [x0, 16]
	adrp	x0, .LC23
	add	x0, x0, :lo12:.LC23
	bl	_dev_printk
	b	.L94
.L109:
	ldr	w0, [x25, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L101
	ldr	x0, [sp, 96]
	mov	x3, x21
	adrp	x2, .LC32
	mov	w28, -22
	add	x2, x2, :lo12:.LC32
	ldr	x1, [x0, 16]
	adrp	x0, .LC23
	add	x0, x0, :lo12:.LC23
	bl	_dev_printk
	b	.L94
	.size	hailo_vdma_mmap, .-hailo_vdma_mmap
	.section	.rodata.str1.8
	.align	3
.LC33:
	.string	"\0016FUNC_ENTRY: Entering function get_dma_direction at %s:%d\n"
	.align	3
.LC34:
	.string	"\0013Invalid hailo direction %d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	get_dma_direction
	.section	__patchable_function_entries,"awo",@progbits,hailo_vdma_controller_init
	.align	3
	.8byte	.LPFE9
	.text
.LPFE9:
	nop
	nop
	.type	get_dma_direction, %function
get_dma_direction:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	adrp	x1, .LC0
	mov	x29, sp
	add	x1, x1, :lo12:.LC0
	mov	w2, 322
	str	x19, [sp, 16]
	mov	w19, w0
	adrp	x0, .LC33
	add	x0, x0, :lo12:.LC33
	bl	_printk
	cmp	w19, 2
	bhi	.L124
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L124:
	mov	w1, w19
	adrp	x0, .LC34
	mov	w19, 3
	add	x0, x0, :lo12:.LC34
	bl	_printk
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.size	get_dma_direction, .-get_dma_direction
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	__key.0, %object
	.size	__key.0, 0
__key.0:
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
