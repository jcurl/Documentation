
func.o:     file format elf32-i386


Disassembly of section .text:

00000000 <funcintr>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	e8 fc ff ff ff       	call   4 <funcintr+0x4>
   8:	05 01 00 00 00       	add    eax,0x1
   d:	b8 2a 00 00 00       	mov    eax,0x2a
  12:	5d                   	pop    ebp
  13:	c3                   	ret    

00000014 <funcint64r>:
  14:	55                   	push   ebp
  15:	89 e5                	mov    ebp,esp
  17:	e8 fc ff ff ff       	call   18 <funcint64r+0x4>
  1c:	05 01 00 00 00       	add    eax,0x1
  21:	b8 00 00 00 00       	mov    eax,0x0
  26:	ba 42 00 00 00       	mov    edx,0x42
  2b:	5d                   	pop    ebp
  2c:	c3                   	ret    

0000002d <funcint64r2>:
  2d:	55                   	push   ebp
  2e:	89 e5                	mov    ebp,esp
  30:	e8 fc ff ff ff       	call   31 <funcint64r2+0x4>
  35:	05 01 00 00 00       	add    eax,0x1
  3a:	b8 2a 00 00 00       	mov    eax,0x2a
  3f:	ba 00 00 00 00       	mov    edx,0x0
  44:	5d                   	pop    ebp
  45:	c3                   	ret    

00000046 <funcint>:
  46:	55                   	push   ebp
  47:	89 e5                	mov    ebp,esp
  49:	e8 fc ff ff ff       	call   4a <funcint+0x4>
  4e:	05 01 00 00 00       	add    eax,0x1
  53:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  56:	8d 50 01             	lea    edx,[eax+0x1]
  59:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  5c:	83 c0 02             	add    eax,0x2
  5f:	0f af c2             	imul   eax,edx
  62:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
  65:	83 c2 03             	add    edx,0x3
  68:	0f af c2             	imul   eax,edx
  6b:	5d                   	pop    ebp
  6c:	c3                   	ret    

0000006d <funcchar>:
  6d:	55                   	push   ebp
  6e:	89 e5                	mov    ebp,esp
  70:	83 ec 08             	sub    esp,0x8
  73:	e8 fc ff ff ff       	call   74 <funcchar+0x7>
  78:	05 01 00 00 00       	add    eax,0x1
  7d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  80:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  83:	88 55 fc             	mov    BYTE PTR [ebp-0x4],dl
  86:	88 45 f8             	mov    BYTE PTR [ebp-0x8],al
  89:	0f be 45 fc          	movsx  eax,BYTE PTR [ebp-0x4]
  8d:	8d 50 01             	lea    edx,[eax+0x1]
  90:	0f be 45 f8          	movsx  eax,BYTE PTR [ebp-0x8]
  94:	83 c0 02             	add    eax,0x2
  97:	0f af c2             	imul   eax,edx
  9a:	c9                   	leave  
  9b:	c3                   	ret    

0000009c <funcfloat>:
  9c:	55                   	push   ebp
  9d:	89 e5                	mov    ebp,esp
  9f:	83 ec 08             	sub    esp,0x8
  a2:	e8 fc ff ff ff       	call   a3 <funcfloat+0x7>
  a7:	05 01 00 00 00       	add    eax,0x1
  ac:	d9 45 08             	fld    DWORD PTR [ebp+0x8]
  af:	d9 e8                	fld1   
  b1:	de c1                	faddp  st(1),st
  b3:	d9 45 0c             	fld    DWORD PTR [ebp+0xc]
  b6:	dd 80 00 00 00 00    	fld    QWORD PTR [eax+0x0]
  bc:	de c1                	faddp  st(1),st
  be:	de c9                	fmulp  st(1),st
  c0:	d9 45 10             	fld    DWORD PTR [ebp+0x10]
  c3:	dd 80 08 00 00 00    	fld    QWORD PTR [eax+0x8]
  c9:	de c1                	faddp  st(1),st
  cb:	de c9                	fmulp  st(1),st
  cd:	d9 5d fc             	fstp   DWORD PTR [ebp-0x4]
  d0:	d9 45 fc             	fld    DWORD PTR [ebp-0x4]
  d3:	c9                   	leave  
  d4:	c3                   	ret    

000000d5 <funcfloatint>:
  d5:	55                   	push   ebp
  d6:	89 e5                	mov    ebp,esp
  d8:	83 ec 10             	sub    esp,0x10
  db:	e8 fc ff ff ff       	call   dc <funcfloatint+0x7>
  e0:	05 01 00 00 00       	add    eax,0x1
  e5:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  e8:	83 c2 01             	add    edx,0x1
  eb:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
  ee:	db 45 f4             	fild   DWORD PTR [ebp-0xc]
  f1:	d9 45 0c             	fld    DWORD PTR [ebp+0xc]
  f4:	dd 80 00 00 00 00    	fld    QWORD PTR [eax+0x0]
  fa:	de c1                	faddp  st(1),st
  fc:	de c9                	fmulp  st(1),st
  fe:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
 101:	83 c2 03             	add    edx,0x3
 104:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 107:	db 45 f4             	fild   DWORD PTR [ebp-0xc]
 10a:	de c9                	fmulp  st(1),st
 10c:	d9 45 14             	fld    DWORD PTR [ebp+0x14]
 10f:	dd 80 10 00 00 00    	fld    QWORD PTR [eax+0x10]
 115:	de c1                	faddp  st(1),st
 117:	de c9                	fmulp  st(1),st
 119:	d9 7d fe             	fnstcw WORD PTR [ebp-0x2]
 11c:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
 120:	80 cc 0c             	or     ah,0xc
 123:	66 89 45 fc          	mov    WORD PTR [ebp-0x4],ax
 127:	d9 6d fc             	fldcw  WORD PTR [ebp-0x4]
 12a:	db 5d f8             	fistp  DWORD PTR [ebp-0x8]
 12d:	d9 6d fe             	fldcw  WORD PTR [ebp-0x2]
 130:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 133:	c9                   	leave  
 134:	c3                   	ret    

00000135 <funcdouble>:
 135:	55                   	push   ebp
 136:	89 e5                	mov    ebp,esp
 138:	83 ec 10             	sub    esp,0x10
 13b:	e8 fc ff ff ff       	call   13c <funcdouble+0x7>
 140:	05 01 00 00 00       	add    eax,0x1
 145:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 148:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
 14b:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 14e:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 151:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
 154:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
 157:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
 15a:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 15d:	dd 45 f8             	fld    QWORD PTR [ebp-0x8]
 160:	dd 80 00 00 00 00    	fld    QWORD PTR [eax+0x0]
 166:	de c1                	faddp  st(1),st
 168:	dd 45 f0             	fld    QWORD PTR [ebp-0x10]
 16b:	dd 80 10 00 00 00    	fld    QWORD PTR [eax+0x10]
 171:	de c1                	faddp  st(1),st
 173:	de c9                	fmulp  st(1),st
 175:	c9                   	leave  
 176:	c3                   	ret    

00000177 <funcstructvalue>:
 177:	55                   	push   ebp
 178:	89 e5                	mov    ebp,esp
 17a:	e8 fc ff ff ff       	call   17b <funcstructvalue+0x4>
 17f:	05 01 00 00 00       	add    eax,0x1
 184:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 187:	8b 45 20             	mov    eax,DWORD PTR [ebp+0x20]
 18a:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 18d:	01 d0                	add    eax,edx
 18f:	5d                   	pop    ebp
 190:	c3                   	ret    

00000191 <funcstructret>:
 191:	55                   	push   ebp
 192:	89 e5                	mov    ebp,esp
 194:	83 ec 20             	sub    esp,0x20
 197:	e8 fc ff ff ff       	call   198 <funcstructret+0x7>
 19c:	05 01 00 00 00       	add    eax,0x1
 1a1:	b9 00 00 00 00       	mov    ecx,0x0
 1a6:	b8 18 00 00 00       	mov    eax,0x18
 1ab:	83 e0 fc             	and    eax,0xfffffffc
 1ae:	89 c2                	mov    edx,eax
 1b0:	b8 00 00 00 00       	mov    eax,0x0
 1b5:	89 4c 05 e8          	mov    DWORD PTR [ebp+eax*1-0x18],ecx
 1b9:	83 c0 04             	add    eax,0x4
 1bc:	39 d0                	cmp    eax,edx
 1be:	72 f5                	jb     1b5 <funcstructret+0x24>
 1c0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1c3:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1c6:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1c9:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1cc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1cf:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
 1d2:	89 10                	mov    DWORD PTR [eax],edx
 1d4:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 1d7:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
 1da:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1dd:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
 1e0:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1e3:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
 1e6:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
 1e9:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
 1ec:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1ef:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
 1f2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1f5:	c9                   	leave  
 1f6:	c2 04 00             	ret    0x4

000001f9 <funcvarargs>:
 1f9:	55                   	push   ebp
 1fa:	89 e5                	mov    ebp,esp
 1fc:	83 ec 18             	sub    esp,0x18
 1ff:	e8 fc ff ff ff       	call   200 <funcvarargs+0x7>
 204:	05 01 00 00 00       	add    eax,0x1
 209:	65 a1 14 00 00 00    	mov    eax,gs:0x14
 20f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 212:	31 c0                	xor    eax,eax
 214:	8d 45 0c             	lea    eax,[ebp+0xc]
 217:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 21a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 221:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 228:	eb 12                	jmp    23c <funcvarargs+0x43>
 22a:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 22d:	8d 50 04             	lea    edx,[eax+0x4]
 230:	89 55 e8             	mov    DWORD PTR [ebp-0x18],edx
 233:	8b 00                	mov    eax,DWORD PTR [eax]
 235:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
 238:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 23c:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 23f:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 242:	7c e6                	jl     22a <funcvarargs+0x31>
 244:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 247:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 24a:	65 33 0d 14 00 00 00 	xor    ecx,DWORD PTR gs:0x14
 251:	74 05                	je     258 <funcvarargs+0x5f>
 253:	e8 fc ff ff ff       	call   254 <funcvarargs+0x5b>
 258:	c9                   	leave  
 259:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.ax:

00000000 <__x86.get_pc_thunk.ax>:
   0:	8b 04 24             	mov    eax,DWORD PTR [esp]
   3:	c3                   	ret    
