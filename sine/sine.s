.globl sine

default_answer = 0x312d

.section .data
# if you need some data, put it here
var:
.align 8
.space 100


.section .text

# Sine
#   Params
#	a1 -- input buffer will contain string with the argument
#	a2 -- output string buffer for the string result
sine:
	# load first byte
	lb t0, 0(a1)
	sb t0, 0(a2)

	# if first symbol is '0', then answer is 1 and program is finished
	li t6, '1'
	beq t0, t6, finish
	
	# else copy input to output
copy_loop:
	addi a1, a1, 1
	addi a2, a2, 1
	lb t0, 0(a1)
	sb t0, 0(a2)
	bne t0, zero, copy_loop


finish:
	ret

