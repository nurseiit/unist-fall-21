.global copy
copy:
  /* 
	 Copy take two arguments and returns nothing.
	 x10 contains the pointer to the destination memory
	 x11 contains the pointer to the source memory
	 x12 containts the length of destination and source memroy
	 copy function reads
	*/

	addi    x28, x0, 0
	beq     x28, x12, out 
loop:
  slli     x5, x28, 2
  add     x29, x11, x5				/* next address to write*/
	add     x30, x10, x5				/* next address to read */
	lw      x31, 0(x29)
	sw      x31, 0(x30) 
	addi    x28, x28, 1
	bne 		x28, x12, loop 					#
out:
	jr			x1
