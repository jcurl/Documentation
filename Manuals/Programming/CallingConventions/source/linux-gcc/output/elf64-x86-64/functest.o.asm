
functest.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <test_funcintr>:
   0:	f3 0f 1e fa          	endbr64 
   4:	55                   	push   rbp
   5:	48 89 e5             	mov    rbp,rsp
   8:	48 83 ec 10          	sub    rsp,0x10
   c:	e8 00 00 00 00       	call   11 <test_funcintr+0x11>
  11:	83 c0 01             	add    eax,0x1
  14:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  17:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1a:	c9                   	leave  
  1b:	c3                   	ret    

000000000000001c <test_funcint64r>:
  1c:	f3 0f 1e fa          	endbr64 
  20:	55                   	push   rbp
  21:	48 89 e5             	mov    rbp,rsp
  24:	48 83 ec 10          	sub    rsp,0x10
  28:	e8 00 00 00 00       	call   2d <test_funcint64r+0x11>
  2d:	48 83 c0 01          	add    rax,0x1
  31:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  35:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  39:	c9                   	leave  
  3a:	c3                   	ret    

000000000000003b <test_funcint64r2>:
  3b:	f3 0f 1e fa          	endbr64 
  3f:	55                   	push   rbp
  40:	48 89 e5             	mov    rbp,rsp
  43:	48 83 ec 10          	sub    rsp,0x10
  47:	e8 00 00 00 00       	call   4c <test_funcint64r2+0x11>
  4c:	48 83 c0 01          	add    rax,0x1
  50:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  54:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  58:	c9                   	leave  
  59:	c3                   	ret    

000000000000005a <test_funcint>:
  5a:	f3 0f 1e fa          	endbr64 
  5e:	55                   	push   rbp
  5f:	48 89 e5             	mov    rbp,rsp
  62:	48 83 ec 10          	sub    rsp,0x10
  66:	ba 03 00 00 00       	mov    edx,0x3
  6b:	be 02 00 00 00       	mov    esi,0x2
  70:	bf 01 00 00 00       	mov    edi,0x1
  75:	e8 00 00 00 00       	call   7a <test_funcint+0x20>
  7a:	83 c0 01             	add    eax,0x1
  7d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  80:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  83:	c9                   	leave  
  84:	c3                   	ret    

0000000000000085 <test_funcchar>:
  85:	f3 0f 1e fa          	endbr64 
  89:	55                   	push   rbp
  8a:	48 89 e5             	mov    rbp,rsp
  8d:	48 83 ec 10          	sub    rsp,0x10
  91:	be 02 00 00 00       	mov    esi,0x2
  96:	bf 01 00 00 00       	mov    edi,0x1
  9b:	e8 00 00 00 00       	call   a0 <test_funcchar+0x1b>
  a0:	83 c0 01             	add    eax,0x1
  a3:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  a9:	c9                   	leave  
  aa:	c3                   	ret    

00000000000000ab <test_funcfloat>:
  ab:	f3 0f 1e fa          	endbr64 
  af:	55                   	push   rbp
  b0:	48 89 e5             	mov    rbp,rsp
  b3:	48 83 ec 10          	sub    rsp,0x10
  b7:	f3 0f 10 15 00 00 00 	movss  xmm2,DWORD PTR [rip+0x0]        # bf <test_funcfloat+0x14>
  be:	00 
  bf:	f3 0f 10 0d 00 00 00 	movss  xmm1,DWORD PTR [rip+0x0]        # c7 <test_funcfloat+0x1c>
  c6:	00 
  c7:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # cf <test_funcfloat+0x24>
  ce:	00 
  cf:	e8 00 00 00 00       	call   d4 <test_funcfloat+0x29>
  d4:	f3 0f 10 0d 00 00 00 	movss  xmm1,DWORD PTR [rip+0x0]        # dc <test_funcfloat+0x31>
  db:	00 
  dc:	f3 0f 58 c1          	addss  xmm0,xmm1
  e0:	f3 0f 11 45 fc       	movss  DWORD PTR [rbp-0x4],xmm0
  e5:	f3 0f 10 45 fc       	movss  xmm0,DWORD PTR [rbp-0x4]
  ea:	f3 0f 2c c0          	cvttss2si eax,xmm0
  ee:	c9                   	leave  
  ef:	c3                   	ret    

00000000000000f0 <test_funcfloatint>:
  f0:	f3 0f 1e fa          	endbr64 
  f4:	55                   	push   rbp
  f5:	48 89 e5             	mov    rbp,rsp
  f8:	48 83 ec 10          	sub    rsp,0x10
  fc:	f3 0f 10 0d 00 00 00 	movss  xmm1,DWORD PTR [rip+0x0]        # 104 <test_funcfloatint+0x14>
 103:	00 
 104:	be 03 00 00 00       	mov    esi,0x3
 109:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 111 <test_funcfloatint+0x21>
 110:	00 
 111:	bf 01 00 00 00       	mov    edi,0x1
 116:	e8 00 00 00 00       	call   11b <test_funcfloatint+0x2b>
 11b:	83 c0 01             	add    eax,0x1
 11e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
 121:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 124:	c9                   	leave  
 125:	c3                   	ret    

0000000000000126 <test_funcdouble>:
 126:	f3 0f 1e fa          	endbr64 
 12a:	55                   	push   rbp
 12b:	48 89 e5             	mov    rbp,rsp
 12e:	48 83 ec 10          	sub    rsp,0x10
 132:	f2 0f 10 05 00 00 00 	movsd  xmm0,QWORD PTR [rip+0x0]        # 13a <test_funcdouble+0x14>
 139:	00 
 13a:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 141 <test_funcdouble+0x1b>
 141:	66 0f 28 c8          	movapd xmm1,xmm0
 145:	66 48 0f 6e c0       	movq   xmm0,rax
 14a:	e8 00 00 00 00       	call   14f <test_funcdouble+0x29>
 14f:	f2 0f 10 0d 00 00 00 	movsd  xmm1,QWORD PTR [rip+0x0]        # 157 <test_funcdouble+0x31>
 156:	00 
 157:	f2 0f 58 c1          	addsd  xmm0,xmm1
 15b:	f2 0f 11 45 f8       	movsd  QWORD PTR [rbp-0x8],xmm0
 160:	f2 0f 10 45 f8       	movsd  xmm0,QWORD PTR [rbp-0x8]
 165:	f2 0f 2c c0          	cvttsd2si eax,xmm0
 169:	c9                   	leave  
 16a:	c3                   	ret    

000000000000016b <test_funcstructvalue>:
 16b:	f3 0f 1e fa          	endbr64 
 16f:	55                   	push   rbp
 170:	48 89 e5             	mov    rbp,rsp
 173:	48 83 ec 50          	sub    rsp,0x50
 177:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
 17e:	00 00 
 180:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
 184:	31 c0                	xor    eax,eax
 186:	c7 45 c0 01 00 00 00 	mov    DWORD PTR [rbp-0x40],0x1
 18d:	c7 45 c4 02 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x2
 194:	c7 45 c8 03 00 00 00 	mov    DWORD PTR [rbp-0x38],0x3
 19b:	c7 45 cc 04 00 00 00 	mov    DWORD PTR [rbp-0x34],0x4
 1a2:	c7 45 d0 05 00 00 00 	mov    DWORD PTR [rbp-0x30],0x5
 1a9:	c7 45 d4 06 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x6
 1b0:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
 1b7:	00 
 1b8:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
 1bf:	00 
 1c0:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
 1c7:	00 
 1c8:	48 8d 45 e0          	lea    rax,[rbp-0x20]
 1cc:	48 83 ec 08          	sub    rsp,0x8
 1d0:	ff 75 d0             	push   QWORD PTR [rbp-0x30]
 1d3:	ff 75 c8             	push   QWORD PTR [rbp-0x38]
 1d6:	ff 75 c0             	push   QWORD PTR [rbp-0x40]
 1d9:	48 89 c7             	mov    rdi,rax
 1dc:	e8 00 00 00 00       	call   1e1 <test_funcstructvalue+0x76>
 1e1:	48 83 c4 20          	add    rsp,0x20
 1e5:	83 c0 01             	add    eax,0x1
 1e8:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
 1eb:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
 1ee:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
 1f2:	64 48 33 14 25 28 00 	xor    rdx,QWORD PTR fs:0x28
 1f9:	00 00 
 1fb:	74 05                	je     202 <test_funcstructvalue+0x97>
 1fd:	e8 00 00 00 00       	call   202 <test_funcstructvalue+0x97>
 202:	c9                   	leave  
 203:	c3                   	ret    

0000000000000204 <test_funcstructret>:
 204:	f3 0f 1e fa          	endbr64 
 208:	55                   	push   rbp
 209:	48 89 e5             	mov    rbp,rsp
 20c:	48 83 ec 20          	sub    rsp,0x20
 210:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
 217:	00 00 
 219:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
 21d:	31 c0                	xor    eax,eax
 21f:	48 8d 45 e0          	lea    rax,[rbp-0x20]
 223:	ba 02 00 00 00       	mov    edx,0x2
 228:	be 01 00 00 00       	mov    esi,0x1
 22d:	48 89 c7             	mov    rdi,rax
 230:	e8 00 00 00 00       	call   235 <test_funcstructret+0x31>
 235:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
 238:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
 23c:	64 48 33 0c 25 28 00 	xor    rcx,QWORD PTR fs:0x28
 243:	00 00 
 245:	74 05                	je     24c <test_funcstructret+0x48>
 247:	e8 00 00 00 00       	call   24c <test_funcstructret+0x48>
 24c:	c9                   	leave  
 24d:	c3                   	ret    

000000000000024e <test_funcvarargs1>:
 24e:	f3 0f 1e fa          	endbr64 
 252:	55                   	push   rbp
 253:	48 89 e5             	mov    rbp,rsp
 256:	48 83 ec 10          	sub    rsp,0x10
 25a:	bf 01 00 00 00       	mov    edi,0x1
 25f:	b8 00 00 00 00       	mov    eax,0x0
 264:	e8 00 00 00 00       	call   269 <test_funcvarargs1+0x1b>
 269:	83 c0 01             	add    eax,0x1
 26c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
 26f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 272:	c9                   	leave  
 273:	c3                   	ret    

0000000000000274 <test_funcvarargs4>:
 274:	f3 0f 1e fa          	endbr64 
 278:	55                   	push   rbp
 279:	48 89 e5             	mov    rbp,rsp
 27c:	48 83 ec 10          	sub    rsp,0x10
 280:	41 b8 04 00 00 00    	mov    r8d,0x4
 286:	b9 03 00 00 00       	mov    ecx,0x3
 28b:	ba 02 00 00 00       	mov    edx,0x2
 290:	be 01 00 00 00       	mov    esi,0x1
 295:	bf 04 00 00 00       	mov    edi,0x4
 29a:	b8 00 00 00 00       	mov    eax,0x0
 29f:	e8 00 00 00 00       	call   2a4 <test_funcvarargs4+0x30>
 2a4:	83 c0 01             	add    eax,0x1
 2a7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
 2aa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 2ad:	c9                   	leave  
 2ae:	c3                   	ret    

00000000000002af <test_funcvarargs6>:
 2af:	f3 0f 1e fa          	endbr64 
 2b3:	55                   	push   rbp
 2b4:	48 89 e5             	mov    rbp,rsp
 2b7:	48 83 ec 10          	sub    rsp,0x10
 2bb:	48 83 ec 08          	sub    rsp,0x8
 2bf:	6a 0c                	push   0xc
 2c1:	41 b9 0a 00 00 00    	mov    r9d,0xa
 2c7:	41 b8 08 00 00 00    	mov    r8d,0x8
 2cd:	b9 06 00 00 00       	mov    ecx,0x6
 2d2:	ba 04 00 00 00       	mov    edx,0x4
 2d7:	be 02 00 00 00       	mov    esi,0x2
 2dc:	bf 06 00 00 00       	mov    edi,0x6
 2e1:	b8 00 00 00 00       	mov    eax,0x0
 2e6:	e8 00 00 00 00       	call   2eb <test_funcvarargs6+0x3c>
 2eb:	48 83 c4 10          	add    rsp,0x10
 2ef:	83 c0 01             	add    eax,0x1
 2f2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
 2f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 2f8:	c9                   	leave  
 2f9:	c3                   	ret    

00000000000002fa <main>:
 2fa:	f3 0f 1e fa          	endbr64 
 2fe:	55                   	push   rbp
 2ff:	48 89 e5             	mov    rbp,rsp
 302:	48 83 ec 10          	sub    rsp,0x10
 306:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
 30d:	e8 00 00 00 00       	call   312 <main+0x18>
 312:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 315:	e8 00 00 00 00       	call   31a <main+0x20>
 31a:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 31d:	e8 00 00 00 00       	call   322 <main+0x28>
 322:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 325:	e8 00 00 00 00       	call   32a <main+0x30>
 32a:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 32d:	e8 00 00 00 00       	call   332 <main+0x38>
 332:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 335:	e8 00 00 00 00       	call   33a <main+0x40>
 33a:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 33d:	e8 00 00 00 00       	call   342 <main+0x48>
 342:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 345:	e8 00 00 00 00       	call   34a <main+0x50>
 34a:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 34d:	e8 00 00 00 00       	call   352 <main+0x58>
 352:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 355:	e8 00 00 00 00       	call   35a <main+0x60>
 35a:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 35d:	e8 00 00 00 00       	call   362 <main+0x68>
 362:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 365:	e8 00 00 00 00       	call   36a <main+0x70>
 36a:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 36d:	e8 00 00 00 00       	call   372 <main+0x78>
 372:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
 375:	b8 00 00 00 00       	mov    eax,0x0
 37a:	c9                   	leave  
 37b:	c3                   	ret    
