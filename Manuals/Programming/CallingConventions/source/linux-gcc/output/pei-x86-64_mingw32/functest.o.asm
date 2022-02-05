
functest.o:     file format pe-x86-64


Disassembly of section .text:

0000000000000000 <test_funcintr>:
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 83 ec 30          	sub    rsp,0x30
   8:	e8 00 00 00 00       	call   d <test_funcintr+0xd>
   d:	83 c0 01             	add    eax,0x1
  10:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  16:	48 83 c4 30          	add    rsp,0x30
  1a:	5d                   	pop    rbp
  1b:	c3                   	ret    

000000000000001c <test_funcint64r>:
  1c:	55                   	push   rbp
  1d:	48 89 e5             	mov    rbp,rsp
  20:	48 83 ec 30          	sub    rsp,0x30
  24:	e8 00 00 00 00       	call   29 <test_funcint64r+0xd>
  29:	48 83 c0 01          	add    rax,0x1
  2d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  31:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  35:	48 83 c4 30          	add    rsp,0x30
  39:	5d                   	pop    rbp
  3a:	c3                   	ret    

000000000000003b <test_funcint64r2>:
  3b:	55                   	push   rbp
  3c:	48 89 e5             	mov    rbp,rsp
  3f:	48 83 ec 30          	sub    rsp,0x30
  43:	e8 00 00 00 00       	call   48 <test_funcint64r2+0xd>
  48:	48 83 c0 01          	add    rax,0x1
  4c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  50:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  54:	48 83 c4 30          	add    rsp,0x30
  58:	5d                   	pop    rbp
  59:	c3                   	ret    

000000000000005a <test_funcint>:
  5a:	55                   	push   rbp
  5b:	48 89 e5             	mov    rbp,rsp
  5e:	48 83 ec 30          	sub    rsp,0x30
  62:	41 b8 03 00 00 00    	mov    r8d,0x3
  68:	ba 02 00 00 00       	mov    edx,0x2
  6d:	b9 01 00 00 00       	mov    ecx,0x1
  72:	e8 00 00 00 00       	call   77 <test_funcint+0x1d>
  77:	83 c0 01             	add    eax,0x1
  7a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  7d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80:	48 83 c4 30          	add    rsp,0x30
  84:	5d                   	pop    rbp
  85:	c3                   	ret    

0000000000000086 <test_funcchar>:
  86:	55                   	push   rbp
  87:	48 89 e5             	mov    rbp,rsp
  8a:	48 83 ec 30          	sub    rsp,0x30
  8e:	ba 02 00 00 00       	mov    edx,0x2
  93:	b9 01 00 00 00       	mov    ecx,0x1
  98:	e8 00 00 00 00       	call   9d <test_funcchar+0x17>
  9d:	83 c0 01             	add    eax,0x1
  a0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  a3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  a6:	48 83 c4 30          	add    rsp,0x30
  aa:	5d                   	pop    rbp
  ab:	c3                   	ret    

00000000000000ac <test_funcfloat>:
  ac:	55                   	push   rbp
  ad:	48 89 e5             	mov    rbp,rsp
  b0:	48 83 ec 30          	sub    rsp,0x30
  b4:	f3 0f 10 15 00 00 00 	movss  xmm2,DWORD PTR [rip+0x0]        # bc <test_funcfloat+0x10>
  bb:	00 
  bc:	f3 0f 10 0d 04 00 00 	movss  xmm1,DWORD PTR [rip+0x4]        # c8 <test_funcfloat+0x1c>
  c3:	00 
  c4:	8b 05 08 00 00 00    	mov    eax,DWORD PTR [rip+0x8]        # d2 <test_funcfloat+0x26>
  ca:	66 0f 6e c0          	movd   xmm0,eax
  ce:	e8 00 00 00 00       	call   d3 <test_funcfloat+0x27>
  d3:	66 0f ef c9          	pxor   xmm1,xmm1
  d7:	f3 0f 5a c8          	cvtss2sd xmm1,xmm0
  db:	f2 0f 10 05 10 00 00 	movsd  xmm0,QWORD PTR [rip+0x10]        # f3 <test_funcfloat+0x47>
  e2:	00 
  e3:	f2 0f 58 c1          	addsd  xmm0,xmm1
  e7:	f2 0f 5a c0          	cvtsd2ss xmm0,xmm0
  eb:	f3 0f 11 45 fc       	movss  DWORD PTR [rbp-0x4],xmm0
  f0:	f3 0f 10 45 fc       	movss  xmm0,DWORD PTR [rbp-0x4]
  f5:	f3 0f 2c c0          	cvttss2si eax,xmm0
  f9:	48 83 c4 30          	add    rsp,0x30
  fd:	5d                   	pop    rbp
  fe:	c3                   	ret    

00000000000000ff <test_funcfloatint>:
  ff:	55                   	push   rbp
 100:	48 89 e5             	mov    rbp,rsp
 103:	48 83 ec 30          	sub    rsp,0x30
 107:	f3 0f 10 1d 18 00 00 	movss  xmm3,DWORD PTR [rip+0x18]        # 127 <test_funcfloatint+0x28>
 10e:	00 
 10f:	41 b8 03 00 00 00    	mov    r8d,0x3
 115:	f3 0f 10 0d 04 00 00 	movss  xmm1,DWORD PTR [rip+0x4]        # 121 <test_funcfloatint+0x22>
 11c:	00 
 11d:	b9 01 00 00 00       	mov    ecx,0x1
 122:	e8 00 00 00 00       	call   127 <test_funcfloatint+0x28>
 127:	83 c0 01             	add    eax,0x1
 12a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
 12d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 130:	48 83 c4 30          	add    rsp,0x30
 134:	5d                   	pop    rbp
 135:	c3                   	ret    

0000000000000136 <test_funcdouble>:
 136:	55                   	push   rbp
 137:	48 89 e5             	mov    rbp,rsp
 13a:	48 83 ec 30          	sub    rsp,0x30
 13e:	f2 0f 10 05 10 00 00 	movsd  xmm0,QWORD PTR [rip+0x10]        # 156 <test_funcdouble+0x20>
 145:	00 
 146:	48 8b 05 20 00 00 00 	mov    rax,QWORD PTR [rip+0x20]        # 16d <test_funcdouble+0x37>
 14d:	66 0f 28 c8          	movapd xmm1,xmm0
 151:	66 48 0f 6e c0       	movq   xmm0,rax
 156:	e8 00 00 00 00       	call   15b <test_funcdouble+0x25>
 15b:	f2 0f 10 0d 28 00 00 	movsd  xmm1,QWORD PTR [rip+0x28]        # 18b <test_funcstructvalue+0x10>
 162:	00 
 163:	f2 0f 58 c1          	addsd  xmm0,xmm1
 167:	f2 0f 11 45 f8       	movsd  QWORD PTR [rbp-0x8],xmm0
 16c:	f2 0f 10 45 f8       	movsd  xmm0,QWORD PTR [rbp-0x8]
 171:	f2 0f 2c c0          	cvttsd2si eax,xmm0
 175:	48 83 c4 30          	add    rsp,0x30
 179:	5d                   	pop    rbp
 17a:	c3                   	ret    

000000000000017b <test_funcstructvalue>:
 17b:	55                   	push   rbp
 17c:	48 89 e5             	mov    rbp,rsp
 17f:	48 83 c4 80          	add    rsp,0xffffffffffffff80
 183:	c7 45 e0 01 00 00 00 	mov    DWORD PTR [rbp-0x20],0x1
 18a:	c7 45 e4 02 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x2
 191:	c7 45 e8 03 00 00 00 	mov    DWORD PTR [rbp-0x18],0x3
 198:	c7 45 ec 04 00 00 00 	mov    DWORD PTR [rbp-0x14],0x4
 19f:	c7 45 f0 05 00 00 00 	mov    DWORD PTR [rbp-0x10],0x5
 1a6:	c7 45 f4 06 00 00 00 	mov    DWORD PTR [rbp-0xc],0x6
 1ad:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
 1b4:	00 
 1b5:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
 1bc:	00 
 1bd:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
 1c4:	00 
 1c5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
 1c9:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
 1cd:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
 1d1:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
 1d5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
 1d9:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
 1dd:	48 8d 55 c0          	lea    rdx,[rbp-0x40]
 1e1:	48 8d 45 a0          	lea    rax,[rbp-0x60]
 1e5:	48 89 c1             	mov    rcx,rax
 1e8:	e8 00 00 00 00       	call   1ed <test_funcstructvalue+0x72>
 1ed:	83 c0 01             	add    eax,0x1
 1f0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
 1f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 1f6:	48 83 ec 80          	sub    rsp,0xffffffffffffff80
 1fa:	5d                   	pop    rbp
 1fb:	c3                   	ret    

00000000000001fc <test_funcstructret>:
 1fc:	55                   	push   rbp
 1fd:	48 89 e5             	mov    rbp,rsp
 200:	48 83 ec 40          	sub    rsp,0x40
 204:	48 8d 45 e0          	lea    rax,[rbp-0x20]
 208:	41 b8 02 00 00 00    	mov    r8d,0x2
 20e:	ba 01 00 00 00       	mov    edx,0x1
 213:	48 89 c1             	mov    rcx,rax
 216:	e8 00 00 00 00       	call   21b <test_funcstructret+0x1f>
 21b:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
 21e:	48 83 c4 40          	add    rsp,0x40
 222:	5d                   	pop    rbp
 223:	c3                   	ret    

0000000000000224 <test_funcvarargs1>:
 224:	55                   	push   rbp
 225:	48 89 e5             	mov    rbp,rsp
 228:	48 83 ec 30          	sub    rsp,0x30
 22c:	b9 01 00 00 00       	mov    ecx,0x1
 231:	e8 00 00 00 00       	call   236 <test_funcvarargs1+0x12>
 236:	83 c0 01             	add    eax,0x1
 239:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
 23c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 23f:	48 83 c4 30          	add    rsp,0x30
 243:	5d                   	pop    rbp
 244:	c3                   	ret    

0000000000000245 <test_funcvarargs4>:
 245:	55                   	push   rbp
 246:	48 89 e5             	mov    rbp,rsp
 249:	48 83 ec 40          	sub    rsp,0x40
 24d:	c7 44 24 20 04 00 00 	mov    DWORD PTR [rsp+0x20],0x4
 254:	00 
 255:	41 b9 03 00 00 00    	mov    r9d,0x3
 25b:	41 b8 02 00 00 00    	mov    r8d,0x2
 261:	ba 01 00 00 00       	mov    edx,0x1
 266:	b9 04 00 00 00       	mov    ecx,0x4
 26b:	e8 00 00 00 00       	call   270 <test_funcvarargs4+0x2b>
 270:	83 c0 01             	add    eax,0x1
 273:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
 276:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 279:	48 83 c4 40          	add    rsp,0x40
 27d:	5d                   	pop    rbp
 27e:	c3                   	ret    

000000000000027f <test_funcvarargs6>:
 27f:	55                   	push   rbp
 280:	48 89 e5             	mov    rbp,rsp
 283:	48 83 ec 50          	sub    rsp,0x50
 287:	c7 44 24 30 0c 00 00 	mov    DWORD PTR [rsp+0x30],0xc
 28e:	00 
 28f:	c7 44 24 28 0a 00 00 	mov    DWORD PTR [rsp+0x28],0xa
 296:	00 
 297:	c7 44 24 20 08 00 00 	mov    DWORD PTR [rsp+0x20],0x8
 29e:	00 
 29f:	41 b9 06 00 00 00    	mov    r9d,0x6
 2a5:	41 b8 04 00 00 00    	mov    r8d,0x4
 2ab:	ba 02 00 00 00       	mov    edx,0x2
 2b0:	b9 06 00 00 00       	mov    ecx,0x6
 2b5:	e8 00 00 00 00       	call   2ba <test_funcvarargs6+0x3b>
 2ba:	83 c0 01             	add    eax,0x1
 2bd:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
 2c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 2c3:	48 83 c4 50          	add    rsp,0x50
 2c7:	5d                   	pop    rbp
 2c8:	c3                   	ret    

00000000000002c9 <main>:
 2c9:	55                   	push   rbp
 2ca:	48 89 e5             	mov    rbp,rsp
 2cd:	48 83 ec 30          	sub    rsp,0x30
 2d1:	e8 00 00 00 00       	call   2d6 <main+0xd>
 2d6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
 2dd:	e8 1e fd ff ff       	call   0 <test_funcintr>
 2e2:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 2e5:	e8 32 fd ff ff       	call   1c <test_funcint64r>
 2ea:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 2ed:	e8 49 fd ff ff       	call   3b <test_funcint64r2>
 2f2:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 2f5:	e8 60 fd ff ff       	call   5a <test_funcint>
 2fa:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 2fd:	e8 84 fd ff ff       	call   86 <test_funcchar>
 302:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 305:	e8 a2 fd ff ff       	call   ac <test_funcfloat>
 30a:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 30d:	e8 ed fd ff ff       	call   ff <test_funcfloatint>
 312:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 315:	e8 1c fe ff ff       	call   136 <test_funcdouble>
 31a:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 31d:	e8 59 fe ff ff       	call   17b <test_funcstructvalue>
 322:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 325:	e8 d2 fe ff ff       	call   1fc <test_funcstructret>
 32a:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 32d:	e8 f2 fe ff ff       	call   224 <test_funcvarargs1>
 332:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 335:	e8 0b ff ff ff       	call   245 <test_funcvarargs4>
 33a:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 33d:	e8 3d ff ff ff       	call   27f <test_funcvarargs6>
 342:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 345:	b8 00 00 00 00       	mov    eax,0x0
 34a:	48 83 c4 30          	add    rsp,0x30
 34e:	5d                   	pop    rbp
 34f:	c3                   	ret    
