	.arch armv8-a
	.file	"soc.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Timeout waiting for soc control (timeout_ms=%d)\n"
	.align	3
.LC1:
	.string	"\0013"
	.align	3
.LC2:
	.string	"soc control failed with err=%d (process was interrupted or killed)\n"
	.align	3
.LC3:
	.string	"\0016"
	.align	3
.LC4:
	.string	"soc control failed with status=%d\n"
	.align	3
.LC5:
	.string	"Invalid response control code %d (expected %d)\n"
	.text
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,soc_control
	.align	3
	.8byte	.LPFE1
	.text
.LPFE1:
	nop
	nop
	.type	soc_control, %function
soc_control:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x20, x2
	stp	x21, x22, [sp, 32]
	mov	x21, x1
	str	x23, [sp, 48]
	add	x23, x0, 48
	str	wzr, [x19, 4728]
	mov	x0, x23
	bl	hailo_pcie_soc_write_request
	mov	x0, 4728
	mov	x1, 250
	add	x0, x19, x0
	bl	wait_for_completion_interruptible_timeout
	cmp	w0, 0
	bgt	.L2
	adrp	x1, o_dbg
	ldr	w1, [x1, #:lo12:o_dbg]
	beq	.L13
	mov	w22, w0
	cmp	w1, 5
	bgt	.L14
.L1:
	ldp	x19, x20, [sp, 16]
	mov	w0, w22
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L2:
	mov	x0, x23
	mov	x1, x20
	bl	hailo_pcie_soc_read_response
	ldr	w22, [x20, 4]
	tbnz	w22, #31, .L15
	ldr	w3, [x20]
	mov	w22, 0
	ldr	w4, [x21]
	cmp	w3, w4
	beq	.L1
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L16
	mov	w22, -22
	b	.L1
	.p2align 2,,3
.L14:
	ldr	x1, [x19, 16]
	mov	w3, w0
	adrp	x2, .LC2
	adrp	x0, .LC3
	add	x2, x2, :lo12:.LC2
	add	x0, x0, :lo12:.LC3
	add	x1, x1, 200
	bl	_dev_printk
	ldp	x19, x20, [sp, 16]
	mov	w0, w22
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L15:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L1
	ldr	x1, [x19, 16]
	mov	w3, w22
	adrp	x2, .LC4
	adrp	x0, .LC1
	add	x2, x2, :lo12:.LC4
	add	x0, x0, :lo12:.LC1
	add	x1, x1, 200
	bl	_dev_printk
	ldr	w22, [x20, 4]
	b	.L1
.L16:
	ldr	x1, [x19, 16]
	adrp	x2, .LC5
	adrp	x0, .LC1
	add	x2, x2, :lo12:.LC5
	add	x0, x0, :lo12:.LC1
	add	x1, x1, 200
	mov	w22, -22
	bl	_dev_printk
	b	.L1
	.p2align 2,,3
.L13:
	cmp	w1, 2
	bgt	.L17
	mov	w22, -110
	b	.L1
	.p2align 2,,3
.L17:
	ldr	x1, [x19, 16]
	adrp	x2, .LC0
	adrp	x0, .LC1
	add	x2, x2, :lo12:.LC0
	add	x0, x0, :lo12:.LC1
	add	x1, x1, 200
	mov	w3, 1000
	mov	w22, -110
	bl	_dev_printk
	b	.L1
	.size	soc_control, .-soc_control
	.section	.rodata.str1.8
	.align	3
.LC6:
	.string	"Closing channels bitmap 0x%x\n"
	.text
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,soc_control
	.align	3
	.8byte	.LPFE2
	.text
.LPFE2:
	nop
	nop
	.type	close_channels, %function
close_channels:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #128
	adrp	x2, o_dbg
	stp	x29, x30, [sp, 64]
	add	x29, sp, 64
	ldr	w2, [x2, #:lo12:o_dbg]
	stp	x19, x20, [sp, 80]
	stp	x21, x22, [sp, 96]
	mov	w21, w1
	stp	x23, x24, [sp, 112]
	mov	x24, x0
	mrs	x0, sp_el0
	ldr	x3, [x0, 1424]
	str	x3, [sp, 56]
	mov	x3, 0
	add	x0, sp, 4
	str	wzr, [sp, 28]
	stp	xzr, xzr, [sp, 32]
	stp	xzr, xzr, [x0, 8]
	str	xzr, [sp, 48]
	ldr	x20, [x24, 4880]
	cmp	w2, 5
	bgt	.L28
.L19:
	add	x20, x20, 16
	mov	w19, 0
	mov	w23, 1
	mov	x22, 11848
	b	.L21
	.p2align 2,,3
.L20:
	add	w19, w19, 1
	add	x20, x20, x22
	cmp	w19, 32
	beq	.L29
.L21:
	lsl	w2, w23, w19
	tst	w2, w21
	beq	.L20
	ldr	x0, [x20, 8]
	add	w19, w19, 1
	add	x20, x20, x22
	bl	hailo_vdma_stop_channel
	cmp	w19, 32
	bne	.L21
.L29:
	mov	w3, 257
	add	x2, sp, 32
	add	x1, sp, 12
	mov	x0, x24
	stp	w3, w21, [sp, 12]
	str	xzr, [sp, 20]
	str	wzr, [sp, 28]
	bl	soc_control
	mrs	x1, sp_el0
	ldr	x3, [sp, 56]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L30
	ldp	x29, x30, [sp, 64]
	ldp	x19, x20, [sp, 80]
	ldp	x21, x22, [sp, 96]
	ldp	x23, x24, [sp, 112]
	add	sp, sp, 128
	hint	29 // autiasp
	ret
.L28:
	mov	w3, w1
	adrp	x2, .LC6
	ldr	x1, [x24, 16]
	add	x2, x2, :lo12:.LC6
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	add	x1, x1, 200
	bl	_dev_printk
	b	.L19
.L30:
	bl	__stack_chk_fail
	.size	close_channels, .-close_channels
	.section	.rodata.str1.8
	.align	3
.LC7:
	.string	"&x->wait"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_soc_init
	.section	__patchable_function_entries,"awo",@progbits,soc_control
	.align	3
	.8byte	.LPFE3
	.text
.LPFE3:
	nop
	nop
	.type	hailo_soc_init, %function
hailo_soc_init:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	adrp	x2, .LANCHOR0
	mov	x29, sp
	str	wzr, [x0], 8
	add	x2, x2, :lo12:.LANCHOR0
	adrp	x1, .LC7
	add	x1, x1, :lo12:.LC7
	bl	__init_swait_queue_head
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	ret
	.size	hailo_soc_init, .-hailo_soc_init
	.section	.rodata.str1.8
	.align	3
.LC8:
	.string	"/home/sri/hailort-drivers/linux/pcie/src/soc.c"
	.align	3
.LC9:
	.string	"\0016IOCTL_HANDLER: Function hailo_soc_connect_ioctl called at %s:%d\n"
	.align	3
.LC10:
	.string	"\0016USER_COPY: About to call copy_from_user from function %s at %s:%d\n"
	.align	3
.LC11:
	.string	"\0016USER_COPY_CONTEXT: Process PID=%d, COMM=%s\n"
	.align	3
.LC12:
	.string	"copy_from_user fail\n"
	.align	3
.LC13:
	.string	"Invalid input channel index %u\n"
	.align	3
.LC14:
	.string	"Invalid output channel index %u\n"
	.align	3
.LC15:
	.string	"input / output descriptors buffer not found \n"
	.align	3
.LC16:
	.string	"Invalid desc list size\n"
	.align	3
.LC17:
	.string	"Error starting vdma input channel index %u\n"
	.align	3
.LC18:
	.string	"Error starting vdma output channel index %u\n"
	.align	3
.LC19:
	.string	"\0016USER_COPY: About to call copy_to_user from function %s at %s:%d\n"
	.align	3
.LC20:
	.string	"copy_to_user fail\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_soc_connect_ioctl
	.section	__patchable_function_entries,"awo",@progbits,soc_control
	.align	3
	.8byte	.LPFE4
	.text
.LPFE4:
	nop
	nop
	.type	hailo_soc_connect_ioctl, %function
hailo_soc_connect_ioctl:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #208
	mrs	x4, sp_el0
	stp	x29, x30, [sp, 112]
	add	x29, sp, 112
	stp	x19, x20, [sp, 128]
	mov	x19, x3
	mov	x20, x1
	stp	x21, x22, [sp, 144]
	mov	x22, x0
	adrp	x21, .LC8
	stp	x23, x24, [sp, 160]
	add	x21, x21, :lo12:.LC8
	add	x23, sp, 40
	stp	x25, x26, [sp, 176]
	mov	x1, x21
	mov	x26, x2
	stp	x27, x28, [sp, 192]
	mov	w2, 94
	adrp	x25, .LANCHOR1
	ldr	x0, [x4, 1424]
	str	x0, [sp, 104]
	mov	x0, 0
	add	x25, x25, :lo12:.LANCHOR1
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_printk
	add	x4, sp, 36
	stp	xzr, xzr, [sp, 40]
	mov	x2, x21
	mov	x1, x25
	ldr	x28, [x26, 32]
	mov	w3, 105
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	str	wzr, [x23, 16]
	adrp	x24, .LC11
	stp	xzr, xzr, [x4, 24]
	add	x24, x24, :lo12:.LC11
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x27, sp_el0
// 0 "" 2
#NO_APP
	str	wzr, [sp, 76]
	stp	xzr, xzr, [sp, 80]
	str	xzr, [sp, 96]
	bl	_printk
	ldr	w1, [x27, 1416]
	add	x2, x27, 1904
	mov	x0, x24
	bl	_printk
	ldr	w0, [x27, 44]
	tbz	x0, 21, .L69
.L34:
	sbfx	x0, x19, 0, 56
	and	x0, x0, x19
.L35:
	mov	w1, 4294967276
	movk	x1, 0x7fff, lsl 32
	cmp	x0, x1
	bhi	.L62
	str	x19, [sp, 24]
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x19, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 20
	mov	x0, x23
	bl	__arch_copy_from_user
	mov	x2, x0
	cbnz	x0, .L70
	ldrh	w3, [sp, 40]
	mov	w4, 256
	add	x1, sp, 60
	add	x2, sp, 80
	mov	x0, x22
	str	w4, [sp, 60]
	strh	w3, [sp, 64]
	str	xzr, [sp, 66]
	str	wzr, [sp, 74]
	strh	wzr, [sp, 78]
	bl	soc_control
	mov	w1, w0
	sxtw	x0, w0
	tbnz	w1, #31, .L33
	ldr	x1, [x26]
	mov	w2, 1
	ldrh	w0, [sp, 88]
	strh	w0, [sp, 42]
	ldr	w1, [x1, 32]
	bl	hailo_check_channel_index
	tst	w0, 255
	beq	.L71
	ldr	x1, [x26]
	mov	w2, 0
	ldrb	w0, [sp, 43]
	ldr	w1, [x1, 32]
	bl	hailo_check_channel_index
	tst	w0, 255
	beq	.L72
	ldrb	w2, [sp, 42]
	add	x27, x20, 24
	ldr	x1, [sp, 44]
	str	w2, [sp, 8]
	ldrb	w2, [sp, 43]
	mov	x0, x27
	str	w2, [sp, 12]
	bl	hailo_vdma_find_descriptors_buffer
	mov	x26, x0
	ldr	x1, [sp, 52]
	mov	x0, x27
	bl	hailo_vdma_find_descriptors_buffer
	mov	x4, x0
	cmp	x26, 0
	ccmp	x0, 0, 4, ne
	beq	.L73
	ldr	w2, [x26, 56]
	uxtw	x0, w2
	sub	x1, x0, #1
	tst	x1, x0
	bne	.L49
	ldr	w0, [x4, 56]
	sub	x1, x0, #1
	tst	x1, x0
	bne	.L49
	ldrsw	x27, [sp, 8]
	mov	x5, 11848
	ldr	x6, [x22, 4848]
	str	x4, [sp, 16]
	ldr	x1, [x26, 32]
	madd	x0, x27, x5, x28
	ldrb	w3, [x6, 8]
	ldr	x0, [x0, 24]
	bl	hailo_vdma_start_channel
	ldr	x4, [sp, 16]
	mov	x5, 11848
	tbnz	w0, #31, .L74
	ldrb	w0, [sp, 42]
	add	x20, x20, 124
	mov	x1, 1
	ldrsw	x26, [sp, 12]
	ubfx	x2, x0, 6, 2
	lsl	x1, x1, x0
	madd	x26, x26, x5, x28
	ldr	w0, [x20, x2, lsl 2]
	orr	w0, w0, w1
	str	w0, [x20, x2, lsl 2]
	ldr	x1, [x22, 4848]
	ldr	x0, [x26, 24]
	ldrb	w3, [x1, 8]
	ldr	x1, [x4, 32]
	ldr	w2, [x4, 56]
	bl	hailo_vdma_start_channel
	tbnz	w0, #31, .L75
	ldrb	w4, [sp, 43]
	mov	x5, 1
	mov	x2, x21
	mov	x1, x25
	mov	w3, 178
	adrp	x0, .LC19
	ubfx	x6, x4, 6, 2
	lsl	x5, x5, x4
	add	x0, x0, :lo12:.LC19
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x21, sp_el0
// 0 "" 2
#NO_APP
	ldr	w4, [x20, x6, lsl 2]
	orr	w4, w4, w5
	str	w4, [x20, x6, lsl 2]
	bl	_printk
	ldr	w1, [x21, 1416]
	mov	x0, x24
	add	x2, x21, 1904
	bl	_printk
	ldr	w0, [x21, 44]
	tbz	x0, 21, .L76
.L54:
	sbfx	x0, x19, 0, 56
	and	x19, x19, x0
.L55:
	mov	w0, 4294967276
	movk	x0, 0x7fff, lsl 32
	cmp	x19, x0
	bls	.L56
.L59:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L77
.L39:
	mov	x0, -12
	.p2align 3,,7
.L33:
	mrs	x1, sp_el0
	ldr	x3, [sp, 104]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L78
	ldp	x29, x30, [sp, 112]
	ldp	x19, x20, [sp, 128]
	ldp	x21, x22, [sp, 144]
	ldp	x23, x24, [sp, 160]
	ldp	x25, x26, [sp, 176]
	ldp	x27, x28, [sp, 192]
	add	sp, sp, 208
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L62:
	mov	x0, x23
	mov	x2, 20
.L36:
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L39
	ldr	x1, [x22, 16]
	adrp	x2, .LC12
	adrp	x0, .LC1
	add	x2, x2, :lo12:.LC12
	add	x0, x0, :lo12:.LC1
	add	x1, x1, 200
	bl	_dev_printk
	mov	x0, -12
	b	.L33
	.p2align 2,,3
.L69:
	ldr	x1, [x27]
	mov	x0, x19
	tst	w1, 67108864
	beq	.L35
	b	.L34
	.p2align 2,,3
.L56:
	ldr	x0, [sp, 24]
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x0, x0, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 20
	mov	x1, x23
	bl	__arch_copy_to_user
	cbz	x0, .L33
	b	.L59
	.p2align 2,,3
.L76:
	ldr	x0, [x21]
	tst	w0, 67108864
	beq	.L55
	b	.L54
	.p2align 2,,3
.L70:
	sub	x23, x23, x0
	add	x0, x23, 20
	b	.L36
	.p2align 2,,3
.L77:
	ldr	x1, [x22, 16]
	adrp	x2, .LC20
	adrp	x0, .LC1
	add	x2, x2, :lo12:.LC20
	add	x0, x0, :lo12:.LC1
	add	x1, x1, 200
	bl	_dev_printk
	mov	x0, -12
	b	.L33
	.p2align 2,,3
.L49:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L79
.L45:
	mov	x0, -22
	b	.L33
	.p2align 2,,3
.L79:
	ldr	x1, [x22, 16]
	adrp	x2, .LC16
	adrp	x0, .LC1
	add	x2, x2, :lo12:.LC16
	add	x0, x0, :lo12:.LC1
	add	x1, x1, 200
	bl	_dev_printk
	mov	x0, -22
	b	.L33
	.p2align 2,,3
.L71:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L45
	ldrb	w3, [sp, 42]
	adrp	x2, .LC13
	ldr	x1, [x22, 16]
	add	x2, x2, :lo12:.LC13
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	add	x1, x1, 200
	bl	_dev_printk
	mov	x0, -22
	b	.L33
	.p2align 2,,3
.L72:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L45
	ldrb	w3, [sp, 43]
	adrp	x2, .LC14
	ldr	x1, [x22, 16]
	add	x2, x2, :lo12:.LC14
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	add	x1, x1, 200
	bl	_dev_printk
	mov	x0, -22
	b	.L33
.L74:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L45
	ldrb	w3, [sp, 42]
	adrp	x2, .LC17
	ldr	x1, [x22, 16]
	add	x2, x2, :lo12:.LC17
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	add	x1, x1, 200
	bl	_dev_printk
	mov	x0, -22
	b	.L33
.L75:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L80
.L53:
	mov	x0, 11848
	madd	x27, x27, x0, x28
	ldr	x0, [x27, 24]
	bl	hailo_vdma_stop_channel
	mov	x0, -22
	b	.L33
.L73:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	ble	.L45
	ldr	x1, [x22, 16]
	adrp	x2, .LC15
	adrp	x0, .LC1
	add	x2, x2, :lo12:.LC15
	add	x0, x0, :lo12:.LC1
	add	x1, x1, 200
	bl	_dev_printk
	mov	x0, -22
	b	.L33
.L80:
	ldrb	w3, [sp, 43]
	adrp	x2, .LC18
	ldr	x1, [x22, 16]
	add	x2, x2, :lo12:.LC18
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	add	x1, x1, 200
	bl	_dev_printk
	b	.L53
.L78:
	bl	__stack_chk_fail
	.size	hailo_soc_connect_ioctl, .-hailo_soc_connect_ioctl
	.section	.rodata.str1.8
	.align	3
.LC21:
	.string	"\0016IOCTL_HANDLER: Function hailo_soc_close_ioctl called at %s:%d\n"
	.align	3
.LC22:
	.string	"Error closing channels\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_soc_close_ioctl
	.section	__patchable_function_entries,"awo",@progbits,soc_control
	.align	3
	.8byte	.LPFE5
	.text
.LPFE5:
	nop
	nop
	.type	hailo_soc_close_ioctl, %function
hailo_soc_close_ioctl:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #64
	mrs	x1, sp_el0
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	adrp	x20, .LC8
	add	x20, x20, :lo12:.LC8
	stp	x21, x22, [sp, 48]
	mov	x22, x0
	mov	x19, x3
	ldr	x0, [x1, 1424]
	str	x0, [sp, 8]
	mov	x0, 0
	mov	x21, x2
	mov	x1, x20
	mov	w2, 215
	adrp	x0, .LC21
	add	x0, x0, :lo12:.LC21
	bl	_printk
	strh	wzr, [sp, 6]
	adrp	x1, .LANCHOR1
	add	x1, x1, :lo12:.LANCHOR1
	mov	x2, x20
	add	x1, x1, 24
	mov	w3, 220
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	bl	_printk
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x20, sp_el0
// 0 "" 2
#NO_APP
	ldr	w1, [x20, 1416]
	add	x2, x20, 1904
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	bl	_printk
	ldr	w0, [x20, 44]
	tbz	x0, 21, .L98
.L82:
	sbfx	x0, x19, 0, 56
	and	x0, x0, x19
.L83:
	mov	x1, 140737488355326
	cmp	x0, x1
	bhi	.L94
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/uaccess.h" 1
		bic	x1, x19, 36028797018963968

// 0 "" 2
#NO_APP
	mov	x2, 2
	add	x19, sp, 6
	mov	x0, x19
	bl	__arch_copy_from_user
	mov	x2, x0
	sub	x0, x19, x0
	add	x0, x0, 2
	cbnz	x2, .L84
	ldrb	w3, [sp, 6]
	mov	w20, 1
	ldrb	w2, [sp, 7]
	mov	x0, x22
	lsl	w3, w20, w3
	lsl	w1, w20, w2
	orr	w1, w3, w1
	bl	close_channels
	mov	w19, w0
	cbnz	w0, .L99
	ldrb	w1, [sp, 6]
	mov	x0, 0
	ldrb	w3, [sp, 7]
	ldr	w2, [x21, 124]
	lsl	w1, w20, w1
	lsl	w20, w20, w3
	orr	w1, w1, w20
	bic	w1, w2, w1
	str	w1, [x21, 124]
.L81:
	mrs	x1, sp_el0
	ldr	x3, [sp, 8]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L100
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	ldp	x21, x22, [sp, 48]
	add	sp, sp, 64
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L94:
	add	x0, sp, 6
	mov	x2, 2
.L84:
	mov	w1, 0
	bl	memset
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L101
	mov	x0, -12
	b	.L81
	.p2align 2,,3
.L99:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L102
	sxtw	x0, w19
	b	.L81
	.p2align 2,,3
.L98:
	ldr	x1, [x20]
	mov	x0, x19
	tst	w1, 67108864
	beq	.L83
	b	.L82
	.p2align 2,,3
.L102:
	ldr	x1, [x22, 16]
	adrp	x2, .LC22
	adrp	x0, .LC1
	add	x2, x2, :lo12:.LC22
	add	x0, x0, :lo12:.LC1
	add	x1, x1, 200
	bl	_dev_printk
	sxtw	x0, w19
	b	.L81
	.p2align 2,,3
.L101:
	ldr	x1, [x22, 16]
	adrp	x2, .LC12
	adrp	x0, .LC1
	add	x2, x2, :lo12:.LC12
	add	x0, x0, :lo12:.LC1
	add	x1, x1, 200
	bl	_dev_printk
	mov	x0, -12
	b	.L81
.L100:
	bl	__stack_chk_fail
	.size	hailo_soc_close_ioctl, .-hailo_soc_close_ioctl
	.section	.rodata.str1.8
	.align	3
.LC23:
	.string	"\0016IOCTL_HANDLER: Function hailo_soc_ioctl called at %s:%d\n"
	.align	3
.LC24:
	.string	"Invalid pcie EP ioctl code 0x%x (nr: %d)\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_soc_ioctl
	.section	__patchable_function_entries,"awo",@progbits,soc_control
	.align	3
	.8byte	.LPFE6
	.text
.LPFE6:
	nop
	nop
	.type	hailo_soc_ioctl, %function
hailo_soc_ioctl:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	w19, w3
	adrp	x0, .LC23
	add	x0, x0, :lo12:.LC23
	stp	x21, x22, [sp, 32]
	mov	x22, x1
	mov	x21, x2
	adrp	x1, .LC8
	mov	w2, 41
	add	x1, x1, :lo12:.LC8
	str	x23, [sp, 48]
	mov	x23, x4
	bl	_printk
	mov	w0, 29441
	movk	w0, 0x8002, lsl 16
	cmp	w19, w0
	beq	.L104
	mov	w0, 29440
	movk	w0, 0xc014, lsl 16
	cmp	w19, w0
	bne	.L105
	mov	x3, x23
	mov	x2, x21
	mov	x1, x22
	mov	x0, x20
	bl	hailo_soc_connect_ioctl
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L104:
	mov	x3, x23
	mov	x2, x22
	mov	x1, x21
	mov	x0, x20
	bl	hailo_soc_close_ioctl
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L105:
	adrp	x0, o_dbg
	ldr	w0, [x0, #:lo12:o_dbg]
	cmp	w0, 2
	bgt	.L107
	mov	x0, -25
.L110:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L107:
	ldr	x1, [x20, 16]
	and	w4, w19, 255
	mov	w3, w19
	adrp	x2, .LC24
	add	x1, x1, 200
	add	x2, x2, :lo12:.LC24
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	_dev_printk
	mov	x0, -25
	b	.L110
	.size	hailo_soc_ioctl, .-hailo_soc_ioctl
	.align	2
	.p2align 3,,7
	.global	hailo_soc_file_context_init
	.section	__patchable_function_entries,"awo",@progbits,soc_control
	.align	3
	.8byte	.LPFE7
	.text
.LPFE7:
	nop
	nop
	.type	hailo_soc_file_context_init, %function
hailo_soc_file_context_init:
	nop
	nop
	mov	w0, 0
	ret
	.size	hailo_soc_file_context_init, .-hailo_soc_file_context_init
	.align	2
	.p2align 3,,7
	.global	hailo_soc_file_context_finalize
	.section	__patchable_function_entries,"awo",@progbits,soc_control
	.align	3
	.8byte	.LPFE8
	.text
.LPFE8:
	nop
	nop
	.type	hailo_soc_file_context_finalize, %function
hailo_soc_file_context_finalize:
	nop
	nop
	ldr	w1, [x1, 124]
	cbnz	w1, .L121
	ret
	.p2align 2,,3
.L121:
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	close_channels
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	ret
	.size	hailo_soc_file_context_finalize, .-hailo_soc_file_context_finalize
	.align	2
	.p2align 3,,7
	.global	hailo_soc_driver_down
	.section	__patchable_function_entries,"awo",@progbits,soc_control
	.align	3
	.8byte	.LPFE9
	.text
.LPFE9:
	nop
	nop
	.type	hailo_soc_driver_down, %function
hailo_soc_driver_down:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	mov	w1, -1
	mov	x29, sp
	bl	close_channels
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	ret
	.size	hailo_soc_driver_down, .-hailo_soc_driver_down
	.section	.rodata
	.align	3
	.set	.LANCHOR1,. + 0
	.type	__func__.1, %object
	.size	__func__.1, 24
__func__.1:
	.string	"hailo_soc_connect_ioctl"
	.type	__func__.0, %object
	.size	__func__.0, 22
__func__.0:
	.string	"hailo_soc_close_ioctl"
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	__key.2, %object
	.size	__key.2, 0
__key.2:
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
