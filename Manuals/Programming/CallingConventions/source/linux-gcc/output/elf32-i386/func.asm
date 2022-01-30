
func.o:     file format elf32-i386


Disassembly of section .text:

00000000 <funcintr>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	b8 2a 00 00 00       	mov    eax,0x2a
   8:	5d                   	pop    ebp
   9:	c3                   	ret    

0000000a <funcint64r>:
   a:	55                   	push   ebp
   b:	89 e5                	mov    ebp,esp
   d:	b8 00 00 00 00       	mov    eax,0x0
  12:	ba 42 00 00 00       	mov    edx,0x42
  17:	5d                   	pop    ebp
  18:	c3                   	ret    

00000019 <funcint64r2>:
  19:	55                   	push   ebp
  1a:	89 e5                	mov    ebp,esp
  1c:	b8 2a 00 00 00       	mov    eax,0x2a
  21:	ba 00 00 00 00       	mov    edx,0x0
  26:	5d                   	pop    ebp
  27:	c3                   	ret    

00000028 <funcint>:
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

00000045 <funcchar>:
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

0000006a <funcfloat>:
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

00000099 <funcfloatint>:
  99:	55                   	push   ebp
  9a:	89 e5                	mov    ebp,esp
  9c:	83 ec 08             	sub    esp,0x8
  9f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  a2:	83 c0 01             	add    eax,0x1
  a5:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  a8:	db 45 fc             	fild   DWORD PTR [ebp-0x4]
  ab:	d9 45 0c             	fld    DWORD PTR [ebp+0xc]
  ae:	dd 05 00 00 00 00    	fld    QWORD PTR ds:0x0
  b4:	de c1                	faddp  st(1),st
  b6:	de c9                	fmulp  st(1),st
  b8:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  bb:	83 c0 03             	add    eax,0x3
  be:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  c1:	db 45 fc             	fild   DWORD PTR [ebp-0x4]
  c4:	de c9                	fmulp  st(1),st
  c6:	d9 45 14             	fld    DWORD PTR [ebp+0x14]
  c9:	dd 05 10 00 00 00    	fld    QWORD PTR ds:0x10
  cf:	de c1                	faddp  st(1),st
  d1:	de c9                	fmulp  st(1),st
  d3:	d9 7d fa             	fnstcw WORD PTR [ebp-0x6]
  d6:	0f b7 45 fa          	movzx  eax,WORD PTR [ebp-0x6]
  da:	b4 0c                	mov    ah,0xc
  dc:	66 89 45 f8          	mov    WORD PTR [ebp-0x8],ax
  e0:	d9 6d f8             	fldcw  WORD PTR [ebp-0x8]
  e3:	db 5d fc             	fistp  DWORD PTR [ebp-0x4]
  e6:	d9 6d fa             	fldcw  WORD PTR [ebp-0x6]
  e9:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  ec:	c9                   	leave  
  ed:	c3                   	ret    

000000ee <funcdouble>:
  ee:	55                   	push   ebp
  ef:	89 e5                	mov    ebp,esp
  f1:	83 ec 10             	sub    esp,0x10
  f4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  f7:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  fa:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  fd:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 100:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 103:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 106:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 109:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10c:	dd 45 f8             	fld    QWORD PTR [ebp-0x8]
 10f:	dd 05 00 00 00 00    	fld    QWORD PTR ds:0x0
 115:	de c1                	faddp  st(1),st
 117:	dd 45 f0             	fld    QWORD PTR [ebp-0x10]
 11a:	dd 05 10 00 00 00    	fld    QWORD PTR ds:0x10
 120:	de c1                	faddp  st(1),st
 122:	de c9                	fmulp  st(1),st
 124:	c9                   	leave  
 125:	c3                   	ret    

00000126 <funcstructvalue>:
 126:	55                   	push   ebp
 127:	89 e5                	mov    ebp,esp
 129:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 12c:	8b 45 20             	mov    eax,DWORD PTR [ebp+0x20]
 12f:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 132:	01 d0                	add    eax,edx
 134:	5d                   	pop    ebp
 135:	c3                   	ret    

00000136 <funcstructret>:
 136:	55                   	push   ebp
 137:	89 e5                	mov    ebp,esp
 139:	53                   	push   ebx
 13a:	83 ec 20             	sub    esp,0x20
 13d:	8d 55 e4             	lea    edx,[ebp-0x1c]
 140:	b9 00 00 00 00       	mov    ecx,0x0
 145:	b8 18 00 00 00       	mov    eax,0x18
 14a:	89 c3                	mov    ebx,eax
 14c:	83 e3 fc             	and    ebx,0xfffffffc
 14f:	b8 00 00 00 00       	mov    eax,0x0
 154:	89 0c 02             	mov    DWORD PTR [edx+eax*1],ecx
 157:	83 c0 04             	add    eax,0x4
 15a:	39 d8                	cmp    eax,ebx
 15c:	72 f6                	jb     154 <funcstructret+0x1e>
 15e:	01 c2                	add    edx,eax
 160:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 163:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 166:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 169:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 16c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 16f:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 172:	89 10                	mov    DWORD PTR [eax],edx
 174:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
 177:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
 17a:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 17d:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
 180:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 183:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
 186:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 189:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
 18c:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
 18f:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
 192:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 195:	83 c4 20             	add    esp,0x20
 198:	5b                   	pop    ebx
 199:	5d                   	pop    ebp
 19a:	c2 04 00             	ret    0x4

0000019d <funcvarargs>:
 19d:	55                   	push   ebp
 19e:	89 e5                	mov    ebp,esp
 1a0:	83 ec 10             	sub    esp,0x10
 1a3:	8d 55 0c             	lea    edx,[ebp+0xc]
 1a6:	8d 45 f4             	lea    eax,[ebp-0xc]
 1a9:	89 10                	mov    DWORD PTR [eax],edx
 1ab:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1b2:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
 1b9:	eb 12                	jmp    1cd <funcvarargs+0x30>
 1bb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1be:	8d 50 04             	lea    edx,[eax+0x4]
 1c1:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 1c4:	8b 00                	mov    eax,DWORD PTR [eax]
 1c6:	01 45 fc             	add    DWORD PTR [ebp-0x4],eax
 1c9:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
 1cd:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1d0:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 1d3:	7c e6                	jl     1bb <funcvarargs+0x1e>
 1d5:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1d8:	c9                   	leave  
 1d9:	c3                   	ret    
