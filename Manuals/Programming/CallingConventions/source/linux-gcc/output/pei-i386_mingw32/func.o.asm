
func.o:     file format pe-i386


Disassembly of section .text:

00000000 <_funcintr>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	b8 2a 00 00 00       	mov    eax,0x2a
   8:	5d                   	pop    ebp
   9:	c3                   	ret    

0000000a <_funcint64r>:
   a:	55                   	push   ebp
   b:	89 e5                	mov    ebp,esp
   d:	b8 00 00 00 00       	mov    eax,0x0
  12:	ba 42 00 00 00       	mov    edx,0x42
  17:	5d                   	pop    ebp
  18:	c3                   	ret    

00000019 <_funcint64r2>:
  19:	55                   	push   ebp
  1a:	89 e5                	mov    ebp,esp
  1c:	b8 2a 00 00 00       	mov    eax,0x2a
  21:	ba 00 00 00 00       	mov    edx,0x0
  26:	5d                   	pop    ebp
  27:	c3                   	ret    

00000028 <_funcint>:
  28:	55                   	push   ebp
  29:	89 e5                	mov    ebp,esp
  2b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  2e:	8d 50 01             	lea    edx,[eax+0x1]
  31:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  34:	83 c0 02             	add    eax,0x2
  37:	0f af c2             	imul   eax,edx
  3a:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
  3d:	83 c2 03             	add    edx,0x3
  40:	0f af c2             	imul   eax,edx
  43:	5d                   	pop    ebp
  44:	c3                   	ret    

00000045 <_funcchar>:
  45:	55                   	push   ebp
  46:	89 e5                	mov    ebp,esp
  48:	83 ec 08             	sub    esp,0x8
  4b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  4e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  51:	88 55 fc             	mov    BYTE PTR [ebp-0x4],dl
  54:	88 45 f8             	mov    BYTE PTR [ebp-0x8],al
  57:	0f be 45 fc          	movsx  eax,BYTE PTR [ebp-0x4]
  5b:	8d 50 01             	lea    edx,[eax+0x1]
  5e:	0f be 45 f8          	movsx  eax,BYTE PTR [ebp-0x8]
  62:	83 c0 02             	add    eax,0x2
  65:	0f af c2             	imul   eax,edx
  68:	c9                   	leave  
  69:	c3                   	ret    

0000006a <_funcfloat>:
  6a:	55                   	push   ebp
  6b:	89 e5                	mov    ebp,esp
  6d:	83 ec 08             	sub    esp,0x8
  70:	d9 45 08             	fld    DWORD PTR [ebp+0x8]
  73:	d9 e8                	fld1   
  75:	de c1                	faddp  st(1),st
  77:	d9 45 0c             	fld    DWORD PTR [ebp+0xc]
  7a:	dd 05 00 00 00 00    	fld    QWORD PTR ds:0x0
  80:	de c1                	faddp  st(1),st
  82:	de c9                	fmulp  st(1),st
  84:	d9 45 10             	fld    DWORD PTR [ebp+0x10]
  87:	dd 05 08 00 00 00    	fld    QWORD PTR ds:0x8
  8d:	de c1                	faddp  st(1),st
  8f:	de c9                	fmulp  st(1),st
  91:	d9 5d fc             	fstp   DWORD PTR [ebp-0x4]
  94:	d9 45 fc             	fld    DWORD PTR [ebp-0x4]
  97:	c9                   	leave  
  98:	c3                   	ret    

00000099 <_funcfloatint>:
  99:	55                   	push   ebp
  9a:	89 e5                	mov    ebp,esp
  9c:	83 ec 08             	sub    esp,0x8
  9f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  a2:	83 c0 01             	add    eax,0x1
  a5:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  a8:	db 45 f8             	fild   DWORD PTR [ebp-0x8]
  ab:	d9 45 0c             	fld    DWORD PTR [ebp+0xc]
  ae:	dd 05 00 00 00 00    	fld    QWORD PTR ds:0x0
  b4:	de c1                	faddp  st(1),st
  b6:	de c9                	fmulp  st(1),st
  b8:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  bb:	83 c0 03             	add    eax,0x3
  be:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  c1:	db 45 f8             	fild   DWORD PTR [ebp-0x8]
  c4:	de c9                	fmulp  st(1),st
  c6:	d9 45 14             	fld    DWORD PTR [ebp+0x14]
  c9:	dd 05 10 00 00 00    	fld    QWORD PTR ds:0x10
  cf:	de c1                	faddp  st(1),st
  d1:	de c9                	fmulp  st(1),st
  d3:	d9 7d fe             	fnstcw WORD PTR [ebp-0x2]
  d6:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
  da:	80 cc 0c             	or     ah,0xc
  dd:	66 89 45 fc          	mov    WORD PTR [ebp-0x4],ax
  e1:	d9 6d fc             	fldcw  WORD PTR [ebp-0x4]
  e4:	db 5d f8             	fistp  DWORD PTR [ebp-0x8]
  e7:	d9 6d fe             	fldcw  WORD PTR [ebp-0x2]
  ea:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  ed:	c9                   	leave  
  ee:	c3                   	ret    

000000ef <_funcdouble>:
  ef:	55                   	push   ebp
  f0:	89 e5                	mov    ebp,esp
  f2:	83 ec 10             	sub    esp,0x10
  f5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  f8:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  fb:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  fe:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 101:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 104:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 107:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10d:	dd 45 f8             	fld    QWORD PTR [ebp-0x8]
 110:	dd 05 00 00 00 00    	fld    QWORD PTR ds:0x0
 116:	de c1                	faddp  st(1),st
 118:	dd 45 f0             	fld    QWORD PTR [ebp-0x10]
 11b:	dd 05 10 00 00 00    	fld    QWORD PTR ds:0x10
 121:	de c1                	faddp  st(1),st
 123:	de c9                	fmulp  st(1),st
 125:	c9                   	leave  
 126:	c3                   	ret    

00000127 <_funcstructvalue>:
 127:	55                   	push   ebp
 128:	89 e5                	mov    ebp,esp
 12a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 12d:	8b 45 20             	mov    eax,DWORD PTR [ebp+0x20]
 130:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 133:	01 d0                	add    eax,edx
 135:	5d                   	pop    ebp
 136:	c3                   	ret    

00000137 <_funcstructret>:
 137:	55                   	push   ebp
 138:	89 e5                	mov    ebp,esp
 13a:	83 ec 20             	sub    esp,0x20
 13d:	b9 00 00 00 00       	mov    ecx,0x0
 142:	b8 18 00 00 00       	mov    eax,0x18
 147:	83 e0 fc             	and    eax,0xfffffffc
 14a:	89 c2                	mov    edx,eax
 14c:	b8 00 00 00 00       	mov    eax,0x0
 151:	89 4c 05 e8          	mov    DWORD PTR [ebp+eax*1-0x18],ecx
 155:	83 c0 04             	add    eax,0x4
 158:	39 d0                	cmp    eax,edx
 15a:	72 f5                	jb     151 <_funcstructret+0x1a>
 15c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 15f:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 162:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 165:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 168:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 16b:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
 16e:	89 10                	mov    DWORD PTR [eax],edx
 170:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 173:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
 176:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 179:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
 17c:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 17f:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
 182:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
 185:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
 188:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 18b:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
 18e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 191:	c9                   	leave  
 192:	c3                   	ret    

00000193 <_funcvarargs>:
 193:	55                   	push   ebp
 194:	89 e5                	mov    ebp,esp
 196:	83 ec 10             	sub    esp,0x10
 199:	8d 45 0c             	lea    eax,[ebp+0xc]
 19c:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 19f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
 1a6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1ad:	eb 12                	jmp    1c1 <_funcvarargs+0x2e>
 1af:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1b2:	8d 50 04             	lea    edx,[eax+0x4]
 1b5:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 1b8:	8b 00                	mov    eax,DWORD PTR [eax]
 1ba:	01 45 f8             	add    DWORD PTR [ebp-0x8],eax
 1bd:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1c1:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1c4:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 1c7:	7c e6                	jl     1af <_funcvarargs+0x1c>
 1c9:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1cc:	c9                   	leave  
 1cd:	c3                   	ret    
 1ce:	90                   	nop
 1cf:	90                   	nop
