
functest.o:     file format elf32-i386


Disassembly of section .text:

00000000 <test_funcintr>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	83 ec 18             	sub    esp,0x18
   6:	e8 fc ff ff ff       	call   7 <test_funcintr+0x7>
   b:	83 c0 01             	add    eax,0x1
   e:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  11:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  14:	c9                   	leave  
  15:	c3                   	ret    

00000016 <test_funcint64r>:
  16:	55                   	push   ebp
  17:	89 e5                	mov    ebp,esp
  19:	83 ec 18             	sub    esp,0x18
  1c:	e8 fc ff ff ff       	call   1d <test_funcint64r+0x7>
  21:	83 c0 01             	add    eax,0x1
  24:	83 d2 00             	adc    edx,0x0
  27:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  2a:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
  2d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  30:	c9                   	leave  
  31:	c3                   	ret    

00000032 <test_funcint64r2>:
  32:	55                   	push   ebp
  33:	89 e5                	mov    ebp,esp
  35:	83 ec 18             	sub    esp,0x18
  38:	e8 fc ff ff ff       	call   39 <test_funcint64r2+0x7>
  3d:	83 c0 01             	add    eax,0x1
  40:	83 d2 00             	adc    edx,0x0
  43:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  46:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
  49:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  4c:	c9                   	leave  
  4d:	c3                   	ret    

0000004e <test_funcint>:
  4e:	55                   	push   ebp
  4f:	89 e5                	mov    ebp,esp
  51:	83 ec 28             	sub    esp,0x28
  54:	c7 44 24 08 03 00 00 	mov    DWORD PTR [esp+0x8],0x3
  5b:	00 
  5c:	c7 44 24 04 02 00 00 	mov    DWORD PTR [esp+0x4],0x2
  63:	00 
  64:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  6b:	e8 fc ff ff ff       	call   6c <test_funcint+0x1e>
  70:	83 c0 01             	add    eax,0x1
  73:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  76:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  79:	c9                   	leave  
  7a:	c3                   	ret    

0000007b <test_funcchar>:
  7b:	55                   	push   ebp
  7c:	89 e5                	mov    ebp,esp
  7e:	83 ec 28             	sub    esp,0x28
  81:	c7 44 24 04 02 00 00 	mov    DWORD PTR [esp+0x4],0x2
  88:	00 
  89:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  90:	e8 fc ff ff ff       	call   91 <test_funcchar+0x16>
  95:	83 c0 01             	add    eax,0x1
  98:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  9b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  9e:	c9                   	leave  
  9f:	c3                   	ret    

000000a0 <test_funcfloat>:
  a0:	55                   	push   ebp
  a1:	89 e5                	mov    ebp,esp
  a3:	83 ec 38             	sub    esp,0x38
  a6:	b8 00 00 40 40       	mov    eax,0x40400000
  ab:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  af:	b8 00 00 00 40       	mov    eax,0x40000000
  b4:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  b8:	b8 00 00 80 3f       	mov    eax,0x3f800000
  bd:	89 04 24             	mov    DWORD PTR [esp],eax
  c0:	e8 fc ff ff ff       	call   c1 <test_funcfloat+0x21>
  c5:	d9 05 00 00 00 00    	fld    DWORD PTR ds:0x0
  cb:	de c1                	faddp  st(1),st
  cd:	d9 5d f4             	fstp   DWORD PTR [ebp-0xc]
  d0:	d9 45 f4             	fld    DWORD PTR [ebp-0xc]
  d3:	d9 7d e6             	fnstcw WORD PTR [ebp-0x1a]
  d6:	0f b7 45 e6          	movzx  eax,WORD PTR [ebp-0x1a]
  da:	b4 0c                	mov    ah,0xc
  dc:	66 89 45 e4          	mov    WORD PTR [ebp-0x1c],ax
  e0:	d9 6d e4             	fldcw  WORD PTR [ebp-0x1c]
  e3:	db 5d e0             	fistp  DWORD PTR [ebp-0x20]
  e6:	d9 6d e6             	fldcw  WORD PTR [ebp-0x1a]
  e9:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  ec:	c9                   	leave  
  ed:	c3                   	ret    

000000ee <test_funcfloatint>:
  ee:	55                   	push   ebp
  ef:	89 e5                	mov    ebp,esp
  f1:	83 ec 28             	sub    esp,0x28
  f4:	b8 00 00 80 40       	mov    eax,0x40800000
  f9:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  fd:	c7 44 24 08 03 00 00 	mov    DWORD PTR [esp+0x8],0x3
 104:	00 
 105:	b8 00 00 00 40       	mov    eax,0x40000000
 10a:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 10e:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
 115:	e8 fc ff ff ff       	call   116 <test_funcfloatint+0x28>
 11a:	83 c0 01             	add    eax,0x1
 11d:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 120:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 123:	c9                   	leave  
 124:	c3                   	ret    

00000125 <test_funcdouble>:
 125:	55                   	push   ebp
 126:	89 e5                	mov    ebp,esp
 128:	83 ec 38             	sub    esp,0x38
 12b:	dd 05 08 00 00 00    	fld    QWORD PTR ds:0x8
 131:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 135:	dd 05 10 00 00 00    	fld    QWORD PTR ds:0x10
 13b:	dd 1c 24             	fstp   QWORD PTR [esp]
 13e:	e8 fc ff ff ff       	call   13f <test_funcdouble+0x1a>
 143:	d9 e8                	fld1   
 145:	de c1                	faddp  st(1),st
 147:	dd 5d f0             	fstp   QWORD PTR [ebp-0x10]
 14a:	dd 45 f0             	fld    QWORD PTR [ebp-0x10]
 14d:	d9 7d e6             	fnstcw WORD PTR [ebp-0x1a]
 150:	0f b7 45 e6          	movzx  eax,WORD PTR [ebp-0x1a]
 154:	b4 0c                	mov    ah,0xc
 156:	66 89 45 e4          	mov    WORD PTR [ebp-0x1c],ax
 15a:	d9 6d e4             	fldcw  WORD PTR [ebp-0x1c]
 15d:	db 5d e0             	fistp  DWORD PTR [ebp-0x20]
 160:	d9 6d e6             	fldcw  WORD PTR [ebp-0x1a]
 163:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 166:	c9                   	leave  
 167:	c3                   	ret    

00000168 <test_funcstructvalue>:
 168:	55                   	push   ebp
 169:	89 e5                	mov    ebp,esp
 16b:	53                   	push   ebx
 16c:	83 ec 64             	sub    esp,0x64
 16f:	c7 45 c4 01 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x1
 176:	c7 45 c8 02 00 00 00 	mov    DWORD PTR [ebp-0x38],0x2
 17d:	c7 45 cc 03 00 00 00 	mov    DWORD PTR [ebp-0x34],0x3
 184:	c7 45 d0 04 00 00 00 	mov    DWORD PTR [ebp-0x30],0x4
 18b:	c7 45 d4 05 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x5
 192:	c7 45 d8 06 00 00 00 	mov    DWORD PTR [ebp-0x28],0x6
 199:	8d 55 dc             	lea    edx,[ebp-0x24]
 19c:	b9 00 00 00 00       	mov    ecx,0x0
 1a1:	b8 18 00 00 00       	mov    eax,0x18
 1a6:	89 c3                	mov    ebx,eax
 1a8:	83 e3 fc             	and    ebx,0xfffffffc
 1ab:	b8 00 00 00 00       	mov    eax,0x0
 1b0:	89 0c 02             	mov    DWORD PTR [edx+eax*1],ecx
 1b3:	83 c0 04             	add    eax,0x4
 1b6:	39 d8                	cmp    eax,ebx
 1b8:	72 f6                	jb     1b0 <test_funcstructvalue+0x48>
 1ba:	01 c2                	add    edx,eax
 1bc:	8d 45 dc             	lea    eax,[ebp-0x24]
 1bf:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
 1c3:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1c6:	89 04 24             	mov    DWORD PTR [esp],eax
 1c9:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1cc:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 1d0:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 1d3:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
 1d7:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1da:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
 1de:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1e1:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
 1e5:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 1e8:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
 1ec:	e8 fc ff ff ff       	call   1ed <test_funcstructvalue+0x85>
 1f1:	83 c0 01             	add    eax,0x1
 1f4:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1f7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1fa:	83 c4 64             	add    esp,0x64
 1fd:	5b                   	pop    ebx
 1fe:	5d                   	pop    ebp
 1ff:	c3                   	ret    

00000200 <test_funcstructret>:
 200:	55                   	push   ebp
 201:	89 e5                	mov    ebp,esp
 203:	83 ec 38             	sub    esp,0x38
 206:	8d 45 e0             	lea    eax,[ebp-0x20]
 209:	c7 44 24 08 02 00 00 	mov    DWORD PTR [esp+0x8],0x2
 210:	00 
 211:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
 218:	00 
 219:	89 04 24             	mov    DWORD PTR [esp],eax
 21c:	e8 fc ff ff ff       	call   21d <test_funcstructret+0x1d>
 221:	83 ec 04             	sub    esp,0x4
 224:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 227:	c9                   	leave  
 228:	c3                   	ret    

00000229 <test_funcvarargs1>:
 229:	55                   	push   ebp
 22a:	89 e5                	mov    ebp,esp
 22c:	83 ec 28             	sub    esp,0x28
 22f:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
 236:	e8 fc ff ff ff       	call   237 <test_funcvarargs1+0xe>
 23b:	83 c0 01             	add    eax,0x1
 23e:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 241:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 244:	c9                   	leave  
 245:	c3                   	ret    

00000246 <test_funcvarargs4>:
 246:	55                   	push   ebp
 247:	89 e5                	mov    ebp,esp
 249:	83 ec 38             	sub    esp,0x38
 24c:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
 253:	00 
 254:	c7 44 24 0c 03 00 00 	mov    DWORD PTR [esp+0xc],0x3
 25b:	00 
 25c:	c7 44 24 08 02 00 00 	mov    DWORD PTR [esp+0x8],0x2
 263:	00 
 264:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
 26b:	00 
 26c:	c7 04 24 04 00 00 00 	mov    DWORD PTR [esp],0x4
 273:	e8 fc ff ff ff       	call   274 <test_funcvarargs4+0x2e>
 278:	83 c0 01             	add    eax,0x1
 27b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 27e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 281:	c9                   	leave  
 282:	c3                   	ret    

00000283 <test_funcvarargs6>:
 283:	55                   	push   ebp
 284:	89 e5                	mov    ebp,esp
 286:	83 ec 38             	sub    esp,0x38
 289:	c7 44 24 18 0c 00 00 	mov    DWORD PTR [esp+0x18],0xc
 290:	00 
 291:	c7 44 24 14 0a 00 00 	mov    DWORD PTR [esp+0x14],0xa
 298:	00 
 299:	c7 44 24 10 08 00 00 	mov    DWORD PTR [esp+0x10],0x8
 2a0:	00 
 2a1:	c7 44 24 0c 06 00 00 	mov    DWORD PTR [esp+0xc],0x6
 2a8:	00 
 2a9:	c7 44 24 08 04 00 00 	mov    DWORD PTR [esp+0x8],0x4
 2b0:	00 
 2b1:	c7 44 24 04 02 00 00 	mov    DWORD PTR [esp+0x4],0x2
 2b8:	00 
 2b9:	c7 04 24 06 00 00 00 	mov    DWORD PTR [esp],0x6
 2c0:	e8 fc ff ff ff       	call   2c1 <test_funcvarargs6+0x3e>
 2c5:	83 c0 01             	add    eax,0x1
 2c8:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 2cb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 2ce:	c9                   	leave  
 2cf:	c3                   	ret    

000002d0 <main>:
 2d0:	55                   	push   ebp
 2d1:	89 e5                	mov    ebp,esp
 2d3:	83 e4 f0             	and    esp,0xfffffff0
 2d6:	83 ec 10             	sub    esp,0x10
 2d9:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
 2e0:	00 
 2e1:	e8 fc ff ff ff       	call   2e2 <main+0x12>
 2e6:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 2ea:	e8 fc ff ff ff       	call   2eb <main+0x1b>
 2ef:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 2f3:	e8 fc ff ff ff       	call   2f4 <main+0x24>
 2f8:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 2fc:	e8 fc ff ff ff       	call   2fd <main+0x2d>
 301:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 305:	e8 fc ff ff ff       	call   306 <main+0x36>
 30a:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 30e:	e8 fc ff ff ff       	call   30f <main+0x3f>
 313:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 317:	e8 fc ff ff ff       	call   318 <main+0x48>
 31c:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 320:	e8 fc ff ff ff       	call   321 <main+0x51>
 325:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 329:	e8 fc ff ff ff       	call   32a <main+0x5a>
 32e:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 332:	e8 fc ff ff ff       	call   333 <main+0x63>
 337:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 33b:	e8 fc ff ff ff       	call   33c <main+0x6c>
 340:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 344:	e8 fc ff ff ff       	call   345 <main+0x75>
 349:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 34d:	e8 fc ff ff ff       	call   34e <main+0x7e>
 352:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
 356:	c9                   	leave  
 357:	c3                   	ret    
