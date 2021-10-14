
.global matmul
matmul:
/* save return address (in x1) in stack*/
/* first argument (x10): the address of output buffer */
/* second argument (x11): the start address of a */
/* third argument (x12): the start address of b */
/* fourth argument (x13): the dimension */
/* your matmul code from here */
  addi sp,sp,-64
  sd s0,56(sp)
  addi s0,sp,64
  sd a0,-40(s0)
  sd a1,-48(s0)
  sd a2,-56(s0)
  mv a5,a3
  sw a5,-60(s0)
  sw zero,-20(s0)
.L7:
  lw a4,-20(s0)
  lw a5,-60(s0)
  sext.w a4,a4
  sext.w a5,a5
  bge a4,a5,.L8
  sw zero,-24(s0)
.L6:
  lw a4,-24(s0)
  lw a5,-60(s0)
  sext.w a4,a4
  sext.w a5,a5
  bge a4,a5,.L3
  lw a4,-20(s0)
  lw a5,-60(s0)
  mulw a5,a4,a5
  sext.w a5,a5
  lw a4,-24(s0)
  addw a5,a4,a5
  sext.w a5,a5
  slli a5,a5,2
  ld a4,-40(s0)
  add a5,a4,a5
  sw zero,0(a5)
  sw zero,-28(s0)
.L5:
  lw a4,-28(s0)
  lw a5,-60(s0)
  sext.w a4,a4
  sext.w a5,a5
  bge a4,a5,.L4
  lw a4,-20(s0)
  lw a5,-60(s0)
  mulw a5,a4,a5
  sext.w a5,a5
  lw a4,-24(s0)
  addw a5,a4,a5
  sext.w a5,a5
  slli a5,a5,2
  ld a4,-40(s0)
  add a5,a4,a5
  lw a3,0(a5)
  lw a4,-20(s0)
  lw a5,-60(s0)
  mulw a5,a4,a5
  sext.w a5,a5
  lw a4,-28(s0)
  addw a5,a4,a5
  sext.w a5,a5
  slli a5,a5,2
  ld a4,-48(s0)
  add a5,a4,a5
  lw a4,0(a5)
  lw a2,-28(s0)
  lw a5,-60(s0)
  mulw a5,a2,a5
  sext.w a5,a5
  lw a2,-24(s0)
  addw a5,a2,a5
  sext.w a5,a5
  slli a5,a5,2
  ld a2,-56(s0)
  add a5,a2,a5
  lw a5,0(a5)
  mulw a5,a4,a5
  sext.w a4,a5
  lw a2,-20(s0)
  lw a5,-60(s0)
  mulw a5,a2,a5
  sext.w a5,a5
  lw a2,-24(s0)
  addw a5,a2,a5
  sext.w a5,a5
  slli a5,a5,2
  ld a2,-40(s0)
  add a5,a2,a5
  addw a4,a3,a4
  sext.w a4,a4
  sw a4,0(a5)
  lw a5,-28(s0)
  addiw a5,a5,1
  sw a5,-28(s0)
  j .L5
.L4:
  lw a5,-24(s0)
  addiw a5,a5,1
  sw a5,-24(s0)
  j .L6
.L3:
  lw a5,-20(s0)
  addiw a5,a5,1
  sw a5,-20(s0)
  j .L7
.L8:
  nop
  ld s0,56(sp)
  addi sp,sp,64
  jr ra
  