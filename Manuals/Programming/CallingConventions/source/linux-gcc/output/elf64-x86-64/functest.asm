
functest:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 d9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fd9]        # 3fe8 <__gmon_start__>
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 9a 2f 00 00    	push   QWORD PTR [rip+0x2f9a]        # 3fc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 9b 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f9b]        # 3fc8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nop    DWORD PTR [rax]
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <.plt>
    103f:	90                   	nop

Disassembly of section .plt.got:

0000000000001040 <__cxa_finalize@plt>:
    1040:	f3 0f 1e fa          	endbr64 
    1044:	f2 ff 25 ad 2f 00 00 	bnd jmp QWORD PTR [rip+0x2fad]        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    104b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .plt.sec:

0000000000001050 <__stack_chk_fail@plt>:
    1050:	f3 0f 1e fa          	endbr64 
    1054:	f2 ff 25 75 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f75]        # 3fd0 <__stack_chk_fail@GLIBC_2.4>
    105b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

0000000000001060 <_start>:
    1060:	f3 0f 1e fa          	endbr64 
    1064:	31 ed                	xor    ebp,ebp
    1066:	49 89 d1             	mov    r9,rdx
    1069:	5e                   	pop    rsi
    106a:	48 89 e2             	mov    rdx,rsp
    106d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    1071:	50                   	push   rax
    1072:	54                   	push   rsp
    1073:	4c 8d 05 d6 07 00 00 	lea    r8,[rip+0x7d6]        # 1850 <__libc_csu_fini>
    107a:	48 8d 0d 5f 07 00 00 	lea    rcx,[rip+0x75f]        # 17e0 <__libc_csu_init>
    1081:	48 8d 3d cd 06 00 00 	lea    rdi,[rip+0x6cd]        # 1755 <main>
    1088:	ff 15 52 2f 00 00    	call   QWORD PTR [rip+0x2f52]        # 3fe0 <__libc_start_main@GLIBC_2.2.5>
    108e:	f4                   	hlt    
    108f:	90                   	nop

0000000000001090 <deregister_tm_clones>:
    1090:	48 8d 3d 79 2f 00 00 	lea    rdi,[rip+0x2f79]        # 4010 <__TMC_END__>
    1097:	48 8d 05 72 2f 00 00 	lea    rax,[rip+0x2f72]        # 4010 <__TMC_END__>
    109e:	48 39 f8             	cmp    rax,rdi
    10a1:	74 15                	je     10b8 <deregister_tm_clones+0x28>
    10a3:	48 8b 05 2e 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f2e]        # 3fd8 <_ITM_deregisterTMCloneTable>
    10aa:	48 85 c0             	test   rax,rax
    10ad:	74 09                	je     10b8 <deregister_tm_clones+0x28>
    10af:	ff e0                	jmp    rax
    10b1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    10b8:	c3                   	ret    
    10b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000010c0 <register_tm_clones>:
    10c0:	48 8d 3d 49 2f 00 00 	lea    rdi,[rip+0x2f49]        # 4010 <__TMC_END__>
    10c7:	48 8d 35 42 2f 00 00 	lea    rsi,[rip+0x2f42]        # 4010 <__TMC_END__>
    10ce:	48 29 fe             	sub    rsi,rdi
    10d1:	48 89 f0             	mov    rax,rsi
    10d4:	48 c1 ee 3f          	shr    rsi,0x3f
    10d8:	48 c1 f8 03          	sar    rax,0x3
    10dc:	48 01 c6             	add    rsi,rax
    10df:	48 d1 fe             	sar    rsi,1
    10e2:	74 14                	je     10f8 <register_tm_clones+0x38>
    10e4:	48 8b 05 05 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f05]        # 3ff0 <_ITM_registerTMCloneTable>
    10eb:	48 85 c0             	test   rax,rax
    10ee:	74 08                	je     10f8 <register_tm_clones+0x38>
    10f0:	ff e0                	jmp    rax
    10f2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    10f8:	c3                   	ret    
    10f9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001100 <__do_global_dtors_aux>:
    1100:	f3 0f 1e fa          	endbr64 
    1104:	80 3d 05 2f 00 00 00 	cmp    BYTE PTR [rip+0x2f05],0x0        # 4010 <__TMC_END__>
    110b:	75 2b                	jne    1138 <__do_global_dtors_aux+0x38>
    110d:	55                   	push   rbp
    110e:	48 83 3d e2 2e 00 00 	cmp    QWORD PTR [rip+0x2ee2],0x0        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1115:	00 
    1116:	48 89 e5             	mov    rbp,rsp
    1119:	74 0c                	je     1127 <__do_global_dtors_aux+0x27>
    111b:	48 8b 3d e6 2e 00 00 	mov    rdi,QWORD PTR [rip+0x2ee6]        # 4008 <__dso_handle>
    1122:	e8 19 ff ff ff       	call   1040 <__cxa_finalize@plt>
    1127:	e8 64 ff ff ff       	call   1090 <deregister_tm_clones>
    112c:	c6 05 dd 2e 00 00 01 	mov    BYTE PTR [rip+0x2edd],0x1        # 4010 <__TMC_END__>
    1133:	5d                   	pop    rbp
    1134:	c3                   	ret    
    1135:	0f 1f 00             	nop    DWORD PTR [rax]
    1138:	c3                   	ret    
    1139:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001140 <frame_dummy>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	e9 77 ff ff ff       	jmp    10c0 <register_tm_clones>

0000000000001149 <funcintr>:
    1149:	f3 0f 1e fa          	endbr64 
    114d:	55                   	push   rbp
    114e:	48 89 e5             	mov    rbp,rsp
    1151:	b8 2a 00 00 00       	mov    eax,0x2a
    1156:	5d                   	pop    rbp
    1157:	c3                   	ret    

0000000000001158 <funcint64r>:
    1158:	f3 0f 1e fa          	endbr64 
    115c:	55                   	push   rbp
    115d:	48 89 e5             	mov    rbp,rsp
    1160:	48 b8 00 00 00 00 42 	movabs rax,0x4200000000
    1167:	00 00 00 
    116a:	5d                   	pop    rbp
    116b:	c3                   	ret    

000000000000116c <funcint64r2>:
    116c:	f3 0f 1e fa          	endbr64 
    1170:	55                   	push   rbp
    1171:	48 89 e5             	mov    rbp,rsp
    1174:	b8 2a 00 00 00       	mov    eax,0x2a
    1179:	5d                   	pop    rbp
    117a:	c3                   	ret    

000000000000117b <funcint>:
    117b:	f3 0f 1e fa          	endbr64 
    117f:	55                   	push   rbp
    1180:	48 89 e5             	mov    rbp,rsp
    1183:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    1186:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
    1189:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    118c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    118f:	8d 50 01             	lea    edx,[rax+0x1]
    1192:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
    1195:	83 c0 02             	add    eax,0x2
    1198:	0f af c2             	imul   eax,edx
    119b:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
    119e:	83 c2 03             	add    edx,0x3
    11a1:	0f af c2             	imul   eax,edx
    11a4:	5d                   	pop    rbp
    11a5:	c3                   	ret    

00000000000011a6 <funcchar>:
    11a6:	f3 0f 1e fa          	endbr64 
    11aa:	55                   	push   rbp
    11ab:	48 89 e5             	mov    rbp,rsp
    11ae:	89 fa                	mov    edx,edi
    11b0:	89 f0                	mov    eax,esi
    11b2:	88 55 fc             	mov    BYTE PTR [rbp-0x4],dl
    11b5:	88 45 f8             	mov    BYTE PTR [rbp-0x8],al
    11b8:	0f be 45 fc          	movsx  eax,BYTE PTR [rbp-0x4]
    11bc:	8d 50 01             	lea    edx,[rax+0x1]
    11bf:	0f be 45 f8          	movsx  eax,BYTE PTR [rbp-0x8]
    11c3:	83 c0 02             	add    eax,0x2
    11c6:	0f af c2             	imul   eax,edx
    11c9:	5d                   	pop    rbp
    11ca:	c3                   	ret    

00000000000011cb <funcfloat>:
    11cb:	f3 0f 1e fa          	endbr64 
    11cf:	55                   	push   rbp
    11d0:	48 89 e5             	mov    rbp,rsp
    11d3:	f3 0f 11 45 fc       	movss  DWORD PTR [rbp-0x4],xmm0
    11d8:	f3 0f 11 4d f8       	movss  DWORD PTR [rbp-0x8],xmm1
    11dd:	f3 0f 11 55 f4       	movss  DWORD PTR [rbp-0xc],xmm2
    11e2:	f3 0f 5a 4d fc       	cvtss2sd xmm1,DWORD PTR [rbp-0x4]
    11e7:	f2 0f 10 05 19 0e 00 	movsd  xmm0,QWORD PTR [rip+0xe19]        # 2008 <_IO_stdin_used+0x8>
    11ee:	00 
    11ef:	f2 0f 58 c8          	addsd  xmm1,xmm0
    11f3:	f3 0f 5a 55 f8       	cvtss2sd xmm2,DWORD PTR [rbp-0x8]
    11f8:	f2 0f 10 05 10 0e 00 	movsd  xmm0,QWORD PTR [rip+0xe10]        # 2010 <_IO_stdin_used+0x10>
    11ff:	00 
    1200:	f2 0f 58 c2          	addsd  xmm0,xmm2
    1204:	f2 0f 59 c8          	mulsd  xmm1,xmm0
    1208:	f3 0f 5a 55 f4       	cvtss2sd xmm2,DWORD PTR [rbp-0xc]
    120d:	f2 0f 10 05 03 0e 00 	movsd  xmm0,QWORD PTR [rip+0xe03]        # 2018 <_IO_stdin_used+0x18>
    1214:	00 
    1215:	f2 0f 58 c2          	addsd  xmm0,xmm2
    1219:	f2 0f 59 c1          	mulsd  xmm0,xmm1
    121d:	f2 0f 5a c0          	cvtsd2ss xmm0,xmm0
    1221:	5d                   	pop    rbp
    1222:	c3                   	ret    

0000000000001223 <funcfloatint>:
    1223:	f3 0f 1e fa          	endbr64 
    1227:	55                   	push   rbp
    1228:	48 89 e5             	mov    rbp,rsp
    122b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    122e:	f3 0f 11 45 f8       	movss  DWORD PTR [rbp-0x8],xmm0
    1233:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    1236:	f3 0f 11 4d f0       	movss  DWORD PTR [rbp-0x10],xmm1
    123b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    123e:	83 c0 01             	add    eax,0x1
    1241:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
    1245:	f3 0f 5a 55 f8       	cvtss2sd xmm2,DWORD PTR [rbp-0x8]
    124a:	f2 0f 10 05 be 0d 00 	movsd  xmm0,QWORD PTR [rip+0xdbe]        # 2010 <_IO_stdin_used+0x10>
    1251:	00 
    1252:	f2 0f 58 c2          	addsd  xmm0,xmm2
    1256:	f2 0f 59 c8          	mulsd  xmm1,xmm0
    125a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    125d:	83 c0 03             	add    eax,0x3
    1260:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
    1264:	f2 0f 59 c8          	mulsd  xmm1,xmm0
    1268:	f3 0f 5a 55 f0       	cvtss2sd xmm2,DWORD PTR [rbp-0x10]
    126d:	f2 0f 10 05 ab 0d 00 	movsd  xmm0,QWORD PTR [rip+0xdab]        # 2020 <_IO_stdin_used+0x20>
    1274:	00 
    1275:	f2 0f 58 c2          	addsd  xmm0,xmm2
    1279:	f2 0f 59 c1          	mulsd  xmm0,xmm1
    127d:	f2 0f 2c c0          	cvttsd2si eax,xmm0
    1281:	5d                   	pop    rbp
    1282:	c3                   	ret    

0000000000001283 <funcdouble>:
    1283:	f3 0f 1e fa          	endbr64 
    1287:	55                   	push   rbp
    1288:	48 89 e5             	mov    rbp,rsp
    128b:	f2 0f 11 45 f8       	movsd  QWORD PTR [rbp-0x8],xmm0
    1290:	f2 0f 11 4d f0       	movsd  QWORD PTR [rbp-0x10],xmm1
    1295:	f2 0f 10 4d f8       	movsd  xmm1,QWORD PTR [rbp-0x8]
    129a:	f2 0f 10 05 6e 0d 00 	movsd  xmm0,QWORD PTR [rip+0xd6e]        # 2010 <_IO_stdin_used+0x10>
    12a1:	00 
    12a2:	f2 0f 58 c8          	addsd  xmm1,xmm0
    12a6:	f2 0f 10 55 f0       	movsd  xmm2,QWORD PTR [rbp-0x10]
    12ab:	f2 0f 10 05 6d 0d 00 	movsd  xmm0,QWORD PTR [rip+0xd6d]        # 2020 <_IO_stdin_used+0x20>
    12b2:	00 
    12b3:	f2 0f 58 c2          	addsd  xmm0,xmm2
    12b7:	f2 0f 59 c1          	mulsd  xmm0,xmm1
    12bb:	5d                   	pop    rbp
    12bc:	c3                   	ret    

00000000000012bd <funcstructvalue>:
    12bd:	f3 0f 1e fa          	endbr64 
    12c1:	55                   	push   rbp
    12c2:	48 89 e5             	mov    rbp,rsp
    12c5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    12c9:	8b 55 10             	mov    edx,DWORD PTR [rbp+0x10]
    12cc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    12d0:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    12d3:	01 d0                	add    eax,edx
    12d5:	5d                   	pop    rbp
    12d6:	c3                   	ret    

00000000000012d7 <funcstructret>:
    12d7:	f3 0f 1e fa          	endbr64 
    12db:	55                   	push   rbp
    12dc:	48 89 e5             	mov    rbp,rsp
    12df:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    12e3:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    12e6:	89 55 d0             	mov    DWORD PTR [rbp-0x30],edx
    12e9:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    12f0:	00 
    12f1:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
    12f8:	00 
    12f9:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
    1300:	00 
    1301:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
    1304:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    1307:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
    130a:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    130d:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
    1311:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1315:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    1319:	48 89 01             	mov    QWORD PTR [rcx],rax
    131c:	48 89 51 08          	mov    QWORD PTR [rcx+0x8],rdx
    1320:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    1324:	48 89 41 10          	mov    QWORD PTR [rcx+0x10],rax
    1328:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    132c:	5d                   	pop    rbp
    132d:	c3                   	ret    

000000000000132e <funcvarargs>:
    132e:	f3 0f 1e fa          	endbr64 
    1332:	55                   	push   rbp
    1333:	48 89 e5             	mov    rbp,rsp
    1336:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
    133d:	89 bd 1c ff ff ff    	mov    DWORD PTR [rbp-0xe4],edi
    1343:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
    134a:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
    1351:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
    1358:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
    135f:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
    1366:	84 c0                	test   al,al
    1368:	74 20                	je     138a <funcvarargs+0x5c>
    136a:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
    136e:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
    1372:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
    1376:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
    137a:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
    137e:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
    1382:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
    1386:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    138a:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    1391:	00 00 
    1393:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    139a:	31 c0                	xor    eax,eax
    139c:	c7 85 30 ff ff ff 08 	mov    DWORD PTR [rbp-0xd0],0x8
    13a3:	00 00 00 
    13a6:	c7 85 34 ff ff ff 30 	mov    DWORD PTR [rbp-0xcc],0x30
    13ad:	00 00 00 
    13b0:	48 8d 45 10          	lea    rax,[rbp+0x10]
    13b4:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
    13bb:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
    13c2:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    13c9:	c7 85 2c ff ff ff 00 	mov    DWORD PTR [rbp-0xd4],0x0
    13d0:	00 00 00 
    13d3:	c7 85 28 ff ff ff 00 	mov    DWORD PTR [rbp-0xd8],0x0
    13da:	00 00 00 
    13dd:	eb 4f                	jmp    142e <funcvarargs+0x100>
    13df:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
    13e5:	83 f8 2f             	cmp    eax,0x2f
    13e8:	77 23                	ja     140d <funcvarargs+0xdf>
    13ea:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
    13f1:	8b 95 30 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd0]
    13f7:	89 d2                	mov    edx,edx
    13f9:	48 01 d0             	add    rax,rdx
    13fc:	8b 95 30 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd0]
    1402:	83 c2 08             	add    edx,0x8
    1405:	89 95 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],edx
    140b:	eb 12                	jmp    141f <funcvarargs+0xf1>
    140d:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
    1414:	48 8d 50 08          	lea    rdx,[rax+0x8]
    1418:	48 89 95 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rdx
    141f:	8b 00                	mov    eax,DWORD PTR [rax]
    1421:	01 85 2c ff ff ff    	add    DWORD PTR [rbp-0xd4],eax
    1427:	83 85 28 ff ff ff 01 	add    DWORD PTR [rbp-0xd8],0x1
    142e:	8b 85 28 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd8]
    1434:	3b 85 1c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xe4]
    143a:	7c a3                	jl     13df <funcvarargs+0xb1>
    143c:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
    1442:	48 8b 8d 48 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb8]
    1449:	64 48 33 0c 25 28 00 	xor    rcx,QWORD PTR fs:0x28
    1450:	00 00 
    1452:	74 05                	je     1459 <funcvarargs+0x12b>
    1454:	e8 f7 fb ff ff       	call   1050 <__stack_chk_fail@plt>
    1459:	c9                   	leave  
    145a:	c3                   	ret    

000000000000145b <test_funcintr>:
    145b:	f3 0f 1e fa          	endbr64 
    145f:	55                   	push   rbp
    1460:	48 89 e5             	mov    rbp,rsp
    1463:	48 83 ec 10          	sub    rsp,0x10
    1467:	e8 dd fc ff ff       	call   1149 <funcintr>
    146c:	83 c0 01             	add    eax,0x1
    146f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    1472:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    1475:	c9                   	leave  
    1476:	c3                   	ret    

0000000000001477 <test_funcint64r>:
    1477:	f3 0f 1e fa          	endbr64 
    147b:	55                   	push   rbp
    147c:	48 89 e5             	mov    rbp,rsp
    147f:	48 83 ec 10          	sub    rsp,0x10
    1483:	e8 d0 fc ff ff       	call   1158 <funcint64r>
    1488:	48 83 c0 01          	add    rax,0x1
    148c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1490:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1494:	c9                   	leave  
    1495:	c3                   	ret    

0000000000001496 <test_funcint64r2>:
    1496:	f3 0f 1e fa          	endbr64 
    149a:	55                   	push   rbp
    149b:	48 89 e5             	mov    rbp,rsp
    149e:	48 83 ec 10          	sub    rsp,0x10
    14a2:	e8 c5 fc ff ff       	call   116c <funcint64r2>
    14a7:	48 83 c0 01          	add    rax,0x1
    14ab:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    14af:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    14b3:	c9                   	leave  
    14b4:	c3                   	ret    

00000000000014b5 <test_funcint>:
    14b5:	f3 0f 1e fa          	endbr64 
    14b9:	55                   	push   rbp
    14ba:	48 89 e5             	mov    rbp,rsp
    14bd:	48 83 ec 10          	sub    rsp,0x10
    14c1:	ba 03 00 00 00       	mov    edx,0x3
    14c6:	be 02 00 00 00       	mov    esi,0x2
    14cb:	bf 01 00 00 00       	mov    edi,0x1
    14d0:	e8 a6 fc ff ff       	call   117b <funcint>
    14d5:	83 c0 01             	add    eax,0x1
    14d8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    14db:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    14de:	c9                   	leave  
    14df:	c3                   	ret    

00000000000014e0 <test_funcchar>:
    14e0:	f3 0f 1e fa          	endbr64 
    14e4:	55                   	push   rbp
    14e5:	48 89 e5             	mov    rbp,rsp
    14e8:	48 83 ec 10          	sub    rsp,0x10
    14ec:	be 02 00 00 00       	mov    esi,0x2
    14f1:	bf 01 00 00 00       	mov    edi,0x1
    14f6:	e8 ab fc ff ff       	call   11a6 <funcchar>
    14fb:	83 c0 01             	add    eax,0x1
    14fe:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    1501:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    1504:	c9                   	leave  
    1505:	c3                   	ret    

0000000000001506 <test_funcfloat>:
    1506:	f3 0f 1e fa          	endbr64 
    150a:	55                   	push   rbp
    150b:	48 89 e5             	mov    rbp,rsp
    150e:	48 83 ec 10          	sub    rsp,0x10
    1512:	f3 0f 10 15 0e 0b 00 	movss  xmm2,DWORD PTR [rip+0xb0e]        # 2028 <_IO_stdin_used+0x28>
    1519:	00 
    151a:	f3 0f 10 0d 0a 0b 00 	movss  xmm1,DWORD PTR [rip+0xb0a]        # 202c <_IO_stdin_used+0x2c>
    1521:	00 
    1522:	f3 0f 10 05 06 0b 00 	movss  xmm0,DWORD PTR [rip+0xb06]        # 2030 <_IO_stdin_used+0x30>
    1529:	00 
    152a:	e8 9c fc ff ff       	call   11cb <funcfloat>
    152f:	f3 0f 10 0d fd 0a 00 	movss  xmm1,DWORD PTR [rip+0xafd]        # 2034 <_IO_stdin_used+0x34>
    1536:	00 
    1537:	f3 0f 58 c1          	addss  xmm0,xmm1
    153b:	f3 0f 11 45 fc       	movss  DWORD PTR [rbp-0x4],xmm0
    1540:	f3 0f 10 45 fc       	movss  xmm0,DWORD PTR [rbp-0x4]
    1545:	f3 0f 2c c0          	cvttss2si eax,xmm0
    1549:	c9                   	leave  
    154a:	c3                   	ret    

000000000000154b <test_funcfloatint>:
    154b:	f3 0f 1e fa          	endbr64 
    154f:	55                   	push   rbp
    1550:	48 89 e5             	mov    rbp,rsp
    1553:	48 83 ec 10          	sub    rsp,0x10
    1557:	f3 0f 10 0d d5 0a 00 	movss  xmm1,DWORD PTR [rip+0xad5]        # 2034 <_IO_stdin_used+0x34>
    155e:	00 
    155f:	be 03 00 00 00       	mov    esi,0x3
    1564:	f3 0f 10 05 c0 0a 00 	movss  xmm0,DWORD PTR [rip+0xac0]        # 202c <_IO_stdin_used+0x2c>
    156b:	00 
    156c:	bf 01 00 00 00       	mov    edi,0x1
    1571:	e8 ad fc ff ff       	call   1223 <funcfloatint>
    1576:	83 c0 01             	add    eax,0x1
    1579:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    157c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    157f:	c9                   	leave  
    1580:	c3                   	ret    

0000000000001581 <test_funcdouble>:
    1581:	f3 0f 1e fa          	endbr64 
    1585:	55                   	push   rbp
    1586:	48 89 e5             	mov    rbp,rsp
    1589:	48 83 ec 10          	sub    rsp,0x10
    158d:	f2 0f 10 05 a3 0a 00 	movsd  xmm0,QWORD PTR [rip+0xaa3]        # 2038 <_IO_stdin_used+0x38>
    1594:	00 
    1595:	48 8b 05 a4 0a 00 00 	mov    rax,QWORD PTR [rip+0xaa4]        # 2040 <_IO_stdin_used+0x40>
    159c:	66 0f 28 c8          	movapd xmm1,xmm0
    15a0:	66 48 0f 6e c0       	movq   xmm0,rax
    15a5:	e8 d9 fc ff ff       	call   1283 <funcdouble>
    15aa:	f2 0f 10 0d 96 0a 00 	movsd  xmm1,QWORD PTR [rip+0xa96]        # 2048 <_IO_stdin_used+0x48>
    15b1:	00 
    15b2:	f2 0f 58 c1          	addsd  xmm0,xmm1
    15b6:	f2 0f 11 45 f8       	movsd  QWORD PTR [rbp-0x8],xmm0
    15bb:	f2 0f 10 45 f8       	movsd  xmm0,QWORD PTR [rbp-0x8]
    15c0:	f2 0f 2c c0          	cvttsd2si eax,xmm0
    15c4:	c9                   	leave  
    15c5:	c3                   	ret    

00000000000015c6 <test_funcstructvalue>:
    15c6:	f3 0f 1e fa          	endbr64 
    15ca:	55                   	push   rbp
    15cb:	48 89 e5             	mov    rbp,rsp
    15ce:	48 83 ec 50          	sub    rsp,0x50
    15d2:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    15d9:	00 00 
    15db:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    15df:	31 c0                	xor    eax,eax
    15e1:	c7 45 c0 01 00 00 00 	mov    DWORD PTR [rbp-0x40],0x1
    15e8:	c7 45 c4 02 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x2
    15ef:	c7 45 c8 03 00 00 00 	mov    DWORD PTR [rbp-0x38],0x3
    15f6:	c7 45 cc 04 00 00 00 	mov    DWORD PTR [rbp-0x34],0x4
    15fd:	c7 45 d0 05 00 00 00 	mov    DWORD PTR [rbp-0x30],0x5
    1604:	c7 45 d4 06 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x6
    160b:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    1612:	00 
    1613:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
    161a:	00 
    161b:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
    1622:	00 
    1623:	48 8d 45 e0          	lea    rax,[rbp-0x20]
    1627:	48 83 ec 08          	sub    rsp,0x8
    162b:	ff 75 d0             	push   QWORD PTR [rbp-0x30]
    162e:	ff 75 c8             	push   QWORD PTR [rbp-0x38]
    1631:	ff 75 c0             	push   QWORD PTR [rbp-0x40]
    1634:	48 89 c7             	mov    rdi,rax
    1637:	e8 81 fc ff ff       	call   12bd <funcstructvalue>
    163c:	48 83 c4 20          	add    rsp,0x20
    1640:	83 c0 01             	add    eax,0x1
    1643:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
    1646:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
    1649:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    164d:	64 48 33 14 25 28 00 	xor    rdx,QWORD PTR fs:0x28
    1654:	00 00 
    1656:	74 05                	je     165d <test_funcstructvalue+0x97>
    1658:	e8 f3 f9 ff ff       	call   1050 <__stack_chk_fail@plt>
    165d:	c9                   	leave  
    165e:	c3                   	ret    

000000000000165f <test_funcstructret>:
    165f:	f3 0f 1e fa          	endbr64 
    1663:	55                   	push   rbp
    1664:	48 89 e5             	mov    rbp,rsp
    1667:	48 83 ec 20          	sub    rsp,0x20
    166b:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    1672:	00 00 
    1674:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1678:	31 c0                	xor    eax,eax
    167a:	48 8d 45 e0          	lea    rax,[rbp-0x20]
    167e:	ba 02 00 00 00       	mov    edx,0x2
    1683:	be 01 00 00 00       	mov    esi,0x1
    1688:	48 89 c7             	mov    rdi,rax
    168b:	e8 47 fc ff ff       	call   12d7 <funcstructret>
    1690:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
    1693:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
    1697:	64 48 33 0c 25 28 00 	xor    rcx,QWORD PTR fs:0x28
    169e:	00 00 
    16a0:	74 05                	je     16a7 <test_funcstructret+0x48>
    16a2:	e8 a9 f9 ff ff       	call   1050 <__stack_chk_fail@plt>
    16a7:	c9                   	leave  
    16a8:	c3                   	ret    

00000000000016a9 <test_funcvarargs1>:
    16a9:	f3 0f 1e fa          	endbr64 
    16ad:	55                   	push   rbp
    16ae:	48 89 e5             	mov    rbp,rsp
    16b1:	48 83 ec 10          	sub    rsp,0x10
    16b5:	bf 01 00 00 00       	mov    edi,0x1
    16ba:	b8 00 00 00 00       	mov    eax,0x0
    16bf:	e8 6a fc ff ff       	call   132e <funcvarargs>
    16c4:	83 c0 01             	add    eax,0x1
    16c7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    16ca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    16cd:	c9                   	leave  
    16ce:	c3                   	ret    

00000000000016cf <test_funcvarargs4>:
    16cf:	f3 0f 1e fa          	endbr64 
    16d3:	55                   	push   rbp
    16d4:	48 89 e5             	mov    rbp,rsp
    16d7:	48 83 ec 10          	sub    rsp,0x10
    16db:	41 b8 04 00 00 00    	mov    r8d,0x4
    16e1:	b9 03 00 00 00       	mov    ecx,0x3
    16e6:	ba 02 00 00 00       	mov    edx,0x2
    16eb:	be 01 00 00 00       	mov    esi,0x1
    16f0:	bf 04 00 00 00       	mov    edi,0x4
    16f5:	b8 00 00 00 00       	mov    eax,0x0
    16fa:	e8 2f fc ff ff       	call   132e <funcvarargs>
    16ff:	83 c0 01             	add    eax,0x1
    1702:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    1705:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    1708:	c9                   	leave  
    1709:	c3                   	ret    

000000000000170a <test_funcvarargs6>:
    170a:	f3 0f 1e fa          	endbr64 
    170e:	55                   	push   rbp
    170f:	48 89 e5             	mov    rbp,rsp
    1712:	48 83 ec 10          	sub    rsp,0x10
    1716:	48 83 ec 08          	sub    rsp,0x8
    171a:	6a 0c                	push   0xc
    171c:	41 b9 0a 00 00 00    	mov    r9d,0xa
    1722:	41 b8 08 00 00 00    	mov    r8d,0x8
    1728:	b9 06 00 00 00       	mov    ecx,0x6
    172d:	ba 04 00 00 00       	mov    edx,0x4
    1732:	be 02 00 00 00       	mov    esi,0x2
    1737:	bf 06 00 00 00       	mov    edi,0x6
    173c:	b8 00 00 00 00       	mov    eax,0x0
    1741:	e8 e8 fb ff ff       	call   132e <funcvarargs>
    1746:	48 83 c4 10          	add    rsp,0x10
    174a:	83 c0 01             	add    eax,0x1
    174d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    1750:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    1753:	c9                   	leave  
    1754:	c3                   	ret    

0000000000001755 <main>:
    1755:	f3 0f 1e fa          	endbr64 
    1759:	55                   	push   rbp
    175a:	48 89 e5             	mov    rbp,rsp
    175d:	48 83 ec 10          	sub    rsp,0x10
    1761:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    1768:	e8 ee fc ff ff       	call   145b <test_funcintr>
    176d:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
    1770:	e8 02 fd ff ff       	call   1477 <test_funcint64r>
    1775:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
    1778:	e8 19 fd ff ff       	call   1496 <test_funcint64r2>
    177d:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
    1780:	e8 30 fd ff ff       	call   14b5 <test_funcint>
    1785:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
    1788:	e8 53 fd ff ff       	call   14e0 <test_funcchar>
    178d:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
    1790:	e8 71 fd ff ff       	call   1506 <test_funcfloat>
    1795:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
    1798:	e8 ae fd ff ff       	call   154b <test_funcfloatint>
    179d:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
    17a0:	e8 dc fd ff ff       	call   1581 <test_funcdouble>
    17a5:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
    17a8:	e8 19 fe ff ff       	call   15c6 <test_funcstructvalue>
    17ad:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
    17b0:	e8 aa fe ff ff       	call   165f <test_funcstructret>
    17b5:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
    17b8:	e8 ec fe ff ff       	call   16a9 <test_funcvarargs1>
    17bd:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
    17c0:	e8 0a ff ff ff       	call   16cf <test_funcvarargs4>
    17c5:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
    17c8:	e8 3d ff ff ff       	call   170a <test_funcvarargs6>
    17cd:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
    17d0:	b8 00 00 00 00       	mov    eax,0x0
    17d5:	c9                   	leave  
    17d6:	c3                   	ret    
    17d7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    17de:	00 00 

00000000000017e0 <__libc_csu_init>:
    17e0:	f3 0f 1e fa          	endbr64 
    17e4:	41 57                	push   r15
    17e6:	4c 8d 3d cb 25 00 00 	lea    r15,[rip+0x25cb]        # 3db8 <__frame_dummy_init_array_entry>
    17ed:	41 56                	push   r14
    17ef:	49 89 d6             	mov    r14,rdx
    17f2:	41 55                	push   r13
    17f4:	49 89 f5             	mov    r13,rsi
    17f7:	41 54                	push   r12
    17f9:	41 89 fc             	mov    r12d,edi
    17fc:	55                   	push   rbp
    17fd:	48 8d 2d bc 25 00 00 	lea    rbp,[rip+0x25bc]        # 3dc0 <__do_global_dtors_aux_fini_array_entry>
    1804:	53                   	push   rbx
    1805:	4c 29 fd             	sub    rbp,r15
    1808:	48 83 ec 08          	sub    rsp,0x8
    180c:	e8 ef f7 ff ff       	call   1000 <_init>
    1811:	48 c1 fd 03          	sar    rbp,0x3
    1815:	74 1f                	je     1836 <__libc_csu_init+0x56>
    1817:	31 db                	xor    ebx,ebx
    1819:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1820:	4c 89 f2             	mov    rdx,r14
    1823:	4c 89 ee             	mov    rsi,r13
    1826:	44 89 e7             	mov    edi,r12d
    1829:	41 ff 14 df          	call   QWORD PTR [r15+rbx*8]
    182d:	48 83 c3 01          	add    rbx,0x1
    1831:	48 39 dd             	cmp    rbp,rbx
    1834:	75 ea                	jne    1820 <__libc_csu_init+0x40>
    1836:	48 83 c4 08          	add    rsp,0x8
    183a:	5b                   	pop    rbx
    183b:	5d                   	pop    rbp
    183c:	41 5c                	pop    r12
    183e:	41 5d                	pop    r13
    1840:	41 5e                	pop    r14
    1842:	41 5f                	pop    r15
    1844:	c3                   	ret    
    1845:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    184c:	00 00 00 00 

0000000000001850 <__libc_csu_fini>:
    1850:	f3 0f 1e fa          	endbr64 
    1854:	c3                   	ret    

Disassembly of section .fini:

0000000000001858 <_fini>:
    1858:	f3 0f 1e fa          	endbr64 
    185c:	48 83 ec 08          	sub    rsp,0x8
    1860:	48 83 c4 08          	add    rsp,0x8
    1864:	c3                   	ret    
