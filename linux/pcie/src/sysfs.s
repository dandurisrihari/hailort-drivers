	.arch armv8-a
	.file	"sysfs.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%d"
	.text
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,accelerator_type_show
	.align	3
	.8byte	.LPFE1
	.text
.LPFE1:
	nop
	nop
	.type	accelerator_type_show, %function
accelerator_type_show:
	nop
	nop
	mov	x3, x0
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	mov	x0, x2
	adrp	x1, .LC0
	mov	x29, sp
	ldr	x2, [x3, 120]
	add	x1, x1, :lo12:.LC0
	ldr	w2, [x2, 100]
	bl	sprintf
	sxtw	x0, w0
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	ret
	.size	accelerator_type_show, .-accelerator_type_show
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"%x:%x"
	.text
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,accelerator_type_show
	.align	3
	.8byte	.LPFE2
	.text
.LPFE2:
	nop
	nop
	.type	device_id_show, %function
device_id_show:
	nop
	nop
	mov	x3, x0
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	mov	x0, x2
	adrp	x1, .LC1
	mov	x29, sp
	ldr	x2, [x3, 120]
	add	x1, x1, :lo12:.LC1
	ldr	x2, [x2, 16]
	ldrh	w3, [x2, 62]
	ldrh	w2, [x2, 60]
	bl	sprintf
	sxtw	x0, w0
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	ret
	.size	device_id_show, .-device_id_show
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"%s"
	.text
	.align	2
	.p2align 3,,7
	.section	__patchable_function_entries,"awo",@progbits,accelerator_type_show
	.align	3
	.8byte	.LPFE3
	.text
.LPFE3:
	nop
	nop
	.type	board_location_show, %function
board_location_show:
	nop
	nop
	mov	x1, x0
	hint	25 // paciasp
	stp	x29, x30, [sp, -16]!
	mov	x0, x2
	mov	x29, sp
	ldr	x1, [x1, 120]
	ldr	x1, [x1, 16]
	ldr	x2, [x1, 280]
	cbnz	x2, .L7
	ldr	x2, [x1, 200]
.L7:
	adrp	x1, .LC2
	add	x1, x1, :lo12:.LC2
	bl	sprintf
	ldp	x29, x30, [sp], 16
	hint	29 // autiasp
	sxtw	x0, w0
	ret
	.size	board_location_show, .-board_location_show
	.global	g_hailo_dev_groups
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"accelerator_type"
	.align	3
.LC4:
	.string	"device_id"
	.align	3
.LC5:
	.string	"board_location"
	.section	.rodata
	.align	3
	.type	hailo_dev_group, %object
	.size	hailo_dev_group, 40
hailo_dev_group:
	.zero	24
	.xword	hailo_dev_attrs
	.zero	8
	.data
	.align	3
	.type	g_hailo_dev_groups, %object
	.size	g_hailo_dev_groups, 8
g_hailo_dev_groups:
	.xword	hailo_dev_groups
	.type	hailo_dev_groups, %object
	.size	hailo_dev_groups, 16
hailo_dev_groups:
	.xword	hailo_dev_group
	.xword	0
	.type	hailo_dev_attrs, %object
	.size	hailo_dev_attrs, 32
hailo_dev_attrs:
	.xword	dev_attr_board_location
	.xword	dev_attr_device_id
	.xword	dev_attr_accelerator_type
	.xword	0
	.type	dev_attr_accelerator_type, %object
	.size	dev_attr_accelerator_type, 32
dev_attr_accelerator_type:
	.xword	.LC3
	.hword	292
	.zero	6
	.xword	accelerator_type_show
	.zero	8
	.type	dev_attr_device_id, %object
	.size	dev_attr_device_id, 32
dev_attr_device_id:
	.xword	.LC4
	.hword	292
	.zero	6
	.xword	device_id_show
	.zero	8
	.type	dev_attr_board_location, %object
	.size	dev_attr_board_location, 32
dev_attr_board_location:
	.xword	.LC5
	.hword	292
	.zero	6
	.xword	board_location_show
	.zero	8
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
