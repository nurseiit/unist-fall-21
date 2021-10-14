.global sort
sort:
/* first  argument (x10): the address of output buffer */
/* second argument (x11): the start address of the incoming list */
/* third  argument (x12): the length of incoming list */
/* your sort code from here */
/* your sort code to here */
	jr	x1

.global insert
insert:
/* Recommanded arguments */
/* first argument (x10): the address of output buffer */
/* third  argument (x11): the current length of output buffer */
/* third  argument (x12): the integer to insert */
/* your insert code from here */
/* your insert code to here */	
	jr	x1


