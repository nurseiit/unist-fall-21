
.global matmul
matmul:
/* save return address (in x1) in stack*/
/* first argument (x10): the address of output buffer */
/* second argument (x11): the start address of a */
/* third argument (x12): the start address of b */
/* fourth argument (x13): the dimension */
/* your matmul code from here */
	addi	sp, sp, -8
	sd	x1, 0(sp)
	/* ...*/
	ld	x1, 0(sp)
	addi	sp, sp, 8
/* your matmul code to here */
	jr x1


.global matmul_idx
matmul_idx:
/* Recommanded arguments */
/* first argument (x10): the address of output buffer */
/* second argument (x11): the start address of a */
/* third argument (x12): the start address of b */
/* fourth argument (x13): the dimension */
/* fourth argument (x14): row index of the result matrix to fill out */
/* fourth argument (x15): column index of the result matrix to fill out */
/* your matmul_idx (helper function) code from here */
/* your matmul_idx (helper function) code to here */
	jr x1
