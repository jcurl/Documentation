
functest.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <test_funcintr>:
   0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   4:	910003fd 	mov	x29, sp
   8:	94000000 	bl	0 <funcintr>
   c:	11000400 	add	w0, w0, #0x1
  10:	b9001fe0 	str	w0, [sp, #28]
  14:	b9401fe0 	ldr	w0, [sp, #28]
  18:	a8c27bfd 	ldp	x29, x30, [sp], #32
  1c:	d65f03c0 	ret

0000000000000020 <test_funcint64r>:
  20:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  24:	910003fd 	mov	x29, sp
  28:	94000000 	bl	0 <funcint64r>
  2c:	91000400 	add	x0, x0, #0x1
  30:	f9000fe0 	str	x0, [sp, #24]
  34:	f9400fe0 	ldr	x0, [sp, #24]
  38:	a8c27bfd 	ldp	x29, x30, [sp], #32
  3c:	d65f03c0 	ret

0000000000000040 <test_funcint64r2>:
  40:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  44:	910003fd 	mov	x29, sp
  48:	94000000 	bl	0 <funcint64r2>
  4c:	91000400 	add	x0, x0, #0x1
  50:	f9000fe0 	str	x0, [sp, #24]
  54:	f9400fe0 	ldr	x0, [sp, #24]
  58:	a8c27bfd 	ldp	x29, x30, [sp], #32
  5c:	d65f03c0 	ret

0000000000000060 <test_funcint>:
  60:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  64:	910003fd 	mov	x29, sp
  68:	52800062 	mov	w2, #0x3                   	// #3
  6c:	52800041 	mov	w1, #0x2                   	// #2
  70:	52800020 	mov	w0, #0x1                   	// #1
  74:	94000000 	bl	0 <funcint>
  78:	11000400 	add	w0, w0, #0x1
  7c:	b9001fe0 	str	w0, [sp, #28]
  80:	b9401fe0 	ldr	w0, [sp, #28]
  84:	a8c27bfd 	ldp	x29, x30, [sp], #32
  88:	d65f03c0 	ret

000000000000008c <test_funcchar>:
  8c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  90:	910003fd 	mov	x29, sp
  94:	52800041 	mov	w1, #0x2                   	// #2
  98:	52800020 	mov	w0, #0x1                   	// #1
  9c:	94000000 	bl	0 <funcchar>
  a0:	11000400 	add	w0, w0, #0x1
  a4:	b9001fe0 	str	w0, [sp, #28]
  a8:	b9401fe0 	ldr	w0, [sp, #28]
  ac:	a8c27bfd 	ldp	x29, x30, [sp], #32
  b0:	d65f03c0 	ret

00000000000000b4 <test_funcfloat>:
  b4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  b8:	910003fd 	mov	x29, sp
  bc:	1e211002 	fmov	s2, #3.000000000000000000e+00
  c0:	1e201001 	fmov	s1, #2.000000000000000000e+00
  c4:	1e2e1000 	fmov	s0, #1.000000000000000000e+00
  c8:	94000000 	bl	0 <funcfloat>
  cc:	1e22c001 	fcvt	d1, s0
  d0:	1e621000 	fmov	d0, #4.000000000000000000e+00
  d4:	1e602820 	fadd	d0, d1, d0
  d8:	1e624000 	fcvt	s0, d0
  dc:	bd001fe0 	str	s0, [sp, #28]
  e0:	bd401fe0 	ldr	s0, [sp, #28]
  e4:	5ea1b800 	fcvtzs	s0, s0
  e8:	1e260000 	fmov	w0, s0
  ec:	a8c27bfd 	ldp	x29, x30, [sp], #32
  f0:	d65f03c0 	ret

00000000000000f4 <test_funcfloatint>:
  f4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  f8:	910003fd 	mov	x29, sp
  fc:	1e221001 	fmov	s1, #4.000000000000000000e+00
 100:	52800061 	mov	w1, #0x3                   	// #3
 104:	1e201000 	fmov	s0, #2.000000000000000000e+00
 108:	52800020 	mov	w0, #0x1                   	// #1
 10c:	94000000 	bl	0 <funcfloatint>
 110:	11000400 	add	w0, w0, #0x1
 114:	b9001fe0 	str	w0, [sp, #28]
 118:	b9401fe0 	ldr	w0, [sp, #28]
 11c:	a8c27bfd 	ldp	x29, x30, [sp], #32
 120:	d65f03c0 	ret

0000000000000124 <test_funcdouble>:
 124:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 128:	910003fd 	mov	x29, sp
 12c:	1e621001 	fmov	d1, #4.000000000000000000e+00
 130:	1e601000 	fmov	d0, #2.000000000000000000e+00
 134:	94000000 	bl	0 <funcdouble>
 138:	1e604001 	fmov	d1, d0
 13c:	1e6e1000 	fmov	d0, #1.000000000000000000e+00
 140:	1e602820 	fadd	d0, d1, d0
 144:	fd000fe0 	str	d0, [sp, #24]
 148:	fd400fe0 	ldr	d0, [sp, #24]
 14c:	1e780000 	fcvtzs	w0, d0
 150:	a8c27bfd 	ldp	x29, x30, [sp], #32
 154:	d65f03c0 	ret

0000000000000158 <test_funcstructvalue>:
 158:	a9b97bfd 	stp	x29, x30, [sp, #-112]!
 15c:	910003fd 	mov	x29, sp
 160:	90000000 	adrp	x0, 0 <test_funcintr>
 164:	91000000 	add	x0, x0, #0x0
 168:	910143e2 	add	x2, sp, #0x50
 16c:	aa0003e3 	mov	x3, x0
 170:	a9400460 	ldp	x0, x1, [x3]
 174:	a9000440 	stp	x0, x1, [x2]
 178:	f9400860 	ldr	x0, [x3, #16]
 17c:	f9000840 	str	x0, [x2, #16]
 180:	a903ffff 	stp	xzr, xzr, [sp, #56]
 184:	f90027ff 	str	xzr, [sp, #72]
 188:	910043e2 	add	x2, sp, #0x10
 18c:	910143e3 	add	x3, sp, #0x50
 190:	a9400460 	ldp	x0, x1, [x3]
 194:	a9000440 	stp	x0, x1, [x2]
 198:	f9400860 	ldr	x0, [x3, #16]
 19c:	f9000840 	str	x0, [x2, #16]
 1a0:	9100e3e1 	add	x1, sp, #0x38
 1a4:	910043e0 	add	x0, sp, #0x10
 1a8:	94000000 	bl	0 <funcstructvalue>
 1ac:	11000400 	add	w0, w0, #0x1
 1b0:	b9006fe0 	str	w0, [sp, #108]
 1b4:	b9406fe0 	ldr	w0, [sp, #108]
 1b8:	a8c77bfd 	ldp	x29, x30, [sp], #112
 1bc:	d65f03c0 	ret

00000000000001c0 <test_funcstructret>:
 1c0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
 1c4:	910003fd 	mov	x29, sp
 1c8:	910063e0 	add	x0, sp, #0x18
 1cc:	aa0003e8 	mov	x8, x0
 1d0:	52800041 	mov	w1, #0x2                   	// #2
 1d4:	52800020 	mov	w0, #0x1                   	// #1
 1d8:	94000000 	bl	0 <funcstructret>
 1dc:	b9401be0 	ldr	w0, [sp, #24]
 1e0:	a8c37bfd 	ldp	x29, x30, [sp], #48
 1e4:	d65f03c0 	ret

00000000000001e8 <test_funcvarargs1>:
 1e8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 1ec:	910003fd 	mov	x29, sp
 1f0:	52800020 	mov	w0, #0x1                   	// #1
 1f4:	94000000 	bl	0 <funcvarargs>
 1f8:	11000400 	add	w0, w0, #0x1
 1fc:	b9001fe0 	str	w0, [sp, #28]
 200:	b9401fe0 	ldr	w0, [sp, #28]
 204:	a8c27bfd 	ldp	x29, x30, [sp], #32
 208:	d65f03c0 	ret

000000000000020c <test_funcvarargs4>:
 20c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 210:	910003fd 	mov	x29, sp
 214:	52800084 	mov	w4, #0x4                   	// #4
 218:	52800063 	mov	w3, #0x3                   	// #3
 21c:	52800042 	mov	w2, #0x2                   	// #2
 220:	52800021 	mov	w1, #0x1                   	// #1
 224:	52800080 	mov	w0, #0x4                   	// #4
 228:	94000000 	bl	0 <funcvarargs>
 22c:	11000400 	add	w0, w0, #0x1
 230:	b9001fe0 	str	w0, [sp, #28]
 234:	b9401fe0 	ldr	w0, [sp, #28]
 238:	a8c27bfd 	ldp	x29, x30, [sp], #32
 23c:	d65f03c0 	ret

0000000000000240 <test_funcvarargs6>:
 240:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 244:	910003fd 	mov	x29, sp
 248:	52800186 	mov	w6, #0xc                   	// #12
 24c:	52800145 	mov	w5, #0xa                   	// #10
 250:	52800104 	mov	w4, #0x8                   	// #8
 254:	528000c3 	mov	w3, #0x6                   	// #6
 258:	52800082 	mov	w2, #0x4                   	// #4
 25c:	52800041 	mov	w1, #0x2                   	// #2
 260:	528000c0 	mov	w0, #0x6                   	// #6
 264:	94000000 	bl	0 <funcvarargs>
 268:	11000400 	add	w0, w0, #0x1
 26c:	b9001fe0 	str	w0, [sp, #28]
 270:	b9401fe0 	ldr	w0, [sp, #28]
 274:	a8c27bfd 	ldp	x29, x30, [sp], #32
 278:	d65f03c0 	ret

000000000000027c <main>:
 27c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 280:	910003fd 	mov	x29, sp
 284:	b9001fff 	str	wzr, [sp, #28]
 288:	94000000 	bl	0 <test_funcintr>
 28c:	2a0003e1 	mov	w1, w0
 290:	b9401fe0 	ldr	w0, [sp, #28]
 294:	0b010000 	add	w0, w0, w1
 298:	b9001fe0 	str	w0, [sp, #28]
 29c:	94000000 	bl	20 <test_funcint64r>
 2a0:	2a0003e1 	mov	w1, w0
 2a4:	b9401fe0 	ldr	w0, [sp, #28]
 2a8:	0b010000 	add	w0, w0, w1
 2ac:	b9001fe0 	str	w0, [sp, #28]
 2b0:	94000000 	bl	40 <test_funcint64r2>
 2b4:	2a0003e1 	mov	w1, w0
 2b8:	b9401fe0 	ldr	w0, [sp, #28]
 2bc:	0b010000 	add	w0, w0, w1
 2c0:	b9001fe0 	str	w0, [sp, #28]
 2c4:	94000000 	bl	60 <test_funcint>
 2c8:	2a0003e1 	mov	w1, w0
 2cc:	b9401fe0 	ldr	w0, [sp, #28]
 2d0:	0b010000 	add	w0, w0, w1
 2d4:	b9001fe0 	str	w0, [sp, #28]
 2d8:	94000000 	bl	8c <test_funcchar>
 2dc:	2a0003e1 	mov	w1, w0
 2e0:	b9401fe0 	ldr	w0, [sp, #28]
 2e4:	0b010000 	add	w0, w0, w1
 2e8:	b9001fe0 	str	w0, [sp, #28]
 2ec:	94000000 	bl	b4 <test_funcfloat>
 2f0:	2a0003e1 	mov	w1, w0
 2f4:	b9401fe0 	ldr	w0, [sp, #28]
 2f8:	0b010000 	add	w0, w0, w1
 2fc:	b9001fe0 	str	w0, [sp, #28]
 300:	94000000 	bl	f4 <test_funcfloatint>
 304:	2a0003e1 	mov	w1, w0
 308:	b9401fe0 	ldr	w0, [sp, #28]
 30c:	0b010000 	add	w0, w0, w1
 310:	b9001fe0 	str	w0, [sp, #28]
 314:	94000000 	bl	124 <test_funcdouble>
 318:	2a0003e1 	mov	w1, w0
 31c:	b9401fe0 	ldr	w0, [sp, #28]
 320:	0b010000 	add	w0, w0, w1
 324:	b9001fe0 	str	w0, [sp, #28]
 328:	94000000 	bl	158 <test_funcstructvalue>
 32c:	2a0003e1 	mov	w1, w0
 330:	b9401fe0 	ldr	w0, [sp, #28]
 334:	0b010000 	add	w0, w0, w1
 338:	b9001fe0 	str	w0, [sp, #28]
 33c:	94000000 	bl	1c0 <test_funcstructret>
 340:	2a0003e1 	mov	w1, w0
 344:	b9401fe0 	ldr	w0, [sp, #28]
 348:	0b010000 	add	w0, w0, w1
 34c:	b9001fe0 	str	w0, [sp, #28]
 350:	94000000 	bl	1e8 <test_funcvarargs1>
 354:	2a0003e1 	mov	w1, w0
 358:	b9401fe0 	ldr	w0, [sp, #28]
 35c:	0b010000 	add	w0, w0, w1
 360:	b9001fe0 	str	w0, [sp, #28]
 364:	94000000 	bl	20c <test_funcvarargs4>
 368:	2a0003e1 	mov	w1, w0
 36c:	b9401fe0 	ldr	w0, [sp, #28]
 370:	0b010000 	add	w0, w0, w1
 374:	b9001fe0 	str	w0, [sp, #28]
 378:	94000000 	bl	240 <test_funcvarargs6>
 37c:	2a0003e1 	mov	w1, w0
 380:	b9401fe0 	ldr	w0, [sp, #28]
 384:	0b010000 	add	w0, w0, w1
 388:	b9001fe0 	str	w0, [sp, #28]
 38c:	52800000 	mov	w0, #0x0                   	// #0
 390:	a8c27bfd 	ldp	x29, x30, [sp], #32
 394:	d65f03c0 	ret
