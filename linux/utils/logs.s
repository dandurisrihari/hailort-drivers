	.arch armv8-a
	.file	"logs.c"
	.text
	.global	o_dbg
	.data
	.align	2
	.type	o_dbg, %object
	.size	o_dbg, 4
o_dbg:
	.word	5
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
