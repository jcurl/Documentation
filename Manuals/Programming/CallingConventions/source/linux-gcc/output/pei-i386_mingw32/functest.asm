
functest:     file format pei-i386


Disassembly of section .text:

00401000 <___mingw_invalidParameterHandler>:
  401000:	c3                   	ret    
  401001:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401008:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  40100f:	90                   	nop

00401010 <_pre_c_init>:
  401010:	83 ec 1c             	sub    esp,0x1c
  401013:	31 c0                	xor    eax,eax
  401015:	66 81 3d 00 00 40 00 	cmp    WORD PTR ds:0x400000,0x5a4d
  40101c:	4d 5a 
  40101e:	c7 05 48 50 40 00 01 	mov    DWORD PTR ds:0x405048,0x1
  401025:	00 00 00 
  401028:	c7 05 44 50 40 00 01 	mov    DWORD PTR ds:0x405044,0x1
  40102f:	00 00 00 
  401032:	c7 05 40 50 40 00 01 	mov    DWORD PTR ds:0x405040,0x1
  401039:	00 00 00 
  40103c:	c7 05 38 50 40 00 01 	mov    DWORD PTR ds:0x405038,0x1
  401043:	00 00 00 
  401046:	75 18                	jne    401060 <_pre_c_init+0x50>
  401048:	8b 15 3c 00 40 00    	mov    edx,DWORD PTR ds:0x40003c
  40104e:	81 ba 00 00 40 00 50 	cmp    DWORD PTR [edx+0x400000],0x4550
  401055:	45 00 00 
  401058:	8d 8a 00 00 40 00    	lea    ecx,[edx+0x400000]
  40105e:	74 60                	je     4010c0 <_pre_c_init+0xb0>
  401060:	a3 14 50 40 00       	mov    ds:0x405014,eax
  401065:	a1 54 50 40 00       	mov    eax,ds:0x405054
  40106a:	85 c0                	test   eax,eax
  40106c:	74 42                	je     4010b0 <_pre_c_init+0xa0>
  40106e:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  401075:	e8 aa 19 00 00       	call   402a24 <___set_app_type>
  40107a:	e8 ad 19 00 00       	call   402a2c <___p__fmode>
  40107f:	8b 15 68 50 40 00    	mov    edx,DWORD PTR ds:0x405068
  401085:	89 10                	mov    DWORD PTR [eax],edx
  401087:	e8 a8 19 00 00       	call   402a34 <___p__commode>
  40108c:	8b 15 50 50 40 00    	mov    edx,DWORD PTR ds:0x405050
  401092:	89 10                	mov    DWORD PTR [eax],edx
  401094:	e8 87 0a 00 00       	call   401b20 <__setargv>
  401099:	83 3d 18 30 40 00 01 	cmp    DWORD PTR ds:0x403018,0x1
  4010a0:	74 4e                	je     4010f0 <_pre_c_init+0xe0>
  4010a2:	31 c0                	xor    eax,eax
  4010a4:	83 c4 1c             	add    esp,0x1c
  4010a7:	c3                   	ret    
  4010a8:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4010af:	90                   	nop
  4010b0:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  4010b7:	e8 68 19 00 00       	call   402a24 <___set_app_type>
  4010bc:	eb bc                	jmp    40107a <_pre_c_init+0x6a>
  4010be:	66 90                	xchg   ax,ax
  4010c0:	0f b7 51 18          	movzx  edx,WORD PTR [ecx+0x18]
  4010c4:	66 81 fa 0b 01       	cmp    dx,0x10b
  4010c9:	74 3d                	je     401108 <_pre_c_init+0xf8>
  4010cb:	66 81 fa 0b 02       	cmp    dx,0x20b
  4010d0:	75 8e                	jne    401060 <_pre_c_init+0x50>
  4010d2:	83 b9 84 00 00 00 0e 	cmp    DWORD PTR [ecx+0x84],0xe
  4010d9:	76 85                	jbe    401060 <_pre_c_init+0x50>
  4010db:	8b 91 f8 00 00 00    	mov    edx,DWORD PTR [ecx+0xf8]
  4010e1:	31 c0                	xor    eax,eax
  4010e3:	85 d2                	test   edx,edx
  4010e5:	0f 95 c0             	setne  al
  4010e8:	e9 73 ff ff ff       	jmp    401060 <_pre_c_init+0x50>
  4010ed:	8d 76 00             	lea    esi,[esi+0x0]
  4010f0:	c7 04 24 30 1c 40 00 	mov    DWORD PTR [esp],0x401c30
  4010f7:	e8 64 10 00 00       	call   402160 <___mingw_setusermatherr>
  4010fc:	31 c0                	xor    eax,eax
  4010fe:	83 c4 1c             	add    esp,0x1c
  401101:	c3                   	ret    
  401102:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401108:	83 79 74 0e          	cmp    DWORD PTR [ecx+0x74],0xe
  40110c:	0f 86 4e ff ff ff    	jbe    401060 <_pre_c_init+0x50>
  401112:	8b 89 e8 00 00 00    	mov    ecx,DWORD PTR [ecx+0xe8]
  401118:	31 c0                	xor    eax,eax
  40111a:	85 c9                	test   ecx,ecx
  40111c:	0f 95 c0             	setne  al
  40111f:	e9 3c ff ff ff       	jmp    401060 <_pre_c_init+0x50>
  401124:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  40112b:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  40112f:	90                   	nop

00401130 <_pre_cpp_init>:
  401130:	83 ec 2c             	sub    esp,0x2c
  401133:	a1 3c 50 40 00       	mov    eax,ds:0x40503c
  401138:	c7 44 24 10 0c 50 40 	mov    DWORD PTR [esp+0x10],0x40500c
  40113f:	00 
  401140:	a3 0c 50 40 00       	mov    ds:0x40500c,eax
  401145:	a1 34 50 40 00       	mov    eax,ds:0x405034
  40114a:	c7 44 24 08 1c 50 40 	mov    DWORD PTR [esp+0x8],0x40501c
  401151:	00 
  401152:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  401156:	c7 44 24 04 20 50 40 	mov    DWORD PTR [esp+0x4],0x405020
  40115d:	00 
  40115e:	c7 04 24 24 50 40 00 	mov    DWORD PTR [esp],0x405024
  401165:	e8 da 18 00 00       	call   402a44 <___getmainargs>
  40116a:	83 c4 2c             	add    esp,0x2c
  40116d:	c3                   	ret    
  40116e:	66 90                	xchg   ax,ax

00401170 <___tmainCRTStartup>:
  401170:	8d 4c 24 04          	lea    ecx,[esp+0x4]
  401174:	83 e4 f0             	and    esp,0xfffffff0
  401177:	31 c0                	xor    eax,eax
  401179:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
  40117c:	55                   	push   ebp
  40117d:	89 e5                	mov    ebp,esp
  40117f:	57                   	push   edi
  401180:	56                   	push   esi
  401181:	8d 55 a4             	lea    edx,[ebp-0x5c]
  401184:	53                   	push   ebx
  401185:	89 d7                	mov    edi,edx
  401187:	51                   	push   ecx
  401188:	b9 11 00 00 00       	mov    ecx,0x11
  40118d:	83 ec 78             	sub    esp,0x78
  401190:	8b 35 54 50 40 00    	mov    esi,DWORD PTR ds:0x405054
  401196:	f3 ab                	rep stos DWORD PTR es:[edi],eax
  401198:	85 f6                	test   esi,esi
  40119a:	0f 85 a0 02 00 00    	jne    401440 <___tmainCRTStartup+0x2d0>
  4011a0:	64 a1 18 00 00 00    	mov    eax,fs:0x18
  4011a6:	8b 35 f0 60 40 00    	mov    esi,DWORD PTR ds:0x4060f0
  4011ac:	8b 78 04             	mov    edi,DWORD PTR [eax+0x4]
  4011af:	31 db                	xor    ebx,ebx
  4011b1:	eb 19                	jmp    4011cc <___tmainCRTStartup+0x5c>
  4011b3:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4011b7:	90                   	nop
  4011b8:	39 c7                	cmp    edi,eax
  4011ba:	0f 84 18 02 00 00    	je     4013d8 <___tmainCRTStartup+0x268>
  4011c0:	c7 04 24 e8 03 00 00 	mov    DWORD PTR [esp],0x3e8
  4011c7:	ff d6                	call   esi
  4011c9:	83 ec 04             	sub    esp,0x4
  4011cc:	89 d8                	mov    eax,ebx
  4011ce:	f0 0f b1 3d 2c 50 40 	lock cmpxchg DWORD PTR ds:0x40502c,edi
  4011d5:	00 
  4011d6:	85 c0                	test   eax,eax
  4011d8:	75 de                	jne    4011b8 <___tmainCRTStartup+0x48>
  4011da:	a1 30 50 40 00       	mov    eax,ds:0x405030
  4011df:	31 db                	xor    ebx,ebx
  4011e1:	83 f8 01             	cmp    eax,0x1
  4011e4:	0f 84 01 02 00 00    	je     4013eb <___tmainCRTStartup+0x27b>
  4011ea:	a1 30 50 40 00       	mov    eax,ds:0x405030
  4011ef:	85 c0                	test   eax,eax
  4011f1:	0f 84 79 02 00 00    	je     401470 <___tmainCRTStartup+0x300>
  4011f7:	c7 05 10 50 40 00 01 	mov    DWORD PTR ds:0x405010,0x1
  4011fe:	00 00 00 
  401201:	a1 30 50 40 00       	mov    eax,ds:0x405030
  401206:	83 f8 01             	cmp    eax,0x1
  401209:	0f 84 f6 01 00 00    	je     401405 <___tmainCRTStartup+0x295>
  40120f:	85 db                	test   ebx,ebx
  401211:	0f 84 14 02 00 00    	je     40142b <___tmainCRTStartup+0x2bb>
  401217:	a1 38 40 40 00       	mov    eax,ds:0x404038
  40121c:	85 c0                	test   eax,eax
  40121e:	74 1c                	je     40123c <___tmainCRTStartup+0xcc>
  401220:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  401227:	00 
  401228:	c7 44 24 04 02 00 00 	mov    DWORD PTR [esp+0x4],0x2
  40122f:	00 
  401230:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  401237:	ff d0                	call   eax
  401239:	83 ec 0c             	sub    esp,0xc
  40123c:	e8 3f 0c 00 00       	call   401e80 <__pei386_runtime_relocator>
  401241:	c7 04 24 70 21 40 00 	mov    DWORD PTR [esp],0x402170
  401248:	ff 15 ec 60 40 00    	call   DWORD PTR ds:0x4060ec
  40124e:	83 ec 04             	sub    esp,0x4
  401251:	a3 6c 50 40 00       	mov    ds:0x40506c,eax
  401256:	c7 04 24 00 10 40 00 	mov    DWORD PTR [esp],0x401000
  40125d:	e8 0e 18 00 00       	call   402a70 <__set_invalid_parameter_handler>
  401262:	e8 49 0a 00 00       	call   401cb0 <__fpreset>
  401267:	c7 05 08 50 40 00 00 	mov    DWORD PTR ds:0x405008,0x400000
  40126e:	00 40 00 
  401271:	e8 c6 17 00 00       	call   402a3c <___p__acmdln>
  401276:	31 c9                	xor    ecx,ecx
  401278:	8b 00                	mov    eax,DWORD PTR [eax]
  40127a:	85 c0                	test   eax,eax
  40127c:	75 13                	jne    401291 <___tmainCRTStartup+0x121>
  40127e:	eb 4d                	jmp    4012cd <___tmainCRTStartup+0x15d>
  401280:	84 d2                	test   dl,dl
  401282:	74 44                	je     4012c8 <___tmainCRTStartup+0x158>
  401284:	83 e1 01             	and    ecx,0x1
  401287:	74 27                	je     4012b0 <___tmainCRTStartup+0x140>
  401289:	b9 01 00 00 00       	mov    ecx,0x1
  40128e:	83 c0 01             	add    eax,0x1
  401291:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  401294:	80 fa 20             	cmp    dl,0x20
  401297:	7e e7                	jle    401280 <___tmainCRTStartup+0x110>
  401299:	89 cb                	mov    ebx,ecx
  40129b:	83 f3 01             	xor    ebx,0x1
  40129e:	80 fa 22             	cmp    dl,0x22
  4012a1:	0f 44 cb             	cmove  ecx,ebx
  4012a4:	eb e8                	jmp    40128e <___tmainCRTStartup+0x11e>
  4012a6:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4012ad:	8d 76 00             	lea    esi,[esi+0x0]
  4012b0:	84 d2                	test   dl,dl
  4012b2:	74 14                	je     4012c8 <___tmainCRTStartup+0x158>
  4012b4:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4012b8:	0f b6 50 01          	movzx  edx,BYTE PTR [eax+0x1]
  4012bc:	83 c0 01             	add    eax,0x1
  4012bf:	84 d2                	test   dl,dl
  4012c1:	74 05                	je     4012c8 <___tmainCRTStartup+0x158>
  4012c3:	80 fa 20             	cmp    dl,0x20
  4012c6:	7e f0                	jle    4012b8 <___tmainCRTStartup+0x148>
  4012c8:	a3 04 50 40 00       	mov    ds:0x405004,eax
  4012cd:	8b 1d 54 50 40 00    	mov    ebx,DWORD PTR ds:0x405054
  4012d3:	85 db                	test   ebx,ebx
  4012d5:	74 14                	je     4012eb <___tmainCRTStartup+0x17b>
  4012d7:	b8 0a 00 00 00       	mov    eax,0xa
  4012dc:	f6 45 d0 01          	test   BYTE PTR [ebp-0x30],0x1
  4012e0:	0f 85 e2 00 00 00    	jne    4013c8 <___tmainCRTStartup+0x258>
  4012e6:	a3 00 30 40 00       	mov    ds:0x403000,eax
  4012eb:	8b 1d 24 50 40 00    	mov    ebx,DWORD PTR ds:0x405024
  4012f1:	8d 34 9d 04 00 00 00 	lea    esi,[ebx*4+0x4]
  4012f8:	89 34 24             	mov    DWORD PTR [esp],esi
  4012fb:	e8 c4 16 00 00       	call   4029c4 <_malloc>
  401300:	8b 15 20 50 40 00    	mov    edx,DWORD PTR ds:0x405020
  401306:	89 45 90             	mov    DWORD PTR [ebp-0x70],eax
  401309:	85 db                	test   ebx,ebx
  40130b:	0f 8e 82 01 00 00    	jle    401493 <___tmainCRTStartup+0x323>
  401311:	89 c3                	mov    ebx,eax
  401313:	8d 46 fc             	lea    eax,[esi-0x4]
  401316:	89 d7                	mov    edi,edx
  401318:	89 45 8c             	mov    DWORD PTR [ebp-0x74],eax
  40131b:	01 d0                	add    eax,edx
  40131d:	89 45 94             	mov    DWORD PTR [ebp-0x6c],eax
  401320:	8b 07                	mov    eax,DWORD PTR [edi]
  401322:	83 c3 04             	add    ebx,0x4
  401325:	83 c7 04             	add    edi,0x4
  401328:	89 04 24             	mov    DWORD PTR [esp],eax
  40132b:	e8 7c 16 00 00       	call   4029ac <_strlen>
  401330:	8d 70 01             	lea    esi,[eax+0x1]
  401333:	89 34 24             	mov    DWORD PTR [esp],esi
  401336:	e8 89 16 00 00       	call   4029c4 <_malloc>
  40133b:	89 43 fc             	mov    DWORD PTR [ebx-0x4],eax
  40133e:	8b 4f fc             	mov    ecx,DWORD PTR [edi-0x4]
  401341:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  401345:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  401349:	89 04 24             	mov    DWORD PTR [esp],eax
  40134c:	e8 6b 16 00 00       	call   4029bc <_memcpy>
  401351:	39 7d 94             	cmp    DWORD PTR [ebp-0x6c],edi
  401354:	75 ca                	jne    401320 <___tmainCRTStartup+0x1b0>
  401356:	8b 45 8c             	mov    eax,DWORD PTR [ebp-0x74]
  401359:	03 45 90             	add    eax,DWORD PTR [ebp-0x70]
  40135c:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  401362:	8b 45 90             	mov    eax,DWORD PTR [ebp-0x70]
  401365:	a3 20 50 40 00       	mov    ds:0x405020,eax
  40136a:	e8 81 07 00 00       	call   401af0 <___main>
  40136f:	a1 1c 50 40 00       	mov    eax,ds:0x40501c
  401374:	8b 15 08 61 40 00    	mov    edx,DWORD PTR ds:0x406108
  40137a:	89 02                	mov    DWORD PTR [edx],eax
  40137c:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  401380:	a1 20 50 40 00       	mov    eax,ds:0x405020
  401385:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401389:	a1 24 50 40 00       	mov    eax,ds:0x405024
  40138e:	89 04 24             	mov    DWORD PTR [esp],eax
  401391:	e8 21 06 00 00       	call   4019b7 <_main>
  401396:	8b 0d 14 50 40 00    	mov    ecx,DWORD PTR ds:0x405014
  40139c:	a3 18 50 40 00       	mov    ds:0x405018,eax
  4013a1:	85 c9                	test   ecx,ecx
  4013a3:	0f 84 f2 00 00 00    	je     40149b <___tmainCRTStartup+0x32b>
  4013a9:	8b 15 10 50 40 00    	mov    edx,DWORD PTR ds:0x405010
  4013af:	85 d2                	test   edx,edx
  4013b1:	0f 84 a1 00 00 00    	je     401458 <___tmainCRTStartup+0x2e8>
  4013b7:	8d 65 f0             	lea    esp,[ebp-0x10]
  4013ba:	59                   	pop    ecx
  4013bb:	5b                   	pop    ebx
  4013bc:	5e                   	pop    esi
  4013bd:	5f                   	pop    edi
  4013be:	5d                   	pop    ebp
  4013bf:	8d 61 fc             	lea    esp,[ecx-0x4]
  4013c2:	c3                   	ret    
  4013c3:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4013c7:	90                   	nop
  4013c8:	0f b7 45 d4          	movzx  eax,WORD PTR [ebp-0x2c]
  4013cc:	e9 15 ff ff ff       	jmp    4012e6 <___tmainCRTStartup+0x176>
  4013d1:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4013d8:	a1 30 50 40 00       	mov    eax,ds:0x405030
  4013dd:	bb 01 00 00 00       	mov    ebx,0x1
  4013e2:	83 f8 01             	cmp    eax,0x1
  4013e5:	0f 85 ff fd ff ff    	jne    4011ea <___tmainCRTStartup+0x7a>
  4013eb:	c7 04 24 1f 00 00 00 	mov    DWORD PTR [esp],0x1f
  4013f2:	e8 1d 16 00 00       	call   402a14 <__amsg_exit>
  4013f7:	a1 30 50 40 00       	mov    eax,ds:0x405030
  4013fc:	83 f8 01             	cmp    eax,0x1
  4013ff:	0f 85 0a fe ff ff    	jne    40120f <___tmainCRTStartup+0x9f>
  401405:	c7 44 24 04 08 70 40 	mov    DWORD PTR [esp+0x4],0x407008
  40140c:	00 
  40140d:	c7 04 24 00 70 40 00 	mov    DWORD PTR [esp],0x407000
  401414:	e8 eb 15 00 00       	call   402a04 <__initterm>
  401419:	c7 05 30 50 40 00 02 	mov    DWORD PTR ds:0x405030,0x2
  401420:	00 00 00 
  401423:	85 db                	test   ebx,ebx
  401425:	0f 85 ec fd ff ff    	jne    401217 <___tmainCRTStartup+0xa7>
  40142b:	87 1d 2c 50 40 00    	xchg   DWORD PTR ds:0x40502c,ebx
  401431:	e9 e1 fd ff ff       	jmp    401217 <___tmainCRTStartup+0xa7>
  401436:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  40143d:	8d 76 00             	lea    esi,[esi+0x0]
  401440:	89 14 24             	mov    DWORD PTR [esp],edx
  401443:	ff 15 e0 60 40 00    	call   DWORD PTR ds:0x4060e0
  401449:	83 ec 04             	sub    esp,0x4
  40144c:	e9 4f fd ff ff       	jmp    4011a0 <___tmainCRTStartup+0x30>
  401451:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401458:	e8 af 15 00 00       	call   402a0c <__cexit>
  40145d:	a1 18 50 40 00       	mov    eax,ds:0x405018
  401462:	8d 65 f0             	lea    esp,[ebp-0x10]
  401465:	59                   	pop    ecx
  401466:	5b                   	pop    ebx
  401467:	5e                   	pop    esi
  401468:	5f                   	pop    edi
  401469:	5d                   	pop    ebp
  40146a:	8d 61 fc             	lea    esp,[ecx-0x4]
  40146d:	c3                   	ret    
  40146e:	66 90                	xchg   ax,ax
  401470:	c7 44 24 04 18 70 40 	mov    DWORD PTR [esp+0x4],0x407018
  401477:	00 
  401478:	c7 04 24 0c 70 40 00 	mov    DWORD PTR [esp],0x40700c
  40147f:	c7 05 30 50 40 00 01 	mov    DWORD PTR ds:0x405030,0x1
  401486:	00 00 00 
  401489:	e8 76 15 00 00       	call   402a04 <__initterm>
  40148e:	e9 6e fd ff ff       	jmp    401201 <___tmainCRTStartup+0x91>
  401493:	8b 45 90             	mov    eax,DWORD PTR [ebp-0x70]
  401496:	e9 c1 fe ff ff       	jmp    40135c <___tmainCRTStartup+0x1ec>
  40149b:	89 04 24             	mov    DWORD PTR [esp],eax
  40149e:	e8 41 15 00 00       	call   4029e4 <_exit>
  4014a3:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4014aa:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

004014b0 <_WinMainCRTStartup>:
  4014b0:	c7 05 54 50 40 00 01 	mov    DWORD PTR ds:0x405054,0x1
  4014b7:	00 00 00 
  4014ba:	e9 b1 fc ff ff       	jmp    401170 <___tmainCRTStartup>
  4014bf:	90                   	nop

004014c0 <_mainCRTStartup>:
  4014c0:	c7 05 54 50 40 00 00 	mov    DWORD PTR ds:0x405054,0x0
  4014c7:	00 00 00 
  4014ca:	e9 a1 fc ff ff       	jmp    401170 <___tmainCRTStartup>
  4014cf:	90                   	nop

004014d0 <_atexit>:
  4014d0:	83 ec 1c             	sub    esp,0x1c
  4014d3:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  4014d7:	89 04 24             	mov    DWORD PTR [esp],eax
  4014da:	e8 1d 15 00 00       	call   4029fc <__onexit>
  4014df:	85 c0                	test   eax,eax
  4014e1:	0f 94 c0             	sete   al
  4014e4:	83 c4 1c             	add    esp,0x1c
  4014e7:	0f b6 c0             	movzx  eax,al
  4014ea:	f7 d8                	neg    eax
  4014ec:	c3                   	ret    
  4014ed:	90                   	nop
  4014ee:	90                   	nop
  4014ef:	90                   	nop

004014f0 <___gcc_register_frame>:
  4014f0:	55                   	push   ebp
  4014f1:	89 e5                	mov    ebp,esp
  4014f3:	83 ec 18             	sub    esp,0x18
  4014f6:	c7 04 24 10 15 40 00 	mov    DWORD PTR [esp],0x401510
  4014fd:	e8 ce ff ff ff       	call   4014d0 <_atexit>
  401502:	c9                   	leave  
  401503:	c3                   	ret    
  401504:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  40150b:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  40150f:	90                   	nop

00401510 <___gcc_deregister_frame>:
  401510:	c3                   	ret    
  401511:	90                   	nop
  401512:	90                   	nop
  401513:	90                   	nop
  401514:	90                   	nop
  401515:	90                   	nop
  401516:	90                   	nop
  401517:	90                   	nop
  401518:	90                   	nop
  401519:	90                   	nop
  40151a:	90                   	nop
  40151b:	90                   	nop
  40151c:	90                   	nop
  40151d:	90                   	nop
  40151e:	90                   	nop
  40151f:	90                   	nop

00401520 <_funcintr>:
  401520:	55                   	push   ebp
  401521:	89 e5                	mov    ebp,esp
  401523:	b8 2a 00 00 00       	mov    eax,0x2a
  401528:	5d                   	pop    ebp
  401529:	c3                   	ret    

0040152a <_funcint64r>:
  40152a:	55                   	push   ebp
  40152b:	89 e5                	mov    ebp,esp
  40152d:	b8 00 00 00 00       	mov    eax,0x0
  401532:	ba 42 00 00 00       	mov    edx,0x42
  401537:	5d                   	pop    ebp
  401538:	c3                   	ret    

00401539 <_funcint64r2>:
  401539:	55                   	push   ebp
  40153a:	89 e5                	mov    ebp,esp
  40153c:	b8 2a 00 00 00       	mov    eax,0x2a
  401541:	ba 00 00 00 00       	mov    edx,0x0
  401546:	5d                   	pop    ebp
  401547:	c3                   	ret    

00401548 <_funcint>:
  401548:	55                   	push   ebp
  401549:	89 e5                	mov    ebp,esp
  40154b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40154e:	8d 50 01             	lea    edx,[eax+0x1]
  401551:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  401554:	83 c0 02             	add    eax,0x2
  401557:	0f af c2             	imul   eax,edx
  40155a:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
  40155d:	83 c2 03             	add    edx,0x3
  401560:	0f af c2             	imul   eax,edx
  401563:	5d                   	pop    ebp
  401564:	c3                   	ret    

00401565 <_funcchar>:
  401565:	55                   	push   ebp
  401566:	89 e5                	mov    ebp,esp
  401568:	83 ec 08             	sub    esp,0x8
  40156b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  40156e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  401571:	88 55 fc             	mov    BYTE PTR [ebp-0x4],dl
  401574:	88 45 f8             	mov    BYTE PTR [ebp-0x8],al
  401577:	0f be 45 fc          	movsx  eax,BYTE PTR [ebp-0x4]
  40157b:	8d 50 01             	lea    edx,[eax+0x1]
  40157e:	0f be 45 f8          	movsx  eax,BYTE PTR [ebp-0x8]
  401582:	83 c0 02             	add    eax,0x2
  401585:	0f af c2             	imul   eax,edx
  401588:	c9                   	leave  
  401589:	c3                   	ret    

0040158a <_funcfloat>:
  40158a:	55                   	push   ebp
  40158b:	89 e5                	mov    ebp,esp
  40158d:	83 ec 08             	sub    esp,0x8
  401590:	d9 45 08             	fld    DWORD PTR [ebp+0x8]
  401593:	d9 e8                	fld1   
  401595:	de c1                	faddp  st(1),st
  401597:	d9 45 0c             	fld    DWORD PTR [ebp+0xc]
  40159a:	dd 05 00 40 40 00    	fld    QWORD PTR ds:0x404000
  4015a0:	de c1                	faddp  st(1),st
  4015a2:	de c9                	fmulp  st(1),st
  4015a4:	d9 45 10             	fld    DWORD PTR [ebp+0x10]
  4015a7:	dd 05 08 40 40 00    	fld    QWORD PTR ds:0x404008
  4015ad:	de c1                	faddp  st(1),st
  4015af:	de c9                	fmulp  st(1),st
  4015b1:	d9 5d fc             	fstp   DWORD PTR [ebp-0x4]
  4015b4:	d9 45 fc             	fld    DWORD PTR [ebp-0x4]
  4015b7:	c9                   	leave  
  4015b8:	c3                   	ret    

004015b9 <_funcfloatint>:
  4015b9:	55                   	push   ebp
  4015ba:	89 e5                	mov    ebp,esp
  4015bc:	83 ec 08             	sub    esp,0x8
  4015bf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4015c2:	83 c0 01             	add    eax,0x1
  4015c5:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  4015c8:	db 45 f8             	fild   DWORD PTR [ebp-0x8]
  4015cb:	d9 45 0c             	fld    DWORD PTR [ebp+0xc]
  4015ce:	dd 05 00 40 40 00    	fld    QWORD PTR ds:0x404000
  4015d4:	de c1                	faddp  st(1),st
  4015d6:	de c9                	fmulp  st(1),st
  4015d8:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  4015db:	83 c0 03             	add    eax,0x3
  4015de:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  4015e1:	db 45 f8             	fild   DWORD PTR [ebp-0x8]
  4015e4:	de c9                	fmulp  st(1),st
  4015e6:	d9 45 14             	fld    DWORD PTR [ebp+0x14]
  4015e9:	dd 05 10 40 40 00    	fld    QWORD PTR ds:0x404010
  4015ef:	de c1                	faddp  st(1),st
  4015f1:	de c9                	fmulp  st(1),st
  4015f3:	d9 7d fe             	fnstcw WORD PTR [ebp-0x2]
  4015f6:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
  4015fa:	80 cc 0c             	or     ah,0xc
  4015fd:	66 89 45 fc          	mov    WORD PTR [ebp-0x4],ax
  401601:	d9 6d fc             	fldcw  WORD PTR [ebp-0x4]
  401604:	db 5d f8             	fistp  DWORD PTR [ebp-0x8]
  401607:	d9 6d fe             	fldcw  WORD PTR [ebp-0x2]
  40160a:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  40160d:	c9                   	leave  
  40160e:	c3                   	ret    

0040160f <_funcdouble>:
  40160f:	55                   	push   ebp
  401610:	89 e5                	mov    ebp,esp
  401612:	83 ec 10             	sub    esp,0x10
  401615:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401618:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  40161b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  40161e:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  401621:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  401624:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  401627:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  40162a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  40162d:	dd 45 f8             	fld    QWORD PTR [ebp-0x8]
  401630:	dd 05 00 40 40 00    	fld    QWORD PTR ds:0x404000
  401636:	de c1                	faddp  st(1),st
  401638:	dd 45 f0             	fld    QWORD PTR [ebp-0x10]
  40163b:	dd 05 10 40 40 00    	fld    QWORD PTR ds:0x404010
  401641:	de c1                	faddp  st(1),st
  401643:	de c9                	fmulp  st(1),st
  401645:	c9                   	leave  
  401646:	c3                   	ret    

00401647 <_funcstructvalue>:
  401647:	55                   	push   ebp
  401648:	89 e5                	mov    ebp,esp
  40164a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  40164d:	8b 45 20             	mov    eax,DWORD PTR [ebp+0x20]
  401650:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  401653:	01 d0                	add    eax,edx
  401655:	5d                   	pop    ebp
  401656:	c3                   	ret    

00401657 <_funcstructret>:
  401657:	55                   	push   ebp
  401658:	89 e5                	mov    ebp,esp
  40165a:	83 ec 20             	sub    esp,0x20
  40165d:	b9 00 00 00 00       	mov    ecx,0x0
  401662:	b8 18 00 00 00       	mov    eax,0x18
  401667:	83 e0 fc             	and    eax,0xfffffffc
  40166a:	89 c2                	mov    edx,eax
  40166c:	b8 00 00 00 00       	mov    eax,0x0
  401671:	89 4c 05 e8          	mov    DWORD PTR [ebp+eax*1-0x18],ecx
  401675:	83 c0 04             	add    eax,0x4
  401678:	39 d0                	cmp    eax,edx
  40167a:	72 f5                	jb     401671 <_funcstructret+0x1a>
  40167c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  40167f:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
  401682:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  401685:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  401688:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40168b:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
  40168e:	89 10                	mov    DWORD PTR [eax],edx
  401690:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
  401693:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
  401696:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
  401699:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
  40169c:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  40169f:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
  4016a2:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  4016a5:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
  4016a8:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  4016ab:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
  4016ae:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4016b1:	c9                   	leave  
  4016b2:	c3                   	ret    

004016b3 <_funcvarargs>:
  4016b3:	55                   	push   ebp
  4016b4:	89 e5                	mov    ebp,esp
  4016b6:	83 ec 10             	sub    esp,0x10
  4016b9:	8d 45 0c             	lea    eax,[ebp+0xc]
  4016bc:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  4016bf:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
  4016c6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  4016cd:	eb 12                	jmp    4016e1 <_funcvarargs+0x2e>
  4016cf:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  4016d2:	8d 50 04             	lea    edx,[eax+0x4]
  4016d5:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
  4016d8:	8b 00                	mov    eax,DWORD PTR [eax]
  4016da:	01 45 f8             	add    DWORD PTR [ebp-0x8],eax
  4016dd:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
  4016e1:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4016e4:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
  4016e7:	7c e6                	jl     4016cf <_funcvarargs+0x1c>
  4016e9:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  4016ec:	c9                   	leave  
  4016ed:	c3                   	ret    
  4016ee:	90                   	nop
  4016ef:	90                   	nop

004016f0 <_test_funcintr>:
  4016f0:	55                   	push   ebp
  4016f1:	89 e5                	mov    ebp,esp
  4016f3:	83 ec 18             	sub    esp,0x18
  4016f6:	e8 25 fe ff ff       	call   401520 <_funcintr>
  4016fb:	83 c0 01             	add    eax,0x1
  4016fe:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  401701:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  401704:	c9                   	leave  
  401705:	c3                   	ret    

00401706 <_test_funcint64r>:
  401706:	55                   	push   ebp
  401707:	89 e5                	mov    ebp,esp
  401709:	83 ec 18             	sub    esp,0x18
  40170c:	e8 19 fe ff ff       	call   40152a <_funcint64r>
  401711:	83 c0 01             	add    eax,0x1
  401714:	83 d2 00             	adc    edx,0x0
  401717:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  40171a:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
  40171d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  401720:	c9                   	leave  
  401721:	c3                   	ret    

00401722 <_test_funcint64r2>:
  401722:	55                   	push   ebp
  401723:	89 e5                	mov    ebp,esp
  401725:	83 ec 18             	sub    esp,0x18
  401728:	e8 0c fe ff ff       	call   401539 <_funcint64r2>
  40172d:	83 c0 01             	add    eax,0x1
  401730:	83 d2 00             	adc    edx,0x0
  401733:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  401736:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
  401739:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  40173c:	c9                   	leave  
  40173d:	c3                   	ret    

0040173e <_test_funcint>:
  40173e:	55                   	push   ebp
  40173f:	89 e5                	mov    ebp,esp
  401741:	83 ec 28             	sub    esp,0x28
  401744:	c7 44 24 08 03 00 00 	mov    DWORD PTR [esp+0x8],0x3
  40174b:	00 
  40174c:	c7 44 24 04 02 00 00 	mov    DWORD PTR [esp+0x4],0x2
  401753:	00 
  401754:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  40175b:	e8 e8 fd ff ff       	call   401548 <_funcint>
  401760:	83 c0 01             	add    eax,0x1
  401763:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  401766:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  401769:	c9                   	leave  
  40176a:	c3                   	ret    

0040176b <_test_funcchar>:
  40176b:	55                   	push   ebp
  40176c:	89 e5                	mov    ebp,esp
  40176e:	83 ec 28             	sub    esp,0x28
  401771:	c7 44 24 04 02 00 00 	mov    DWORD PTR [esp+0x4],0x2
  401778:	00 
  401779:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  401780:	e8 e0 fd ff ff       	call   401565 <_funcchar>
  401785:	83 c0 01             	add    eax,0x1
  401788:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  40178b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  40178e:	c9                   	leave  
  40178f:	c3                   	ret    

00401790 <_test_funcfloat>:
  401790:	55                   	push   ebp
  401791:	89 e5                	mov    ebp,esp
  401793:	83 ec 38             	sub    esp,0x38
  401796:	d9 05 18 40 40 00    	fld    DWORD PTR ds:0x404018
  40179c:	d9 5c 24 08          	fstp   DWORD PTR [esp+0x8]
  4017a0:	d9 05 1c 40 40 00    	fld    DWORD PTR ds:0x40401c
  4017a6:	d9 5c 24 04          	fstp   DWORD PTR [esp+0x4]
  4017aa:	d9 e8                	fld1   
  4017ac:	d9 1c 24             	fstp   DWORD PTR [esp]
  4017af:	e8 d6 fd ff ff       	call   40158a <_funcfloat>
  4017b4:	dd 05 20 40 40 00    	fld    QWORD PTR ds:0x404020
  4017ba:	de c1                	faddp  st(1),st
  4017bc:	d9 5d f4             	fstp   DWORD PTR [ebp-0xc]
  4017bf:	d9 45 f4             	fld    DWORD PTR [ebp-0xc]
  4017c2:	d9 7d e6             	fnstcw WORD PTR [ebp-0x1a]
  4017c5:	0f b7 45 e6          	movzx  eax,WORD PTR [ebp-0x1a]
  4017c9:	80 cc 0c             	or     ah,0xc
  4017cc:	66 89 45 e4          	mov    WORD PTR [ebp-0x1c],ax
  4017d0:	d9 6d e4             	fldcw  WORD PTR [ebp-0x1c]
  4017d3:	db 5d e0             	fistp  DWORD PTR [ebp-0x20]
  4017d6:	d9 6d e6             	fldcw  WORD PTR [ebp-0x1a]
  4017d9:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  4017dc:	c9                   	leave  
  4017dd:	c3                   	ret    

004017de <_test_funcfloatint>:
  4017de:	55                   	push   ebp
  4017df:	89 e5                	mov    ebp,esp
  4017e1:	83 ec 28             	sub    esp,0x28
  4017e4:	d9 05 28 40 40 00    	fld    DWORD PTR ds:0x404028
  4017ea:	d9 5c 24 0c          	fstp   DWORD PTR [esp+0xc]
  4017ee:	c7 44 24 08 03 00 00 	mov    DWORD PTR [esp+0x8],0x3
  4017f5:	00 
  4017f6:	d9 05 1c 40 40 00    	fld    DWORD PTR ds:0x40401c
  4017fc:	d9 5c 24 04          	fstp   DWORD PTR [esp+0x4]
  401800:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  401807:	e8 ad fd ff ff       	call   4015b9 <_funcfloatint>
  40180c:	83 c0 01             	add    eax,0x1
  40180f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  401812:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  401815:	c9                   	leave  
  401816:	c3                   	ret    

00401817 <_test_funcdouble>:
  401817:	55                   	push   ebp
  401818:	89 e5                	mov    ebp,esp
  40181a:	83 ec 38             	sub    esp,0x38
  40181d:	dd 05 20 40 40 00    	fld    QWORD PTR ds:0x404020
  401823:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
  401827:	dd 05 30 40 40 00    	fld    QWORD PTR ds:0x404030
  40182d:	dd 1c 24             	fstp   QWORD PTR [esp]
  401830:	e8 da fd ff ff       	call   40160f <_funcdouble>
  401835:	d9 e8                	fld1   
  401837:	de c1                	faddp  st(1),st
  401839:	dd 5d f0             	fstp   QWORD PTR [ebp-0x10]
  40183c:	dd 45 f0             	fld    QWORD PTR [ebp-0x10]
  40183f:	d9 7d e6             	fnstcw WORD PTR [ebp-0x1a]
  401842:	0f b7 45 e6          	movzx  eax,WORD PTR [ebp-0x1a]
  401846:	80 cc 0c             	or     ah,0xc
  401849:	66 89 45 e4          	mov    WORD PTR [ebp-0x1c],ax
  40184d:	d9 6d e4             	fldcw  WORD PTR [ebp-0x1c]
  401850:	db 5d e0             	fistp  DWORD PTR [ebp-0x20]
  401853:	d9 6d e6             	fldcw  WORD PTR [ebp-0x1a]
  401856:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  401859:	c9                   	leave  
  40185a:	c3                   	ret    

0040185b <_test_funcstructvalue>:
  40185b:	55                   	push   ebp
  40185c:	89 e5                	mov    ebp,esp
  40185e:	83 ec 68             	sub    esp,0x68
  401861:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [ebp-0x24],0x1
  401868:	c7 45 e0 02 00 00 00 	mov    DWORD PTR [ebp-0x20],0x2
  40186f:	c7 45 e4 03 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x3
  401876:	c7 45 e8 04 00 00 00 	mov    DWORD PTR [ebp-0x18],0x4
  40187d:	c7 45 ec 05 00 00 00 	mov    DWORD PTR [ebp-0x14],0x5
  401884:	c7 45 f0 06 00 00 00 	mov    DWORD PTR [ebp-0x10],0x6
  40188b:	b9 00 00 00 00       	mov    ecx,0x0
  401890:	b8 18 00 00 00       	mov    eax,0x18
  401895:	83 e0 fc             	and    eax,0xfffffffc
  401898:	89 c2                	mov    edx,eax
  40189a:	b8 00 00 00 00       	mov    eax,0x0
  40189f:	89 4c 05 c4          	mov    DWORD PTR [ebp+eax*1-0x3c],ecx
  4018a3:	83 c0 04             	add    eax,0x4
  4018a6:	39 d0                	cmp    eax,edx
  4018a8:	72 f5                	jb     40189f <_test_funcstructvalue+0x44>
  4018aa:	8d 45 c4             	lea    eax,[ebp-0x3c]
  4018ad:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  4018b1:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  4018b4:	89 04 24             	mov    DWORD PTR [esp],eax
  4018b7:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  4018ba:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4018be:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  4018c1:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4018c5:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
  4018c8:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4018cc:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  4018cf:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  4018d3:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  4018d6:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  4018da:	e8 68 fd ff ff       	call   401647 <_funcstructvalue>
  4018df:	83 c0 01             	add    eax,0x1
  4018e2:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  4018e5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  4018e8:	c9                   	leave  
  4018e9:	c3                   	ret    

004018ea <_test_funcstructret>:
  4018ea:	55                   	push   ebp
  4018eb:	89 e5                	mov    ebp,esp
  4018ed:	83 ec 38             	sub    esp,0x38
  4018f0:	8d 45 e0             	lea    eax,[ebp-0x20]
  4018f3:	c7 44 24 08 02 00 00 	mov    DWORD PTR [esp+0x8],0x2
  4018fa:	00 
  4018fb:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401902:	00 
  401903:	89 04 24             	mov    DWORD PTR [esp],eax
  401906:	e8 4c fd ff ff       	call   401657 <_funcstructret>
  40190b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  40190e:	c9                   	leave  
  40190f:	c3                   	ret    

00401910 <_test_funcvarargs1>:
  401910:	55                   	push   ebp
  401911:	89 e5                	mov    ebp,esp
  401913:	83 ec 28             	sub    esp,0x28
  401916:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  40191d:	e8 91 fd ff ff       	call   4016b3 <_funcvarargs>
  401922:	83 c0 01             	add    eax,0x1
  401925:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  401928:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  40192b:	c9                   	leave  
  40192c:	c3                   	ret    

0040192d <_test_funcvarargs4>:
  40192d:	55                   	push   ebp
  40192e:	89 e5                	mov    ebp,esp
  401930:	83 ec 38             	sub    esp,0x38
  401933:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  40193a:	00 
  40193b:	c7 44 24 0c 03 00 00 	mov    DWORD PTR [esp+0xc],0x3
  401942:	00 
  401943:	c7 44 24 08 02 00 00 	mov    DWORD PTR [esp+0x8],0x2
  40194a:	00 
  40194b:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401952:	00 
  401953:	c7 04 24 04 00 00 00 	mov    DWORD PTR [esp],0x4
  40195a:	e8 54 fd ff ff       	call   4016b3 <_funcvarargs>
  40195f:	83 c0 01             	add    eax,0x1
  401962:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  401965:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  401968:	c9                   	leave  
  401969:	c3                   	ret    

0040196a <_test_funcvarargs6>:
  40196a:	55                   	push   ebp
  40196b:	89 e5                	mov    ebp,esp
  40196d:	83 ec 38             	sub    esp,0x38
  401970:	c7 44 24 18 0c 00 00 	mov    DWORD PTR [esp+0x18],0xc
  401977:	00 
  401978:	c7 44 24 14 0a 00 00 	mov    DWORD PTR [esp+0x14],0xa
  40197f:	00 
  401980:	c7 44 24 10 08 00 00 	mov    DWORD PTR [esp+0x10],0x8
  401987:	00 
  401988:	c7 44 24 0c 06 00 00 	mov    DWORD PTR [esp+0xc],0x6
  40198f:	00 
  401990:	c7 44 24 08 04 00 00 	mov    DWORD PTR [esp+0x8],0x4
  401997:	00 
  401998:	c7 44 24 04 02 00 00 	mov    DWORD PTR [esp+0x4],0x2
  40199f:	00 
  4019a0:	c7 04 24 06 00 00 00 	mov    DWORD PTR [esp],0x6
  4019a7:	e8 07 fd ff ff       	call   4016b3 <_funcvarargs>
  4019ac:	83 c0 01             	add    eax,0x1
  4019af:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  4019b2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  4019b5:	c9                   	leave  
  4019b6:	c3                   	ret    

004019b7 <_main>:
  4019b7:	55                   	push   ebp
  4019b8:	89 e5                	mov    ebp,esp
  4019ba:	83 e4 f0             	and    esp,0xfffffff0
  4019bd:	83 ec 10             	sub    esp,0x10
  4019c0:	e8 2b 01 00 00       	call   401af0 <___main>
  4019c5:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  4019cc:	00 
  4019cd:	e8 1e fd ff ff       	call   4016f0 <_test_funcintr>
  4019d2:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
  4019d6:	e8 2b fd ff ff       	call   401706 <_test_funcint64r>
  4019db:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
  4019df:	e8 3e fd ff ff       	call   401722 <_test_funcint64r2>
  4019e4:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
  4019e8:	e8 51 fd ff ff       	call   40173e <_test_funcint>
  4019ed:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
  4019f1:	e8 75 fd ff ff       	call   40176b <_test_funcchar>
  4019f6:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
  4019fa:	e8 91 fd ff ff       	call   401790 <_test_funcfloat>
  4019ff:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
  401a03:	e8 d6 fd ff ff       	call   4017de <_test_funcfloatint>
  401a08:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
  401a0c:	e8 06 fe ff ff       	call   401817 <_test_funcdouble>
  401a11:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
  401a15:	e8 41 fe ff ff       	call   40185b <_test_funcstructvalue>
  401a1a:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
  401a1e:	e8 c7 fe ff ff       	call   4018ea <_test_funcstructret>
  401a23:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
  401a27:	e8 e4 fe ff ff       	call   401910 <_test_funcvarargs1>
  401a2c:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
  401a30:	e8 f8 fe ff ff       	call   40192d <_test_funcvarargs4>
  401a35:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
  401a39:	e8 2c ff ff ff       	call   40196a <_test_funcvarargs6>
  401a3e:	01 44 24 0c          	add    DWORD PTR [esp+0xc],eax
  401a42:	b8 00 00 00 00       	mov    eax,0x0
  401a47:	c9                   	leave  
  401a48:	c3                   	ret    
  401a49:	90                   	nop
  401a4a:	90                   	nop
  401a4b:	90                   	nop
  401a4c:	66 90                	xchg   ax,ax
  401a4e:	66 90                	xchg   ax,ax

00401a50 <___do_global_dtors>:
  401a50:	a1 04 30 40 00       	mov    eax,ds:0x403004
  401a55:	8b 00                	mov    eax,DWORD PTR [eax]
  401a57:	85 c0                	test   eax,eax
  401a59:	74 25                	je     401a80 <___do_global_dtors+0x30>
  401a5b:	83 ec 0c             	sub    esp,0xc
  401a5e:	66 90                	xchg   ax,ax
  401a60:	ff d0                	call   eax
  401a62:	a1 04 30 40 00       	mov    eax,ds:0x403004
  401a67:	8d 50 04             	lea    edx,[eax+0x4]
  401a6a:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  401a6d:	89 15 04 30 40 00    	mov    DWORD PTR ds:0x403004,edx
  401a73:	85 c0                	test   eax,eax
  401a75:	75 e9                	jne    401a60 <___do_global_dtors+0x10>
  401a77:	83 c4 0c             	add    esp,0xc
  401a7a:	c3                   	ret    
  401a7b:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401a7f:	90                   	nop
  401a80:	c3                   	ret    
  401a81:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401a88:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401a8f:	90                   	nop

00401a90 <___do_global_ctors>:
  401a90:	53                   	push   ebx
  401a91:	83 ec 18             	sub    esp,0x18
  401a94:	8b 1d 90 2a 40 00    	mov    ebx,DWORD PTR ds:0x402a90
  401a9a:	83 fb ff             	cmp    ebx,0xffffffff
  401a9d:	74 29                	je     401ac8 <___do_global_ctors+0x38>
  401a9f:	85 db                	test   ebx,ebx
  401aa1:	74 11                	je     401ab4 <___do_global_ctors+0x24>
  401aa3:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401aa7:	90                   	nop
  401aa8:	ff 14 9d 90 2a 40 00 	call   DWORD PTR [ebx*4+0x402a90]
  401aaf:	83 eb 01             	sub    ebx,0x1
  401ab2:	75 f4                	jne    401aa8 <___do_global_ctors+0x18>
  401ab4:	c7 04 24 50 1a 40 00 	mov    DWORD PTR [esp],0x401a50
  401abb:	e8 10 fa ff ff       	call   4014d0 <_atexit>
  401ac0:	83 c4 18             	add    esp,0x18
  401ac3:	5b                   	pop    ebx
  401ac4:	c3                   	ret    
  401ac5:	8d 76 00             	lea    esi,[esi+0x0]
  401ac8:	31 c0                	xor    eax,eax
  401aca:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401ad0:	89 c3                	mov    ebx,eax
  401ad2:	83 c0 01             	add    eax,0x1
  401ad5:	8b 14 85 90 2a 40 00 	mov    edx,DWORD PTR [eax*4+0x402a90]
  401adc:	85 d2                	test   edx,edx
  401ade:	75 f0                	jne    401ad0 <___do_global_ctors+0x40>
  401ae0:	eb bd                	jmp    401a9f <___do_global_ctors+0xf>
  401ae2:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401ae9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00401af0 <___main>:
  401af0:	a1 28 50 40 00       	mov    eax,ds:0x405028
  401af5:	85 c0                	test   eax,eax
  401af7:	74 07                	je     401b00 <___main+0x10>
  401af9:	c3                   	ret    
  401afa:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401b00:	c7 05 28 50 40 00 01 	mov    DWORD PTR ds:0x405028,0x1
  401b07:	00 00 00 
  401b0a:	eb 84                	jmp    401a90 <___do_global_ctors>
  401b0c:	90                   	nop
  401b0d:	90                   	nop
  401b0e:	90                   	nop
  401b0f:	90                   	nop

00401b10 <_my_lconv_init>:
  401b10:	ff 25 0c 61 40 00    	jmp    DWORD PTR ds:0x40610c
  401b16:	90                   	nop
  401b17:	90                   	nop
  401b18:	90                   	nop
  401b19:	90                   	nop
  401b1a:	90                   	nop
  401b1b:	90                   	nop
  401b1c:	90                   	nop
  401b1d:	90                   	nop
  401b1e:	90                   	nop
  401b1f:	90                   	nop

00401b20 <__setargv>:
  401b20:	31 c0                	xor    eax,eax
  401b22:	c3                   	ret    
  401b23:	90                   	nop
  401b24:	90                   	nop
  401b25:	90                   	nop
  401b26:	90                   	nop
  401b27:	90                   	nop
  401b28:	90                   	nop
  401b29:	90                   	nop
  401b2a:	90                   	nop
  401b2b:	90                   	nop
  401b2c:	90                   	nop
  401b2d:	90                   	nop
  401b2e:	90                   	nop
  401b2f:	90                   	nop

00401b30 <___dyn_tls_dtor@12>:
  401b30:	83 ec 1c             	sub    esp,0x1c
  401b33:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  401b37:	83 f8 03             	cmp    eax,0x3
  401b3a:	74 14                	je     401b50 <___dyn_tls_dtor@12+0x20>
  401b3c:	85 c0                	test   eax,eax
  401b3e:	74 10                	je     401b50 <___dyn_tls_dtor@12+0x20>
  401b40:	b8 01 00 00 00       	mov    eax,0x1
  401b45:	83 c4 1c             	add    esp,0x1c
  401b48:	c2 0c 00             	ret    0xc
  401b4b:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401b4f:	90                   	nop
  401b50:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401b54:	8b 54 24 28          	mov    edx,DWORD PTR [esp+0x28]
  401b58:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  401b5c:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  401b60:	89 04 24             	mov    DWORD PTR [esp],eax
  401b63:	e8 38 09 00 00       	call   4024a0 <___mingw_TLScallback>
  401b68:	b8 01 00 00 00       	mov    eax,0x1
  401b6d:	83 c4 1c             	add    esp,0x1c
  401b70:	c2 0c 00             	ret    0xc
  401b73:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401b7a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

00401b80 <___dyn_tls_init@12>:
  401b80:	56                   	push   esi
  401b81:	53                   	push   ebx
  401b82:	83 ec 14             	sub    esp,0x14
  401b85:	83 3d 14 30 40 00 02 	cmp    DWORD PTR ds:0x403014,0x2
  401b8c:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  401b90:	74 0a                	je     401b9c <___dyn_tls_init@12+0x1c>
  401b92:	c7 05 14 30 40 00 02 	mov    DWORD PTR ds:0x403014,0x2
  401b99:	00 00 00 
  401b9c:	83 f8 02             	cmp    eax,0x2
  401b9f:	74 17                	je     401bb8 <___dyn_tls_init@12+0x38>
  401ba1:	83 f8 01             	cmp    eax,0x1
  401ba4:	74 4a                	je     401bf0 <___dyn_tls_init@12+0x70>
  401ba6:	83 c4 14             	add    esp,0x14
  401ba9:	b8 01 00 00 00       	mov    eax,0x1
  401bae:	5b                   	pop    ebx
  401baf:	5e                   	pop    esi
  401bb0:	c2 0c 00             	ret    0xc
  401bb3:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401bb7:	90                   	nop
  401bb8:	bb 30 70 40 00       	mov    ebx,0x407030
  401bbd:	be 30 70 40 00       	mov    esi,0x407030
  401bc2:	39 de                	cmp    esi,ebx
  401bc4:	74 e0                	je     401ba6 <___dyn_tls_init@12+0x26>
  401bc6:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401bcd:	8d 76 00             	lea    esi,[esi+0x0]
  401bd0:	8b 03                	mov    eax,DWORD PTR [ebx]
  401bd2:	85 c0                	test   eax,eax
  401bd4:	74 02                	je     401bd8 <___dyn_tls_init@12+0x58>
  401bd6:	ff d0                	call   eax
  401bd8:	83 c3 04             	add    ebx,0x4
  401bdb:	39 de                	cmp    esi,ebx
  401bdd:	75 f1                	jne    401bd0 <___dyn_tls_init@12+0x50>
  401bdf:	83 c4 14             	add    esp,0x14
  401be2:	b8 01 00 00 00       	mov    eax,0x1
  401be7:	5b                   	pop    ebx
  401be8:	5e                   	pop    esi
  401be9:	c2 0c 00             	ret    0xc
  401bec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401bf0:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  401bf4:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401bfb:	00 
  401bfc:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  401c00:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  401c04:	89 04 24             	mov    DWORD PTR [esp],eax
  401c07:	e8 94 08 00 00       	call   4024a0 <___mingw_TLScallback>
  401c0c:	83 c4 14             	add    esp,0x14
  401c0f:	b8 01 00 00 00       	mov    eax,0x1
  401c14:	5b                   	pop    ebx
  401c15:	5e                   	pop    esi
  401c16:	c2 0c 00             	ret    0xc
  401c19:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00401c20 <___tlregdtor>:
  401c20:	31 c0                	xor    eax,eax
  401c22:	c3                   	ret    
  401c23:	90                   	nop
  401c24:	90                   	nop
  401c25:	90                   	nop
  401c26:	90                   	nop
  401c27:	90                   	nop
  401c28:	90                   	nop
  401c29:	90                   	nop
  401c2a:	90                   	nop
  401c2b:	90                   	nop
  401c2c:	90                   	nop
  401c2d:	90                   	nop
  401c2e:	90                   	nop
  401c2f:	90                   	nop

00401c30 <__matherr>:
  401c30:	56                   	push   esi
  401c31:	53                   	push   ebx
  401c32:	bb 54 40 40 00       	mov    ebx,0x404054
  401c37:	83 ec 54             	sub    esp,0x54
  401c3a:	8b 44 24 60          	mov    eax,DWORD PTR [esp+0x60]
  401c3e:	8b 08                	mov    ecx,DWORD PTR [eax]
  401c40:	8d 51 ff             	lea    edx,[ecx-0x1]
  401c43:	83 fa 05             	cmp    edx,0x5
  401c46:	77 07                	ja     401c4f <__matherr+0x1f>
  401c48:	8b 1c 95 70 41 40 00 	mov    ebx,DWORD PTR [edx*4+0x404170]
  401c4f:	dd 40 18             	fld    QWORD PTR [eax+0x18]
  401c52:	8b 70 04             	mov    esi,DWORD PTR [eax+0x4]
  401c55:	dd 5c 24 48          	fstp   QWORD PTR [esp+0x48]
  401c59:	dd 40 10             	fld    QWORD PTR [eax+0x10]
  401c5c:	dd 5c 24 40          	fstp   QWORD PTR [esp+0x40]
  401c60:	dd 40 08             	fld    QWORD PTR [eax+0x8]
  401c63:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  401c6a:	dd 5c 24 38          	fstp   QWORD PTR [esp+0x38]
  401c6e:	e8 dd 0d 00 00       	call   402a50 <___acrt_iob_func>
  401c73:	dd 44 24 48          	fld    QWORD PTR [esp+0x48]
  401c77:	89 74 24 0c          	mov    DWORD PTR [esp+0xc],esi
  401c7b:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  401c7f:	c7 44 24 04 64 40 40 	mov    DWORD PTR [esp+0x4],0x404064
  401c86:	00 
  401c87:	dd 5c 24 20          	fstp   QWORD PTR [esp+0x20]
  401c8b:	dd 44 24 40          	fld    QWORD PTR [esp+0x40]
  401c8f:	89 04 24             	mov    DWORD PTR [esp],eax
  401c92:	dd 5c 24 18          	fstp   QWORD PTR [esp+0x18]
  401c96:	dd 44 24 38          	fld    QWORD PTR [esp+0x38]
  401c9a:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  401c9e:	e8 39 0d 00 00       	call   4029dc <_fprintf>
  401ca3:	83 c4 54             	add    esp,0x54
  401ca6:	31 c0                	xor    eax,eax
  401ca8:	5b                   	pop    ebx
  401ca9:	5e                   	pop    esi
  401caa:	c3                   	ret    
  401cab:	90                   	nop
  401cac:	90                   	nop
  401cad:	90                   	nop
  401cae:	90                   	nop
  401caf:	90                   	nop

00401cb0 <__fpreset>:
  401cb0:	db e3                	fninit 
  401cb2:	c3                   	ret    
  401cb3:	90                   	nop
  401cb4:	90                   	nop
  401cb5:	90                   	nop
  401cb6:	90                   	nop
  401cb7:	90                   	nop
  401cb8:	90                   	nop
  401cb9:	90                   	nop
  401cba:	90                   	nop
  401cbb:	90                   	nop
  401cbc:	90                   	nop
  401cbd:	90                   	nop
  401cbe:	90                   	nop
  401cbf:	90                   	nop

00401cc0 <___report_error>:
  401cc0:	53                   	push   ebx
  401cc1:	83 ec 18             	sub    esp,0x18
  401cc4:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  401ccb:	8d 5c 24 24          	lea    ebx,[esp+0x24]
  401ccf:	e8 7c 0d 00 00       	call   402a50 <___acrt_iob_func>
  401cd4:	c7 44 24 08 1b 00 00 	mov    DWORD PTR [esp+0x8],0x1b
  401cdb:	00 
  401cdc:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  401ce0:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401ce7:	00 
  401ce8:	c7 04 24 88 41 40 00 	mov    DWORD PTR [esp],0x404188
  401cef:	e8 d8 0c 00 00       	call   4029cc <_fwrite>
  401cf4:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  401cfb:	e8 50 0d 00 00       	call   402a50 <___acrt_iob_func>
  401d00:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  401d04:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  401d08:	89 04 24             	mov    DWORD PTR [esp],eax
  401d0b:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  401d0f:	e8 88 0c 00 00       	call   40299c <_vfprintf>
  401d14:	e8 db 0c 00 00       	call   4029f4 <_abort>
  401d19:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00401d20 <_mark_section_writable>:
  401d20:	57                   	push   edi
  401d21:	56                   	push   esi
  401d22:	53                   	push   ebx
  401d23:	89 c3                	mov    ebx,eax
  401d25:	83 ec 30             	sub    esp,0x30
  401d28:	8b 35 5c 50 40 00    	mov    esi,DWORD PTR ds:0x40505c
  401d2e:	85 f6                	test   esi,esi
  401d30:	0f 8e 0a 01 00 00    	jle    401e40 <_mark_section_writable+0x120>
  401d36:	a1 60 50 40 00       	mov    eax,ds:0x405060
  401d3b:	31 c9                	xor    ecx,ecx
  401d3d:	83 c0 0c             	add    eax,0xc
  401d40:	8b 10                	mov    edx,DWORD PTR [eax]
  401d42:	39 da                	cmp    edx,ebx
  401d44:	77 0e                	ja     401d54 <_mark_section_writable+0x34>
  401d46:	8b 78 04             	mov    edi,DWORD PTR [eax+0x4]
  401d49:	03 57 08             	add    edx,DWORD PTR [edi+0x8]
  401d4c:	39 d3                	cmp    ebx,edx
  401d4e:	0f 82 83 00 00 00    	jb     401dd7 <_mark_section_writable+0xb7>
  401d54:	83 c1 01             	add    ecx,0x1
  401d57:	83 c0 14             	add    eax,0x14
  401d5a:	39 f1                	cmp    ecx,esi
  401d5c:	75 e2                	jne    401d40 <_mark_section_writable+0x20>
  401d5e:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401d61:	e8 3a 09 00 00       	call   4026a0 <___mingw_GetSectionForAddress>
  401d66:	89 c7                	mov    edi,eax
  401d68:	85 c0                	test   eax,eax
  401d6a:	0f 84 f7 00 00 00    	je     401e67 <_mark_section_writable+0x147>
  401d70:	a1 60 50 40 00       	mov    eax,ds:0x405060
  401d75:	8d 1c b6             	lea    ebx,[esi+esi*4]
  401d78:	c1 e3 02             	shl    ebx,0x2
  401d7b:	01 d8                	add    eax,ebx
  401d7d:	89 78 10             	mov    DWORD PTR [eax+0x10],edi
  401d80:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  401d86:	e8 55 0a 00 00       	call   4027e0 <__GetPEImageBase>
  401d8b:	8b 15 60 50 40 00    	mov    edx,DWORD PTR ds:0x405060
  401d91:	03 47 0c             	add    eax,DWORD PTR [edi+0xc]
  401d94:	89 44 1a 0c          	mov    DWORD PTR [edx+ebx*1+0xc],eax
  401d98:	8d 54 24 14          	lea    edx,[esp+0x14]
  401d9c:	c7 44 24 08 1c 00 00 	mov    DWORD PTR [esp+0x8],0x1c
  401da3:	00 
  401da4:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  401da8:	89 04 24             	mov    DWORD PTR [esp],eax
  401dab:	ff 15 fc 60 40 00    	call   DWORD PTR ds:0x4060fc
  401db1:	83 ec 0c             	sub    esp,0xc
  401db4:	85 c0                	test   eax,eax
  401db6:	0f 84 8b 00 00 00    	je     401e47 <_mark_section_writable+0x127>
  401dbc:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  401dc0:	8d 50 c0             	lea    edx,[eax-0x40]
  401dc3:	83 e2 bf             	and    edx,0xffffffbf
  401dc6:	74 08                	je     401dd0 <_mark_section_writable+0xb0>
  401dc8:	8d 50 fc             	lea    edx,[eax-0x4]
  401dcb:	83 e2 fb             	and    edx,0xfffffffb
  401dce:	75 10                	jne    401de0 <_mark_section_writable+0xc0>
  401dd0:	83 05 5c 50 40 00 01 	add    DWORD PTR ds:0x40505c,0x1
  401dd7:	83 c4 30             	add    esp,0x30
  401dda:	5b                   	pop    ebx
  401ddb:	5e                   	pop    esi
  401ddc:	5f                   	pop    edi
  401ddd:	c3                   	ret    
  401dde:	66 90                	xchg   ax,ax
  401de0:	83 f8 02             	cmp    eax,0x2
  401de3:	ba 40 00 00 00       	mov    edx,0x40
  401de8:	b8 04 00 00 00       	mov    eax,0x4
  401ded:	8b 4c 24 20          	mov    ecx,DWORD PTR [esp+0x20]
  401df1:	0f 45 c2             	cmovne eax,edx
  401df4:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  401df8:	03 1d 60 50 40 00    	add    ebx,DWORD PTR ds:0x405060
  401dfe:	89 4b 08             	mov    DWORD PTR [ebx+0x8],ecx
  401e01:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
  401e04:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
  401e08:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  401e0c:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  401e10:	89 14 24             	mov    DWORD PTR [esp],edx
  401e13:	ff 15 f8 60 40 00    	call   DWORD PTR ds:0x4060f8
  401e19:	83 ec 10             	sub    esp,0x10
  401e1c:	85 c0                	test   eax,eax
  401e1e:	75 b0                	jne    401dd0 <_mark_section_writable+0xb0>
  401e20:	ff 15 dc 60 40 00    	call   DWORD PTR ds:0x4060dc
  401e26:	c7 04 24 f8 41 40 00 	mov    DWORD PTR [esp],0x4041f8
  401e2d:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401e31:	e8 8a fe ff ff       	call   401cc0 <___report_error>
  401e36:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401e3d:	8d 76 00             	lea    esi,[esi+0x0]
  401e40:	31 f6                	xor    esi,esi
  401e42:	e9 17 ff ff ff       	jmp    401d5e <_mark_section_writable+0x3e>
  401e47:	a1 60 50 40 00       	mov    eax,ds:0x405060
  401e4c:	8b 44 18 0c          	mov    eax,DWORD PTR [eax+ebx*1+0xc]
  401e50:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  401e54:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  401e57:	c7 04 24 c4 41 40 00 	mov    DWORD PTR [esp],0x4041c4
  401e5e:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401e62:	e8 59 fe ff ff       	call   401cc0 <___report_error>
  401e67:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  401e6b:	c7 04 24 a4 41 40 00 	mov    DWORD PTR [esp],0x4041a4
  401e72:	e8 49 fe ff ff       	call   401cc0 <___report_error>
  401e77:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401e7e:	66 90                	xchg   ax,ax

00401e80 <__pei386_runtime_relocator>:
  401e80:	55                   	push   ebp
  401e81:	89 e5                	mov    ebp,esp
  401e83:	57                   	push   edi
  401e84:	56                   	push   esi
  401e85:	53                   	push   ebx
  401e86:	83 ec 3c             	sub    esp,0x3c
  401e89:	8b 3d 58 50 40 00    	mov    edi,DWORD PTR ds:0x405058
  401e8f:	85 ff                	test   edi,edi
  401e91:	74 0d                	je     401ea0 <__pei386_runtime_relocator+0x20>
  401e93:	8d 65 f4             	lea    esp,[ebp-0xc]
  401e96:	5b                   	pop    ebx
  401e97:	5e                   	pop    esi
  401e98:	5f                   	pop    edi
  401e99:	5d                   	pop    ebp
  401e9a:	c3                   	ret    
  401e9b:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401e9f:	90                   	nop
  401ea0:	c7 05 58 50 40 00 01 	mov    DWORD PTR ds:0x405058,0x1
  401ea7:	00 00 00 
  401eaa:	e8 71 08 00 00       	call   402720 <___mingw_GetSectionCount>
  401eaf:	8d 04 80             	lea    eax,[eax+eax*4]
  401eb2:	8d 04 85 1b 00 00 00 	lea    eax,[eax*4+0x1b]
  401eb9:	c1 e8 04             	shr    eax,0x4
  401ebc:	c1 e0 04             	shl    eax,0x4
  401ebf:	e8 ac 0a 00 00       	call   402970 <___chkstk_ms>
  401ec4:	c7 05 5c 50 40 00 00 	mov    DWORD PTR ds:0x40505c,0x0
  401ecb:	00 00 00 
  401ece:	29 c4                	sub    esp,eax
  401ed0:	8d 44 24 1f          	lea    eax,[esp+0x1f]
  401ed4:	83 e0 f0             	and    eax,0xfffffff0
  401ed7:	a3 60 50 40 00       	mov    ds:0x405060,eax
  401edc:	b8 c4 44 40 00       	mov    eax,0x4044c4
  401ee1:	2d c4 44 40 00       	sub    eax,0x4044c4
  401ee6:	83 f8 07             	cmp    eax,0x7
  401ee9:	7e a8                	jle    401e93 <__pei386_runtime_relocator+0x13>
  401eeb:	8b 15 c4 44 40 00    	mov    edx,DWORD PTR ds:0x4044c4
  401ef1:	83 f8 0b             	cmp    eax,0xb
  401ef4:	0f 8f a6 00 00 00    	jg     401fa0 <__pei386_runtime_relocator+0x120>
  401efa:	bb c4 44 40 00       	mov    ebx,0x4044c4
  401eff:	85 d2                	test   edx,edx
  401f01:	0f 85 3e 01 00 00    	jne    402045 <__pei386_runtime_relocator+0x1c5>
  401f07:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  401f0a:	85 c0                	test   eax,eax
  401f0c:	0f 85 33 01 00 00    	jne    402045 <__pei386_runtime_relocator+0x1c5>
  401f12:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  401f15:	83 f8 01             	cmp    eax,0x1
  401f18:	0f 85 cb 01 00 00    	jne    4020e9 <__pei386_runtime_relocator+0x269>
  401f1e:	83 c3 0c             	add    ebx,0xc
  401f21:	81 fb c4 44 40 00    	cmp    ebx,0x4044c4
  401f27:	0f 83 66 ff ff ff    	jae    401e93 <__pei386_runtime_relocator+0x13>
  401f2d:	89 7d cc             	mov    DWORD PTR [ebp-0x34],edi
  401f30:	eb 25                	jmp    401f57 <__pei386_runtime_relocator+0xd7>
  401f32:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401f38:	8b 7d d4             	mov    edi,DWORD PTR [ebp-0x2c]
  401f3b:	29 c7                	sub    edi,eax
  401f3d:	89 f0                	mov    eax,esi
  401f3f:	03 3e                	add    edi,DWORD PTR [esi]
  401f41:	e8 da fd ff ff       	call   401d20 <_mark_section_writable>
  401f46:	89 3e                	mov    DWORD PTR [esi],edi
  401f48:	83 c3 0c             	add    ebx,0xc
  401f4b:	81 fb c4 44 40 00    	cmp    ebx,0x4044c4
  401f51:	0f 83 b6 00 00 00    	jae    40200d <__pei386_runtime_relocator+0x18d>
  401f57:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  401f59:	8b 53 04             	mov    edx,DWORD PTR [ebx+0x4]
  401f5c:	8d 81 00 00 40 00    	lea    eax,[ecx+0x400000]
  401f62:	8b 89 00 00 40 00    	mov    ecx,DWORD PTR [ecx+0x400000]
  401f68:	8d b2 00 00 40 00    	lea    esi,[edx+0x400000]
  401f6e:	89 4d d4             	mov    DWORD PTR [ebp-0x2c],ecx
  401f71:	0f b6 4b 08          	movzx  ecx,BYTE PTR [ebx+0x8]
  401f75:	83 f9 10             	cmp    ecx,0x10
  401f78:	74 56                	je     401fd0 <__pei386_runtime_relocator+0x150>
  401f7a:	83 f9 20             	cmp    ecx,0x20
  401f7d:	74 b9                	je     401f38 <__pei386_runtime_relocator+0xb8>
  401f7f:	83 f9 08             	cmp    ecx,0x8
  401f82:	0f 84 90 00 00 00    	je     402018 <__pei386_runtime_relocator+0x198>
  401f88:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  401f8c:	c7 04 24 54 42 40 00 	mov    DWORD PTR [esp],0x404254
  401f93:	e8 28 fd ff ff       	call   401cc0 <___report_error>
  401f98:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401f9f:	90                   	nop
  401fa0:	85 d2                	test   edx,edx
  401fa2:	0f 85 98 00 00 00    	jne    402040 <__pei386_runtime_relocator+0x1c0>
  401fa8:	a1 c8 44 40 00       	mov    eax,ds:0x4044c8
  401fad:	89 c6                	mov    esi,eax
  401faf:	0b 35 cc 44 40 00    	or     esi,DWORD PTR ds:0x4044cc
  401fb5:	0f 85 24 01 00 00    	jne    4020df <__pei386_runtime_relocator+0x25f>
  401fbb:	8b 15 d0 44 40 00    	mov    edx,DWORD PTR ds:0x4044d0
  401fc1:	bb d0 44 40 00       	mov    ebx,0x4044d0
  401fc6:	e9 34 ff ff ff       	jmp    401eff <__pei386_runtime_relocator+0x7f>
  401fcb:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401fcf:	90                   	nop
  401fd0:	0f b7 ba 00 00 40 00 	movzx  edi,WORD PTR [edx+0x400000]
  401fd7:	89 55 d0             	mov    DWORD PTR [ebp-0x30],edx
  401fda:	89 fa                	mov    edx,edi
  401fdc:	81 ca 00 00 ff ff    	or     edx,0xffff0000
  401fe2:	66 85 ff             	test   di,di
  401fe5:	0f 48 fa             	cmovs  edi,edx
  401fe8:	83 c3 0c             	add    ebx,0xc
  401feb:	29 c7                	sub    edi,eax
  401fed:	89 f0                	mov    eax,esi
  401fef:	03 7d d4             	add    edi,DWORD PTR [ebp-0x2c]
  401ff2:	e8 29 fd ff ff       	call   401d20 <_mark_section_writable>
  401ff7:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
  401ffa:	66 89 ba 00 00 40 00 	mov    WORD PTR [edx+0x400000],di
  402001:	81 fb c4 44 40 00    	cmp    ebx,0x4044c4
  402007:	0f 82 4a ff ff ff    	jb     401f57 <__pei386_runtime_relocator+0xd7>
  40200d:	8b 7d cc             	mov    edi,DWORD PTR [ebp-0x34]
  402010:	eb 72                	jmp    402084 <__pei386_runtime_relocator+0x204>
  402012:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  402018:	0f b6 3e             	movzx  edi,BYTE PTR [esi]
  40201b:	89 fa                	mov    edx,edi
  40201d:	89 f9                	mov    ecx,edi
  40201f:	81 c9 00 ff ff ff    	or     ecx,0xffffff00
  402025:	84 d2                	test   dl,dl
  402027:	0f 48 f9             	cmovs  edi,ecx
  40202a:	29 c7                	sub    edi,eax
  40202c:	89 f0                	mov    eax,esi
  40202e:	03 7d d4             	add    edi,DWORD PTR [ebp-0x2c]
  402031:	e8 ea fc ff ff       	call   401d20 <_mark_section_writable>
  402036:	89 f8                	mov    eax,edi
  402038:	88 06                	mov    BYTE PTR [esi],al
  40203a:	e9 09 ff ff ff       	jmp    401f48 <__pei386_runtime_relocator+0xc8>
  40203f:	90                   	nop
  402040:	bb c4 44 40 00       	mov    ebx,0x4044c4
  402045:	81 fb c4 44 40 00    	cmp    ebx,0x4044c4
  40204b:	0f 83 42 fe ff ff    	jae    401e93 <__pei386_runtime_relocator+0x13>
  402051:	89 7d d4             	mov    DWORD PTR [ebp-0x2c],edi
  402054:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  402058:	8b 73 04             	mov    esi,DWORD PTR [ebx+0x4]
  40205b:	8b 13                	mov    edx,DWORD PTR [ebx]
  40205d:	83 c3 08             	add    ebx,0x8
  402060:	8b be 00 00 40 00    	mov    edi,DWORD PTR [esi+0x400000]
  402066:	8d 86 00 00 40 00    	lea    eax,[esi+0x400000]
  40206c:	01 d7                	add    edi,edx
  40206e:	e8 ad fc ff ff       	call   401d20 <_mark_section_writable>
  402073:	89 be 00 00 40 00    	mov    DWORD PTR [esi+0x400000],edi
  402079:	81 fb c4 44 40 00    	cmp    ebx,0x4044c4
  40207f:	72 d7                	jb     402058 <__pei386_runtime_relocator+0x1d8>
  402081:	8b 7d d4             	mov    edi,DWORD PTR [ebp-0x2c]
  402084:	a1 5c 50 40 00       	mov    eax,ds:0x40505c
  402089:	85 c0                	test   eax,eax
  40208b:	0f 8e 02 fe ff ff    	jle    401e93 <__pei386_runtime_relocator+0x13>
  402091:	8b 1d f8 60 40 00    	mov    ebx,DWORD PTR ds:0x4060f8
  402097:	8d 75 e4             	lea    esi,[ebp-0x1c]
  40209a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4020a0:	8b 15 60 50 40 00    	mov    edx,DWORD PTR ds:0x405060
  4020a6:	8d 04 bf             	lea    eax,[edi+edi*4]
  4020a9:	8d 04 82             	lea    eax,[edx+eax*4]
  4020ac:	8b 10                	mov    edx,DWORD PTR [eax]
  4020ae:	85 d2                	test   edx,edx
  4020b0:	74 1a                	je     4020cc <__pei386_runtime_relocator+0x24c>
  4020b2:	89 74 24 0c          	mov    DWORD PTR [esp+0xc],esi
  4020b6:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  4020ba:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
  4020bd:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  4020c1:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  4020c4:	89 04 24             	mov    DWORD PTR [esp],eax
  4020c7:	ff d3                	call   ebx
  4020c9:	83 ec 10             	sub    esp,0x10
  4020cc:	83 c7 01             	add    edi,0x1
  4020cf:	3b 3d 5c 50 40 00    	cmp    edi,DWORD PTR ds:0x40505c
  4020d5:	7c c9                	jl     4020a0 <__pei386_runtime_relocator+0x220>
  4020d7:	8d 65 f4             	lea    esp,[ebp-0xc]
  4020da:	5b                   	pop    ebx
  4020db:	5e                   	pop    esi
  4020dc:	5f                   	pop    edi
  4020dd:	5d                   	pop    ebp
  4020de:	c3                   	ret    
  4020df:	bb c4 44 40 00       	mov    ebx,0x4044c4
  4020e4:	e9 21 fe ff ff       	jmp    401f0a <__pei386_runtime_relocator+0x8a>
  4020e9:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4020ed:	c7 04 24 20 42 40 00 	mov    DWORD PTR [esp],0x404220
  4020f4:	e8 c7 fb ff ff       	call   401cc0 <___report_error>
  4020f9:	90                   	nop
  4020fa:	90                   	nop
  4020fb:	90                   	nop
  4020fc:	90                   	nop
  4020fd:	90                   	nop
  4020fe:	90                   	nop
  4020ff:	90                   	nop

00402100 <___mingw_raise_matherr>:
  402100:	83 ec 3c             	sub    esp,0x3c
  402103:	a1 64 50 40 00       	mov    eax,ds:0x405064
  402108:	dd 44 24 48          	fld    QWORD PTR [esp+0x48]
  40210c:	dd 44 24 50          	fld    QWORD PTR [esp+0x50]
  402110:	dd 44 24 58          	fld    QWORD PTR [esp+0x58]
  402114:	85 c0                	test   eax,eax
  402116:	74 30                	je     402148 <___mingw_raise_matherr+0x48>
  402118:	d9 ca                	fxch   st(2)
  40211a:	8b 54 24 40          	mov    edx,DWORD PTR [esp+0x40]
  40211e:	dd 5c 24 18          	fstp   QWORD PTR [esp+0x18]
  402122:	dd 5c 24 20          	fstp   QWORD PTR [esp+0x20]
  402126:	89 54 24 10          	mov    DWORD PTR [esp+0x10],edx
  40212a:	8b 54 24 44          	mov    edx,DWORD PTR [esp+0x44]
  40212e:	dd 5c 24 28          	fstp   QWORD PTR [esp+0x28]
  402132:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
  402136:	8d 54 24 10          	lea    edx,[esp+0x10]
  40213a:	89 14 24             	mov    DWORD PTR [esp],edx
  40213d:	ff d0                	call   eax
  40213f:	eb 0d                	jmp    40214e <___mingw_raise_matherr+0x4e>
  402141:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  402148:	dd d8                	fstp   st(0)
  40214a:	dd d8                	fstp   st(0)
  40214c:	dd d8                	fstp   st(0)
  40214e:	83 c4 3c             	add    esp,0x3c
  402151:	c3                   	ret    
  402152:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  402159:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00402160 <___mingw_setusermatherr>:
  402160:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  402164:	a3 64 50 40 00       	mov    ds:0x405064,eax
  402169:	e9 ae 08 00 00       	jmp    402a1c <___setusermatherr>
  40216e:	90                   	nop
  40216f:	90                   	nop

00402170 <__gnu_exception_handler@4>:
  402170:	53                   	push   ebx
  402171:	83 ec 18             	sub    esp,0x18
  402174:	8b 5c 24 20          	mov    ebx,DWORD PTR [esp+0x20]
  402178:	8b 03                	mov    eax,DWORD PTR [ebx]
  40217a:	8b 00                	mov    eax,DWORD PTR [eax]
  40217c:	3d 93 00 00 c0       	cmp    eax,0xc0000093
  402181:	74 1d                	je     4021a0 <__gnu_exception_handler@4+0x30>
  402183:	77 5b                	ja     4021e0 <__gnu_exception_handler@4+0x70>
  402185:	3d 1d 00 00 c0       	cmp    eax,0xc000001d
  40218a:	0f 84 db 00 00 00    	je     40226b <__gnu_exception_handler@4+0xfb>
  402190:	0f 86 8a 00 00 00    	jbe    402220 <__gnu_exception_handler@4+0xb0>
  402196:	05 73 ff ff 3f       	add    eax,0x3fffff73
  40219b:	83 f8 04             	cmp    eax,0x4
  40219e:	77 25                	ja     4021c5 <__gnu_exception_handler@4+0x55>
  4021a0:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  4021a7:	00 
  4021a8:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  4021af:	e8 00 08 00 00       	call   4029b4 <_signal>
  4021b4:	83 f8 01             	cmp    eax,0x1
  4021b7:	0f 84 f3 00 00 00    	je     4022b0 <__gnu_exception_handler@4+0x140>
  4021bd:	85 c0                	test   eax,eax
  4021bf:	0f 85 0b 01 00 00    	jne    4022d0 <__gnu_exception_handler@4+0x160>
  4021c5:	a1 6c 50 40 00       	mov    eax,ds:0x40506c
  4021ca:	85 c0                	test   eax,eax
  4021cc:	0f 84 ce 00 00 00    	je     4022a0 <__gnu_exception_handler@4+0x130>
  4021d2:	89 5c 24 20          	mov    DWORD PTR [esp+0x20],ebx
  4021d6:	83 c4 18             	add    esp,0x18
  4021d9:	5b                   	pop    ebx
  4021da:	ff e0                	jmp    eax
  4021dc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4021e0:	3d 94 00 00 c0       	cmp    eax,0xc0000094
  4021e5:	75 79                	jne    402260 <__gnu_exception_handler@4+0xf0>
  4021e7:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  4021ee:	00 
  4021ef:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  4021f6:	e8 b9 07 00 00       	call   4029b4 <_signal>
  4021fb:	83 f8 01             	cmp    eax,0x1
  4021fe:	75 bd                	jne    4021bd <__gnu_exception_handler@4+0x4d>
  402200:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  402207:	00 
  402208:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  40220f:	e8 a0 07 00 00       	call   4029b4 <_signal>
  402214:	b8 ff ff ff ff       	mov    eax,0xffffffff
  402219:	e9 84 00 00 00       	jmp    4022a2 <__gnu_exception_handler@4+0x132>
  40221e:	66 90                	xchg   ax,ax
  402220:	3d 05 00 00 c0       	cmp    eax,0xc0000005
  402225:	75 9e                	jne    4021c5 <__gnu_exception_handler@4+0x55>
  402227:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  40222e:	00 
  40222f:	c7 04 24 0b 00 00 00 	mov    DWORD PTR [esp],0xb
  402236:	e8 79 07 00 00       	call   4029b4 <_signal>
  40223b:	83 f8 01             	cmp    eax,0x1
  40223e:	0f 84 9c 00 00 00    	je     4022e0 <__gnu_exception_handler@4+0x170>
  402244:	85 c0                	test   eax,eax
  402246:	0f 84 79 ff ff ff    	je     4021c5 <__gnu_exception_handler@4+0x55>
  40224c:	c7 04 24 0b 00 00 00 	mov    DWORD PTR [esp],0xb
  402253:	ff d0                	call   eax
  402255:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40225a:	eb 46                	jmp    4022a2 <__gnu_exception_handler@4+0x132>
  40225c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  402260:	3d 96 00 00 c0       	cmp    eax,0xc0000096
  402265:	0f 85 5a ff ff ff    	jne    4021c5 <__gnu_exception_handler@4+0x55>
  40226b:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  402272:	00 
  402273:	c7 04 24 04 00 00 00 	mov    DWORD PTR [esp],0x4
  40227a:	e8 35 07 00 00       	call   4029b4 <_signal>
  40227f:	83 f8 01             	cmp    eax,0x1
  402282:	74 75                	je     4022f9 <__gnu_exception_handler@4+0x189>
  402284:	85 c0                	test   eax,eax
  402286:	0f 84 39 ff ff ff    	je     4021c5 <__gnu_exception_handler@4+0x55>
  40228c:	c7 04 24 04 00 00 00 	mov    DWORD PTR [esp],0x4
  402293:	ff d0                	call   eax
  402295:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40229a:	eb 06                	jmp    4022a2 <__gnu_exception_handler@4+0x132>
  40229c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4022a0:	31 c0                	xor    eax,eax
  4022a2:	83 c4 18             	add    esp,0x18
  4022a5:	5b                   	pop    ebx
  4022a6:	c2 04 00             	ret    0x4
  4022a9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4022b0:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  4022b7:	00 
  4022b8:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  4022bf:	e8 f0 06 00 00       	call   4029b4 <_signal>
  4022c4:	e8 e7 f9 ff ff       	call   401cb0 <__fpreset>
  4022c9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4022ce:	eb d2                	jmp    4022a2 <__gnu_exception_handler@4+0x132>
  4022d0:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  4022d7:	ff d0                	call   eax
  4022d9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4022de:	eb c2                	jmp    4022a2 <__gnu_exception_handler@4+0x132>
  4022e0:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  4022e7:	00 
  4022e8:	c7 04 24 0b 00 00 00 	mov    DWORD PTR [esp],0xb
  4022ef:	e8 c0 06 00 00       	call   4029b4 <_signal>
  4022f4:	83 c8 ff             	or     eax,0xffffffff
  4022f7:	eb a9                	jmp    4022a2 <__gnu_exception_handler@4+0x132>
  4022f9:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  402300:	00 
  402301:	c7 04 24 04 00 00 00 	mov    DWORD PTR [esp],0x4
  402308:	e8 a7 06 00 00       	call   4029b4 <_signal>
  40230d:	83 c8 ff             	or     eax,0xffffffff
  402310:	eb 90                	jmp    4022a2 <__gnu_exception_handler@4+0x132>
  402312:	90                   	nop
  402313:	90                   	nop
  402314:	90                   	nop
  402315:	90                   	nop
  402316:	90                   	nop
  402317:	90                   	nop
  402318:	90                   	nop
  402319:	90                   	nop
  40231a:	90                   	nop
  40231b:	90                   	nop
  40231c:	90                   	nop
  40231d:	90                   	nop
  40231e:	90                   	nop
  40231f:	90                   	nop

00402320 <___mingwthr_run_key_dtors.part.0>:
  402320:	55                   	push   ebp
  402321:	57                   	push   edi
  402322:	56                   	push   esi
  402323:	53                   	push   ebx
  402324:	83 ec 1c             	sub    esp,0x1c
  402327:	c7 04 24 78 50 40 00 	mov    DWORD PTR [esp],0x405078
  40232e:	ff 15 d8 60 40 00    	call   DWORD PTR ds:0x4060d8
  402334:	8b 1d 70 50 40 00    	mov    ebx,DWORD PTR ds:0x405070
  40233a:	83 ec 04             	sub    esp,0x4
  40233d:	85 db                	test   ebx,ebx
  40233f:	74 34                	je     402375 <___mingwthr_run_key_dtors.part.0+0x55>
  402341:	8b 2d f4 60 40 00    	mov    ebp,DWORD PTR ds:0x4060f4
  402347:	8b 3d dc 60 40 00    	mov    edi,DWORD PTR ds:0x4060dc
  40234d:	8d 76 00             	lea    esi,[esi+0x0]
  402350:	8b 03                	mov    eax,DWORD PTR [ebx]
  402352:	89 04 24             	mov    DWORD PTR [esp],eax
  402355:	ff d5                	call   ebp
  402357:	83 ec 04             	sub    esp,0x4
  40235a:	89 c6                	mov    esi,eax
  40235c:	ff d7                	call   edi
  40235e:	85 c0                	test   eax,eax
  402360:	75 0c                	jne    40236e <___mingwthr_run_key_dtors.part.0+0x4e>
  402362:	85 f6                	test   esi,esi
  402364:	74 08                	je     40236e <___mingwthr_run_key_dtors.part.0+0x4e>
  402366:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  402369:	89 34 24             	mov    DWORD PTR [esp],esi
  40236c:	ff d0                	call   eax
  40236e:	8b 5b 08             	mov    ebx,DWORD PTR [ebx+0x8]
  402371:	85 db                	test   ebx,ebx
  402373:	75 db                	jne    402350 <___mingwthr_run_key_dtors.part.0+0x30>
  402375:	c7 04 24 78 50 40 00 	mov    DWORD PTR [esp],0x405078
  40237c:	ff 15 e8 60 40 00    	call   DWORD PTR ds:0x4060e8
  402382:	83 ec 04             	sub    esp,0x4
  402385:	83 c4 1c             	add    esp,0x1c
  402388:	5b                   	pop    ebx
  402389:	5e                   	pop    esi
  40238a:	5f                   	pop    edi
  40238b:	5d                   	pop    ebp
  40238c:	c3                   	ret    
  40238d:	8d 76 00             	lea    esi,[esi+0x0]

00402390 <____w64_mingwthr_add_key_dtor>:
  402390:	a1 74 50 40 00       	mov    eax,ds:0x405074
  402395:	85 c0                	test   eax,eax
  402397:	75 07                	jne    4023a0 <____w64_mingwthr_add_key_dtor+0x10>
  402399:	c3                   	ret    
  40239a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4023a0:	53                   	push   ebx
  4023a1:	83 ec 18             	sub    esp,0x18
  4023a4:	c7 44 24 04 0c 00 00 	mov    DWORD PTR [esp+0x4],0xc
  4023ab:	00 
  4023ac:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  4023b3:	e8 34 06 00 00       	call   4029ec <_calloc>
  4023b8:	89 c3                	mov    ebx,eax
  4023ba:	85 c0                	test   eax,eax
  4023bc:	74 42                	je     402400 <____w64_mingwthr_add_key_dtor+0x70>
  4023be:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  4023c2:	c7 04 24 78 50 40 00 	mov    DWORD PTR [esp],0x405078
  4023c9:	89 03                	mov    DWORD PTR [ebx],eax
  4023cb:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  4023cf:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
  4023d2:	ff 15 d8 60 40 00    	call   DWORD PTR ds:0x4060d8
  4023d8:	a1 70 50 40 00       	mov    eax,ds:0x405070
  4023dd:	89 1d 70 50 40 00    	mov    DWORD PTR ds:0x405070,ebx
  4023e3:	83 ec 04             	sub    esp,0x4
  4023e6:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  4023e9:	c7 04 24 78 50 40 00 	mov    DWORD PTR [esp],0x405078
  4023f0:	ff 15 e8 60 40 00    	call   DWORD PTR ds:0x4060e8
  4023f6:	31 c0                	xor    eax,eax
  4023f8:	83 ec 04             	sub    esp,0x4
  4023fb:	83 c4 18             	add    esp,0x18
  4023fe:	5b                   	pop    ebx
  4023ff:	c3                   	ret    
  402400:	83 c8 ff             	or     eax,0xffffffff
  402403:	eb f6                	jmp    4023fb <____w64_mingwthr_add_key_dtor+0x6b>
  402405:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  40240c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00402410 <____w64_mingwthr_remove_key_dtor>:
  402410:	53                   	push   ebx
  402411:	83 ec 18             	sub    esp,0x18
  402414:	a1 74 50 40 00       	mov    eax,ds:0x405074
  402419:	8b 5c 24 20          	mov    ebx,DWORD PTR [esp+0x20]
  40241d:	85 c0                	test   eax,eax
  40241f:	75 0f                	jne    402430 <____w64_mingwthr_remove_key_dtor+0x20>
  402421:	83 c4 18             	add    esp,0x18
  402424:	31 c0                	xor    eax,eax
  402426:	5b                   	pop    ebx
  402427:	c3                   	ret    
  402428:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  40242f:	90                   	nop
  402430:	c7 04 24 78 50 40 00 	mov    DWORD PTR [esp],0x405078
  402437:	ff 15 d8 60 40 00    	call   DWORD PTR ds:0x4060d8
  40243d:	a1 70 50 40 00       	mov    eax,ds:0x405070
  402442:	83 ec 04             	sub    esp,0x4
  402445:	85 c0                	test   eax,eax
  402447:	74 27                	je     402470 <____w64_mingwthr_remove_key_dtor+0x60>
  402449:	31 c9                	xor    ecx,ecx
  40244b:	eb 0b                	jmp    402458 <____w64_mingwthr_remove_key_dtor+0x48>
  40244d:	8d 76 00             	lea    esi,[esi+0x0]
  402450:	89 c1                	mov    ecx,eax
  402452:	85 d2                	test   edx,edx
  402454:	74 1a                	je     402470 <____w64_mingwthr_remove_key_dtor+0x60>
  402456:	89 d0                	mov    eax,edx
  402458:	8b 10                	mov    edx,DWORD PTR [eax]
  40245a:	39 da                	cmp    edx,ebx
  40245c:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
  40245f:	75 ef                	jne    402450 <____w64_mingwthr_remove_key_dtor+0x40>
  402461:	85 c9                	test   ecx,ecx
  402463:	74 2b                	je     402490 <____w64_mingwthr_remove_key_dtor+0x80>
  402465:	89 51 08             	mov    DWORD PTR [ecx+0x8],edx
  402468:	89 04 24             	mov    DWORD PTR [esp],eax
  40246b:	e8 64 05 00 00       	call   4029d4 <_free>
  402470:	c7 04 24 78 50 40 00 	mov    DWORD PTR [esp],0x405078
  402477:	ff 15 e8 60 40 00    	call   DWORD PTR ds:0x4060e8
  40247d:	31 c0                	xor    eax,eax
  40247f:	83 ec 04             	sub    esp,0x4
  402482:	83 c4 18             	add    esp,0x18
  402485:	5b                   	pop    ebx
  402486:	c3                   	ret    
  402487:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  40248e:	66 90                	xchg   ax,ax
  402490:	89 15 70 50 40 00    	mov    DWORD PTR ds:0x405070,edx
  402496:	eb d0                	jmp    402468 <____w64_mingwthr_remove_key_dtor+0x58>
  402498:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  40249f:	90                   	nop

004024a0 <___mingw_TLScallback>:
  4024a0:	53                   	push   ebx
  4024a1:	83 ec 18             	sub    esp,0x18
  4024a4:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  4024a8:	83 f8 02             	cmp    eax,0x2
  4024ab:	74 43                	je     4024f0 <___mingw_TLScallback+0x50>
  4024ad:	77 29                	ja     4024d8 <___mingw_TLScallback+0x38>
  4024af:	85 c0                	test   eax,eax
  4024b1:	74 4d                	je     402500 <___mingw_TLScallback+0x60>
  4024b3:	a1 74 50 40 00       	mov    eax,ds:0x405074
  4024b8:	85 c0                	test   eax,eax
  4024ba:	0f 84 b0 00 00 00    	je     402570 <___mingw_TLScallback+0xd0>
  4024c0:	c7 05 74 50 40 00 01 	mov    DWORD PTR ds:0x405074,0x1
  4024c7:	00 00 00 
  4024ca:	83 c4 18             	add    esp,0x18
  4024cd:	b8 01 00 00 00       	mov    eax,0x1
  4024d2:	5b                   	pop    ebx
  4024d3:	c3                   	ret    
  4024d4:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4024d8:	83 f8 03             	cmp    eax,0x3
  4024db:	75 ed                	jne    4024ca <___mingw_TLScallback+0x2a>
  4024dd:	a1 74 50 40 00       	mov    eax,ds:0x405074
  4024e2:	85 c0                	test   eax,eax
  4024e4:	74 e4                	je     4024ca <___mingw_TLScallback+0x2a>
  4024e6:	e8 35 fe ff ff       	call   402320 <___mingwthr_run_key_dtors.part.0>
  4024eb:	eb dd                	jmp    4024ca <___mingw_TLScallback+0x2a>
  4024ed:	8d 76 00             	lea    esi,[esi+0x0]
  4024f0:	e8 bb f7 ff ff       	call   401cb0 <__fpreset>
  4024f5:	83 c4 18             	add    esp,0x18
  4024f8:	b8 01 00 00 00       	mov    eax,0x1
  4024fd:	5b                   	pop    ebx
  4024fe:	c3                   	ret    
  4024ff:	90                   	nop
  402500:	a1 74 50 40 00       	mov    eax,ds:0x405074
  402505:	85 c0                	test   eax,eax
  402507:	75 57                	jne    402560 <___mingw_TLScallback+0xc0>
  402509:	a1 74 50 40 00       	mov    eax,ds:0x405074
  40250e:	83 f8 01             	cmp    eax,0x1
  402511:	75 b7                	jne    4024ca <___mingw_TLScallback+0x2a>
  402513:	8b 1d 70 50 40 00    	mov    ebx,DWORD PTR ds:0x405070
  402519:	85 db                	test   ebx,ebx
  40251b:	74 14                	je     402531 <___mingw_TLScallback+0x91>
  40251d:	8d 76 00             	lea    esi,[esi+0x0]
  402520:	89 d8                	mov    eax,ebx
  402522:	8b 5b 08             	mov    ebx,DWORD PTR [ebx+0x8]
  402525:	89 04 24             	mov    DWORD PTR [esp],eax
  402528:	e8 a7 04 00 00       	call   4029d4 <_free>
  40252d:	85 db                	test   ebx,ebx
  40252f:	75 ef                	jne    402520 <___mingw_TLScallback+0x80>
  402531:	c7 05 70 50 40 00 00 	mov    DWORD PTR ds:0x405070,0x0
  402538:	00 00 00 
  40253b:	c7 05 74 50 40 00 00 	mov    DWORD PTR ds:0x405074,0x0
  402542:	00 00 00 
  402545:	c7 04 24 78 50 40 00 	mov    DWORD PTR [esp],0x405078
  40254c:	ff 15 d4 60 40 00    	call   DWORD PTR ds:0x4060d4
  402552:	83 ec 04             	sub    esp,0x4
  402555:	e9 70 ff ff ff       	jmp    4024ca <___mingw_TLScallback+0x2a>
  40255a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  402560:	e8 bb fd ff ff       	call   402320 <___mingwthr_run_key_dtors.part.0>
  402565:	eb a2                	jmp    402509 <___mingw_TLScallback+0x69>
  402567:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  40256e:	66 90                	xchg   ax,ax
  402570:	c7 04 24 78 50 40 00 	mov    DWORD PTR [esp],0x405078
  402577:	ff 15 e4 60 40 00    	call   DWORD PTR ds:0x4060e4
  40257d:	83 ec 04             	sub    esp,0x4
  402580:	e9 3b ff ff ff       	jmp    4024c0 <___mingw_TLScallback+0x20>
  402585:	90                   	nop
  402586:	90                   	nop
  402587:	90                   	nop
  402588:	90                   	nop
  402589:	90                   	nop
  40258a:	90                   	nop
  40258b:	90                   	nop
  40258c:	90                   	nop
  40258d:	90                   	nop
  40258e:	90                   	nop
  40258f:	90                   	nop

00402590 <__ValidateImageBase>:
  402590:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  402594:	31 d2                	xor    edx,edx
  402596:	66 81 38 4d 5a       	cmp    WORD PTR [eax],0x5a4d
  40259b:	75 0b                	jne    4025a8 <__ValidateImageBase+0x18>
  40259d:	03 40 3c             	add    eax,DWORD PTR [eax+0x3c]
  4025a0:	81 38 50 45 00 00    	cmp    DWORD PTR [eax],0x4550
  4025a6:	74 08                	je     4025b0 <__ValidateImageBase+0x20>
  4025a8:	89 d0                	mov    eax,edx
  4025aa:	c3                   	ret    
  4025ab:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4025af:	90                   	nop
  4025b0:	31 d2                	xor    edx,edx
  4025b2:	66 81 78 18 0b 01    	cmp    WORD PTR [eax+0x18],0x10b
  4025b8:	0f 94 c2             	sete   dl
  4025bb:	89 d0                	mov    eax,edx
  4025bd:	c3                   	ret    
  4025be:	66 90                	xchg   ax,ax

004025c0 <__FindPESection>:
  4025c0:	56                   	push   esi
  4025c1:	53                   	push   ebx
  4025c2:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
  4025c6:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
  4025ca:	03 52 3c             	add    edx,DWORD PTR [edx+0x3c]
  4025cd:	0f b7 42 14          	movzx  eax,WORD PTR [edx+0x14]
  4025d1:	0f b7 72 06          	movzx  esi,WORD PTR [edx+0x6]
  4025d5:	8d 44 02 18          	lea    eax,[edx+eax*1+0x18]
  4025d9:	85 f6                	test   esi,esi
  4025db:	74 1b                	je     4025f8 <__FindPESection+0x38>
  4025dd:	31 c9                	xor    ecx,ecx
  4025df:	90                   	nop
  4025e0:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
  4025e3:	39 da                	cmp    edx,ebx
  4025e5:	77 07                	ja     4025ee <__FindPESection+0x2e>
  4025e7:	03 50 08             	add    edx,DWORD PTR [eax+0x8]
  4025ea:	39 da                	cmp    edx,ebx
  4025ec:	77 0c                	ja     4025fa <__FindPESection+0x3a>
  4025ee:	83 c1 01             	add    ecx,0x1
  4025f1:	83 c0 28             	add    eax,0x28
  4025f4:	39 f1                	cmp    ecx,esi
  4025f6:	75 e8                	jne    4025e0 <__FindPESection+0x20>
  4025f8:	31 c0                	xor    eax,eax
  4025fa:	5b                   	pop    ebx
  4025fb:	5e                   	pop    esi
  4025fc:	c3                   	ret    
  4025fd:	8d 76 00             	lea    esi,[esi+0x0]

00402600 <__FindPESectionByName>:
  402600:	55                   	push   ebp
  402601:	57                   	push   edi
  402602:	56                   	push   esi
  402603:	53                   	push   ebx
  402604:	31 db                	xor    ebx,ebx
  402606:	83 ec 1c             	sub    esp,0x1c
  402609:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  40260d:	89 3c 24             	mov    DWORD PTR [esp],edi
  402610:	e8 97 03 00 00       	call   4029ac <_strlen>
  402615:	83 f8 08             	cmp    eax,0x8
  402618:	77 68                	ja     402682 <__FindPESectionByName+0x82>
  40261a:	66 81 3d 00 00 40 00 	cmp    WORD PTR ds:0x400000,0x5a4d
  402621:	4d 5a 
  402623:	75 5d                	jne    402682 <__FindPESectionByName+0x82>
  402625:	8b 15 3c 00 40 00    	mov    edx,DWORD PTR ds:0x40003c
  40262b:	81 ba 00 00 40 00 50 	cmp    DWORD PTR [edx+0x400000],0x4550
  402632:	45 00 00 
  402635:	8d 82 00 00 40 00    	lea    eax,[edx+0x400000]
  40263b:	75 45                	jne    402682 <__FindPESectionByName+0x82>
  40263d:	66 81 ba 18 00 40 00 	cmp    WORD PTR [edx+0x400018],0x10b
  402644:	0b 01 
  402646:	75 3a                	jne    402682 <__FindPESectionByName+0x82>
  402648:	0f b7 92 14 00 40 00 	movzx  edx,WORD PTR [edx+0x400014]
  40264f:	0f b7 68 06          	movzx  ebp,WORD PTR [eax+0x6]
  402653:	8d 5c 10 18          	lea    ebx,[eax+edx*1+0x18]
  402657:	85 ed                	test   ebp,ebp
  402659:	74 35                	je     402690 <__FindPESectionByName+0x90>
  40265b:	31 f6                	xor    esi,esi
  40265d:	eb 0b                	jmp    40266a <__FindPESectionByName+0x6a>
  40265f:	90                   	nop
  402660:	83 c6 01             	add    esi,0x1
  402663:	83 c3 28             	add    ebx,0x28
  402666:	39 f5                	cmp    ebp,esi
  402668:	74 26                	je     402690 <__FindPESectionByName+0x90>
  40266a:	c7 44 24 08 08 00 00 	mov    DWORD PTR [esp+0x8],0x8
  402671:	00 
  402672:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  402676:	89 1c 24             	mov    DWORD PTR [esp],ebx
  402679:	e8 26 03 00 00       	call   4029a4 <_strncmp>
  40267e:	85 c0                	test   eax,eax
  402680:	75 de                	jne    402660 <__FindPESectionByName+0x60>
  402682:	83 c4 1c             	add    esp,0x1c
  402685:	89 d8                	mov    eax,ebx
  402687:	5b                   	pop    ebx
  402688:	5e                   	pop    esi
  402689:	5f                   	pop    edi
  40268a:	5d                   	pop    ebp
  40268b:	c3                   	ret    
  40268c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  402690:	83 c4 1c             	add    esp,0x1c
  402693:	31 db                	xor    ebx,ebx
  402695:	89 d8                	mov    eax,ebx
  402697:	5b                   	pop    ebx
  402698:	5e                   	pop    esi
  402699:	5f                   	pop    edi
  40269a:	5d                   	pop    ebp
  40269b:	c3                   	ret    
  40269c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

004026a0 <___mingw_GetSectionForAddress>:
  4026a0:	31 c0                	xor    eax,eax
  4026a2:	66 81 3d 00 00 40 00 	cmp    WORD PTR ds:0x400000,0x5a4d
  4026a9:	4d 5a 
  4026ab:	75 18                	jne    4026c5 <___mingw_GetSectionForAddress+0x25>
  4026ad:	8b 0d 3c 00 40 00    	mov    ecx,DWORD PTR ds:0x40003c
  4026b3:	81 b9 00 00 40 00 50 	cmp    DWORD PTR [ecx+0x400000],0x4550
  4026ba:	45 00 00 
  4026bd:	8d 91 00 00 40 00    	lea    edx,[ecx+0x400000]
  4026c3:	74 0b                	je     4026d0 <___mingw_GetSectionForAddress+0x30>
  4026c5:	c3                   	ret    
  4026c6:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4026cd:	8d 76 00             	lea    esi,[esi+0x0]
  4026d0:	66 81 b9 18 00 40 00 	cmp    WORD PTR [ecx+0x400018],0x10b
  4026d7:	0b 01 
  4026d9:	75 ea                	jne    4026c5 <___mingw_GetSectionForAddress+0x25>
  4026db:	56                   	push   esi
  4026dc:	0f b7 81 14 00 40 00 	movzx  eax,WORD PTR [ecx+0x400014]
  4026e3:	53                   	push   ebx
  4026e4:	0f b7 b1 06 00 40 00 	movzx  esi,WORD PTR [ecx+0x400006]
  4026eb:	8b 5c 24 0c          	mov    ebx,DWORD PTR [esp+0xc]
  4026ef:	8d 44 02 18          	lea    eax,[edx+eax*1+0x18]
  4026f3:	81 eb 00 00 40 00    	sub    ebx,0x400000
  4026f9:	85 f6                	test   esi,esi
  4026fb:	74 1b                	je     402718 <___mingw_GetSectionForAddress+0x78>
  4026fd:	31 c9                	xor    ecx,ecx
  4026ff:	90                   	nop
  402700:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
  402703:	39 d3                	cmp    ebx,edx
  402705:	72 07                	jb     40270e <___mingw_GetSectionForAddress+0x6e>
  402707:	03 50 08             	add    edx,DWORD PTR [eax+0x8]
  40270a:	39 d3                	cmp    ebx,edx
  40270c:	72 0c                	jb     40271a <___mingw_GetSectionForAddress+0x7a>
  40270e:	83 c1 01             	add    ecx,0x1
  402711:	83 c0 28             	add    eax,0x28
  402714:	39 f1                	cmp    ecx,esi
  402716:	75 e8                	jne    402700 <___mingw_GetSectionForAddress+0x60>
  402718:	31 c0                	xor    eax,eax
  40271a:	5b                   	pop    ebx
  40271b:	5e                   	pop    esi
  40271c:	c3                   	ret    
  40271d:	8d 76 00             	lea    esi,[esi+0x0]

00402720 <___mingw_GetSectionCount>:
  402720:	31 c0                	xor    eax,eax
  402722:	66 81 3d 00 00 40 00 	cmp    WORD PTR ds:0x400000,0x5a4d
  402729:	4d 5a 
  40272b:	75 12                	jne    40273f <___mingw_GetSectionCount+0x1f>
  40272d:	8b 15 3c 00 40 00    	mov    edx,DWORD PTR ds:0x40003c
  402733:	81 ba 00 00 40 00 50 	cmp    DWORD PTR [edx+0x400000],0x4550
  40273a:	45 00 00 
  40273d:	74 01                	je     402740 <___mingw_GetSectionCount+0x20>
  40273f:	c3                   	ret    
  402740:	66 81 ba 18 00 40 00 	cmp    WORD PTR [edx+0x400018],0x10b
  402747:	0b 01 
  402749:	75 f4                	jne    40273f <___mingw_GetSectionCount+0x1f>
  40274b:	0f b7 82 06 00 40 00 	movzx  eax,WORD PTR [edx+0x400006]
  402752:	c3                   	ret    
  402753:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  40275a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

00402760 <__FindPESectionExec>:
  402760:	31 c0                	xor    eax,eax
  402762:	53                   	push   ebx
  402763:	8b 4c 24 08          	mov    ecx,DWORD PTR [esp+0x8]
  402767:	66 81 3d 00 00 40 00 	cmp    WORD PTR ds:0x400000,0x5a4d
  40276e:	4d 5a 
  402770:	75 18                	jne    40278a <__FindPESectionExec+0x2a>
  402772:	8b 1d 3c 00 40 00    	mov    ebx,DWORD PTR ds:0x40003c
  402778:	81 bb 00 00 40 00 50 	cmp    DWORD PTR [ebx+0x400000],0x4550
  40277f:	45 00 00 
  402782:	8d 93 00 00 40 00    	lea    edx,[ebx+0x400000]
  402788:	74 06                	je     402790 <__FindPESectionExec+0x30>
  40278a:	5b                   	pop    ebx
  40278b:	c3                   	ret    
  40278c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  402790:	66 81 bb 18 00 40 00 	cmp    WORD PTR [ebx+0x400018],0x10b
  402797:	0b 01 
  402799:	75 ef                	jne    40278a <__FindPESectionExec+0x2a>
  40279b:	0f b7 83 14 00 40 00 	movzx  eax,WORD PTR [ebx+0x400014]
  4027a2:	0f b7 9b 06 00 40 00 	movzx  ebx,WORD PTR [ebx+0x400006]
  4027a9:	8d 44 02 18          	lea    eax,[edx+eax*1+0x18]
  4027ad:	85 db                	test   ebx,ebx
  4027af:	74 1e                	je     4027cf <__FindPESectionExec+0x6f>
  4027b1:	31 d2                	xor    edx,edx
  4027b3:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4027b7:	90                   	nop
  4027b8:	f6 40 27 20          	test   BYTE PTR [eax+0x27],0x20
  4027bc:	74 07                	je     4027c5 <__FindPESectionExec+0x65>
  4027be:	85 c9                	test   ecx,ecx
  4027c0:	74 c8                	je     40278a <__FindPESectionExec+0x2a>
  4027c2:	83 e9 01             	sub    ecx,0x1
  4027c5:	83 c2 01             	add    edx,0x1
  4027c8:	83 c0 28             	add    eax,0x28
  4027cb:	39 d3                	cmp    ebx,edx
  4027cd:	75 e9                	jne    4027b8 <__FindPESectionExec+0x58>
  4027cf:	31 c0                	xor    eax,eax
  4027d1:	5b                   	pop    ebx
  4027d2:	c3                   	ret    
  4027d3:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4027da:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

004027e0 <__GetPEImageBase>:
  4027e0:	31 c0                	xor    eax,eax
  4027e2:	66 81 3d 00 00 40 00 	cmp    WORD PTR ds:0x400000,0x5a4d
  4027e9:	4d 5a 
  4027eb:	75 12                	jne    4027ff <__GetPEImageBase+0x1f>
  4027ed:	8b 15 3c 00 40 00    	mov    edx,DWORD PTR ds:0x40003c
  4027f3:	81 ba 00 00 40 00 50 	cmp    DWORD PTR [edx+0x400000],0x4550
  4027fa:	45 00 00 
  4027fd:	74 01                	je     402800 <__GetPEImageBase+0x20>
  4027ff:	c3                   	ret    
  402800:	66 81 ba 18 00 40 00 	cmp    WORD PTR [edx+0x400018],0x10b
  402807:	0b 01 
  402809:	ba 00 00 40 00       	mov    edx,0x400000
  40280e:	0f 44 c2             	cmove  eax,edx
  402811:	c3                   	ret    
  402812:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  402819:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00402820 <__IsNonwritableInCurrentImage>:
  402820:	31 d2                	xor    edx,edx
  402822:	66 81 3d 00 00 40 00 	cmp    WORD PTR ds:0x400000,0x5a4d
  402829:	4d 5a 
  40282b:	75 17                	jne    402844 <__IsNonwritableInCurrentImage+0x24>
  40282d:	a1 3c 00 40 00       	mov    eax,ds:0x40003c
  402832:	81 b8 00 00 40 00 50 	cmp    DWORD PTR [eax+0x400000],0x4550
  402839:	45 00 00 
  40283c:	8d 88 00 00 40 00    	lea    ecx,[eax+0x400000]
  402842:	74 0c                	je     402850 <__IsNonwritableInCurrentImage+0x30>
  402844:	89 d0                	mov    eax,edx
  402846:	c3                   	ret    
  402847:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  40284e:	66 90                	xchg   ax,ax
  402850:	66 81 b8 18 00 40 00 	cmp    WORD PTR [eax+0x400018],0x10b
  402857:	0b 01 
  402859:	75 e9                	jne    402844 <__IsNonwritableInCurrentImage+0x24>
  40285b:	56                   	push   esi
  40285c:	0f b7 80 14 00 40 00 	movzx  eax,WORD PTR [eax+0x400014]
  402863:	53                   	push   ebx
  402864:	8b 5c 24 0c          	mov    ebx,DWORD PTR [esp+0xc]
  402868:	0f b7 71 06          	movzx  esi,WORD PTR [ecx+0x6]
  40286c:	8d 44 01 18          	lea    eax,[ecx+eax*1+0x18]
  402870:	81 eb 00 00 40 00    	sub    ebx,0x400000
  402876:	85 f6                	test   esi,esi
  402878:	74 20                	je     40289a <__IsNonwritableInCurrentImage+0x7a>
  40287a:	31 c9                	xor    ecx,ecx
  40287c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  402880:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
  402883:	39 d3                	cmp    ebx,edx
  402885:	72 07                	jb     40288e <__IsNonwritableInCurrentImage+0x6e>
  402887:	03 50 08             	add    edx,DWORD PTR [eax+0x8]
  40288a:	39 d3                	cmp    ebx,edx
  40288c:	72 12                	jb     4028a0 <__IsNonwritableInCurrentImage+0x80>
  40288e:	83 c1 01             	add    ecx,0x1
  402891:	83 c0 28             	add    eax,0x28
  402894:	39 ce                	cmp    esi,ecx
  402896:	75 e8                	jne    402880 <__IsNonwritableInCurrentImage+0x60>
  402898:	31 d2                	xor    edx,edx
  40289a:	89 d0                	mov    eax,edx
  40289c:	5b                   	pop    ebx
  40289d:	5e                   	pop    esi
  40289e:	c3                   	ret    
  40289f:	90                   	nop
  4028a0:	8b 50 24             	mov    edx,DWORD PTR [eax+0x24]
  4028a3:	5b                   	pop    ebx
  4028a4:	5e                   	pop    esi
  4028a5:	f7 d2                	not    edx
  4028a7:	c1 ea 1f             	shr    edx,0x1f
  4028aa:	89 d0                	mov    eax,edx
  4028ac:	c3                   	ret    
  4028ad:	8d 76 00             	lea    esi,[esi+0x0]

004028b0 <___mingw_enum_import_library_names>:
  4028b0:	31 c9                	xor    ecx,ecx
  4028b2:	57                   	push   edi
  4028b3:	66 81 3d 00 00 40 00 	cmp    WORD PTR ds:0x400000,0x5a4d
  4028ba:	4d 5a 
  4028bc:	56                   	push   esi
  4028bd:	53                   	push   ebx
  4028be:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
  4028c2:	75 17                	jne    4028db <___mingw_enum_import_library_names+0x2b>
  4028c4:	a1 3c 00 40 00       	mov    eax,ds:0x40003c
  4028c9:	81 b8 00 00 40 00 50 	cmp    DWORD PTR [eax+0x400000],0x4550
  4028d0:	45 00 00 
  4028d3:	8d b0 00 00 40 00    	lea    esi,[eax+0x400000]
  4028d9:	74 0d                	je     4028e8 <___mingw_enum_import_library_names+0x38>
  4028db:	5b                   	pop    ebx
  4028dc:	89 c8                	mov    eax,ecx
  4028de:	5e                   	pop    esi
  4028df:	5f                   	pop    edi
  4028e0:	c3                   	ret    
  4028e1:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4028e8:	66 81 b8 18 00 40 00 	cmp    WORD PTR [eax+0x400018],0x10b
  4028ef:	0b 01 
  4028f1:	75 e8                	jne    4028db <___mingw_enum_import_library_names+0x2b>
  4028f3:	8b 80 80 00 40 00    	mov    eax,DWORD PTR [eax+0x400080]
  4028f9:	85 c0                	test   eax,eax
  4028fb:	74 de                	je     4028db <___mingw_enum_import_library_names+0x2b>
  4028fd:	0f b7 56 14          	movzx  edx,WORD PTR [esi+0x14]
  402901:	0f b7 7e 06          	movzx  edi,WORD PTR [esi+0x6]
  402905:	8d 54 16 18          	lea    edx,[esi+edx*1+0x18]
  402909:	85 ff                	test   edi,edi
  40290b:	74 ce                	je     4028db <___mingw_enum_import_library_names+0x2b>
  40290d:	31 f6                	xor    esi,esi
  40290f:	90                   	nop
  402910:	8b 4a 0c             	mov    ecx,DWORD PTR [edx+0xc]
  402913:	39 c8                	cmp    eax,ecx
  402915:	72 07                	jb     40291e <___mingw_enum_import_library_names+0x6e>
  402917:	03 4a 08             	add    ecx,DWORD PTR [edx+0x8]
  40291a:	39 c8                	cmp    eax,ecx
  40291c:	72 12                	jb     402930 <___mingw_enum_import_library_names+0x80>
  40291e:	83 c6 01             	add    esi,0x1
  402921:	83 c2 28             	add    edx,0x28
  402924:	39 fe                	cmp    esi,edi
  402926:	75 e8                	jne    402910 <___mingw_enum_import_library_names+0x60>
  402928:	31 c9                	xor    ecx,ecx
  40292a:	5b                   	pop    ebx
  40292b:	5e                   	pop    esi
  40292c:	89 c8                	mov    eax,ecx
  40292e:	5f                   	pop    edi
  40292f:	c3                   	ret    
  402930:	05 00 00 40 00       	add    eax,0x400000
  402935:	eb 0f                	jmp    402946 <___mingw_enum_import_library_names+0x96>
  402937:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  40293e:	66 90                	xchg   ax,ax
  402940:	83 eb 01             	sub    ebx,0x1
  402943:	83 c0 14             	add    eax,0x14
  402946:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  402949:	85 c9                	test   ecx,ecx
  40294b:	75 07                	jne    402954 <___mingw_enum_import_library_names+0xa4>
  40294d:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
  402950:	85 d2                	test   edx,edx
  402952:	74 d4                	je     402928 <___mingw_enum_import_library_names+0x78>
  402954:	85 db                	test   ebx,ebx
  402956:	7f e8                	jg     402940 <___mingw_enum_import_library_names+0x90>
  402958:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
  40295b:	5b                   	pop    ebx
  40295c:	5e                   	pop    esi
  40295d:	5f                   	pop    edi
  40295e:	81 c1 00 00 40 00    	add    ecx,0x400000
  402964:	89 c8                	mov    eax,ecx
  402966:	c3                   	ret    
  402967:	90                   	nop
  402968:	90                   	nop
  402969:	90                   	nop
  40296a:	90                   	nop
  40296b:	90                   	nop
  40296c:	90                   	nop
  40296d:	90                   	nop
  40296e:	90                   	nop
  40296f:	90                   	nop

00402970 <___chkstk_ms>:
  402970:	51                   	push   ecx
  402971:	50                   	push   eax
  402972:	3d 00 10 00 00       	cmp    eax,0x1000
  402977:	8d 4c 24 0c          	lea    ecx,[esp+0xc]
  40297b:	72 15                	jb     402992 <___chkstk_ms+0x22>
  40297d:	81 e9 00 10 00 00    	sub    ecx,0x1000
  402983:	83 09 00             	or     DWORD PTR [ecx],0x0
  402986:	2d 00 10 00 00       	sub    eax,0x1000
  40298b:	3d 00 10 00 00       	cmp    eax,0x1000
  402990:	77 eb                	ja     40297d <___chkstk_ms+0xd>
  402992:	29 c1                	sub    ecx,eax
  402994:	83 09 00             	or     DWORD PTR [ecx],0x0
  402997:	58                   	pop    eax
  402998:	59                   	pop    ecx
  402999:	c3                   	ret    
  40299a:	90                   	nop
  40299b:	90                   	nop

0040299c <_vfprintf>:
  40299c:	ff 25 64 61 40 00    	jmp    DWORD PTR ds:0x406164
  4029a2:	90                   	nop
  4029a3:	90                   	nop

004029a4 <_strncmp>:
  4029a4:	ff 25 60 61 40 00    	jmp    DWORD PTR ds:0x406160
  4029aa:	90                   	nop
  4029ab:	90                   	nop

004029ac <_strlen>:
  4029ac:	ff 25 5c 61 40 00    	jmp    DWORD PTR ds:0x40615c
  4029b2:	90                   	nop
  4029b3:	90                   	nop

004029b4 <_signal>:
  4029b4:	ff 25 58 61 40 00    	jmp    DWORD PTR ds:0x406158
  4029ba:	90                   	nop
  4029bb:	90                   	nop

004029bc <_memcpy>:
  4029bc:	ff 25 54 61 40 00    	jmp    DWORD PTR ds:0x406154
  4029c2:	90                   	nop
  4029c3:	90                   	nop

004029c4 <_malloc>:
  4029c4:	ff 25 50 61 40 00    	jmp    DWORD PTR ds:0x406150
  4029ca:	90                   	nop
  4029cb:	90                   	nop

004029cc <_fwrite>:
  4029cc:	ff 25 4c 61 40 00    	jmp    DWORD PTR ds:0x40614c
  4029d2:	90                   	nop
  4029d3:	90                   	nop

004029d4 <_free>:
  4029d4:	ff 25 48 61 40 00    	jmp    DWORD PTR ds:0x406148
  4029da:	90                   	nop
  4029db:	90                   	nop

004029dc <_fprintf>:
  4029dc:	ff 25 44 61 40 00    	jmp    DWORD PTR ds:0x406144
  4029e2:	90                   	nop
  4029e3:	90                   	nop

004029e4 <_exit>:
  4029e4:	ff 25 40 61 40 00    	jmp    DWORD PTR ds:0x406140
  4029ea:	90                   	nop
  4029eb:	90                   	nop

004029ec <_calloc>:
  4029ec:	ff 25 3c 61 40 00    	jmp    DWORD PTR ds:0x40613c
  4029f2:	90                   	nop
  4029f3:	90                   	nop

004029f4 <_abort>:
  4029f4:	ff 25 38 61 40 00    	jmp    DWORD PTR ds:0x406138
  4029fa:	90                   	nop
  4029fb:	90                   	nop

004029fc <__onexit>:
  4029fc:	ff 25 34 61 40 00    	jmp    DWORD PTR ds:0x406134
  402a02:	90                   	nop
  402a03:	90                   	nop

00402a04 <__initterm>:
  402a04:	ff 25 2c 61 40 00    	jmp    DWORD PTR ds:0x40612c
  402a0a:	90                   	nop
  402a0b:	90                   	nop

00402a0c <__cexit>:
  402a0c:	ff 25 28 61 40 00    	jmp    DWORD PTR ds:0x406128
  402a12:	90                   	nop
  402a13:	90                   	nop

00402a14 <__amsg_exit>:
  402a14:	ff 25 24 61 40 00    	jmp    DWORD PTR ds:0x406124
  402a1a:	90                   	nop
  402a1b:	90                   	nop

00402a1c <___setusermatherr>:
  402a1c:	ff 25 20 61 40 00    	jmp    DWORD PTR ds:0x406120
  402a22:	90                   	nop
  402a23:	90                   	nop

00402a24 <___set_app_type>:
  402a24:	ff 25 1c 61 40 00    	jmp    DWORD PTR ds:0x40611c
  402a2a:	90                   	nop
  402a2b:	90                   	nop

00402a2c <___p__fmode>:
  402a2c:	ff 25 18 61 40 00    	jmp    DWORD PTR ds:0x406118
  402a32:	90                   	nop
  402a33:	90                   	nop

00402a34 <___p__commode>:
  402a34:	ff 25 14 61 40 00    	jmp    DWORD PTR ds:0x406114
  402a3a:	90                   	nop
  402a3b:	90                   	nop

00402a3c <___p__acmdln>:
  402a3c:	ff 25 10 61 40 00    	jmp    DWORD PTR ds:0x406110
  402a42:	90                   	nop
  402a43:	90                   	nop

00402a44 <___getmainargs>:
  402a44:	ff 25 04 61 40 00    	jmp    DWORD PTR ds:0x406104
  402a4a:	90                   	nop
  402a4b:	90                   	nop
  402a4c:	66 90                	xchg   ax,ax
  402a4e:	66 90                	xchg   ax,ax

00402a50 <___acrt_iob_func>:
  402a50:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  402a54:	c1 e0 05             	shl    eax,0x5
  402a57:	03 05 30 61 40 00    	add    eax,DWORD PTR ds:0x406130
  402a5d:	c3                   	ret    
  402a5e:	90                   	nop
  402a5f:	90                   	nop

00402a60 <__get_invalid_parameter_handler>:
  402a60:	a1 a4 50 40 00       	mov    eax,ds:0x4050a4
  402a65:	c3                   	ret    
  402a66:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  402a6d:	8d 76 00             	lea    esi,[esi+0x0]

00402a70 <__set_invalid_parameter_handler>:
  402a70:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  402a74:	87 05 a4 50 40 00    	xchg   DWORD PTR ds:0x4050a4,eax
  402a7a:	c3                   	ret    
  402a7b:	90                   	nop
  402a7c:	90                   	nop
  402a7d:	90                   	nop
  402a7e:	90                   	nop
  402a7f:	90                   	nop

00402a80 <_register_frame_ctor>:
  402a80:	e9 6b ea ff ff       	jmp    4014f0 <___gcc_register_frame>
  402a85:	90                   	nop
  402a86:	90                   	nop
  402a87:	90                   	nop
  402a88:	90                   	nop
  402a89:	90                   	nop
  402a8a:	90                   	nop
  402a8b:	90                   	nop
  402a8c:	90                   	nop
  402a8d:	90                   	nop
  402a8e:	90                   	nop
  402a8f:	90                   	nop

00402a90 <__CTOR_LIST__>:
  402a90:	ff                   	(bad)  
  402a91:	ff                   	(bad)  
  402a92:	ff                   	(bad)  
  402a93:	ff                   	.byte 0xff

00402a94 <.ctors.65535>:
  402a94:	80 2a 40             	sub    BYTE PTR [edx],0x40
  402a97:	00 00                	add    BYTE PTR [eax],al
  402a99:	00 00                	add    BYTE PTR [eax],al
	...

00402a9c <__DTOR_LIST__>:
  402a9c:	ff                   	(bad)  
  402a9d:	ff                   	(bad)  
  402a9e:	ff                   	(bad)  
  402a9f:	ff 00                	inc    DWORD PTR [eax]
  402aa1:	00 00                	add    BYTE PTR [eax],al
	...
