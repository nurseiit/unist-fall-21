.global sort
sort:
/* first  argument (x10): the address of output buffer */
/* second argument (x11): the start address of the incoming list */
/* third  argument (x12): the length of incoming list */
/* your sort code from here */
/* your sort code to here */
	addi    sp,sp,-64
	sd      s0,56(sp)
	addi    s0,sp,64
	sd      a0,-40(s0)
	sd      a1,-48(s0)
	mv      a5,a2
	sw      a5,-52(s0)
	sw      zero,-20(s0)
.L3:
	lw      a4,-20(s0)
	lw      a5,-52(s0)
	sext.w  a4,a4
	sext.w  a5,a5
	bge     a4,a5,.L2
	lw      a5,-20(s0)
	slli    a5,a5,2
	ld      a4,-48(s0)
	add     a4,a4,a5
	lw      a5,-20(s0)
	slli    a5,a5,2
	ld      a3,-40(s0)
	add     a5,a3,a5
	lw      a4,0(a4)
	sw      a4,0(a5)
	lw      a5,-20(s0)
	addiw   a5,a5,1
	sw      a5,-20(s0)
	j       .L3
.L2:
	sw      zero,-24(s0)
.L8:
	lw      a4,-24(s0)
	lw      a5,-52(s0)
	sext.w  a4,a4
	sext.w  a5,a5
	bge     a4,a5,.L4
	lw      a5,-24(s0)
	addiw   a5,a5,1
	sw      a5,-28(s0)
.L7:
	lw      a4,-28(s0)
	lw      a5,-52(s0)
	sext.w  a4,a4
	sext.w  a5,a5
	bge     a4,a5,.L5
	lw      a5,-24(s0)
	slli    a5,a5,2
	ld      a4,-40(s0)
	add     a5,a4,a5
	lw      a3,0(a5)
	lw      a5,-28(s0)
	slli    a5,a5,2
	ld      a4,-40(s0)
	add     a5,a4,a5
	lw      a5,0(a5)
	mv      a4,a3
	ble     a4,a5,.L6
	lw      a5,-24(s0)
	slli    a5,a5,2
	ld      a4,-40(s0)
	add     a5,a4,a5
	lw      a5,0(a5)
	sw      a5,-32(s0)
	lw      a5,-28(s0)
	slli    a5,a5,2
	ld      a4,-40(s0)
	add     a4,a4,a5
	lw      a5,-24(s0)
	slli    a5,a5,2
	ld      a3,-40(s0)
	add     a5,a3,a5
	lw      a4,0(a4)
	sw      a4,0(a5)
	lw      a5,-28(s0)
	slli    a5,a5,2
	ld      a4,-40(s0)
	add     a5,a4,a5
	lw      a4,-32(s0)
	sw      a4,0(a5)
.L6:
	lw      a5,-28(s0)
	addiw   a5,a5,1
	sw      a5,-28(s0)
	j       .L7
.L5:
	lw      a5,-24(s0)
	addiw   a5,a5,1
	sw      a5,-24(s0)
	j       .L8
.L4:
	nop
	mv      a0,a5
	ld      s0,56(sp)
	addi    sp,sp,64
	jr      ra

