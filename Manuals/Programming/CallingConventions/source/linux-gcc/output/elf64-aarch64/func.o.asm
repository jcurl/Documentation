
func.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <funcintr>:
   0:	52800540 	mov	w0, #0x2a                  	// #42
   4:	d65f03c0 	ret

0000000000000008 <funcint64r>:
   8:	d2c00840 	mov	x0, #0x4200000000          	// #283467841536
   c:	d65f03c0 	ret

0000000000000010 <funcint64r2>:
  10:	d2800540 	mov	x0, #0x2a                  	// #42
  14:	d65f03c0 	ret

0000000000000018 <funcint>:
  18:	d10043ff 	sub	sp, sp, #0x10
  1c:	b9000fe0 	str	w0, [sp, #12]
  20:	b9000be1 	str	w1, [sp, #8]
  24:	b90007e2 	str	w2, [sp, #4]
  28:	b9400fe0 	ldr	w0, [sp, #12]
  2c:	11000401 	add	w1, w0, #0x1
  30:	b9400be0 	ldr	w0, [sp, #8]
  34:	11000800 	add	w0, w0, #0x2
  38:	1b007c21 	mul	w1, w1, w0
  3c:	b94007e0 	ldr	w0, [sp, #4]
  40:	11000c00 	add	w0, w0, #0x3
  44:	1b007c20 	mul	w0, w1, w0
  48:	910043ff 	add	sp, sp, #0x10
  4c:	d65f03c0 	ret

0000000000000050 <funcchar>:
  50:	d10043ff 	sub	sp, sp, #0x10
  54:	39003fe0 	strb	w0, [sp, #15]
  58:	39003be1 	strb	w1, [sp, #14]
  5c:	39403fe0 	ldrb	w0, [sp, #15]
  60:	11000401 	add	w1, w0, #0x1
  64:	39403be0 	ldrb	w0, [sp, #14]
  68:	11000800 	add	w0, w0, #0x2
  6c:	1b007c20 	mul	w0, w1, w0
  70:	910043ff 	add	sp, sp, #0x10
  74:	d65f03c0 	ret

0000000000000078 <funcfloat>:
  78:	d10043ff 	sub	sp, sp, #0x10
  7c:	bd000fe0 	str	s0, [sp, #12]
  80:	bd000be1 	str	s1, [sp, #8]
  84:	bd0007e2 	str	s2, [sp, #4]
  88:	bd400fe0 	ldr	s0, [sp, #12]
  8c:	1e22c001 	fcvt	d1, s0
  90:	1e6e1000 	fmov	d0, #1.000000000000000000e+00
  94:	1e602821 	fadd	d1, d1, d0
  98:	bd400be0 	ldr	s0, [sp, #8]
  9c:	1e22c002 	fcvt	d2, s0
  a0:	1e601000 	fmov	d0, #2.000000000000000000e+00
  a4:	1e602840 	fadd	d0, d2, d0
  a8:	1e600821 	fmul	d1, d1, d0
  ac:	bd4007e0 	ldr	s0, [sp, #4]
  b0:	1e22c002 	fcvt	d2, s0
  b4:	1e611000 	fmov	d0, #3.000000000000000000e+00
  b8:	1e602840 	fadd	d0, d2, d0
  bc:	1e600820 	fmul	d0, d1, d0
  c0:	1e624000 	fcvt	s0, d0
  c4:	910043ff 	add	sp, sp, #0x10
  c8:	d65f03c0 	ret

00000000000000cc <funcfloatint>:
  cc:	d10043ff 	sub	sp, sp, #0x10
  d0:	b9000fe0 	str	w0, [sp, #12]
  d4:	bd000be0 	str	s0, [sp, #8]
  d8:	b90007e1 	str	w1, [sp, #4]
  dc:	bd0003e1 	str	s1, [sp]
  e0:	b9400fe0 	ldr	w0, [sp, #12]
  e4:	11000400 	add	w0, w0, #0x1
  e8:	1e620001 	scvtf	d1, w0
  ec:	bd400be0 	ldr	s0, [sp, #8]
  f0:	1e22c002 	fcvt	d2, s0
  f4:	1e601000 	fmov	d0, #2.000000000000000000e+00
  f8:	1e602840 	fadd	d0, d2, d0
  fc:	1e600821 	fmul	d1, d1, d0
 100:	b94007e0 	ldr	w0, [sp, #4]
 104:	11000c00 	add	w0, w0, #0x3
 108:	1e620000 	scvtf	d0, w0
 10c:	1e600821 	fmul	d1, d1, d0
 110:	bd4003e0 	ldr	s0, [sp]
 114:	1e22c002 	fcvt	d2, s0
 118:	1e621000 	fmov	d0, #4.000000000000000000e+00
 11c:	1e602840 	fadd	d0, d2, d0
 120:	1e600820 	fmul	d0, d1, d0
 124:	1e780000 	fcvtzs	w0, d0
 128:	910043ff 	add	sp, sp, #0x10
 12c:	d65f03c0 	ret

0000000000000130 <funcdouble>:
 130:	d10043ff 	sub	sp, sp, #0x10
 134:	fd0007e0 	str	d0, [sp, #8]
 138:	fd0003e1 	str	d1, [sp]
 13c:	fd4007e1 	ldr	d1, [sp, #8]
 140:	1e601000 	fmov	d0, #2.000000000000000000e+00
 144:	1e602821 	fadd	d1, d1, d0
 148:	fd4003e2 	ldr	d2, [sp]
 14c:	1e621000 	fmov	d0, #4.000000000000000000e+00
 150:	1e602840 	fadd	d0, d2, d0
 154:	1e600820 	fmul	d0, d1, d0
 158:	910043ff 	add	sp, sp, #0x10
 15c:	d65f03c0 	ret

0000000000000160 <funcstructvalue>:
 160:	f81e0ff3 	str	x19, [sp, #-32]!
 164:	aa0003f3 	mov	x19, x0
 168:	f9000fe1 	str	x1, [sp, #24]
 16c:	b9400261 	ldr	w1, [x19]
 170:	f9400fe0 	ldr	x0, [sp, #24]
 174:	b9400400 	ldr	w0, [x0, #4]
 178:	0b000020 	add	w0, w1, w0
 17c:	f84207f3 	ldr	x19, [sp], #32
 180:	d65f03c0 	ret

0000000000000184 <funcstructret>:
 184:	d100c3ff 	sub	sp, sp, #0x30
 188:	aa0803e2 	mov	x2, x8
 18c:	b9000fe0 	str	w0, [sp, #12]
 190:	b9000be1 	str	w1, [sp, #8]
 194:	a901ffff 	stp	xzr, xzr, [sp, #24]
 198:	f90017ff 	str	xzr, [sp, #40]
 19c:	b9400fe0 	ldr	w0, [sp, #12]
 1a0:	b9001be0 	str	w0, [sp, #24]
 1a4:	b9400be0 	ldr	w0, [sp, #8]
 1a8:	b9001fe0 	str	w0, [sp, #28]
 1ac:	aa0203e3 	mov	x3, x2
 1b0:	910063e2 	add	x2, sp, #0x18
 1b4:	a9400440 	ldp	x0, x1, [x2]
 1b8:	a9000460 	stp	x0, x1, [x3]
 1bc:	f9400840 	ldr	x0, [x2, #16]
 1c0:	f9000860 	str	x0, [x3, #16]
 1c4:	9100c3ff 	add	sp, sp, #0x30
 1c8:	d65f03c0 	ret

00000000000001cc <funcvarargs>:
 1cc:	d10403ff 	sub	sp, sp, #0x100
 1d0:	b9000fe0 	str	w0, [sp, #12]
 1d4:	f90067e1 	str	x1, [sp, #200]
 1d8:	f9006be2 	str	x2, [sp, #208]
 1dc:	f9006fe3 	str	x3, [sp, #216]
 1e0:	f90073e4 	str	x4, [sp, #224]
 1e4:	f90077e5 	str	x5, [sp, #232]
 1e8:	f9007be6 	str	x6, [sp, #240]
 1ec:	f9007fe7 	str	x7, [sp, #248]
 1f0:	3d8013e0 	str	q0, [sp, #64]
 1f4:	3d8017e1 	str	q1, [sp, #80]
 1f8:	3d801be2 	str	q2, [sp, #96]
 1fc:	3d801fe3 	str	q3, [sp, #112]
 200:	3d8023e4 	str	q4, [sp, #128]
 204:	3d8027e5 	str	q5, [sp, #144]
 208:	3d802be6 	str	q6, [sp, #160]
 20c:	3d802fe7 	str	q7, [sp, #176]
 210:	910403e0 	add	x0, sp, #0x100
 214:	f9000fe0 	str	x0, [sp, #24]
 218:	910403e0 	add	x0, sp, #0x100
 21c:	f90013e0 	str	x0, [sp, #32]
 220:	910303e0 	add	x0, sp, #0xc0
 224:	f90017e0 	str	x0, [sp, #40]
 228:	128006e0 	mov	w0, #0xffffffc8            	// #-56
 22c:	b90033e0 	str	w0, [sp, #48]
 230:	12800fe0 	mov	w0, #0xffffff80            	// #-128
 234:	b90037e0 	str	w0, [sp, #52]
 238:	b9003bff 	str	wzr, [sp, #56]
 23c:	b9003fff 	str	wzr, [sp, #60]
 240:	1400001c 	b	2b0 <funcvarargs+0xe4>
 244:	b94033e1 	ldr	w1, [sp, #48]
 248:	f9400fe0 	ldr	x0, [sp, #24]
 24c:	7100003f 	cmp	w1, #0x0
 250:	540000ab 	b.lt	264 <funcvarargs+0x98>  // b.tstop
 254:	91002c01 	add	x1, x0, #0xb
 258:	927df021 	and	x1, x1, #0xfffffffffffffff8
 25c:	f9000fe1 	str	x1, [sp, #24]
 260:	1400000d 	b	294 <funcvarargs+0xc8>
 264:	11002022 	add	w2, w1, #0x8
 268:	b90033e2 	str	w2, [sp, #48]
 26c:	b94033e2 	ldr	w2, [sp, #48]
 270:	7100005f 	cmp	w2, #0x0
 274:	540000ad 	b.le	288 <funcvarargs+0xbc>
 278:	91002c01 	add	x1, x0, #0xb
 27c:	927df021 	and	x1, x1, #0xfffffffffffffff8
 280:	f9000fe1 	str	x1, [sp, #24]
 284:	14000004 	b	294 <funcvarargs+0xc8>
 288:	f94013e2 	ldr	x2, [sp, #32]
 28c:	93407c20 	sxtw	x0, w1
 290:	8b000040 	add	x0, x2, x0
 294:	b9400000 	ldr	w0, [x0]
 298:	b9403be1 	ldr	w1, [sp, #56]
 29c:	0b000020 	add	w0, w1, w0
 2a0:	b9003be0 	str	w0, [sp, #56]
 2a4:	b9403fe0 	ldr	w0, [sp, #60]
 2a8:	11000400 	add	w0, w0, #0x1
 2ac:	b9003fe0 	str	w0, [sp, #60]
 2b0:	b9403fe1 	ldr	w1, [sp, #60]
 2b4:	b9400fe0 	ldr	w0, [sp, #12]
 2b8:	6b00003f 	cmp	w1, w0
 2bc:	54fffc4b 	b.lt	244 <funcvarargs+0x78>  // b.tstop
 2c0:	b9403be0 	ldr	w0, [sp, #56]
 2c4:	910403ff 	add	sp, sp, #0x100
 2c8:	d65f03c0 	ret
