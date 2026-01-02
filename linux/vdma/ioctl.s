	.arch armv8-a
	.file	"ioctl.c"
	.text
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE1
	.text
.LPFE1:
	nop
	nop
	.type	hailo_get_next_vdma_handle, %function
hailo_get_next_vdma_handle:
	nop
	nop
#APP
// 232 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h" 1
	.if 1 == 1
661:
	b	.L2
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
	mov	w1, 1
	add	x0, x0, 24
#APP
// 62 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h" 1
	.arch_extension lse
	ldaddal	w1, w1, [x0]
// 0 "" 2
#NO_APP
	add	w1, w1, 1
	sbfiz	x0, x1, 14, 32
	ret
	.p2align 2,,3
.L2:
	add	x0, x0, 24
#APP
// 95 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h" 1
	// atomic_add_return
	prfm	pstl1strm, [x0]
1:	ldxr	w1, [x0]
	add	w1, w1, 1
	stlxr	w2, w1, [x0]
	cbnz	w2, 1b
	dmb ish
// 0 "" 2
#NO_APP
	sbfiz	x0, x1, 14, 32
	ret
	.size	hailo_get_next_vdma_handle, .-hailo_get_next_vdma_handle
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE2
	.text
.LPFE2:
	nop
	nop
	.type	transfer_done, %function
transfer_done:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	ldrb	w0, [x0, 2]
	cbz	w0, .L5
	stp	x21, x22, [sp, 32]
	mov	x21, x1
	mov	w19, 0
	mov	w22, 24
	.p2align 3,,7
.L7:
	sbfiz	x5, x19, 1, 32
	umaddl	x3, w19, w22, x20
	add	x5, x5, w19, sxtw
	mov	w2, 0
	mov	x0, x21
	add	x5, x20, x5, lsl 3
	ldp	w4, w3, [x3, 16]
	ldr	x1, [x5, 24]
	bl	hailo_vdma_buffer_sync_cyclic
	ldrb	w3, [x20, 2]
	add	w2, w19, 1
	and	w19, w2, 255
	cmp	w3, w2, uxtb
	bhi	.L7
	ldp	x21, x22, [sp, 32]
.L5:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.size	transfer_done, .-transfer_done
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"/home/sri/hailort-drivers/linux/pcie/../vdma/ioctl.c"
	.align	3
.LC1:
	.string	"\0016IOCTL_HANDLER: Function hailo_vdma_enable_channels_ioctl called at %s:%d\n"
	.align	3
.LC2:
	.string	"\0016USER_COPY: About to call copy_from_user from function %s at %s:%d\n"
	.align	3
.LC3:
	.string	"\0016USER_COPY_CONTEXT: Process PID=%d, COMM=%s\n"
	.align	3
.LC4:
	.string	"copy_from_user fail\n"
	.align	3
.LC5:
	.string	"\0013"
	.align	3
.LC6:
	.string	"Trying to enable channels that are already enabled\n"
	.align	3
.LC7:
	.string	"Enabled interrupts for engine %u, channels bitmap 0x%x\n"
	.align	3
.LC8:
	.string	"\0016"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_enable_channels_ioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE3
	.text
.LPFE3:
	nop
	nop
	.type	hailo_vdma_enable_channels_ioctl, %function
hailo_vdma_enable_channels_ioctl:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #144
	mrs	x3, sp_el0
	stp	x29, x30, [sp, 48]
	add	x29, sp, 48
	stp	x19, x20, [sp, 64]
	adrp	x20, .LC0
	add	x20, x20, :lo12:.LC0
	stp	x21, x22, [sp, 80]
	mov	x19, x1
	mov	x21, x2
	stp	x23, x24, [sp, 96]
	mov	x1, x20
	mov	w2, 25
	stp	x25, x26, [sp, 112]
	mov	x26, x0
	stp	x27, x28, [sp, 128]
	add	x27, sp, 27
	ldr	x0, [x3, 1424]
	str	x0, [sp, 40]
	mov	x0, 0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	_printk
	str	xzr, [sp, 27]
	mov	x2, x20
	mov	w3, 31
	adrp	x1, .LANCHOR0
	adrp	x0, .LC2
	add	x1, x1, :lo12:.LANCHOR0
	add	x0, x0, :lo12:.LC2
	str	wzr, [x27, 8]
	strb	wzr, [x27, 12]
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x20, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x20, 1416]
	add	x2, x20, 1904
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	_printk
	ldr	w0, [x20, 44]
	tbz	x0, 21, .L36
.L14:
	sbfx	x0, x19, 0, 56
	and	x0, x0, x19
.L15:
	mov	w1, 4294967283
	movk	x1, 0x7fff, lsl 32
	cmp	x0, x1
	bhi	.L29
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x19, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 13
	mov	x0, x27
	bl	__arch_copy_from_user
	mov	x24, x0
	cbnz	x0, .L37
	ldp	x1, x0, [x26, 24]
	mov	x6, 51472
	mov	w3, 0
	movk	x6, 0x5, lsl 16
	mov	x2, x0
	cbnz	x1, .L20
	b	.L26
	.p2align 2,,3
.L22:
	add	w3, w3, 1
	and	x4, x3, 255
	and	w3, w3, 255
	madd	x2, x4, x6, x0
	cmp	x4, x1
	bcs	.L38
.L20:
	ldr	w4, [x27, w3, sxtw 2]
	ldr	w2, [x2, 4]
	tst	w2, w4
	beq	.L22
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L39
	mov	x0, -22
	b	.L13
	.p2align 2,,3
.L26:
	mov	x0, 0
.L13:
	mrs	x1, sp_el0
	ldr	x3, [sp, 40]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L40
	ldp	x29, x30, [sp, 48]
	ldp	x19, x20, [sp, 64]
	ldp	x21, x22, [sp, 80]
	ldp	x23, x24, [sp, 96]
	ldp	x25, x26, [sp, 112]
	ldp	x27, x28, [sp, 128]
	add	sp, sp, 144
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L29:
	mov	x0, x27
	mov	x24, 13
.L16:
	mov	x2, x24
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L41
	mov	x0, -12
	b	.L13
	.p2align 2,,3
.L38:
	mov	x23, 51472
	adrp	x22, o_dbg
	adrp	x25, .LC7
	adrp	x1, .LC8
	add	x22, x22, :lo12:o_dbg
	add	x1, x1, :lo12:.LC8
	add	x25, x25, :lo12:.LC7
	mov	w19, 0
	mov	x20, 0
	movk	x23, 0x5, lsl 16
	str	x1, [sp, 8]
	b	.L25
	.p2align 2,,3
.L24:
	add	x3, x21, x20, lsl 2
	add	w19, w19, 1
	and	x20, x19, 255
	and	w19, w19, 255
	mov	x24, x20
	ldr	w2, [x3, 80]
	orr	w2, w2, w28
	str	w2, [x3, 80]
	ldp	x1, x0, [x26, 24]
	madd	x0, x20, x23, x0
	cmp	x20, x1
	bcs	.L26
.L25:
	ldrb	w2, [sp, 39]
	ldr	w28, [x27, w19, sxtw 2]
	mov	w1, w28
	bl	hailo_vdma_engine_enable_channels
	mov	x0, x26
	mov	x1, x24
	bl	hailo_vdma_update_interrupts_mask
	ldr	w0, [x22]
	cmp	w0, 5
	ble	.L24
	ldr	x0, [sp, 8]
	mov	w4, w28
	ldr	x1, [x26, 16]
	mov	w3, w19
	mov	x2, x25
	bl	_dev_printk
	b	.L24
	.p2align 2,,3
.L36:
	ldr	x1, [x20]
	mov	x0, x19
	tst	w1, 67108864
	beq	.L15
	b	.L14
	.p2align 2,,3
.L39:
	ldr	x1, [x26, 16]
	adrp	x2, .LC6
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC6
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -22
	b	.L13
.L37:
	sub	x27, x27, x0
	add	x0, x27, 13
	b	.L16
	.p2align 2,,3
.L41:
	ldr	x1, [x26, 16]
	adrp	x2, .LC4
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC4
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -12
	b	.L13
.L40:
	bl	__stack_chk_fail
	.size	hailo_vdma_enable_channels_ioctl, .-hailo_vdma_enable_channels_ioctl
	.section	.rodata.str1.8
	.align	3
.LC9:
	.string	"\0016IOCTL_HANDLER: Function hailo_vdma_disable_channels_ioctl called at %s:%d\n"
	.align	3
.LC10:
	.string	"Trying to disable channels that were not enabled\n"
	.align	3
.LC11:
	.string	"\0014"
	.align	3
.LC12:
	.string	"Disabled channels for engine %u, bitmap 0x%x\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_disable_channels_ioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE4
	.text
.LPFE4:
	nop
	nop
	.type	hailo_vdma_disable_channels_ioctl, %function
hailo_vdma_disable_channels_ioctl:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #144
	mrs	x3, sp_el0
	stp	x29, x30, [sp, 48]
	add	x29, sp, 48
	stp	x19, x20, [sp, 64]
	adrp	x20, .LC0
	add	x20, x20, :lo12:.LC0
	stp	x21, x22, [sp, 80]
	add	x22, sp, 28
	mov	x19, x1
	stp	x23, x24, [sp, 96]
	mov	x1, x20
	mov	x24, x2
	stp	x27, x28, [sp, 128]
	mov	x27, x0
	mov	w2, 64
	ldr	x0, [x3, 1424]
	str	x0, [sp, 40]
	mov	x0, 0
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_printk
	str	xzr, [sp, 28]
	adrp	x1, .LANCHOR0
	add	x1, x1, :lo12:.LANCHOR0
	mov	x2, x20
	add	x1, x1, 40
	mov	w3, 71
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	str	wzr, [x22, 8]
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x20, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x20, 1416]
	add	x2, x20, 1904
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	_printk
	ldr	w0, [x20, 44]
	tbz	x0, 21, .L67
.L43:
	sbfx	x0, x19, 0, 56
	and	x0, x0, x19
.L44:
	mov	w1, 4294967284
	movk	x1, 0x7fff, lsl 32
	cmp	x0, x1
	bhi	.L57
	stp	x25, x26, [sp, 112]
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x19, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 12
	mov	x0, x22
	bl	__arch_copy_from_user
	mov	x21, x0
	cbnz	x0, .L68
	ldp	x2, x3, [x27, 24]
	mov	w20, 0
	mov	x1, x3
	cbz	x2, .L52
	mov	x25, 51472
	adrp	x26, o_dbg
	adrp	x23, .LC10
	add	x26, x26, :lo12:o_dbg
	add	x23, x23, :lo12:.LC10
	movk	x25, 0x5, lsl 16
	b	.L49
	.p2align 2,,3
.L51:
	add	w20, w20, 1
	mov	x19, x3
	and	x0, x20, 255
	and	w20, w20, 255
	madd	x1, x0, x25, x3
	cmp	x0, x2
	bcs	.L69
.L49:
	ldr	w0, [x22, w20, sxtw 2]
	ldr	w1, [x1, 4]
	bics	wzr, w0, w1
	beq	.L51
	ldr	w0, [x26]
	cmp	w0, 3
	ble	.L51
	ldr	x1, [x27, 16]
	mov	x2, x23
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	add	w20, w20, 1
	bl	_dev_printk
	ldp	x2, x3, [x27, 24]
	and	x0, x20, 255
	and	w20, w20, 255
	madd	x1, x0, x25, x3
	mov	x19, x3
	cmp	x0, x2
	bcc	.L49
.L69:
	cbz	x2, .L52
	adrp	x28, .LC12
	add	x0, x28, :lo12:.LC12
	adrp	x25, o_dbg
	add	x23, x27, 40
	add	x25, x25, :lo12:o_dbg
	mov	w26, 0
	mov	x28, 0
	str	x0, [sp]
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	str	x0, [sp, 8]
	b	.L54
	.p2align 2,,3
.L53:
	add	x0, x24, x28, lsl 2
	add	w3, w26, 1
	and	x28, x3, 255
	and	w26, w3, 255
	mov	x21, x28
	ldr	w1, [x0, 80]
	bic	w20, w1, w20
	str	w20, [x0, 80]
	mov	x1, 51472
	ldp	x0, x19, [x27, 24]
	movk	x1, 0x5, lsl 16
	madd	x19, x28, x1, x19
	cmp	x28, x0
	bcs	.L52
.L54:
	ldr	w20, [x22, w26, sxtw 2]
	mov	x0, x19
	mov	w1, w20
	bl	hailo_vdma_engine_disable_channels
	mov	x1, x21
	mov	x0, x27
	bl	hailo_vdma_update_interrupts_mask
	mov	x0, x23
	bl	_raw_spin_lock_irqsave
	mov	x21, x0
	mov	w1, w20
	mov	x0, x19
	bl	hailo_vdma_engine_clear_channel_interrupts
	mov	x0, x23
	mov	x1, x21
	bl	_raw_spin_unlock_irqrestore
	ldr	w0, [x25]
	cmp	w0, 5
	ble	.L53
	ldp	x2, x0, [sp]
	mov	w4, w20
	ldr	x1, [x27, 16]
	mov	w3, w26
	bl	_dev_printk
	b	.L53
	.p2align 2,,3
.L52:
	add	x0, x27, 48
	mov	x3, 0
	mov	w2, 0
	mov	w1, 1
	bl	__wake_up
	ldp	x25, x26, [sp, 112]
	mov	x0, 0
.L42:
	mrs	x1, sp_el0
	ldr	x3, [sp, 40]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L70
	ldp	x29, x30, [sp, 48]
	ldp	x19, x20, [sp, 64]
	ldp	x21, x22, [sp, 80]
	ldp	x23, x24, [sp, 96]
	ldp	x27, x28, [sp, 128]
	add	sp, sp, 144
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L57:
	mov	x0, x22
	mov	x21, 12
.L45:
	mov	x2, x21
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L71
	mov	x0, -12
	b	.L42
	.p2align 2,,3
.L67:
	ldr	x1, [x20]
	mov	x0, x19
	tst	w1, 67108864
	beq	.L44
	b	.L43
.L68:
	sub	x22, x22, x0
	ldp	x25, x26, [sp, 112]
	add	x0, x22, 12
	b	.L45
	.p2align 2,,3
.L71:
	ldr	x1, [x27, 16]
	adrp	x2, .LC4
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC4
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -12
	b	.L42
.L70:
	stp	x25, x26, [sp, 112]
	bl	__stack_chk_fail
	.size	hailo_vdma_disable_channels_ioctl, .-hailo_vdma_disable_channels_ioctl
	.section	.rodata.str1.8
	.align	3
.LC13:
	.string	"\0016IOCTL_HANDLER: Function hailo_vdma_interrupts_wait_ioctl called at %s:%d\n"
	.align	3
.LC14:
	.string	"HAILO_VDMA_INTERRUPTS_WAIT, copy_from_user fail\n"
	.align	3
.LC15:
	.string	"Got an empty bitmap for wait interrupts\n"
	.align	3
.LC16:
	.string	"wait channel interrupts failed with err=%ld (process was interrupted or killed)\n"
	.align	3
.LC17:
	.string	"down_interruptible error (process was interrupted or killed)\n"
	.align	3
.LC18:
	.string	"\0016USER_COPY: About to call copy_to_user from function %s at %s:%d\n"
	.align	3
.LC19:
	.string	"Failed fill irq data %ld"
	.align	3
.LC20:
	.string	"copy_to_user fail\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_interrupts_wait_ioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE5
	.text
.LPFE5:
	nop
	nop
	.type	hailo_vdma_interrupts_wait_ioctl, %function
hailo_vdma_interrupts_wait_ioctl:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -96]!
	mrs	x4, sp_el0
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	stp	x21, x22, [sp, 32]
	adrp	x22, .LC0
	add	x22, x22, :lo12:.LC0
	stp	x23, x24, [sp, 48]
	mov	x21, x1
	mov	x24, x2
	stp	x25, x26, [sp, 64]
	mov	x1, x22
	mov	w2, 136
	stp	x27, x28, [sp, 80]
	sub	sp, sp, #768
	mov	x27, x3
	ldr	x0, [x4, 1424]
	str	x0, [sp, 760]
	mov	x0, 0
	add	x19, sp, 75
	adrp	x0, .LC13
	add	x0, x0, :lo12:.LC13
	bl	_printk
	mov	x2, 685
	mov	w1, 0
	mov	x0, x19
	bl	memset
	adrp	x26, .LANCHOR0
	add	x0, x26, :lo12:.LANCHOR0
	add	x1, x0, 80
	mov	x2, x22
	mov	w3, 145
	str	x0, [sp, 16]
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	_printk
	adrp	x25, .LC3
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x23, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x23, 1416]
	add	x0, x25, :lo12:.LC3
	add	x2, x23, 1904
	str	x0, [sp, 8]
	bl	_printk
	ldr	w0, [x23, 44]
	tbz	x0, 21, .L133
.L73:
	sbfx	x0, x21, 0, 56
	and	x0, x0, x21
.L74:
	mov	w1, 4294966611
	movk	x1, 0x7fff, lsl 32
	cmp	x0, x1
	bhi	.L112
	str	x21, [sp, 24]
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x21, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 685
	mov	x0, x19
	bl	__arch_copy_from_user
	mov	x2, x0
	cbnz	x0, .L134
	ldr	x4, [x20, 24]
	mov	w0, 0
	mov	w2, 0
	mov	w5, 1
	cbz	x4, .L78
	.p2align 3,,7
.L77:
	ldr	w3, [x19, w0, sxtw 2]
	add	w1, w0, 1
	and	w0, w1, 255
	cmp	w3, 0
	csel	w2, w2, w5, eq
	cmp	x4, w1, uxtb
	bhi	.L77
	cbz	w2, .L78
	mov	x0, x24
	bl	up
	ldp	x4, x5, [x20, 24]
	cbz	x4, .L85
	mov	x6, 51472
	mov	x3, x5
	mov	x1, 0
	mov	w0, 0
	movk	x6, 0x5, lsl 16
	b	.L87
	.p2align 2,,3
.L135:
	add	w0, w0, 1
	and	x1, x0, 255
	and	w0, w0, 255
	madd	x3, x1, x6, x5
	cmp	x4, x1
	bls	.L85
.L87:
	ldp	w2, w3, [x3, 4]
	ldr	w1, [x19, x1, lsl 2]
	and	w2, w1, w2
	tst	w1, w3
	ccmp	w2, w1, 0, eq
	beq	.L135
.L94:
	mov	x0, x24
	bl	down_interruptible
	cbnz	w0, .L136
	ldp	x0, x25, [x20, 24]
	strb	wzr, [sp, 87]
	cbz	x0, .L104
	mov	x27, 51472
	adrp	x24, transfer_done
	add	x23, x20, 40
	add	x24, x24, :lo12:transfer_done
	mov	w28, 0
	movk	x27, 0x5, lsl 16
	b	.L103
	.p2align 2,,3
.L101:
	ldp	x2, x5, [x20, 24]
	add	w1, w28, 1
	and	x0, x1, 255
	and	w28, w1, 255
	madd	x25, x0, x27, x5
	cmp	x0, x2
	bcs	.L104
.L103:
	mov	x0, x23
	bl	_raw_spin_lock_irqsave
	ldrb	w4, [x25]
	mov	x1, x0
	ldp	w2, w3, [x25, 4]
	mov	x0, x23
	ldr	w4, [x19, x4, lsl 2]
	and	w2, w3, w2
	and	w26, w2, w4
	bic	w3, w3, w26
	str	w3, [x25, 8]
	bl	_raw_spin_unlock_irqrestore
	mov	x3, x24
	mov	x4, x20
	mov	w2, w26
	mov	x1, x25
	mov	x0, x19
	bl	hailo_vdma_engine_fill_irq_data
	sxtw	x3, w0
	tbz	x0, 31, .L101
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L137
.L72:
	mrs	x0, sp_el0
	ldr	x2, [sp, 760]
	ldr	x1, [x0, 1424]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L138
	add	sp, sp, 768
	mov	x0, x3
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L112:
	mov	x0, x19
	mov	x2, 685
.L75:
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L139
.L80:
	mov	x3, -12
	b	.L72
	.p2align 2,,3
.L85:
	mov	x25, 51472
	add	x23, x20, 48
	add	x0, sp, 32
	movk	x25, 0x5, lsl 16
	mov	w1, 0
	stp	xzr, xzr, [sp, 32]
	stp	xzr, xzr, [sp, 48]
	str	xzr, [sp, 64]
	bl	init_wait_entry
	.p2align 3,,7
.L93:
	add	x1, sp, 32
	mov	x0, x23
	mov	w2, 1
	bl	prepare_to_wait_event
	ldp	x5, x6, [x20, 24]
	cbz	x5, .L88
	mov	x4, x6
	mov	x2, 0
	mov	w1, 0
	b	.L90
	.p2align 2,,3
.L140:
	add	w1, w1, 1
	and	x2, x1, 255
	and	w1, w1, 255
	madd	x4, x2, x25, x6
	cmp	x5, x2
	bls	.L88
.L90:
	ldp	w3, w4, [x4, 4]
	ldr	w2, [x19, x2, lsl 2]
	and	w3, w2, w3
	tst	w2, w4
	ccmp	w3, w2, 0, eq
	beq	.L140
	add	x1, sp, 32
	mov	x0, x23
	bl	finish_wait
	b	.L94
	.p2align 2,,3
.L88:
	cbnz	x0, .L141
	bl	schedule
	b	.L93
	.p2align 2,,3
.L104:
	ldr	x0, [sp, 16]
	mov	x2, x22
	mov	w3, 199
	add	x1, x0, 80
	adrp	x0, .LC18
	add	x0, x0, :lo12:.LC18
	bl	_printk
	ldr	x0, [sp, 8]
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x22, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x22, 1416]
	add	x2, x22, 1904
	bl	_printk
	ldr	w0, [x22, 44]
	tbz	x0, 21, .L142
.L99:
	sbfx	x0, x21, 0, 56
	and	x21, x21, x0
.L105:
	mov	w0, 4294966611
	movk	x0, 0x7fff, lsl 32
	cmp	x21, x0
	bls	.L106
.L109:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L80
	ldr	x1, [x20, 16]
	adrp	x2, .LC20
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC20
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x3, -12
	b	.L72
	.p2align 2,,3
.L133:
	ldr	x1, [x23]
	mov	x0, x21
	tst	w1, 67108864
	beq	.L74
	b	.L73
.L141:
	sxtw	x3, w0
	tbz	x0, 31, .L94
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 5
	bgt	.L143
	strb	wzr, [x27]
	b	.L72
.L106:
	ldr	x0, [sp, 24]
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x0, x0, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 685
	mov	x1, x19
	bl	__arch_copy_to_user
	cbnz	x0, .L109
	mov	x3, 0
	b	.L72
.L134:
	sub	x19, x19, x0
	add	x0, x19, 685
	b	.L75
.L142:
	ldr	x0, [x22]
	tst	w0, 67108864
	beq	.L105
	b	.L99
.L137:
	ldr	x1, [x20, 16]
	adrp	x2, .LC19
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC19
	add	x0, x0, :lo12:.LC5
	str	x3, [sp, 8]
	bl	_dev_printk
	ldr	x3, [sp, 8]
	b	.L72
.L139:
	ldr	x1, [x20, 16]
	adrp	x2, .LC14
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC14
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x3, -12
	b	.L72
.L143:
	ldr	x1, [x20, 16]
	adrp	x2, .LC16
	adrp	x0, .LC8
	add	x2, x2, :lo12:.LC16
	add	x0, x0, :lo12:.LC8
	str	x3, [sp, 8]
	bl	_dev_printk
	strb	wzr, [x27]
	ldr	x3, [sp, 8]
	b	.L72
.L78:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L144
	mov	x3, -22
	b	.L72
	.p2align 2,,3
.L144:
	ldr	x1, [x20, 16]
	adrp	x2, .LC15
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC15
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x3, -22
	b	.L72
.L136:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 5
	bgt	.L145
	mov	x3, -512
.L146:
	strb	wzr, [x27]
	b	.L72
.L145:
	ldr	x1, [x20, 16]
	adrp	x2, .LC17
	adrp	x0, .LC8
	add	x2, x2, :lo12:.LC17
	add	x0, x0, :lo12:.LC8
	bl	_dev_printk
	mov	x3, -512
	b	.L146
.L138:
	bl	__stack_chk_fail
	.size	hailo_vdma_interrupts_wait_ioctl, .-hailo_vdma_interrupts_wait_ioctl
	.section	.rodata.str1.8
	.align	3
.LC21:
	.string	"\0016IOCTL_HANDLER: Function hailo_vdma_buffer_map_ioctl called at %s:%d\n"
	.align	3
.LC22:
	.string	"copy from user fail\n"
	.align	3
.LC23:
	.string	"address %lx tgid %d size: %zu\n"
	.align	3
.LC24:
	.string	"\0017"
	.align	3
.LC25:
	.string	"invalid data direction %d\n"
	.align	3
.LC26:
	.string	"failed map buffer %lx\n"
	.align	3
.LC27:
	.string	"buffer %lx (handle %zu) is mapped\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_buffer_map_ioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE6
	.text
.LPFE6:
	nop
	nop
	.type	hailo_vdma_buffer_map_ioctl, %function
hailo_vdma_buffer_map_ioctl:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #144
	mrs	x3, sp_el0
	stp	x29, x30, [sp, 48]
	add	x29, sp, 48
	stp	x19, x20, [sp, 64]
	mov	x20, x2
	mov	w2, 222
	stp	x21, x22, [sp, 80]
	mov	x21, x0
	adrp	x22, .LC0
	stp	x23, x24, [sp, 96]
	mov	x23, sp
	add	x22, x22, :lo12:.LC0
	stp	x25, x26, [sp, 112]
	mov	x26, x1
	adrp	x25, .LANCHOR0
	ldr	x0, [x3, 1424]
	str	x0, [sp, 40]
	mov	x0, 0
	mov	x1, x22
	add	x25, x25, :lo12:.LANCHOR0
	adrp	x0, .LC21
	add	x0, x0, :lo12:.LC21
	bl	_printk
	stp	xzr, xzr, [sp]
	mov	x2, x22
	add	x1, x25, 120
	mov	w3, 228
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	stp	xzr, xzr, [x23, 16]
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x19, sp_el0
// 0 "" 2
#NO_APP
	str	xzr, [x23, 32]
	bl	_printk
	ldr	w1, [x19, 1416]
	adrp	x24, .LC3
	add	x24, x24, :lo12:.LC3
	add	x2, x19, 1904
	mov	x0, x24
	bl	_printk
	ldr	w0, [x19, 44]
	tbz	x0, 21, .L181
.L148:
	sbfx	x0, x20, 0, 56
	and	x0, x0, x20
.L149:
	mov	w1, 4294967256
	movk	x1, 0x7fff, lsl 32
	cmp	x0, x1
	bhi	.L174
	stp	x27, x28, [sp, 128]
	mov	x28, x20
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x20, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 40
	mov	x0, x23
	bl	__arch_copy_from_user
	mov	x2, x0
	cbnz	x0, .L182
	adrp	x27, o_dbg
	ldr	w0, [x27, #:lo12:o_dbg]
	cmp	w0, 6
	bgt	.L183
.L155:
	ldr	w0, [sp, 16]
	bl	get_dma_direction
	mov	w19, w0
	cmp	w0, 3
	beq	.L184
	ldr	x1, [sp, 24]
	mov	x0, x21
	bl	hailo_vdma_find_low_memory_buffer
	mov	x5, x0
	ldp	x1, x2, [sp]
	mov	w3, w19
	ldr	x0, [x26, 16]
	ldr	w4, [sp, 20]
	bl	hailo_vdma_buffer_map
	mov	x19, x0
	cmn	x0, #4096
	bhi	.L185
#APP
// 232 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h" 1
	.if 1 == 1
661:
	b	.L161
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
	mov	w4, 1
#APP
// 62 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h" 1
	.arch_extension lse
	ldaddal	w4, w4, [x21]
// 0 "" 2
#NO_APP
	add	w4, w4, 1
.L162:
	sxtw	x4, w4
	str	x4, [x19, 16]
	mov	x2, x22
	add	x1, x25, 120
	mov	w3, 255
	adrp	x0, .LC18
	add	x0, x0, :lo12:.LC18
	str	x4, [sp, 32]
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x22, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x22, 1416]
	mov	x0, x24
	add	x2, x22, 1904
	bl	_printk
	ldr	w0, [x22, 44]
	tbz	x0, 21, .L186
.L163:
	sbfx	x0, x20, 0, 56
	and	x20, x20, x0
.L164:
	mov	w0, 4294967256
	movk	x0, 0x7fff, lsl 32
	cmp	x20, x0
	bls	.L165
.L168:
	ldr	w0, [x27, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L187
.L167:
	mov	x0, x19
	bl	hailo_vdma_buffer_put
	ldp	x27, x28, [sp, 128]
	.p2align 3,,7
.L153:
	mov	x0, -14
	b	.L147
	.p2align 2,,3
.L174:
	mov	x0, x23
	mov	x2, 40
.L150:
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L153
	ldr	x1, [x26, 16]
	adrp	x2, .LC22
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC22
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -14
	b	.L147
	.p2align 2,,3
.L161:
#APP
// 95 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h" 1
	// atomic_add_return
	prfm	pstl1strm, [x21]
1:	ldxr	w4, [x21]
	add	w4, w4, 1
	stlxr	w0, w4, [x21]
	cbnz	w0, 1b
	dmb ish
// 0 "" 2
#NO_APP
	b	.L162
	.p2align 2,,3
.L165:
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x0, x28, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 40
	mov	x1, x23
	bl	__arch_copy_to_user
	cbnz	x0, .L168
	mov	x0, x21
	ldr	w2, [x27, #:lo12:o_dbg]
	ldr	x1, [x0, 8]!
	str	x19, [x1, 8]
	stp	x1, x0, [x19]
	str	x19, [x21, 8]
	cmp	w2, 6
	bgt	.L170
.L171:
	ldp	x27, x28, [sp, 128]
	mov	x0, 0
.L147:
	mrs	x1, sp_el0
	ldr	x3, [sp, 40]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L188
	ldp	x29, x30, [sp, 48]
	ldp	x19, x20, [sp, 64]
	ldp	x21, x22, [sp, 80]
	ldp	x23, x24, [sp, 96]
	ldp	x25, x26, [sp, 112]
	add	sp, sp, 144
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L181:
	ldr	x1, [x19]
	mov	x0, x20
	tst	w1, 67108864
	beq	.L149
	b	.L148
	.p2align 2,,3
.L183:
	ldp	x3, x5, [sp]
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x0, sp_el0
// 0 "" 2
#NO_APP
	ldr	x1, [x26, 16]
	adrp	x2, .LC23
	ldr	w4, [x0, 1420]
	add	x2, x2, :lo12:.LC23
	adrp	x0, .LC24
	add	x0, x0, :lo12:.LC24
	bl	_dev_printk
	b	.L155
	.p2align 2,,3
.L186:
	ldr	x0, [x22]
	tst	w0, 67108864
	beq	.L164
	b	.L163
	.p2align 2,,3
.L170:
	ldr	x3, [sp]
	adrp	x2, .LC27
	ldr	x1, [x26, 16]
	add	x2, x2, :lo12:.LC27
	ldr	x4, [sp, 32]
	adrp	x0, .LC24
	add	x0, x0, :lo12:.LC24
	bl	_dev_printk
	b	.L171
	.p2align 2,,3
.L182:
	sub	x23, x23, x0
	ldp	x27, x28, [sp, 128]
	add	x0, x23, 40
	b	.L150
	.p2align 2,,3
.L185:
	ldr	w0, [x27, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L189
.L160:
	ldp	x27, x28, [sp, 128]
	mov	x0, x19
	b	.L147
	.p2align 2,,3
.L189:
	ldr	x3, [sp]
	adrp	x2, .LC26
	ldr	x1, [x26, 16]
	add	x2, x2, :lo12:.LC26
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	b	.L160
	.p2align 2,,3
.L184:
	ldr	w0, [x27, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L190
.L157:
	ldp	x27, x28, [sp, 128]
	mov	x0, -22
	b	.L147
.L190:
	ldr	x1, [x26, 16]
	adrp	x2, .LC25
	ldr	w3, [sp, 16]
	add	x2, x2, :lo12:.LC25
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	b	.L157
	.p2align 2,,3
.L187:
	ldr	x1, [x26, 16]
	adrp	x2, .LC20
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC20
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	b	.L167
.L188:
	stp	x27, x28, [sp, 128]
	bl	__stack_chk_fail
	.size	hailo_vdma_buffer_map_ioctl, .-hailo_vdma_buffer_map_ioctl
	.section	.rodata.str1.8
	.align	3
.LC28:
	.string	"\0016IOCTL_HANDLER: Function hailo_vdma_buffer_unmap_ioctl called at %s:%d\n"
	.align	3
.LC29:
	.string	"unmap user buffer handle %zu\n"
	.align	3
.LC30:
	.string	"buffer handle %zu not found\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_buffer_unmap_ioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE7
	.text
.LPFE7:
	nop
	nop
	.type	hailo_vdma_buffer_unmap_ioctl, %function
hailo_vdma_buffer_unmap_ioctl:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #64
	mrs	x3, sp_el0
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	adrp	x20, .LC0
	add	x20, x20, :lo12:.LC0
	stp	x21, x22, [sp, 48]
	mov	x22, x0
	mov	x21, x1
	ldr	x0, [x3, 1424]
	str	x0, [sp, 8]
	mov	x0, 0
	mov	x1, x20
	mov	x19, x2
	adrp	x0, .LC28
	mov	w2, 272
	add	x0, x0, :lo12:.LC28
	bl	_printk
	str	xzr, [sp]
	adrp	x3, .LANCHOR0
	add	x3, x3, :lo12:.LANCHOR0
	mov	x2, x20
	add	x1, x3, 152
	adrp	x0, .LC2
	mov	w3, 276
	add	x0, x0, :lo12:.LC2
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x20, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x20, 1416]
	add	x2, x20, 1904
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	_printk
	ldr	w0, [x20, 44]
	tbz	x0, 21, .L208
.L192:
	sbfx	x0, x19, 0, 56
	and	x0, x0, x19
.L193:
	mov	x1, 140737488355320
	cmp	x0, x1
	bhi	.L205
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x19, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 8
	mov	x19, sp
	mov	x0, x19
	bl	__arch_copy_from_user
	mov	x2, x0
	sub	x0, x19, x0
	add	x0, x0, 8
	cbnz	x2, .L194
	adrp	x19, o_dbg
	ldr	w0, [x19, #:lo12:o_dbg]
	cmp	w0, 6
	bgt	.L209
.L199:
	ldr	x1, [sp]
	mov	x0, x22
	bl	hailo_vdma_find_mapped_user_buffer
	cbz	x0, .L210
	ldp	x3, x1, [x0]
	str	x1, [x3, 8]
	mov	x5, 256
	mov	x4, 290
	movk	x5, 0xdead, lsl 48
	movk	x4, 0xdead, lsl 48
	str	x3, [x1]
	stp	x5, x4, [x0]
	bl	hailo_vdma_buffer_put
	mov	x0, 0
.L191:
	mrs	x1, sp_el0
	ldr	x3, [sp, 8]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L211
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	ldp	x21, x22, [sp, 48]
	add	sp, sp, 64
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L205:
	mov	x0, sp
	mov	x2, 8
.L194:
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L212
	mov	x0, -14
	b	.L191
	.p2align 2,,3
.L208:
	ldr	x1, [x20]
	mov	x0, x19
	tst	w1, 67108864
	beq	.L193
	b	.L192
	.p2align 2,,3
.L209:
	ldr	x3, [sp]
	adrp	x2, .LC29
	ldr	x1, [x21, 16]
	add	x2, x2, :lo12:.LC29
	adrp	x0, .LC24
	add	x0, x0, :lo12:.LC24
	bl	_dev_printk
	b	.L199
	.p2align 2,,3
.L212:
	ldr	x1, [x21, 16]
	adrp	x2, .LC22
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC22
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -14
	b	.L191
.L210:
	ldr	w0, [x19, #:lo12:o_dbg]
	cmp	w0, 3
	bgt	.L213
	mov	x0, -22
	b	.L191
	.p2align 2,,3
.L213:
	ldr	x3, [sp]
	adrp	x2, .LC30
	ldr	x1, [x21, 16]
	add	x2, x2, :lo12:.LC30
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	bl	_dev_printk
	mov	x0, -22
	b	.L191
.L211:
	bl	__stack_chk_fail
	.size	hailo_vdma_buffer_unmap_ioctl, .-hailo_vdma_buffer_unmap_ioctl
	.section	.rodata.str1.8
	.align	3
.LC31:
	.string	"\0016IOCTL_HANDLER: Function hailo_vdma_buffer_sync_ioctl called at %s:%d\n"
	.align	3
.LC32:
	.string	"buffer handle %zu doesn't exist\n"
	.align	3
.LC33:
	.string	"Invalid sync_type given for vdma buffer sync.\n"
	.align	3
.LC34:
	.string	"Invalid offset/count given for vdma buffer sync. offset %zu count %zu buffer size %u\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_buffer_sync_ioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE8
	.text
.LPFE8:
	nop
	nop
	.type	hailo_vdma_buffer_sync_ioctl, %function
hailo_vdma_buffer_sync_ioctl:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #96
	mrs	x3, sp_el0
	stp	x29, x30, [sp, 48]
	add	x29, sp, 48
	stp	x19, x20, [sp, 64]
	adrp	x20, .LC0
	add	x20, x20, :lo12:.LC0
	stp	x21, x22, [sp, 80]
	mov	x22, x0
	mov	x21, x1
	ldr	x0, [x3, 1424]
	str	x0, [sp, 40]
	mov	x0, 0
	mov	x1, x20
	mov	x19, x2
	adrp	x0, .LC31
	mov	w2, 298
	add	x0, x0, :lo12:.LC31
	bl	_printk
	add	x4, sp, 4
	adrp	x3, .LANCHOR0
	add	x3, x3, :lo12:.LANCHOR0
	mov	x2, x20
	add	x1, x3, 184
	adrp	x0, .LC2
	mov	w3, 302
	add	x0, x0, :lo12:.LC2
	stp	xzr, xzr, [x4, 8]
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x20, sp_el0
// 0 "" 2
#NO_APP
	str	xzr, [sp, 28]
	str	wzr, [sp, 36]
	bl	_printk
	ldr	w1, [x20, 1416]
	add	x2, x20, 1904
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	_printk
	ldr	w0, [x20, 44]
	tbz	x0, 21, .L233
.L215:
	sbfx	x0, x19, 0, 56
	and	x0, x0, x19
.L216:
	mov	w1, 4294967268
	movk	x1, 0x7fff, lsl 32
	cmp	x0, x1
	bhi	.L229
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x19, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 28
	add	x19, sp, 12
	mov	x0, x19
	bl	__arch_copy_from_user
	mov	x2, x0
	sub	x0, x19, x0
	add	x0, x0, 28
	cbnz	x2, .L217
	ldr	x1, [sp, 12]
	mov	x0, x22
	bl	hailo_vdma_find_mapped_user_buffer
	mov	x1, x0
	cbz	x0, .L234
	ldr	w2, [sp, 20]
	cmp	w2, 1
	bhi	.L235
	ldp	x3, x4, [sp, 24]
	ldr	w5, [x0, 48]
	add	x0, x3, x4
	cmp	x0, w5, uxtw
	bhi	.L236
	mov	x0, x21
	bl	hailo_vdma_buffer_sync
	mov	x0, 0
.L214:
	mrs	x1, sp_el0
	ldr	x3, [sp, 40]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L237
	ldp	x29, x30, [sp, 48]
	ldp	x19, x20, [sp, 64]
	ldp	x21, x22, [sp, 80]
	add	sp, sp, 96
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L229:
	add	x0, sp, 12
	mov	x2, 28
.L217:
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L238
	mov	x0, -14
	b	.L214
	.p2align 2,,3
.L233:
	ldr	x1, [x20]
	mov	x0, x19
	tst	w1, 67108864
	beq	.L216
	b	.L215
	.p2align 2,,3
.L238:
	ldr	x1, [x21, 16]
	adrp	x2, .LC4
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC4
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -14
	b	.L214
	.p2align 2,,3
.L236:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L239
.L224:
	mov	x0, -22
	b	.L214
	.p2align 2,,3
.L239:
	ldr	x1, [x21, 16]
	adrp	x2, .LC34
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC34
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -22
	b	.L214
	.p2align 2,,3
.L235:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L224
	ldr	x1, [x21, 16]
	adrp	x2, .LC33
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC33
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -22
	b	.L214
.L234:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L224
	ldr	x3, [sp, 12]
	adrp	x2, .LC32
	ldr	x1, [x21, 16]
	add	x2, x2, :lo12:.LC32
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -22
	b	.L214
.L237:
	bl	__stack_chk_fail
	.size	hailo_vdma_buffer_sync_ioctl, .-hailo_vdma_buffer_sync_ioctl
	.section	.rodata.str1.8
	.align	3
.LC35:
	.string	"\0016IOCTL_HANDLER: Function hailo_desc_list_create_ioctl called at %s:%d\n"
	.align	3
.LC36:
	.string	"Invalid desc count given : %zu , circular descriptors count must be power of 2\n"
	.align	3
.LC37:
	.string	"Invalid desc page size given : %u\n"
	.align	3
.LC38:
	.string	"Create desc list desc_count: %zu desc_page_size: %u\n"
	.align	3
.LC39:
	.string	"Failed to allocate buffer for descriptors list struct\n"
	.align	3
.LC40:
	.string	"failed to allocate descriptors buffer\n"
	.align	3
.LC41:
	.string	"Created desc list, handle 0x%llu\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_desc_list_create_ioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE9
	.text
.LPFE9:
	nop
	nop
	.type	hailo_desc_list_create_ioctl, %function
hailo_desc_list_create_ioctl:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #160
	mrs	x3, sp_el0
	stp	x29, x30, [sp, 64]
	add	x29, sp, 64
	stp	x19, x20, [sp, 80]
	mov	x20, x2
	mov	w2, 333
	stp	x21, x22, [sp, 96]
	mov	x22, x0
	adrp	x21, .LC0
	stp	x23, x24, [sp, 112]
	add	x21, x21, :lo12:.LC0
	mov	x23, x1
	stp	x25, x26, [sp, 128]
	mov	x1, x21
	add	x26, sp, 29
	stp	x27, x28, [sp, 144]
	adrp	x25, .LANCHOR0
	add	x25, x25, :lo12:.LANCHOR0
	ldr	x0, [x3, 1424]
	str	x0, [sp, 56]
	mov	x0, 0
	adrp	x24, .LC3
	adrp	x0, .LC35
	add	x0, x0, :lo12:.LC35
	bl	_printk
	add	x24, x24, :lo12:.LC3
	mov	x2, 27
	mov	w1, 0
	mov	x0, x26
	bl	memset
	mov	x2, x21
	add	x1, x25, 216
	mov	w3, 339
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x19, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x19, 1416]
	add	x2, x19, 1904
	mov	x0, x24
	bl	_printk
	ldr	w0, [x19, 44]
	tbz	x0, 21, .L278
.L241:
	sbfx	x0, x20, 0, 56
	and	x0, x0, x20
.L242:
	mov	w1, 4294967269
	movk	x1, 0x7fff, lsl 32
	cmp	x0, x1
	bhi	.L268
	str	x20, [sp, 8]
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x20, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 27
	mov	x0, x26
	bl	__arch_copy_from_user
	mov	x2, x0
	cbnz	x0, .L279
	ldrb	w0, [sp, 39]
	adrp	x27, o_dbg
	ldr	w1, [x27, #:lo12:o_dbg]
	cbnz	w0, .L247
.L248:
	ldrh	w0, [sp, 37]
	sub	x2, x0, #1
	mov	x4, x0
	tst	x2, x0
	bne	.L280
	cmp	w1, 5
	bgt	.L281
.L252:
	adrp	x0, kmalloc_caches+8
	mov	x2, 72
	mov	w1, 3520
	ldr	x0, [x0, #:lo12:kmalloc_caches+8]
	bl	__kmalloc_cache_noprof
	mov	x19, x0
	cbz	x0, .L282
	mov	x0, x22
	bl	hailo_get_next_vdma_handle
	mov	x3, x0
	ldrh	w2, [sp, 37]
	ldr	x0, [x23, 16]
	mov	x5, x19
	ldrb	w4, [sp, 39]
	ldr	w1, [sp, 29]
	bl	hailo_desc_list_create
	sxtw	x28, w0
	tbnz	x0, 31, .L283
	mov	x4, x22
	mov	x2, x21
	add	x1, x25, 216
	mov	w3, 386
	adrp	x0, .LC18
	add	x0, x0, :lo12:.LC18
	ldr	x5, [x4, 32]!
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x21, sp_el0
// 0 "" 2
#NO_APP
	str	x19, [x5, 8]
	stp	x5, x4, [x19]
	ldr	x6, [x19, 16]
	str	x6, [sp, 40]
	ldr	x6, [x19, 32]
	str	x19, [x22, 32]
	str	x6, [sp, 48]
	bl	_printk
	ldr	w1, [x21, 1416]
	mov	x0, x24
	add	x2, x21, 1904
	bl	_printk
	ldr	w0, [x21, 44]
	tbz	x0, 21, .L284
.L257:
	sbfx	x0, x20, 0, 56
	and	x20, x20, x0
.L258:
	mov	w0, 4294967269
	movk	x0, 0x7fff, lsl 32
	cmp	x20, x0
	bls	.L259
.L262:
	ldr	w0, [x27, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L285
.L261:
	ldp	x2, x0, [x19]
	str	x0, [x2, 8]
	mov	x4, 256
	mov	x3, 290
	movk	x4, 0xdead, lsl 48
	movk	x3, 0xdead, lsl 48
	mov	x1, x19
	str	x2, [x0]
	stp	x4, x3, [x19]
	ldr	x0, [x23, 16]
	bl	hailo_desc_list_release
	mov	x0, x19
	bl	kfree
	.p2align 3,,7
.L246:
	mov	x28, -14
	b	.L240
	.p2align 2,,3
.L268:
	mov	x0, x26
	mov	x2, 27
.L243:
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L246
	ldr	x1, [x23, 16]
	adrp	x2, .LC4
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC4
	add	x0, x0, :lo12:.LC5
	mov	x28, -14
	bl	_dev_printk
	b	.L240
	.p2align 2,,3
.L247:
	ldr	x3, [sp, 29]
	sub	x0, x3, #1
	tst	x0, x3
	beq	.L248
	cmp	w1, 2
	bgt	.L286
.L249:
	mov	x28, -22
	b	.L240
	.p2align 2,,3
.L283:
	ldr	w0, [x27, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L287
.L256:
	mov	x0, x19
	bl	kfree
.L240:
	mrs	x0, sp_el0
	ldr	x2, [sp, 56]
	ldr	x1, [x0, 1424]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L288
	ldp	x29, x30, [sp, 64]
	mov	x0, x28
	ldp	x19, x20, [sp, 80]
	ldp	x21, x22, [sp, 96]
	ldp	x23, x24, [sp, 112]
	ldp	x25, x26, [sp, 128]
	ldp	x27, x28, [sp, 144]
	add	sp, sp, 160
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L278:
	ldr	x1, [x19]
	mov	x0, x20
	tst	w1, 67108864
	beq	.L242
	b	.L241
	.p2align 2,,3
.L281:
	ldr	x1, [x23, 16]
	adrp	x2, .LC38
	ldr	x3, [sp, 29]
	add	x2, x2, :lo12:.LC38
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	_dev_printk
	b	.L252
	.p2align 2,,3
.L259:
	ldr	x0, [sp, 8]
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x0, x0, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 27
	mov	x1, x26
	bl	__arch_copy_to_user
	cbnz	x0, .L262
	ldr	w0, [x27, #:lo12:o_dbg]
	cmp	w0, 5
	bgt	.L264
	mov	x28, 0
	b	.L240
	.p2align 2,,3
.L284:
	ldr	x0, [x21]
	tst	w0, 67108864
	beq	.L258
	b	.L257
	.p2align 2,,3
.L264:
	ldr	x1, [x23, 16]
	adrp	x2, .LC41
	ldr	x3, [sp, 40]
	add	x2, x2, :lo12:.LC41
	adrp	x0, .LC8
	mov	x28, 0
	add	x0, x0, :lo12:.LC8
	bl	_dev_printk
	b	.L240
	.p2align 2,,3
.L279:
	sub	x26, x26, x0
	add	x0, x26, 27
	b	.L243
	.p2align 2,,3
.L287:
	ldr	x1, [x23, 16]
	adrp	x2, .LC40
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC40
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	b	.L256
	.p2align 2,,3
.L285:
	ldr	x1, [x23, 16]
	adrp	x2, .LC20
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC20
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	b	.L261
.L286:
	ldr	x1, [x23, 16]
	adrp	x2, .LC36
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC36
	add	x0, x0, :lo12:.LC5
	mov	x28, -22
	bl	_dev_printk
	b	.L240
	.p2align 2,,3
.L280:
	cmp	w1, 2
	ble	.L249
	ldr	x1, [x23, 16]
	mov	w3, w0
	adrp	x2, .LC37
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC37
	add	x0, x0, :lo12:.LC5
	mov	x28, -22
	bl	_dev_printk
	b	.L240
.L282:
	ldr	w0, [x27, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L289
	mov	x28, -12
	b	.L240
.L289:
	ldr	x1, [x23, 16]
	adrp	x2, .LC39
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC39
	add	x0, x0, :lo12:.LC5
	mov	x28, -12
	bl	_dev_printk
	b	.L240
.L288:
	bl	__stack_chk_fail
	.size	hailo_desc_list_create_ioctl, .-hailo_desc_list_create_ioctl
	.section	.rodata.str1.8
	.align	3
.LC42:
	.string	"\0016IOCTL_HANDLER: Function hailo_desc_list_release_ioctl called at %s:%d\n"
	.align	3
.LC43:
	.string	"not found desc handle %llu\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_desc_list_release_ioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE10
	.text
.LPFE10:
	nop
	nop
	.type	hailo_desc_list_release_ioctl, %function
hailo_desc_list_release_ioctl:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #64
	mrs	x3, sp_el0
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	adrp	x20, .LC0
	add	x20, x20, :lo12:.LC0
	stp	x21, x22, [sp, 48]
	mov	x22, x0
	mov	x21, x1
	ldr	x0, [x3, 1424]
	str	x0, [sp, 8]
	mov	x0, 0
	mov	x1, x20
	mov	x19, x2
	adrp	x0, .LC42
	mov	w2, 404
	add	x0, x0, :lo12:.LC42
	bl	_printk
	str	xzr, [sp]
	adrp	x3, .LANCHOR0
	add	x3, x3, :lo12:.LANCHOR0
	mov	x2, x20
	add	x1, x3, 248
	adrp	x0, .LC2
	mov	w3, 408
	add	x0, x0, :lo12:.LC2
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x20, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x20, 1416]
	add	x2, x20, 1904
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	_printk
	ldr	w0, [x20, 44]
	tbz	x0, 21, .L307
.L291:
	sbfx	x0, x19, 0, 56
	and	x0, x0, x19
.L292:
	mov	x1, 140737488355320
	cmp	x0, x1
	bhi	.L303
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x19, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 8
	mov	x19, sp
	mov	x0, x19
	bl	__arch_copy_from_user
	mov	x2, x0
	sub	x0, x19, x0
	add	x0, x0, 8
	cbnz	x2, .L293
	ldr	x1, [sp]
	mov	x0, x22
	bl	hailo_vdma_find_descriptors_buffer
	mov	x19, x0
	cbz	x0, .L308
	mov	x1, x0
	mov	x4, 256
	ldp	x2, x0, [x0]
	str	x0, [x2, 8]
	mov	x3, 290
	movk	x4, 0xdead, lsl 48
	movk	x3, 0xdead, lsl 48
	str	x2, [x0]
	stp	x4, x3, [x19]
	ldr	x0, [x21, 16]
	bl	hailo_desc_list_release
	mov	x0, x19
	bl	kfree
	mov	x0, 0
.L290:
	mrs	x1, sp_el0
	ldr	x3, [sp, 8]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L309
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	ldp	x21, x22, [sp, 48]
	add	sp, sp, 64
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L303:
	mov	x0, sp
	mov	x2, 8
.L293:
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L310
	mov	x0, -14
	b	.L290
	.p2align 2,,3
.L307:
	ldr	x1, [x20]
	mov	x0, x19
	tst	w1, 67108864
	beq	.L292
	b	.L291
	.p2align 2,,3
.L310:
	ldr	x1, [x21, 16]
	adrp	x2, .LC4
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC4
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -14
	b	.L290
.L308:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 3
	bgt	.L311
	mov	x0, -22
	b	.L290
	.p2align 2,,3
.L311:
	ldr	x3, [sp]
	adrp	x2, .LC43
	ldr	x1, [x21, 16]
	add	x2, x2, :lo12:.LC43
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	bl	_dev_printk
	mov	x0, -22
	b	.L290
.L309:
	bl	__stack_chk_fail
	.size	hailo_desc_list_release_ioctl, .-hailo_desc_list_release_ioctl
	.section	.rodata.str1.8
	.align	3
.LC44:
	.string	"\0016IOCTL_HANDLER: Function hailo_desc_list_program_ioctl called at %s:%d\n"
	.align	3
.LC45:
	.string	"config buffer_handle=%zu desc_handle=%llu starting_desc=%u\n"
	.align	3
.LC46:
	.string	"invalid user/descriptors buffer\n"
	.align	3
.LC47:
	.string	"invalid buffer size. \n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_desc_list_program_ioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE11
	.text
.LPFE11:
	nop
	nop
	.type	hailo_desc_list_program_ioctl, %function
hailo_desc_list_program_ioctl:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #144
	mrs	x3, sp_el0
	stp	x29, x30, [sp, 80]
	add	x29, sp, 80
	stp	x19, x20, [sp, 96]
	adrp	x20, .LC0
	add	x20, x20, :lo12:.LC0
	stp	x21, x22, [sp, 112]
	mov	x21, x0
	mov	x22, x1
	str	x23, [sp, 128]
	mov	x1, x20
	add	x23, sp, 29
	mov	x19, x2
	ldr	x0, [x3, 1424]
	str	x0, [sp, 72]
	mov	x0, 0
	mov	w2, 430
	adrp	x0, .LC44
	add	x0, x0, :lo12:.LC44
	bl	_printk
	mov	x2, 43
	mov	w1, 0
	mov	x0, x23
	bl	memset
	adrp	x1, .LANCHOR0
	add	x1, x1, :lo12:.LANCHOR0
	mov	x2, x20
	add	x1, x1, 280
	mov	w3, 436
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	stp	xzr, xzr, [sp]
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x20, sp_el0
// 0 "" 2
#NO_APP
	str	xzr, [sp, 16]
	bl	_printk
	ldr	w1, [x20, 1416]
	add	x2, x20, 1904
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	_printk
	ldr	w0, [x20, 44]
	tbz	x0, 21, .L330
.L313:
	sbfx	x0, x19, 0, 56
	and	x0, x0, x19
.L314:
	mov	w1, 4294967253
	movk	x1, 0x7fff, lsl 32
	cmp	x0, x1
	bhi	.L327
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x19, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 43
	mov	x0, x23
	bl	__arch_copy_from_user
	sub	x23, x23, x0
	mov	x2, x0
	add	x0, x23, 43
	cbnz	x2, .L315
	adrp	x20, o_dbg
	ldr	w0, [x20, #:lo12:o_dbg]
	cmp	w0, 5
	bgt	.L331
.L320:
	ldr	x1, [sp, 29]
	mov	x0, x21
	bl	hailo_vdma_find_mapped_user_buffer
	mov	x19, x0
	ldr	x1, [sp, 53]
	mov	x0, x21
	bl	hailo_vdma_find_descriptors_buffer
	cmp	x19, 0
	ccmp	x0, 0, 4, ne
	beq	.L332
	ldr	x8, [sp, 37]
	ldr	w1, [x19, 48]
	cmp	x8, x1
	bhi	.L333
	ldr	x9, [sp, 45]
	add	x1, x0, 48
	ldr	x0, [x22]
	add	x19, x19, 56
	ldrb	w5, [sp, 61]
	mov	x3, sp
	ldrb	w4, [sp, 66]
	ldrb	w7, [sp, 71]
	ldr	w2, [sp, 62]
	ldr	w6, [sp, 67]
	str	x19, [sp]
	stp	w8, w9, [sp, 8]
	bl	hailo_vdma_program_descriptors_list
	sxtw	x0, w0
.L312:
	mrs	x1, sp_el0
	ldr	x3, [sp, 72]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L334
	ldp	x29, x30, [sp, 80]
	ldp	x19, x20, [sp, 96]
	ldp	x21, x22, [sp, 112]
	ldr	x23, [sp, 128]
	add	sp, sp, 144
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L327:
	mov	x0, x23
	mov	x2, 43
.L315:
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L335
.L318:
	mov	x0, -14
	b	.L312
	.p2align 2,,3
.L330:
	ldr	x1, [x20]
	mov	x0, x19
	tst	w1, 67108864
	beq	.L314
	b	.L313
	.p2align 2,,3
.L331:
	ldr	x1, [x22, 16]
	adrp	x2, .LC45
	ldr	x3, [sp, 29]
	add	x2, x2, :lo12:.LC45
	ldr	x4, [sp, 53]
	adrp	x0, .LC8
	ldr	w5, [sp, 62]
	add	x0, x0, :lo12:.LC8
	bl	_dev_printk
	b	.L320
	.p2align 2,,3
.L335:
	ldr	x1, [x22, 16]
	adrp	x2, .LC22
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC22
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -14
	b	.L312
	.p2align 2,,3
.L333:
	ldr	w0, [x20, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L318
	ldr	x1, [x22, 16]
	adrp	x2, .LC47
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC47
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -14
	b	.L312
	.p2align 2,,3
.L332:
	ldr	w0, [x20, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L318
	ldr	x1, [x22, 16]
	adrp	x2, .LC46
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC46
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -14
	b	.L312
.L334:
	bl	__stack_chk_fail
	.size	hailo_desc_list_program_ioctl, .-hailo_desc_list_program_ioctl
	.section	.rodata.str1.8
	.align	3
.LC48:
	.string	"\0016IOCTL_HANDLER: Function hailo_vdma_low_memory_buffer_alloc_ioctl called at %s:%d\n"
	.align	3
.LC49:
	.string	"memory alloc failed\n"
	.align	3
.LC50:
	.string	"failed allocating buffer from driver\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_low_memory_buffer_alloc_ioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE12
	.text
.LPFE12:
	nop
	nop
	.type	hailo_vdma_low_memory_buffer_alloc_ioctl, %function
hailo_vdma_low_memory_buffer_alloc_ioctl:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #128
	mrs	x3, sp_el0
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	stp	x19, x20, [sp, 48]
	mov	x20, x2
	mov	w2, 476
	stp	x21, x22, [sp, 64]
	mov	x22, x0
	adrp	x21, .LC0
	stp	x23, x24, [sp, 80]
	add	x21, x21, :lo12:.LC0
	adrp	x24, .LANCHOR0
	stp	x25, x26, [sp, 96]
	add	x24, x24, :lo12:.LANCHOR0
	mov	x25, x1
	stp	x27, x28, [sp, 112]
	mov	x1, x21
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x19, sp_el0
// 0 "" 2
#NO_APP
	ldr	x0, [x3, 1424]
	str	x0, [sp, 24]
	mov	x0, 0
	adrp	x23, .LC3
	adrp	x0, .LC48
	add	x0, x0, :lo12:.LC48
	bl	_printk
	stp	xzr, xzr, [sp, 8]
	mov	x2, x21
	add	x1, x24, 312
	mov	w3, 481
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	_printk
	add	x23, x23, :lo12:.LC3
	ldr	w1, [x19, 1416]
	add	x2, x19, 1904
	mov	x0, x23
	bl	_printk
	ldr	w0, [x19, 44]
	tbz	x0, 21, .L364
.L337:
	sbfx	x0, x20, 0, 56
	and	x0, x0, x20
.L338:
	mov	x1, 140737488355312
	cmp	x0, x1
	bhi	.L357
	mov	x27, x20
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x20, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 16
	add	x26, sp, 8
	mov	x0, x26
	bl	__arch_copy_from_user
	mov	x2, x0
	sub	x0, x26, x0
	add	x0, x0, 16
	cbnz	x2, .L339
	adrp	x0, kmalloc_caches+48
	mov	x2, 40
	mov	w1, 3520
	ldr	x0, [x0, #:lo12:kmalloc_caches+48]
	bl	__kmalloc_cache_noprof
	mov	x19, x0
	cbz	x0, .L365
	mov	x1, x0
	ldr	x0, [sp, 8]
	bl	hailo_vdma_low_memory_buffer_alloc
	sxtw	x28, w0
	tbnz	x0, 31, .L366
	mov	x0, x22
	bl	hailo_get_next_vdma_handle
	mov	x4, x22
	str	x0, [x19, 16]
	mov	x2, x21
	add	x1, x24, 312
	mov	w3, 507
	adrp	x0, .LC18
	ldr	x5, [x4, 48]!
	add	x0, x0, :lo12:.LC18
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x21, sp_el0
// 0 "" 2
#NO_APP
	str	x19, [x5, 8]
	stp	x5, x4, [x19]
	ldr	x6, [x19, 16]
	str	x19, [x22, 48]
	str	x6, [sp, 16]
	bl	_printk
	ldr	w1, [x21, 1416]
	mov	x0, x23
	add	x2, x21, 1904
	bl	_printk
	ldr	w0, [x21, 44]
	tbz	x0, 21, .L367
.L349:
	sbfx	x0, x20, 0, 56
	and	x20, x20, x0
.L350:
	mov	x0, 140737488355312
	cmp	x20, x0
	bhi	.L354
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x0, x27, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 16
	mov	x1, x26
	bl	__arch_copy_to_user
	cbnz	x0, .L354
	mov	x28, 0
.L336:
	mrs	x0, sp_el0
	ldr	x2, [sp, 24]
	ldr	x1, [x0, 1424]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L368
	ldp	x29, x30, [sp, 32]
	mov	x0, x28
	ldp	x19, x20, [sp, 48]
	ldp	x21, x22, [sp, 64]
	ldp	x23, x24, [sp, 80]
	ldp	x25, x26, [sp, 96]
	ldp	x27, x28, [sp, 112]
	add	sp, sp, 128
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L357:
	add	x0, sp, 8
	mov	x2, 16
.L339:
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L369
	mov	x28, -14
	b	.L336
	.p2align 2,,3
.L354:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L370
.L353:
	ldp	x2, x1, [x19]
	str	x1, [x2, 8]
	mov	x4, 256
	mov	x3, 290
	movk	x4, 0xdead, lsl 48
	movk	x3, 0xdead, lsl 48
	mov	x0, x19
	mov	x28, -14
	str	x2, [x1]
	stp	x4, x3, [x19]
	bl	hailo_vdma_low_memory_buffer_free
	mov	x0, x19
	bl	kfree
	b	.L336
	.p2align 2,,3
.L367:
	ldr	x0, [x21]
	tst	w0, 67108864
	beq	.L350
	b	.L349
	.p2align 2,,3
.L364:
	ldr	x1, [x19]
	mov	x0, x20
	tst	w1, 67108864
	beq	.L338
	b	.L337
	.p2align 2,,3
.L366:
	mov	x0, x19
	bl	kfree
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L336
	ldr	x1, [x25, 16]
	adrp	x2, .LC50
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC50
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	b	.L336
	.p2align 2,,3
.L369:
	ldr	x1, [x25, 16]
	adrp	x2, .LC22
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC22
	add	x0, x0, :lo12:.LC5
	mov	x28, -14
	bl	_dev_printk
	b	.L336
	.p2align 2,,3
.L370:
	ldr	x1, [x25, 16]
	adrp	x2, .LC20
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC20
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	b	.L353
.L368:
	bl	__stack_chk_fail
.L365:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L371
	mov	x28, -12
	b	.L336
.L371:
	ldr	x1, [x25, 16]
	adrp	x2, .LC49
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC49
	add	x0, x0, :lo12:.LC5
	mov	x28, -12
	bl	_dev_printk
	b	.L336
	.size	hailo_vdma_low_memory_buffer_alloc_ioctl, .-hailo_vdma_low_memory_buffer_alloc_ioctl
	.section	.rodata.str1.8
	.align	3
.LC51:
	.string	"\0016IOCTL_HANDLER: Function hailo_vdma_low_memory_buffer_free_ioctl called at %s:%d\n"
	.align	3
.LC52:
	.string	"vdma buffer handle %lx not found\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_low_memory_buffer_free_ioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE13
	.text
.LPFE13:
	nop
	nop
	.type	hailo_vdma_low_memory_buffer_free_ioctl, %function
hailo_vdma_low_memory_buffer_free_ioctl:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #64
	mrs	x3, sp_el0
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	adrp	x20, .LC0
	add	x20, x20, :lo12:.LC0
	stp	x21, x22, [sp, 48]
	mov	x22, x0
	mov	x21, x1
	ldr	x0, [x3, 1424]
	str	x0, [sp, 8]
	mov	x0, 0
	mov	x1, x20
	mov	x19, x2
	adrp	x0, .LC51
	mov	w2, 523
	add	x0, x0, :lo12:.LC51
	bl	_printk
	str	xzr, [sp]
	adrp	x3, .LANCHOR0
	add	x3, x3, :lo12:.LANCHOR0
	mov	x2, x20
	add	x1, x3, 360
	adrp	x0, .LC2
	mov	w3, 527
	add	x0, x0, :lo12:.LC2
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x20, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x20, 1416]
	add	x2, x20, 1904
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	_printk
	ldr	w0, [x20, 44]
	tbz	x0, 21, .L389
.L373:
	sbfx	x0, x19, 0, 56
	and	x0, x0, x19
.L374:
	mov	x1, 140737488355320
	cmp	x0, x1
	bhi	.L385
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x19, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 8
	mov	x19, sp
	mov	x0, x19
	bl	__arch_copy_from_user
	mov	x2, x0
	sub	x0, x19, x0
	add	x0, x0, 8
	cbnz	x2, .L375
	ldr	x1, [sp]
	mov	x0, x22
	bl	hailo_vdma_find_low_memory_buffer
	mov	x19, x0
	cbz	x0, .L390
	ldp	x2, x1, [x0]
	str	x1, [x2, 8]
	mov	x4, 256
	mov	x3, 290
	movk	x4, 0xdead, lsl 48
	movk	x3, 0xdead, lsl 48
	str	x2, [x1]
	stp	x4, x3, [x0]
	bl	hailo_vdma_low_memory_buffer_free
	mov	x0, x19
	bl	kfree
	mov	x0, 0
.L372:
	mrs	x1, sp_el0
	ldr	x3, [sp, 8]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L391
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	ldp	x21, x22, [sp, 48]
	add	sp, sp, 64
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L385:
	mov	x0, sp
	mov	x2, 8
.L375:
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L392
	mov	x0, -14
	b	.L372
	.p2align 2,,3
.L389:
	ldr	x1, [x20]
	mov	x0, x19
	tst	w1, 67108864
	beq	.L374
	b	.L373
	.p2align 2,,3
.L392:
	ldr	x1, [x21, 16]
	adrp	x2, .LC22
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC22
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -14
	b	.L372
.L390:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 3
	bgt	.L393
	mov	x0, -22
	b	.L372
	.p2align 2,,3
.L393:
	ldr	x3, [sp]
	adrp	x2, .LC52
	ldr	x1, [x21, 16]
	add	x2, x2, :lo12:.LC52
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	bl	_dev_printk
	mov	x0, -22
	b	.L372
.L391:
	bl	__stack_chk_fail
	.size	hailo_vdma_low_memory_buffer_free_ioctl, .-hailo_vdma_low_memory_buffer_free_ioctl
	.section	.rodata.str1.8
	.align	3
.LC53:
	.string	"\0016IOCTL_HANDLER: Function hailo_mark_as_in_use called at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_mark_as_in_use
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE14
	.text
.LPFE14:
	nop
	nop
	.type	hailo_mark_as_in_use, %function
hailo_mark_as_in_use:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #64
	mrs	x3, sp_el0
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	adrp	x20, .LC0
	add	x20, x20, :lo12:.LC0
	stp	x21, x22, [sp, 48]
	mov	x21, x0
	mov	x19, x1
	ldr	x0, [x3, 1424]
	str	x0, [sp, 8]
	mov	x0, 0
	mov	x22, x2
	mov	x1, x20
	adrp	x0, .LC53
	mov	w2, 548
	add	x0, x0, :lo12:.LC53
	bl	_printk
	strb	wzr, [sp, 7]
	ldr	x0, [x21, 72]
	cmp	x0, x22
	beq	.L395
	cbz	x0, .L396
	mov	w0, 1
	strb	w0, [sp, 7]
.L395:
	adrp	x1, .LANCHOR0
	add	x1, x1, :lo12:.LANCHOR0
	mov	x2, x20
	add	x1, x1, 400
	mov	w3, 561
	adrp	x0, .LC18
	add	x0, x0, :lo12:.LC18
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x20, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x20, 1416]
	add	x2, x20, 1904
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	_printk
	ldr	w0, [x20, 44]
	tbz	x0, 21, .L408
.L397:
	sbfx	x0, x19, 0, 56
	and	x0, x0, x19
.L398:
	mov	x1, 140737488355327
	cmp	x0, x1
	bls	.L399
.L402:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L409
	mov	x0, -14
	b	.L394
	.p2align 2,,3
.L399:
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x0, x19, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 1
	add	x1, sp, 7
	bl	__arch_copy_to_user
	cbnz	x0, .L402
.L394:
	mrs	x1, sp_el0
	ldr	x3, [sp, 8]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L410
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	ldp	x21, x22, [sp, 48]
	add	sp, sp, 64
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L396:
	str	x22, [x21, 72]
	b	.L395
	.p2align 2,,3
.L408:
	ldr	x1, [x20]
	mov	x0, x19
	tst	w1, 67108864
	beq	.L398
	b	.L397
	.p2align 2,,3
.L409:
	ldr	x1, [x21, 16]
	adrp	x2, .LC20
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC20
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -14
	b	.L394
.L410:
	bl	__stack_chk_fail
	.size	hailo_mark_as_in_use, .-hailo_mark_as_in_use
	.section	.rodata.str1.8
	.align	3
.LC54:
	.string	"\0016IOCTL_HANDLER: Function hailo_vdma_continuous_buffer_alloc_ioctl called at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_continuous_buffer_alloc_ioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE15
	.text
.LPFE15:
	nop
	nop
	.type	hailo_vdma_continuous_buffer_alloc_ioctl, %function
hailo_vdma_continuous_buffer_alloc_ioctl:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #128
	mrs	x3, sp_el0
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	stp	x19, x20, [sp, 48]
	mov	x20, x2
	mov	w2, 573
	stp	x21, x22, [sp, 64]
	mov	x22, x0
	adrp	x21, .LC0
	stp	x23, x24, [sp, 80]
	add	x21, x21, :lo12:.LC0
	adrp	x24, .LANCHOR0
	stp	x25, x26, [sp, 96]
	add	x24, x24, :lo12:.LANCHOR0
	mov	x25, x1
	stp	x27, x28, [sp, 112]
	mov	x1, x21
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x19, sp_el0
// 0 "" 2
#NO_APP
	ldr	x0, [x3, 1424]
	str	x0, [sp, 24]
	mov	x0, 0
	adrp	x23, .LC3
	adrp	x0, .LC54
	add	x0, x0, :lo12:.LC54
	bl	_printk
	stp	xzr, xzr, [sp]
	mov	x2, x21
	add	x1, x24, 424
	mov	w3, 579
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	str	xzr, [sp, 16]
	bl	_printk
	ldr	w1, [x19, 1416]
	add	x23, x23, :lo12:.LC3
	add	x2, x19, 1904
	mov	x0, x23
	bl	_printk
	ldr	w0, [x19, 44]
	tbz	x0, 21, .L438
.L412:
	sbfx	x0, x20, 0, 56
	and	x0, x0, x20
.L413:
	mov	w1, 4294967272
	movk	x1, 0x7fff, lsl 32
	cmp	x0, x1
	bhi	.L431
	mov	x27, x20
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x20, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 24
	mov	x26, sp
	mov	x0, x26
	bl	__arch_copy_from_user
	mov	x2, x0
	sub	x0, x26, x0
	add	x0, x0, 24
	cbnz	x2, .L414
	adrp	x0, kmalloc_caches+48
	mov	x2, 48
	mov	w1, 3520
	ldr	x0, [x0, #:lo12:kmalloc_caches+48]
	bl	__kmalloc_cache_noprof
	mov	x19, x0
	cbz	x0, .L439
	ldr	x1, [sp]
	mov	x2, x0
	ldr	x0, [x25, 16]
	mov	x3, 16383
	add	x1, x1, x3
	and	x1, x1, -16384
	bl	hailo_vdma_continuous_buffer_alloc
	sxtw	x28, w0
	tbnz	x0, 31, .L440
	mov	x0, x22
	bl	hailo_get_next_vdma_handle
	mov	x4, x22
	str	x0, [x19, 16]
	mov	x2, x21
	add	x1, x24, 424
	mov	w3, 605
	adrp	x0, .LC18
	ldr	x5, [x4, 64]!
	add	x0, x0, :lo12:.LC18
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x21, sp_el0
// 0 "" 2
#NO_APP
	str	x19, [x5, 8]
	stp	x5, x4, [x19]
	ldr	x6, [x19, 16]
	str	x6, [sp, 8]
	ldr	x6, [x19, 32]
	str	x19, [x22, 64]
	str	x6, [sp, 16]
	bl	_printk
	ldr	w1, [x21, 1416]
	mov	x0, x23
	add	x2, x21, 1904
	bl	_printk
	ldr	w0, [x21, 44]
	tbz	x0, 21, .L441
.L423:
	sbfx	x0, x20, 0, 56
	and	x20, x20, x0
.L424:
	mov	w0, 4294967272
	movk	x0, 0x7fff, lsl 32
	cmp	x20, x0
	bhi	.L428
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x0, x27, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 24
	mov	x1, x26
	bl	__arch_copy_to_user
	cbnz	x0, .L428
	mov	x28, 0
.L411:
	mrs	x0, sp_el0
	ldr	x2, [sp, 24]
	ldr	x1, [x0, 1424]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L442
	ldp	x29, x30, [sp, 32]
	mov	x0, x28
	ldp	x19, x20, [sp, 48]
	ldp	x21, x22, [sp, 64]
	ldp	x23, x24, [sp, 80]
	ldp	x25, x26, [sp, 96]
	ldp	x27, x28, [sp, 112]
	add	sp, sp, 128
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L431:
	mov	x0, sp
	mov	x2, 24
.L414:
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L443
	mov	x28, -14
	b	.L411
	.p2align 2,,3
.L428:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L444
.L427:
	ldp	x2, x0, [x19]
	str	x0, [x2, 8]
	mov	x4, 256
	mov	x3, 290
	movk	x4, 0xdead, lsl 48
	movk	x3, 0xdead, lsl 48
	mov	x1, x19
	mov	x28, -14
	str	x2, [x0]
	stp	x4, x3, [x19]
	ldr	x0, [x25, 16]
	bl	hailo_vdma_continuous_buffer_free
	mov	x0, x19
	bl	kfree
	b	.L411
	.p2align 2,,3
.L441:
	ldr	x0, [x21]
	tst	w0, 67108864
	beq	.L424
	b	.L423
	.p2align 2,,3
.L438:
	ldr	x1, [x19]
	mov	x0, x20
	tst	w1, 67108864
	beq	.L413
	b	.L412
	.p2align 2,,3
.L440:
	mov	x0, x19
	bl	kfree
	b	.L411
	.p2align 2,,3
.L443:
	ldr	x1, [x25, 16]
	adrp	x2, .LC22
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC22
	add	x0, x0, :lo12:.LC5
	mov	x28, -14
	bl	_dev_printk
	b	.L411
	.p2align 2,,3
.L444:
	ldr	x1, [x25, 16]
	adrp	x2, .LC20
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC20
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	b	.L427
.L442:
	bl	__stack_chk_fail
.L439:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L445
	mov	x28, -12
	b	.L411
.L445:
	ldr	x1, [x25, 16]
	adrp	x2, .LC49
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC49
	add	x0, x0, :lo12:.LC5
	mov	x28, -12
	bl	_dev_printk
	b	.L411
	.size	hailo_vdma_continuous_buffer_alloc_ioctl, .-hailo_vdma_continuous_buffer_alloc_ioctl
	.section	.rodata.str1.8
	.align	3
.LC55:
	.string	"\0016IOCTL_HANDLER: Function hailo_vdma_continuous_buffer_free_ioctl called at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_continuous_buffer_free_ioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE16
	.text
.LPFE16:
	nop
	nop
	.type	hailo_vdma_continuous_buffer_free_ioctl, %function
hailo_vdma_continuous_buffer_free_ioctl:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #64
	mrs	x3, sp_el0
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	adrp	x20, .LC0
	add	x20, x20, :lo12:.LC0
	stp	x21, x22, [sp, 48]
	mov	x22, x0
	mov	x21, x1
	ldr	x0, [x3, 1424]
	str	x0, [sp, 8]
	mov	x0, 0
	mov	x1, x20
	mov	x19, x2
	adrp	x0, .LC55
	mov	w2, 620
	add	x0, x0, :lo12:.LC55
	bl	_printk
	str	xzr, [sp]
	adrp	x3, .LANCHOR0
	add	x3, x3, :lo12:.LANCHOR0
	mov	x2, x20
	add	x1, x3, 472
	adrp	x0, .LC2
	mov	w3, 624
	add	x0, x0, :lo12:.LC2
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x20, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x20, 1416]
	add	x2, x20, 1904
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	_printk
	ldr	w0, [x20, 44]
	tbz	x0, 21, .L463
.L447:
	sbfx	x0, x19, 0, 56
	and	x0, x0, x19
.L448:
	mov	x1, 140737488355320
	cmp	x0, x1
	bhi	.L459
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x19, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 8
	mov	x19, sp
	mov	x0, x19
	bl	__arch_copy_from_user
	mov	x2, x0
	sub	x0, x19, x0
	add	x0, x0, 8
	cbnz	x2, .L449
	ldr	x1, [sp]
	mov	x0, x22
	bl	hailo_vdma_find_continuous_buffer
	mov	x19, x0
	cbz	x0, .L464
	mov	x1, x0
	mov	x4, 256
	ldp	x2, x0, [x0]
	str	x0, [x2, 8]
	mov	x3, 290
	movk	x4, 0xdead, lsl 48
	movk	x3, 0xdead, lsl 48
	str	x2, [x0]
	stp	x4, x3, [x19]
	ldr	x0, [x21, 16]
	bl	hailo_vdma_continuous_buffer_free
	mov	x0, x19
	bl	kfree
	mov	x0, 0
.L446:
	mrs	x1, sp_el0
	ldr	x3, [sp, 8]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L465
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	ldp	x21, x22, [sp, 48]
	add	sp, sp, 64
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L459:
	mov	x0, sp
	mov	x2, 8
.L449:
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L466
	mov	x0, -14
	b	.L446
	.p2align 2,,3
.L463:
	ldr	x1, [x20]
	mov	x0, x19
	tst	w1, 67108864
	beq	.L448
	b	.L447
	.p2align 2,,3
.L466:
	ldr	x1, [x21, 16]
	adrp	x2, .LC22
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC22
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -14
	b	.L446
.L464:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 3
	bgt	.L467
	mov	x0, -22
	b	.L446
	.p2align 2,,3
.L467:
	ldr	x3, [sp]
	adrp	x2, .LC52
	ldr	x1, [x21, 16]
	add	x2, x2, :lo12:.LC52
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	bl	_dev_printk
	mov	x0, -22
	b	.L446
.L465:
	bl	__stack_chk_fail
	.size	hailo_vdma_continuous_buffer_free_ioctl, .-hailo_vdma_continuous_buffer_free_ioctl
	.section	.rodata.str1.8
	.align	3
.LC56:
	.string	"\0016IOCTL_HANDLER: Function hailo_vdma_interrupts_read_timestamps_ioctl called at %s:%d\n"
	.align	3
.LC57:
	.string	"Start read interrupt timestamps ioctl\n"
	.align	3
.LC58:
	.string	"Invalid engine %u"
	.align	3
.LC59:
	.string	"Failed read engine interrupts for %u:%u"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_interrupts_read_timestamps_ioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE17
	.text
.LPFE17:
	nop
	nop
	.type	hailo_vdma_interrupts_read_timestamps_ioctl, %function
hailo_vdma_interrupts_read_timestamps_ioctl:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -96]!
	mov	w2, 645
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	adrp	x22, .LC0
	add	x22, x22, :lo12:.LC0
	stp	x25, x26, [sp, 64]
	adrp	x26, o_dbg
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x19, x1
	adrp	x0, .LC56
	mov	x1, x22
	add	x0, x0, :lo12:.LC56
	stp	x23, x24, [sp, 48]
	add	x25, x20, 80
	str	x27, [sp, 80]
	bl	_printk
	ldr	w0, [x26, #:lo12:o_dbg]
	mov	x27, x25
	cmp	w0, 6
	bgt	.L496
.L469:
	adrp	x24, .LANCHOR0
	add	x24, x24, :lo12:.LANCHOR0
	add	x1, x24, 512
	mov	x2, x22
	mov	w3, 652
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x21, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x21, 1416]
	adrp	x23, .LC3
	add	x23, x23, :lo12:.LC3
	add	x2, x21, 1904
	mov	x0, x23
	bl	_printk
	ldr	w0, [x21, 44]
	tbz	x0, 21, .L497
.L470:
	sbfx	x0, x19, 0, 56
	and	x0, x0, x19
.L471:
	mov	w1, 4294964730
	movk	x1, 0x7fff, lsl 32
	cmp	x0, x1
	bhi	.L489
	mov	x27, x19
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x19, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 2566
	mov	x0, x25
	bl	__arch_copy_from_user
	mov	x2, x0
	cbnz	x0, .L498
	ldr	x1, [x20, 24]
	ldrb	w2, [x20, 80]
	mov	x3, x2
	cmp	x1, w2, uxtb
	bls	.L499
	ldr	x0, [x20, 32]
	mov	x3, 51472
	movk	x3, 0x5, lsl 16
	mov	x1, x25
	madd	x0, x2, x3, x0
	bl	hailo_vdma_engine_read_timestamps
	mov	w21, w0
	tbnz	w0, #31, .L500
	mov	x2, x22
	add	x1, x24, 512
	mov	w3, 672
	adrp	x0, .LC18
	add	x0, x0, :lo12:.LC18
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x21, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x21, 1416]
	mov	x0, x23
	add	x2, x21, 1904
	bl	_printk
	ldr	w0, [x21, 44]
	tbz	x0, 21, .L501
.L482:
	sbfx	x0, x19, 0, 56
	and	x19, x19, x0
.L483:
	mov	w0, 4294964730
	movk	x0, 0x7fff, lsl 32
	cmp	x19, x0
	bls	.L484
.L487:
	ldr	w0, [x26, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L502
.L475:
	mov	x0, -12
	b	.L468
	.p2align 2,,3
.L489:
	mov	x2, 2566
.L472:
	mov	x0, x27
	mov	w1, 0
	bl	memset
	ldr	w0, [x26, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L475
	ldr	x1, [x20, 16]
	adrp	x2, .LC4
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC4
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -12
	b	.L468
	.p2align 2,,3
.L500:
	ldr	w0, [x26, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L503
.L481:
	sxtw	x0, w21
.L468:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L496:
	ldr	x1, [x20, 16]
	adrp	x2, .LC57
	adrp	x0, .LC24
	add	x2, x2, :lo12:.LC57
	add	x0, x0, :lo12:.LC24
	bl	_dev_printk
	b	.L469
	.p2align 2,,3
.L497:
	ldr	x1, [x21]
	mov	x0, x19
	tst	w1, 67108864
	beq	.L471
	b	.L470
	.p2align 2,,3
.L484:
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x0, x27, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 2566
	mov	x1, x25
	bl	__arch_copy_to_user
	cbnz	x0, .L487
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L503:
	ldr	x1, [x20, 16]
	adrp	x2, .LC59
	ldrb	w4, [x25, 1]
	add	x2, x2, :lo12:.LC59
	ldrb	w3, [x20, 80]
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	b	.L481
	.p2align 2,,3
.L501:
	ldr	x0, [x21]
	tst	w0, 67108864
	beq	.L483
	b	.L482
	.p2align 2,,3
.L502:
	ldr	x1, [x20, 16]
	adrp	x2, .LC20
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC20
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -12
	b	.L468
	.p2align 2,,3
.L498:
	sub	x27, x25, x0
	add	x27, x27, 2566
	b	.L472
	.p2align 2,,3
.L499:
	ldr	w0, [x26, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L504
	mov	x0, -22
	b	.L468
	.p2align 2,,3
.L504:
	ldr	x1, [x20, 16]
	adrp	x2, .LC58
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC58
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -22
	b	.L468
	.size	hailo_vdma_interrupts_read_timestamps_ioctl, .-hailo_vdma_interrupts_read_timestamps_ioctl
	.section	.rodata.str1.8
	.align	3
.LC60:
	.string	"\0016IOCTL_HANDLER: Function hailo_vdma_launch_transfer_ioctl called at %s:%d\n"
	.align	3
.LC61:
	.string	"Invalid channel %u"
	.align	3
.LC62:
	.string	"too many buffers %u\n"
	.align	3
.LC63:
	.string	"invalid descriptors list handle\n"
	.align	3
.LC64:
	.string	"invalid user buffer\n"
	.align	3
.LC65:
	.string	"Syncing size %u while buffer size is %u\n"
	.align	3
.LC66:
	.string	"Syncing offset %u while buffer size is %u\n"
	.align	3
.LC67:
	.string	"Failed launch transfer %d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_launch_transfer_ioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_get_next_vdma_handle
	.align	3
	.8byte	.LPFE18
	.text
.LPFE18:
	nop
	nop
	.type	hailo_vdma_launch_transfer_ioctl, %function
hailo_vdma_launch_transfer_ioctl:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #320
	mrs	x3, sp_el0
	stp	x29, x30, [sp, 224]
	add	x29, sp, 224
	stp	x0, x2, [sp, 16]
	mov	w2, 685
	stp	x19, x20, [sp, 240]
	add	x20, sp, 151
	stp	x21, x22, [sp, 256]
	mov	x22, x1
	stp	x27, x28, [sp, 304]
	adrp	x28, .LC0
	add	x4, x28, :lo12:.LC0
	str	x4, [sp, 48]
	mov	x19, x4
	mov	x1, x4
	ldr	x0, [x3, 1424]
	str	x0, [sp, 216]
	mov	x0, 0
	adrp	x0, .LC60
	add	x0, x0, :lo12:.LC60
	bl	_printk
	mov	x2, 65
	mov	w1, 0
	mov	x0, x20
	bl	memset
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	x2, x19
	add	x1, x0, 560
	mov	w3, 694
	str	x0, [sp, 64]
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	stp	xzr, xzr, [sp, 96]
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x19, sp_el0
// 0 "" 2
#NO_APP
	stp	xzr, xzr, [sp, 112]
	stp	xzr, xzr, [sp, 128]
	bl	_printk
	ldr	w1, [x19, 1416]
	add	x2, x19, 1904
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	str	x0, [sp, 56]
	bl	_printk
	ldr	w0, [x19, 44]
	tbz	x0, 21, .L564
.L506:
	ldr	x1, [sp, 24]
	sbfx	x0, x1, 0, 56
	and	x0, x0, x1
.L507:
	mov	x1, 140737488355264
	cmp	x0, x1
	bcs	.L543
	ldr	x0, [sp, 24]
	str	x0, [sp, 88]
	stp	x23, x24, [sp, 272]
	stp	x25, x26, [sp, 288]
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x0, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 65
	mov	x0, x20
	bl	__arch_copy_from_user
	mov	x2, x0
	cbnz	x0, .L565
	ldr	x0, [x22, 24]
	ldrb	w1, [sp, 151]
	str	x1, [sp, 32]
	mov	x3, x1
	cmp	x0, w1, uxtb
	bls	.L566
	ldr	x1, [x22, 32]
	str	x1, [sp, 72]
	ldrb	w0, [sp, 152]
	str	w0, [sp, 44]
	cmp	w0, 31
	bhi	.L567
	ldrb	w3, [sp, 166]
	cmp	w3, 2
	bhi	.L568
	ldr	x0, [sp, 16]
	ldr	x1, [sp, 153]
	bl	hailo_vdma_find_descriptors_buffer
	str	x0, [sp, 80]
	cbz	x0, .L519
	ldrb	w4, [sp, 166]
	mov	w19, 0
	cbz	w4, .L558
	add	x21, sp, 96
	add	x26, sp, 104
	add	x25, sp, 108
	add	x24, sp, 112
	b	.L520
	.p2align 2,,3
.L524:
	add	x27, x20, x27
	ldr	w4, [x28, 48]
	ldr	w0, [x27, 12]
	cmp	w0, w4
	bhi	.L569
	ldr	w3, [x27, 8]
	cmp	w4, w3
	bcc	.L570
	uxtw	x4, w0
	uxtw	x3, w3
	mov	x0, x22
	mov	w2, 1
	mov	x1, x28
	bl	hailo_vdma_buffer_sync_cyclic
	add	x6, x23, x23, lsl 1
	ldrb	w4, [sp, 166]
	ldp	w3, w5, [x27, 8]
	lsl	x2, x6, 3
	add	w0, w19, 1
	add	x7, x28, 56
	str	x28, [x24, x6, lsl 3]
	and	w19, w0, 255
	str	w5, [x26, x2]
	mov	x5, x21
	str	x7, [x21, x6, lsl 3]
	str	w3, [x25, x2]
	cmp	w4, w0, uxtb
	bls	.L521
.L520:
	sxtw	x23, w19
	add	x5, x23, 1
	ldr	x0, [sp, 16]
	lsl	x27, x5, 4
	ldr	x1, [x20, x27]
	bl	hailo_vdma_find_mapped_user_buffer
	mov	x28, x0
	cbnz	x0, .L524
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L571
.L562:
	ldp	x23, x24, [sp, 272]
	ldp	x25, x26, [sp, 288]
.L511:
	mov	x0, -14
	b	.L505
	.p2align 2,,3
.L543:
	mov	x0, x20
	mov	x2, 65
.L508:
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L511
	ldr	x1, [x22, 16]
	adrp	x2, .LC22
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC22
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -14
	b	.L505
	.p2align 2,,3
.L564:
	ldr	x1, [x19]
	ldr	x0, [sp, 24]
	tst	w1, 67108864
	beq	.L507
	b	.L506
.L558:
	add	x5, sp, 96
	.p2align 3,,7
.L521:
	ldr	w1, [sp, 44]
	mov	x0, 11848
	ldrb	w8, [sp, 207]
	mov	x10, 51472
	ldr	x11, [sp, 32]
	movk	x10, 0x5, lsl 16
	mul	x1, x1, x0
	ldr	w9, [sp, 203]
	ldr	x0, [x22]
	strb	w8, [sp, 8]
	ldp	x8, x2, [sp, 72]
	add	x1, x1, 16
	ldrb	w6, [sp, 165]
	ldr	w3, [sp, 161]
	ldr	w7, [sp, 199]
	madd	x1, x11, x10, x1
	str	w9, [sp]
	add	x2, x2, 48
	add	x1, x8, x1
	bl	hailo_vdma_launch_transfer
	mov	w19, w0
	tbnz	w0, #31, .L572
	ldr	x2, [sp, 48]
	mov	w3, 785
	ldr	x0, [sp, 64]
	stp	w19, wzr, [sp, 208]
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x19, sp_el0
// 0 "" 2
#NO_APP
	add	x1, x0, 560
	adrp	x0, .LC18
	add	x0, x0, :lo12:.LC18
	bl	_printk
	ldr	x0, [sp, 56]
	add	x2, x19, 1904
	ldr	w1, [x19, 1416]
	bl	_printk
	ldr	w0, [x19, 44]
	tbz	x0, 21, .L573
.L536:
	ldr	x1, [sp, 24]
	sbfx	x0, x1, 0, 56
	and	x0, x1, x0
	str	x0, [sp, 24]
.L537:
	ldr	x1, [sp, 24]
	mov	x0, 140737488355264
	cmp	x1, x0
	bcc	.L538
.L540:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L562
	ldr	x1, [x22, 16]
	adrp	x2, .LC20
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC20
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	ldp	x23, x24, [sp, 272]
	mov	x0, -14
	ldp	x25, x26, [sp, 288]
	b	.L505
	.p2align 2,,3
.L569:
	adrp	x1, o_dbg
	ldr	w1, [x1, #:lo12:o_dbg]
	cmp	w1, 2
	bgt	.L574
.L515:
	mov	x0, -22
	b	.L563
	.p2align 2,,3
.L570:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L515
	ldr	x1, [x22, 16]
	adrp	x2, .LC66
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC66
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -22
	b	.L563
	.p2align 2,,3
.L572:
	str	w0, [sp, 212]
	cmn	w0, #104
	beq	.L528
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L575
.L528:
	ldr	x2, [sp, 48]
	mov	w3, 774
	ldr	x0, [sp, 64]
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x21, sp_el0
// 0 "" 2
#NO_APP
	add	x1, x0, 560
	adrp	x0, .LC18
	add	x0, x0, :lo12:.LC18
	bl	_printk
	ldr	x0, [sp, 56]
	add	x2, x21, 1904
	ldr	w1, [x21, 1416]
	bl	_printk
	ldr	w0, [x21, 44]
	tbz	x0, 21, .L576
.L529:
	ldr	x1, [sp, 24]
	sbfx	x0, x1, 0, 56
	and	x0, x1, x0
	str	x0, [sp, 24]
.L530:
	ldr	x1, [sp, 24]
	mov	x0, 140737488355264
	cmp	x1, x0
	bcs	.L534
	ldr	x0, [sp, 88]
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x0, x0, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 65
	mov	x1, x20
	bl	__arch_copy_to_user
	cbnz	x0, .L534
.L535:
	ldp	x23, x24, [sp, 272]
	sxtw	x0, w19
	ldp	x25, x26, [sp, 288]
.L505:
	mrs	x1, sp_el0
	ldr	x3, [sp, 216]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L577
	ldp	x29, x30, [sp, 224]
	ldp	x19, x20, [sp, 240]
	ldp	x21, x22, [sp, 256]
	ldp	x27, x28, [sp, 304]
	add	sp, sp, 320
	hint	29 // autiasp
	ret
.L571:
	ldr	x1, [x22, 16]
	adrp	x2, .LC64
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC64
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	ldp	x23, x24, [sp, 272]
	mov	x0, -14
	ldp	x25, x26, [sp, 288]
	b	.L505
.L574:
	ldr	x1, [x22, 16]
	mov	w3, w0
	adrp	x2, .LC65
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC65
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -22
	b	.L563
.L565:
	sub	x20, x20, x0
	ldp	x23, x24, [sp, 272]
	add	x0, x20, 65
	ldp	x25, x26, [sp, 288]
	b	.L508
.L534:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L535
	ldr	x1, [x22, 16]
	adrp	x2, .LC20
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC20
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	b	.L535
.L538:
	ldr	x0, [sp, 88]
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x0, x0, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 65
	mov	x1, x20
	bl	__arch_copy_to_user
	cbnz	x0, .L540
.L563:
	ldp	x23, x24, [sp, 272]
	ldp	x25, x26, [sp, 288]
	b	.L505
.L575:
	ldr	x1, [x22, 16]
	mov	w3, w19
	adrp	x2, .LC67
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC67
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	b	.L528
.L573:
	ldr	x0, [x19]
	tst	w0, 67108864
	beq	.L537
	b	.L536
.L576:
	ldr	x0, [x21]
	tst	w0, 67108864
	beq	.L530
	b	.L529
.L568:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L515
	ldr	x1, [x22, 16]
	adrp	x2, .LC62
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC62
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -22
	b	.L563
.L567:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L515
	ldr	x1, [x22, 16]
	adrp	x2, .LC61
	ldr	w3, [sp, 44]
	add	x2, x2, :lo12:.LC61
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -22
	b	.L563
.L566:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L515
	ldr	x1, [x22, 16]
	adrp	x2, .LC58
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC58
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	mov	x0, -22
	b	.L563
.L519:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L562
	ldr	x1, [x22, 16]
	adrp	x2, .LC63
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC63
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	ldp	x23, x24, [sp, 272]
	mov	x0, -14
	ldp	x25, x26, [sp, 288]
	b	.L505
.L577:
	stp	x23, x24, [sp, 272]
	stp	x25, x26, [sp, 288]
	bl	__stack_chk_fail
	.size	hailo_vdma_launch_transfer_ioctl, .-hailo_vdma_launch_transfer_ioctl
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	__func__.15, %object
	.size	__func__.15, 33
__func__.15:
	.string	"hailo_vdma_enable_channels_ioctl"
	.zero	7
	.type	__func__.14, %object
	.size	__func__.14, 34
__func__.14:
	.string	"hailo_vdma_disable_channels_ioctl"
	.zero	6
	.type	__func__.13, %object
	.size	__func__.13, 33
__func__.13:
	.string	"hailo_vdma_interrupts_wait_ioctl"
	.zero	7
	.type	__func__.12, %object
	.size	__func__.12, 28
__func__.12:
	.string	"hailo_vdma_buffer_map_ioctl"
	.zero	4
	.type	__func__.11, %object
	.size	__func__.11, 30
__func__.11:
	.string	"hailo_vdma_buffer_unmap_ioctl"
	.zero	2
	.type	__func__.10, %object
	.size	__func__.10, 29
__func__.10:
	.string	"hailo_vdma_buffer_sync_ioctl"
	.zero	3
	.type	__func__.9, %object
	.size	__func__.9, 29
__func__.9:
	.string	"hailo_desc_list_create_ioctl"
	.zero	3
	.type	__func__.8, %object
	.size	__func__.8, 30
__func__.8:
	.string	"hailo_desc_list_release_ioctl"
	.zero	2
	.type	__func__.7, %object
	.size	__func__.7, 30
__func__.7:
	.string	"hailo_desc_list_program_ioctl"
	.zero	2
	.type	__func__.6, %object
	.size	__func__.6, 41
__func__.6:
	.string	"hailo_vdma_low_memory_buffer_alloc_ioctl"
	.zero	7
	.type	__func__.5, %object
	.size	__func__.5, 40
__func__.5:
	.string	"hailo_vdma_low_memory_buffer_free_ioctl"
	.type	__func__.4, %object
	.size	__func__.4, 21
__func__.4:
	.string	"hailo_mark_as_in_use"
	.zero	3
	.type	__func__.3, %object
	.size	__func__.3, 41
__func__.3:
	.string	"hailo_vdma_continuous_buffer_alloc_ioctl"
	.zero	7
	.type	__func__.2, %object
	.size	__func__.2, 40
__func__.2:
	.string	"hailo_vdma_continuous_buffer_free_ioctl"
	.type	__func__.1, %object
	.size	__func__.1, 44
__func__.1:
	.string	"hailo_vdma_interrupts_read_timestamps_ioctl"
	.zero	4
	.type	__func__.0, %object
	.size	__func__.0, 33
__func__.0:
	.string	"hailo_vdma_launch_transfer_ioctl"
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
