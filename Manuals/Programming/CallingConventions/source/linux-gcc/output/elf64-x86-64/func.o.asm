
func.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <funcintr>:
   0:	f3 0f 1e fa          	endbr64 
   4:	55                   	push   rbp
   5:	48 89 e5             	mov    rbp,rsp
   8:	b8 2a 00 00 00       	mov    eax,0x2a
   d:	5d                   	pop    rbp
   e:	c3                   	ret    

000000000000000f <funcint64r>:
   f:	f3 0f 1e fa          	endbr64 
  13:	55                   	push   rbp
  14:	48 89 e5             	mov    rbp,rsp
  17:	48 b8 00 00 00 00 42 	movabs rax,0x4200000000
  1e:	00 00 00 
  21:	5d                   	pop    rbp
  22:	c3                   	ret    

0000000000000023 <funcint64r2>:
  23:	f3 0f 1e fa          	endbr64 
  27:	55                   	push   rbp
  28:	48 89 e5             	mov    rbp,rsp
  2b:	b8 2a 00 00 00       	mov    eax,0x2a
  30:	5d                   	pop    rbp
  31:	c3                   	ret    

0000000000000032 <funcint>:
  32:	f3 0f 1e fa          	endbr64 
  36:	55                   	push   rbp
  37:	48 89 e5             	mov    rbp,rsp
  3a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  3d:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  40:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  43:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  46:	8d 50 01             	lea    edx,[rax+0x1]
  49:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  4c:	83 c0 02             	add    eax,0x2
  4f:	0f af c2             	imul   eax,edx
  52:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  55:	83 c2 03             	add    edx,0x3
  58:	0f af c2             	imul   eax,edx
  5b:	5d                   	pop    rbp
  5c:	c3                   	ret    

000000000000005d <funcchar>:
  5d:	f3 0f 1e fa          	endbr64 
  61:	55                   	push   rbp
  62:	48 89 e5             	mov    rbp,rsp
  65:	89 fa                	mov    edx,edi
  67:	89 f0                	mov    eax,esi
  69:	88 55 fc             	mov    BYTE PTR [rbp-0x4],dl
  6c:	88 45 f8             	mov    BYTE PTR [rbp-0x8],al
  6f:	0f be 45 fc          	movsx  eax,BYTE PTR [rbp-0x4]
  73:	8d 50 01             	lea    edx,[rax+0x1]
  76:	0f be 45 f8          	movsx  eax,BYTE PTR [rbp-0x8]
  7a:	83 c0 02             	add    eax,0x2
  7d:	0f af c2             	imul   eax,edx
  80:	5d                   	pop    rbp
  81:	c3                   	ret    

0000000000000082 <funcfloat>:
  82:	f3 0f 1e fa          	endbr64 
  86:	55                   	push   rbp
  87:	48 89 e5             	mov    rbp,rsp
  8a:	f3 0f 11 45 fc       	movss  DWORD PTR [rbp-0x4],xmm0
  8f:	f3 0f 11 4d f8       	movss  DWORD PTR [rbp-0x8],xmm1
  94:	f3 0f 11 55 f4       	movss  DWORD PTR [rbp-0xc],xmm2
  99:	f3 0f 5a 4d fc       	cvtss2sd xmm1,DWORD PTR [rbp-0x4]
  9e:	f2 0f 10 05 00 00 00 	movsd  xmm0,QWORD PTR [rip+0x0]        # a6 <funcfloat+0x24>
  a5:	00 
  a6:	f2 0f 58 c8          	addsd  xmm1,xmm0
  aa:	f3 0f 5a 55 f8       	cvtss2sd xmm2,DWORD PTR [rbp-0x8]
  af:	f2 0f 10 05 00 00 00 	movsd  xmm0,QWORD PTR [rip+0x0]        # b7 <funcfloat+0x35>
  b6:	00 
  b7:	f2 0f 58 c2          	addsd  xmm0,xmm2
  bb:	f2 0f 59 c8          	mulsd  xmm1,xmm0
  bf:	f3 0f 5a 55 f4       	cvtss2sd xmm2,DWORD PTR [rbp-0xc]
  c4:	f2 0f 10 05 00 00 00 	movsd  xmm0,QWORD PTR [rip+0x0]        # cc <funcfloat+0x4a>
  cb:	00 
  cc:	f2 0f 58 c2          	addsd  xmm0,xmm2
  d0:	f2 0f 59 c1          	mulsd  xmm0,xmm1
  d4:	f2 0f 5a c0          	cvtsd2ss xmm0,xmm0
  d8:	5d                   	pop    rbp
  d9:	c3                   	ret    

00000000000000da <funcfloatint>:
  da:	f3 0f 1e fa          	endbr64 
  de:	55                   	push   rbp
  df:	48 89 e5             	mov    rbp,rsp
  e2:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  e5:	f3 0f 11 45 f8       	movss  DWORD PTR [rbp-0x8],xmm0
  ea:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  ed:	f3 0f 11 4d f0       	movss  DWORD PTR [rbp-0x10],xmm1
  f2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  f5:	83 c0 01             	add    eax,0x1
  f8:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  fc:	f3 0f 5a 55 f8       	cvtss2sd xmm2,DWORD PTR [rbp-0x8]
 101:	f2 0f 10 05 00 00 00 	movsd  xmm0,QWORD PTR [rip+0x0]        # 109 <funcfloatint+0x2f>
 108:	00 
 109:	f2 0f 58 c2          	addsd  xmm0,xmm2
 10d:	f2 0f 59 c8          	mulsd  xmm1,xmm0
 111:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
 114:	83 c0 03             	add    eax,0x3
 117:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
 11b:	f2 0f 59 c8          	mulsd  xmm1,xmm0
 11f:	f3 0f 5a 55 f0       	cvtss2sd xmm2,DWORD PTR [rbp-0x10]
 124:	f2 0f 10 05 00 00 00 	movsd  xmm0,QWORD PTR [rip+0x0]        # 12c <funcfloatint+0x52>
 12b:	00 
 12c:	f2 0f 58 c2          	addsd  xmm0,xmm2
 130:	f2 0f 59 c1          	mulsd  xmm0,xmm1
 134:	f2 0f 2c c0          	cvttsd2si eax,xmm0
 138:	5d                   	pop    rbp
 139:	c3                   	ret    

000000000000013a <funcdouble>:
 13a:	f3 0f 1e fa          	endbr64 
 13e:	55                   	push   rbp
 13f:	48 89 e5             	mov    rbp,rsp
 142:	f2 0f 11 45 f8       	movsd  QWORD PTR [rbp-0x8],xmm0
 147:	f2 0f 11 4d f0       	movsd  QWORD PTR [rbp-0x10],xmm1
 14c:	f2 0f 10 4d f8       	movsd  xmm1,QWORD PTR [rbp-0x8]
 151:	f2 0f 10 05 00 00 00 	movsd  xmm0,QWORD PTR [rip+0x0]        # 159 <funcdouble+0x1f>
 158:	00 
 159:	f2 0f 58 c8          	addsd  xmm1,xmm0
 15d:	f2 0f 10 55 f0       	movsd  xmm2,QWORD PTR [rbp-0x10]
 162:	f2 0f 10 05 00 00 00 	movsd  xmm0,QWORD PTR [rip+0x0]        # 16a <funcdouble+0x30>
 169:	00 
 16a:	f2 0f 58 c2          	addsd  xmm0,xmm2
 16e:	f2 0f 59 c1          	mulsd  xmm0,xmm1
 172:	5d                   	pop    rbp
 173:	c3                   	ret    

0000000000000174 <funcstructvalue>:
 174:	f3 0f 1e fa          	endbr64 
 178:	55                   	push   rbp
 179:	48 89 e5             	mov    rbp,rsp
 17c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
 180:	8b 55 10             	mov    edx,DWORD PTR [rbp+0x10]
 183:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
 187:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
 18a:	01 d0                	add    eax,edx
 18c:	5d                   	pop    rbp
 18d:	c3                   	ret    

000000000000018e <funcstructret>:
 18e:	f3 0f 1e fa          	endbr64 
 192:	55                   	push   rbp
 193:	48 89 e5             	mov    rbp,rsp
 196:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
 19a:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
 19d:	89 55 d0             	mov    DWORD PTR [rbp-0x30],edx
 1a0:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
 1a7:	00 
 1a8:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
 1af:	00 
 1b0:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
 1b7:	00 
 1b8:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
 1bb:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
 1be:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
 1c1:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
 1c4:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
 1c8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
 1cc:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
 1d0:	48 89 01             	mov    QWORD PTR [rcx],rax
 1d3:	48 89 51 08          	mov    QWORD PTR [rcx+0x8],rdx
 1d7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
 1db:	48 89 41 10          	mov    QWORD PTR [rcx+0x10],rax
 1df:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
 1e3:	5d                   	pop    rbp
 1e4:	c3                   	ret    

00000000000001e5 <funcvarargs>:
 1e5:	f3 0f 1e fa          	endbr64 
 1e9:	55                   	push   rbp
 1ea:	48 89 e5             	mov    rbp,rsp
 1ed:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
 1f4:	89 bd 1c ff ff ff    	mov    DWORD PTR [rbp-0xe4],edi
 1fa:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
 201:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
 208:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
 20f:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
 216:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
 21d:	84 c0                	test   al,al
 21f:	74 20                	je     241 <funcvarargs+0x5c>
 221:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
 225:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
 229:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
 22d:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
 231:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
 235:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
 239:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
 23d:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
 241:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
 248:	00 00 
 24a:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
 251:	31 c0                	xor    eax,eax
 253:	c7 85 30 ff ff ff 08 	mov    DWORD PTR [rbp-0xd0],0x8
 25a:	00 00 00 
 25d:	c7 85 34 ff ff ff 30 	mov    DWORD PTR [rbp-0xcc],0x30
 264:	00 00 00 
 267:	48 8d 45 10          	lea    rax,[rbp+0x10]
 26b:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
 272:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
 279:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
 280:	c7 85 2c ff ff ff 00 	mov    DWORD PTR [rbp-0xd4],0x0
 287:	00 00 00 
 28a:	c7 85 28 ff ff ff 00 	mov    DWORD PTR [rbp-0xd8],0x0
 291:	00 00 00 
 294:	eb 4f                	jmp    2e5 <funcvarargs+0x100>
 296:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
 29c:	83 f8 2f             	cmp    eax,0x2f
 29f:	77 23                	ja     2c4 <funcvarargs+0xdf>
 2a1:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
 2a8:	8b 95 30 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd0]
 2ae:	89 d2                	mov    edx,edx
 2b0:	48 01 d0             	add    rax,rdx
 2b3:	8b 95 30 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd0]
 2b9:	83 c2 08             	add    edx,0x8
 2bc:	89 95 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],edx
 2c2:	eb 12                	jmp    2d6 <funcvarargs+0xf1>
 2c4:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
 2cb:	48 8d 50 08          	lea    rdx,[rax+0x8]
 2cf:	48 89 95 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rdx
 2d6:	8b 00                	mov    eax,DWORD PTR [rax]
 2d8:	01 85 2c ff ff ff    	add    DWORD PTR [rbp-0xd4],eax
 2de:	83 85 28 ff ff ff 01 	add    DWORD PTR [rbp-0xd8],0x1
 2e5:	8b 85 28 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd8]
 2eb:	3b 85 1c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xe4]
 2f1:	7c a3                	jl     296 <funcvarargs+0xb1>
 2f3:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
 2f9:	48 8b 8d 48 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb8]
 300:	64 48 33 0c 25 28 00 	xor    rcx,QWORD PTR fs:0x28
 307:	00 00 
 309:	74 05                	je     310 <funcvarargs+0x12b>
 30b:	e8 00 00 00 00       	call   310 <funcvarargs+0x12b>
 310:	c9                   	leave  
 311:	c3                   	ret    
