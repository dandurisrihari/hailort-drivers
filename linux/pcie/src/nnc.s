	.arch armv8-a
	.file	"nnc.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"/home/sri/hailort-drivers/linux/pcie/src/nnc.c"
	.align	3
.LC1:
	.string	"\0016IOCTL_HANDLER: Function hailo_read_log_ioctl called at %s:%d\n"
	.align	3
.LC2:
	.string	"\0016USER_COPY: About to call copy_from_user from function %s at %s:%d\n"
	.align	3
.LC3:
	.string	"\0016USER_COPY_CONTEXT: Process PID=%d, COMM=%s\n"
	.align	3
.LC4:
	.string	"HAILO_READ_LOG, copy_from_user fail\n"
	.align	3
.LC5:
	.string	"\0013"
	.align	3
.LC6:
	.string	"HAILO_READ_LOG, reading from log failed with error: %ld \n"
	.align	3
.LC7:
	.string	"\0016USER_COPY: About to call copy_to_user from function %s at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,hailo_read_log_ioctl
	.align	3
	.8byte	.LPFE1
	.text
.LPFE1:
	nop
	nop
	.type	hailo_read_log_ioctl, %function
hailo_read_log_ioctl:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -80]!
	mrs	x2, sp_el0
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x19, x1
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x20, sp_el0
// 0 "" 2
#NO_APP
	stp	x21, x22, [sp, 32]
	adrp	x21, .LC0
	add	x21, x21, :lo12:.LC0
	stp	x23, x24, [sp, 48]
	mov	x1, x21
	adrp	x24, .LANCHOR0
	stp	x25, x26, [sp, 64]
	sub	sp, sp, #544
	mov	x25, x0
	ldr	x0, [x2, 1424]
	str	x0, [sp, 536]
	mov	x0, 0
	add	x22, sp, 4
	mov	w2, 208
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	_printk
	add	x24, x24, :lo12:.LANCHOR0
	mov	x2, 532
	mov	w1, 0
	mov	x0, x22
	bl	memset
	mov	x2, x21
	mov	x1, x24
	mov	w3, 212
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	_printk
	ldr	w1, [x20, 1416]
	adrp	x23, .LC3
	add	x23, x23, :lo12:.LC3
	add	x2, x20, 1904
	mov	x0, x23
	bl	_printk
	ldr	w0, [x20, 44]
	tbz	x0, 21, .L25
.L2:
	sbfx	x0, x19, 0, 56
	and	x0, x0, x19
.L3:
	mov	w1, 4294966764
	movk	x1, 0x7fff, lsl 32
	cmp	x0, x1
	bhi	.L17
	mov	x26, x19
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x19, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 532
	mov	x0, x22
	bl	__arch_copy_from_user
	mov	x2, x0
	cbnz	x0, .L26
	mov	x1, x22
	add	x0, x25, 80
	bl	hailo_pcie_read_firmware_log
	mov	x20, x0
	tbnz	x0, #63, .L27
	mov	x2, x21
	mov	x1, x24
	mov	w3, 224
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x20, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x20, 1416]
	mov	x0, x23
	add	x2, x20, 1904
	bl	_printk
	ldr	w0, [x20, 44]
	tbz	x0, 21, .L28
.L12:
	sbfx	x0, x19, 0, 56
	and	x19, x19, x0
.L13:
	mov	w0, 4294966764
	movk	x0, 0x7fff, lsl 32
	cmp	x19, x0
	bhi	.L10
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x0, x26, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 532
	mov	x1, x22
	bl	__arch_copy_to_user
	cbnz	x0, .L10
	mov	x20, 0
	b	.L1
	.p2align 2,,3
.L17:
	mov	x0, x22
	mov	x2, 532
.L4:
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L6
.L10:
	mov	x20, -12
.L1:
	mrs	x0, sp_el0
	ldr	x2, [sp, 536]
	ldr	x1, [x0, 1424]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L29
	add	sp, sp, 544
	mov	x0, x20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L27:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L1
	ldr	x1, [x25, 16]
	mov	x3, x20
	adrp	x2, .LC6
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC6
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L1
	.p2align 2,,3
.L25:
	ldr	x1, [x20]
	mov	x0, x19
	tst	w1, 67108864
	beq	.L3
	b	.L2
	.p2align 2,,3
.L28:
	ldr	x0, [x20]
	tst	w0, 67108864
	beq	.L13
	b	.L12
	.p2align 2,,3
.L26:
	sub	x22, x22, x0
	add	x0, x22, 532
	b	.L4
	.p2align 2,,3
.L6:
	ldr	x1, [x25, 16]
	adrp	x2, .LC4
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC4
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L10
.L29:
	bl	__stack_chk_fail
	.size	hailo_read_log_ioctl, .-hailo_read_log_ioctl
	.section	.rodata.str1.8
	.align	3
.LC8:
	.string	"&x->wait"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_nnc_init
	.section	__patchable_function_entries,"awo",@progbits,hailo_read_log_ioctl
	.align	3
	.8byte	.LPFE2
	.text
.LPFE2:
	nop
	nop
	.type	hailo_nnc_init, %function
hailo_nnc_init:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	mov	x3, x0
	mov	x29, sp
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x4, 4294967296
	str	x4, [x3], 8
	add	x0, x0, 32
	adrp	x2, .LANCHOR1
	stp	x3, x3, [x19, 8]
	add	x2, x2, :lo12:.LANCHOR1
	adrp	x1, .LC8
	str	wzr, [x19, 24]
	add	x1, x1, :lo12:.LC8
	str	wzr, [x19, 1584]
	bl	__init_swait_queue_head
	add	x1, x19, 1592
	str	x1, [x19, 1592]
	str	x1, [x19, 1600]
	add	x0, x19, 1608
	mov	x2, 1508
	mov	w1, 0
	bl	memset
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.size	hailo_nnc_init, .-hailo_nnc_init
	.align	2
	.p2align 3,,7
	.global	hailo_nnc_finalize
	.section	__patchable_function_entries,"awo",@progbits,hailo_read_log_ioctl
	.align	3
	.8byte	.LPFE3
	.text
.LPFE3:
	nop
	nop
	.type	hailo_nnc_finalize, %function
hailo_nnc_finalize:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	add	x20, x19, 1592
	bl	__rcu_read_lock
	ldr	x19, [x19, 1592]
	cmp	x19, x20
	beq	.L33
	str	x21, [sp, 32]
	mov	w21, 1
	.p2align 3,,7
.L34:
	strb	w21, [x19, 64]
	add	x0, x19, 32
	bl	complete
	ldr	x19, [x19]
	cmp	x19, x20
	bne	.L34
	ldr	x21, [sp, 32]
.L33:
	bl	__rcu_read_unlock
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.size	hailo_nnc_finalize, .-hailo_nnc_finalize
	.section	.rodata.str1.8
	.align	3
.LC9:
	.string	"\0016IOCTL_HANDLER: Function hailo_nnc_ioctl called at %s:%d\n"
	.align	3
.LC10:
	.string	"hailo_fw_control down_interruptible fail tgid:%d (process was interrupted or killed)\n"
	.align	3
.LC11:
	.string	"\0016"
	.align	3
.LC12:
	.string	"hailo_fw_control, copy_from_user fail\n"
	.align	3
.LC13:
	.string	"Failed writing fw control to pcie\n"
	.align	3
.LC14:
	.string	"hailo_fw_control, timeout waiting for control (timeout_ms=%d)\n"
	.align	3
.LC15:
	.string	"hailo_fw_control, wait for completion failed with err=%ld (process was interrupted or killed)\n"
	.align	3
.LC16:
	.string	"Failed reading fw control from pcie\n"
	.align	3
.LC17:
	.string	"hailo_fw_control, copy_to_user fail\n"
	.align	3
.LC18:
	.string	"\0016IOCTL_HANDLER: Function hailo_read_notification_ioctl called at %s:%d\n"
	.align	3
.LC19:
	.string	"HAILO_READ_NOTIFICATION - wait_for_completion_interruptible error. err=%ld. tgid=%d (process was interrupted or killed)\n"
	.align	3
.LC20:
	.string	"HAILO_READ_NOTIFICATION - down_interruptible error (process was interrupted or killed)\n"
	.align	3
.LC21:
	.string	"HAILO_READ_NOTIFICATION - notification disabled for tgid=%d\n"
	.align	3
.LC22:
	.string	"HAILO_READ_NOTIFICATION copy_to_user fail\n"
	.align	3
.LC23:
	.string	"HAILO_DISABLE_NOTIFICATION: disable notification"
	.align	3
.LC24:
	.string	"Invalid nnc ioctl code 0x%x (nr: %d)\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_nnc_ioctl
	.section	__patchable_function_entries,"awo",@progbits,hailo_read_log_ioctl
	.align	3
	.8byte	.LPFE4
	.text
.LPFE4:
	nop
	nop
	.type	hailo_nnc_ioctl, %function
hailo_nnc_ioctl:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -112]!
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	adrp	x22, .LC0
	add	x22, x22, :lo12:.LC0
	mov	x21, x3
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	w19, w1
	adrp	x0, .LC9
	mov	x1, x22
	add	x0, x0, :lo12:.LC9
	stp	x23, x24, [sp, 48]
	mov	x23, x2
	mov	x24, x4
	mov	w2, 236
	bl	_printk
	mov	w0, 28163
	movk	w0, 0xc214, lsl 16
	cmp	w19, w0
	beq	.L38
	bhi	.L39
	mov	w0, 28162
	cmp	w19, w0
	beq	.L40
	mov	w0, 28161
	movk	w0, 0x45e4, lsl 16
	cmp	w19, w0
	bne	.L42
	mov	x1, x22
	adrp	x0, .LC18
	mov	w2, 135
	add	x0, x0, :lo12:.LC18
	bl	_printk
	ldr	x19, [x20, 1696]
	add	x1, x20, 1696
	cmp	x19, x1
	beq	.L92
	stp	x25, x26, [sp, 64]
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x25, sp_el0
// 0 "" 2
#NO_APP
	b	.L69
	.p2align 2,,3
.L67:
	ldr	x19, [x19]
	cmp	x1, x19
	beq	.L106
.L69:
	ldr	w0, [x19, 16]
	ldr	w5, [x25, 1420]
	cmp	w5, w0
	bne	.L67
	ldr	x0, [x19, 24]
	cmp	x21, x0
	bne	.L67
	mov	x0, 4824
	add	x26, x20, x0
	mov	x0, x26
	stp	x27, x28, [sp, 80]
	bl	up
	add	x27, x19, 32
	mov	x0, x27
	bl	wait_for_completion_interruptible
	sxtw	x21, w0
	tbnz	x0, 31, .L107
	mov	x0, x26
	bl	down_interruptible
	cbnz	w0, .L108
	ldrb	w0, [x19, 64]
	cbnz	w0, .L109
	str	wzr, [x27]
	add	x26, x20, 1688
	mov	x0, x26
	add	x24, x20, 3220
	bl	_raw_spin_lock_irqsave
	mov	x19, x0
	ldr	x2, [x20, 1712]
	str	x2, [x24]
	add	x1, x20, 1720
	add	x0, x20, 3228
	bl	memcpy
	mov	x1, x19
	mov	x0, x26
	bl	_raw_spin_unlock_irqrestore
	adrp	x1, .LANCHOR0
	add	x1, x1, :lo12:.LANCHOR0
	mov	x2, x22
	add	x1, x1, 48
	mov	w3, 176
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	_printk
	ldr	w1, [x25, 1416]
	add	x2, x25, 1904
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	_printk
	ldr	w0, [x25, 44]
	tbz	x0, 21, .L110
.L76:
	sbfx	x0, x23, 0, 56
	and	x0, x0, x23
.L77:
	mov	w1, 4294965788
	movk	x1, 0x7fff, lsl 32
	cmp	x0, x1
	bls	.L78
.L81:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L111
.L80:
	ldp	x25, x26, [sp, 64]
	mov	x21, -12
	ldp	x27, x28, [sp, 80]
	b	.L37
	.p2align 2,,3
.L39:
	mov	w0, 28160
	movk	w0, 0xc5f8, lsl 16
	cmp	w19, w0
	bne	.L42
	mov	x1, 4824
	add	x0, x20, x1
	stp	x25, x26, [sp, 64]
	add	x26, x20, 160
	mov	x21, x26
	stp	x27, x28, [sp, 80]
	bl	up
	add	x27, x20, 104
	strb	wzr, [x24]
	mov	x0, x27
	bl	down_interruptible
	cbnz	w0, .L112
	adrp	x25, .LANCHOR0
	add	x25, x25, :lo12:.LANCHOR0
	add	x1, x25, 24
	mov	x2, x22
	mov	w3, 68
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x19, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x19, 1416]
	adrp	x24, .LC3
	add	x24, x24, :lo12:.LC3
	add	x2, x19, 1904
	mov	x0, x24
	bl	_printk
	ldr	w0, [x19, 44]
	tbz	x0, 21, .L113
.L46:
	sbfx	x0, x23, 0, 56
	and	x0, x0, x23
.L47:
	mov	w1, 4294965768
	movk	x1, 0x7fff, lsl 32
	cmp	x0, x1
	bhi	.L91
	str	x23, [sp, 104]
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x23, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 1528
	mov	x0, x26
	bl	__arch_copy_from_user
	mov	x2, x0
	cbnz	x0, .L114
	str	wzr, [x20, 128]
	add	x28, x20, 48
	mov	x0, x28
	mov	x1, x26
	add	x19, x20, 128
	bl	hailo_pcie_write_firmware_control
	sxtw	x21, w0
	tbnz	w21, #31, .L115
	ldr	w0, [x26, 1520]
	bl	__msecs_to_jiffies
	mov	x1, x0
	mov	x0, x19
	bl	wait_for_completion_interruptible_timeout
	cmp	x0, 0
	ble	.L116
	mov	x0, x28
	mov	x1, x26
	bl	hailo_pcie_read_firmware_control
	sxtw	x21, w0
	tbnz	w21, #31, .L117
	mov	x2, x22
	add	x1, x25, 24
	mov	w3, 103
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
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
	tbz	x0, 21, .L118
.L62:
	sbfx	x0, x23, 0, 56
	and	x23, x23, x0
.L63:
	mov	w0, 4294965768
	movk	x0, 0x7fff, lsl 32
	cmp	x23, x0
	bhi	.L64
	ldr	x0, [sp, 104]
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x0, x0, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 1528
	mov	x1, x26
	bl	__arch_copy_to_user
	cbz	x0, .L55
.L64:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L51
	ldr	x1, [x20, 16]
	adrp	x2, .LC17
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC17
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	.p2align 3,,7
.L51:
	mov	x21, -12
.L55:
	mov	x0, x27
	bl	up
	ldp	x19, x20, [sp, 16]
	mov	x0, x21
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L42:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L86
	mov	x21, -25
.L120:
	ldp	x19, x20, [sp, 16]
	mov	x0, x21
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L40:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 5
	bgt	.L119
.L82:
	bl	__rcu_read_lock
	ldr	x0, [x20, 1696]
	add	x3, x20, 1696
	cmp	x3, x0
	beq	.L83
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x4, sp_el0
// 0 "" 2
#NO_APP
	b	.L85
	.p2align 2,,3
.L84:
	ldr	x0, [x0]
	cmp	x3, x0
	beq	.L83
.L85:
	ldr	w1, [x0, 16]
	ldr	w2, [x4, 1420]
	cmp	w2, w1
	bne	.L84
	ldr	x1, [x0, 24]
	cmp	x21, x1
	bne	.L84
	mov	w1, 1
	strb	w1, [x0, 64]
	add	x0, x0, 32
	bl	complete
.L83:
	mov	x21, 0
	bl	__rcu_read_unlock
.L37:
	ldp	x19, x20, [sp, 16]
	mov	x0, x21
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L38:
	mov	x1, x23
	mov	x0, x20
	bl	hailo_read_log_ioctl
	mov	x21, x0
	ldp	x19, x20, [sp, 16]
	mov	x0, x21
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L86:
	ldr	x1, [x20, 16]
	and	w4, w19, 255
	mov	w3, w19
	adrp	x2, .LC24
	add	x1, x1, 200
	add	x2, x2, :lo12:.LC24
	adrp	x0, .LC5
	mov	x21, -25
	add	x0, x0, :lo12:.LC5
	bl	_dev_printk
	b	.L120
	.p2align 2,,3
.L119:
	ldr	x1, [x20, 16]
	adrp	x2, .LC23
	adrp	x0, .LC11
	add	x2, x2, :lo12:.LC23
	add	x0, x0, :lo12:.LC11
	add	x1, x1, 200
	bl	_dev_printk
	b	.L82
	.p2align 2,,3
.L106:
	mov	x21, -14
	mov	x0, x21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L91:
	mov	x2, 1528
.L48:
	mov	x0, x21
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L51
	ldr	x1, [x20, 16]
	adrp	x2, .LC12
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC12
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L51
	.p2align 2,,3
.L113:
	ldr	x1, [x19]
	mov	x0, x23
	tst	w1, 67108864
	beq	.L47
	b	.L46
	.p2align 2,,3
.L116:
	adrp	x1, o_dbg
	ldr	w1, [x1, #:lo12:o_dbg]
	bne	.L57
	cmp	w1, 2
	bgt	.L121
	mov	x21, -110
	b	.L55
	.p2align 2,,3
.L110:
	ldr	x1, [x25]
	mov	x0, x23
	tst	w1, 67108864
	beq	.L77
	b	.L76
.L92:
	mov	x21, -14
	b	.L37
.L121:
	ldr	w3, [x26, 1520]
	adrp	x2, .LC14
	ldr	x1, [x20, 16]
	add	x2, x2, :lo12:.LC14
	adrp	x0, .LC5
	mov	x21, -110
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L55
.L112:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 5
	bgt	.L122
.L44:
	ldp	x25, x26, [sp, 64]
	mov	x21, -512
	ldp	x27, x28, [sp, 80]
	b	.L37
	.p2align 2,,3
.L107:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 5
	bgt	.L123
.L105:
	strb	wzr, [x24]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	b	.L37
.L78:
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x0, x23, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 1508
	mov	x1, x24
	bl	__arch_copy_to_user
	cbnz	x0, .L81
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	b	.L37
.L115:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L55
	ldr	x1, [x20, 16]
	adrp	x2, .LC13
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC13
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L55
.L117:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L55
	ldr	x1, [x20, 16]
	adrp	x2, .LC16
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC16
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L55
.L57:
	cmp	w1, 5
	bgt	.L124
	mov	x21, -4
	b	.L55
	.p2align 2,,3
.L124:
	ldr	x1, [x20, 16]
	mov	x3, x0
	adrp	x2, .LC15
	adrp	x0, .LC11
	add	x2, x2, :lo12:.LC15
	add	x0, x0, :lo12:.LC11
	add	x1, x1, 200
	mov	x21, -4
	bl	_dev_printk
	b	.L55
.L123:
	ldr	w4, [x19, 16]
	mov	x3, x21
	ldr	x1, [x20, 16]
	adrp	x2, .LC19
	adrp	x0, .LC11
	add	x2, x2, :lo12:.LC19
	add	x0, x0, :lo12:.LC11
	add	x1, x1, 200
	bl	_dev_printk
	b	.L105
.L114:
	sub	x26, x26, x0
	add	x21, x26, 1528
	b	.L48
.L118:
	ldr	x0, [x22]
	tst	w0, 67108864
	beq	.L63
	b	.L62
.L122:
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x0, sp_el0
// 0 "" 2
#NO_APP
	ldr	w3, [x0, 1420]
	adrp	x2, .LC10
	ldr	x1, [x20, 16]
	add	x2, x2, :lo12:.LC10
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	add	x1, x1, 200
	bl	_dev_printk
	b	.L44
.L109:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 5
	bgt	.L125
.L75:
	ldp	x25, x26, [sp, 64]
	mov	x21, -125
	ldp	x27, x28, [sp, 80]
	b	.L37
.L108:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 5
	bgt	.L126
	mov	x21, -512
	b	.L105
.L126:
	ldr	x1, [x20, 16]
	adrp	x2, .LC20
	adrp	x0, .LC11
	add	x2, x2, :lo12:.LC20
	add	x0, x0, :lo12:.LC11
	add	x1, x1, 200
	mov	x21, -512
	bl	_dev_printk
	b	.L105
.L111:
	ldr	x1, [x20, 16]
	adrp	x2, .LC22
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC22
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	b	.L80
.L125:
	ldr	w3, [x25, 1420]
	adrp	x2, .LC21
	ldr	x1, [x20, 16]
	add	x2, x2, :lo12:.LC21
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	add	x1, x1, 200
	bl	_dev_printk
	b	.L75
	.size	hailo_nnc_ioctl, .-hailo_nnc_ioctl
	.section	.rodata.str1.8
	.align	3
.LC25:
	.string	"Failed to allocate notification wait structure.\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_nnc_file_context_init
	.section	__patchable_function_entries,"awo",@progbits,hailo_read_log_ioctl
	.align	3
	.8byte	.LPFE5
	.text
.LPFE5:
	nop
	nop
	.type	hailo_nnc_file_context_init, %function
hailo_nnc_file_context_init:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	adrp	x2, kmalloc_caches+8
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	ldr	x0, [x2, #:lo12:kmalloc_caches+8]
	str	x21, [sp, 32]
	mov	x2, 72
	ldr	x21, [x1, 16]
	mov	w1, 3264
	bl	__kmalloc_cache_noprof
	cbz	x0, .L132
	mov	x19, x0
	adrp	x2, .LANCHOR1
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x0, sp_el0
// 0 "" 2
#NO_APP
	ldr	w3, [x0, 1420]
	add	x2, x2, :lo12:.LANCHOR1
	str	w3, [x19, 16]
	add	x0, x19, 40
	str	x21, [x19, 24]
	adrp	x1, .LC8
	str	wzr, [x19, 32]
	add	x1, x1, :lo12:.LC8
	strb	wzr, [x19, 64]
	bl	__init_swait_queue_head
	ldr	x1, [x20, 1696]
	add	x0, x20, 1696
	stp	x1, x0, [x19]
#APP
// 84 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/rculist.h" 1
	stlr x19, [x0]
// 0 "" 2
#NO_APP
	mov	w0, 0
	str	x19, [x1, 8]
.L127:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
.L132:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L133
	mov	w0, -12
	b	.L127
.L133:
	ldr	x1, [x20, 16]
	adrp	x2, .LC25
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC25
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	bl	_dev_printk
	mov	w0, -12
	b	.L127
	.size	hailo_nnc_file_context_init, .-hailo_nnc_file_context_init
	.section	.rodata.str1.8
	.align	3
.LC26:
	.string	"hailo_nnc_driver_down, timeout waiting for shutdown response (timeout_ms=%d)\n"
	.align	3
.LC27:
	.string	"hailo_nnc_driver_down, wait for completion failed with err=%ld (process was interrupted or killed)\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_nnc_driver_down
	.section	__patchable_function_entries,"awo",@progbits,hailo_read_log_ioctl
	.align	3
	.8byte	.LPFE6
	.text
.LPFE6:
	nop
	nop
	.type	hailo_nnc_driver_down, %function
hailo_nnc_driver_down:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	add	x0, x0, 48
	str	wzr, [x20, 4760]
	bl	hailo_pcie_write_firmware_driver_shutdown
	mov	x0, 4760
	mov	x1, 2
	add	x0, x20, x0
	bl	wait_for_completion_timeout
	cmp	x0, 0
	ble	.L142
	mov	w0, 0
.L135:
.L134:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L142:
	mov	x19, x0
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	bne	.L136
	cmp	w0, 2
	bgt	.L137
	mov	w0, -110
	b	.L134
	.p2align 2,,3
.L136:
	cmp	w0, 5
	bgt	.L143
	mov	w0, w19
.L144:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L137:
	ldr	x1, [x20, 16]
	adrp	x2, .LC26
	adrp	x0, .LC5
	add	x2, x2, :lo12:.LC26
	add	x0, x0, :lo12:.LC5
	add	x1, x1, 200
	mov	w3, 5
	bl	_dev_printk
	mov	w0, -110
	b	.L134
	.p2align 2,,3
.L143:
	ldr	x1, [x20, 16]
	mov	x3, x19
	adrp	x2, .LC27
	adrp	x0, .LC11
	add	x2, x2, :lo12:.LC27
	add	x0, x0, :lo12:.LC11
	add	x1, x1, 200
	bl	_dev_printk
	mov	w0, w19
	b	.L144
	.size	hailo_nnc_driver_down, .-hailo_nnc_driver_down
	.align	2
	.p2align 3,,7
	.global	hailo_nnc_file_context_finalize
	.section	__patchable_function_entries,"awo",@progbits,hailo_read_log_ioctl
	.align	3
	.8byte	.LPFE7
	.text
.LPFE7:
	nop
	nop
	.type	hailo_nnc_file_context_finalize, %function
hailo_nnc_file_context_finalize:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -80]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	add	x22, x0, 1696
	stp	x23, x24, [sp, 48]
	mov	x23, x0
	ldr	x19, [x0, 1696]
	ldr	x21, [x1, 16]
	ldr	x20, [x19]
	cmp	x19, x22
	beq	.L146
	str	x25, [sp, 64]
	mov	x25, 290
	mov	x24, x1
	movk	x25, 0xdead, lsl 48
	b	.L148
	.p2align 2,,3
.L147:
	ldr	x2, [x20]
	mov	x19, x20
	cmp	x20, x22
	beq	.L152
.L150:
	mov	x20, x2
.L148:
	ldr	x2, [x19, 24]
	cmp	x21, x2
	bne	.L147
	ldp	x1, x0, [x19]
	str	x0, [x1, 8]
	str	x1, [x0]
	str	x25, [x19, 8]
	bl	synchronize_rcu
	mov	x0, x19
	bl	kfree
	ldr	x2, [x20]
	mov	x19, x20
	cmp	x20, x22
	bne	.L150
	.p2align 3,,7
.L152:
	ldr	x21, [x24, 16]
	ldr	x25, [sp, 64]
.L146:
	ldr	x0, [x23, 4920]
	cmp	x0, x21
	beq	.L153
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L153:
	mov	x0, x23
	bl	hailo_nnc_driver_down
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	hint	29 // autiasp
	ret
	.size	hailo_nnc_file_context_finalize, .-hailo_nnc_file_context_finalize
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	__func__.0, %object
	.size	__func__.0, 21
__func__.0:
	.string	"hailo_read_log_ioctl"
	.zero	3
	.type	__func__.2, %object
	.size	__func__.2, 17
__func__.2:
	.string	"hailo_fw_control"
	.zero	7
	.type	__func__.1, %object
	.size	__func__.1, 30
__func__.1:
	.string	"hailo_read_notification_ioctl"
	.bss
	.align	3
	.set	.LANCHOR1,. + 0
	.type	__key.3, %object
	.size	__key.3, 0
__key.3:
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
