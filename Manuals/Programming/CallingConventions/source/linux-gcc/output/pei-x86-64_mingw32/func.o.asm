
func.o:     file format pe-x86-64


Disassembly of section .text:

0000000000000000 <funcintr>:
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	b8 2a 00 00 00       	mov    eax,0x2a
   9:	5d                   	pop    rbp
   a:	c3                   	ret    

000000000000000b <funcint64r>:
   b:	55                   	push   rbp
   c:	48 89 e5             	mov    rbp,rsp
   f:	48 b8 00 00 00 00 42 	movabs rax,0x4200000000
  16:	00 00 00 
  19:	5d                   	pop    rbp
  1a:	c3                   	ret    

000000000000001b <funcint64r2>:
  1b:	55                   	push   rbp
  1c:	48 89 e5             	mov    rbp,rsp
  1f:	b8 2a 00 00 00       	mov    eax,0x2a
  24:	5d                   	pop    rbp
  25:	c3                   	ret    

0000000000000026 <funcint>:
  26:	55                   	push   rbp
  27:	48 89 e5             	mov    rbp,rsp
  2a:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
  2d:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
  30:	44 89 45 20          	mov    DWORD PTR [rbp+0x20],r8d
  34:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  37:	8d 50 01             	lea    edx,[rax+0x1]
  3a:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
  3d:	83 c0 02             	add    eax,0x2
  40:	0f af c2             	imul   eax,edx
  43:	8b 55 20             	mov    edx,DWORD PTR [rbp+0x20]
  46:	83 c2 03             	add    edx,0x3
  49:	0f af c2             	imul   eax,edx
  4c:	5d                   	pop    rbp
  4d:	c3                   	ret    

000000000000004e <funcchar>:
  4e:	55                   	push   rbp
  4f:	48 89 e5             	mov    rbp,rsp
  52:	89 d0                	mov    eax,edx
  54:	89 ca                	mov    edx,ecx
  56:	88 55 10             	mov    BYTE PTR [rbp+0x10],dl
  59:	88 45 18             	mov    BYTE PTR [rbp+0x18],al
  5c:	0f be 45 10          	movsx  eax,BYTE PTR [rbp+0x10]
  60:	8d 50 01             	lea    edx,[rax+0x1]
  63:	0f be 45 18          	movsx  eax,BYTE PTR [rbp+0x18]
  67:	83 c0 02             	add    eax,0x2
  6a:	0f af c2             	imul   eax,edx
  6d:	5d                   	pop    rbp
  6e:	c3                   	ret    

000000000000006f <funcfloat>:
  6f:	55                   	push   rbp
  70:	48 89 e5             	mov    rbp,rsp
  73:	f3 0f 11 45 10       	movss  DWORD PTR [rbp+0x10],xmm0
  78:	f3 0f 11 4d 18       	movss  DWORD PTR [rbp+0x18],xmm1
  7d:	f3 0f 11 55 20       	movss  DWORD PTR [rbp+0x20],xmm2
  82:	66 0f ef c9          	pxor   xmm1,xmm1
  86:	f3 0f 5a 4d 10       	cvtss2sd xmm1,DWORD PTR [rbp+0x10]
  8b:	f2 0f 10 05 00 00 00 	movsd  xmm0,QWORD PTR [rip+0x0]        # 93 <funcfloat+0x24>
  92:	00 
  93:	f2 0f 58 c8          	addsd  xmm1,xmm0
  97:	66 0f ef d2          	pxor   xmm2,xmm2
  9b:	f3 0f 5a 55 18       	cvtss2sd xmm2,DWORD PTR [rbp+0x18]
  a0:	f2 0f 10 05 08 00 00 	movsd  xmm0,QWORD PTR [rip+0x8]        # b0 <funcfloat+0x41>
  a7:	00 
  a8:	f2 0f 58 c2          	addsd  xmm0,xmm2
  ac:	f2 0f 59 c8          	mulsd  xmm1,xmm0
  b0:	66 0f ef d2          	pxor   xmm2,xmm2
  b4:	f3 0f 5a 55 20       	cvtss2sd xmm2,DWORD PTR [rbp+0x20]
  b9:	f2 0f 10 05 10 00 00 	movsd  xmm0,QWORD PTR [rip+0x10]        # d1 <funcfloatint+0x2>
  c0:	00 
  c1:	f2 0f 58 c2          	addsd  xmm0,xmm2
  c5:	f2 0f 59 c1          	mulsd  xmm0,xmm1
  c9:	f2 0f 5a c0          	cvtsd2ss xmm0,xmm0
  cd:	5d                   	pop    rbp
  ce:	c3                   	ret    

00000000000000cf <funcfloatint>:
  cf:	55                   	push   rbp
  d0:	48 89 e5             	mov    rbp,rsp
  d3:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
  d6:	f3 0f 11 4d 18       	movss  DWORD PTR [rbp+0x18],xmm1
  db:	44 89 45 20          	mov    DWORD PTR [rbp+0x20],r8d
  df:	f3 0f 11 5d 28       	movss  DWORD PTR [rbp+0x28],xmm3
  e4:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  e7:	83 c0 01             	add    eax,0x1
  ea:	66 0f ef c9          	pxor   xmm1,xmm1
  ee:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  f2:	66 0f ef d2          	pxor   xmm2,xmm2
  f6:	f3 0f 5a 55 18       	cvtss2sd xmm2,DWORD PTR [rbp+0x18]
  fb:	f2 0f 10 05 08 00 00 	movsd  xmm0,QWORD PTR [rip+0x8]        # 10b <funcfloatint+0x3c>
 102:	00 
 103:	f2 0f 58 c2          	addsd  xmm0,xmm2
 107:	f2 0f 59 c8          	mulsd  xmm1,xmm0
 10b:	8b 45 20             	mov    eax,DWORD PTR [rbp+0x20]
 10e:	83 c0 03             	add    eax,0x3
 111:	66 0f ef c0          	pxor   xmm0,xmm0
 115:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
 119:	f2 0f 59 c8          	mulsd  xmm1,xmm0
 11d:	66 0f ef d2          	pxor   xmm2,xmm2
 121:	f3 0f 5a 55 28       	cvtss2sd xmm2,DWORD PTR [rbp+0x28]
 126:	f2 0f 10 05 18 00 00 	movsd  xmm0,QWORD PTR [rip+0x18]        # 146 <funcdouble+0xa>
 12d:	00 
 12e:	f2 0f 58 c2          	addsd  xmm0,xmm2
 132:	f2 0f 59 c1          	mulsd  xmm0,xmm1
 136:	f2 0f 2c c0          	cvttsd2si eax,xmm0
 13a:	5d                   	pop    rbp
 13b:	c3                   	ret    

000000000000013c <funcdouble>:
 13c:	55                   	push   rbp
 13d:	48 89 e5             	mov    rbp,rsp
 140:	f2 0f 11 45 10       	movsd  QWORD PTR [rbp+0x10],xmm0
 145:	f2 0f 11 4d 18       	movsd  QWORD PTR [rbp+0x18],xmm1
 14a:	f2 0f 10 4d 10       	movsd  xmm1,QWORD PTR [rbp+0x10]
 14f:	f2 0f 10 05 08 00 00 	movsd  xmm0,QWORD PTR [rip+0x8]        # 15f <funcdouble+0x23>
 156:	00 
 157:	f2 0f 58 c8          	addsd  xmm1,xmm0
 15b:	f2 0f 10 55 18       	movsd  xmm2,QWORD PTR [rbp+0x18]
 160:	f2 0f 10 05 18 00 00 	movsd  xmm0,QWORD PTR [rip+0x18]        # 180 <funcstructvalue+0x4>
 167:	00 
 168:	f2 0f 58 c2          	addsd  xmm0,xmm2
 16c:	f2 0f 59 c1          	mulsd  xmm0,xmm1
 170:	66 48 0f 7e c0       	movq   rax,xmm0
 175:	66 48 0f 6e c0       	movq   xmm0,rax
 17a:	5d                   	pop    rbp
 17b:	c3                   	ret    

000000000000017c <funcstructvalue>:
 17c:	55                   	push   rbp
 17d:	53                   	push   rbx
 17e:	48 8d 2c 24          	lea    rbp,[rsp]
 182:	48 89 cb             	mov    rbx,rcx
 185:	48 89 55 20          	mov    QWORD PTR [rbp+0x20],rdx
 189:	8b 13                	mov    edx,DWORD PTR [rbx]
 18b:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
 18f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
 192:	01 d0                	add    eax,edx
 194:	5b                   	pop    rbx
 195:	5d                   	pop    rbp
 196:	c3                   	ret    

0000000000000197 <funcstructret>:
 197:	55                   	push   rbp
 198:	48 89 e5             	mov    rbp,rsp
 19b:	48 83 ec 20          	sub    rsp,0x20
 19f:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
 1a3:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
 1a6:	44 89 45 20          	mov    DWORD PTR [rbp+0x20],r8d
 1aa:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
 1b1:	00 
 1b2:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
 1b9:	00 
 1ba:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
 1c1:	00 
 1c2:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
 1c5:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
 1c8:	8b 45 20             	mov    eax,DWORD PTR [rbp+0x20]
 1cb:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
 1ce:	48 8b 4d 10          	mov    rcx,QWORD PTR [rbp+0x10]
 1d2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
 1d6:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
 1da:	48 89 01             	mov    QWORD PTR [rcx],rax
 1dd:	48 89 51 08          	mov    QWORD PTR [rcx+0x8],rdx
 1e1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
 1e5:	48 89 41 10          	mov    QWORD PTR [rcx+0x10],rax
 1e9:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
 1ed:	48 83 c4 20          	add    rsp,0x20
 1f1:	5d                   	pop    rbp
 1f2:	c3                   	ret    

00000000000001f3 <funcvarargs>:
 1f3:	55                   	push   rbp
 1f4:	48 89 e5             	mov    rbp,rsp
 1f7:	48 83 ec 10          	sub    rsp,0x10
 1fb:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
 1fe:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
 202:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
 206:	4c 89 4d 28          	mov    QWORD PTR [rbp+0x28],r9
 20a:	48 8d 45 18          	lea    rax,[rbp+0x18]
 20e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
 212:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
 219:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
 220:	eb 15                	jmp    237 <funcvarargs+0x44>
 222:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
 226:	48 8d 50 08          	lea    rdx,[rax+0x8]
 22a:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
 22e:	8b 00                	mov    eax,DWORD PTR [rax]
 230:	01 45 f8             	add    DWORD PTR [rbp-0x8],eax
 233:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
 237:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 23a:	3b 45 10             	cmp    eax,DWORD PTR [rbp+0x10]
 23d:	7c e3                	jl     222 <funcvarargs+0x2f>
 23f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
 242:	48 83 c4 10          	add    rsp,0x10
 246:	5d                   	pop    rbp
 247:	c3                   	ret    
 248:	90                   	nop
 249:	90                   	nop
 24a:	90                   	nop
 24b:	90                   	nop
 24c:	90                   	nop
 24d:	90                   	nop
 24e:	90                   	nop
 24f:	90                   	nop
