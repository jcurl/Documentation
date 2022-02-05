
functest.o:     file format elf32-i386


Disassembly of section .text:

00000000 <test_funcintr>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	53                   	push   ebx
   4:	83 ec 14             	sub    esp,0x14
   7:	e8 fc ff ff ff       	call   8 <test_funcintr+0x8>
   c:	05 01 00 00 00       	add    eax,0x1
  11:	89 c3                	mov    ebx,eax
  13:	e8 fc ff ff ff       	call   14 <test_funcintr+0x14>
  18:	83 c0 01             	add    eax,0x1
  1b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  1e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  21:	83 c4 14             	add    esp,0x14
  24:	5b                   	pop    ebx
  25:	5d                   	pop    ebp
  26:	c3                   	ret    

00000027 <test_funcint64r>:
  27:	55                   	push   ebp
  28:	89 e5                	mov    ebp,esp
  2a:	53                   	push   ebx
  2b:	83 ec 14             	sub    esp,0x14
  2e:	e8 fc ff ff ff       	call   2f <test_funcint64r+0x8>
  33:	05 01 00 00 00       	add    eax,0x1
  38:	89 c3                	mov    ebx,eax
  3a:	e8 fc ff ff ff       	call   3b <test_funcint64r+0x14>
  3f:	83 c0 01             	add    eax,0x1
  42:	83 d2 00             	adc    edx,0x0
  45:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  48:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
  4b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  4e:	83 c4 14             	add    esp,0x14
  51:	5b                   	pop    ebx
  52:	5d                   	pop    ebp
  53:	c3                   	ret    

00000054 <test_funcint64r2>:
  54:	55                   	push   ebp
  55:	89 e5                	mov    ebp,esp
  57:	53                   	push   ebx
  58:	83 ec 14             	sub    esp,0x14
  5b:	e8 fc ff ff ff       	call   5c <test_funcint64r2+0x8>
  60:	05 01 00 00 00       	add    eax,0x1
  65:	89 c3                	mov    ebx,eax
  67:	e8 fc ff ff ff       	call   68 <test_funcint64r2+0x14>
  6c:	83 c0 01             	add    eax,0x1
  6f:	83 d2 00             	adc    edx,0x0
  72:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  75:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
  78:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  7b:	83 c4 14             	add    esp,0x14
  7e:	5b                   	pop    ebx
  7f:	5d                   	pop    ebp
  80:	c3                   	ret    

00000081 <test_funcint>:
  81:	55                   	push   ebp
  82:	89 e5                	mov    ebp,esp
  84:	53                   	push   ebx
  85:	83 ec 14             	sub    esp,0x14
  88:	e8 fc ff ff ff       	call   89 <test_funcint+0x8>
  8d:	05 01 00 00 00       	add    eax,0x1
  92:	83 ec 04             	sub    esp,0x4
  95:	6a 03                	push   0x3
  97:	6a 02                	push   0x2
  99:	6a 01                	push   0x1
  9b:	89 c3                	mov    ebx,eax
  9d:	e8 fc ff ff ff       	call   9e <test_funcint+0x1d>
  a2:	83 c4 10             	add    esp,0x10
  a5:	83 c0 01             	add    eax,0x1
  a8:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  ab:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  ae:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  b1:	c9                   	leave  
  b2:	c3                   	ret    

000000b3 <test_funcchar>:
  b3:	55                   	push   ebp
  b4:	89 e5                	mov    ebp,esp
  b6:	53                   	push   ebx
  b7:	83 ec 14             	sub    esp,0x14
  ba:	e8 fc ff ff ff       	call   bb <test_funcchar+0x8>
  bf:	05 01 00 00 00       	add    eax,0x1
  c4:	83 ec 08             	sub    esp,0x8
  c7:	6a 02                	push   0x2
  c9:	6a 01                	push   0x1
  cb:	89 c3                	mov    ebx,eax
  cd:	e8 fc ff ff ff       	call   ce <test_funcchar+0x1b>
  d2:	83 c4 10             	add    esp,0x10
  d5:	83 c0 01             	add    eax,0x1
  d8:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  db:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  de:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  e1:	c9                   	leave  
  e2:	c3                   	ret    

000000e3 <test_funcfloat>:
  e3:	55                   	push   ebp
  e4:	89 e5                	mov    ebp,esp
  e6:	53                   	push   ebx
  e7:	83 ec 24             	sub    esp,0x24
  ea:	e8 fc ff ff ff       	call   eb <test_funcfloat+0x8>
  ef:	81 c3 02 00 00 00    	add    ebx,0x2
  f5:	83 ec 04             	sub    esp,0x4
  f8:	d9 83 00 00 00 00    	fld    DWORD PTR [ebx+0x0]
  fe:	8d 64 24 fc          	lea    esp,[esp-0x4]
 102:	d9 1c 24             	fstp   DWORD PTR [esp]
 105:	d9 83 04 00 00 00    	fld    DWORD PTR [ebx+0x4]
 10b:	8d 64 24 fc          	lea    esp,[esp-0x4]
 10f:	d9 1c 24             	fstp   DWORD PTR [esp]
 112:	d9 e8                	fld1   
 114:	8d 64 24 fc          	lea    esp,[esp-0x4]
 118:	d9 1c 24             	fstp   DWORD PTR [esp]
 11b:	e8 fc ff ff ff       	call   11c <test_funcfloat+0x39>
 120:	83 c4 10             	add    esp,0x10
 123:	d9 83 08 00 00 00    	fld    DWORD PTR [ebx+0x8]
 129:	de c1                	faddp  st(1),st
 12b:	d9 5d f4             	fstp   DWORD PTR [ebp-0xc]
 12e:	d9 45 f4             	fld    DWORD PTR [ebp-0xc]
 131:	d9 7d e6             	fnstcw WORD PTR [ebp-0x1a]
 134:	0f b7 45 e6          	movzx  eax,WORD PTR [ebp-0x1a]
 138:	80 cc 0c             	or     ah,0xc
 13b:	66 89 45 e4          	mov    WORD PTR [ebp-0x1c],ax
 13f:	d9 6d e4             	fldcw  WORD PTR [ebp-0x1c]
 142:	db 5d e0             	fistp  DWORD PTR [ebp-0x20]
 145:	d9 6d e6             	fldcw  WORD PTR [ebp-0x1a]
 148:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 14b:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 14e:	c9                   	leave  
 14f:	c3                   	ret    

00000150 <test_funcfloatint>:
 150:	55                   	push   ebp
 151:	89 e5                	mov    ebp,esp
 153:	53                   	push   ebx
 154:	83 ec 14             	sub    esp,0x14
 157:	e8 fc ff ff ff       	call   158 <test_funcfloatint+0x8>
 15c:	05 01 00 00 00       	add    eax,0x1
 161:	d9 80 08 00 00 00    	fld    DWORD PTR [eax+0x8]
 167:	8d 64 24 fc          	lea    esp,[esp-0x4]
 16b:	d9 1c 24             	fstp   DWORD PTR [esp]
 16e:	6a 03                	push   0x3
 170:	d9 80 04 00 00 00    	fld    DWORD PTR [eax+0x4]
 176:	8d 64 24 fc          	lea    esp,[esp-0x4]
 17a:	d9 1c 24             	fstp   DWORD PTR [esp]
 17d:	6a 01                	push   0x1
 17f:	89 c3                	mov    ebx,eax
 181:	e8 fc ff ff ff       	call   182 <test_funcfloatint+0x32>
 186:	83 c4 10             	add    esp,0x10
 189:	83 c0 01             	add    eax,0x1
 18c:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 18f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 192:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 195:	c9                   	leave  
 196:	c3                   	ret    

00000197 <test_funcdouble>:
 197:	55                   	push   ebp
 198:	89 e5                	mov    ebp,esp
 19a:	53                   	push   ebx
 19b:	83 ec 24             	sub    esp,0x24
 19e:	e8 fc ff ff ff       	call   19f <test_funcdouble+0x8>
 1a3:	81 c3 02 00 00 00    	add    ebx,0x2
 1a9:	dd 83 10 00 00 00    	fld    QWORD PTR [ebx+0x10]
 1af:	8d 64 24 f8          	lea    esp,[esp-0x8]
 1b3:	dd 1c 24             	fstp   QWORD PTR [esp]
 1b6:	dd 83 18 00 00 00    	fld    QWORD PTR [ebx+0x18]
 1bc:	8d 64 24 f8          	lea    esp,[esp-0x8]
 1c0:	dd 1c 24             	fstp   QWORD PTR [esp]
 1c3:	e8 fc ff ff ff       	call   1c4 <test_funcdouble+0x2d>
 1c8:	83 c4 10             	add    esp,0x10
 1cb:	d9 e8                	fld1   
 1cd:	de c1                	faddp  st(1),st
 1cf:	dd 5d f0             	fstp   QWORD PTR [ebp-0x10]
 1d2:	dd 45 f0             	fld    QWORD PTR [ebp-0x10]
 1d5:	d9 7d e6             	fnstcw WORD PTR [ebp-0x1a]
 1d8:	0f b7 45 e6          	movzx  eax,WORD PTR [ebp-0x1a]
 1dc:	80 cc 0c             	or     ah,0xc
 1df:	66 89 45 e4          	mov    WORD PTR [ebp-0x1c],ax
 1e3:	d9 6d e4             	fldcw  WORD PTR [ebp-0x1c]
 1e6:	db 5d e0             	fistp  DWORD PTR [ebp-0x20]
 1e9:	d9 6d e6             	fldcw  WORD PTR [ebp-0x1a]
 1ec:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1ef:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1f2:	c9                   	leave  
 1f3:	c3                   	ret    

000001f4 <test_funcstructvalue>:
 1f4:	55                   	push   ebp
 1f5:	89 e5                	mov    ebp,esp
 1f7:	53                   	push   ebx
 1f8:	83 ec 44             	sub    esp,0x44
 1fb:	e8 fc ff ff ff       	call   1fc <test_funcstructvalue+0x8>
 200:	81 c2 02 00 00 00    	add    edx,0x2
 206:	65 a1 14 00 00 00    	mov    eax,gs:0x14
 20c:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 20f:	31 c0                	xor    eax,eax
 211:	c7 45 c4 01 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x1
 218:	c7 45 c8 02 00 00 00 	mov    DWORD PTR [ebp-0x38],0x2
 21f:	c7 45 cc 03 00 00 00 	mov    DWORD PTR [ebp-0x34],0x3
 226:	c7 45 d0 04 00 00 00 	mov    DWORD PTR [ebp-0x30],0x4
 22d:	c7 45 d4 05 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x5
 234:	c7 45 d8 06 00 00 00 	mov    DWORD PTR [ebp-0x28],0x6
 23b:	bb 00 00 00 00       	mov    ebx,0x0
 240:	b8 18 00 00 00       	mov    eax,0x18
 245:	83 e0 fc             	and    eax,0xfffffffc
 248:	89 c1                	mov    ecx,eax
 24a:	b8 00 00 00 00       	mov    eax,0x0
 24f:	89 5c 05 dc          	mov    DWORD PTR [ebp+eax*1-0x24],ebx
 253:	83 c0 04             	add    eax,0x4
 256:	39 c8                	cmp    eax,ecx
 258:	72 f5                	jb     24f <test_funcstructvalue+0x5b>
 25a:	83 ec 04             	sub    esp,0x4
 25d:	8d 45 dc             	lea    eax,[ebp-0x24]
 260:	50                   	push   eax
 261:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 264:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 267:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 26a:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
 26d:	ff 75 c8             	push   DWORD PTR [ebp-0x38]
 270:	ff 75 c4             	push   DWORD PTR [ebp-0x3c]
 273:	89 d3                	mov    ebx,edx
 275:	e8 fc ff ff ff       	call   276 <test_funcstructvalue+0x82>
 27a:	83 c4 20             	add    esp,0x20
 27d:	83 c0 01             	add    eax,0x1
 280:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
 283:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 286:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 289:	65 33 15 14 00 00 00 	xor    edx,DWORD PTR gs:0x14
 290:	74 05                	je     297 <test_funcstructvalue+0xa3>
 292:	e8 fc ff ff ff       	call   293 <test_funcstructvalue+0x9f>
 297:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 29a:	c9                   	leave  
 29b:	c3                   	ret    

0000029c <test_funcstructret>:
 29c:	55                   	push   ebp
 29d:	89 e5                	mov    ebp,esp
 29f:	53                   	push   ebx
 2a0:	83 ec 24             	sub    esp,0x24
 2a3:	e8 fc ff ff ff       	call   2a4 <test_funcstructret+0x8>
 2a8:	05 01 00 00 00       	add    eax,0x1
 2ad:	65 8b 0d 14 00 00 00 	mov    ecx,DWORD PTR gs:0x14
 2b4:	89 4d f4             	mov    DWORD PTR [ebp-0xc],ecx
 2b7:	31 c9                	xor    ecx,ecx
 2b9:	8d 55 dc             	lea    edx,[ebp-0x24]
 2bc:	83 ec 04             	sub    esp,0x4
 2bf:	6a 02                	push   0x2
 2c1:	6a 01                	push   0x1
 2c3:	52                   	push   edx
 2c4:	89 c3                	mov    ebx,eax
 2c6:	e8 fc ff ff ff       	call   2c7 <test_funcstructret+0x2b>
 2cb:	83 c4 0c             	add    esp,0xc
 2ce:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 2d1:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 2d4:	65 33 0d 14 00 00 00 	xor    ecx,DWORD PTR gs:0x14
 2db:	74 05                	je     2e2 <test_funcstructret+0x46>
 2dd:	e8 fc ff ff ff       	call   2de <test_funcstructret+0x42>
 2e2:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 2e5:	c9                   	leave  
 2e6:	c3                   	ret    

000002e7 <test_funcvarargs1>:
 2e7:	55                   	push   ebp
 2e8:	89 e5                	mov    ebp,esp
 2ea:	53                   	push   ebx
 2eb:	83 ec 14             	sub    esp,0x14
 2ee:	e8 fc ff ff ff       	call   2ef <test_funcvarargs1+0x8>
 2f3:	05 01 00 00 00       	add    eax,0x1
 2f8:	83 ec 0c             	sub    esp,0xc
 2fb:	6a 01                	push   0x1
 2fd:	89 c3                	mov    ebx,eax
 2ff:	e8 fc ff ff ff       	call   300 <test_funcvarargs1+0x19>
 304:	83 c4 10             	add    esp,0x10
 307:	83 c0 01             	add    eax,0x1
 30a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 30d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 313:	c9                   	leave  
 314:	c3                   	ret    

00000315 <test_funcvarargs4>:
 315:	55                   	push   ebp
 316:	89 e5                	mov    ebp,esp
 318:	53                   	push   ebx
 319:	83 ec 14             	sub    esp,0x14
 31c:	e8 fc ff ff ff       	call   31d <test_funcvarargs4+0x8>
 321:	05 01 00 00 00       	add    eax,0x1
 326:	83 ec 0c             	sub    esp,0xc
 329:	6a 04                	push   0x4
 32b:	6a 03                	push   0x3
 32d:	6a 02                	push   0x2
 32f:	6a 01                	push   0x1
 331:	6a 04                	push   0x4
 333:	89 c3                	mov    ebx,eax
 335:	e8 fc ff ff ff       	call   336 <test_funcvarargs4+0x21>
 33a:	83 c4 20             	add    esp,0x20
 33d:	83 c0 01             	add    eax,0x1
 340:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 343:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 346:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 349:	c9                   	leave  
 34a:	c3                   	ret    

0000034b <test_funcvarargs6>:
 34b:	55                   	push   ebp
 34c:	89 e5                	mov    ebp,esp
 34e:	53                   	push   ebx
 34f:	83 ec 14             	sub    esp,0x14
 352:	e8 fc ff ff ff       	call   353 <test_funcvarargs6+0x8>
 357:	05 01 00 00 00       	add    eax,0x1
 35c:	83 ec 04             	sub    esp,0x4
 35f:	6a 0c                	push   0xc
 361:	6a 0a                	push   0xa
 363:	6a 08                	push   0x8
 365:	6a 06                	push   0x6
 367:	6a 04                	push   0x4
 369:	6a 02                	push   0x2
 36b:	6a 06                	push   0x6
 36d:	89 c3                	mov    ebx,eax
 36f:	e8 fc ff ff ff       	call   370 <test_funcvarargs6+0x25>
 374:	83 c4 20             	add    esp,0x20
 377:	83 c0 01             	add    eax,0x1
 37a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 37d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 380:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 383:	c9                   	leave  
 384:	c3                   	ret    

00000385 <main>:
 385:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 389:	83 e4 f0             	and    esp,0xfffffff0
 38c:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 38f:	55                   	push   ebp
 390:	89 e5                	mov    ebp,esp
 392:	51                   	push   ecx
 393:	83 ec 14             	sub    esp,0x14
 396:	e8 fc ff ff ff       	call   397 <main+0x12>
 39b:	05 01 00 00 00       	add    eax,0x1
 3a0:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3a7:	e8 fc ff ff ff       	call   3a8 <main+0x23>
 3ac:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 3af:	e8 fc ff ff ff       	call   3b0 <main+0x2b>
 3b4:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 3b7:	e8 fc ff ff ff       	call   3b8 <main+0x33>
 3bc:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 3bf:	e8 fc ff ff ff       	call   3c0 <main+0x3b>
 3c4:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 3c7:	e8 fc ff ff ff       	call   3c8 <main+0x43>
 3cc:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 3cf:	e8 fc ff ff ff       	call   3d0 <main+0x4b>
 3d4:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 3d7:	e8 fc ff ff ff       	call   3d8 <main+0x53>
 3dc:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 3df:	e8 fc ff ff ff       	call   3e0 <main+0x5b>
 3e4:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 3e7:	e8 fc ff ff ff       	call   3e8 <main+0x63>
 3ec:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 3ef:	e8 fc ff ff ff       	call   3f0 <main+0x6b>
 3f4:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 3f7:	e8 fc ff ff ff       	call   3f8 <main+0x73>
 3fc:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 3ff:	e8 fc ff ff ff       	call   400 <main+0x7b>
 404:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 407:	e8 fc ff ff ff       	call   408 <main+0x83>
 40c:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 40f:	b8 00 00 00 00       	mov    eax,0x0
 414:	83 c4 14             	add    esp,0x14
 417:	59                   	pop    ecx
 418:	5d                   	pop    ebp
 419:	8d 61 fc             	lea    esp,[ecx-0x4]
 41c:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.ax:

00000000 <__x86.get_pc_thunk.ax>:
   0:	8b 04 24             	mov    eax,DWORD PTR [esp]
   3:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.dx:

00000000 <__x86.get_pc_thunk.dx>:
   0:	8b 14 24             	mov    edx,DWORD PTR [esp]
   3:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.bx:

00000000 <__x86.get_pc_thunk.bx>:
   0:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
   3:	c3                   	ret    
