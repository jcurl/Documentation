
functest:     file format elf32-i386


Disassembly of section .init:

000003a0 <_init>:
 3a0:	53                   	push   ebx
 3a1:	83 ec 08             	sub    esp,0x8
 3a4:	e8 a7 00 00 00       	call   450 <__x86.get_pc_thunk.bx>
 3a9:	81 c3 2f 2c 00 00    	add    ebx,0x2c2f
 3af:	8b 83 1c 00 00 00    	mov    eax,DWORD PTR [ebx+0x1c]
 3b5:	85 c0                	test   eax,eax
 3b7:	74 05                	je     3be <_init+0x1e>
 3b9:	e8 4a 00 00 00       	call   408 <__gmon_start__@plt>
 3be:	83 c4 08             	add    esp,0x8
 3c1:	5b                   	pop    ebx
 3c2:	c3                   	ret    

Disassembly of section .plt:

000003d0 <.plt>:
 3d0:	ff b3 04 00 00 00    	push   DWORD PTR [ebx+0x4]
 3d6:	ff a3 08 00 00 00    	jmp    DWORD PTR [ebx+0x8]
 3dc:	00 00                	add    BYTE PTR [eax],al
	...

000003e0 <__stack_chk_fail@plt>:
 3e0:	ff a3 0c 00 00 00    	jmp    DWORD PTR [ebx+0xc]
 3e6:	68 00 00 00 00       	push   0x0
 3eb:	e9 e0 ff ff ff       	jmp    3d0 <.plt>

000003f0 <__libc_start_main@plt>:
 3f0:	ff a3 10 00 00 00    	jmp    DWORD PTR [ebx+0x10]
 3f6:	68 08 00 00 00       	push   0x8
 3fb:	e9 d0 ff ff ff       	jmp    3d0 <.plt>

Disassembly of section .plt.got:

00000400 <__cxa_finalize@plt>:
 400:	ff a3 18 00 00 00    	jmp    DWORD PTR [ebx+0x18]
 406:	66 90                	xchg   ax,ax

00000408 <__gmon_start__@plt>:
 408:	ff a3 1c 00 00 00    	jmp    DWORD PTR [ebx+0x1c]
 40e:	66 90                	xchg   ax,ax

Disassembly of section .text:

00000410 <_start>:
 410:	31 ed                	xor    ebp,ebp
 412:	5e                   	pop    esi
 413:	89 e1                	mov    ecx,esp
 415:	83 e4 f0             	and    esp,0xfffffff0
 418:	50                   	push   eax
 419:	54                   	push   esp
 41a:	52                   	push   edx
 41b:	e8 22 00 00 00       	call   442 <_start+0x32>
 420:	81 c3 b8 2b 00 00    	add    ebx,0x2bb8
 426:	8d 83 58 dc ff ff    	lea    eax,[ebx-0x23a8]
 42c:	50                   	push   eax
 42d:	8d 83 f8 db ff ff    	lea    eax,[ebx-0x2408]
 433:	50                   	push   eax
 434:	51                   	push   ecx
 435:	56                   	push   esi
 436:	ff b3 20 00 00 00    	push   DWORD PTR [ebx+0x20]
 43c:	e8 af ff ff ff       	call   3f0 <__libc_start_main@plt>
 441:	f4                   	hlt    
 442:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 445:	c3                   	ret    
 446:	66 90                	xchg   ax,ax
 448:	66 90                	xchg   ax,ax
 44a:	66 90                	xchg   ax,ax
 44c:	66 90                	xchg   ax,ax
 44e:	66 90                	xchg   ax,ax

00000450 <__x86.get_pc_thunk.bx>:
 450:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 453:	c3                   	ret    
 454:	66 90                	xchg   ax,ax
 456:	66 90                	xchg   ax,ax
 458:	66 90                	xchg   ax,ax
 45a:	66 90                	xchg   ax,ax
 45c:	66 90                	xchg   ax,ax
 45e:	66 90                	xchg   ax,ax

00000460 <deregister_tm_clones>:
 460:	e8 e4 00 00 00       	call   549 <__x86.get_pc_thunk.dx>
 465:	81 c2 73 2b 00 00    	add    edx,0x2b73
 46b:	8d 8a 30 00 00 00    	lea    ecx,[edx+0x30]
 471:	8d 82 30 00 00 00    	lea    eax,[edx+0x30]
 477:	39 c8                	cmp    eax,ecx
 479:	74 1d                	je     498 <deregister_tm_clones+0x38>
 47b:	8b 82 14 00 00 00    	mov    eax,DWORD PTR [edx+0x14]
 481:	85 c0                	test   eax,eax
 483:	74 13                	je     498 <deregister_tm_clones+0x38>
 485:	55                   	push   ebp
 486:	89 e5                	mov    ebp,esp
 488:	83 ec 14             	sub    esp,0x14
 48b:	51                   	push   ecx
 48c:	ff d0                	call   eax
 48e:	83 c4 10             	add    esp,0x10
 491:	c9                   	leave  
 492:	c3                   	ret    
 493:	90                   	nop
 494:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 498:	f3 c3                	repz ret 
 49a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

000004a0 <register_tm_clones>:
 4a0:	e8 a4 00 00 00       	call   549 <__x86.get_pc_thunk.dx>
 4a5:	81 c2 33 2b 00 00    	add    edx,0x2b33
 4ab:	55                   	push   ebp
 4ac:	8d 8a 30 00 00 00    	lea    ecx,[edx+0x30]
 4b2:	8d 82 30 00 00 00    	lea    eax,[edx+0x30]
 4b8:	29 c8                	sub    eax,ecx
 4ba:	89 e5                	mov    ebp,esp
 4bc:	53                   	push   ebx
 4bd:	c1 f8 02             	sar    eax,0x2
 4c0:	89 c3                	mov    ebx,eax
 4c2:	83 ec 04             	sub    esp,0x4
 4c5:	c1 eb 1f             	shr    ebx,0x1f
 4c8:	01 d8                	add    eax,ebx
 4ca:	d1 f8                	sar    eax,1
 4cc:	74 14                	je     4e2 <register_tm_clones+0x42>
 4ce:	8b 92 24 00 00 00    	mov    edx,DWORD PTR [edx+0x24]
 4d4:	85 d2                	test   edx,edx
 4d6:	74 0a                	je     4e2 <register_tm_clones+0x42>
 4d8:	83 ec 08             	sub    esp,0x8
 4db:	50                   	push   eax
 4dc:	51                   	push   ecx
 4dd:	ff d2                	call   edx
 4df:	83 c4 10             	add    esp,0x10
 4e2:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 4e5:	c9                   	leave  
 4e6:	c3                   	ret    
 4e7:	89 f6                	mov    esi,esi
 4e9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

000004f0 <__do_global_dtors_aux>:
 4f0:	55                   	push   ebp
 4f1:	89 e5                	mov    ebp,esp
 4f3:	53                   	push   ebx
 4f4:	e8 57 ff ff ff       	call   450 <__x86.get_pc_thunk.bx>
 4f9:	81 c3 df 2a 00 00    	add    ebx,0x2adf
 4ff:	83 ec 04             	sub    esp,0x4
 502:	80 bb 30 00 00 00 00 	cmp    BYTE PTR [ebx+0x30],0x0
 509:	75 27                	jne    532 <__do_global_dtors_aux+0x42>
 50b:	8b 83 18 00 00 00    	mov    eax,DWORD PTR [ebx+0x18]
 511:	85 c0                	test   eax,eax
 513:	74 11                	je     526 <__do_global_dtors_aux+0x36>
 515:	83 ec 0c             	sub    esp,0xc
 518:	ff b3 2c 00 00 00    	push   DWORD PTR [ebx+0x2c]
 51e:	e8 dd fe ff ff       	call   400 <__cxa_finalize@plt>
 523:	83 c4 10             	add    esp,0x10
 526:	e8 35 ff ff ff       	call   460 <deregister_tm_clones>
 52b:	c6 83 30 00 00 00 01 	mov    BYTE PTR [ebx+0x30],0x1
 532:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 535:	c9                   	leave  
 536:	c3                   	ret    
 537:	89 f6                	mov    esi,esi
 539:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00000540 <frame_dummy>:
 540:	55                   	push   ebp
 541:	89 e5                	mov    ebp,esp
 543:	5d                   	pop    ebp
 544:	e9 57 ff ff ff       	jmp    4a0 <register_tm_clones>

00000549 <__x86.get_pc_thunk.dx>:
 549:	8b 14 24             	mov    edx,DWORD PTR [esp]
 54c:	c3                   	ret    

0000054d <funcintr>:
 54d:	55                   	push   ebp
 54e:	89 e5                	mov    ebp,esp
 550:	e8 52 02 00 00       	call   7a7 <__x86.get_pc_thunk.ax>
 555:	05 83 2a 00 00       	add    eax,0x2a83
 55a:	b8 2a 00 00 00       	mov    eax,0x2a
 55f:	5d                   	pop    ebp
 560:	c3                   	ret    

00000561 <funcint64r>:
 561:	55                   	push   ebp
 562:	89 e5                	mov    ebp,esp
 564:	e8 3e 02 00 00       	call   7a7 <__x86.get_pc_thunk.ax>
 569:	05 6f 2a 00 00       	add    eax,0x2a6f
 56e:	b8 00 00 00 00       	mov    eax,0x0
 573:	ba 42 00 00 00       	mov    edx,0x42
 578:	5d                   	pop    ebp
 579:	c3                   	ret    

0000057a <funcint64r2>:
 57a:	55                   	push   ebp
 57b:	89 e5                	mov    ebp,esp
 57d:	e8 25 02 00 00       	call   7a7 <__x86.get_pc_thunk.ax>
 582:	05 56 2a 00 00       	add    eax,0x2a56
 587:	b8 2a 00 00 00       	mov    eax,0x2a
 58c:	ba 00 00 00 00       	mov    edx,0x0
 591:	5d                   	pop    ebp
 592:	c3                   	ret    

00000593 <funcint>:
 593:	55                   	push   ebp
 594:	89 e5                	mov    ebp,esp
 596:	e8 0c 02 00 00       	call   7a7 <__x86.get_pc_thunk.ax>
 59b:	05 3d 2a 00 00       	add    eax,0x2a3d
 5a0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 5a3:	8d 50 01             	lea    edx,[eax+0x1]
 5a6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 5a9:	83 c0 02             	add    eax,0x2
 5ac:	0f af c2             	imul   eax,edx
 5af:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
 5b2:	83 c2 03             	add    edx,0x3
 5b5:	0f af c2             	imul   eax,edx
 5b8:	5d                   	pop    ebp
 5b9:	c3                   	ret    

000005ba <funcchar>:
 5ba:	55                   	push   ebp
 5bb:	89 e5                	mov    ebp,esp
 5bd:	83 ec 08             	sub    esp,0x8
 5c0:	e8 e2 01 00 00       	call   7a7 <__x86.get_pc_thunk.ax>
 5c5:	05 13 2a 00 00       	add    eax,0x2a13
 5ca:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 5cd:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 5d0:	88 55 fc             	mov    BYTE PTR [ebp-0x4],dl
 5d3:	88 45 f8             	mov    BYTE PTR [ebp-0x8],al
 5d6:	0f be 45 fc          	movsx  eax,BYTE PTR [ebp-0x4]
 5da:	8d 50 01             	lea    edx,[eax+0x1]
 5dd:	0f be 45 f8          	movsx  eax,BYTE PTR [ebp-0x8]
 5e1:	83 c0 02             	add    eax,0x2
 5e4:	0f af c2             	imul   eax,edx
 5e7:	c9                   	leave  
 5e8:	c3                   	ret    

000005e9 <funcfloat>:
 5e9:	55                   	push   ebp
 5ea:	89 e5                	mov    ebp,esp
 5ec:	83 ec 08             	sub    esp,0x8
 5ef:	e8 b3 01 00 00       	call   7a7 <__x86.get_pc_thunk.ax>
 5f4:	05 e4 29 00 00       	add    eax,0x29e4
 5f9:	d9 45 08             	fld    DWORD PTR [ebp+0x8]
 5fc:	d9 e8                	fld1   
 5fe:	de c1                	faddp  st(1),st
 600:	d9 45 0c             	fld    DWORD PTR [ebp+0xc]
 603:	dd 80 98 dc ff ff    	fld    QWORD PTR [eax-0x2368]
 609:	de c1                	faddp  st(1),st
 60b:	de c9                	fmulp  st(1),st
 60d:	d9 45 10             	fld    DWORD PTR [ebp+0x10]
 610:	dd 80 a0 dc ff ff    	fld    QWORD PTR [eax-0x2360]
 616:	de c1                	faddp  st(1),st
 618:	de c9                	fmulp  st(1),st
 61a:	d9 5d fc             	fstp   DWORD PTR [ebp-0x4]
 61d:	d9 45 fc             	fld    DWORD PTR [ebp-0x4]
 620:	c9                   	leave  
 621:	c3                   	ret    

00000622 <funcfloatint>:
 622:	55                   	push   ebp
 623:	89 e5                	mov    ebp,esp
 625:	83 ec 10             	sub    esp,0x10
 628:	e8 7a 01 00 00       	call   7a7 <__x86.get_pc_thunk.ax>
 62d:	05 ab 29 00 00       	add    eax,0x29ab
 632:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 635:	83 c2 01             	add    edx,0x1
 638:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 63b:	db 45 f4             	fild   DWORD PTR [ebp-0xc]
 63e:	d9 45 0c             	fld    DWORD PTR [ebp+0xc]
 641:	dd 80 98 dc ff ff    	fld    QWORD PTR [eax-0x2368]
 647:	de c1                	faddp  st(1),st
 649:	de c9                	fmulp  st(1),st
 64b:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
 64e:	83 c2 03             	add    edx,0x3
 651:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 654:	db 45 f4             	fild   DWORD PTR [ebp-0xc]
 657:	de c9                	fmulp  st(1),st
 659:	d9 45 14             	fld    DWORD PTR [ebp+0x14]
 65c:	dd 80 a8 dc ff ff    	fld    QWORD PTR [eax-0x2358]
 662:	de c1                	faddp  st(1),st
 664:	de c9                	fmulp  st(1),st
 666:	d9 7d fe             	fnstcw WORD PTR [ebp-0x2]
 669:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
 66d:	80 cc 0c             	or     ah,0xc
 670:	66 89 45 fc          	mov    WORD PTR [ebp-0x4],ax
 674:	d9 6d fc             	fldcw  WORD PTR [ebp-0x4]
 677:	db 5d f8             	fistp  DWORD PTR [ebp-0x8]
 67a:	d9 6d fe             	fldcw  WORD PTR [ebp-0x2]
 67d:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 680:	c9                   	leave  
 681:	c3                   	ret    

00000682 <funcdouble>:
 682:	55                   	push   ebp
 683:	89 e5                	mov    ebp,esp
 685:	83 ec 10             	sub    esp,0x10
 688:	e8 1a 01 00 00       	call   7a7 <__x86.get_pc_thunk.ax>
 68d:	05 4b 29 00 00       	add    eax,0x294b
 692:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 695:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
 698:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 69b:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 69e:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
 6a1:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
 6a4:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
 6a7:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 6aa:	dd 45 f8             	fld    QWORD PTR [ebp-0x8]
 6ad:	dd 80 98 dc ff ff    	fld    QWORD PTR [eax-0x2368]
 6b3:	de c1                	faddp  st(1),st
 6b5:	dd 45 f0             	fld    QWORD PTR [ebp-0x10]
 6b8:	dd 80 a8 dc ff ff    	fld    QWORD PTR [eax-0x2358]
 6be:	de c1                	faddp  st(1),st
 6c0:	de c9                	fmulp  st(1),st
 6c2:	c9                   	leave  
 6c3:	c3                   	ret    

000006c4 <funcstructvalue>:
 6c4:	55                   	push   ebp
 6c5:	89 e5                	mov    ebp,esp
 6c7:	e8 db 00 00 00       	call   7a7 <__x86.get_pc_thunk.ax>
 6cc:	05 0c 29 00 00       	add    eax,0x290c
 6d1:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 6d4:	8b 45 20             	mov    eax,DWORD PTR [ebp+0x20]
 6d7:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 6da:	01 d0                	add    eax,edx
 6dc:	5d                   	pop    ebp
 6dd:	c3                   	ret    

000006de <funcstructret>:
 6de:	55                   	push   ebp
 6df:	89 e5                	mov    ebp,esp
 6e1:	83 ec 20             	sub    esp,0x20
 6e4:	e8 be 00 00 00       	call   7a7 <__x86.get_pc_thunk.ax>
 6e9:	05 ef 28 00 00       	add    eax,0x28ef
 6ee:	b9 00 00 00 00       	mov    ecx,0x0
 6f3:	b8 18 00 00 00       	mov    eax,0x18
 6f8:	83 e0 fc             	and    eax,0xfffffffc
 6fb:	89 c2                	mov    edx,eax
 6fd:	b8 00 00 00 00       	mov    eax,0x0
 702:	89 4c 05 e8          	mov    DWORD PTR [ebp+eax*1-0x18],ecx
 706:	83 c0 04             	add    eax,0x4
 709:	39 d0                	cmp    eax,edx
 70b:	72 f5                	jb     702 <funcstructret+0x24>
 70d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 710:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 713:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 716:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 719:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 71c:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
 71f:	89 10                	mov    DWORD PTR [eax],edx
 721:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 724:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
 727:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 72a:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
 72d:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 730:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
 733:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
 736:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
 739:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 73c:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
 73f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 742:	c9                   	leave  
 743:	c2 04 00             	ret    0x4

00000746 <funcvarargs>:
 746:	55                   	push   ebp
 747:	89 e5                	mov    ebp,esp
 749:	83 ec 18             	sub    esp,0x18
 74c:	e8 56 00 00 00       	call   7a7 <__x86.get_pc_thunk.ax>
 751:	05 87 28 00 00       	add    eax,0x2887
 756:	65 a1 14 00 00 00    	mov    eax,gs:0x14
 75c:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 75f:	31 c0                	xor    eax,eax
 761:	8d 45 0c             	lea    eax,[ebp+0xc]
 764:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 767:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 76e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 775:	eb 12                	jmp    789 <funcvarargs+0x43>
 777:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 77a:	8d 50 04             	lea    edx,[eax+0x4]
 77d:	89 55 e8             	mov    DWORD PTR [ebp-0x18],edx
 780:	8b 00                	mov    eax,DWORD PTR [eax]
 782:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
 785:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 789:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 78c:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 78f:	7c e6                	jl     777 <funcvarargs+0x31>
 791:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 794:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 797:	65 33 0d 14 00 00 00 	xor    ecx,DWORD PTR gs:0x14
 79e:	74 05                	je     7a5 <funcvarargs+0x5f>
 7a0:	e8 9b 04 00 00       	call   c40 <__stack_chk_fail_local>
 7a5:	c9                   	leave  
 7a6:	c3                   	ret    

000007a7 <__x86.get_pc_thunk.ax>:
 7a7:	8b 04 24             	mov    eax,DWORD PTR [esp]
 7aa:	c3                   	ret    

000007ab <test_funcintr>:
 7ab:	55                   	push   ebp
 7ac:	89 e5                	mov    ebp,esp
 7ae:	53                   	push   ebx
 7af:	83 ec 14             	sub    esp,0x14
 7b2:	e8 f0 ff ff ff       	call   7a7 <__x86.get_pc_thunk.ax>
 7b7:	05 21 28 00 00       	add    eax,0x2821
 7bc:	89 c3                	mov    ebx,eax
 7be:	e8 8a fd ff ff       	call   54d <funcintr>
 7c3:	83 c0 01             	add    eax,0x1
 7c6:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 7c9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 7cc:	83 c4 14             	add    esp,0x14
 7cf:	5b                   	pop    ebx
 7d0:	5d                   	pop    ebp
 7d1:	c3                   	ret    

000007d2 <test_funcint64r>:
 7d2:	55                   	push   ebp
 7d3:	89 e5                	mov    ebp,esp
 7d5:	53                   	push   ebx
 7d6:	83 ec 14             	sub    esp,0x14
 7d9:	e8 c9 ff ff ff       	call   7a7 <__x86.get_pc_thunk.ax>
 7de:	05 fa 27 00 00       	add    eax,0x27fa
 7e3:	89 c3                	mov    ebx,eax
 7e5:	e8 77 fd ff ff       	call   561 <funcint64r>
 7ea:	83 c0 01             	add    eax,0x1
 7ed:	83 d2 00             	adc    edx,0x0
 7f0:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 7f3:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 7f6:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 7f9:	83 c4 14             	add    esp,0x14
 7fc:	5b                   	pop    ebx
 7fd:	5d                   	pop    ebp
 7fe:	c3                   	ret    

000007ff <test_funcint64r2>:
 7ff:	55                   	push   ebp
 800:	89 e5                	mov    ebp,esp
 802:	53                   	push   ebx
 803:	83 ec 14             	sub    esp,0x14
 806:	e8 9c ff ff ff       	call   7a7 <__x86.get_pc_thunk.ax>
 80b:	05 cd 27 00 00       	add    eax,0x27cd
 810:	89 c3                	mov    ebx,eax
 812:	e8 63 fd ff ff       	call   57a <funcint64r2>
 817:	83 c0 01             	add    eax,0x1
 81a:	83 d2 00             	adc    edx,0x0
 81d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 820:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 823:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 826:	83 c4 14             	add    esp,0x14
 829:	5b                   	pop    ebx
 82a:	5d                   	pop    ebp
 82b:	c3                   	ret    

0000082c <test_funcint>:
 82c:	55                   	push   ebp
 82d:	89 e5                	mov    ebp,esp
 82f:	53                   	push   ebx
 830:	83 ec 14             	sub    esp,0x14
 833:	e8 6f ff ff ff       	call   7a7 <__x86.get_pc_thunk.ax>
 838:	05 a0 27 00 00       	add    eax,0x27a0
 83d:	83 ec 04             	sub    esp,0x4
 840:	6a 03                	push   0x3
 842:	6a 02                	push   0x2
 844:	6a 01                	push   0x1
 846:	89 c3                	mov    ebx,eax
 848:	e8 46 fd ff ff       	call   593 <funcint>
 84d:	83 c4 10             	add    esp,0x10
 850:	83 c0 01             	add    eax,0x1
 853:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 856:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 859:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 85c:	c9                   	leave  
 85d:	c3                   	ret    

0000085e <test_funcchar>:
 85e:	55                   	push   ebp
 85f:	89 e5                	mov    ebp,esp
 861:	53                   	push   ebx
 862:	83 ec 14             	sub    esp,0x14
 865:	e8 3d ff ff ff       	call   7a7 <__x86.get_pc_thunk.ax>
 86a:	05 6e 27 00 00       	add    eax,0x276e
 86f:	83 ec 08             	sub    esp,0x8
 872:	6a 02                	push   0x2
 874:	6a 01                	push   0x1
 876:	89 c3                	mov    ebx,eax
 878:	e8 3d fd ff ff       	call   5ba <funcchar>
 87d:	83 c4 10             	add    esp,0x10
 880:	83 c0 01             	add    eax,0x1
 883:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 886:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 889:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 88c:	c9                   	leave  
 88d:	c3                   	ret    

0000088e <test_funcfloat>:
 88e:	55                   	push   ebp
 88f:	89 e5                	mov    ebp,esp
 891:	53                   	push   ebx
 892:	83 ec 24             	sub    esp,0x24
 895:	e8 b6 fb ff ff       	call   450 <__x86.get_pc_thunk.bx>
 89a:	81 c3 3e 27 00 00    	add    ebx,0x273e
 8a0:	83 ec 04             	sub    esp,0x4
 8a3:	d9 83 b0 dc ff ff    	fld    DWORD PTR [ebx-0x2350]
 8a9:	8d 64 24 fc          	lea    esp,[esp-0x4]
 8ad:	d9 1c 24             	fstp   DWORD PTR [esp]
 8b0:	d9 83 b4 dc ff ff    	fld    DWORD PTR [ebx-0x234c]
 8b6:	8d 64 24 fc          	lea    esp,[esp-0x4]
 8ba:	d9 1c 24             	fstp   DWORD PTR [esp]
 8bd:	d9 e8                	fld1   
 8bf:	8d 64 24 fc          	lea    esp,[esp-0x4]
 8c3:	d9 1c 24             	fstp   DWORD PTR [esp]
 8c6:	e8 1e fd ff ff       	call   5e9 <funcfloat>
 8cb:	83 c4 10             	add    esp,0x10
 8ce:	d9 83 b8 dc ff ff    	fld    DWORD PTR [ebx-0x2348]
 8d4:	de c1                	faddp  st(1),st
 8d6:	d9 5d f4             	fstp   DWORD PTR [ebp-0xc]
 8d9:	d9 45 f4             	fld    DWORD PTR [ebp-0xc]
 8dc:	d9 7d e6             	fnstcw WORD PTR [ebp-0x1a]
 8df:	0f b7 45 e6          	movzx  eax,WORD PTR [ebp-0x1a]
 8e3:	80 cc 0c             	or     ah,0xc
 8e6:	66 89 45 e4          	mov    WORD PTR [ebp-0x1c],ax
 8ea:	d9 6d e4             	fldcw  WORD PTR [ebp-0x1c]
 8ed:	db 5d e0             	fistp  DWORD PTR [ebp-0x20]
 8f0:	d9 6d e6             	fldcw  WORD PTR [ebp-0x1a]
 8f3:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 8f6:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 8f9:	c9                   	leave  
 8fa:	c3                   	ret    

000008fb <test_funcfloatint>:
 8fb:	55                   	push   ebp
 8fc:	89 e5                	mov    ebp,esp
 8fe:	53                   	push   ebx
 8ff:	83 ec 14             	sub    esp,0x14
 902:	e8 a0 fe ff ff       	call   7a7 <__x86.get_pc_thunk.ax>
 907:	05 d1 26 00 00       	add    eax,0x26d1
 90c:	d9 80 b8 dc ff ff    	fld    DWORD PTR [eax-0x2348]
 912:	8d 64 24 fc          	lea    esp,[esp-0x4]
 916:	d9 1c 24             	fstp   DWORD PTR [esp]
 919:	6a 03                	push   0x3
 91b:	d9 80 b4 dc ff ff    	fld    DWORD PTR [eax-0x234c]
 921:	8d 64 24 fc          	lea    esp,[esp-0x4]
 925:	d9 1c 24             	fstp   DWORD PTR [esp]
 928:	6a 01                	push   0x1
 92a:	89 c3                	mov    ebx,eax
 92c:	e8 f1 fc ff ff       	call   622 <funcfloatint>
 931:	83 c4 10             	add    esp,0x10
 934:	83 c0 01             	add    eax,0x1
 937:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 93a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 93d:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 940:	c9                   	leave  
 941:	c3                   	ret    

00000942 <test_funcdouble>:
 942:	55                   	push   ebp
 943:	89 e5                	mov    ebp,esp
 945:	53                   	push   ebx
 946:	83 ec 24             	sub    esp,0x24
 949:	e8 02 fb ff ff       	call   450 <__x86.get_pc_thunk.bx>
 94e:	81 c3 8a 26 00 00    	add    ebx,0x268a
 954:	dd 83 c0 dc ff ff    	fld    QWORD PTR [ebx-0x2340]
 95a:	8d 64 24 f8          	lea    esp,[esp-0x8]
 95e:	dd 1c 24             	fstp   QWORD PTR [esp]
 961:	dd 83 c8 dc ff ff    	fld    QWORD PTR [ebx-0x2338]
 967:	8d 64 24 f8          	lea    esp,[esp-0x8]
 96b:	dd 1c 24             	fstp   QWORD PTR [esp]
 96e:	e8 0f fd ff ff       	call   682 <funcdouble>
 973:	83 c4 10             	add    esp,0x10
 976:	d9 e8                	fld1   
 978:	de c1                	faddp  st(1),st
 97a:	dd 5d f0             	fstp   QWORD PTR [ebp-0x10]
 97d:	dd 45 f0             	fld    QWORD PTR [ebp-0x10]
 980:	d9 7d e6             	fnstcw WORD PTR [ebp-0x1a]
 983:	0f b7 45 e6          	movzx  eax,WORD PTR [ebp-0x1a]
 987:	80 cc 0c             	or     ah,0xc
 98a:	66 89 45 e4          	mov    WORD PTR [ebp-0x1c],ax
 98e:	d9 6d e4             	fldcw  WORD PTR [ebp-0x1c]
 991:	db 5d e0             	fistp  DWORD PTR [ebp-0x20]
 994:	d9 6d e6             	fldcw  WORD PTR [ebp-0x1a]
 997:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 99a:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 99d:	c9                   	leave  
 99e:	c3                   	ret    

0000099f <test_funcstructvalue>:
 99f:	55                   	push   ebp
 9a0:	89 e5                	mov    ebp,esp
 9a2:	53                   	push   ebx
 9a3:	83 ec 44             	sub    esp,0x44
 9a6:	e8 9e fb ff ff       	call   549 <__x86.get_pc_thunk.dx>
 9ab:	81 c2 2d 26 00 00    	add    edx,0x262d
 9b1:	65 a1 14 00 00 00    	mov    eax,gs:0x14
 9b7:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 9ba:	31 c0                	xor    eax,eax
 9bc:	c7 45 c4 01 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x1
 9c3:	c7 45 c8 02 00 00 00 	mov    DWORD PTR [ebp-0x38],0x2
 9ca:	c7 45 cc 03 00 00 00 	mov    DWORD PTR [ebp-0x34],0x3
 9d1:	c7 45 d0 04 00 00 00 	mov    DWORD PTR [ebp-0x30],0x4
 9d8:	c7 45 d4 05 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x5
 9df:	c7 45 d8 06 00 00 00 	mov    DWORD PTR [ebp-0x28],0x6
 9e6:	bb 00 00 00 00       	mov    ebx,0x0
 9eb:	b8 18 00 00 00       	mov    eax,0x18
 9f0:	83 e0 fc             	and    eax,0xfffffffc
 9f3:	89 c1                	mov    ecx,eax
 9f5:	b8 00 00 00 00       	mov    eax,0x0
 9fa:	89 5c 05 dc          	mov    DWORD PTR [ebp+eax*1-0x24],ebx
 9fe:	83 c0 04             	add    eax,0x4
 a01:	39 c8                	cmp    eax,ecx
 a03:	72 f5                	jb     9fa <test_funcstructvalue+0x5b>
 a05:	83 ec 04             	sub    esp,0x4
 a08:	8d 45 dc             	lea    eax,[ebp-0x24]
 a0b:	50                   	push   eax
 a0c:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 a0f:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 a12:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 a15:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
 a18:	ff 75 c8             	push   DWORD PTR [ebp-0x38]
 a1b:	ff 75 c4             	push   DWORD PTR [ebp-0x3c]
 a1e:	89 d3                	mov    ebx,edx
 a20:	e8 9f fc ff ff       	call   6c4 <funcstructvalue>
 a25:	83 c4 20             	add    esp,0x20
 a28:	83 c0 01             	add    eax,0x1
 a2b:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
 a2e:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 a31:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 a34:	65 33 15 14 00 00 00 	xor    edx,DWORD PTR gs:0x14
 a3b:	74 05                	je     a42 <test_funcstructvalue+0xa3>
 a3d:	e8 fe 01 00 00       	call   c40 <__stack_chk_fail_local>
 a42:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 a45:	c9                   	leave  
 a46:	c3                   	ret    

00000a47 <test_funcstructret>:
 a47:	55                   	push   ebp
 a48:	89 e5                	mov    ebp,esp
 a4a:	53                   	push   ebx
 a4b:	83 ec 24             	sub    esp,0x24
 a4e:	e8 54 fd ff ff       	call   7a7 <__x86.get_pc_thunk.ax>
 a53:	05 85 25 00 00       	add    eax,0x2585
 a58:	65 8b 0d 14 00 00 00 	mov    ecx,DWORD PTR gs:0x14
 a5f:	89 4d f4             	mov    DWORD PTR [ebp-0xc],ecx
 a62:	31 c9                	xor    ecx,ecx
 a64:	8d 55 dc             	lea    edx,[ebp-0x24]
 a67:	83 ec 04             	sub    esp,0x4
 a6a:	6a 02                	push   0x2
 a6c:	6a 01                	push   0x1
 a6e:	52                   	push   edx
 a6f:	89 c3                	mov    ebx,eax
 a71:	e8 68 fc ff ff       	call   6de <funcstructret>
 a76:	83 c4 0c             	add    esp,0xc
 a79:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 a7c:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 a7f:	65 33 0d 14 00 00 00 	xor    ecx,DWORD PTR gs:0x14
 a86:	74 05                	je     a8d <test_funcstructret+0x46>
 a88:	e8 b3 01 00 00       	call   c40 <__stack_chk_fail_local>
 a8d:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 a90:	c9                   	leave  
 a91:	c3                   	ret    

00000a92 <test_funcvarargs1>:
 a92:	55                   	push   ebp
 a93:	89 e5                	mov    ebp,esp
 a95:	53                   	push   ebx
 a96:	83 ec 14             	sub    esp,0x14
 a99:	e8 09 fd ff ff       	call   7a7 <__x86.get_pc_thunk.ax>
 a9e:	05 3a 25 00 00       	add    eax,0x253a
 aa3:	83 ec 0c             	sub    esp,0xc
 aa6:	6a 01                	push   0x1
 aa8:	89 c3                	mov    ebx,eax
 aaa:	e8 97 fc ff ff       	call   746 <funcvarargs>
 aaf:	83 c4 10             	add    esp,0x10
 ab2:	83 c0 01             	add    eax,0x1
 ab5:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 ab8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 abb:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 abe:	c9                   	leave  
 abf:	c3                   	ret    

00000ac0 <test_funcvarargs4>:
 ac0:	55                   	push   ebp
 ac1:	89 e5                	mov    ebp,esp
 ac3:	53                   	push   ebx
 ac4:	83 ec 14             	sub    esp,0x14
 ac7:	e8 db fc ff ff       	call   7a7 <__x86.get_pc_thunk.ax>
 acc:	05 0c 25 00 00       	add    eax,0x250c
 ad1:	83 ec 0c             	sub    esp,0xc
 ad4:	6a 04                	push   0x4
 ad6:	6a 03                	push   0x3
 ad8:	6a 02                	push   0x2
 ada:	6a 01                	push   0x1
 adc:	6a 04                	push   0x4
 ade:	89 c3                	mov    ebx,eax
 ae0:	e8 61 fc ff ff       	call   746 <funcvarargs>
 ae5:	83 c4 20             	add    esp,0x20
 ae8:	83 c0 01             	add    eax,0x1
 aeb:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 aee:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 af1:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 af4:	c9                   	leave  
 af5:	c3                   	ret    

00000af6 <test_funcvarargs6>:
 af6:	55                   	push   ebp
 af7:	89 e5                	mov    ebp,esp
 af9:	53                   	push   ebx
 afa:	83 ec 14             	sub    esp,0x14
 afd:	e8 a5 fc ff ff       	call   7a7 <__x86.get_pc_thunk.ax>
 b02:	05 d6 24 00 00       	add    eax,0x24d6
 b07:	83 ec 04             	sub    esp,0x4
 b0a:	6a 0c                	push   0xc
 b0c:	6a 0a                	push   0xa
 b0e:	6a 08                	push   0x8
 b10:	6a 06                	push   0x6
 b12:	6a 04                	push   0x4
 b14:	6a 02                	push   0x2
 b16:	6a 06                	push   0x6
 b18:	89 c3                	mov    ebx,eax
 b1a:	e8 27 fc ff ff       	call   746 <funcvarargs>
 b1f:	83 c4 20             	add    esp,0x20
 b22:	83 c0 01             	add    eax,0x1
 b25:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 b28:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 b2b:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 b2e:	c9                   	leave  
 b2f:	c3                   	ret    

00000b30 <main>:
 b30:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 b34:	83 e4 f0             	and    esp,0xfffffff0
 b37:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 b3a:	55                   	push   ebp
 b3b:	89 e5                	mov    ebp,esp
 b3d:	51                   	push   ecx
 b3e:	83 ec 14             	sub    esp,0x14
 b41:	e8 61 fc ff ff       	call   7a7 <__x86.get_pc_thunk.ax>
 b46:	05 92 24 00 00       	add    eax,0x2492
 b4b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 b52:	e8 54 fc ff ff       	call   7ab <test_funcintr>
 b57:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 b5a:	e8 73 fc ff ff       	call   7d2 <test_funcint64r>
 b5f:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 b62:	e8 98 fc ff ff       	call   7ff <test_funcint64r2>
 b67:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 b6a:	e8 bd fc ff ff       	call   82c <test_funcint>
 b6f:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 b72:	e8 e7 fc ff ff       	call   85e <test_funcchar>
 b77:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 b7a:	e8 0f fd ff ff       	call   88e <test_funcfloat>
 b7f:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 b82:	e8 74 fd ff ff       	call   8fb <test_funcfloatint>
 b87:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 b8a:	e8 b3 fd ff ff       	call   942 <test_funcdouble>
 b8f:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 b92:	e8 08 fe ff ff       	call   99f <test_funcstructvalue>
 b97:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 b9a:	e8 a8 fe ff ff       	call   a47 <test_funcstructret>
 b9f:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 ba2:	e8 eb fe ff ff       	call   a92 <test_funcvarargs1>
 ba7:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 baa:	e8 11 ff ff ff       	call   ac0 <test_funcvarargs4>
 baf:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 bb2:	e8 3f ff ff ff       	call   af6 <test_funcvarargs6>
 bb7:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 bba:	b8 00 00 00 00       	mov    eax,0x0
 bbf:	83 c4 14             	add    esp,0x14
 bc2:	59                   	pop    ecx
 bc3:	5d                   	pop    ebp
 bc4:	8d 61 fc             	lea    esp,[ecx-0x4]
 bc7:	c3                   	ret    
 bc8:	66 90                	xchg   ax,ax
 bca:	66 90                	xchg   ax,ax
 bcc:	66 90                	xchg   ax,ax
 bce:	66 90                	xchg   ax,ax

00000bd0 <__libc_csu_init>:
 bd0:	55                   	push   ebp
 bd1:	57                   	push   edi
 bd2:	56                   	push   esi
 bd3:	53                   	push   ebx
 bd4:	e8 77 f8 ff ff       	call   450 <__x86.get_pc_thunk.bx>
 bd9:	81 c3 ff 23 00 00    	add    ebx,0x23ff
 bdf:	83 ec 0c             	sub    esp,0xc
 be2:	8b 6c 24 28          	mov    ebp,DWORD PTR [esp+0x28]
 be6:	8d b3 04 ff ff ff    	lea    esi,[ebx-0xfc]
 bec:	e8 af f7 ff ff       	call   3a0 <_init>
 bf1:	8d 83 00 ff ff ff    	lea    eax,[ebx-0x100]
 bf7:	29 c6                	sub    esi,eax
 bf9:	c1 fe 02             	sar    esi,0x2
 bfc:	85 f6                	test   esi,esi
 bfe:	74 25                	je     c25 <__libc_csu_init+0x55>
 c00:	31 ff                	xor    edi,edi
 c02:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
 c08:	83 ec 04             	sub    esp,0x4
 c0b:	55                   	push   ebp
 c0c:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 c10:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 c14:	ff 94 bb 00 ff ff ff 	call   DWORD PTR [ebx+edi*4-0x100]
 c1b:	83 c7 01             	add    edi,0x1
 c1e:	83 c4 10             	add    esp,0x10
 c21:	39 fe                	cmp    esi,edi
 c23:	75 e3                	jne    c08 <__libc_csu_init+0x38>
 c25:	83 c4 0c             	add    esp,0xc
 c28:	5b                   	pop    ebx
 c29:	5e                   	pop    esi
 c2a:	5f                   	pop    edi
 c2b:	5d                   	pop    ebp
 c2c:	c3                   	ret    
 c2d:	8d 76 00             	lea    esi,[esi+0x0]

00000c30 <__libc_csu_fini>:
 c30:	f3 c3                	repz ret 
 c32:	66 90                	xchg   ax,ax
 c34:	66 90                	xchg   ax,ax
 c36:	66 90                	xchg   ax,ax
 c38:	66 90                	xchg   ax,ax
 c3a:	66 90                	xchg   ax,ax
 c3c:	66 90                	xchg   ax,ax
 c3e:	66 90                	xchg   ax,ax

00000c40 <__stack_chk_fail_local>:
 c40:	53                   	push   ebx
 c41:	e8 0a f8 ff ff       	call   450 <__x86.get_pc_thunk.bx>
 c46:	81 c3 92 23 00 00    	add    ebx,0x2392
 c4c:	83 ec 08             	sub    esp,0x8
 c4f:	e8 8c f7 ff ff       	call   3e0 <__stack_chk_fail@plt>

Disassembly of section .fini:

00000c54 <_fini>:
 c54:	53                   	push   ebx
 c55:	83 ec 08             	sub    esp,0x8
 c58:	e8 f3 f7 ff ff       	call   450 <__x86.get_pc_thunk.bx>
 c5d:	81 c3 7b 23 00 00    	add    ebx,0x237b
 c63:	83 c4 08             	add    esp,0x8
 c66:	5b                   	pop    ebx
 c67:	c3                   	ret    
