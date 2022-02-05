
functest:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <__mingw_invalidParameterHandler>:
   140001000:	c3                   	ret    
   140001001:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001008:	00 00 00 00 
   14000100c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000140001010 <pre_c_init>:
   140001010:	48 83 ec 28          	sub    rsp,0x28
   140001014:	48 8b 05 c5 34 00 00 	mov    rax,QWORD PTR [rip+0x34c5]        # 1400044e0 <.refptr.mingw_initltsdrot_force>
   14000101b:	31 c9                	xor    ecx,ecx
   14000101d:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   140001023:	48 8b 05 c6 34 00 00 	mov    rax,QWORD PTR [rip+0x34c6]        # 1400044f0 <.refptr.mingw_initltsdyn_force>
   14000102a:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   140001030:	48 8b 05 c9 34 00 00 	mov    rax,QWORD PTR [rip+0x34c9]        # 140004500 <.refptr.mingw_initltssuo_force>
   140001037:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   14000103d:	48 8b 05 8c 34 00 00 	mov    rax,QWORD PTR [rip+0x348c]        # 1400044d0 <.refptr.mingw_initcharmax>
   140001044:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   14000104a:	48 8b 05 4f 33 00 00 	mov    rax,QWORD PTR [rip+0x334f]        # 1400043a0 <.refptr.__image_base__>
   140001051:	66 81 38 4d 5a       	cmp    WORD PTR [rax],0x5a4d
   140001056:	75 0f                	jne    140001067 <pre_c_init+0x57>
   140001058:	48 63 50 3c          	movsxd rdx,DWORD PTR [rax+0x3c]
   14000105c:	48 01 d0             	add    rax,rdx
   14000105f:	81 38 50 45 00 00    	cmp    DWORD PTR [rax],0x4550
   140001065:	74 69                	je     1400010d0 <pre_c_init+0xc0>
   140001067:	48 8b 05 52 34 00 00 	mov    rax,QWORD PTR [rip+0x3452]        # 1400044c0 <.refptr.mingw_app_type>
   14000106e:	89 0d ac 5f 00 00    	mov    DWORD PTR [rip+0x5fac],ecx        # 140007020 <managedapp>
   140001074:	8b 00                	mov    eax,DWORD PTR [rax]
   140001076:	85 c0                	test   eax,eax
   140001078:	74 46                	je     1400010c0 <pre_c_init+0xb0>
   14000107a:	b9 02 00 00 00       	mov    ecx,0x2
   14000107f:	e8 d4 1a 00 00       	call   140002b58 <__set_app_type>
   140001084:	e8 57 1b 00 00       	call   140002be0 <__p__fmode>
   140001089:	48 8b 15 f0 33 00 00 	mov    rdx,QWORD PTR [rip+0x33f0]        # 140004480 <.refptr._fmode>
   140001090:	8b 12                	mov    edx,DWORD PTR [rdx]
   140001092:	89 10                	mov    DWORD PTR [rax],edx
   140001094:	e8 37 1b 00 00       	call   140002bd0 <__p__commode>
   140001099:	48 8b 15 c0 33 00 00 	mov    rdx,QWORD PTR [rip+0x33c0]        # 140004460 <.refptr._commode>
   1400010a0:	8b 12                	mov    edx,DWORD PTR [rdx]
   1400010a2:	89 10                	mov    DWORD PTR [rax],edx
   1400010a4:	e8 17 0b 00 00       	call   140001bc0 <_setargv>
   1400010a9:	48 8b 05 a0 32 00 00 	mov    rax,QWORD PTR [rip+0x32a0]        # 140004350 <.refptr._MINGW_INSTALL_DEBUG_MATHERR>
   1400010b0:	83 38 01             	cmp    DWORD PTR [rax],0x1
   1400010b3:	74 53                	je     140001108 <pre_c_init+0xf8>
   1400010b5:	31 c0                	xor    eax,eax
   1400010b7:	48 83 c4 28          	add    rsp,0x28
   1400010bb:	c3                   	ret    
   1400010bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400010c0:	b9 01 00 00 00       	mov    ecx,0x1
   1400010c5:	e8 8e 1a 00 00       	call   140002b58 <__set_app_type>
   1400010ca:	eb b8                	jmp    140001084 <pre_c_init+0x74>
   1400010cc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400010d0:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
   1400010d4:	66 81 fa 0b 01       	cmp    dx,0x10b
   1400010d9:	74 45                	je     140001120 <pre_c_init+0x110>
   1400010db:	66 81 fa 0b 02       	cmp    dx,0x20b
   1400010e0:	75 85                	jne    140001067 <pre_c_init+0x57>
   1400010e2:	83 b8 84 00 00 00 0e 	cmp    DWORD PTR [rax+0x84],0xe
   1400010e9:	0f 86 78 ff ff ff    	jbe    140001067 <pre_c_init+0x57>
   1400010ef:	8b 90 f8 00 00 00    	mov    edx,DWORD PTR [rax+0xf8]
   1400010f5:	31 c9                	xor    ecx,ecx
   1400010f7:	85 d2                	test   edx,edx
   1400010f9:	0f 95 c1             	setne  cl
   1400010fc:	e9 66 ff ff ff       	jmp    140001067 <pre_c_init+0x57>
   140001101:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001108:	48 8d 0d 91 0b 00 00 	lea    rcx,[rip+0xb91]        # 140001ca0 <_matherr>
   14000110f:	e8 5c 11 00 00       	call   140002270 <__mingw_setusermatherr>
   140001114:	31 c0                	xor    eax,eax
   140001116:	48 83 c4 28          	add    rsp,0x28
   14000111a:	c3                   	ret    
   14000111b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001120:	83 78 74 0e          	cmp    DWORD PTR [rax+0x74],0xe
   140001124:	0f 86 3d ff ff ff    	jbe    140001067 <pre_c_init+0x57>
   14000112a:	44 8b 80 e8 00 00 00 	mov    r8d,DWORD PTR [rax+0xe8]
   140001131:	31 c9                	xor    ecx,ecx
   140001133:	45 85 c0             	test   r8d,r8d
   140001136:	0f 95 c1             	setne  cl
   140001139:	e9 29 ff ff ff       	jmp    140001067 <pre_c_init+0x57>
   14000113e:	66 90                	xchg   ax,ax

0000000140001140 <pre_cpp_init>:
   140001140:	48 83 ec 38          	sub    rsp,0x38
   140001144:	48 8b 05 65 33 00 00 	mov    rax,QWORD PTR [rip+0x3365]        # 1400044b0 <.refptr._newmode>
   14000114b:	4c 8d 05 d6 5e 00 00 	lea    r8,[rip+0x5ed6]        # 140007028 <envp>
   140001152:	48 8d 15 d7 5e 00 00 	lea    rdx,[rip+0x5ed7]        # 140007030 <argv>
   140001159:	48 8d 0d d8 5e 00 00 	lea    rcx,[rip+0x5ed8]        # 140007038 <argc>
   140001160:	8b 00                	mov    eax,DWORD PTR [rax]
   140001162:	89 05 b0 5e 00 00    	mov    DWORD PTR [rip+0x5eb0],eax        # 140007018 <startinfo>
   140001168:	48 8d 05 a9 5e 00 00 	lea    rax,[rip+0x5ea9]        # 140007018 <startinfo>
   14000116f:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140001174:	48 8b 05 f5 32 00 00 	mov    rax,QWORD PTR [rip+0x32f5]        # 140004470 <.refptr._dowildcard>
   14000117b:	44 8b 08             	mov    r9d,DWORD PTR [rax]
   14000117e:	e8 e5 19 00 00       	call   140002b68 <__getmainargs>
   140001183:	90                   	nop
   140001184:	48 83 c4 38          	add    rsp,0x38
   140001188:	c3                   	ret    
   140001189:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000140001190 <__tmainCRTStartup>:
   140001190:	41 55                	push   r13
   140001192:	41 54                	push   r12
   140001194:	55                   	push   rbp
   140001195:	57                   	push   rdi
   140001196:	56                   	push   rsi
   140001197:	53                   	push   rbx
   140001198:	48 81 ec 98 00 00 00 	sub    rsp,0x98
   14000119f:	b9 0d 00 00 00       	mov    ecx,0xd
   1400011a4:	31 c0                	xor    eax,eax
   1400011a6:	4c 8d 44 24 20       	lea    r8,[rsp+0x20]
   1400011ab:	4c 89 c7             	mov    rdi,r8
   1400011ae:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
   1400011b1:	48 8b 3d 08 33 00 00 	mov    rdi,QWORD PTR [rip+0x3308]        # 1400044c0 <.refptr.mingw_app_type>
   1400011b8:	44 8b 0f             	mov    r9d,DWORD PTR [rdi]
   1400011bb:	45 85 c9             	test   r9d,r9d
   1400011be:	0f 85 9c 02 00 00    	jne    140001460 <__tmainCRTStartup+0x2d0>
   1400011c4:	65 48 8b 04 25 30 00 	mov    rax,QWORD PTR gs:0x30
   1400011cb:	00 00 
   1400011cd:	48 8b 1d 2c 32 00 00 	mov    rbx,QWORD PTR [rip+0x322c]        # 140004400 <.refptr.__native_startup_lock>
   1400011d4:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
   1400011d8:	31 ed                	xor    ebp,ebp
   1400011da:	4c 8b 25 cb 6f 00 00 	mov    r12,QWORD PTR [rip+0x6fcb]        # 1400081ac <__imp_Sleep>
   1400011e1:	eb 16                	jmp    1400011f9 <__tmainCRTStartup+0x69>
   1400011e3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   1400011e8:	48 39 c6             	cmp    rsi,rax
   1400011eb:	0f 84 17 02 00 00    	je     140001408 <__tmainCRTStartup+0x278>
   1400011f1:	b9 e8 03 00 00       	mov    ecx,0x3e8
   1400011f6:	41 ff d4             	call   r12
   1400011f9:	48 89 e8             	mov    rax,rbp
   1400011fc:	f0 48 0f b1 33       	lock cmpxchg QWORD PTR [rbx],rsi
   140001201:	48 85 c0             	test   rax,rax
   140001204:	75 e2                	jne    1400011e8 <__tmainCRTStartup+0x58>
   140001206:	48 8b 35 03 32 00 00 	mov    rsi,QWORD PTR [rip+0x3203]        # 140004410 <.refptr.__native_startup_state>
   14000120d:	31 ed                	xor    ebp,ebp
   14000120f:	8b 06                	mov    eax,DWORD PTR [rsi]
   140001211:	83 f8 01             	cmp    eax,0x1
   140001214:	0f 84 05 02 00 00    	je     14000141f <__tmainCRTStartup+0x28f>
   14000121a:	8b 06                	mov    eax,DWORD PTR [rsi]
   14000121c:	85 c0                	test   eax,eax
   14000121e:	0f 84 6c 02 00 00    	je     140001490 <__tmainCRTStartup+0x300>
   140001224:	c7 05 ee 5d 00 00 01 	mov    DWORD PTR [rip+0x5dee],0x1        # 14000701c <has_cctor>
   14000122b:	00 00 00 
   14000122e:	8b 06                	mov    eax,DWORD PTR [rsi]
   140001230:	83 f8 01             	cmp    eax,0x1
   140001233:	0f 84 fb 01 00 00    	je     140001434 <__tmainCRTStartup+0x2a4>
   140001239:	85 ed                	test   ebp,ebp
   14000123b:	0f 84 14 02 00 00    	je     140001455 <__tmainCRTStartup+0x2c5>
   140001241:	48 8b 05 48 31 00 00 	mov    rax,QWORD PTR [rip+0x3148]        # 140004390 <.refptr.__dyn_tls_init_callback>
   140001248:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000124b:	48 85 c0             	test   rax,rax
   14000124e:	74 0c                	je     14000125c <__tmainCRTStartup+0xcc>
   140001250:	45 31 c0             	xor    r8d,r8d
   140001253:	ba 02 00 00 00       	mov    edx,0x2
   140001258:	31 c9                	xor    ecx,ecx
   14000125a:	ff d0                	call   rax
   14000125c:	e8 2f 0d 00 00       	call   140001f90 <_pei386_runtime_relocator>
   140001261:	48 8d 0d 18 10 00 00 	lea    rcx,[rip+0x1018]        # 140002280 <_gnu_exception_handler>
   140001268:	ff 15 36 6f 00 00    	call   QWORD PTR [rip+0x6f36]        # 1400081a4 <__imp_SetUnhandledExceptionFilter>
   14000126e:	48 8b 15 7b 31 00 00 	mov    rdx,QWORD PTR [rip+0x317b]        # 1400043f0 <.refptr.__mingw_oldexcpt_handler>
   140001275:	48 8d 0d 84 fd ff ff 	lea    rcx,[rip+0xfffffffffffffd84]        # 140001000 <__mingw_invalidParameterHandler>
   14000127c:	48 89 02             	mov    QWORD PTR [rdx],rax
   14000127f:	e8 2c 19 00 00       	call   140002bb0 <_set_invalid_parameter_handler>
   140001284:	e8 17 0b 00 00       	call   140001da0 <_fpreset>
   140001289:	48 8b 05 10 31 00 00 	mov    rax,QWORD PTR [rip+0x3110]        # 1400043a0 <.refptr.__image_base__>
   140001290:	48 89 05 79 5d 00 00 	mov    QWORD PTR [rip+0x5d79],rax        # 140007010 <__mingw_winmain_hInstance>
   140001297:	e8 24 19 00 00       	call   140002bc0 <__p__acmdln>
   14000129c:	31 c9                	xor    ecx,ecx
   14000129e:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400012a1:	48 85 c0             	test   rax,rax
   1400012a4:	75 1c                	jne    1400012c2 <__tmainCRTStartup+0x132>
   1400012a6:	eb 58                	jmp    140001300 <__tmainCRTStartup+0x170>
   1400012a8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   1400012af:	00 
   1400012b0:	84 d2                	test   dl,dl
   1400012b2:	74 45                	je     1400012f9 <__tmainCRTStartup+0x169>
   1400012b4:	83 e1 01             	and    ecx,0x1
   1400012b7:	74 27                	je     1400012e0 <__tmainCRTStartup+0x150>
   1400012b9:	b9 01 00 00 00       	mov    ecx,0x1
   1400012be:	48 83 c0 01          	add    rax,0x1
   1400012c2:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   1400012c5:	80 fa 20             	cmp    dl,0x20
   1400012c8:	7e e6                	jle    1400012b0 <__tmainCRTStartup+0x120>
   1400012ca:	41 89 c8             	mov    r8d,ecx
   1400012cd:	41 83 f0 01          	xor    r8d,0x1
   1400012d1:	80 fa 22             	cmp    dl,0x22
   1400012d4:	41 0f 44 c8          	cmove  ecx,r8d
   1400012d8:	eb e4                	jmp    1400012be <__tmainCRTStartup+0x12e>
   1400012da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   1400012e0:	84 d2                	test   dl,dl
   1400012e2:	74 15                	je     1400012f9 <__tmainCRTStartup+0x169>
   1400012e4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400012e8:	0f b6 50 01          	movzx  edx,BYTE PTR [rax+0x1]
   1400012ec:	48 83 c0 01          	add    rax,0x1
   1400012f0:	84 d2                	test   dl,dl
   1400012f2:	74 05                	je     1400012f9 <__tmainCRTStartup+0x169>
   1400012f4:	80 fa 20             	cmp    dl,0x20
   1400012f7:	7e ef                	jle    1400012e8 <__tmainCRTStartup+0x158>
   1400012f9:	48 89 05 08 5d 00 00 	mov    QWORD PTR [rip+0x5d08],rax        # 140007008 <__mingw_winmain_lpCmdLine>
   140001300:	44 8b 07             	mov    r8d,DWORD PTR [rdi]
   140001303:	45 85 c0             	test   r8d,r8d
   140001306:	74 16                	je     14000131e <__tmainCRTStartup+0x18e>
   140001308:	b8 0a 00 00 00       	mov    eax,0xa
   14000130d:	f6 44 24 5c 01       	test   BYTE PTR [rsp+0x5c],0x1
   140001312:	0f 85 e0 00 00 00    	jne    1400013f8 <__tmainCRTStartup+0x268>
   140001318:	89 05 e2 1c 00 00    	mov    DWORD PTR [rip+0x1ce2],eax        # 140003000 <__data_start__>
   14000131e:	48 63 2d 13 5d 00 00 	movsxd rbp,DWORD PTR [rip+0x5d13]        # 140007038 <argc>
   140001325:	44 8d 65 01          	lea    r12d,[rbp+0x1]
   140001329:	4d 63 e4             	movsxd r12,r12d
   14000132c:	49 c1 e4 03          	shl    r12,0x3
   140001330:	4c 89 e1             	mov    rcx,r12
   140001333:	e8 c0 17 00 00       	call   140002af8 <malloc>
   140001338:	4c 8b 2d f1 5c 00 00 	mov    r13,QWORD PTR [rip+0x5cf1]        # 140007030 <argv>
   14000133f:	48 89 c7             	mov    rdi,rax
   140001342:	85 ed                	test   ebp,ebp
   140001344:	7e 42                	jle    140001388 <__tmainCRTStartup+0x1f8>
   140001346:	31 db                	xor    ebx,ebx
   140001348:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000134f:	00 
   140001350:	49 8b 4c dd 00       	mov    rcx,QWORD PTR [r13+rbx*8+0x0]
   140001355:	e8 86 17 00 00       	call   140002ae0 <strlen>
   14000135a:	48 8d 70 01          	lea    rsi,[rax+0x1]
   14000135e:	48 89 f1             	mov    rcx,rsi
   140001361:	e8 92 17 00 00       	call   140002af8 <malloc>
   140001366:	49 89 f0             	mov    r8,rsi
   140001369:	48 89 04 df          	mov    QWORD PTR [rdi+rbx*8],rax
   14000136d:	49 8b 54 dd 00       	mov    rdx,QWORD PTR [r13+rbx*8+0x0]
   140001372:	48 89 c1             	mov    rcx,rax
   140001375:	48 83 c3 01          	add    rbx,0x1
   140001379:	e8 72 17 00 00       	call   140002af0 <memcpy>
   14000137e:	48 39 dd             	cmp    rbp,rbx
   140001381:	75 cd                	jne    140001350 <__tmainCRTStartup+0x1c0>
   140001383:	4a 8d 44 27 f8       	lea    rax,[rdi+r12*1-0x8]
   140001388:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
   14000138f:	48 89 3d 9a 5c 00 00 	mov    QWORD PTR [rip+0x5c9a],rdi        # 140007030 <argv>
   140001396:	e8 f5 07 00 00       	call   140001b90 <__main>
   14000139b:	48 8b 05 0e 30 00 00 	mov    rax,QWORD PTR [rip+0x300e]        # 1400043b0 <.refptr.__imp___initenv>
   1400013a2:	4c 8b 05 7f 5c 00 00 	mov    r8,QWORD PTR [rip+0x5c7f]        # 140007028 <envp>
   1400013a9:	8b 0d 89 5c 00 00    	mov    ecx,DWORD PTR [rip+0x5c89]        # 140007038 <argc>
   1400013af:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400013b2:	4c 89 00             	mov    QWORD PTR [rax],r8
   1400013b5:	48 8b 15 74 5c 00 00 	mov    rdx,QWORD PTR [rip+0x5c74]        # 140007030 <argv>
   1400013bc:	e8 98 06 00 00       	call   140001a59 <main>
   1400013c1:	8b 0d 59 5c 00 00    	mov    ecx,DWORD PTR [rip+0x5c59]        # 140007020 <managedapp>
   1400013c7:	89 05 57 5c 00 00    	mov    DWORD PTR [rip+0x5c57],eax        # 140007024 <mainret>
   1400013cd:	85 c9                	test   ecx,ecx
   1400013cf:	0f 84 d9 00 00 00    	je     1400014ae <__tmainCRTStartup+0x31e>
   1400013d5:	8b 15 41 5c 00 00    	mov    edx,DWORD PTR [rip+0x5c41]        # 14000701c <has_cctor>
   1400013db:	85 d2                	test   edx,edx
   1400013dd:	0f 84 8d 00 00 00    	je     140001470 <__tmainCRTStartup+0x2e0>
   1400013e3:	48 81 c4 98 00 00 00 	add    rsp,0x98
   1400013ea:	5b                   	pop    rbx
   1400013eb:	5e                   	pop    rsi
   1400013ec:	5f                   	pop    rdi
   1400013ed:	5d                   	pop    rbp
   1400013ee:	41 5c                	pop    r12
   1400013f0:	41 5d                	pop    r13
   1400013f2:	c3                   	ret    
   1400013f3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   1400013f8:	0f b7 44 24 60       	movzx  eax,WORD PTR [rsp+0x60]
   1400013fd:	e9 16 ff ff ff       	jmp    140001318 <__tmainCRTStartup+0x188>
   140001402:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140001408:	48 8b 35 01 30 00 00 	mov    rsi,QWORD PTR [rip+0x3001]        # 140004410 <.refptr.__native_startup_state>
   14000140f:	bd 01 00 00 00       	mov    ebp,0x1
   140001414:	8b 06                	mov    eax,DWORD PTR [rsi]
   140001416:	83 f8 01             	cmp    eax,0x1
   140001419:	0f 85 fb fd ff ff    	jne    14000121a <__tmainCRTStartup+0x8a>
   14000141f:	b9 1f 00 00 00       	mov    ecx,0x1f
   140001424:	e8 1f 17 00 00       	call   140002b48 <_amsg_exit>
   140001429:	8b 06                	mov    eax,DWORD PTR [rsi]
   14000142b:	83 f8 01             	cmp    eax,0x1
   14000142e:	0f 85 05 fe ff ff    	jne    140001239 <__tmainCRTStartup+0xa9>
   140001434:	48 8b 15 f5 2f 00 00 	mov    rdx,QWORD PTR [rip+0x2ff5]        # 140004430 <.refptr.__xc_z>
   14000143b:	48 8b 0d de 2f 00 00 	mov    rcx,QWORD PTR [rip+0x2fde]        # 140004420 <.refptr.__xc_a>
   140001442:	e8 f1 16 00 00       	call   140002b38 <_initterm>
   140001447:	c7 06 02 00 00 00    	mov    DWORD PTR [rsi],0x2
   14000144d:	85 ed                	test   ebp,ebp
   14000144f:	0f 85 ec fd ff ff    	jne    140001241 <__tmainCRTStartup+0xb1>
   140001455:	31 c0                	xor    eax,eax
   140001457:	48 87 03             	xchg   QWORD PTR [rbx],rax
   14000145a:	e9 e2 fd ff ff       	jmp    140001241 <__tmainCRTStartup+0xb1>
   14000145f:	90                   	nop
   140001460:	4c 89 c1             	mov    rcx,r8
   140001463:	ff 15 23 6d 00 00    	call   QWORD PTR [rip+0x6d23]        # 14000818c <__imp_GetStartupInfoA>
   140001469:	e9 56 fd ff ff       	jmp    1400011c4 <__tmainCRTStartup+0x34>
   14000146e:	66 90                	xchg   ax,ax
   140001470:	e8 cb 16 00 00       	call   140002b40 <_cexit>
   140001475:	8b 05 a9 5b 00 00    	mov    eax,DWORD PTR [rip+0x5ba9]        # 140007024 <mainret>
   14000147b:	48 81 c4 98 00 00 00 	add    rsp,0x98
   140001482:	5b                   	pop    rbx
   140001483:	5e                   	pop    rsi
   140001484:	5f                   	pop    rdi
   140001485:	5d                   	pop    rbp
   140001486:	41 5c                	pop    r12
   140001488:	41 5d                	pop    r13
   14000148a:	c3                   	ret    
   14000148b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001490:	48 8b 15 b9 2f 00 00 	mov    rdx,QWORD PTR [rip+0x2fb9]        # 140004450 <.refptr.__xi_z>
   140001497:	48 8b 0d a2 2f 00 00 	mov    rcx,QWORD PTR [rip+0x2fa2]        # 140004440 <.refptr.__xi_a>
   14000149e:	c7 06 01 00 00 00    	mov    DWORD PTR [rsi],0x1
   1400014a4:	e8 8f 16 00 00       	call   140002b38 <_initterm>
   1400014a9:	e9 80 fd ff ff       	jmp    14000122e <__tmainCRTStartup+0x9e>
   1400014ae:	89 c1                	mov    ecx,eax
   1400014b0:	e8 63 16 00 00       	call   140002b18 <exit>
   1400014b5:	90                   	nop
   1400014b6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   1400014bd:	00 00 00 

00000001400014c0 <WinMainCRTStartup>:
   1400014c0:	48 83 ec 28          	sub    rsp,0x28

00000001400014c4 <.l_startw>:
   1400014c4:	48 8b 05 f5 2f 00 00 	mov    rax,QWORD PTR [rip+0x2ff5]        # 1400044c0 <.refptr.mingw_app_type>
   1400014cb:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   1400014d1:	e8 ba fc ff ff       	call   140001190 <__tmainCRTStartup>
   1400014d6:	90                   	nop

00000001400014d7 <.l_endw>:
   1400014d7:	90                   	nop
   1400014d8:	48 83 c4 28          	add    rsp,0x28
   1400014dc:	c3                   	ret    
   1400014dd:	0f 1f 00             	nop    DWORD PTR [rax]

00000001400014e0 <mainCRTStartup>:
   1400014e0:	48 83 ec 28          	sub    rsp,0x28

00000001400014e4 <.l_start>:
   1400014e4:	48 8b 05 d5 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fd5]        # 1400044c0 <.refptr.mingw_app_type>
   1400014eb:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
   1400014f1:	e8 9a fc ff ff       	call   140001190 <__tmainCRTStartup>
   1400014f6:	90                   	nop

00000001400014f7 <.l_end>:
   1400014f7:	90                   	nop
   1400014f8:	48 83 c4 28          	add    rsp,0x28
   1400014fc:	c3                   	ret    
   1400014fd:	0f 1f 00             	nop    DWORD PTR [rax]

0000000140001500 <atexit>:
   140001500:	48 83 ec 28          	sub    rsp,0x28
   140001504:	e8 27 16 00 00       	call   140002b30 <_onexit>
   140001509:	48 85 c0             	test   rax,rax
   14000150c:	0f 94 c0             	sete   al
   14000150f:	0f b6 c0             	movzx  eax,al
   140001512:	f7 d8                	neg    eax
   140001514:	48 83 c4 28          	add    rsp,0x28
   140001518:	c3                   	ret    
   140001519:	90                   	nop
   14000151a:	90                   	nop
   14000151b:	90                   	nop
   14000151c:	90                   	nop
   14000151d:	90                   	nop
   14000151e:	90                   	nop
   14000151f:	90                   	nop

0000000140001520 <__gcc_register_frame>:
   140001520:	48 8d 0d 09 00 00 00 	lea    rcx,[rip+0x9]        # 140001530 <__gcc_deregister_frame>
   140001527:	e9 d4 ff ff ff       	jmp    140001500 <atexit>
   14000152c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000140001530 <__gcc_deregister_frame>:
   140001530:	c3                   	ret    
   140001531:	90                   	nop
   140001532:	90                   	nop
   140001533:	90                   	nop
   140001534:	90                   	nop
   140001535:	90                   	nop
   140001536:	90                   	nop
   140001537:	90                   	nop
   140001538:	90                   	nop
   140001539:	90                   	nop
   14000153a:	90                   	nop
   14000153b:	90                   	nop
   14000153c:	90                   	nop
   14000153d:	90                   	nop
   14000153e:	90                   	nop
   14000153f:	90                   	nop

0000000140001540 <funcintr>:
   140001540:	55                   	push   rbp
   140001541:	48 89 e5             	mov    rbp,rsp
   140001544:	b8 2a 00 00 00       	mov    eax,0x2a
   140001549:	5d                   	pop    rbp
   14000154a:	c3                   	ret    

000000014000154b <funcint64r>:
   14000154b:	55                   	push   rbp
   14000154c:	48 89 e5             	mov    rbp,rsp
   14000154f:	48 b8 00 00 00 00 42 	movabs rax,0x4200000000
   140001556:	00 00 00 
   140001559:	5d                   	pop    rbp
   14000155a:	c3                   	ret    

000000014000155b <funcint64r2>:
   14000155b:	55                   	push   rbp
   14000155c:	48 89 e5             	mov    rbp,rsp
   14000155f:	b8 2a 00 00 00       	mov    eax,0x2a
   140001564:	5d                   	pop    rbp
   140001565:	c3                   	ret    

0000000140001566 <funcint>:
   140001566:	55                   	push   rbp
   140001567:	48 89 e5             	mov    rbp,rsp
   14000156a:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   14000156d:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
   140001570:	44 89 45 20          	mov    DWORD PTR [rbp+0x20],r8d
   140001574:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
   140001577:	8d 50 01             	lea    edx,[rax+0x1]
   14000157a:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
   14000157d:	83 c0 02             	add    eax,0x2
   140001580:	0f af c2             	imul   eax,edx
   140001583:	8b 55 20             	mov    edx,DWORD PTR [rbp+0x20]
   140001586:	83 c2 03             	add    edx,0x3
   140001589:	0f af c2             	imul   eax,edx
   14000158c:	5d                   	pop    rbp
   14000158d:	c3                   	ret    

000000014000158e <funcchar>:
   14000158e:	55                   	push   rbp
   14000158f:	48 89 e5             	mov    rbp,rsp
   140001592:	89 d0                	mov    eax,edx
   140001594:	89 ca                	mov    edx,ecx
   140001596:	88 55 10             	mov    BYTE PTR [rbp+0x10],dl
   140001599:	88 45 18             	mov    BYTE PTR [rbp+0x18],al
   14000159c:	0f be 45 10          	movsx  eax,BYTE PTR [rbp+0x10]
   1400015a0:	8d 50 01             	lea    edx,[rax+0x1]
   1400015a3:	0f be 45 18          	movsx  eax,BYTE PTR [rbp+0x18]
   1400015a7:	83 c0 02             	add    eax,0x2
   1400015aa:	0f af c2             	imul   eax,edx
   1400015ad:	5d                   	pop    rbp
   1400015ae:	c3                   	ret    

00000001400015af <funcfloat>:
   1400015af:	55                   	push   rbp
   1400015b0:	48 89 e5             	mov    rbp,rsp
   1400015b3:	f3 0f 11 45 10       	movss  DWORD PTR [rbp+0x10],xmm0
   1400015b8:	f3 0f 11 4d 18       	movss  DWORD PTR [rbp+0x18],xmm1
   1400015bd:	f3 0f 11 55 20       	movss  DWORD PTR [rbp+0x20],xmm2
   1400015c2:	66 0f ef c9          	pxor   xmm1,xmm1
   1400015c6:	f3 0f 5a 4d 10       	cvtss2sd xmm1,DWORD PTR [rbp+0x10]
   1400015cb:	f2 0f 10 05 2d 2a 00 	movsd  xmm0,QWORD PTR [rip+0x2a2d]        # 140004000 <.rdata>
   1400015d2:	00 
   1400015d3:	f2 0f 58 c8          	addsd  xmm1,xmm0
   1400015d7:	66 0f ef d2          	pxor   xmm2,xmm2
   1400015db:	f3 0f 5a 55 18       	cvtss2sd xmm2,DWORD PTR [rbp+0x18]
   1400015e0:	f2 0f 10 05 20 2a 00 	movsd  xmm0,QWORD PTR [rip+0x2a20]        # 140004008 <.rdata+0x8>
   1400015e7:	00 
   1400015e8:	f2 0f 58 c2          	addsd  xmm0,xmm2
   1400015ec:	f2 0f 59 c8          	mulsd  xmm1,xmm0
   1400015f0:	66 0f ef d2          	pxor   xmm2,xmm2
   1400015f4:	f3 0f 5a 55 20       	cvtss2sd xmm2,DWORD PTR [rbp+0x20]
   1400015f9:	f2 0f 10 05 0f 2a 00 	movsd  xmm0,QWORD PTR [rip+0x2a0f]        # 140004010 <.rdata+0x10>
   140001600:	00 
   140001601:	f2 0f 58 c2          	addsd  xmm0,xmm2
   140001605:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   140001609:	f2 0f 5a c0          	cvtsd2ss xmm0,xmm0
   14000160d:	5d                   	pop    rbp
   14000160e:	c3                   	ret    

000000014000160f <funcfloatint>:
   14000160f:	55                   	push   rbp
   140001610:	48 89 e5             	mov    rbp,rsp
   140001613:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   140001616:	f3 0f 11 4d 18       	movss  DWORD PTR [rbp+0x18],xmm1
   14000161b:	44 89 45 20          	mov    DWORD PTR [rbp+0x20],r8d
   14000161f:	f3 0f 11 5d 28       	movss  DWORD PTR [rbp+0x28],xmm3
   140001624:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
   140001627:	83 c0 01             	add    eax,0x1
   14000162a:	66 0f ef c9          	pxor   xmm1,xmm1
   14000162e:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
   140001632:	66 0f ef d2          	pxor   xmm2,xmm2
   140001636:	f3 0f 5a 55 18       	cvtss2sd xmm2,DWORD PTR [rbp+0x18]
   14000163b:	f2 0f 10 05 c5 29 00 	movsd  xmm0,QWORD PTR [rip+0x29c5]        # 140004008 <.rdata+0x8>
   140001642:	00 
   140001643:	f2 0f 58 c2          	addsd  xmm0,xmm2
   140001647:	f2 0f 59 c8          	mulsd  xmm1,xmm0
   14000164b:	8b 45 20             	mov    eax,DWORD PTR [rbp+0x20]
   14000164e:	83 c0 03             	add    eax,0x3
   140001651:	66 0f ef c0          	pxor   xmm0,xmm0
   140001655:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
   140001659:	f2 0f 59 c8          	mulsd  xmm1,xmm0
   14000165d:	66 0f ef d2          	pxor   xmm2,xmm2
   140001661:	f3 0f 5a 55 28       	cvtss2sd xmm2,DWORD PTR [rbp+0x28]
   140001666:	f2 0f 10 05 aa 29 00 	movsd  xmm0,QWORD PTR [rip+0x29aa]        # 140004018 <.rdata+0x18>
   14000166d:	00 
   14000166e:	f2 0f 58 c2          	addsd  xmm0,xmm2
   140001672:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   140001676:	f2 0f 2c c0          	cvttsd2si eax,xmm0
   14000167a:	5d                   	pop    rbp
   14000167b:	c3                   	ret    

000000014000167c <funcdouble>:
   14000167c:	55                   	push   rbp
   14000167d:	48 89 e5             	mov    rbp,rsp
   140001680:	f2 0f 11 45 10       	movsd  QWORD PTR [rbp+0x10],xmm0
   140001685:	f2 0f 11 4d 18       	movsd  QWORD PTR [rbp+0x18],xmm1
   14000168a:	f2 0f 10 4d 10       	movsd  xmm1,QWORD PTR [rbp+0x10]
   14000168f:	f2 0f 10 05 71 29 00 	movsd  xmm0,QWORD PTR [rip+0x2971]        # 140004008 <.rdata+0x8>
   140001696:	00 
   140001697:	f2 0f 58 c8          	addsd  xmm1,xmm0
   14000169b:	f2 0f 10 55 18       	movsd  xmm2,QWORD PTR [rbp+0x18]
   1400016a0:	f2 0f 10 05 70 29 00 	movsd  xmm0,QWORD PTR [rip+0x2970]        # 140004018 <.rdata+0x18>
   1400016a7:	00 
   1400016a8:	f2 0f 58 c2          	addsd  xmm0,xmm2
   1400016ac:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   1400016b0:	66 48 0f 7e c0       	movq   rax,xmm0
   1400016b5:	66 48 0f 6e c0       	movq   xmm0,rax
   1400016ba:	5d                   	pop    rbp
   1400016bb:	c3                   	ret    

00000001400016bc <funcstructvalue>:
   1400016bc:	55                   	push   rbp
   1400016bd:	53                   	push   rbx
   1400016be:	48 8d 2c 24          	lea    rbp,[rsp]
   1400016c2:	48 89 cb             	mov    rbx,rcx
   1400016c5:	48 89 55 20          	mov    QWORD PTR [rbp+0x20],rdx
   1400016c9:	8b 13                	mov    edx,DWORD PTR [rbx]
   1400016cb:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400016cf:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
   1400016d2:	01 d0                	add    eax,edx
   1400016d4:	5b                   	pop    rbx
   1400016d5:	5d                   	pop    rbp
   1400016d6:	c3                   	ret    

00000001400016d7 <funcstructret>:
   1400016d7:	55                   	push   rbp
   1400016d8:	48 89 e5             	mov    rbp,rsp
   1400016db:	48 83 ec 20          	sub    rsp,0x20
   1400016df:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   1400016e3:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
   1400016e6:	44 89 45 20          	mov    DWORD PTR [rbp+0x20],r8d
   1400016ea:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
   1400016f1:	00 
   1400016f2:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
   1400016f9:	00 
   1400016fa:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
   140001701:	00 
   140001702:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
   140001705:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
   140001708:	8b 45 20             	mov    eax,DWORD PTR [rbp+0x20]
   14000170b:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
   14000170e:	48 8b 4d 10          	mov    rcx,QWORD PTR [rbp+0x10]
   140001712:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140001716:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
   14000171a:	48 89 01             	mov    QWORD PTR [rcx],rax
   14000171d:	48 89 51 08          	mov    QWORD PTR [rcx+0x8],rdx
   140001721:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001725:	48 89 41 10          	mov    QWORD PTR [rcx+0x10],rax
   140001729:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000172d:	48 83 c4 20          	add    rsp,0x20
   140001731:	5d                   	pop    rbp
   140001732:	c3                   	ret    

0000000140001733 <funcvarargs>:
   140001733:	55                   	push   rbp
   140001734:	48 89 e5             	mov    rbp,rsp
   140001737:	48 83 ec 10          	sub    rsp,0x10
   14000173b:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   14000173e:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140001742:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140001746:	4c 89 4d 28          	mov    QWORD PTR [rbp+0x28],r9
   14000174a:	48 8d 45 18          	lea    rax,[rbp+0x18]
   14000174e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140001752:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
   140001759:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140001760:	eb 15                	jmp    140001777 <funcvarargs+0x44>
   140001762:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001766:	48 8d 50 08          	lea    rdx,[rax+0x8]
   14000176a:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   14000176e:	8b 00                	mov    eax,DWORD PTR [rax]
   140001770:	01 45 f8             	add    DWORD PTR [rbp-0x8],eax
   140001773:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
   140001777:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   14000177a:	3b 45 10             	cmp    eax,DWORD PTR [rbp+0x10]
   14000177d:	7c e3                	jl     140001762 <funcvarargs+0x2f>
   14000177f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140001782:	48 83 c4 10          	add    rsp,0x10
   140001786:	5d                   	pop    rbp
   140001787:	c3                   	ret    
   140001788:	90                   	nop
   140001789:	90                   	nop
   14000178a:	90                   	nop
   14000178b:	90                   	nop
   14000178c:	90                   	nop
   14000178d:	90                   	nop
   14000178e:	90                   	nop
   14000178f:	90                   	nop

0000000140001790 <test_funcintr>:
   140001790:	55                   	push   rbp
   140001791:	48 89 e5             	mov    rbp,rsp
   140001794:	48 83 ec 30          	sub    rsp,0x30
   140001798:	e8 a3 fd ff ff       	call   140001540 <funcintr>
   14000179d:	83 c0 01             	add    eax,0x1
   1400017a0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   1400017a3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400017a6:	48 83 c4 30          	add    rsp,0x30
   1400017aa:	5d                   	pop    rbp
   1400017ab:	c3                   	ret    

00000001400017ac <test_funcint64r>:
   1400017ac:	55                   	push   rbp
   1400017ad:	48 89 e5             	mov    rbp,rsp
   1400017b0:	48 83 ec 30          	sub    rsp,0x30
   1400017b4:	e8 92 fd ff ff       	call   14000154b <funcint64r>
   1400017b9:	48 83 c0 01          	add    rax,0x1
   1400017bd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400017c1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400017c5:	48 83 c4 30          	add    rsp,0x30
   1400017c9:	5d                   	pop    rbp
   1400017ca:	c3                   	ret    

00000001400017cb <test_funcint64r2>:
   1400017cb:	55                   	push   rbp
   1400017cc:	48 89 e5             	mov    rbp,rsp
   1400017cf:	48 83 ec 30          	sub    rsp,0x30
   1400017d3:	e8 83 fd ff ff       	call   14000155b <funcint64r2>
   1400017d8:	48 83 c0 01          	add    rax,0x1
   1400017dc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400017e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400017e4:	48 83 c4 30          	add    rsp,0x30
   1400017e8:	5d                   	pop    rbp
   1400017e9:	c3                   	ret    

00000001400017ea <test_funcint>:
   1400017ea:	55                   	push   rbp
   1400017eb:	48 89 e5             	mov    rbp,rsp
   1400017ee:	48 83 ec 30          	sub    rsp,0x30
   1400017f2:	41 b8 03 00 00 00    	mov    r8d,0x3
   1400017f8:	ba 02 00 00 00       	mov    edx,0x2
   1400017fd:	b9 01 00 00 00       	mov    ecx,0x1
   140001802:	e8 5f fd ff ff       	call   140001566 <funcint>
   140001807:	83 c0 01             	add    eax,0x1
   14000180a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   14000180d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001810:	48 83 c4 30          	add    rsp,0x30
   140001814:	5d                   	pop    rbp
   140001815:	c3                   	ret    

0000000140001816 <test_funcchar>:
   140001816:	55                   	push   rbp
   140001817:	48 89 e5             	mov    rbp,rsp
   14000181a:	48 83 ec 30          	sub    rsp,0x30
   14000181e:	ba 02 00 00 00       	mov    edx,0x2
   140001823:	b9 01 00 00 00       	mov    ecx,0x1
   140001828:	e8 61 fd ff ff       	call   14000158e <funcchar>
   14000182d:	83 c0 01             	add    eax,0x1
   140001830:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140001833:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001836:	48 83 c4 30          	add    rsp,0x30
   14000183a:	5d                   	pop    rbp
   14000183b:	c3                   	ret    

000000014000183c <test_funcfloat>:
   14000183c:	55                   	push   rbp
   14000183d:	48 89 e5             	mov    rbp,rsp
   140001840:	48 83 ec 30          	sub    rsp,0x30
   140001844:	f3 0f 10 15 d4 27 00 	movss  xmm2,DWORD PTR [rip+0x27d4]        # 140004020 <.rdata>
   14000184b:	00 
   14000184c:	f3 0f 10 0d d0 27 00 	movss  xmm1,DWORD PTR [rip+0x27d0]        # 140004024 <.rdata+0x4>
   140001853:	00 
   140001854:	8b 05 ce 27 00 00    	mov    eax,DWORD PTR [rip+0x27ce]        # 140004028 <.rdata+0x8>
   14000185a:	66 0f 6e c0          	movd   xmm0,eax
   14000185e:	e8 4c fd ff ff       	call   1400015af <funcfloat>
   140001863:	66 0f ef c9          	pxor   xmm1,xmm1
   140001867:	f3 0f 5a c8          	cvtss2sd xmm1,xmm0
   14000186b:	f2 0f 10 05 bd 27 00 	movsd  xmm0,QWORD PTR [rip+0x27bd]        # 140004030 <.rdata+0x10>
   140001872:	00 
   140001873:	f2 0f 58 c1          	addsd  xmm0,xmm1
   140001877:	f2 0f 5a c0          	cvtsd2ss xmm0,xmm0
   14000187b:	f3 0f 11 45 fc       	movss  DWORD PTR [rbp-0x4],xmm0
   140001880:	f3 0f 10 45 fc       	movss  xmm0,DWORD PTR [rbp-0x4]
   140001885:	f3 0f 2c c0          	cvttss2si eax,xmm0
   140001889:	48 83 c4 30          	add    rsp,0x30
   14000188d:	5d                   	pop    rbp
   14000188e:	c3                   	ret    

000000014000188f <test_funcfloatint>:
   14000188f:	55                   	push   rbp
   140001890:	48 89 e5             	mov    rbp,rsp
   140001893:	48 83 ec 30          	sub    rsp,0x30
   140001897:	f3 0f 10 1d 99 27 00 	movss  xmm3,DWORD PTR [rip+0x2799]        # 140004038 <.rdata+0x18>
   14000189e:	00 
   14000189f:	41 b8 03 00 00 00    	mov    r8d,0x3
   1400018a5:	f3 0f 10 0d 77 27 00 	movss  xmm1,DWORD PTR [rip+0x2777]        # 140004024 <.rdata+0x4>
   1400018ac:	00 
   1400018ad:	b9 01 00 00 00       	mov    ecx,0x1
   1400018b2:	e8 58 fd ff ff       	call   14000160f <funcfloatint>
   1400018b7:	83 c0 01             	add    eax,0x1
   1400018ba:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   1400018bd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400018c0:	48 83 c4 30          	add    rsp,0x30
   1400018c4:	5d                   	pop    rbp
   1400018c5:	c3                   	ret    

00000001400018c6 <test_funcdouble>:
   1400018c6:	55                   	push   rbp
   1400018c7:	48 89 e5             	mov    rbp,rsp
   1400018ca:	48 83 ec 30          	sub    rsp,0x30
   1400018ce:	f2 0f 10 05 5a 27 00 	movsd  xmm0,QWORD PTR [rip+0x275a]        # 140004030 <.rdata+0x10>
   1400018d5:	00 
   1400018d6:	48 8b 05 63 27 00 00 	mov    rax,QWORD PTR [rip+0x2763]        # 140004040 <.rdata+0x20>
   1400018dd:	66 0f 28 c8          	movapd xmm1,xmm0
   1400018e1:	66 48 0f 6e c0       	movq   xmm0,rax
   1400018e6:	e8 91 fd ff ff       	call   14000167c <funcdouble>
   1400018eb:	f2 0f 10 0d 55 27 00 	movsd  xmm1,QWORD PTR [rip+0x2755]        # 140004048 <.rdata+0x28>
   1400018f2:	00 
   1400018f3:	f2 0f 58 c1          	addsd  xmm0,xmm1
   1400018f7:	f2 0f 11 45 f8       	movsd  QWORD PTR [rbp-0x8],xmm0
   1400018fc:	f2 0f 10 45 f8       	movsd  xmm0,QWORD PTR [rbp-0x8]
   140001901:	f2 0f 2c c0          	cvttsd2si eax,xmm0
   140001905:	48 83 c4 30          	add    rsp,0x30
   140001909:	5d                   	pop    rbp
   14000190a:	c3                   	ret    

000000014000190b <test_funcstructvalue>:
   14000190b:	55                   	push   rbp
   14000190c:	48 89 e5             	mov    rbp,rsp
   14000190f:	48 83 c4 80          	add    rsp,0xffffffffffffff80
   140001913:	c7 45 e0 01 00 00 00 	mov    DWORD PTR [rbp-0x20],0x1
   14000191a:	c7 45 e4 02 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x2
   140001921:	c7 45 e8 03 00 00 00 	mov    DWORD PTR [rbp-0x18],0x3
   140001928:	c7 45 ec 04 00 00 00 	mov    DWORD PTR [rbp-0x14],0x4
   14000192f:	c7 45 f0 05 00 00 00 	mov    DWORD PTR [rbp-0x10],0x5
   140001936:	c7 45 f4 06 00 00 00 	mov    DWORD PTR [rbp-0xc],0x6
   14000193d:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
   140001944:	00 
   140001945:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
   14000194c:	00 
   14000194d:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
   140001954:	00 
   140001955:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140001959:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
   14000195d:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
   140001961:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
   140001965:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001969:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
   14000196d:	48 8d 55 c0          	lea    rdx,[rbp-0x40]
   140001971:	48 8d 45 a0          	lea    rax,[rbp-0x60]
   140001975:	48 89 c1             	mov    rcx,rax
   140001978:	e8 3f fd ff ff       	call   1400016bc <funcstructvalue>
   14000197d:	83 c0 01             	add    eax,0x1
   140001980:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140001983:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001986:	48 83 ec 80          	sub    rsp,0xffffffffffffff80
   14000198a:	5d                   	pop    rbp
   14000198b:	c3                   	ret    

000000014000198c <test_funcstructret>:
   14000198c:	55                   	push   rbp
   14000198d:	48 89 e5             	mov    rbp,rsp
   140001990:	48 83 ec 40          	sub    rsp,0x40
   140001994:	48 8d 45 e0          	lea    rax,[rbp-0x20]
   140001998:	41 b8 02 00 00 00    	mov    r8d,0x2
   14000199e:	ba 01 00 00 00       	mov    edx,0x1
   1400019a3:	48 89 c1             	mov    rcx,rax
   1400019a6:	e8 2c fd ff ff       	call   1400016d7 <funcstructret>
   1400019ab:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
   1400019ae:	48 83 c4 40          	add    rsp,0x40
   1400019b2:	5d                   	pop    rbp
   1400019b3:	c3                   	ret    

00000001400019b4 <test_funcvarargs1>:
   1400019b4:	55                   	push   rbp
   1400019b5:	48 89 e5             	mov    rbp,rsp
   1400019b8:	48 83 ec 30          	sub    rsp,0x30
   1400019bc:	b9 01 00 00 00       	mov    ecx,0x1
   1400019c1:	e8 6d fd ff ff       	call   140001733 <funcvarargs>
   1400019c6:	83 c0 01             	add    eax,0x1
   1400019c9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   1400019cc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400019cf:	48 83 c4 30          	add    rsp,0x30
   1400019d3:	5d                   	pop    rbp
   1400019d4:	c3                   	ret    

00000001400019d5 <test_funcvarargs4>:
   1400019d5:	55                   	push   rbp
   1400019d6:	48 89 e5             	mov    rbp,rsp
   1400019d9:	48 83 ec 40          	sub    rsp,0x40
   1400019dd:	c7 44 24 20 04 00 00 	mov    DWORD PTR [rsp+0x20],0x4
   1400019e4:	00 
   1400019e5:	41 b9 03 00 00 00    	mov    r9d,0x3
   1400019eb:	41 b8 02 00 00 00    	mov    r8d,0x2
   1400019f1:	ba 01 00 00 00       	mov    edx,0x1
   1400019f6:	b9 04 00 00 00       	mov    ecx,0x4
   1400019fb:	e8 33 fd ff ff       	call   140001733 <funcvarargs>
   140001a00:	83 c0 01             	add    eax,0x1
   140001a03:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140001a06:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001a09:	48 83 c4 40          	add    rsp,0x40
   140001a0d:	5d                   	pop    rbp
   140001a0e:	c3                   	ret    

0000000140001a0f <test_funcvarargs6>:
   140001a0f:	55                   	push   rbp
   140001a10:	48 89 e5             	mov    rbp,rsp
   140001a13:	48 83 ec 50          	sub    rsp,0x50
   140001a17:	c7 44 24 30 0c 00 00 	mov    DWORD PTR [rsp+0x30],0xc
   140001a1e:	00 
   140001a1f:	c7 44 24 28 0a 00 00 	mov    DWORD PTR [rsp+0x28],0xa
   140001a26:	00 
   140001a27:	c7 44 24 20 08 00 00 	mov    DWORD PTR [rsp+0x20],0x8
   140001a2e:	00 
   140001a2f:	41 b9 06 00 00 00    	mov    r9d,0x6
   140001a35:	41 b8 04 00 00 00    	mov    r8d,0x4
   140001a3b:	ba 02 00 00 00       	mov    edx,0x2
   140001a40:	b9 06 00 00 00       	mov    ecx,0x6
   140001a45:	e8 e9 fc ff ff       	call   140001733 <funcvarargs>
   140001a4a:	83 c0 01             	add    eax,0x1
   140001a4d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140001a50:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001a53:	48 83 c4 50          	add    rsp,0x50
   140001a57:	5d                   	pop    rbp
   140001a58:	c3                   	ret    

0000000140001a59 <main>:
   140001a59:	55                   	push   rbp
   140001a5a:	48 89 e5             	mov    rbp,rsp
   140001a5d:	48 83 ec 30          	sub    rsp,0x30
   140001a61:	e8 2a 01 00 00       	call   140001b90 <__main>
   140001a66:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140001a6d:	e8 1e fd ff ff       	call   140001790 <test_funcintr>
   140001a72:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
   140001a75:	e8 32 fd ff ff       	call   1400017ac <test_funcint64r>
   140001a7a:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
   140001a7d:	e8 49 fd ff ff       	call   1400017cb <test_funcint64r2>
   140001a82:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
   140001a85:	e8 60 fd ff ff       	call   1400017ea <test_funcint>
   140001a8a:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
   140001a8d:	e8 84 fd ff ff       	call   140001816 <test_funcchar>
   140001a92:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
   140001a95:	e8 a2 fd ff ff       	call   14000183c <test_funcfloat>
   140001a9a:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
   140001a9d:	e8 ed fd ff ff       	call   14000188f <test_funcfloatint>
   140001aa2:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
   140001aa5:	e8 1c fe ff ff       	call   1400018c6 <test_funcdouble>
   140001aaa:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
   140001aad:	e8 59 fe ff ff       	call   14000190b <test_funcstructvalue>
   140001ab2:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
   140001ab5:	e8 d2 fe ff ff       	call   14000198c <test_funcstructret>
   140001aba:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
   140001abd:	e8 f2 fe ff ff       	call   1400019b4 <test_funcvarargs1>
   140001ac2:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
   140001ac5:	e8 0b ff ff ff       	call   1400019d5 <test_funcvarargs4>
   140001aca:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
   140001acd:	e8 3d ff ff ff       	call   140001a0f <test_funcvarargs6>
   140001ad2:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
   140001ad5:	b8 00 00 00 00       	mov    eax,0x0
   140001ada:	48 83 c4 30          	add    rsp,0x30
   140001ade:	5d                   	pop    rbp
   140001adf:	c3                   	ret    

0000000140001ae0 <__do_global_dtors>:
   140001ae0:	48 83 ec 28          	sub    rsp,0x28
   140001ae4:	48 8b 05 25 15 00 00 	mov    rax,QWORD PTR [rip+0x1525]        # 140003010 <p.0>
   140001aeb:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001aee:	48 85 c0             	test   rax,rax
   140001af1:	74 22                	je     140001b15 <__do_global_dtors+0x35>
   140001af3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001af8:	ff d0                	call   rax
   140001afa:	48 8b 05 0f 15 00 00 	mov    rax,QWORD PTR [rip+0x150f]        # 140003010 <p.0>
   140001b01:	48 8d 50 08          	lea    rdx,[rax+0x8]
   140001b05:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   140001b09:	48 89 15 00 15 00 00 	mov    QWORD PTR [rip+0x1500],rdx        # 140003010 <p.0>
   140001b10:	48 85 c0             	test   rax,rax
   140001b13:	75 e3                	jne    140001af8 <__do_global_dtors+0x18>
   140001b15:	48 83 c4 28          	add    rsp,0x28
   140001b19:	c3                   	ret    
   140001b1a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000140001b20 <__do_global_ctors>:
   140001b20:	56                   	push   rsi
   140001b21:	53                   	push   rbx
   140001b22:	48 83 ec 28          	sub    rsp,0x28
   140001b26:	48 8b 15 33 28 00 00 	mov    rdx,QWORD PTR [rip+0x2833]        # 140004360 <.refptr.__CTOR_LIST__>
   140001b2d:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140001b30:	89 c1                	mov    ecx,eax
   140001b32:	83 f8 ff             	cmp    eax,0xffffffff
   140001b35:	74 39                	je     140001b70 <__do_global_ctors+0x50>
   140001b37:	85 c9                	test   ecx,ecx
   140001b39:	74 20                	je     140001b5b <__do_global_ctors+0x3b>
   140001b3b:	89 c8                	mov    eax,ecx
   140001b3d:	83 e9 01             	sub    ecx,0x1
   140001b40:	48 8d 1c c2          	lea    rbx,[rdx+rax*8]
   140001b44:	48 29 c8             	sub    rax,rcx
   140001b47:	48 8d 74 c2 f8       	lea    rsi,[rdx+rax*8-0x8]
   140001b4c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001b50:	ff 13                	call   QWORD PTR [rbx]
   140001b52:	48 83 eb 08          	sub    rbx,0x8
   140001b56:	48 39 f3             	cmp    rbx,rsi
   140001b59:	75 f5                	jne    140001b50 <__do_global_ctors+0x30>
   140001b5b:	48 8d 0d 7e ff ff ff 	lea    rcx,[rip+0xffffffffffffff7e]        # 140001ae0 <__do_global_dtors>
   140001b62:	48 83 c4 28          	add    rsp,0x28
   140001b66:	5b                   	pop    rbx
   140001b67:	5e                   	pop    rsi
   140001b68:	e9 93 f9 ff ff       	jmp    140001500 <atexit>
   140001b6d:	0f 1f 00             	nop    DWORD PTR [rax]
   140001b70:	31 c0                	xor    eax,eax
   140001b72:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140001b78:	44 8d 40 01          	lea    r8d,[rax+0x1]
   140001b7c:	89 c1                	mov    ecx,eax
   140001b7e:	4a 83 3c c2 00       	cmp    QWORD PTR [rdx+r8*8],0x0
   140001b83:	4c 89 c0             	mov    rax,r8
   140001b86:	75 f0                	jne    140001b78 <__do_global_ctors+0x58>
   140001b88:	eb ad                	jmp    140001b37 <__do_global_ctors+0x17>
   140001b8a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000140001b90 <__main>:
   140001b90:	8b 05 aa 54 00 00    	mov    eax,DWORD PTR [rip+0x54aa]        # 140007040 <initialized>
   140001b96:	85 c0                	test   eax,eax
   140001b98:	74 06                	je     140001ba0 <__main+0x10>
   140001b9a:	c3                   	ret    
   140001b9b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001ba0:	c7 05 96 54 00 00 01 	mov    DWORD PTR [rip+0x5496],0x1        # 140007040 <initialized>
   140001ba7:	00 00 00 
   140001baa:	e9 71 ff ff ff       	jmp    140001b20 <__do_global_ctors>
   140001baf:	90                   	nop

0000000140001bb0 <my_lconv_init>:
   140001bb0:	48 ff 25 3d 66 00 00 	rex.W jmp QWORD PTR [rip+0x663d]        # 1400081f4 <__imp___lconv_init>
   140001bb7:	90                   	nop
   140001bb8:	90                   	nop
   140001bb9:	90                   	nop
   140001bba:	90                   	nop
   140001bbb:	90                   	nop
   140001bbc:	90                   	nop
   140001bbd:	90                   	nop
   140001bbe:	90                   	nop
   140001bbf:	90                   	nop

0000000140001bc0 <_setargv>:
   140001bc0:	31 c0                	xor    eax,eax
   140001bc2:	c3                   	ret    
   140001bc3:	90                   	nop
   140001bc4:	90                   	nop
   140001bc5:	90                   	nop
   140001bc6:	90                   	nop
   140001bc7:	90                   	nop
   140001bc8:	90                   	nop
   140001bc9:	90                   	nop
   140001bca:	90                   	nop
   140001bcb:	90                   	nop
   140001bcc:	90                   	nop
   140001bcd:	90                   	nop
   140001bce:	90                   	nop
   140001bcf:	90                   	nop

0000000140001bd0 <__dyn_tls_dtor>:
   140001bd0:	48 83 ec 28          	sub    rsp,0x28
   140001bd4:	83 fa 03             	cmp    edx,0x3
   140001bd7:	74 17                	je     140001bf0 <__dyn_tls_dtor+0x20>
   140001bd9:	85 d2                	test   edx,edx
   140001bdb:	74 13                	je     140001bf0 <__dyn_tls_dtor+0x20>
   140001bdd:	b8 01 00 00 00       	mov    eax,0x1
   140001be2:	48 83 c4 28          	add    rsp,0x28
   140001be6:	c3                   	ret    
   140001be7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140001bee:	00 00 
   140001bf0:	e8 cb 09 00 00       	call   1400025c0 <__mingw_TLScallback>
   140001bf5:	b8 01 00 00 00       	mov    eax,0x1
   140001bfa:	48 83 c4 28          	add    rsp,0x28
   140001bfe:	c3                   	ret    
   140001bff:	90                   	nop

0000000140001c00 <__dyn_tls_init>:
   140001c00:	56                   	push   rsi
   140001c01:	53                   	push   rbx
   140001c02:	48 83 ec 28          	sub    rsp,0x28
   140001c06:	48 8b 05 33 27 00 00 	mov    rax,QWORD PTR [rip+0x2733]        # 140004340 <.refptr._CRT_MT>
   140001c0d:	83 38 02             	cmp    DWORD PTR [rax],0x2
   140001c10:	74 06                	je     140001c18 <__dyn_tls_init+0x18>
   140001c12:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
   140001c18:	83 fa 02             	cmp    edx,0x2
   140001c1b:	74 13                	je     140001c30 <__dyn_tls_init+0x30>
   140001c1d:	83 fa 01             	cmp    edx,0x1
   140001c20:	74 4e                	je     140001c70 <__dyn_tls_init+0x70>
   140001c22:	b8 01 00 00 00       	mov    eax,0x1
   140001c27:	48 83 c4 28          	add    rsp,0x28
   140001c2b:	5b                   	pop    rbx
   140001c2c:	5e                   	pop    rsi
   140001c2d:	c3                   	ret    
   140001c2e:	66 90                	xchg   ax,ax
   140001c30:	48 8d 1d 29 74 00 00 	lea    rbx,[rip+0x7429]        # 140009060 <__xd_z>
   140001c37:	48 8d 35 22 74 00 00 	lea    rsi,[rip+0x7422]        # 140009060 <__xd_z>
   140001c3e:	48 39 de             	cmp    rsi,rbx
   140001c41:	74 df                	je     140001c22 <__dyn_tls_init+0x22>
   140001c43:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001c48:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140001c4b:	48 85 c0             	test   rax,rax
   140001c4e:	74 02                	je     140001c52 <__dyn_tls_init+0x52>
   140001c50:	ff d0                	call   rax
   140001c52:	48 83 c3 08          	add    rbx,0x8
   140001c56:	48 39 de             	cmp    rsi,rbx
   140001c59:	75 ed                	jne    140001c48 <__dyn_tls_init+0x48>
   140001c5b:	b8 01 00 00 00       	mov    eax,0x1
   140001c60:	48 83 c4 28          	add    rsp,0x28
   140001c64:	5b                   	pop    rbx
   140001c65:	5e                   	pop    rsi
   140001c66:	c3                   	ret    
   140001c67:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140001c6e:	00 00 
   140001c70:	e8 4b 09 00 00       	call   1400025c0 <__mingw_TLScallback>
   140001c75:	b8 01 00 00 00       	mov    eax,0x1
   140001c7a:	48 83 c4 28          	add    rsp,0x28
   140001c7e:	5b                   	pop    rbx
   140001c7f:	5e                   	pop    rsi
   140001c80:	c3                   	ret    
   140001c81:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001c88:	00 00 00 00 
   140001c8c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000140001c90 <__tlregdtor>:
   140001c90:	31 c0                	xor    eax,eax
   140001c92:	c3                   	ret    
   140001c93:	90                   	nop
   140001c94:	90                   	nop
   140001c95:	90                   	nop
   140001c96:	90                   	nop
   140001c97:	90                   	nop
   140001c98:	90                   	nop
   140001c99:	90                   	nop
   140001c9a:	90                   	nop
   140001c9b:	90                   	nop
   140001c9c:	90                   	nop
   140001c9d:	90                   	nop
   140001c9e:	90                   	nop
   140001c9f:	90                   	nop

0000000140001ca0 <_matherr>:
   140001ca0:	56                   	push   rsi
   140001ca1:	53                   	push   rbx
   140001ca2:	48 83 ec 78          	sub    rsp,0x78
   140001ca6:	0f 29 74 24 40       	movaps XMMWORD PTR [rsp+0x40],xmm6
   140001cab:	0f 29 7c 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm7
   140001cb0:	44 0f 29 44 24 60    	movaps XMMWORD PTR [rsp+0x60],xmm8
   140001cb6:	83 39 06             	cmp    DWORD PTR [rcx],0x6
   140001cb9:	0f 87 cd 00 00 00    	ja     140001d8c <_matherr+0xec>
   140001cbf:	8b 01                	mov    eax,DWORD PTR [rcx]
   140001cc1:	48 8d 15 1c 25 00 00 	lea    rdx,[rip+0x251c]        # 1400041e4 <.rdata+0x124>
   140001cc8:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   140001ccc:	48 01 d0             	add    rax,rdx
   140001ccf:	ff e0                	jmp    rax
   140001cd1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001cd8:	48 8d 1d b7 24 00 00 	lea    rbx,[rip+0x24b7]        # 140004196 <.rdata+0xd6>
   140001cdf:	f2 44 0f 10 41 20    	movsd  xmm8,QWORD PTR [rcx+0x20]
   140001ce5:	f2 0f 10 79 18       	movsd  xmm7,QWORD PTR [rcx+0x18]
   140001cea:	f2 0f 10 71 10       	movsd  xmm6,QWORD PTR [rcx+0x10]
   140001cef:	48 8b 71 08          	mov    rsi,QWORD PTR [rcx+0x8]
   140001cf3:	b9 02 00 00 00       	mov    ecx,0x2
   140001cf8:	e8 83 0e 00 00       	call   140002b80 <__acrt_iob_func>
   140001cfd:	f2 44 0f 11 44 24 30 	movsd  QWORD PTR [rsp+0x30],xmm8
   140001d04:	49 89 d8             	mov    r8,rbx
   140001d07:	48 8d 15 aa 24 00 00 	lea    rdx,[rip+0x24aa]        # 1400041b8 <.rdata+0xf8>
   140001d0e:	f2 0f 11 7c 24 28    	movsd  QWORD PTR [rsp+0x28],xmm7
   140001d14:	48 89 c1             	mov    rcx,rax
   140001d17:	49 89 f1             	mov    r9,rsi
   140001d1a:	f2 0f 11 74 24 20    	movsd  QWORD PTR [rsp+0x20],xmm6
   140001d20:	e8 eb 0d 00 00       	call   140002b10 <fprintf>
   140001d25:	90                   	nop
   140001d26:	0f 28 74 24 40       	movaps xmm6,XMMWORD PTR [rsp+0x40]
   140001d2b:	0f 28 7c 24 50       	movaps xmm7,XMMWORD PTR [rsp+0x50]
   140001d30:	31 c0                	xor    eax,eax
   140001d32:	44 0f 28 44 24 60    	movaps xmm8,XMMWORD PTR [rsp+0x60]
   140001d38:	48 83 c4 78          	add    rsp,0x78
   140001d3c:	5b                   	pop    rbx
   140001d3d:	5e                   	pop    rsi
   140001d3e:	c3                   	ret    
   140001d3f:	90                   	nop
   140001d40:	48 8d 1d 89 23 00 00 	lea    rbx,[rip+0x2389]        # 1400040d0 <.rdata+0x10>
   140001d47:	eb 96                	jmp    140001cdf <_matherr+0x3f>
   140001d49:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001d50:	48 8d 1d b9 23 00 00 	lea    rbx,[rip+0x23b9]        # 140004110 <.rdata+0x50>
   140001d57:	eb 86                	jmp    140001cdf <_matherr+0x3f>
   140001d59:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001d60:	48 8d 1d 89 23 00 00 	lea    rbx,[rip+0x2389]        # 1400040f0 <.rdata+0x30>
   140001d67:	e9 73 ff ff ff       	jmp    140001cdf <_matherr+0x3f>
   140001d6c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001d70:	48 8d 1d e9 23 00 00 	lea    rbx,[rip+0x23e9]        # 140004160 <.rdata+0xa0>
   140001d77:	e9 63 ff ff ff       	jmp    140001cdf <_matherr+0x3f>
   140001d7c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001d80:	48 8d 1d b1 23 00 00 	lea    rbx,[rip+0x23b1]        # 140004138 <.rdata+0x78>
   140001d87:	e9 53 ff ff ff       	jmp    140001cdf <_matherr+0x3f>
   140001d8c:	48 8d 1d 2d 23 00 00 	lea    rbx,[rip+0x232d]        # 1400040c0 <.rdata>
   140001d93:	e9 47 ff ff ff       	jmp    140001cdf <_matherr+0x3f>
   140001d98:	90                   	nop
   140001d99:	90                   	nop
   140001d9a:	90                   	nop
   140001d9b:	90                   	nop
   140001d9c:	90                   	nop
   140001d9d:	90                   	nop
   140001d9e:	90                   	nop
   140001d9f:	90                   	nop

0000000140001da0 <_fpreset>:
   140001da0:	db e3                	fninit 
   140001da2:	c3                   	ret    
   140001da3:	90                   	nop
   140001da4:	90                   	nop
   140001da5:	90                   	nop
   140001da6:	90                   	nop
   140001da7:	90                   	nop
   140001da8:	90                   	nop
   140001da9:	90                   	nop
   140001daa:	90                   	nop
   140001dab:	90                   	nop
   140001dac:	90                   	nop
   140001dad:	90                   	nop
   140001dae:	90                   	nop
   140001daf:	90                   	nop

0000000140001db0 <__report_error>:
   140001db0:	41 54                	push   r12
   140001db2:	53                   	push   rbx
   140001db3:	48 83 ec 38          	sub    rsp,0x38
   140001db7:	49 89 cc             	mov    r12,rcx
   140001dba:	48 8d 44 24 58       	lea    rax,[rsp+0x58]
   140001dbf:	b9 02 00 00 00       	mov    ecx,0x2
   140001dc4:	48 89 54 24 58       	mov    QWORD PTR [rsp+0x58],rdx
   140001dc9:	4c 89 44 24 60       	mov    QWORD PTR [rsp+0x60],r8
   140001dce:	4c 89 4c 24 68       	mov    QWORD PTR [rsp+0x68],r9
   140001dd3:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   140001dd8:	e8 a3 0d 00 00       	call   140002b80 <__acrt_iob_func>
   140001ddd:	41 b8 1b 00 00 00    	mov    r8d,0x1b
   140001de3:	ba 01 00 00 00       	mov    edx,0x1
   140001de8:	48 8d 0d 11 24 00 00 	lea    rcx,[rip+0x2411]        # 140004200 <.rdata>
   140001def:	49 89 c1             	mov    r9,rax
   140001df2:	e8 09 0d 00 00       	call   140002b00 <fwrite>
   140001df7:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
   140001dfc:	b9 02 00 00 00       	mov    ecx,0x2
   140001e01:	e8 7a 0d 00 00       	call   140002b80 <__acrt_iob_func>
   140001e06:	4c 89 e2             	mov    rdx,r12
   140001e09:	48 89 c1             	mov    rcx,rax
   140001e0c:	49 89 d8             	mov    r8,rbx
   140001e0f:	e8 bc 0c 00 00       	call   140002ad0 <vfprintf>
   140001e14:	e8 0f 0d 00 00       	call   140002b28 <abort>
   140001e19:	90                   	nop
   140001e1a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000140001e20 <mark_section_writable>:
   140001e20:	41 54                	push   r12
   140001e22:	56                   	push   rsi
   140001e23:	53                   	push   rbx
   140001e24:	48 83 ec 50          	sub    rsp,0x50
   140001e28:	48 63 1d 95 52 00 00 	movsxd rbx,DWORD PTR [rip+0x5295]        # 1400070c4 <maxSections>
   140001e2f:	49 89 cc             	mov    r12,rcx
   140001e32:	85 db                	test   ebx,ebx
   140001e34:	0f 8e 16 01 00 00    	jle    140001f50 <mark_section_writable+0x130>
   140001e3a:	48 8b 05 87 52 00 00 	mov    rax,QWORD PTR [rip+0x5287]        # 1400070c8 <the_secs>
   140001e41:	31 c9                	xor    ecx,ecx
   140001e43:	48 83 c0 18          	add    rax,0x18
   140001e47:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140001e4e:	00 00 
   140001e50:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140001e53:	4c 39 e2             	cmp    rdx,r12
   140001e56:	77 14                	ja     140001e6c <mark_section_writable+0x4c>
   140001e58:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   140001e5c:	45 8b 40 08          	mov    r8d,DWORD PTR [r8+0x8]
   140001e60:	4c 01 c2             	add    rdx,r8
   140001e63:	49 39 d4             	cmp    r12,rdx
   140001e66:	0f 82 87 00 00 00    	jb     140001ef3 <mark_section_writable+0xd3>
   140001e6c:	83 c1 01             	add    ecx,0x1
   140001e6f:	48 83 c0 28          	add    rax,0x28
   140001e73:	39 d9                	cmp    ecx,ebx
   140001e75:	75 d9                	jne    140001e50 <mark_section_writable+0x30>
   140001e77:	4c 89 e1             	mov    rcx,r12
   140001e7a:	e8 51 09 00 00       	call   1400027d0 <__mingw_GetSectionForAddress>
   140001e7f:	48 89 c6             	mov    rsi,rax
   140001e82:	48 85 c0             	test   rax,rax
   140001e85:	0f 84 e7 00 00 00    	je     140001f72 <mark_section_writable+0x152>
   140001e8b:	48 8b 05 36 52 00 00 	mov    rax,QWORD PTR [rip+0x5236]        # 1400070c8 <the_secs>
   140001e92:	48 8d 1c 9b          	lea    rbx,[rbx+rbx*4]
   140001e96:	48 c1 e3 03          	shl    rbx,0x3
   140001e9a:	48 01 d8             	add    rax,rbx
   140001e9d:	48 89 70 20          	mov    QWORD PTR [rax+0x20],rsi
   140001ea1:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
   140001ea7:	e8 54 0a 00 00       	call   140002900 <_GetPEImageBase>
   140001eac:	8b 4e 0c             	mov    ecx,DWORD PTR [rsi+0xc]
   140001eaf:	48 8d 54 24 20       	lea    rdx,[rsp+0x20]
   140001eb4:	41 b8 30 00 00 00    	mov    r8d,0x30
   140001eba:	48 01 c1             	add    rcx,rax
   140001ebd:	48 8b 05 04 52 00 00 	mov    rax,QWORD PTR [rip+0x5204]        # 1400070c8 <the_secs>
   140001ec4:	48 89 4c 18 18       	mov    QWORD PTR [rax+rbx*1+0x18],rcx
   140001ec9:	ff 15 f5 62 00 00    	call   QWORD PTR [rip+0x62f5]        # 1400081c4 <__imp_VirtualQuery>
   140001ecf:	48 85 c0             	test   rax,rax
   140001ed2:	0f 84 7f 00 00 00    	je     140001f57 <mark_section_writable+0x137>
   140001ed8:	8b 44 24 44          	mov    eax,DWORD PTR [rsp+0x44]
   140001edc:	8d 50 c0             	lea    edx,[rax-0x40]
   140001edf:	83 e2 bf             	and    edx,0xffffffbf
   140001ee2:	74 08                	je     140001eec <mark_section_writable+0xcc>
   140001ee4:	8d 50 fc             	lea    edx,[rax-0x4]
   140001ee7:	83 e2 fb             	and    edx,0xfffffffb
   140001eea:	75 14                	jne    140001f00 <mark_section_writable+0xe0>
   140001eec:	83 05 d1 51 00 00 01 	add    DWORD PTR [rip+0x51d1],0x1        # 1400070c4 <maxSections>
   140001ef3:	48 83 c4 50          	add    rsp,0x50
   140001ef7:	5b                   	pop    rbx
   140001ef8:	5e                   	pop    rsi
   140001ef9:	41 5c                	pop    r12
   140001efb:	c3                   	ret    
   140001efc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001f00:	83 f8 02             	cmp    eax,0x2
   140001f03:	48 8b 4c 24 20       	mov    rcx,QWORD PTR [rsp+0x20]
   140001f08:	48 8b 54 24 38       	mov    rdx,QWORD PTR [rsp+0x38]
   140001f0d:	41 b8 04 00 00 00    	mov    r8d,0x4
   140001f13:	b8 40 00 00 00       	mov    eax,0x40
   140001f18:	44 0f 45 c0          	cmovne r8d,eax
   140001f1c:	48 03 1d a5 51 00 00 	add    rbx,QWORD PTR [rip+0x51a5]        # 1400070c8 <the_secs>
   140001f23:	48 89 4b 08          	mov    QWORD PTR [rbx+0x8],rcx
   140001f27:	49 89 d9             	mov    r9,rbx
   140001f2a:	48 89 53 10          	mov    QWORD PTR [rbx+0x10],rdx
   140001f2e:	ff 15 88 62 00 00    	call   QWORD PTR [rip+0x6288]        # 1400081bc <__imp_VirtualProtect>
   140001f34:	85 c0                	test   eax,eax
   140001f36:	75 b4                	jne    140001eec <mark_section_writable+0xcc>
   140001f38:	ff 15 46 62 00 00    	call   QWORD PTR [rip+0x6246]        # 140008184 <__imp_GetLastError>
   140001f3e:	48 8d 0d 33 23 00 00 	lea    rcx,[rip+0x2333]        # 140004278 <.rdata+0x78>
   140001f45:	89 c2                	mov    edx,eax
   140001f47:	e8 64 fe ff ff       	call   140001db0 <__report_error>
   140001f4c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001f50:	31 db                	xor    ebx,ebx
   140001f52:	e9 20 ff ff ff       	jmp    140001e77 <mark_section_writable+0x57>
   140001f57:	48 8b 05 6a 51 00 00 	mov    rax,QWORD PTR [rip+0x516a]        # 1400070c8 <the_secs>
   140001f5e:	8b 56 08             	mov    edx,DWORD PTR [rsi+0x8]
   140001f61:	48 8d 0d d8 22 00 00 	lea    rcx,[rip+0x22d8]        # 140004240 <.rdata+0x40>
   140001f68:	4c 8b 44 18 18       	mov    r8,QWORD PTR [rax+rbx*1+0x18]
   140001f6d:	e8 3e fe ff ff       	call   140001db0 <__report_error>
   140001f72:	4c 89 e2             	mov    rdx,r12
   140001f75:	48 8d 0d a4 22 00 00 	lea    rcx,[rip+0x22a4]        # 140004220 <.rdata+0x20>
   140001f7c:	e8 2f fe ff ff       	call   140001db0 <__report_error>
   140001f81:	90                   	nop
   140001f82:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001f89:	00 00 00 00 
   140001f8d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000140001f90 <_pei386_runtime_relocator>:
   140001f90:	55                   	push   rbp
   140001f91:	41 57                	push   r15
   140001f93:	41 56                	push   r14
   140001f95:	41 55                	push   r13
   140001f97:	41 54                	push   r12
   140001f99:	57                   	push   rdi
   140001f9a:	56                   	push   rsi
   140001f9b:	53                   	push   rbx
   140001f9c:	48 83 ec 38          	sub    rsp,0x38
   140001fa0:	48 8d ac 24 80 00 00 	lea    rbp,[rsp+0x80]
   140001fa7:	00 
   140001fa8:	8b 3d 12 51 00 00    	mov    edi,DWORD PTR [rip+0x5112]        # 1400070c0 <was_init.0>
   140001fae:	85 ff                	test   edi,edi
   140001fb0:	74 16                	je     140001fc8 <_pei386_runtime_relocator+0x38>
   140001fb2:	48 8d 65 b8          	lea    rsp,[rbp-0x48]
   140001fb6:	5b                   	pop    rbx
   140001fb7:	5e                   	pop    rsi
   140001fb8:	5f                   	pop    rdi
   140001fb9:	41 5c                	pop    r12
   140001fbb:	41 5d                	pop    r13
   140001fbd:	41 5e                	pop    r14
   140001fbf:	41 5f                	pop    r15
   140001fc1:	5d                   	pop    rbp
   140001fc2:	c3                   	ret    
   140001fc3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001fc8:	c7 05 ee 50 00 00 01 	mov    DWORD PTR [rip+0x50ee],0x1        # 1400070c0 <was_init.0>
   140001fcf:	00 00 00 
   140001fd2:	e8 79 08 00 00       	call   140002850 <__mingw_GetSectionCount>
   140001fd7:	48 98                	cdqe   
   140001fd9:	48 8d 04 80          	lea    rax,[rax+rax*4]
   140001fdd:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   140001fe4:	00 
   140001fe5:	48 83 e0 f0          	and    rax,0xfffffffffffffff0
   140001fe9:	e8 a2 0a 00 00       	call   140002a90 <___chkstk_ms>
   140001fee:	4c 8b 25 7b 23 00 00 	mov    r12,QWORD PTR [rip+0x237b]        # 140004370 <.refptr.__RUNTIME_PSEUDO_RELOC_LIST_END__>
   140001ff5:	48 8b 1d 84 23 00 00 	mov    rbx,QWORD PTR [rip+0x2384]        # 140004380 <.refptr.__RUNTIME_PSEUDO_RELOC_LIST__>
   140001ffc:	c7 05 be 50 00 00 00 	mov    DWORD PTR [rip+0x50be],0x0        # 1400070c4 <maxSections>
   140002003:	00 00 00 
   140002006:	48 29 c4             	sub    rsp,rax
   140002009:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
   14000200e:	48 89 05 b3 50 00 00 	mov    QWORD PTR [rip+0x50b3],rax        # 1400070c8 <the_secs>
   140002015:	4c 89 e0             	mov    rax,r12
   140002018:	48 29 d8             	sub    rax,rbx
   14000201b:	48 83 f8 07          	cmp    rax,0x7
   14000201f:	7e 91                	jle    140001fb2 <_pei386_runtime_relocator+0x22>
   140002021:	8b 13                	mov    edx,DWORD PTR [rbx]
   140002023:	48 83 f8 0b          	cmp    rax,0xb
   140002027:	0f 8f 2b 01 00 00    	jg     140002158 <_pei386_runtime_relocator+0x1c8>
   14000202d:	85 d2                	test   edx,edx
   14000202f:	0f 85 9b 01 00 00    	jne    1400021d0 <_pei386_runtime_relocator+0x240>
   140002035:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
   140002038:	85 c0                	test   eax,eax
   14000203a:	0f 85 90 01 00 00    	jne    1400021d0 <_pei386_runtime_relocator+0x240>
   140002040:	8b 53 08             	mov    edx,DWORD PTR [rbx+0x8]
   140002043:	83 fa 01             	cmp    edx,0x1
   140002046:	0f 85 c5 01 00 00    	jne    140002211 <_pei386_runtime_relocator+0x281>
   14000204c:	48 83 c3 0c          	add    rbx,0xc
   140002050:	4c 39 e3             	cmp    rbx,r12
   140002053:	0f 83 59 ff ff ff    	jae    140001fb2 <_pei386_runtime_relocator+0x22>
   140002059:	4c 8b 2d 40 23 00 00 	mov    r13,QWORD PTR [rip+0x2340]        # 1400043a0 <.refptr.__image_base__>
   140002060:	49 be 00 00 00 00 ff 	movabs r14,0xffffffff00000000
   140002067:	ff ff ff 
   14000206a:	eb 31                	jmp    14000209d <_pei386_runtime_relocator+0x10d>
   14000206c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140002070:	0f b6 16             	movzx  edx,BYTE PTR [rsi]
   140002073:	48 89 f1             	mov    rcx,rsi
   140002076:	49 89 d0             	mov    r8,rdx
   140002079:	49 81 c8 00 ff ff ff 	or     r8,0xffffffffffffff00
   140002080:	84 d2                	test   dl,dl
   140002082:	49 0f 48 d0          	cmovs  rdx,r8
   140002086:	48 29 c2             	sub    rdx,rax
   140002089:	49 01 d7             	add    r15,rdx
   14000208c:	e8 8f fd ff ff       	call   140001e20 <mark_section_writable>
   140002091:	44 88 3e             	mov    BYTE PTR [rsi],r15b
   140002094:	48 83 c3 0c          	add    rbx,0xc
   140002098:	4c 39 e3             	cmp    rbx,r12
   14000209b:	73 63                	jae    140002100 <_pei386_runtime_relocator+0x170>
   14000209d:	8b 03                	mov    eax,DWORD PTR [rbx]
   14000209f:	8b 73 04             	mov    esi,DWORD PTR [rbx+0x4]
   1400020a2:	0f b6 53 08          	movzx  edx,BYTE PTR [rbx+0x8]
   1400020a6:	4c 01 e8             	add    rax,r13
   1400020a9:	4c 01 ee             	add    rsi,r13
   1400020ac:	4c 8b 38             	mov    r15,QWORD PTR [rax]
   1400020af:	83 fa 20             	cmp    edx,0x20
   1400020b2:	0f 84 f0 00 00 00    	je     1400021a8 <_pei386_runtime_relocator+0x218>
   1400020b8:	0f 87 c2 00 00 00    	ja     140002180 <_pei386_runtime_relocator+0x1f0>
   1400020be:	83 fa 08             	cmp    edx,0x8
   1400020c1:	74 ad                	je     140002070 <_pei386_runtime_relocator+0xe0>
   1400020c3:	83 fa 10             	cmp    edx,0x10
   1400020c6:	0f 85 39 01 00 00    	jne    140002205 <_pei386_runtime_relocator+0x275>
   1400020cc:	0f b7 16             	movzx  edx,WORD PTR [rsi]
   1400020cf:	48 89 f1             	mov    rcx,rsi
   1400020d2:	49 89 d0             	mov    r8,rdx
   1400020d5:	49 81 c8 00 00 ff ff 	or     r8,0xffffffffffff0000
   1400020dc:	66 85 d2             	test   dx,dx
   1400020df:	49 0f 48 d0          	cmovs  rdx,r8
   1400020e3:	48 83 c3 0c          	add    rbx,0xc
   1400020e7:	48 29 c2             	sub    rdx,rax
   1400020ea:	49 01 d7             	add    r15,rdx
   1400020ed:	e8 2e fd ff ff       	call   140001e20 <mark_section_writable>
   1400020f2:	66 44 89 3e          	mov    WORD PTR [rsi],r15w
   1400020f6:	4c 39 e3             	cmp    rbx,r12
   1400020f9:	72 a2                	jb     14000209d <_pei386_runtime_relocator+0x10d>
   1400020fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140002100:	8b 05 be 4f 00 00    	mov    eax,DWORD PTR [rip+0x4fbe]        # 1400070c4 <maxSections>
   140002106:	85 c0                	test   eax,eax
   140002108:	0f 8e a4 fe ff ff    	jle    140001fb2 <_pei386_runtime_relocator+0x22>
   14000210e:	48 8b 35 a7 60 00 00 	mov    rsi,QWORD PTR [rip+0x60a7]        # 1400081bc <__imp_VirtualProtect>
   140002115:	31 db                	xor    ebx,ebx
   140002117:	4c 8d 65 ac          	lea    r12,[rbp-0x54]
   14000211b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140002120:	48 8b 05 a1 4f 00 00 	mov    rax,QWORD PTR [rip+0x4fa1]        # 1400070c8 <the_secs>
   140002127:	48 01 d8             	add    rax,rbx
   14000212a:	44 8b 00             	mov    r8d,DWORD PTR [rax]
   14000212d:	45 85 c0             	test   r8d,r8d
   140002130:	74 0d                	je     14000213f <_pei386_runtime_relocator+0x1af>
   140002132:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
   140002136:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   14000213a:	4d 89 e1             	mov    r9,r12
   14000213d:	ff d6                	call   rsi
   14000213f:	83 c7 01             	add    edi,0x1
   140002142:	48 83 c3 28          	add    rbx,0x28
   140002146:	3b 3d 78 4f 00 00    	cmp    edi,DWORD PTR [rip+0x4f78]        # 1400070c4 <maxSections>
   14000214c:	7c d2                	jl     140002120 <_pei386_runtime_relocator+0x190>
   14000214e:	e9 5f fe ff ff       	jmp    140001fb2 <_pei386_runtime_relocator+0x22>
   140002153:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140002158:	85 d2                	test   edx,edx
   14000215a:	75 74                	jne    1400021d0 <_pei386_runtime_relocator+0x240>
   14000215c:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
   14000215f:	89 c1                	mov    ecx,eax
   140002161:	0b 4b 08             	or     ecx,DWORD PTR [rbx+0x8]
   140002164:	0f 85 ce fe ff ff    	jne    140002038 <_pei386_runtime_relocator+0xa8>
   14000216a:	8b 53 0c             	mov    edx,DWORD PTR [rbx+0xc]
   14000216d:	48 83 c3 0c          	add    rbx,0xc
   140002171:	e9 b7 fe ff ff       	jmp    14000202d <_pei386_runtime_relocator+0x9d>
   140002176:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   14000217d:	00 00 00 
   140002180:	83 fa 40             	cmp    edx,0x40
   140002183:	0f 85 7c 00 00 00    	jne    140002205 <_pei386_runtime_relocator+0x275>
   140002189:	48 8b 16             	mov    rdx,QWORD PTR [rsi]
   14000218c:	48 89 f1             	mov    rcx,rsi
   14000218f:	48 29 c2             	sub    rdx,rax
   140002192:	49 01 d7             	add    r15,rdx
   140002195:	e8 86 fc ff ff       	call   140001e20 <mark_section_writable>
   14000219a:	4c 89 3e             	mov    QWORD PTR [rsi],r15
   14000219d:	e9 f2 fe ff ff       	jmp    140002094 <_pei386_runtime_relocator+0x104>
   1400021a2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   1400021a8:	8b 16                	mov    edx,DWORD PTR [rsi]
   1400021aa:	48 89 d1             	mov    rcx,rdx
   1400021ad:	4c 09 f2             	or     rdx,r14
   1400021b0:	85 c9                	test   ecx,ecx
   1400021b2:	48 0f 49 d1          	cmovns rdx,rcx
   1400021b6:	48 89 f1             	mov    rcx,rsi
   1400021b9:	48 29 c2             	sub    rdx,rax
   1400021bc:	49 01 d7             	add    r15,rdx
   1400021bf:	e8 5c fc ff ff       	call   140001e20 <mark_section_writable>
   1400021c4:	44 89 3e             	mov    DWORD PTR [rsi],r15d
   1400021c7:	e9 c8 fe ff ff       	jmp    140002094 <_pei386_runtime_relocator+0x104>
   1400021cc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400021d0:	4c 39 e3             	cmp    rbx,r12
   1400021d3:	0f 83 d9 fd ff ff    	jae    140001fb2 <_pei386_runtime_relocator+0x22>
   1400021d9:	4c 8b 35 c0 21 00 00 	mov    r14,QWORD PTR [rip+0x21c0]        # 1400043a0 <.refptr.__image_base__>
   1400021e0:	8b 73 04             	mov    esi,DWORD PTR [rbx+0x4]
   1400021e3:	44 8b 2b             	mov    r13d,DWORD PTR [rbx]
   1400021e6:	48 83 c3 08          	add    rbx,0x8
   1400021ea:	4c 01 f6             	add    rsi,r14
   1400021ed:	44 03 2e             	add    r13d,DWORD PTR [rsi]
   1400021f0:	48 89 f1             	mov    rcx,rsi
   1400021f3:	e8 28 fc ff ff       	call   140001e20 <mark_section_writable>
   1400021f8:	44 89 2e             	mov    DWORD PTR [rsi],r13d
   1400021fb:	4c 39 e3             	cmp    rbx,r12
   1400021fe:	72 e0                	jb     1400021e0 <_pei386_runtime_relocator+0x250>
   140002200:	e9 fb fe ff ff       	jmp    140002100 <_pei386_runtime_relocator+0x170>
   140002205:	48 8d 0d cc 20 00 00 	lea    rcx,[rip+0x20cc]        # 1400042d8 <.rdata+0xd8>
   14000220c:	e8 9f fb ff ff       	call   140001db0 <__report_error>
   140002211:	48 8d 0d 88 20 00 00 	lea    rcx,[rip+0x2088]        # 1400042a0 <.rdata+0xa0>
   140002218:	e8 93 fb ff ff       	call   140001db0 <__report_error>
   14000221d:	90                   	nop
   14000221e:	90                   	nop
   14000221f:	90                   	nop

0000000140002220 <__mingw_raise_matherr>:
   140002220:	48 83 ec 58          	sub    rsp,0x58
   140002224:	48 8b 05 a5 4e 00 00 	mov    rax,QWORD PTR [rip+0x4ea5]        # 1400070d0 <stUserMathErr>
   14000222b:	48 85 c0             	test   rax,rax
   14000222e:	74 2c                	je     14000225c <__mingw_raise_matherr+0x3c>
   140002230:	f2 0f 10 84 24 80 00 	movsd  xmm0,QWORD PTR [rsp+0x80]
   140002237:	00 00 
   140002239:	89 4c 24 20          	mov    DWORD PTR [rsp+0x20],ecx
   14000223d:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140002242:	48 89 54 24 28       	mov    QWORD PTR [rsp+0x28],rdx
   140002247:	f2 0f 11 54 24 30    	movsd  QWORD PTR [rsp+0x30],xmm2
   14000224d:	f2 0f 11 5c 24 38    	movsd  QWORD PTR [rsp+0x38],xmm3
   140002253:	f2 0f 11 44 24 40    	movsd  QWORD PTR [rsp+0x40],xmm0
   140002259:	ff d0                	call   rax
   14000225b:	90                   	nop
   14000225c:	48 83 c4 58          	add    rsp,0x58
   140002260:	c3                   	ret    
   140002261:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140002268:	00 00 00 00 
   14000226c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000140002270 <__mingw_setusermatherr>:
   140002270:	48 89 0d 59 4e 00 00 	mov    QWORD PTR [rip+0x4e59],rcx        # 1400070d0 <stUserMathErr>
   140002277:	e9 d4 08 00 00       	jmp    140002b50 <__setusermatherr>
   14000227c:	90                   	nop
   14000227d:	90                   	nop
   14000227e:	90                   	nop
   14000227f:	90                   	nop

0000000140002280 <_gnu_exception_handler>:
   140002280:	41 54                	push   r12
   140002282:	48 83 ec 20          	sub    rsp,0x20
   140002286:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   140002289:	8b 02                	mov    eax,DWORD PTR [rdx]
   14000228b:	49 89 cc             	mov    r12,rcx
   14000228e:	89 c1                	mov    ecx,eax
   140002290:	81 e1 ff ff ff 20    	and    ecx,0x20ffffff
   140002296:	81 f9 43 43 47 20    	cmp    ecx,0x20474343
   14000229c:	0f 84 be 00 00 00    	je     140002360 <_gnu_exception_handler+0xe0>
   1400022a2:	3d 96 00 00 c0       	cmp    eax,0xc0000096
   1400022a7:	0f 87 9a 00 00 00    	ja     140002347 <_gnu_exception_handler+0xc7>
   1400022ad:	3d 8b 00 00 c0       	cmp    eax,0xc000008b
   1400022b2:	76 44                	jbe    1400022f8 <_gnu_exception_handler+0x78>
   1400022b4:	05 73 ff ff 3f       	add    eax,0x3fffff73
   1400022b9:	83 f8 09             	cmp    eax,0x9
   1400022bc:	77 2a                	ja     1400022e8 <_gnu_exception_handler+0x68>
   1400022be:	48 8d 15 4b 20 00 00 	lea    rdx,[rip+0x204b]        # 140004310 <.rdata>
   1400022c5:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   1400022c9:	48 01 d0             	add    rax,rdx
   1400022cc:	ff e0                	jmp    rax
   1400022ce:	66 90                	xchg   ax,ax
   1400022d0:	ba 01 00 00 00       	mov    edx,0x1
   1400022d5:	b9 08 00 00 00       	mov    ecx,0x8
   1400022da:	e8 09 08 00 00       	call   140002ae8 <signal>
   1400022df:	e8 bc fa ff ff       	call   140001da0 <_fpreset>
   1400022e4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400022e8:	b8 ff ff ff ff       	mov    eax,0xffffffff
   1400022ed:	48 83 c4 20          	add    rsp,0x20
   1400022f1:	41 5c                	pop    r12
   1400022f3:	c3                   	ret    
   1400022f4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400022f8:	3d 05 00 00 c0       	cmp    eax,0xc0000005
   1400022fd:	0f 84 dd 00 00 00    	je     1400023e0 <_gnu_exception_handler+0x160>
   140002303:	76 3b                	jbe    140002340 <_gnu_exception_handler+0xc0>
   140002305:	3d 08 00 00 c0       	cmp    eax,0xc0000008
   14000230a:	74 dc                	je     1400022e8 <_gnu_exception_handler+0x68>
   14000230c:	3d 1d 00 00 c0       	cmp    eax,0xc000001d
   140002311:	75 34                	jne    140002347 <_gnu_exception_handler+0xc7>
   140002313:	31 d2                	xor    edx,edx
   140002315:	b9 04 00 00 00       	mov    ecx,0x4
   14000231a:	e8 c9 07 00 00       	call   140002ae8 <signal>
   14000231f:	48 83 f8 01          	cmp    rax,0x1
   140002323:	0f 84 e3 00 00 00    	je     14000240c <_gnu_exception_handler+0x18c>
   140002329:	48 85 c0             	test   rax,rax
   14000232c:	74 19                	je     140002347 <_gnu_exception_handler+0xc7>
   14000232e:	b9 04 00 00 00       	mov    ecx,0x4
   140002333:	ff d0                	call   rax
   140002335:	b8 ff ff ff ff       	mov    eax,0xffffffff
   14000233a:	eb b1                	jmp    1400022ed <_gnu_exception_handler+0x6d>
   14000233c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140002340:	3d 02 00 00 80       	cmp    eax,0x80000002
   140002345:	74 a1                	je     1400022e8 <_gnu_exception_handler+0x68>
   140002347:	48 8b 05 a2 4d 00 00 	mov    rax,QWORD PTR [rip+0x4da2]        # 1400070f0 <__mingw_oldexcpt_handler>
   14000234e:	48 85 c0             	test   rax,rax
   140002351:	74 1d                	je     140002370 <_gnu_exception_handler+0xf0>
   140002353:	4c 89 e1             	mov    rcx,r12
   140002356:	48 83 c4 20          	add    rsp,0x20
   14000235a:	41 5c                	pop    r12
   14000235c:	48 ff e0             	rex.W jmp rax
   14000235f:	90                   	nop
   140002360:	f6 42 04 01          	test   BYTE PTR [rdx+0x4],0x1
   140002364:	0f 85 38 ff ff ff    	jne    1400022a2 <_gnu_exception_handler+0x22>
   14000236a:	e9 79 ff ff ff       	jmp    1400022e8 <_gnu_exception_handler+0x68>
   14000236f:	90                   	nop
   140002370:	31 c0                	xor    eax,eax
   140002372:	48 83 c4 20          	add    rsp,0x20
   140002376:	41 5c                	pop    r12
   140002378:	c3                   	ret    
   140002379:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140002380:	31 d2                	xor    edx,edx
   140002382:	b9 08 00 00 00       	mov    ecx,0x8
   140002387:	e8 5c 07 00 00       	call   140002ae8 <signal>
   14000238c:	48 83 f8 01          	cmp    rax,0x1
   140002390:	0f 84 3a ff ff ff    	je     1400022d0 <_gnu_exception_handler+0x50>
   140002396:	48 85 c0             	test   rax,rax
   140002399:	74 ac                	je     140002347 <_gnu_exception_handler+0xc7>
   14000239b:	b9 08 00 00 00       	mov    ecx,0x8
   1400023a0:	ff d0                	call   rax
   1400023a2:	b8 ff ff ff ff       	mov    eax,0xffffffff
   1400023a7:	e9 41 ff ff ff       	jmp    1400022ed <_gnu_exception_handler+0x6d>
   1400023ac:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400023b0:	31 d2                	xor    edx,edx
   1400023b2:	b9 08 00 00 00       	mov    ecx,0x8
   1400023b7:	e8 2c 07 00 00       	call   140002ae8 <signal>
   1400023bc:	48 83 f8 01          	cmp    rax,0x1
   1400023c0:	75 d4                	jne    140002396 <_gnu_exception_handler+0x116>
   1400023c2:	ba 01 00 00 00       	mov    edx,0x1
   1400023c7:	b9 08 00 00 00       	mov    ecx,0x8
   1400023cc:	e8 17 07 00 00       	call   140002ae8 <signal>
   1400023d1:	b8 ff ff ff ff       	mov    eax,0xffffffff
   1400023d6:	e9 12 ff ff ff       	jmp    1400022ed <_gnu_exception_handler+0x6d>
   1400023db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   1400023e0:	31 d2                	xor    edx,edx
   1400023e2:	b9 0b 00 00 00       	mov    ecx,0xb
   1400023e7:	e8 fc 06 00 00       	call   140002ae8 <signal>
   1400023ec:	48 83 f8 01          	cmp    rax,0x1
   1400023f0:	74 31                	je     140002423 <_gnu_exception_handler+0x1a3>
   1400023f2:	48 85 c0             	test   rax,rax
   1400023f5:	0f 84 4c ff ff ff    	je     140002347 <_gnu_exception_handler+0xc7>
   1400023fb:	b9 0b 00 00 00       	mov    ecx,0xb
   140002400:	ff d0                	call   rax
   140002402:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140002407:	e9 e1 fe ff ff       	jmp    1400022ed <_gnu_exception_handler+0x6d>
   14000240c:	ba 01 00 00 00       	mov    edx,0x1
   140002411:	b9 04 00 00 00       	mov    ecx,0x4
   140002416:	e8 cd 06 00 00       	call   140002ae8 <signal>
   14000241b:	83 c8 ff             	or     eax,0xffffffff
   14000241e:	e9 ca fe ff ff       	jmp    1400022ed <_gnu_exception_handler+0x6d>
   140002423:	ba 01 00 00 00       	mov    edx,0x1
   140002428:	b9 0b 00 00 00       	mov    ecx,0xb
   14000242d:	e8 b6 06 00 00       	call   140002ae8 <signal>
   140002432:	83 c8 ff             	or     eax,0xffffffff
   140002435:	e9 b3 fe ff ff       	jmp    1400022ed <_gnu_exception_handler+0x6d>
   14000243a:	90                   	nop
   14000243b:	90                   	nop
   14000243c:	90                   	nop
   14000243d:	90                   	nop
   14000243e:	90                   	nop
   14000243f:	90                   	nop

0000000140002440 <__mingwthr_run_key_dtors.part.0>:
   140002440:	41 54                	push   r12
   140002442:	57                   	push   rdi
   140002443:	56                   	push   rsi
   140002444:	53                   	push   rbx
   140002445:	48 83 ec 28          	sub    rsp,0x28
   140002449:	48 8d 0d d0 4c 00 00 	lea    rcx,[rip+0x4cd0]        # 140007120 <__mingwthr_cs>
   140002450:	ff 15 26 5d 00 00    	call   QWORD PTR [rip+0x5d26]        # 14000817c <__imp_EnterCriticalSection>
   140002456:	48 8b 1d a3 4c 00 00 	mov    rbx,QWORD PTR [rip+0x4ca3]        # 140007100 <key_dtor_list>
   14000245d:	48 85 db             	test   rbx,rbx
   140002460:	74 32                	je     140002494 <__mingwthr_run_key_dtors.part.0+0x54>
   140002462:	48 8b 3d 4b 5d 00 00 	mov    rdi,QWORD PTR [rip+0x5d4b]        # 1400081b4 <__imp_TlsGetValue>
   140002469:	48 8b 35 14 5d 00 00 	mov    rsi,QWORD PTR [rip+0x5d14]        # 140008184 <__imp_GetLastError>
   140002470:	8b 0b                	mov    ecx,DWORD PTR [rbx]
   140002472:	ff d7                	call   rdi
   140002474:	49 89 c4             	mov    r12,rax
   140002477:	ff d6                	call   rsi
   140002479:	85 c0                	test   eax,eax
   14000247b:	75 0e                	jne    14000248b <__mingwthr_run_key_dtors.part.0+0x4b>
   14000247d:	4d 85 e4             	test   r12,r12
   140002480:	74 09                	je     14000248b <__mingwthr_run_key_dtors.part.0+0x4b>
   140002482:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   140002486:	4c 89 e1             	mov    rcx,r12
   140002489:	ff d0                	call   rax
   14000248b:	48 8b 5b 10          	mov    rbx,QWORD PTR [rbx+0x10]
   14000248f:	48 85 db             	test   rbx,rbx
   140002492:	75 dc                	jne    140002470 <__mingwthr_run_key_dtors.part.0+0x30>
   140002494:	48 8d 0d 85 4c 00 00 	lea    rcx,[rip+0x4c85]        # 140007120 <__mingwthr_cs>
   14000249b:	48 83 c4 28          	add    rsp,0x28
   14000249f:	5b                   	pop    rbx
   1400024a0:	5e                   	pop    rsi
   1400024a1:	5f                   	pop    rdi
   1400024a2:	41 5c                	pop    r12
   1400024a4:	48 ff 25 f1 5c 00 00 	rex.W jmp QWORD PTR [rip+0x5cf1]        # 14000819c <__imp_LeaveCriticalSection>
   1400024ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000001400024b0 <___w64_mingwthr_add_key_dtor>:
   1400024b0:	57                   	push   rdi
   1400024b1:	56                   	push   rsi
   1400024b2:	53                   	push   rbx
   1400024b3:	48 83 ec 20          	sub    rsp,0x20
   1400024b7:	8b 05 4b 4c 00 00    	mov    eax,DWORD PTR [rip+0x4c4b]        # 140007108 <__mingwthr_cs_init>
   1400024bd:	89 cf                	mov    edi,ecx
   1400024bf:	48 89 d6             	mov    rsi,rdx
   1400024c2:	85 c0                	test   eax,eax
   1400024c4:	75 0a                	jne    1400024d0 <___w64_mingwthr_add_key_dtor+0x20>
   1400024c6:	48 83 c4 20          	add    rsp,0x20
   1400024ca:	5b                   	pop    rbx
   1400024cb:	5e                   	pop    rsi
   1400024cc:	5f                   	pop    rdi
   1400024cd:	c3                   	ret    
   1400024ce:	66 90                	xchg   ax,ax
   1400024d0:	ba 18 00 00 00       	mov    edx,0x18
   1400024d5:	b9 01 00 00 00       	mov    ecx,0x1
   1400024da:	e8 41 06 00 00       	call   140002b20 <calloc>
   1400024df:	48 89 c3             	mov    rbx,rax
   1400024e2:	48 85 c0             	test   rax,rax
   1400024e5:	74 3c                	je     140002523 <___w64_mingwthr_add_key_dtor+0x73>
   1400024e7:	89 38                	mov    DWORD PTR [rax],edi
   1400024e9:	48 8d 0d 30 4c 00 00 	lea    rcx,[rip+0x4c30]        # 140007120 <__mingwthr_cs>
   1400024f0:	48 89 70 08          	mov    QWORD PTR [rax+0x8],rsi
   1400024f4:	ff 15 82 5c 00 00    	call   QWORD PTR [rip+0x5c82]        # 14000817c <__imp_EnterCriticalSection>
   1400024fa:	48 8b 05 ff 4b 00 00 	mov    rax,QWORD PTR [rip+0x4bff]        # 140007100 <key_dtor_list>
   140002501:	48 8d 0d 18 4c 00 00 	lea    rcx,[rip+0x4c18]        # 140007120 <__mingwthr_cs>
   140002508:	48 89 1d f1 4b 00 00 	mov    QWORD PTR [rip+0x4bf1],rbx        # 140007100 <key_dtor_list>
   14000250f:	48 89 43 10          	mov    QWORD PTR [rbx+0x10],rax
   140002513:	ff 15 83 5c 00 00    	call   QWORD PTR [rip+0x5c83]        # 14000819c <__imp_LeaveCriticalSection>
   140002519:	31 c0                	xor    eax,eax
   14000251b:	48 83 c4 20          	add    rsp,0x20
   14000251f:	5b                   	pop    rbx
   140002520:	5e                   	pop    rsi
   140002521:	5f                   	pop    rdi
   140002522:	c3                   	ret    
   140002523:	83 c8 ff             	or     eax,0xffffffff
   140002526:	eb 9e                	jmp    1400024c6 <___w64_mingwthr_add_key_dtor+0x16>
   140002528:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000252f:	00 

0000000140002530 <___w64_mingwthr_remove_key_dtor>:
   140002530:	53                   	push   rbx
   140002531:	48 83 ec 20          	sub    rsp,0x20
   140002535:	8b 05 cd 4b 00 00    	mov    eax,DWORD PTR [rip+0x4bcd]        # 140007108 <__mingwthr_cs_init>
   14000253b:	89 cb                	mov    ebx,ecx
   14000253d:	85 c0                	test   eax,eax
   14000253f:	75 0f                	jne    140002550 <___w64_mingwthr_remove_key_dtor+0x20>
   140002541:	31 c0                	xor    eax,eax
   140002543:	48 83 c4 20          	add    rsp,0x20
   140002547:	5b                   	pop    rbx
   140002548:	c3                   	ret    
   140002549:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140002550:	48 8d 0d c9 4b 00 00 	lea    rcx,[rip+0x4bc9]        # 140007120 <__mingwthr_cs>
   140002557:	ff 15 1f 5c 00 00    	call   QWORD PTR [rip+0x5c1f]        # 14000817c <__imp_EnterCriticalSection>
   14000255d:	48 8b 0d 9c 4b 00 00 	mov    rcx,QWORD PTR [rip+0x4b9c]        # 140007100 <key_dtor_list>
   140002564:	48 85 c9             	test   rcx,rcx
   140002567:	74 2a                	je     140002593 <___w64_mingwthr_remove_key_dtor+0x63>
   140002569:	31 d2                	xor    edx,edx
   14000256b:	eb 0e                	jmp    14000257b <___w64_mingwthr_remove_key_dtor+0x4b>
   14000256d:	0f 1f 00             	nop    DWORD PTR [rax]
   140002570:	48 89 ca             	mov    rdx,rcx
   140002573:	48 85 c0             	test   rax,rax
   140002576:	74 1b                	je     140002593 <___w64_mingwthr_remove_key_dtor+0x63>
   140002578:	48 89 c1             	mov    rcx,rax
   14000257b:	8b 01                	mov    eax,DWORD PTR [rcx]
   14000257d:	39 d8                	cmp    eax,ebx
   14000257f:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
   140002583:	75 eb                	jne    140002570 <___w64_mingwthr_remove_key_dtor+0x40>
   140002585:	48 85 d2             	test   rdx,rdx
   140002588:	74 26                	je     1400025b0 <___w64_mingwthr_remove_key_dtor+0x80>
   14000258a:	48 89 42 10          	mov    QWORD PTR [rdx+0x10],rax
   14000258e:	e8 75 05 00 00       	call   140002b08 <free>
   140002593:	48 8d 0d 86 4b 00 00 	lea    rcx,[rip+0x4b86]        # 140007120 <__mingwthr_cs>
   14000259a:	ff 15 fc 5b 00 00    	call   QWORD PTR [rip+0x5bfc]        # 14000819c <__imp_LeaveCriticalSection>
   1400025a0:	31 c0                	xor    eax,eax
   1400025a2:	48 83 c4 20          	add    rsp,0x20
   1400025a6:	5b                   	pop    rbx
   1400025a7:	c3                   	ret    
   1400025a8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   1400025af:	00 
   1400025b0:	48 89 05 49 4b 00 00 	mov    QWORD PTR [rip+0x4b49],rax        # 140007100 <key_dtor_list>
   1400025b7:	eb d5                	jmp    14000258e <___w64_mingwthr_remove_key_dtor+0x5e>
   1400025b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000001400025c0 <__mingw_TLScallback>:
   1400025c0:	53                   	push   rbx
   1400025c1:	48 83 ec 20          	sub    rsp,0x20
   1400025c5:	83 fa 02             	cmp    edx,0x2
   1400025c8:	74 46                	je     140002610 <__mingw_TLScallback+0x50>
   1400025ca:	77 2c                	ja     1400025f8 <__mingw_TLScallback+0x38>
   1400025cc:	85 d2                	test   edx,edx
   1400025ce:	74 50                	je     140002620 <__mingw_TLScallback+0x60>
   1400025d0:	8b 05 32 4b 00 00    	mov    eax,DWORD PTR [rip+0x4b32]        # 140007108 <__mingwthr_cs_init>
   1400025d6:	85 c0                	test   eax,eax
   1400025d8:	0f 84 b2 00 00 00    	je     140002690 <__mingw_TLScallback+0xd0>
   1400025de:	c7 05 20 4b 00 00 01 	mov    DWORD PTR [rip+0x4b20],0x1        # 140007108 <__mingwthr_cs_init>
   1400025e5:	00 00 00 
   1400025e8:	b8 01 00 00 00       	mov    eax,0x1
   1400025ed:	48 83 c4 20          	add    rsp,0x20
   1400025f1:	5b                   	pop    rbx
   1400025f2:	c3                   	ret    
   1400025f3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   1400025f8:	83 fa 03             	cmp    edx,0x3
   1400025fb:	75 eb                	jne    1400025e8 <__mingw_TLScallback+0x28>
   1400025fd:	8b 05 05 4b 00 00    	mov    eax,DWORD PTR [rip+0x4b05]        # 140007108 <__mingwthr_cs_init>
   140002603:	85 c0                	test   eax,eax
   140002605:	74 e1                	je     1400025e8 <__mingw_TLScallback+0x28>
   140002607:	e8 34 fe ff ff       	call   140002440 <__mingwthr_run_key_dtors.part.0>
   14000260c:	eb da                	jmp    1400025e8 <__mingw_TLScallback+0x28>
   14000260e:	66 90                	xchg   ax,ax
   140002610:	e8 8b f7 ff ff       	call   140001da0 <_fpreset>
   140002615:	b8 01 00 00 00       	mov    eax,0x1
   14000261a:	48 83 c4 20          	add    rsp,0x20
   14000261e:	5b                   	pop    rbx
   14000261f:	c3                   	ret    
   140002620:	8b 05 e2 4a 00 00    	mov    eax,DWORD PTR [rip+0x4ae2]        # 140007108 <__mingwthr_cs_init>
   140002626:	85 c0                	test   eax,eax
   140002628:	75 56                	jne    140002680 <__mingw_TLScallback+0xc0>
   14000262a:	8b 05 d8 4a 00 00    	mov    eax,DWORD PTR [rip+0x4ad8]        # 140007108 <__mingwthr_cs_init>
   140002630:	83 f8 01             	cmp    eax,0x1
   140002633:	75 b3                	jne    1400025e8 <__mingw_TLScallback+0x28>
   140002635:	48 8b 1d c4 4a 00 00 	mov    rbx,QWORD PTR [rip+0x4ac4]        # 140007100 <key_dtor_list>
   14000263c:	48 85 db             	test   rbx,rbx
   14000263f:	74 18                	je     140002659 <__mingw_TLScallback+0x99>
   140002641:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140002648:	48 89 d9             	mov    rcx,rbx
   14000264b:	48 8b 5b 10          	mov    rbx,QWORD PTR [rbx+0x10]
   14000264f:	e8 b4 04 00 00       	call   140002b08 <free>
   140002654:	48 85 db             	test   rbx,rbx
   140002657:	75 ef                	jne    140002648 <__mingw_TLScallback+0x88>
   140002659:	48 8d 0d c0 4a 00 00 	lea    rcx,[rip+0x4ac0]        # 140007120 <__mingwthr_cs>
   140002660:	48 c7 05 95 4a 00 00 	mov    QWORD PTR [rip+0x4a95],0x0        # 140007100 <key_dtor_list>
   140002667:	00 00 00 00 
   14000266b:	c7 05 93 4a 00 00 00 	mov    DWORD PTR [rip+0x4a93],0x0        # 140007108 <__mingwthr_cs_init>
   140002672:	00 00 00 
   140002675:	ff 15 f9 5a 00 00    	call   QWORD PTR [rip+0x5af9]        # 140008174 <__IAT_start__>
   14000267b:	e9 68 ff ff ff       	jmp    1400025e8 <__mingw_TLScallback+0x28>
   140002680:	e8 bb fd ff ff       	call   140002440 <__mingwthr_run_key_dtors.part.0>
   140002685:	eb a3                	jmp    14000262a <__mingw_TLScallback+0x6a>
   140002687:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000268e:	00 00 
   140002690:	48 8d 0d 89 4a 00 00 	lea    rcx,[rip+0x4a89]        # 140007120 <__mingwthr_cs>
   140002697:	ff 15 f7 5a 00 00    	call   QWORD PTR [rip+0x5af7]        # 140008194 <__imp_InitializeCriticalSection>
   14000269d:	e9 3c ff ff ff       	jmp    1400025de <__mingw_TLScallback+0x1e>
   1400026a2:	90                   	nop
   1400026a3:	90                   	nop
   1400026a4:	90                   	nop
   1400026a5:	90                   	nop
   1400026a6:	90                   	nop
   1400026a7:	90                   	nop
   1400026a8:	90                   	nop
   1400026a9:	90                   	nop
   1400026aa:	90                   	nop
   1400026ab:	90                   	nop
   1400026ac:	90                   	nop
   1400026ad:	90                   	nop
   1400026ae:	90                   	nop
   1400026af:	90                   	nop

00000001400026b0 <_ValidateImageBase>:
   1400026b0:	31 c0                	xor    eax,eax
   1400026b2:	66 81 39 4d 5a       	cmp    WORD PTR [rcx],0x5a4d
   1400026b7:	75 0f                	jne    1400026c8 <_ValidateImageBase+0x18>
   1400026b9:	48 63 51 3c          	movsxd rdx,DWORD PTR [rcx+0x3c]
   1400026bd:	48 01 d1             	add    rcx,rdx
   1400026c0:	81 39 50 45 00 00    	cmp    DWORD PTR [rcx],0x4550
   1400026c6:	74 08                	je     1400026d0 <_ValidateImageBase+0x20>
   1400026c8:	c3                   	ret    
   1400026c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400026d0:	31 c0                	xor    eax,eax
   1400026d2:	66 81 79 18 0b 02    	cmp    WORD PTR [rcx+0x18],0x20b
   1400026d8:	0f 94 c0             	sete   al
   1400026db:	c3                   	ret    
   1400026dc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000001400026e0 <_FindPESection>:
   1400026e0:	48 63 41 3c          	movsxd rax,DWORD PTR [rcx+0x3c]
   1400026e4:	49 89 d0             	mov    r8,rdx
   1400026e7:	48 8d 14 08          	lea    rdx,[rax+rcx*1]
   1400026eb:	0f b7 42 14          	movzx  eax,WORD PTR [rdx+0x14]
   1400026ef:	48 8d 44 02 18       	lea    rax,[rdx+rax*1+0x18]
   1400026f4:	0f b7 52 06          	movzx  edx,WORD PTR [rdx+0x6]
   1400026f8:	85 d2                	test   edx,edx
   1400026fa:	74 30                	je     14000272c <_FindPESection+0x4c>
   1400026fc:	83 ea 01             	sub    edx,0x1
   1400026ff:	48 8d 14 92          	lea    rdx,[rdx+rdx*4]
   140002703:	4c 8d 4c d0 28       	lea    r9,[rax+rdx*8+0x28]
   140002708:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000270f:	00 
   140002710:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
   140002713:	48 89 ca             	mov    rdx,rcx
   140002716:	4c 39 c1             	cmp    rcx,r8
   140002719:	77 08                	ja     140002723 <_FindPESection+0x43>
   14000271b:	03 50 08             	add    edx,DWORD PTR [rax+0x8]
   14000271e:	4c 39 c2             	cmp    rdx,r8
   140002721:	77 0b                	ja     14000272e <_FindPESection+0x4e>
   140002723:	48 83 c0 28          	add    rax,0x28
   140002727:	4c 39 c8             	cmp    rax,r9
   14000272a:	75 e4                	jne    140002710 <_FindPESection+0x30>
   14000272c:	31 c0                	xor    eax,eax
   14000272e:	c3                   	ret    
   14000272f:	90                   	nop

0000000140002730 <_FindPESectionByName>:
   140002730:	41 54                	push   r12
   140002732:	56                   	push   rsi
   140002733:	53                   	push   rbx
   140002734:	48 83 ec 20          	sub    rsp,0x20
   140002738:	48 89 cb             	mov    rbx,rcx
   14000273b:	e8 a0 03 00 00       	call   140002ae0 <strlen>
   140002740:	48 83 f8 08          	cmp    rax,0x8
   140002744:	77 7a                	ja     1400027c0 <_FindPESectionByName+0x90>
   140002746:	48 8b 15 53 1c 00 00 	mov    rdx,QWORD PTR [rip+0x1c53]        # 1400043a0 <.refptr.__image_base__>
   14000274d:	45 31 e4             	xor    r12d,r12d
   140002750:	66 81 3a 4d 5a       	cmp    WORD PTR [rdx],0x5a4d
   140002755:	75 57                	jne    1400027ae <_FindPESectionByName+0x7e>
   140002757:	48 63 42 3c          	movsxd rax,DWORD PTR [rdx+0x3c]
   14000275b:	48 01 d0             	add    rax,rdx
   14000275e:	81 38 50 45 00 00    	cmp    DWORD PTR [rax],0x4550
   140002764:	75 48                	jne    1400027ae <_FindPESectionByName+0x7e>
   140002766:	66 81 78 18 0b 02    	cmp    WORD PTR [rax+0x18],0x20b
   14000276c:	75 40                	jne    1400027ae <_FindPESectionByName+0x7e>
   14000276e:	0f b7 50 14          	movzx  edx,WORD PTR [rax+0x14]
   140002772:	4c 8d 64 10 18       	lea    r12,[rax+rdx*1+0x18]
   140002777:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
   14000277b:	85 c0                	test   eax,eax
   14000277d:	74 41                	je     1400027c0 <_FindPESectionByName+0x90>
   14000277f:	83 e8 01             	sub    eax,0x1
   140002782:	48 8d 04 80          	lea    rax,[rax+rax*4]
   140002786:	49 8d 74 c4 28       	lea    rsi,[r12+rax*8+0x28]
   14000278b:	eb 0c                	jmp    140002799 <_FindPESectionByName+0x69>
   14000278d:	0f 1f 00             	nop    DWORD PTR [rax]
   140002790:	49 83 c4 28          	add    r12,0x28
   140002794:	49 39 f4             	cmp    r12,rsi
   140002797:	74 27                	je     1400027c0 <_FindPESectionByName+0x90>
   140002799:	41 b8 08 00 00 00    	mov    r8d,0x8
   14000279f:	48 89 da             	mov    rdx,rbx
   1400027a2:	4c 89 e1             	mov    rcx,r12
   1400027a5:	e8 2e 03 00 00       	call   140002ad8 <strncmp>
   1400027aa:	85 c0                	test   eax,eax
   1400027ac:	75 e2                	jne    140002790 <_FindPESectionByName+0x60>
   1400027ae:	4c 89 e0             	mov    rax,r12
   1400027b1:	48 83 c4 20          	add    rsp,0x20
   1400027b5:	5b                   	pop    rbx
   1400027b6:	5e                   	pop    rsi
   1400027b7:	41 5c                	pop    r12
   1400027b9:	c3                   	ret    
   1400027ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   1400027c0:	45 31 e4             	xor    r12d,r12d
   1400027c3:	4c 89 e0             	mov    rax,r12
   1400027c6:	48 83 c4 20          	add    rsp,0x20
   1400027ca:	5b                   	pop    rbx
   1400027cb:	5e                   	pop    rsi
   1400027cc:	41 5c                	pop    r12
   1400027ce:	c3                   	ret    
   1400027cf:	90                   	nop

00000001400027d0 <__mingw_GetSectionForAddress>:
   1400027d0:	48 8b 15 c9 1b 00 00 	mov    rdx,QWORD PTR [rip+0x1bc9]        # 1400043a0 <.refptr.__image_base__>
   1400027d7:	31 c0                	xor    eax,eax
   1400027d9:	66 81 3a 4d 5a       	cmp    WORD PTR [rdx],0x5a4d
   1400027de:	75 10                	jne    1400027f0 <__mingw_GetSectionForAddress+0x20>
   1400027e0:	4c 63 42 3c          	movsxd r8,DWORD PTR [rdx+0x3c]
   1400027e4:	49 01 d0             	add    r8,rdx
   1400027e7:	41 81 38 50 45 00 00 	cmp    DWORD PTR [r8],0x4550
   1400027ee:	74 08                	je     1400027f8 <__mingw_GetSectionForAddress+0x28>
   1400027f0:	c3                   	ret    
   1400027f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400027f8:	66 41 81 78 18 0b 02 	cmp    WORD PTR [r8+0x18],0x20b
   1400027ff:	75 ef                	jne    1400027f0 <__mingw_GetSectionForAddress+0x20>
   140002801:	41 0f b7 40 14       	movzx  eax,WORD PTR [r8+0x14]
   140002806:	48 29 d1             	sub    rcx,rdx
   140002809:	41 0f b7 50 06       	movzx  edx,WORD PTR [r8+0x6]
   14000280e:	49 8d 44 00 18       	lea    rax,[r8+rax*1+0x18]
   140002813:	85 d2                	test   edx,edx
   140002815:	74 2e                	je     140002845 <__mingw_GetSectionForAddress+0x75>
   140002817:	83 ea 01             	sub    edx,0x1
   14000281a:	48 8d 14 92          	lea    rdx,[rdx+rdx*4]
   14000281e:	4c 8d 4c d0 28       	lea    r9,[rax+rdx*8+0x28]
   140002823:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140002828:	44 8b 40 0c          	mov    r8d,DWORD PTR [rax+0xc]
   14000282c:	4c 89 c2             	mov    rdx,r8
   14000282f:	4c 39 c1             	cmp    rcx,r8
   140002832:	72 08                	jb     14000283c <__mingw_GetSectionForAddress+0x6c>
   140002834:	03 50 08             	add    edx,DWORD PTR [rax+0x8]
   140002837:	48 39 d1             	cmp    rcx,rdx
   14000283a:	72 b4                	jb     1400027f0 <__mingw_GetSectionForAddress+0x20>
   14000283c:	48 83 c0 28          	add    rax,0x28
   140002840:	4c 39 c8             	cmp    rax,r9
   140002843:	75 e3                	jne    140002828 <__mingw_GetSectionForAddress+0x58>
   140002845:	31 c0                	xor    eax,eax
   140002847:	c3                   	ret    
   140002848:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000284f:	00 

0000000140002850 <__mingw_GetSectionCount>:
   140002850:	48 8b 05 49 1b 00 00 	mov    rax,QWORD PTR [rip+0x1b49]        # 1400043a0 <.refptr.__image_base__>
   140002857:	45 31 c0             	xor    r8d,r8d
   14000285a:	66 81 38 4d 5a       	cmp    WORD PTR [rax],0x5a4d
   14000285f:	75 0f                	jne    140002870 <__mingw_GetSectionCount+0x20>
   140002861:	48 63 50 3c          	movsxd rdx,DWORD PTR [rax+0x3c]
   140002865:	48 01 d0             	add    rax,rdx
   140002868:	81 38 50 45 00 00    	cmp    DWORD PTR [rax],0x4550
   14000286e:	74 08                	je     140002878 <__mingw_GetSectionCount+0x28>
   140002870:	44 89 c0             	mov    eax,r8d
   140002873:	c3                   	ret    
   140002874:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140002878:	66 81 78 18 0b 02    	cmp    WORD PTR [rax+0x18],0x20b
   14000287e:	75 f0                	jne    140002870 <__mingw_GetSectionCount+0x20>
   140002880:	44 0f b7 40 06       	movzx  r8d,WORD PTR [rax+0x6]
   140002885:	44 89 c0             	mov    eax,r8d
   140002888:	c3                   	ret    
   140002889:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000140002890 <_FindPESectionExec>:
   140002890:	4c 8b 05 09 1b 00 00 	mov    r8,QWORD PTR [rip+0x1b09]        # 1400043a0 <.refptr.__image_base__>
   140002897:	31 c0                	xor    eax,eax
   140002899:	66 41 81 38 4d 5a    	cmp    WORD PTR [r8],0x5a4d
   14000289f:	75 0f                	jne    1400028b0 <_FindPESectionExec+0x20>
   1400028a1:	49 63 50 3c          	movsxd rdx,DWORD PTR [r8+0x3c]
   1400028a5:	4c 01 c2             	add    rdx,r8
   1400028a8:	81 3a 50 45 00 00    	cmp    DWORD PTR [rdx],0x4550
   1400028ae:	74 08                	je     1400028b8 <_FindPESectionExec+0x28>
   1400028b0:	c3                   	ret    
   1400028b1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400028b8:	66 81 7a 18 0b 02    	cmp    WORD PTR [rdx+0x18],0x20b
   1400028be:	75 f0                	jne    1400028b0 <_FindPESectionExec+0x20>
   1400028c0:	0f b7 42 14          	movzx  eax,WORD PTR [rdx+0x14]
   1400028c4:	48 8d 44 02 18       	lea    rax,[rdx+rax*1+0x18]
   1400028c9:	0f b7 52 06          	movzx  edx,WORD PTR [rdx+0x6]
   1400028cd:	85 d2                	test   edx,edx
   1400028cf:	74 27                	je     1400028f8 <_FindPESectionExec+0x68>
   1400028d1:	83 ea 01             	sub    edx,0x1
   1400028d4:	48 8d 14 92          	lea    rdx,[rdx+rdx*4]
   1400028d8:	48 8d 54 d0 28       	lea    rdx,[rax+rdx*8+0x28]
   1400028dd:	0f 1f 00             	nop    DWORD PTR [rax]
   1400028e0:	f6 40 27 20          	test   BYTE PTR [rax+0x27],0x20
   1400028e4:	74 09                	je     1400028ef <_FindPESectionExec+0x5f>
   1400028e6:	48 85 c9             	test   rcx,rcx
   1400028e9:	74 c5                	je     1400028b0 <_FindPESectionExec+0x20>
   1400028eb:	48 83 e9 01          	sub    rcx,0x1
   1400028ef:	48 83 c0 28          	add    rax,0x28
   1400028f3:	48 39 d0             	cmp    rax,rdx
   1400028f6:	75 e8                	jne    1400028e0 <_FindPESectionExec+0x50>
   1400028f8:	31 c0                	xor    eax,eax
   1400028fa:	c3                   	ret    
   1400028fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000140002900 <_GetPEImageBase>:
   140002900:	48 8b 05 99 1a 00 00 	mov    rax,QWORD PTR [rip+0x1a99]        # 1400043a0 <.refptr.__image_base__>
   140002907:	45 31 c0             	xor    r8d,r8d
   14000290a:	66 81 38 4d 5a       	cmp    WORD PTR [rax],0x5a4d
   14000290f:	75 0f                	jne    140002920 <_GetPEImageBase+0x20>
   140002911:	48 63 50 3c          	movsxd rdx,DWORD PTR [rax+0x3c]
   140002915:	48 01 c2             	add    rdx,rax
   140002918:	81 3a 50 45 00 00    	cmp    DWORD PTR [rdx],0x4550
   14000291e:	74 08                	je     140002928 <_GetPEImageBase+0x28>
   140002920:	4c 89 c0             	mov    rax,r8
   140002923:	c3                   	ret    
   140002924:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140002928:	66 81 7a 18 0b 02    	cmp    WORD PTR [rdx+0x18],0x20b
   14000292e:	4c 0f 44 c0          	cmove  r8,rax
   140002932:	4c 89 c0             	mov    rax,r8
   140002935:	c3                   	ret    
   140002936:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   14000293d:	00 00 00 

0000000140002940 <_IsNonwritableInCurrentImage>:
   140002940:	48 8b 05 59 1a 00 00 	mov    rax,QWORD PTR [rip+0x1a59]        # 1400043a0 <.refptr.__image_base__>
   140002947:	45 31 c0             	xor    r8d,r8d
   14000294a:	66 81 38 4d 5a       	cmp    WORD PTR [rax],0x5a4d
   14000294f:	75 0f                	jne    140002960 <_IsNonwritableInCurrentImage+0x20>
   140002951:	48 63 50 3c          	movsxd rdx,DWORD PTR [rax+0x3c]
   140002955:	48 01 c2             	add    rdx,rax
   140002958:	81 3a 50 45 00 00    	cmp    DWORD PTR [rdx],0x4550
   14000295e:	74 08                	je     140002968 <_IsNonwritableInCurrentImage+0x28>
   140002960:	44 89 c0             	mov    eax,r8d
   140002963:	c3                   	ret    
   140002964:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140002968:	66 81 7a 18 0b 02    	cmp    WORD PTR [rdx+0x18],0x20b
   14000296e:	75 f0                	jne    140002960 <_IsNonwritableInCurrentImage+0x20>
   140002970:	48 29 c1             	sub    rcx,rax
   140002973:	0f b7 42 14          	movzx  eax,WORD PTR [rdx+0x14]
   140002977:	48 8d 44 02 18       	lea    rax,[rdx+rax*1+0x18]
   14000297c:	0f b7 52 06          	movzx  edx,WORD PTR [rdx+0x6]
   140002980:	85 d2                	test   edx,edx
   140002982:	74 dc                	je     140002960 <_IsNonwritableInCurrentImage+0x20>
   140002984:	83 ea 01             	sub    edx,0x1
   140002987:	48 8d 14 92          	lea    rdx,[rdx+rdx*4]
   14000298b:	4c 8d 4c d0 28       	lea    r9,[rax+rdx*8+0x28]
   140002990:	44 8b 40 0c          	mov    r8d,DWORD PTR [rax+0xc]
   140002994:	4c 89 c2             	mov    rdx,r8
   140002997:	4c 39 c1             	cmp    rcx,r8
   14000299a:	72 08                	jb     1400029a4 <_IsNonwritableInCurrentImage+0x64>
   14000299c:	03 50 08             	add    edx,DWORD PTR [rax+0x8]
   14000299f:	48 39 d1             	cmp    rcx,rdx
   1400029a2:	72 14                	jb     1400029b8 <_IsNonwritableInCurrentImage+0x78>
   1400029a4:	48 83 c0 28          	add    rax,0x28
   1400029a8:	49 39 c1             	cmp    r9,rax
   1400029ab:	75 e3                	jne    140002990 <_IsNonwritableInCurrentImage+0x50>
   1400029ad:	45 31 c0             	xor    r8d,r8d
   1400029b0:	44 89 c0             	mov    eax,r8d
   1400029b3:	c3                   	ret    
   1400029b4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400029b8:	44 8b 40 24          	mov    r8d,DWORD PTR [rax+0x24]
   1400029bc:	41 f7 d0             	not    r8d
   1400029bf:	41 c1 e8 1f          	shr    r8d,0x1f
   1400029c3:	44 89 c0             	mov    eax,r8d
   1400029c6:	c3                   	ret    
   1400029c7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   1400029ce:	00 00 

00000001400029d0 <__mingw_enum_import_library_names>:
   1400029d0:	4c 8b 1d c9 19 00 00 	mov    r11,QWORD PTR [rip+0x19c9]        # 1400043a0 <.refptr.__image_base__>
   1400029d7:	45 31 c9             	xor    r9d,r9d
   1400029da:	66 41 81 3b 4d 5a    	cmp    WORD PTR [r11],0x5a4d
   1400029e0:	75 10                	jne    1400029f2 <__mingw_enum_import_library_names+0x22>
   1400029e2:	4d 63 43 3c          	movsxd r8,DWORD PTR [r11+0x3c]
   1400029e6:	4d 01 d8             	add    r8,r11
   1400029e9:	41 81 38 50 45 00 00 	cmp    DWORD PTR [r8],0x4550
   1400029f0:	74 0e                	je     140002a00 <__mingw_enum_import_library_names+0x30>
   1400029f2:	4c 89 c8             	mov    rax,r9
   1400029f5:	c3                   	ret    
   1400029f6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   1400029fd:	00 00 00 
   140002a00:	66 41 81 78 18 0b 02 	cmp    WORD PTR [r8+0x18],0x20b
   140002a07:	75 e9                	jne    1400029f2 <__mingw_enum_import_library_names+0x22>
   140002a09:	41 8b 80 90 00 00 00 	mov    eax,DWORD PTR [r8+0x90]
   140002a10:	85 c0                	test   eax,eax
   140002a12:	74 de                	je     1400029f2 <__mingw_enum_import_library_names+0x22>
   140002a14:	41 0f b7 50 14       	movzx  edx,WORD PTR [r8+0x14]
   140002a19:	49 8d 54 10 18       	lea    rdx,[r8+rdx*1+0x18]
   140002a1e:	45 0f b7 40 06       	movzx  r8d,WORD PTR [r8+0x6]
   140002a23:	45 85 c0             	test   r8d,r8d
   140002a26:	74 ca                	je     1400029f2 <__mingw_enum_import_library_names+0x22>
   140002a28:	41 83 e8 01          	sub    r8d,0x1
   140002a2c:	4f 8d 04 80          	lea    r8,[r8+r8*4]
   140002a30:	4e 8d 54 c2 28       	lea    r10,[rdx+r8*8+0x28]
   140002a35:	0f 1f 00             	nop    DWORD PTR [rax]
   140002a38:	44 8b 4a 0c          	mov    r9d,DWORD PTR [rdx+0xc]
   140002a3c:	4d 89 c8             	mov    r8,r9
   140002a3f:	4c 39 c8             	cmp    rax,r9
   140002a42:	72 09                	jb     140002a4d <__mingw_enum_import_library_names+0x7d>
   140002a44:	44 03 42 08          	add    r8d,DWORD PTR [rdx+0x8]
   140002a48:	4c 39 c0             	cmp    rax,r8
   140002a4b:	72 13                	jb     140002a60 <__mingw_enum_import_library_names+0x90>
   140002a4d:	48 83 c2 28          	add    rdx,0x28
   140002a51:	49 39 d2             	cmp    r10,rdx
   140002a54:	75 e2                	jne    140002a38 <__mingw_enum_import_library_names+0x68>
   140002a56:	45 31 c9             	xor    r9d,r9d
   140002a59:	4c 89 c8             	mov    rax,r9
   140002a5c:	c3                   	ret    
   140002a5d:	0f 1f 00             	nop    DWORD PTR [rax]
   140002a60:	4c 01 d8             	add    rax,r11
   140002a63:	eb 0a                	jmp    140002a6f <__mingw_enum_import_library_names+0x9f>
   140002a65:	0f 1f 00             	nop    DWORD PTR [rax]
   140002a68:	83 e9 01             	sub    ecx,0x1
   140002a6b:	48 83 c0 14          	add    rax,0x14
   140002a6f:	44 8b 40 04          	mov    r8d,DWORD PTR [rax+0x4]
   140002a73:	45 85 c0             	test   r8d,r8d
   140002a76:	75 07                	jne    140002a7f <__mingw_enum_import_library_names+0xaf>
   140002a78:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   140002a7b:	85 d2                	test   edx,edx
   140002a7d:	74 d7                	je     140002a56 <__mingw_enum_import_library_names+0x86>
   140002a7f:	85 c9                	test   ecx,ecx
   140002a81:	7f e5                	jg     140002a68 <__mingw_enum_import_library_names+0x98>
   140002a83:	44 8b 48 0c          	mov    r9d,DWORD PTR [rax+0xc]
   140002a87:	4d 01 d9             	add    r9,r11
   140002a8a:	4c 89 c8             	mov    rax,r9
   140002a8d:	c3                   	ret    
   140002a8e:	90                   	nop
   140002a8f:	90                   	nop

0000000140002a90 <___chkstk_ms>:
   140002a90:	51                   	push   rcx
   140002a91:	50                   	push   rax
   140002a92:	48 3d 00 10 00 00    	cmp    rax,0x1000
   140002a98:	48 8d 4c 24 18       	lea    rcx,[rsp+0x18]
   140002a9d:	72 19                	jb     140002ab8 <___chkstk_ms+0x28>
   140002a9f:	48 81 e9 00 10 00 00 	sub    rcx,0x1000
   140002aa6:	48 83 09 00          	or     QWORD PTR [rcx],0x0
   140002aaa:	48 2d 00 10 00 00    	sub    rax,0x1000
   140002ab0:	48 3d 00 10 00 00    	cmp    rax,0x1000
   140002ab6:	77 e7                	ja     140002a9f <___chkstk_ms+0xf>
   140002ab8:	48 29 c1             	sub    rcx,rax
   140002abb:	48 83 09 00          	or     QWORD PTR [rcx],0x0
   140002abf:	58                   	pop    rax
   140002ac0:	59                   	pop    rcx
   140002ac1:	c3                   	ret    
   140002ac2:	90                   	nop
   140002ac3:	90                   	nop
   140002ac4:	90                   	nop
   140002ac5:	90                   	nop
   140002ac6:	90                   	nop
   140002ac7:	90                   	nop
   140002ac8:	90                   	nop
   140002ac9:	90                   	nop
   140002aca:	90                   	nop
   140002acb:	90                   	nop
   140002acc:	90                   	nop
   140002acd:	90                   	nop
   140002ace:	90                   	nop
   140002acf:	90                   	nop

0000000140002ad0 <vfprintf>:
   140002ad0:	ff 25 c6 57 00 00    	jmp    QWORD PTR [rip+0x57c6]        # 14000829c <__imp_vfprintf>
   140002ad6:	90                   	nop
   140002ad7:	90                   	nop

0000000140002ad8 <strncmp>:
   140002ad8:	ff 25 b6 57 00 00    	jmp    QWORD PTR [rip+0x57b6]        # 140008294 <__imp_strncmp>
   140002ade:	90                   	nop
   140002adf:	90                   	nop

0000000140002ae0 <strlen>:
   140002ae0:	ff 25 a6 57 00 00    	jmp    QWORD PTR [rip+0x57a6]        # 14000828c <__imp_strlen>
   140002ae6:	90                   	nop
   140002ae7:	90                   	nop

0000000140002ae8 <signal>:
   140002ae8:	ff 25 96 57 00 00    	jmp    QWORD PTR [rip+0x5796]        # 140008284 <__imp_signal>
   140002aee:	90                   	nop
   140002aef:	90                   	nop

0000000140002af0 <memcpy>:
   140002af0:	ff 25 86 57 00 00    	jmp    QWORD PTR [rip+0x5786]        # 14000827c <__imp_memcpy>
   140002af6:	90                   	nop
   140002af7:	90                   	nop

0000000140002af8 <malloc>:
   140002af8:	ff 25 76 57 00 00    	jmp    QWORD PTR [rip+0x5776]        # 140008274 <__imp_malloc>
   140002afe:	90                   	nop
   140002aff:	90                   	nop

0000000140002b00 <fwrite>:
   140002b00:	ff 25 66 57 00 00    	jmp    QWORD PTR [rip+0x5766]        # 14000826c <__imp_fwrite>
   140002b06:	90                   	nop
   140002b07:	90                   	nop

0000000140002b08 <free>:
   140002b08:	ff 25 56 57 00 00    	jmp    QWORD PTR [rip+0x5756]        # 140008264 <__imp_free>
   140002b0e:	90                   	nop
   140002b0f:	90                   	nop

0000000140002b10 <fprintf>:
   140002b10:	ff 25 46 57 00 00    	jmp    QWORD PTR [rip+0x5746]        # 14000825c <__imp_fprintf>
   140002b16:	90                   	nop
   140002b17:	90                   	nop

0000000140002b18 <exit>:
   140002b18:	ff 25 36 57 00 00    	jmp    QWORD PTR [rip+0x5736]        # 140008254 <__imp_exit>
   140002b1e:	90                   	nop
   140002b1f:	90                   	nop

0000000140002b20 <calloc>:
   140002b20:	ff 25 26 57 00 00    	jmp    QWORD PTR [rip+0x5726]        # 14000824c <__imp_calloc>
   140002b26:	90                   	nop
   140002b27:	90                   	nop

0000000140002b28 <abort>:
   140002b28:	ff 25 16 57 00 00    	jmp    QWORD PTR [rip+0x5716]        # 140008244 <__imp_abort>
   140002b2e:	90                   	nop
   140002b2f:	90                   	nop

0000000140002b30 <_onexit>:
   140002b30:	ff 25 06 57 00 00    	jmp    QWORD PTR [rip+0x5706]        # 14000823c <__imp__onexit>
   140002b36:	90                   	nop
   140002b37:	90                   	nop

0000000140002b38 <_initterm>:
   140002b38:	ff 25 f6 56 00 00    	jmp    QWORD PTR [rip+0x56f6]        # 140008234 <__imp__initterm>
   140002b3e:	90                   	nop
   140002b3f:	90                   	nop

0000000140002b40 <_cexit>:
   140002b40:	ff 25 d6 56 00 00    	jmp    QWORD PTR [rip+0x56d6]        # 14000821c <__imp__cexit>
   140002b46:	90                   	nop
   140002b47:	90                   	nop

0000000140002b48 <_amsg_exit>:
   140002b48:	ff 25 c6 56 00 00    	jmp    QWORD PTR [rip+0x56c6]        # 140008214 <__imp__amsg_exit>
   140002b4e:	90                   	nop
   140002b4f:	90                   	nop

0000000140002b50 <__setusermatherr>:
   140002b50:	ff 25 ae 56 00 00    	jmp    QWORD PTR [rip+0x56ae]        # 140008204 <__imp___setusermatherr>
   140002b56:	90                   	nop
   140002b57:	90                   	nop

0000000140002b58 <__set_app_type>:
   140002b58:	ff 25 9e 56 00 00    	jmp    QWORD PTR [rip+0x569e]        # 1400081fc <__imp___set_app_type>
   140002b5e:	90                   	nop
   140002b5f:	90                   	nop

0000000140002b60 <__lconv_init>:
   140002b60:	ff 25 8e 56 00 00    	jmp    QWORD PTR [rip+0x568e]        # 1400081f4 <__imp___lconv_init>
   140002b66:	90                   	nop
   140002b67:	90                   	nop

0000000140002b68 <__getmainargs>:
   140002b68:	ff 25 6e 56 00 00    	jmp    QWORD PTR [rip+0x566e]        # 1400081dc <__imp___getmainargs>
   140002b6e:	90                   	nop
   140002b6f:	90                   	nop

0000000140002b70 <__C_specific_handler>:
   140002b70:	ff 25 5e 56 00 00    	jmp    QWORD PTR [rip+0x565e]        # 1400081d4 <__imp___C_specific_handler>
   140002b76:	90                   	nop
   140002b77:	90                   	nop
   140002b78:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140002b7f:	00 

0000000140002b80 <__acrt_iob_func>:
   140002b80:	53                   	push   rbx
   140002b81:	48 83 ec 20          	sub    rsp,0x20
   140002b85:	89 cb                	mov    ebx,ecx
   140002b87:	e8 64 00 00 00       	call   140002bf0 <__iob_func>
   140002b8c:	89 d9                	mov    ecx,ebx
   140002b8e:	48 8d 14 49          	lea    rdx,[rcx+rcx*2]
   140002b92:	48 c1 e2 04          	shl    rdx,0x4
   140002b96:	48 01 d0             	add    rax,rdx
   140002b99:	48 83 c4 20          	add    rsp,0x20
   140002b9d:	5b                   	pop    rbx
   140002b9e:	c3                   	ret    
   140002b9f:	90                   	nop

0000000140002ba0 <_get_invalid_parameter_handler>:
   140002ba0:	48 8b 05 e9 45 00 00 	mov    rax,QWORD PTR [rip+0x45e9]        # 140007190 <handler>
   140002ba7:	c3                   	ret    
   140002ba8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140002baf:	00 

0000000140002bb0 <_set_invalid_parameter_handler>:
   140002bb0:	48 89 c8             	mov    rax,rcx
   140002bb3:	48 87 05 d6 45 00 00 	xchg   QWORD PTR [rip+0x45d6],rax        # 140007190 <handler>
   140002bba:	c3                   	ret    
   140002bbb:	90                   	nop
   140002bbc:	90                   	nop
   140002bbd:	90                   	nop
   140002bbe:	90                   	nop
   140002bbf:	90                   	nop

0000000140002bc0 <__p__acmdln>:
   140002bc0:	48 8b 05 f9 17 00 00 	mov    rax,QWORD PTR [rip+0x17f9]        # 1400043c0 <.refptr.__imp__acmdln>
   140002bc7:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140002bca:	c3                   	ret    
   140002bcb:	90                   	nop
   140002bcc:	90                   	nop
   140002bcd:	90                   	nop
   140002bce:	90                   	nop
   140002bcf:	90                   	nop

0000000140002bd0 <__p__commode>:
   140002bd0:	48 8b 05 f9 17 00 00 	mov    rax,QWORD PTR [rip+0x17f9]        # 1400043d0 <.refptr.__imp__commode>
   140002bd7:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140002bda:	c3                   	ret    
   140002bdb:	90                   	nop
   140002bdc:	90                   	nop
   140002bdd:	90                   	nop
   140002bde:	90                   	nop
   140002bdf:	90                   	nop

0000000140002be0 <__p__fmode>:
   140002be0:	48 8b 05 f9 17 00 00 	mov    rax,QWORD PTR [rip+0x17f9]        # 1400043e0 <.refptr.__imp__fmode>
   140002be7:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140002bea:	c3                   	ret    
   140002beb:	90                   	nop
   140002bec:	90                   	nop
   140002bed:	90                   	nop
   140002bee:	90                   	nop
   140002bef:	90                   	nop

0000000140002bf0 <__iob_func>:
   140002bf0:	ff 25 f6 55 00 00    	jmp    QWORD PTR [rip+0x55f6]        # 1400081ec <__imp___iob_func>
   140002bf6:	90                   	nop
   140002bf7:	90                   	nop
   140002bf8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140002bff:	00 

0000000140002c00 <VirtualQuery>:
   140002c00:	ff 25 be 55 00 00    	jmp    QWORD PTR [rip+0x55be]        # 1400081c4 <__imp_VirtualQuery>
   140002c06:	90                   	nop
   140002c07:	90                   	nop

0000000140002c08 <VirtualProtect>:
   140002c08:	ff 25 ae 55 00 00    	jmp    QWORD PTR [rip+0x55ae]        # 1400081bc <__imp_VirtualProtect>
   140002c0e:	90                   	nop
   140002c0f:	90                   	nop

0000000140002c10 <TlsGetValue>:
   140002c10:	ff 25 9e 55 00 00    	jmp    QWORD PTR [rip+0x559e]        # 1400081b4 <__imp_TlsGetValue>
   140002c16:	90                   	nop
   140002c17:	90                   	nop

0000000140002c18 <Sleep>:
   140002c18:	ff 25 8e 55 00 00    	jmp    QWORD PTR [rip+0x558e]        # 1400081ac <__imp_Sleep>
   140002c1e:	90                   	nop
   140002c1f:	90                   	nop

0000000140002c20 <SetUnhandledExceptionFilter>:
   140002c20:	ff 25 7e 55 00 00    	jmp    QWORD PTR [rip+0x557e]        # 1400081a4 <__imp_SetUnhandledExceptionFilter>
   140002c26:	90                   	nop
   140002c27:	90                   	nop

0000000140002c28 <LeaveCriticalSection>:
   140002c28:	ff 25 6e 55 00 00    	jmp    QWORD PTR [rip+0x556e]        # 14000819c <__imp_LeaveCriticalSection>
   140002c2e:	90                   	nop
   140002c2f:	90                   	nop

0000000140002c30 <InitializeCriticalSection>:
   140002c30:	ff 25 5e 55 00 00    	jmp    QWORD PTR [rip+0x555e]        # 140008194 <__imp_InitializeCriticalSection>
   140002c36:	90                   	nop
   140002c37:	90                   	nop

0000000140002c38 <GetStartupInfoA>:
   140002c38:	ff 25 4e 55 00 00    	jmp    QWORD PTR [rip+0x554e]        # 14000818c <__imp_GetStartupInfoA>
   140002c3e:	90                   	nop
   140002c3f:	90                   	nop

0000000140002c40 <GetLastError>:
   140002c40:	ff 25 3e 55 00 00    	jmp    QWORD PTR [rip+0x553e]        # 140008184 <__imp_GetLastError>
   140002c46:	90                   	nop
   140002c47:	90                   	nop

0000000140002c48 <EnterCriticalSection>:
   140002c48:	ff 25 2e 55 00 00    	jmp    QWORD PTR [rip+0x552e]        # 14000817c <__imp_EnterCriticalSection>
   140002c4e:	90                   	nop
   140002c4f:	90                   	nop

0000000140002c50 <DeleteCriticalSection>:
   140002c50:	ff 25 1e 55 00 00    	jmp    QWORD PTR [rip+0x551e]        # 140008174 <__IAT_start__>
   140002c56:	90                   	nop
   140002c57:	90                   	nop
   140002c58:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140002c5f:	00 

0000000140002c60 <register_frame_ctor>:
   140002c60:	e9 bb e8 ff ff       	jmp    140001520 <__gcc_register_frame>
   140002c65:	90                   	nop
   140002c66:	90                   	nop
   140002c67:	90                   	nop
   140002c68:	90                   	nop
   140002c69:	90                   	nop
   140002c6a:	90                   	nop
   140002c6b:	90                   	nop
   140002c6c:	90                   	nop
   140002c6d:	90                   	nop
   140002c6e:	90                   	nop
   140002c6f:	90                   	nop

0000000140002c70 <__CTOR_LIST__>:
   140002c70:	ff                   	(bad)  
   140002c71:	ff                   	(bad)  
   140002c72:	ff                   	(bad)  
   140002c73:	ff                   	(bad)  
   140002c74:	ff                   	(bad)  
   140002c75:	ff                   	(bad)  
   140002c76:	ff                   	(bad)  
   140002c77:	ff                   	.byte 0xff

0000000140002c78 <.ctors.65535>:
   140002c78:	60                   	(bad)  
   140002c79:	2c 00                	sub    al,0x0
   140002c7b:	40 01 00             	rex add DWORD PTR [rax],eax
	...

0000000140002c88 <__DTOR_LIST__>:
   140002c88:	ff                   	(bad)  
   140002c89:	ff                   	(bad)  
   140002c8a:	ff                   	(bad)  
   140002c8b:	ff                   	(bad)  
   140002c8c:	ff                   	(bad)  
   140002c8d:	ff                   	(bad)  
   140002c8e:	ff                   	(bad)  
   140002c8f:	ff 00                	inc    DWORD PTR [rax]
   140002c91:	00 00                	add    BYTE PTR [rax],al
   140002c93:	00 00                	add    BYTE PTR [rax],al
   140002c95:	00 00                	add    BYTE PTR [rax],al
	...
