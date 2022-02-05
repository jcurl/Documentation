
functest.o:     file format pe-i386


Disassembly of section .text:

00000000 <_test_funcintr>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	83 ec 18             	sub    esp,0x18
   6:	e8 00 00 00 00       	call   b <_test_funcintr+0xb>
   b:	83 c0 01             	add    eax,0x1
   e:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  11:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  14:	c9                   	leave  
  15:	c3                   	ret    

00000016 <_test_funcint64r>:
  16:	55                   	push   ebp
  17:	89 e5                	mov    ebp,esp
  19:	83 ec 18             	sub    esp,0x18
  1c:	e8 00 00 00 00       	call   21 <_test_funcint64r+0xb>
  21:	83 c0 01             	add    eax,0x1
  24:	83 d2 00             	adc    edx,0x0
  27:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  2a:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
  2d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  30:	c9                   	leave  
  31:	c3                   	ret    

00000032 <_test_funcint64r2>:
  32:	55                   	push   ebp
  33:	89 e5                	mov    ebp,esp
  35:	83 ec 18             	sub    esp,0x18
  38:	e8 00 00 00 00       	call   3d <_test_funcint64r2+0xb>
  3d:	83 c0 01             	add    eax,0x1
  40:	83 d2 00             	adc    edx,0x0
  43:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  46:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
  49:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  4c:	c9                   	leave  
  4d:	c3                   	ret    

0000004e <_test_funcint>:
  4e:	55                   	push   ebp
  4f:	89 e5                	mov    ebp,esp
  51:	83 ec 28             	sub    esp,0x28
  54:	c7 44 24 08 03 00 00 	mov    DWORD PTR [esp+0x8],0x3
  5b:	00 
  5c:	c7 44 24 04 02 00 00 	mov    DWORD PTR [esp+0x4],0x2
  63:	00 
  64:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  6b:	e8 00 00 00 00       	call   70 <_test_funcint+0x22>
  70:	83 c0 01             	add    eax,0x1
  73:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  76:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  79:	c9                   	leave  
  7a:	c3                   	ret    

0000007b <_test_funcchar>:
  7b:	55                   	push   ebp
  7c:	89 e5                	mov    ebp,esp
  7e:	83 ec 28             	sub    esp,0x28
  81:	c7 44 24 04 02 00 00 	mov    DWORD PTR [esp+0x4],0x2
  88:	00 
  89:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  90:	e8 00 00 00 00       	call   95 <_test_funcchar+0x1a>
  95:	83 c0 01             	add    eax,0x1
  98:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  9b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  9e:	c9                   	leave  
  9f:	c3                   	ret    

000000a0 <_test_funcfloat>:
  a0:	55                   	push   ebp
  a1:	89 e5                	mov    ebp,esp
  a3:	83 ec 38             	sub    esp,0x38
  a6:	d9 05 00 00 00 00    	fld    DWORD PTR ds:0x0
  ac:	d9 5c 24 08          	fstp   DWORD PTR [esp+0x8]
  b0:	d9 05 04 00 00 00    	fld    DWORD PTR ds:0x4
  b6:	d9 5c 24 04          	fstp   DWORD PTR [esp+0x4]
  ba:	d9 e8                	fld1   
  bc:	d9 1c 24             	fstp   DWORD PTR [esp]
  bf:	e8 00 00 00 00       	call   c4 <_test_funcfloat+0x24>
  c4:	dd 05 08 00 00 00    	fld    QWORD PTR ds:0x8
  ca:	de c1                	faddp  st(1),st
  cc:	d9 5d f4             	fstp   DWORD PTR [ebp-0xc]
  cf:	d9 45 f4             	fld    DWORD PTR [ebp-0xc]
  d2:	d9 7d e6             	fnstcw WORD PTR [ebp-0x1a]
  d5:	0f b7 45 e6          	movzx  eax,WORD PTR [ebp-0x1a]
  d9:	80 cc 0c             	or     ah,0xc
  dc:	66 89 45 e4          	mov    WORD PTR [ebp-0x1c],ax
  e0:	d9 6d e4             	fldcw  WORD PTR [ebp-0x1c]
  e3:	db 5d e0             	fistp  DWORD PTR [ebp-0x20]
  e6:	d9 6d e6             	fldcw  WORD PTR [ebp-0x1a]
  e9:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  ec:	c9                   	leave  
  ed:	c3                   	ret    

000000ee <_test_funcfloatint>:
  ee:	55                   	push   ebp
  ef:	89 e5                	mov    ebp,esp
  f1:	83 ec 28             	sub    esp,0x28
  f4:	d9 05 10 00 00 00    	fld    DWORD PTR ds:0x10
  fa:	d9 5c 24 0c          	fstp   DWORD PTR [esp+0xc]
  fe:	c7 44 24 08 03 00 00 	mov    DWORD PTR [esp+0x8],0x3
 105:	00 
 106:	d9 05 04 00 00 00    	fld    DWORD PTR ds:0x4
 10c:	d9 5c 24 04          	fstp   DWORD PTR [esp+0x4]
 110:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
 117:	e8 00 00 00 00       	call   11c <_test_funcfloatint+0x2e>
 11c:	83 c0 01             	add    eax,0x1
 11f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 122:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 125:	c9                   	leave  
 126:	c3                   	ret    

00000127 <_test_funcdouble>:
 127:	55                   	push   ebp
 128:	89 e5                	mov    ebp,esp
 12a:	83 ec 38             	sub    esp,0x38
 12d:	dd 05 08 00 00 00    	fld    QWORD PTR ds:0x8
 133:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 137:	dd 05 18 00 00 00    	fld    QWORD PTR ds:0x18
 13d:	dd 1c 24             	fstp   QWORD PTR [esp]
 140:	e8 00 00 00 00       	call   145 <_test_funcdouble+0x1e>
 145:	d9 e8                	fld1   
 147:	de c1                	faddp  st(1),st
 149:	dd 5d f0             	fstp   QWORD PTR [ebp-0x10]
 14c:	dd 45 f0             	fld    QWORD PTR [ebp-0x10]
 14f:	d9 7d e6             	fnstcw WORD PTR [ebp-0x1a]
 152:	0f b7 45 e6          	movzx  eax,WORD PTR [ebp-0x1a]
 156:	80 cc 0c             	or     ah,0xc
 159:	66 89 45 e4          	mov    WORD PTR [ebp-0x1c],ax
 15d:	d9 6d e4             	fldcw  WORD PTR [ebp-0x1c]
 160:	db 5d e0             	fistp  DWORD PTR [ebp-0x20]
 163:	d9 6d e6             	fldcw  WORD PTR [ebp-0x1a]
 166:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 169:	c9                   	leave  
 16a:	c3                   	ret    

0000016b <_test_funcstructvalue>:
 16b:	55                   	push   ebp
 16c:	89 e5                	mov    ebp,esp
 16e:	83 ec 68             	sub    esp,0x68
 171:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [ebp-0x24],0x1
 178:	c7 45 e0 02 00 00 00 	mov    DWORD PTR [ebp-0x20],0x2
 17f:	c7 45 e4 03 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x3
 186:	c7 45 e8 04 00 00 00 	mov    DWORD PTR [ebp-0x18],0x4
 18d:	c7 45 ec 05 00 00 00 	mov    DWORD PTR [ebp-0x14],0x5
 194:	c7 45 f0 06 00 00 00 	mov    DWORD PTR [ebp-0x10],0x6
 19b:	b9 00 00 00 00       	mov    ecx,0x0
 1a0:	b8 18 00 00 00       	mov    eax,0x18
 1a5:	83 e0 fc             	and    eax,0xfffffffc
 1a8:	89 c2                	mov    edx,eax
 1aa:	b8 00 00 00 00       	mov    eax,0x0
 1af:	89 4c 05 c4          	mov    DWORD PTR [ebp+eax*1-0x3c],ecx
 1b3:	83 c0 04             	add    eax,0x4
 1b6:	39 d0                	cmp    eax,edx
 1b8:	72 f5                	jb     1af <_test_funcstructvalue+0x44>
 1ba:	8d 45 c4             	lea    eax,[ebp-0x3c]
 1bd:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
 1c1:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1c4:	89 04 24             	mov    DWORD PTR [esp],eax
 1c7:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1ca:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 1ce:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1d1:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
 1d5:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1d8:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
 1dc:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1df:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
 1e3:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1e6:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
 1ea:	e8 00 00 00 00       	call   1ef <_test_funcstructvalue+0x84>
 1ef:	83 c0 01             	add    eax,0x1
 1f2:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1f5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1f8:	c9                   	leave  
 1f9:	c3                   	ret    

000001fa <_test_funcstructret>:
 1fa:	55                   	push   ebp
 1fb:	89 e5                	mov    ebp,esp
 1fd:	83 ec 38             	sub    esp,0x38
 200:	8d 45 e0             	lea    eax,[ebp-0x20]
 203:	c7 44 24 08 02 00 00 	mov    DWORD PTR [esp+0x8],0x2
 20a:	00 
 20b:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
 212:	00 
 213:	89 04 24             	mov    DWORD PTR [esp],eax
 216:	e8 00 00 00 00       	call   21b <_test_funcstructret+0x21>
 21b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 21e:	c9                   	leave  
 21f:	c3                   	ret    

00000220 <_test_funcvarargs1>:
 220:	55                   	push   ebp
 221:	89 e5                	mov    ebp,esp
 223:	83 ec 28             	sub    esp,0x28
 226:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
 22d:	e8 00 00 00 00       	call   232 <_test_funcvarargs1+0x12>
 232:	83 c0 01             	add    eax,0x1
 235:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 238:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 23b:	c9                   	leave  
 23c:	c3                   	ret    

0000023d <_test_funcvarargs4>:
 23d:	55                   	push   ebp
 23e:	89 e5                	mov    ebp,esp
 240:	83 ec 38             	sub    esp,0x38
 243:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
 24a:	00 
 24b:	c7 44 24 0c 03 00 00 	mov    DWORD PTR [esp+0xc],0x3
 252:	00 
 253:	c7 44 24 08 02 00 00 	mov    DWORD PTR [esp+0x8],0x2
 25a:	00 
 25b:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
 262:	00 
 263:	c7 04 24 04 00 00 00 	mov    DWORD PTR [esp],0x4
 26a:	e8 00 00 00 00       	call   26f <_test_funcvarargs4+0x32>
 26f:	83 c0 01             	add    eax,0x1
 272:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 275:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 278:	c9                   	leave  
 279:	c3                   	ret    

0000027a <_test_funcvarargs6>:
 27a:	55                   	push   ebp
 27b:	89 e5                	mov    ebp,esp
 27d:	83 ec 38             	sub    esp,0x38
 280:	c7 44 24 18 0c 00 00 	mov    DWORD PTR [esp+0x18],0xc
 287:	00 
 288:	c7 44 24 14 0a 00 00 	mov    DWORD PTR [esp+0x14],0xa
 28f:	00 
 290:	c7 44 24 10 08 00 00 	mov    DWORD PTR [esp+0x10],0x8
 297:	00 
 298:	c7 44 24 0c 06 00 00 	mov    DWORD PTR [esp+0xc],0x6
 29f:	00 
 2a0:	c7 44 24 08 04 00 00 	mov    DWORD PTR [esp+0x8],0x4
 2a7:	00 
 2a8:	c7 44 24 04 02 00 00 	mov    DWORD PTR [esp+0x4],0x2
 2af:	00 
 2b0:	c7 04 24 06 00 00 00 	mov    DWORD PTR [esp],0x6
 2b7:	e8 00 00 00 00       	call   2bc <_test_funcvarargs6+0x42>
 2bc:	83 c0 01             	add    eax,0x1
 2bf:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 2c2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 2c5:	c9                   	leave  
 2c6:	c3                   	ret    

000002c7 <_main>:
 2c7:	55                   	push   ebp
 2c8:	89 e5                	mov    ebp,esp
 2ca:	83 e4 f0             	and    esp,0xfffffff0
 2cd:	83 ec 10             	sub    esp,0x10
 2d0:	e8 00 00 00 00       	call   2d5 <_main+0xe>
 2d5:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
 2dc:	00 
 2dd:	e8 1e fd ff ff       	call   0 <_test_funcintr>
 2e2:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 2e6:	e8 2b fd ff ff       	call   16 <_test_funcint64r>
 2eb:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 2ef:	e8 3e fd ff ff       	call   32 <_test_funcint64r2>
 2f4:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 2f8:	e8 51 fd ff ff       	call   4e <_test_funcint>
 2fd:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 301:	e8 75 fd ff ff       	call   7b <_test_funcchar>
 306:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 30a:	e8 91 fd ff ff       	call   a0 <_test_funcfloat>
 30f:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 313:	e8 d6 fd ff ff       	call   ee <_test_funcfloatint>
 318:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 31c:	e8 06 fe ff ff       	call   127 <_test_funcdouble>
 321:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 325:	e8 41 fe ff ff       	call   16b <_test_funcstructvalue>
 32a:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 32e:	e8 c7 fe ff ff       	call   1fa <_test_funcstructret>
 333:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 337:	e8 e4 fe ff ff       	call   220 <_test_funcvarargs1>
 33c:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 340:	e8 f8 fe ff ff       	call   23d <_test_funcvarargs4>
 345:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 349:	e8 2c ff ff ff       	call   27a <_test_funcvarargs6>
 34e:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 352:	b8 00 00 00 00       	mov    eax,0x0
 357:	c9                   	leave  
 358:	c3                   	ret    
 359:	90                   	nop
 35a:	90                   	nop
 35b:	90                   	nop
