	.arch armv8-a
	.file	"memory.c"
	.text
	.align	2
	.p2align 3,,7
	.type	dma_sync_single_for_device, %function
dma_sync_single_for_device:
	ldr	x4, [x0, 680]
	tbz	x4, 38, .L8
	ret
	.p2align 2,,3
.L8:
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	__dma_sync_single_for_device
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	ret
	.size	dma_sync_single_for_device, .-dma_sync_single_for_device
	.align	2
	.p2align 3,,7
	.type	dma_sync_single_for_cpu, %function
dma_sync_single_for_cpu:
	ldr	x4, [x0, 680]
	tbz	x4, 38, .L15
	ret
	.p2align 2,,3
.L15:
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	__dma_sync_single_for_cpu
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	ret
	.size	dma_sync_single_for_cpu, .-dma_sync_single_for_cpu
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"/home/sri/hailort-drivers/linux/pcie/../vdma/memory.c"
	.align	3
.LC1:
	.string	"\0016FUNC_ENTRY: Entering function clear_sg_table at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE1
	.text
.LPFE1:
	nop
	nop
	.type	clear_sg_table, %function
clear_sg_table:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #64
	mrs	x1, sp_el0
	mov	w2, 815
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	str	x19, [sp, 48]
	mov	x19, x0
	ldr	x0, [x1, 1424]
	str	x0, [sp, 24]
	mov	x0, 0
	adrp	x1, .LC0
	adrp	x0, .LC1
	add	x1, x1, :lo12:.LC0
	add	x0, x0, :lo12:.LC1
	bl	_printk
	ldr	x1, [x19]
	mov	x0, sp
	ldr	w2, [x19, 12]
	mov	x3, 0
	stp	xzr, xzr, [sp]
	str	xzr, [sp, 16]
	bl	__sg_page_iter_start
	b	.L18
	.p2align 2,,3
.L26:
	ldr	x2, [sp]
	ldr	w1, [sp, 8]
	ldr	x2, [x2]
	lsl	x1, x1, 6
	and	x2, x2, -4
	adds	x0, x2, x1
	bne	.L35
.L18:
	mov	x0, sp
	bl	__sg_page_iter_next
	tst	w0, 255
	bne	.L26
	mov	x0, x19
	bl	sg_free_table
	mrs	x0, sp_el0
	ldr	x2, [sp, 24]
	ldr	x1, [x0, 1424]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L36
	ldp	x29, x30, [sp, 32]
	ldr	x19, [sp, 48]
	add	sp, sp, 64
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L35:
	ldr	x1, [x2, x1]
	tst	w1, 8192
	bne	.L19
	ldr	x2, [x0, 8]
	sub	x1, x2, #1
	tst	x2, 1
	csel	x1, x1, x0, ne
#APP
// 232 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h" 1
	.if 1 == 1
661:
	b	.L21
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
	mov	x2, 16
#APP
// 132 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h" 1
	.arch_extension lse
	stset	x2, [x1]

// 0 "" 2
#NO_APP
.L19:
	ldr	x1, [x0, 8]
	sub	x2, x1, #1
	tst	x1, 1
	csel	x0, x2, x0, ne
#APP
// 232 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h" 1
	.if 1 == 1
661:
	b	.L23
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
.L37:
	mov	w1, -1
	add	x2, x0, 52
#APP
// 62 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h" 1
	.arch_extension lse
	ldaddal	w1, w1, [x2]
// 0 "" 2
#NO_APP
	sub	w1, w1, #1
.L24:
	cbnz	w1, .L18
	bl	__folio_put
	b	.L18
	.p2align 2,,3
.L23:
	add	x4, x0, 52
	mov	w2, 1
#APP
// 96 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h" 1
	// atomic_sub_return
	prfm	pstl1strm, [x4]
1:	ldxr	w1, [x4]
	sub	w1, w1, w2
	stlxr	w3, w1, [x4]
	cbnz	w3, 1b
	dmb ish
// 0 "" 2
#NO_APP
	b	.L24
	.p2align 2,,3
.L21:
#APP
// 203 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h" 1
	// atomic64_or
	prfm	pstl1strm, [x1]
1:	ldxr	x2, [x1]
	orr	x2, x2, 16
	stxr	w3, x2, [x1]
	cbnz	w3, 1b
// 0 "" 2
#NO_APP
	ldr	x1, [x0, 8]
	sub	x2, x1, #1
	tst	x1, 1
	csel	x0, x2, x0, ne
#APP
// 232 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h" 1
	.if 1 == 1
661:
	b	.L23
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
	b	.L37
.L36:
	bl	__stack_chk_fail
	.size	clear_sg_table, .-clear_sg_table
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_buffer_map at %s:%d\n"
	.align	3
.LC3:
	.string	"memory alloc failed\n"
	.align	3
.LC4:
	.string	"\0016FUNC_ENTRY: Entering function is_dmabuf_vma at %s:%d\n"
	.align	3
.LC5:
	.string	"dmabuf"
	.align	3
.LC6:
	.string	"\0016FUNC_ENTRY: Entering function create_fd_from_vma at %s:%d\n"
	.align	3
.LC7:
	.string	"\0016FUNC_ENTRY: Entering function prepare_sg_table at %s:%d\n"
	.align	3
.LC8:
	.string	"Invalid VMA or no associated file.\n"
	.align	3
.LC9:
	.string	"struct file::f_count incremented from zero; use-after-free condition present!\n"
	.align	3
.LC10:
	.string	"Failed to get unused file descriptor.\n"
	.align	3
.LC11:
	.string	"Failed creating fd from vma in given dmabuf\n"
	.align	3
.LC12:
	.string	"\0016FUNC_ENTRY: Entering function hailo_map_dmabuf at %s:%d\n"
	.align	3
.LC13:
	.string	"\0016DMA_INSTRUMENT: About to call dma_buf_get from function %s at %s:%d\n"
	.align	3
.LC14:
	.string	"\0016DMA_STACK_START: Stack trace for dma_buf_get called from %s\n"
	.align	3
.LC15:
	.string	"\0016DMA_STACK_END: End of stack trace for dma_buf_get\n"
	.align	3
.LC16:
	.string	"dma_buf_get failed, err=%ld\n"
	.align	3
.LC17:
	.string	"\0016DMA_INSTRUMENT: About to call dma_buf_attach from function %s at %s:%d\n"
	.align	3
.LC18:
	.string	"\0016DMA_STACK_START: Stack trace for dma_buf_attach called from %s\n"
	.align	3
.LC19:
	.string	"\0016DMA_STACK_END: End of stack trace for dma_buf_attach\n"
	.align	3
.LC20:
	.string	"dma_buf_attach failed, err=%ld\n"
	.align	3
.LC21:
	.string	"\0016DMA_INSTRUMENT: About to call dma_buf_map_attachment from function %s at %s:%d\n"
	.align	3
.LC22:
	.string	"\0016DMA_STACK_START: Stack trace for dma_buf_map_attachment called from %s\n"
	.align	3
.LC23:
	.string	"\0016DMA_STACK_END: End of stack trace for dma_buf_map_attachment\n"
	.align	3
.LC24:
	.string	"dma_buf_map_attachment failed, err=%ld\n"
	.align	3
.LC25:
	.string	"\0016DMA_INSTRUMENT: About to call dma_buf_detach from function %s at %s:%d\n"
	.align	3
.LC26:
	.string	"\0016DMA_STACK_START: Stack trace for dma_buf_detach called from %s\n"
	.align	3
.LC27:
	.string	"\0016DMA_STACK_END: End of stack trace for dma_buf_detach\n"
	.align	3
.LC28:
	.string	"\0016DMA_INSTRUMENT: About to call dma_buf_put from function %s at %s:%d\n"
	.align	3
.LC29:
	.string	"\0016DMA_STACK_START: Stack trace for dma_buf_put called from %s\n"
	.align	3
.LC30:
	.string	"\0016DMA_STACK_END: End of stack trace for dma_buf_put\n"
	.align	3
.LC31:
	.string	"Failed mapping dmabuf\n"
	.align	3
.LC32:
	.string	"\0016DMA_INSTRUMENT: About to call dma_map_sg from function %s at %s:%d\n"
	.align	3
.LC33:
	.string	"\0016DMA_STACK_START: Stack trace for dma_map_sg called from %s\n"
	.align	3
.LC34:
	.string	"\0016DMA_STACK_END: End of stack trace for dma_map_sg\n"
	.align	3
.LC35:
	.string	"\0013get_user_pages failed with %d\n"
	.align	3
.LC36:
	.string	"\0013Pinned %d out of %zu\n"
	.align	3
.LC37:
	.string	"\0013Received wrong amount of pages %zu to map expected %zu\n"
	.align	3
.LC38:
	.string	"\0013sg table alloc failed (err %d)..\n"
	.align	3
.LC39:
	.string	"failed to set sg list for user buffer %d\n"
	.align	3
.LC40:
	.string	"failed to map sg list for user buffer\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_buffer_map
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE2
	.text
.LPFE2:
	nop
	nop
	.type	hailo_vdma_buffer_map, %function
hailo_vdma_buffer_map:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #144
	mrs	x6, sp_el0
	stp	x29, x30, [sp, 48]
	add	x29, sp, 48
	stp	x19, x20, [sp, 64]
	mov	x20, x1
	stp	x21, x22, [sp, 80]
	mov	x22, x0
	mov	x21, x2
	stp	x23, x24, [sp, 96]
	adrp	x24, .LC0
	add	x24, x24, :lo12:.LC0
	stp	x25, x26, [sp, 112]
	mov	x1, x24
	mov	w2, 194
	ldr	x0, [x6, 1424]
	str	x0, [sp, 40]
	mov	x0, 0
	mov	w23, w3
	mov	w26, w4
	mov	x25, x5
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	_printk
	stp	xzr, xzr, [sp, 24]
	adrp	x0, kmalloc_caches+56
	mov	x2, 104
	mov	w1, 3520
	ldr	x0, [x0, #:lo12:kmalloc_caches+56]
	bl	__kmalloc_cache_noprof
	cbz	x0, .L120
	stp	x27, x28, [sp, 128]
	mov	x19, x0
	cmp	w26, 1
	bne	.L121
	mov	w27, w20
	mov	x26, 0
	str	wzr, [sp, 8]
.L52:
	mov	x1, x24
	mov	w2, 51
	adrp	x0, .LC12
	adrp	x25, .LANCHOR1
	add	x0, x0, :lo12:.LC12
	add	x25, x25, :lo12:.LANCHOR1
	bl	_printk
	mov	x2, x24
	mov	w3, 57
	mov	x1, x25
	adrp	x0, .LC13
	add	x0, x0, :lo12:.LC13
	bl	_printk
	mov	x1, x25
	adrp	x0, .LC14
	add	x0, x0, :lo12:.LC14
	bl	_printk
	bl	dump_stack
	adrp	x0, .LC15
	add	x0, x0, :lo12:.LC15
	bl	_printk
	mov	w0, w27
	bl	dma_buf_get
	mov	x27, x0
	cmn	x0, #4096
	bhi	.L122
	mov	x2, x24
	mov	w3, 68
	mov	x1, x25
	adrp	x0, .LC17
	add	x0, x0, :lo12:.LC17
	bl	_printk
	mov	x1, x25
	adrp	x0, .LC18
	add	x0, x0, :lo12:.LC18
	bl	_printk
	bl	dump_stack
	adrp	x0, .LC19
	add	x0, x0, :lo12:.LC19
	bl	_printk
	mov	x1, x22
	mov	x0, x27
	bl	dma_buf_attach
	mov	x28, x0
	cmn	x0, #4096
	bhi	.L123
	mov	x2, x24
	mov	w3, 79
	mov	x1, x25
	adrp	x0, .LC21
	add	x0, x0, :lo12:.LC21
	bl	_printk
	mov	x1, x25
	adrp	x0, .LC22
	add	x0, x0, :lo12:.LC22
	bl	_printk
	bl	dump_stack
	adrp	x0, .LC23
	add	x0, x0, :lo12:.LC23
	bl	_printk
	mov	w1, w23
	mov	x0, x28
	bl	dma_buf_map_attachment
	mov	x5, x0
	cmn	x0, #4096
	bhi	.L124
	ldp	x0, x1, [x0]
	stp	x0, x1, [sp, 24]
	ldr	w0, [sp, 8]
	cbnz	w0, .L125
.L59:
	add	x25, x25, 24
	mov	x2, x24
	mov	w3, 264
	mov	x1, x25
	adrp	x0, .LC32
	add	x0, x0, :lo12:.LC32
	str	x5, [sp, 8]
	bl	_printk
	mov	x1, x25
	adrp	x0, .LC33
	add	x0, x0, :lo12:.LC33
	bl	_printk
	bl	dump_stack
	adrp	x0, .LC34
	add	x0, x0, :lo12:.LC34
	bl	_printk
	ldr	x5, [sp, 8]
.L60:
	mov	w2, 1
	ldp	x0, x1, [sp, 24]
	str	w2, [x19, 24]
	stp	x22, x20, [x19, 32]
	stp	w21, w23, [x19, 48]
	stp	x0, x1, [x19, 56]
	strb	wzr, [x19, 72]
	stp	x27, x28, [x19, 80]
	str	x5, [x19, 96]
	ldp	x27, x28, [sp, 128]
.L38:
	mrs	x0, sp_el0
	ldr	x2, [sp, 40]
	ldr	x1, [x0, 1424]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L126
	ldp	x29, x30, [sp, 48]
	mov	x0, x19
	ldp	x19, x20, [sp, 64]
	ldp	x21, x22, [sp, 80]
	ldp	x23, x24, [sp, 96]
	ldp	x25, x26, [sp, 112]
	add	sp, sp, 144
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L121:
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x0, sp_el0
// 0 "" 2
#NO_APP
	ldr	x0, [x0, 1288]
	mov	x1, x20
	bl	find_vma
	mov	x26, x0
	mov	x1, x24
	adrp	x0, .LC4
	mov	w2, 158
	add	x0, x0, :lo12:.LC4
	bl	_printk
	cbz	x26, .L42
	ldr	x0, [x26, 128]
	cbz	x0, .L42
	ldr	x0, [x0, 72]
	adrp	x1, .LC5
	add	x1, x1, :lo12:.LC5
	ldr	x0, [x0, 40]
	bl	strcmp
	cbz	w0, .L127
.L42:
	mov	x26, 16383
	mov	x1, x24
	add	x26, x26, w21, uxtw
	mov	w2, 747
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	lsr	x26, x26, 14
	bl	_printk
	mov	w2, -1
	mov	w1, 3264
	lsl	x27, x26, 3
	and	x24, x21, 4294967295
	mov	x0, x27
	bl	__kvmalloc_node_noprof
	mov	x28, x0
	cbz	x0, .L128
	cbz	x25, .L129
	ldr	x2, [x25, 24]
	cmp	x26, x2
	bne	.L72
	mov	x1, 0
	cbz	x26, .L77
	mov	x3, -1073741824
	mov	x5, 140737488355328
	movk	x3, 0xffbf, lsl 32
	mov	w6, 1
	.p2align 3,,7
.L73:
	ldr	x0, [x25, 32]
	ldr	x4, [x0, x1]
	add	x4, x4, x5
	lsr	x4, x4, 14
	add	x4, x3, x4, lsl 6
	str	x4, [x28, x1]
	ldr	x2, [x4, 8]
	sub	x0, x2, #1
	tst	x2, 1
	csel	x4, x4, x0, eq
#APP
// 232 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h" 1
	.if 1 == 1
661:
	b	.L75
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
	add	x0, x4, 52
#APP
// 27 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h" 1
	.arch_extension lse
	stadd	w6, [x0]

// 0 "" 2
#NO_APP
.L76:
	add	x1, x1, 8
	cmp	x1, x27
	bne	.L73
.L77:
	mov	w25, 0
.L69:
	mov	x1, x28
	mov	x4, x24
	mov	w2, w26
	add	x0, sp, 24
	mov	w6, 3264
	mov	w5, 65536
	mov	w3, 0
	bl	sg_alloc_table_from_pages_segment
	ldr	x1, [sp, 24]
	cmp	w0, 0
	sxtw	x0, w0
	csel	x1, x0, x1, lt
	cmn	x1, #4096
	bhi	.L80
	mov	x0, x28
	bl	kvfree
.L81:
	ldr	x1, [sp, 24]
	mov	w3, w23
	ldr	w2, [sp, 36]
	mov	x0, x22
	mov	x4, 0
	bl	dma_map_sg_attrs
	str	w0, [sp, 32]
	cbz	w0, .L130
	mov	x5, 0
	mov	x28, 0
	mov	x27, 0
	b	.L60
	.p2align 2,,3
.L75:
	add	x4, x4, 52
#APP
// 95 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h" 1
	// atomic_add
	prfm	pstl1strm, [x4]
1:	ldxr	w0, [x4]
	add	w0, w0, 1
	stxr	w2, w0, [x4]
	cbnz	w2, 1b

// 0 "" 2
#NO_APP
	b	.L76
	.p2align 2,,3
.L127:
	mov	x1, x24
	adrp	x0, .LC6
	mov	w2, 163
	add	x0, x0, :lo12:.LC6
	bl	_printk
	ldr	x20, [x26, 128]
	cbz	x20, .L131
#APP
// 232 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h" 1
	.if 1 == 1
661:
	b	.L48
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
	mov	x0, 1
#APP
// 169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h" 1
	.arch_extension lse
	ldadd	x0, x0, [x20]
// 0 "" 2
#NO_APP
.L49:
	cbz	x0, .L132
.L50:
	mov	w0, 0
	bl	get_unused_fd_flags
	mov	w27, w0
	tbnz	w0, #31, .L133
	mov	x1, x20
	sxtw	x20, w0
	bl	fd_install
	mov	w0, 1
	str	w0, [sp, 8]
	b	.L52
	.p2align 2,,3
.L125:
	ldr	x0, [x26, 128]
	str	x5, [sp, 8]
	bl	fput
	mov	w0, w20
	bl	put_unused_fd
	ldr	x5, [sp, 8]
	b	.L59
	.p2align 2,,3
.L72:
	adrp	x0, .LC37
	mov	x1, x26
	add	x0, x0, :lo12:.LC37
	bl	_printk
.L119:
	mov	x20, -22
	mov	w27, w20
	mov	x0, x28
	bl	kvfree
.L45:
	adrp	x1, .LC39
	mov	w2, w27
	mov	x0, x22
	add	x1, x1, :lo12:.LC39
	bl	_dev_err
.L91:
.L40:
	mov	x0, x19
	mov	x19, x20
	bl	kfree
	ldp	x27, x28, [sp, 128]
	b	.L38
	.p2align 2,,3
.L129:
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x0, sp_el0
// 0 "" 2
#NO_APP
	ldr	x25, [x0, 1288]
#APP
// 32 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/jump_label.h" 1
	1:	nop					
	.pushsection	__jump_table, "aw"
	.align		3
	.long		1b - ., .L62 - .
	.quad		__tracepoint_mmap_lock_start_locking+8 - .
	.popsection
	
// 0 "" 2
#NO_APP
.L63:
	add	x0, x25, 152
	bl	down_read
#APP
// 32 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/jump_label.h" 1
	1:	nop					
	.pushsection	__jump_table, "aw"
	.align		3
	.long		1b - ., .L64 - .
	.quad		__tracepoint_mmap_lock_acquire_returned+8 - .
	.popsection
	
// 0 "" 2
#NO_APP
.L65:
	mov	x3, x28
	mov	x1, x26
	mov	x0, x20
	mov	w2, 9
	bl	get_user_pages
	mov	x3, x0
	mov	w25, w0
#APP
// 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/current.h" 1
	mrs x0, sp_el0
// 0 "" 2
#NO_APP
	ldr	x27, [x0, 1288]
#APP
// 32 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/jump_label.h" 1
	1:	nop					
	.pushsection	__jump_table, "aw"
	.align		3
	.long		1b - ., .L66 - .
	.quad		__tracepoint_mmap_lock_released+8 - .
	.popsection
	
// 0 "" 2
#NO_APP
.L67:
	add	x0, x27, 152
	str	x3, [sp, 8]
	bl	up_read
	ldr	x3, [sp, 8]
	tbnz	w3, #31, .L134
	cmp	x26, w3, sxtw
	beq	.L69
	mov	w1, w3
	mov	x2, x26
	adrp	x0, .LC36
	add	x0, x0, :lo12:.LC36
	str	x3, [sp, 8]
	bl	_printk
	ldr	x3, [sp, 8]
	mov	w27, -22
	cbz	w3, .L119
.L70:
	mov	x24, 0
	mov	w26, -1
	.p2align 3,,7
.L90:
	ldr	x0, [x28, x24, lsl 3]
	ldr	x2, [x0]
	tst	w2, 8192
	bne	.L83
	ldr	x2, [x0, 8]
	sub	x3, x2, #1
	tst	x2, 1
	csel	x0, x3, x0, ne
#APP
// 232 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h" 1
	.if 1 == 1
661:
	b	.L85
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
	mov	x1, 16
#APP
// 132 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h" 1
	.arch_extension lse
	stset	x1, [x0]

// 0 "" 2
#NO_APP
	ldr	x0, [x28, x24, lsl 3]
.L83:
	ldr	x2, [x0, 8]
	sub	x3, x2, #1
	tst	x2, 1
	csel	x0, x3, x0, ne
#APP
// 232 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h" 1
	.if 1 == 1
661:
	b	.L87
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
	add	x1, x0, 52
#APP
// 62 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h" 1
	.arch_extension lse
	ldaddal	w26, w2, [x1]
// 0 "" 2
#NO_APP
	sub	w2, w2, #1
	cbz	w2, .L135
.L89:
	add	x24, x24, 1
	cmp	w25, w24
	bgt	.L90
.L82:
	mov	x0, x28
	bl	kvfree
	tbz	w27, #31, .L81
	sxtw	x20, w27
	b	.L45
	.p2align 2,,3
.L130:
	adrp	x1, .LC40
	add	x1, x1, :lo12:.LC40
	mov	x0, x22
	mov	x20, -6
	bl	_dev_err
	add	x0, sp, 24
	bl	clear_sg_table
	b	.L91
	.p2align 2,,3
.L48:
#APP
// 191 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h" 1
	// atomic64_fetch_add_relaxed
	prfm	pstl1strm, [x20]
1:	ldxr	x0, [x20]
	add	x1, x0, 1
	stxr	w2, x1, [x20]
	cbnz	w2, 1b
	
// 0 "" 2
#NO_APP
	b	.L49
	.p2align 2,,3
.L66:
	mov	x0, x27
	mov	w1, 0
	str	x3, [sp, 8]
	bl	__mmap_lock_do_trace_released
	ldr	x3, [sp, 8]
	b	.L67
	.p2align 2,,3
.L64:
	mov	x0, x25
	mov	w2, 1
	mov	w1, 0
	bl	__mmap_lock_do_trace_acquire_returned
	b	.L65
	.p2align 2,,3
.L62:
	mov	x0, x25
	mov	w1, 0
	bl	__mmap_lock_do_trace_start_locking
	b	.L63
	.p2align 2,,3
.L122:
	mov	x2, x0
	adrp	x1, .LC16
	mov	x0, x22
	add	x1, x1, :lo12:.LC16
	bl	_dev_err
.L54:
	mov	x0, x22
	adrp	x1, .LC31
	mov	x19, -22
	add	x1, x1, :lo12:.LC31
	bl	_dev_err
	ldp	x27, x28, [sp, 128]
	b	.L38
	.p2align 2,,3
.L87:
	add	x1, x0, 52
	mov	w4, 1
#APP
// 96 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h" 1
	// atomic_sub_return
	prfm	pstl1strm, [x1]
1:	ldxr	w2, [x1]
	sub	w2, w2, w4
	stlxr	w3, w2, [x1]
	cbnz	w3, 1b
	dmb ish
// 0 "" 2
#NO_APP
	cbnz	w2, .L89
.L135:
	bl	__folio_put
	b	.L89
	.p2align 2,,3
.L85:
#APP
// 203 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h" 1
	// atomic64_or
	prfm	pstl1strm, [x0]
1:	ldxr	x2, [x0]
	orr	x2, x2, 16
	stxr	w3, x2, [x0]
	cbnz	w3, 1b
// 0 "" 2
#NO_APP
	ldr	x0, [x28, x24, lsl 3]
	b	.L83
	.p2align 2,,3
.L133:
	adrp	x1, .LC10
	add	x1, x1, :lo12:.LC10
	sxtw	x19, w0
	mov	x0, x22
	bl	_dev_err
	mov	x0, x20
	bl	fput
.L47:
	mov	x0, x22
	adrp	x1, .LC11
	add	x1, x1, :lo12:.LC11
	bl	_dev_err
	ldp	x27, x28, [sp, 128]
	b	.L38
	.p2align 2,,3
.L80:
	adrp	x0, .LC38
	mov	w27, w1
	add	x0, x0, :lo12:.LC38
	bl	_printk
	cbnz	w25, .L70
	b	.L82
	.p2align 2,,3
.L123:
	mov	x2, x0
	adrp	x1, .LC20
	mov	x0, x22
	add	x1, x1, :lo12:.LC20
	bl	_dev_err
.L56:
	mov	x2, x24
	mov	w3, 103
	mov	x1, x25
	adrp	x0, .LC28
	add	x0, x0, :lo12:.LC28
	bl	_printk
	mov	x1, x25
	adrp	x0, .LC29
	add	x0, x0, :lo12:.LC29
	bl	_printk
	bl	dump_stack
	adrp	x0, .LC30
	add	x0, x0, :lo12:.LC30
	bl	_printk
	mov	x0, x27
	bl	dma_buf_put
	b	.L54
.L124:
	mov	x2, x0
	adrp	x1, .LC24
	mov	x0, x22
	add	x1, x1, :lo12:.LC24
	bl	_dev_err
	mov	x2, x24
	mov	w3, 97
	mov	x1, x25
	adrp	x0, .LC25
	add	x0, x0, :lo12:.LC25
	bl	_printk
	mov	x1, x25
	adrp	x0, .LC26
	add	x0, x0, :lo12:.LC26
	bl	_printk
	bl	dump_stack
	adrp	x0, .LC27
	add	x0, x0, :lo12:.LC27
	bl	_printk
	mov	x1, x28
	mov	x0, x27
	bl	dma_buf_detach
	b	.L56
.L132:
	adrp	x1, .LANCHOR0
	ldrb	w0, [x1, #:lo12:.LANCHOR0]
	cbnz	w0, .L50
	mov	w2, 1
	adrp	x0, .LC9
	strb	w2, [x1, #:lo12:.LANCHOR0]
	add	x0, x0, :lo12:.LC9
	bl	__warn_printk
#APP
// 1082 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/fs.h" 1
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "include/linux/fs.h"; .popsection; .long 14472b - .; .short 1082; .short (1 << 0)|((1 << 3) | ((9) << 8)); .align 2; .popsection; 14471: brk 0x800
// 0 "" 2
#NO_APP
	b	.L50
.L134:
	mov	w1, w3
	sxtw	x20, w3
	mov	w27, w3
	adrp	x0, .LC35
	add	x0, x0, :lo12:.LC35
	bl	_printk
	mov	x0, x28
	bl	kvfree
	b	.L45
.L131:
	mov	x0, x22
	adrp	x1, .LC8
	mov	x19, -22
	add	x1, x1, :lo12:.LC8
	bl	_dev_err
	b	.L47
.L128:
	mov	x20, -12
	mov	w27, w20
	b	.L45
.L120:
	mov	x0, x22
	adrp	x1, .LC3
	mov	x19, -12
	add	x1, x1, :lo12:.LC3
	bl	_dev_err
	b	.L38
.L126:
	stp	x27, x28, [sp, 128]
	bl	__stack_chk_fail
	.size	hailo_vdma_buffer_map, .-hailo_vdma_buffer_map
	.section	.rodata.str1.8
	.align	3
.LC41:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_buffer_get at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_buffer_get
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE3
	.text
.LPFE3:
	nop
	nop
	.type	hailo_vdma_buffer_get, %function
hailo_vdma_buffer_get:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	adrp	x1, .LC0
	mov	x29, sp
	add	x1, x1, :lo12:.LC0
	mov	w2, 326
	str	x19, [sp, 16]
	mov	x19, x0
	adrp	x0, .LC41
	add	x0, x0, :lo12:.LC41
	bl	_printk
	add	x0, x19, 24
#APP
// 232 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h" 1
	.if 1 == 1
661:
	b	.L137
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
#APP
// 62 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h" 1
	.arch_extension lse
	ldadd	w1, w1, [x0]
// 0 "" 2
#NO_APP
	cbz	w1, .L142
.L139:
	add	w2, w1, 1
	orr	w1, w2, w1
	tbnz	w1, #31, .L143
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L137:
	add	x4, x19, 24
#APP
// 95 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h" 1
	// atomic_fetch_add_relaxed
	prfm	pstl1strm, [x4]
1:	ldxr	w1, [x4]
	add	w2, w1, 1
	stxr	w3, w2, [x4]
	cbnz	w3, 1b
	
// 0 "" 2
#NO_APP
	cbnz	w1, .L139
.L142:
	mov	w1, 2
	bl	refcount_warn_saturate
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L143:
	mov	w1, 1
	bl	refcount_warn_saturate
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.size	hailo_vdma_buffer_get, .-hailo_vdma_buffer_get
	.section	.rodata.str1.8
	.align	3
.LC42:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_buffer_put at %s:%d\n"
	.align	3
.LC43:
	.string	"\0016FUNC_ENTRY: Entering function unmap_buffer at %s:%d\n"
	.align	3
.LC44:
	.string	"\0016FUNC_ENTRY: Entering function hailo_unmap_dmabuf at %s:%d\n"
	.align	3
.LC45:
	.string	"\0016DMA_INSTRUMENT: About to call dma_buf_unmap_attachment from function %s at %s:%d\n"
	.align	3
.LC46:
	.string	"\0016DMA_STACK_START: Stack trace for dma_buf_unmap_attachment called from %s\n"
	.align	3
.LC47:
	.string	"\0016DMA_STACK_END: End of stack trace for dma_buf_unmap_attachment\n"
	.align	3
.LC48:
	.string	"\0016DMA_INSTRUMENT: About to call dma_unmap_sg from function %s at %s:%d\n"
	.align	3
.LC49:
	.string	"\0016DMA_STACK_START: Stack trace for dma_unmap_sg called from %s\n"
	.align	3
.LC50:
	.string	"\0016DMA_STACK_END: End of stack trace for dma_unmap_sg\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_buffer_put
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE4
	.text
.LPFE4:
	nop
	nop
	.type	hailo_vdma_buffer_put, %function
hailo_vdma_buffer_put:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	adrp	x1, .LC0
	mov	x29, sp
	str	x21, [sp, 32]
	add	x21, x1, :lo12:.LC0
	mov	x1, x21
	mov	w2, 332
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	adrp	x0, .LC42
	add	x0, x0, :lo12:.LC42
	bl	_printk
	add	x0, x19, 24
#APP
// 232 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h" 1
	.if 1 == 1
661:
	b	.L145
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
	mov	w3, -1
#APP
// 62 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h" 1
	.arch_extension lse
	ldaddl	w3, w3, [x0]
// 0 "" 2
#NO_APP
	cmp	w3, 1
	beq	.L155
.L147:
	cmp	w3, 0
	ble	.L156
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L145:
	add	x5, x19, 24
	mov	w4, 1
#APP
// 96 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h" 1
	// atomic_fetch_sub_release
	prfm	pstl1strm, [x5]
1:	ldxr	w3, [x5]
	sub	w1, w3, w4
	stlxr	w2, w1, [x5]
	cbnz	w2, 1b
	
// 0 "" 2
#NO_APP
	cmp	w3, 1
	bne	.L147
.L155:
#APP
// 270 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/refcount.h" 1
	dmb ishld
// 0 "" 2
#NO_APP
	adrp	x0, .LC43
	mov	x1, x21
	add	x0, x0, :lo12:.LC43
	mov	w2, 304
	bl	_printk
	ldr	x0, [x19, 80]
	cbz	x0, .L157
	adrp	x20, .LANCHOR1
	add	x20, x20, :lo12:.LANCHOR1
	add	x20, x20, 48
	mov	x1, x21
	mov	w2, 114
	adrp	x0, .LC44
	add	x0, x0, :lo12:.LC44
	bl	_printk
	mov	w3, 115
	mov	x2, x21
	mov	x1, x20
	adrp	x0, .LC45
	add	x0, x0, :lo12:.LC45
	bl	_printk
	mov	x1, x20
	adrp	x0, .LC46
	add	x0, x0, :lo12:.LC46
	bl	_printk
	bl	dump_stack
	adrp	x0, .LC47
	add	x0, x0, :lo12:.LC47
	bl	_printk
	ldp	x0, x1, [x19, 88]
	ldr	w2, [x19, 52]
	bl	dma_buf_unmap_attachment
	mov	x2, x21
	mov	w3, 120
	mov	x1, x20
	adrp	x0, .LC25
	add	x0, x0, :lo12:.LC25
	bl	_printk
	mov	x1, x20
	adrp	x0, .LC26
	add	x0, x0, :lo12:.LC26
	bl	_printk
	bl	dump_stack
	adrp	x0, .LC27
	add	x0, x0, :lo12:.LC27
	bl	_printk
	ldp	x0, x1, [x19, 80]
	bl	dma_buf_detach
	mov	x2, x21
	mov	w3, 125
	mov	x1, x20
	adrp	x0, .LC28
	add	x0, x0, :lo12:.LC28
	bl	_printk
	mov	x1, x20
	adrp	x0, .LC29
	add	x0, x0, :lo12:.LC29
	bl	_printk
	bl	dump_stack
	adrp	x0, .LC30
	add	x0, x0, :lo12:.LC30
	bl	_printk
	ldr	x0, [x19, 80]
	bl	dma_buf_put
.L151:
	mov	x0, x19
	bl	kfree
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L156:
	mov	w1, 3
	bl	refcount_warn_saturate
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L157:
	adrp	x20, .LANCHOR1
	add	x20, x20, :lo12:.LANCHOR1
	add	x20, x20, 72
	mov	x2, x21
	mov	w3, 311
	mov	x1, x20
	adrp	x0, .LC48
	add	x0, x0, :lo12:.LC48
	bl	_printk
	mov	x1, x20
	adrp	x0, .LC49
	add	x0, x0, :lo12:.LC49
	bl	_printk
	bl	dump_stack
	adrp	x0, .LC50
	add	x0, x0, :lo12:.LC50
	bl	_printk
	ldrb	w0, [x19, 72]
	cbz	w0, .L158
.L152:
	add	x0, x19, 56
	bl	clear_sg_table
	b	.L151
	.p2align 2,,3
.L158:
	ldr	x0, [x19, 32]
	mov	x4, 0
	ldr	x1, [x19, 56]
	ldr	w3, [x19, 52]
	ldr	w2, [x19, 68]
	bl	dma_unmap_sg_attrs
	b	.L152
	.size	hailo_vdma_buffer_put, .-hailo_vdma_buffer_put
	.section	.rodata.str1.8
	.align	3
.LC51:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_buffer_sync at %s:%d\n"
	.align	3
.LC52:
	.string	"\0016FUNC_ENTRY: Entering function vdma_sync_entire_buffer at %s:%d\n"
	.align	3
.LC53:
	.string	"\0016DMA_INSTRUMENT: About to call dma_sync_sg_for_cpu from function %s at %s:%d\n"
	.align	3
.LC54:
	.string	"\0016DMA_STACK_START: Stack trace for dma_sync_sg_for_cpu called from %s\n"
	.align	3
.LC55:
	.string	"\0016DMA_STACK_END: End of stack trace for dma_sync_sg_for_cpu\n"
	.align	3
.LC56:
	.string	"\0016DMA_INSTRUMENT: About to call dma_sync_sg_for_device from function %s at %s:%d\n"
	.align	3
.LC57:
	.string	"\0016DMA_STACK_START: Stack trace for dma_sync_sg_for_device called from %s\n"
	.align	3
.LC58:
	.string	"\0016DMA_STACK_END: End of stack trace for dma_sync_sg_for_device\n"
	.align	3
.LC59:
	.string	"\0016FUNC_ENTRY: Entering function vdma_sync_buffer_interval at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_buffer_sync
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE5
	.text
.LPFE5:
	nop
	nop
	.type	hailo_vdma_buffer_sync, %function
hailo_vdma_buffer_sync:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -80]!
	mov	x29, sp
	stp	x23, x24, [sp, 48]
	mov	x23, x1
	stp	x19, x20, [sp, 16]
	adrp	x19, .LC0
	add	x19, x19, :lo12:.LC0
	mov	w20, w2
	mov	x1, x19
	mov	w2, 389
	stp	x21, x22, [sp, 32]
	mov	x22, x3
	mov	x21, x4
	stp	x25, x26, [sp, 64]
	mov	x25, x0
	adrp	x0, .LC51
	add	x0, x0, :lo12:.LC51
	bl	_printk
	ldr	x0, [x23, 80]
	cbz	x0, .L176
.L159:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L176:
	cbnz	x22, .L162
	ldr	w0, [x23, 48]
	cmp	x21, x0
	beq	.L177
.L162:
	mov	x1, x19
	adrp	x0, .LC59
	mov	w2, 363
	add	x0, x0, :lo12:.LC59
	bl	_printk
	adrp	x26, dma_sync_single_for_device
	ldr	w1, [x23, 64]
	cmp	w20, 0
	add	x26, x26, :lo12:dma_sync_single_for_device
	adrp	x0, dma_sync_single_for_cpu
	add	x0, x0, :lo12:dma_sync_single_for_cpu
	add	x21, x22, x21
	ldr	x19, [x23, 56]
	csel	x26, x26, x0, ne
	cbz	w1, .L159
	mov	w24, 0
	mov	x20, 0
	b	.L168
	.p2align 2,,3
.L178:
	ldr	x0, [x25, 16]
	ldr	x1, [x19, 16]
	ldr	w3, [x23, 52]
	blr	x26
	ldr	w0, [x19, 24]
	add	x20, x20, x0
.L167:
	mov	x0, x19
	bl	sg_next
	ldr	w1, [x23, 64]
	add	w24, w24, 1
	mov	x19, x0
	cmp	w1, w24
	bls	.L159
.L168:
	ldr	w2, [x19, 24]
	cmp	x22, x20
	csel	x1, x22, x20, cs
	add	x5, x2, x20
	cmp	x21, x5
	csel	x0, x21, x5, ls
	cmp	x1, x0
	bls	.L178
	mov	x20, x5
	b	.L167
	.p2align 2,,3
.L177:
	adrp	x21, .LANCHOR1
	add	x21, x21, :lo12:.LANCHOR1
	mov	x1, x19
	add	x22, x21, 88
	mov	w2, 339
	adrp	x0, .LC52
	add	x0, x0, :lo12:.LC52
	bl	_printk
	mov	x2, x19
	mov	w3, 340
	mov	x1, x22
	adrp	x0, .LC53
	add	x0, x0, :lo12:.LC53
	bl	_printk
	mov	x1, x22
	adrp	x0, .LC54
	add	x0, x0, :lo12:.LC54
	bl	_printk
	bl	dump_stack
	adrp	x0, .LC55
	add	x0, x0, :lo12:.LC55
	bl	_printk
	ldr	x0, [x25, 16]
	cbnz	w20, .L163
	ldr	x1, [x0, 680]
	tbz	x1, 38, .L179
.L164:
	add	x21, x21, 88
	mov	x2, x19
	mov	w3, 347
	mov	x1, x21
	adrp	x0, .LC56
	add	x0, x0, :lo12:.LC56
	bl	_printk
	mov	x1, x21
	adrp	x0, .LC57
	add	x0, x0, :lo12:.LC57
	bl	_printk
	bl	dump_stack
	adrp	x0, .LC58
	add	x0, x0, :lo12:.LC58
	bl	_printk
	b	.L159
.L163:
	ldr	x4, [x0, 680]
	ldr	x1, [x23, 56]
	ldr	w3, [x23, 52]
	ldr	w2, [x23, 64]
	tbnz	x4, 38, .L159
	bl	__dma_sync_sg_for_device
	b	.L159
.L179:
	ldr	x1, [x23, 56]
	ldr	w3, [x23, 52]
	ldr	w2, [x23, 64]
	bl	__dma_sync_sg_for_cpu
	b	.L164
	.size	hailo_vdma_buffer_sync, .-hailo_vdma_buffer_sync
	.section	.rodata.str1.8
	.align	3
.LC60:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_buffer_sync_cyclic at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_buffer_sync_cyclic
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE6
	.text
.LPFE6:
	nop
	nop
	.type	hailo_vdma_buffer_sync_cyclic, %function
hailo_vdma_buffer_sync_cyclic:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	mov	x21, x1
	mov	x22, x3
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
	stp	x19, x20, [sp, 16]
	mov	x20, x4
	stp	x23, x24, [sp, 48]
	mov	x23, x0
	mov	w24, w2
	adrp	x0, .LC60
	mov	w2, 408
	add	x0, x0, :lo12:.LC60
	bl	_printk
	ldr	w19, [x21, 48]
	mov	x3, x22
	mov	w2, w24
	mov	x1, x21
	sub	x19, x19, x22
	mov	x0, x23
	cmp	x19, x20
	csel	x19, x19, x20, ls
	mov	x4, x19
	bl	hailo_vdma_buffer_sync
	cmp	x20, x19
	bhi	.L183
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L183:
	sub	x4, x20, x19
	mov	w2, w24
	mov	x1, x21
	mov	x0, x23
	mov	x3, 0
	bl	hailo_vdma_buffer_sync
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	hint	29 // autiasp
	ret
	.size	hailo_vdma_buffer_sync_cyclic, .-hailo_vdma_buffer_sync_cyclic
	.section	.rodata.str1.8
	.align	3
.LC61:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_find_mapped_user_buffer at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_find_mapped_user_buffer
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE7
	.text
.LPFE7:
	nop
	nop
	.type	hailo_vdma_find_mapped_user_buffer, %function
hailo_vdma_find_mapped_user_buffer:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	mov	w2, 421
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x20, x1
	adrp	x0, .LC61
	adrp	x1, .LC0
	add	x0, x0, :lo12:.LC61
	add	x1, x1, :lo12:.LC0
	bl	_printk
	mov	x3, x19
	ldr	x0, [x3, 8]!
	cmp	x0, x3
	bne	.L186
	b	.L187
	.p2align 2,,3
.L190:
	ldr	x0, [x0]
	cmp	x0, x3
	beq	.L187
.L186:
	ldr	x2, [x0, 16]
	cmp	x2, x20
	bne	.L190
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L187:
	ldp	x19, x20, [sp, 16]
	mov	x0, 0
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.size	hailo_vdma_find_mapped_user_buffer, .-hailo_vdma_find_mapped_user_buffer
	.section	.rodata.str1.8
	.align	3
.LC62:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_clear_mapped_user_buffer_list at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_clear_mapped_user_buffer_list
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE8
	.text
.LPFE8:
	nop
	nop
	.type	hailo_vdma_clear_mapped_user_buffer_list, %function
hailo_vdma_clear_mapped_user_buffer_list:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	adrp	x1, .LC0
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	add	x1, x1, :lo12:.LC0
	adrp	x0, .LC62
	mov	w2, 434
	add	x0, x0, :lo12:.LC62
	bl	_printk
	ldr	x0, [x20, 8]!
	ldr	x19, [x0]
	cmp	x0, x20
	beq	.L191
	stp	x21, x22, [sp, 32]
	mov	x22, 256
	mov	x21, 290
	movk	x22, 0xdead, lsl 48
	movk	x21, 0xdead, lsl 48
	.p2align 3,,7
.L192:
	ldr	x1, [x0, 8]
	str	x1, [x19, 8]
	str	x19, [x1]
	stp	x22, x21, [x0]
	bl	hailo_vdma_buffer_put
	mov	x0, x19
	ldr	x19, [x19]
	cmp	x0, x20
	bne	.L192
	ldp	x21, x22, [sp, 32]
.L191:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.size	hailo_vdma_clear_mapped_user_buffer_list, .-hailo_vdma_clear_mapped_user_buffer_list
	.section	.rodata.str1.8
	.align	3
.LC63:
	.string	"\0016FUNC_ENTRY: Entering function hailo_desc_list_create at %s:%d\n"
	.align	3
.LC64:
	.string	"Invalid descriptors count %u\n"
	.align	3
.LC65:
	.string	"\0016DMA_INSTRUMENT: About to call dma_alloc_coherent from function %s at %s:%d\n"
	.align	3
.LC66:
	.string	"\0016DMA_STACK_START: Stack trace for dma_alloc_coherent called from %s\n"
	.align	3
.LC67:
	.string	"\0016DMA_STACK_END: End of stack trace for dma_alloc_coherent\n"
	.align	3
.LC68:
	.ascii	"Failed to a"
	.string	"llocate descriptors list, desc_count 0x%x, buffer_size 0x%zx, This failure means there is not a sufficient amount of CMA memory (contiguous physical memory), This usually is caused by lack of general system memory. Please check you have sufficient memory.\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_desc_list_create
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE9
	.text
.LPFE9:
	nop
	nop
	.type	hailo_desc_list_create, %function
hailo_desc_list_create:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -80]!
	mov	x29, sp
	stp	x25, x26, [sp, 64]
	adrp	x25, .LC0
	add	x25, x25, :lo12:.LC0
	mov	w26, w1
	mov	x1, x25
	stp	x19, x20, [sp, 16]
	mov	x19, x5
	stp	x21, x22, [sp, 32]
	and	w22, w2, 65535
	and	w21, w4, 255
	mov	w2, 446
	stp	x23, x24, [sp, 48]
	mov	x23, x0
	mov	x24, x3
	adrp	x0, .LC63
	add	x0, x0, :lo12:.LC63
	bl	_printk
	mov	w0, -2147483648
	cmp	w26, w0
	bhi	.L209
	adrp	x20, .LANCHOR1
	mov	x0, 65535
	add	x20, x20, :lo12:.LANCHOR1
	add	x0, x0, w26, uxtw 4
	add	x20, x20, 112
	mov	x2, x25
	mov	w3, 458
	mov	x1, x20
	and	x25, x0, -65536
	adrp	x0, .LC65
	add	x0, x0, :lo12:.LC65
	bl	_printk
	mov	x1, x20
	adrp	x0, .LC66
	add	x0, x0, :lo12:.LC66
	bl	_printk
	bl	dump_stack
	adrp	x0, .LC67
	add	x0, x0, :lo12:.LC67
	bl	_printk
	mov	x1, x25
	add	x2, x19, 32
	mov	x0, x23
	mov	x4, 0
	mov	w3, 3520
	bl	dma_alloc_attrs
	str	x0, [x19, 24]
	cbz	x0, .L210
	str	x24, [x19, 16]
	sub	w2, w26, #1
	str	w25, [x19, 40]
	str	x0, [x19, 48]
	str	w26, [x19, 56]
	cbz	w21, .L211
.L204:
	mov	w0, 0
	str	w2, [x19, 60]
	strh	w22, [x19, 64]
	strb	w21, [x19, 66]
.L197:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L211:
	mov	w0, 1
	mov	w2, 0
	cmp	w26, w0
	bls	.L204
	.p2align 3,,7
.L202:
	lsl	w0, w0, 1
	cmp	w26, w0
	bhi	.L202
	sub	w2, w0, #1
	b	.L204
.L209:
	mov	x0, x23
	mov	w2, w26
	adrp	x1, .LC64
	add	x1, x1, :lo12:.LC64
	bl	_dev_err
	mov	w0, -22
	b	.L197
.L210:
	mov	x0, x23
	mov	x3, x25
	mov	w2, w26
	adrp	x1, .LC68
	add	x1, x1, :lo12:.LC68
	bl	_dev_err
	mov	w0, -105
	b	.L197
	.size	hailo_desc_list_create, .-hailo_desc_list_create
	.section	.rodata.str1.8
	.align	3
.LC69:
	.string	"\0016FUNC_ENTRY: Entering function hailo_desc_list_release at %s:%d\n"
	.align	3
.LC70:
	.string	"\0016DMA_INSTRUMENT: About to call dma_free_coherent from function %s at %s:%d\n"
	.align	3
.LC71:
	.string	"\0016DMA_STACK_START: Stack trace for dma_free_coherent called from %s\n"
	.align	3
.LC72:
	.string	"\0016DMA_STACK_END: End of stack trace for dma_free_coherent\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_desc_list_release
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE10
	.text
.LPFE10:
	nop
	nop
	.type	hailo_desc_list_release, %function
hailo_desc_list_release:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	mov	w2, 486
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	adrp	x19, .LANCHOR1
	add	x19, x19, :lo12:.LANCHOR1
	stp	x21, x22, [sp, 32]
	adrp	x21, .LC0
	add	x21, x21, :lo12:.LC0
	mov	x20, x1
	mov	x22, x0
	mov	x1, x21
	add	x19, x19, 136
	adrp	x0, .LC69
	add	x0, x0, :lo12:.LC69
	bl	_printk
	mov	x2, x21
	mov	w3, 487
	mov	x1, x19
	adrp	x0, .LC70
	add	x0, x0, :lo12:.LC70
	bl	_printk
	mov	x1, x19
	adrp	x0, .LC71
	add	x0, x0, :lo12:.LC71
	bl	_printk
	bl	dump_stack
	adrp	x0, .LC72
	add	x0, x0, :lo12:.LC72
	bl	_printk
	ldp	x2, x3, [x20, 24]
	mov	x0, x22
	ldr	w1, [x20, 40]
	mov	x4, 0
	bl	dma_free_attrs
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.size	hailo_desc_list_release, .-hailo_desc_list_release
	.section	.rodata.str1.8
	.align	3
.LC73:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_find_descriptors_buffer at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_find_descriptors_buffer
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE11
	.text
.LPFE11:
	nop
	nop
	.type	hailo_vdma_find_descriptors_buffer, %function
hailo_vdma_find_descriptors_buffer:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	mov	w2, 497
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x20, x1
	adrp	x0, .LC73
	adrp	x1, .LC0
	add	x0, x0, :lo12:.LC73
	add	x1, x1, :lo12:.LC0
	bl	_printk
	mov	x3, x19
	ldr	x0, [x3, 32]!
	cmp	x0, x3
	bne	.L216
	b	.L217
	.p2align 2,,3
.L220:
	ldr	x0, [x0]
	cmp	x0, x3
	beq	.L217
.L216:
	ldr	x2, [x0, 16]
	cmp	x2, x20
	bne	.L220
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L217:
	ldp	x19, x20, [sp, 16]
	mov	x0, 0
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.size	hailo_vdma_find_descriptors_buffer, .-hailo_vdma_find_descriptors_buffer
	.section	.rodata.str1.8
	.align	3
.LC74:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_clear_descriptors_buffer_list at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_clear_descriptors_buffer_list
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE12
	.text
.LPFE12:
	nop
	nop
	.type	hailo_vdma_clear_descriptors_buffer_list, %function
hailo_vdma_clear_descriptors_buffer_list:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -64]!
	mov	w2, 510
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x22, x1
	adrp	x0, .LC74
	adrp	x1, .LC0
	add	x0, x0, :lo12:.LC74
	add	x1, x1, :lo12:.LC0
	stp	x19, x20, [sp, 16]
	bl	_printk
	ldr	x19, [x21, 32]!
	ldr	x20, [x19]
	cmp	x19, x21
	beq	.L221
	stp	x23, x24, [sp, 48]
	mov	x24, 256
	mov	x23, 290
	movk	x24, 0xdead, lsl 48
	movk	x23, 0xdead, lsl 48
	.p2align 3,,7
.L222:
	ldr	x2, [x19, 8]
	str	x2, [x20, 8]
	mov	x1, x19
	str	x20, [x2]
	stp	x24, x23, [x19]
	ldr	x0, [x22, 16]
	bl	hailo_desc_list_release
	mov	x0, x19
	mov	x19, x20
	bl	kfree
	ldr	x20, [x20]
	cmp	x19, x21
	bne	.L222
	ldp	x23, x24, [sp, 48]
.L221:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	hint	29 // autiasp
	ret
	.size	hailo_vdma_clear_descriptors_buffer_list, .-hailo_vdma_clear_descriptors_buffer_list
	.section	.rodata.str1.8
	.align	3
.LC75:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_low_memory_buffer_alloc at %s:%d\n"
	.align	3
.LC76:
	.string	"\0013Failed to allocate pages for buffer (size %zu)\n"
	.align	3
.LC77:
	.string	"\0013Failed to allocate %zu coherent bytes\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_low_memory_buffer_alloc
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE13
	.text
.LPFE13:
	nop
	nop
	.type	hailo_vdma_low_memory_buffer_alloc, %function
hailo_vdma_low_memory_buffer_alloc:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	mov	w2, 521
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	adrp	x0, .LC75
	add	x0, x0, :lo12:.LC75
	stp	x21, x22, [sp, 32]
	mov	x22, x1
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
	bl	_printk
	mov	x0, 16383
	add	x21, x19, x0
	mov	w1, 3520
	lsr	x21, x21, 14
	lsl	x0, x21, 3
	bl	__kmalloc_noprof
	cbz	x0, .L228
	mov	x20, x0
	mov	x19, 0
	cbnz	x21, .L229
	b	.L230
	.p2align 2,,3
.L232:
	str	x0, [x20, x19, lsl 3]
	add	x19, x19, 1
	cmp	x21, x19
	beq	.L230
.L229:
	mov	w1, 0
	mov	w0, 4
	bl	get_free_pages_noprof
	cbnz	x0, .L232
	adrp	x0, .LC77
	mov	x1, 16384
	add	x0, x0, :lo12:.LC77
	mov	x21, x20
	add	x22, x20, x19, lsl 3
	bl	_printk
	cbz	x19, .L234
	.p2align 3,,7
.L235:
	ldr	x0, [x21], 8
	mov	w1, 0
	bl	free_pages
	cmp	x21, x22
	bne	.L235
.L234:
	mov	x0, x20
	bl	kfree
	mov	w0, -12
	b	.L227
	.p2align 2,,3
.L230:
	mov	w0, 0
	stp	x21, x20, [x22, 24]
.L227:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
.L228:
	mov	x1, x19
	adrp	x0, .LC76
	add	x0, x0, :lo12:.LC76
	bl	_printk
	mov	w0, -12
	b	.L227
	.size	hailo_vdma_low_memory_buffer_alloc, .-hailo_vdma_low_memory_buffer_alloc
	.section	.rodata.str1.8
	.align	3
.LC78:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_low_memory_buffer_free at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_low_memory_buffer_free
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE14
	.text
.LPFE14:
	nop
	nop
	.type	hailo_vdma_low_memory_buffer_free, %function
hailo_vdma_low_memory_buffer_free:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	adrp	x1, .LC0
	mov	x29, sp
	add	x1, x1, :lo12:.LC0
	mov	w2, 567
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	adrp	x0, .LC78
	add	x0, x0, :lo12:.LC78
	bl	_printk
	cbz	x20, .L243
	ldr	x0, [x20, 24]
	cbz	x0, .L245
	mov	x19, 0
	.p2align 3,,7
.L246:
	ldr	x0, [x20, 32]
	mov	w1, 0
	ldr	x0, [x0, x19, lsl 3]
	add	x19, x19, 1
	bl	free_pages
	ldr	x0, [x20, 24]
	cmp	x19, x0
	bcc	.L246
.L245:
	ldr	x0, [x20, 32]
	bl	kfree
.L243:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.size	hailo_vdma_low_memory_buffer_free, .-hailo_vdma_low_memory_buffer_free
	.section	.rodata.str1.8
	.align	3
.LC79:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_find_low_memory_buffer at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_find_low_memory_buffer
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE15
	.text
.LPFE15:
	nop
	nop
	.type	hailo_vdma_find_low_memory_buffer, %function
hailo_vdma_find_low_memory_buffer:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	mov	w2, 583
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x20, x1
	adrp	x0, .LC79
	adrp	x1, .LC0
	add	x0, x0, :lo12:.LC79
	add	x1, x1, :lo12:.LC0
	bl	_printk
	mov	x3, x19
	ldr	x0, [x3, 48]!
	cmp	x0, x3
	bne	.L257
	b	.L258
	.p2align 2,,3
.L261:
	ldr	x0, [x0]
	cmp	x0, x3
	beq	.L258
.L257:
	ldr	x2, [x0, 16]
	cmp	x2, x20
	bne	.L261
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L258:
	ldp	x19, x20, [sp, 16]
	mov	x0, 0
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.size	hailo_vdma_find_low_memory_buffer, .-hailo_vdma_find_low_memory_buffer
	.section	.rodata.str1.8
	.align	3
.LC80:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_clear_low_memory_buffer_list at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_clear_low_memory_buffer_list
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE16
	.text
.LPFE16:
	nop
	nop
	.type	hailo_vdma_clear_low_memory_buffer_list, %function
hailo_vdma_clear_low_memory_buffer_list:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -64]!
	adrp	x1, .LC0
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	add	x1, x1, :lo12:.LC0
	adrp	x0, .LC80
	mov	w2, 596
	add	x0, x0, :lo12:.LC80
	stp	x19, x20, [sp, 16]
	bl	_printk
	ldr	x19, [x21, 48]!
	ldr	x20, [x19]
	cmp	x19, x21
	beq	.L262
	mov	x22, 290
	str	x23, [sp, 48]
	mov	x23, 256
	movk	x22, 0xdead, lsl 48
	movk	x23, 0xdead, lsl 48
	.p2align 3,,7
.L263:
	ldr	x1, [x19, 8]
	str	x1, [x20, 8]
	mov	x0, x19
	str	x20, [x1]
	stp	x23, x22, [x19]
	bl	hailo_vdma_low_memory_buffer_free
	mov	x0, x19
	mov	x19, x20
	bl	kfree
	ldr	x20, [x20]
	cmp	x19, x21
	bne	.L263
	ldr	x23, [sp, 48]
.L262:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	hint	29 // autiasp
	ret
	.size	hailo_vdma_clear_low_memory_buffer_list, .-hailo_vdma_clear_low_memory_buffer_list
	.section	.rodata.str1.8
	.align	3
.LC81:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_continuous_buffer_alloc at %s:%d\n"
	.align	3
.LC82:
	.string	"Failed to allocate continuous buffer, size 0x%zx. This failure means there is not a sufficient amount of CMA memory (contiguous physical memory), This usually is caused by lack of general system memory. Please check you have sufficent memory.\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_continuous_buffer_alloc
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE17
	.text
.LPFE17:
	nop
	nop
	.type	hailo_vdma_continuous_buffer_alloc, %function
hailo_vdma_continuous_buffer_alloc:
	nop
	nop
	hint	25 // paciasp
	sub	sp, sp, #80
	mrs	x3, sp_el0
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	adrp	x19, .LANCHOR1
	add	x19, x19, :lo12:.LANCHOR1
	stp	x21, x22, [sp, 48]
	adrp	x21, .LC0
	add	x21, x21, :lo12:.LC0
	str	x23, [sp, 64]
	mov	x23, x0
	mov	x22, x1
	add	x19, x19, 160
	ldr	x0, [x3, 1424]
	str	x0, [sp, 8]
	mov	x0, 0
	mov	x1, x21
	mov	x20, x2
	adrp	x0, .LC81
	mov	w2, 608
	add	x0, x0, :lo12:.LC81
	bl	_printk
	str	xzr, [sp]
	mov	x2, x21
	mov	w3, 612
	mov	x1, x19
	adrp	x0, .LC65
	add	x0, x0, :lo12:.LC65
	bl	_printk
	mov	x1, x19
	adrp	x0, .LC66
	add	x0, x0, :lo12:.LC66
	bl	_printk
	bl	dump_stack
	adrp	x0, .LC67
	add	x0, x0, :lo12:.LC67
	bl	_printk
	mov	x2, sp
	mov	x1, x22
	mov	x0, x23
	mov	x4, 0
	mov	w3, 3264
	bl	dma_alloc_attrs
	cbz	x0, .L273
	ldr	x2, [sp]
	mov	x1, x0
	mov	w0, 0
	stp	x1, x2, [x20, 24]
	str	x22, [x20, 40]
.L268:
	mrs	x1, sp_el0
	ldr	x3, [sp, 8]
	ldr	x2, [x1, 1424]
	subs	x3, x3, x2
	mov	x2, 0
	bne	.L274
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	ldp	x21, x22, [sp, 48]
	ldr	x23, [sp, 64]
	add	sp, sp, 80
	hint	29 // autiasp
	ret
.L273:
	mov	x0, x23
	mov	x2, x22
	adrp	x1, .LC82
	add	x1, x1, :lo12:.LC82
	bl	_dev_warn
	mov	w0, -105
	b	.L268
.L274:
	bl	__stack_chk_fail
	.size	hailo_vdma_continuous_buffer_alloc, .-hailo_vdma_continuous_buffer_alloc
	.section	.rodata.str1.8
	.align	3
.LC83:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_continuous_buffer_free at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_continuous_buffer_free
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE18
	.text
.LPFE18:
	nop
	nop
	.type	hailo_vdma_continuous_buffer_free, %function
hailo_vdma_continuous_buffer_free:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -48]!
	mov	w2, 632
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	adrp	x19, .LANCHOR1
	add	x19, x19, :lo12:.LANCHOR1
	stp	x21, x22, [sp, 32]
	adrp	x21, .LC0
	add	x21, x21, :lo12:.LC0
	mov	x20, x1
	mov	x22, x0
	mov	x1, x21
	add	x19, x19, 200
	adrp	x0, .LC83
	add	x0, x0, :lo12:.LC83
	bl	_printk
	mov	x2, x21
	mov	w3, 633
	mov	x1, x19
	adrp	x0, .LC70
	add	x0, x0, :lo12:.LC70
	bl	_printk
	mov	x1, x19
	adrp	x0, .LC71
	add	x0, x0, :lo12:.LC71
	bl	_printk
	bl	dump_stack
	adrp	x0, .LC72
	add	x0, x0, :lo12:.LC72
	bl	_printk
	ldp	x2, x3, [x20, 24]
	mov	x0, x22
	ldr	x1, [x20, 40]
	mov	x4, 0
	bl	dma_free_attrs
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	hint	29 // autiasp
	ret
	.size	hailo_vdma_continuous_buffer_free, .-hailo_vdma_continuous_buffer_free
	.section	.rodata.str1.8
	.align	3
.LC84:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_find_continuous_buffer at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_find_continuous_buffer
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE19
	.text
.LPFE19:
	nop
	nop
	.type	hailo_vdma_find_continuous_buffer, %function
hailo_vdma_find_continuous_buffer:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -32]!
	mov	w2, 644
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x20, x1
	adrp	x0, .LC84
	adrp	x1, .LC0
	add	x0, x0, :lo12:.LC84
	add	x1, x1, :lo12:.LC0
	bl	_printk
	mov	x3, x19
	ldr	x0, [x3, 64]!
	cmp	x0, x3
	bne	.L279
	b	.L280
	.p2align 2,,3
.L283:
	ldr	x0, [x0]
	cmp	x0, x3
	beq	.L280
.L279:
	ldr	x2, [x0, 16]
	cmp	x2, x20
	bne	.L283
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.p2align 2,,3
.L280:
	ldp	x19, x20, [sp, 16]
	mov	x0, 0
	ldp	x29, x30, [sp], 32
	hint	29 // autiasp
	ret
	.size	hailo_vdma_find_continuous_buffer, .-hailo_vdma_find_continuous_buffer
	.section	.rodata.str1.8
	.align	3
.LC85:
	.string	"\0016FUNC_ENTRY: Entering function hailo_vdma_clear_continuous_buffer_list at %s:%d\n"
	.text
	.align	2
	.p2align 3,,7
	.global	hailo_vdma_clear_continuous_buffer_list
	.section	__patchable_function_entries,"awo",@progbits,clear_sg_table
	.align	3
	.8byte	.LPFE20
	.text
.LPFE20:
	nop
	nop
	.type	hailo_vdma_clear_continuous_buffer_list, %function
hailo_vdma_clear_continuous_buffer_list:
	nop
	nop
	hint	25 // paciasp
	stp	x29, x30, [sp, -64]!
	mov	w2, 658
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x22, x1
	adrp	x0, .LC85
	adrp	x1, .LC0
	add	x0, x0, :lo12:.LC85
	add	x1, x1, :lo12:.LC0
	stp	x19, x20, [sp, 16]
	bl	_printk
	ldr	x19, [x21, 64]!
	ldr	x20, [x19]
	cmp	x19, x21
	beq	.L284
	stp	x23, x24, [sp, 48]
	mov	x24, 256
	mov	x23, 290
	movk	x24, 0xdead, lsl 48
	movk	x23, 0xdead, lsl 48
	.p2align 3,,7
.L285:
	ldr	x2, [x19, 8]
	str	x2, [x20, 8]
	mov	x1, x19
	str	x20, [x2]
	stp	x24, x23, [x19]
	ldr	x0, [x22, 16]
	bl	hailo_vdma_continuous_buffer_free
	mov	x0, x19
	mov	x19, x20
	bl	kfree
	ldr	x20, [x20]
	cmp	x19, x21
	bne	.L285
	ldp	x23, x24, [sp, 48]
.L284:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	hint	29 // autiasp
	ret
	.size	hailo_vdma_clear_continuous_buffer_list, .-hailo_vdma_clear_continuous_buffer_list
	.section	.rodata
	.align	3
	.set	.LANCHOR1,. + 0
	.type	__func__.7, %object
	.size	__func__.7, 17
__func__.7:
	.string	"hailo_map_dmabuf"
	.zero	7
	.type	__func__.8, %object
	.size	__func__.8, 22
__func__.8:
	.string	"hailo_vdma_buffer_map"
	.zero	2
	.type	__func__.5, %object
	.size	__func__.5, 19
__func__.5:
	.string	"hailo_unmap_dmabuf"
	.zero	5
	.type	__func__.6, %object
	.size	__func__.6, 13
__func__.6:
	.string	"unmap_buffer"
	.zero	3
	.type	__func__.4, %object
	.size	__func__.4, 24
__func__.4:
	.string	"vdma_sync_entire_buffer"
	.type	__func__.3, %object
	.size	__func__.3, 23
__func__.3:
	.string	"hailo_desc_list_create"
	.zero	1
	.type	__func__.2, %object
	.size	__func__.2, 24
__func__.2:
	.string	"hailo_desc_list_release"
	.type	__func__.1, %object
	.size	__func__.1, 35
__func__.1:
	.string	"hailo_vdma_continuous_buffer_alloc"
	.zero	5
	.type	__func__.0, %object
	.size	__func__.0, 34
__func__.0:
	.string	"hailo_vdma_continuous_buffer_free"
	.section	.data..once,"aw"
	.set	.LANCHOR0,. + 0
	.type	__already_done.9, %object
	.size	__already_done.9, 1
__already_done.9:
	.zero	1
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_import_ns495, %object
	.size	__UNIQUE_ID_import_ns495, 18
__UNIQUE_ID_import_ns495:
	.string	"import_ns=DMA_BUF"
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
