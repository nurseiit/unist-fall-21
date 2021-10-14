
.global gcd
gcd:
/* Your Code for gcd from here */
/* a @ x10, b @ x11 returns the gcd*/
/* Your Code for gcd to here */
/* "gcd(a, b) = b ? gcd(b, a % b) : a" */
	addi    sp,sp,-32
	sd      ra,24(sp)
	sd      s0,16(sp)
	addi    s0,sp,32
	mv      a5,a0
	mv      a4,a1
	sw      a5,-20(s0)
	mv      a5,a4
	sw      a5,-24(s0)
	lw      a5,-24(s0)
	sext.w  a5,a5
	beq     a5,zero,.L2
	lw      a4,-20(s0)
	lw      a5,-24(s0)
	remw    a5,a4,a5
	sext.w  a4,a5
	lw      a5,-24(s0)
	mv      a1,a4
	mv      a0,a5
	call    gcd
	mv      a5,a0
	j       .L3
.L2:
	lw      a5,-20(s0)
.L3:
	mv      a0,a5
	ld      ra,24(sp)
	ld      s0,16(sp)
	addi    sp,sp,32
	jr      ra


.global lcm
lcm:
/* Your Code for lcm from here */
/* a @ x10, b @ x11*/
/* Your Code for lcm to here */
/* "lcm = a / gcd (a, b) * b" */
	addi    sp,sp,-32
	sd      ra,24(sp)
	sd      s0,16(sp)
	addi    s0,sp,32
	mv      a5,a0
	mv      a4,a1
	sw      a5,-20(s0)
	mv      a5,a4
	sw      a5,-24(s0)
	lw      a4,-24(s0)
	lw      a5,-20(s0)
	mv      a1,a4
	mv      a0,a5
	call    gcd
	mv      a5,a0
	mv      a4,a5
	lw      a5,-20(s0)
	divw    a5,a5,a4
	sext.w  a5,a5
	lw      a4,-24(s0)
	mulw    a5,a4,a5
	sext.w  a5,a5
	mv      a0,a5
	ld      ra,24(sp)
	ld      s0,16(sp)
	addi    sp,sp,32
	jr      ra
