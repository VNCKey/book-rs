	.file	"main.8f81e49356787d17-cgu.0"
	.section	.text._ZN3std2rt10lang_start17h37ec48243b8dd23aE,"ax",@progbits
	.hidden	_ZN3std2rt10lang_start17h37ec48243b8dd23aE
	.globl	_ZN3std2rt10lang_start17h37ec48243b8dd23aE
	.p2align	4
	.type	_ZN3std2rt10lang_start17h37ec48243b8dd23aE,@function
_ZN3std2rt10lang_start17h37ec48243b8dd23aE:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%ecx, %eax
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	%rdi, (%rsp)
	movq	%rsp, %rdi
	leaq	.Lanon.71cc8978aafdad452e4de9b14db389e9.0(%rip), %rsi
	movzbl	%al, %r8d
	callq	*_RNvNtCs75vJTIYSa2J_3std2rt19lang_start_internal@GOTPCREL(%rip)
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	_ZN3std2rt10lang_start17h37ec48243b8dd23aE, .Lfunc_end0-_ZN3std2rt10lang_start17h37ec48243b8dd23aE
	.cfi_endproc

	.section	".text._ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he6dd0c326092176dE","ax",@progbits
	.p2align	4
	.type	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he6dd0c326092176dE,@function
_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he6dd0c326092176dE:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	(%rdi), %rdi
	callq	_ZN3std3sys9backtrace28__rust_begin_short_backtrace17hafa657e659eb3b9aE
	callq	_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17ha4d85548ea4ef648E
	movzbl	%al, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he6dd0c326092176dE, .Lfunc_end1-_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he6dd0c326092176dE
	.cfi_endproc

	.section	".text._ZN3std3f6421_$LT$impl$u20$f64$GT$4sqrt17h1eb2129ef042b2d1E","ax",@progbits
	.p2align	4
	.type	_ZN3std3f6421_$LT$impl$u20$f64$GT$4sqrt17h1eb2129ef042b2d1E,@function
_ZN3std3f6421_$LT$impl$u20$f64$GT$4sqrt17h1eb2129ef042b2d1E:
	.cfi_startproc
	sqrtsd	%xmm0, %xmm0
	movsd	%xmm0, -8(%rsp)
	movsd	-8(%rsp), %xmm0
	retq
.Lfunc_end2:
	.size	_ZN3std3f6421_$LT$impl$u20$f64$GT$4sqrt17h1eb2129ef042b2d1E, .Lfunc_end2-_ZN3std3f6421_$LT$impl$u20$f64$GT$4sqrt17h1eb2129ef042b2d1E
	.cfi_endproc

	.section	.text._ZN3std3sys9backtrace28__rust_begin_short_backtrace17hafa657e659eb3b9aE,"ax",@progbits
	.p2align	4
	.type	_ZN3std3sys9backtrace28__rust_begin_short_backtrace17hafa657e659eb3b9aE,@function
_ZN3std3sys9backtrace28__rust_begin_short_backtrace17hafa657e659eb3b9aE:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_ZN4core3ops8function6FnOnce9call_once17h4867892155c980b0E
	#APP
	#NO_APP
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	_ZN3std3sys9backtrace28__rust_begin_short_backtrace17hafa657e659eb3b9aE, .Lfunc_end3-_ZN3std3sys9backtrace28__rust_begin_short_backtrace17hafa657e659eb3b9aE
	.cfi_endproc

	.section	".text._ZN47_$LT$u32$u20$as$u20$core..iter..range..Step$GT$17forward_unchecked17h828fb668a8f08599E","ax",@progbits
	.p2align	4
	.type	_ZN47_$LT$u32$u20$as$u20$core..iter..range..Step$GT$17forward_unchecked17h828fb668a8f08599E,@function
_ZN47_$LT$u32$u20$as$u20$core..iter..range..Step$GT$17forward_unchecked17h828fb668a8f08599E:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%edi, (%rsp)
	movl	%esi, %eax
	movl	%eax, 4(%rsp)
	movl	4(%rsp), %esi
	movl	(%rsp), %edi
	leaq	.Lanon.71cc8978aafdad452e4de9b14db389e9.2(%rip), %rdx
	callq	_ZN4core3num21_$LT$impl$u20$u32$GT$13unchecked_add18precondition_check17hfc673e942adf8c90E
	movl	4(%rsp), %ecx
	movl	(%rsp), %eax
	addl	%ecx, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end4:
	.size	_ZN47_$LT$u32$u20$as$u20$core..iter..range..Step$GT$17forward_unchecked17h828fb668a8f08599E, .Lfunc_end4-_ZN47_$LT$u32$u20$as$u20$core..iter..range..Step$GT$17forward_unchecked17h828fb668a8f08599E
	.cfi_endproc

	.section	.text._ZN4core3fmt2rt8Argument11new_display17h0aed3dfa9476b759E,"ax",@progbits
	.p2align	4
	.type	_ZN4core3fmt2rt8Argument11new_display17h0aed3dfa9476b759E,@function
_ZN4core3fmt2rt8Argument11new_display17h0aed3dfa9476b759E:
	.cfi_startproc
	movq	%rdi, %rax
	movq	%rsi, -16(%rsp)
	movq	_RNvXs9_NtNtNtCs27Vx93FoQ6z_4core3fmt3num3implNtB9_7Display3fmt@GOTPCREL(%rip), %rcx
	movq	%rcx, -8(%rsp)
	movq	-16(%rsp), %rcx
	movq	%rcx, (%rdi)
	movq	-8(%rsp), %rcx
	movq	%rcx, 8(%rdi)
	retq
.Lfunc_end5:
	.size	_ZN4core3fmt2rt8Argument11new_display17h0aed3dfa9476b759E, .Lfunc_end5-_ZN4core3fmt2rt8Argument11new_display17h0aed3dfa9476b759E
	.cfi_endproc

	.section	.text._ZN4core3fmt9Arguments3new17h3339d04ed7bed49bE,"ax",@progbits
	.p2align	4
	.type	_ZN4core3fmt9Arguments3new17h3339d04ed7bed49bE,@function
_ZN4core3fmt9Arguments3new17h3339d04ed7bed49bE:
	.cfi_startproc
	movq	%rsi, %rdx
	movq	%rdi, %rax
	retq
.Lfunc_end6:
	.size	_ZN4core3fmt9Arguments3new17h3339d04ed7bed49bE, .Lfunc_end6-_ZN4core3fmt9Arguments3new17h3339d04ed7bed49bE
	.cfi_endproc

	.section	".text._ZN4core3num21_$LT$impl$u20$u32$GT$13unchecked_add18precondition_check17hfc673e942adf8c90E","ax",@progbits
	.p2align	4
	.type	_ZN4core3num21_$LT$impl$u20$u32$GT$13unchecked_add18precondition_check17hfc673e942adf8c90E,@function
_ZN4core3num21_$LT$impl$u20$u32$GT$13unchecked_add18precondition_check17hfc673e942adf8c90E:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%edi, %eax
	movq	%rdx, (%rsp)
	movl	%eax, %edi
	addl	%esi, %edi
	cmpl	%eax, %edi
	jb	.LBB7_2
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.LBB7_2:
	.cfi_def_cfa_offset 16
	movq	(%rsp), %rcx
	leaq	.Lanon.71cc8978aafdad452e4de9b14db389e9.3(%rip), %rdi
	movl	$369, %esi
	xorl	%edx, %edx
	callq	*_RNvNtCs27Vx93FoQ6z_4core9panicking18panic_nounwind_fmt@GOTPCREL(%rip)
.Lfunc_end7:
	.size	_ZN4core3num21_$LT$impl$u20$u32$GT$13unchecked_add18precondition_check17hfc673e942adf8c90E, .Lfunc_end7-_ZN4core3num21_$LT$impl$u20$u32$GT$13unchecked_add18precondition_check17hfc673e942adf8c90E
	.cfi_endproc

	.section	".text._ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h601a936d8304b915E","ax",@progbits
	.p2align	4
	.type	_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h601a936d8304b915E,@function
_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h601a936d8304b915E:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	(%rdi), %rdi
	callq	_ZN4core3ops8function6FnOnce9call_once17h13a4f7fbda08a6c5E
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end8:
	.size	_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h601a936d8304b915E, .Lfunc_end8-_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h601a936d8304b915E
	.cfi_endproc

	.section	.text._ZN4core3ops8function6FnOnce9call_once17h13a4f7fbda08a6c5E,"ax",@progbits
	.p2align	4
	.type	_ZN4core3ops8function6FnOnce9call_once17h13a4f7fbda08a6c5E,@function
_ZN4core3ops8function6FnOnce9call_once17h13a4f7fbda08a6c5E:
.Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, DW.ref.rust_eh_personality
	.cfi_lsda 27, .Lexception0
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, 8(%rsp)
.Ltmp0:
	leaq	8(%rsp), %rdi
	callq	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he6dd0c326092176dE
.Ltmp1:
	movl	%eax, 4(%rsp)
	jmp	.LBB9_3
.LBB9_1:
	movq	24(%rsp), %rdi
	callq	_Unwind_Resume@PLT
.LBB9_2:
.Ltmp2:
	movq	%rax, %rcx
	movl	%edx, %eax
	movq	%rcx, 24(%rsp)
	movl	%eax, 32(%rsp)
	jmp	.LBB9_1
.LBB9_3:
	movl	4(%rsp), %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end9:
	.size	_ZN4core3ops8function6FnOnce9call_once17h13a4f7fbda08a6c5E, .Lfunc_end9-_ZN4core3ops8function6FnOnce9call_once17h13a4f7fbda08a6c5E
	.cfi_endproc
	.section	.gcc_except_table._ZN4core3ops8function6FnOnce9call_once17h13a4f7fbda08a6c5E,"a",@progbits
	.p2align	2, 0x0
GCC_except_table9:
.Lexception0:
	.byte	255
	.byte	255
	.byte	1
	.uleb128 .Lcst_end0-.Lcst_begin0
.Lcst_begin0:
	.uleb128 .Ltmp0-.Lfunc_begin0
	.uleb128 .Ltmp1-.Ltmp0
	.uleb128 .Ltmp2-.Lfunc_begin0
	.byte	0
	.uleb128 .Ltmp1-.Lfunc_begin0
	.uleb128 .Lfunc_end9-.Ltmp1
	.byte	0
	.byte	0
.Lcst_end0:
	.p2align	2, 0x0

	.section	.text._ZN4core3ops8function6FnOnce9call_once17h4867892155c980b0E,"ax",@progbits
	.p2align	4
	.type	_ZN4core3ops8function6FnOnce9call_once17h4867892155c980b0E,@function
_ZN4core3ops8function6FnOnce9call_once17h4867892155c980b0E:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	*%rdi
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end10:
	.size	_ZN4core3ops8function6FnOnce9call_once17h4867892155c980b0E, .Lfunc_end10-_ZN4core3ops8function6FnOnce9call_once17h4867892155c980b0E
	.cfi_endproc

	.section	".text._ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9c699b5bbf74a956E","ax",@progbits
	.p2align	4
	.type	_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9c699b5bbf74a956E,@function
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9c699b5bbf74a956E:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$9spec_next17h035e6ca0a5968a8dE
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end11:
	.size	_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9c699b5bbf74a956E, .Lfunc_end11-_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9c699b5bbf74a956E
	.cfi_endproc

	.section	.text._ZN4main4main17h2dd6e7c25b480450E,"ax",@progbits
	.hidden	_ZN4main4main17h2dd6e7c25b480450E
	.globl	_ZN4main4main17h2dd6e7c25b480450E
	.p2align	4
	.type	_ZN4main4main17h2dd6e7c25b480450E,@function
_ZN4main4main17h2dd6e7c25b480450E:
	.cfi_startproc
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movl	$0, 4(%rsp)
	movl	$1, %edi
	movl	$2000000, %esi
	callq	_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h783665c7bffb64e8E
	movl	%eax, 8(%rsp)
	movl	%edx, 12(%rsp)
.LBB12_1:
	leaq	8(%rsp), %rdi
	callq	_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9c699b5bbf74a956E
	movl	%eax, 16(%rsp)
	movl	%edx, 20(%rsp)
	movl	16(%rsp), %eax
	testq	$1, %rax
	je	.LBB12_3
	movl	20(%rsp), %edi
	callq	_ZN4main8is_prime17he0110dc9aa106f73E
	testb	$1, %al
	jne	.LBB12_4
	jmp	.LBB12_1
.LBB12_3:
	leaq	40(%rsp), %rdi
	leaq	4(%rsp), %rsi
	callq	_ZN4core3fmt2rt8Argument11new_display17h0aed3dfa9476b759E
	movq	40(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	48(%rsp), %rax
	movq	%rax, 32(%rsp)
	leaq	.Lanon.71cc8978aafdad452e4de9b14db389e9.4(%rip), %rdi
	leaq	24(%rsp), %rsi
	callq	_ZN4core3fmt9Arguments3new17h3339d04ed7bed49bE
	movq	%rax, %rdi
	movq	%rdx, %rsi
	callq	*_RNvNtNtCs75vJTIYSa2J_3std2io5stdio6__print@GOTPCREL(%rip)
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB12_4:
	.cfi_def_cfa_offset 64
	movl	4(%rsp), %eax
	incl	%eax
	movl	%eax, (%rsp)
	seto	%al
	jo	.LBB12_6
	movl	(%rsp), %eax
	movl	%eax, 4(%rsp)
	jmp	.LBB12_1
.LBB12_6:
	leaq	.Lanon.71cc8978aafdad452e4de9b14db389e9.6(%rip), %rdi
	callq	*_RNvNtNtCs27Vx93FoQ6z_4core9panicking11panic_const24panic_const_add_overflow@GOTPCREL(%rip)
.Lfunc_end12:
	.size	_ZN4main4main17h2dd6e7c25b480450E, .Lfunc_end12-_ZN4main4main17h2dd6e7c25b480450E
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI13_0:
	.quad	0x41efffffffe00000
	.section	.text._ZN4main8is_prime17he0110dc9aa106f73E,"ax",@progbits
	.p2align	4
	.type	_ZN4main8is_prime17he0110dc9aa106f73E,@function
_ZN4main8is_prime17he0110dc9aa106f73E:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	%edi, 12(%rsp)
	cmpl	$1, %edi
	jbe	.LBB13_2
	movl	12(%rsp), %eax
	movl	%eax, %eax
	cvtsi2sd	%rax, %xmm0
	callq	_ZN3std3f6421_$LT$impl$u20$f64$GT$4sqrt17h1eb2129ef042b2d1E
	xorps	%xmm1, %xmm1
	maxsd	%xmm0, %xmm1
	movsd	.LCPI13_0(%rip), %xmm0
	minsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %rax
	movl	%eax, 8(%rsp)
	movl	$2, 20(%rsp)
	jmp	.LBB13_3
.LBB13_2:
	movb	$0, 19(%rsp)
	jmp	.LBB13_6
.LBB13_3:
	movl	8(%rsp), %eax
	cmpl	%eax, 20(%rsp)
	jbe	.LBB13_5
	movb	$1, 19(%rsp)
	jmp	.LBB13_6
.LBB13_5:
	movl	20(%rsp), %eax
	movl	%eax, 4(%rsp)
	cmpl	$0, %eax
	je	.LBB13_8
	jmp	.LBB13_7
.LBB13_6:
	movb	19(%rsp), %al
	andb	$1, %al
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB13_7:
	.cfi_def_cfa_offset 32
	movl	4(%rsp), %ecx
	movl	12(%rsp), %eax
	xorl	%edx, %edx
	divl	%ecx
	cmpl	$0, %edx
	je	.LBB13_10
	jmp	.LBB13_9
.LBB13_8:
	leaq	.Lanon.71cc8978aafdad452e4de9b14db389e9.7(%rip), %rdi
	callq	*_RNvNtNtCs27Vx93FoQ6z_4core9panicking11panic_const23panic_const_rem_by_zero@GOTPCREL(%rip)
.LBB13_9:
	movl	20(%rsp), %ecx
	movl	%ecx, %eax
	addl	$1, %eax
	movl	%eax, (%rsp)
	cmpl	%ecx, %eax
	jb	.LBB13_12
	jmp	.LBB13_11
.LBB13_10:
	movb	$0, 19(%rsp)
	jmp	.LBB13_6
.LBB13_11:
	movl	(%rsp), %eax
	movl	%eax, 20(%rsp)
	jmp	.LBB13_3
.LBB13_12:
	leaq	.Lanon.71cc8978aafdad452e4de9b14db389e9.8(%rip), %rdi
	callq	*_RNvNtNtCs27Vx93FoQ6z_4core9panicking11panic_const24panic_const_add_overflow@GOTPCREL(%rip)
.Lfunc_end13:
	.size	_ZN4main8is_prime17he0110dc9aa106f73E, .Lfunc_end13-_ZN4main8is_prime17he0110dc9aa106f73E
	.cfi_endproc

	.section	".text._ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17ha4d85548ea4ef648E","ax",@progbits
	.p2align	4
	.type	_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17ha4d85548ea4ef648E,@function
_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17ha4d85548ea4ef648E:
	.cfi_startproc
	xorl	%eax, %eax
	retq
.Lfunc_end14:
	.size	_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17ha4d85548ea4ef648E, .Lfunc_end14-_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17ha4d85548ea4ef648E
	.cfi_endproc

	.section	".text._ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h783665c7bffb64e8E","ax",@progbits
	.p2align	4
	.type	_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h783665c7bffb64e8E,@function
_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h783665c7bffb64e8E:
	.cfi_startproc
	movl	%esi, %edx
	movl	%edi, %eax
	retq
.Lfunc_end15:
	.size	_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h783665c7bffb64e8E, .Lfunc_end15-_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h783665c7bffb64e8E
	.cfi_endproc

	.section	".text._ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$9spec_next17h035e6ca0a5968a8dE","ax",@progbits
	.p2align	4
	.type	_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$9spec_next17h035e6ca0a5968a8dE,@function
_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$9spec_next17h035e6ca0a5968a8dE:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movl	(%rdi), %eax
	cmpl	4(%rdi), %eax
	jb	.LBB16_2
	movl	$0, 16(%rsp)
	jmp	.LBB16_3
.LBB16_2:
	movq	8(%rsp), %rax
	movl	(%rax), %edi
	movl	%edi, 4(%rsp)
	movl	$1, %esi
	callq	_ZN47_$LT$u32$u20$as$u20$core..iter..range..Step$GT$17forward_unchecked17h828fb668a8f08599E
	movq	8(%rsp), %rcx
	movl	%eax, %edx
	movl	4(%rsp), %eax
	movl	%edx, (%rcx)
	movl	%eax, 20(%rsp)
	movl	$1, 16(%rsp)
.LBB16_3:
	movl	16(%rsp), %eax
	movl	20(%rsp), %edx
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end16:
	.size	_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$9spec_next17h035e6ca0a5968a8dE, .Lfunc_end16-_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$9spec_next17h035e6ca0a5968a8dE
	.cfi_endproc

	.section	.text.main,"ax",@progbits
	.globl	main
	.p2align	4
	.type	main,@function
main:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rsi, %rdx
	movslq	%edi, %rsi
	leaq	_ZN4main4main17h2dd6e7c25b480450E(%rip), %rdi
	xorl	%ecx, %ecx
	callq	_ZN3std2rt10lang_start17h37ec48243b8dd23aE
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end17:
	.size	main, .Lfunc_end17-main
	.cfi_endproc

	.type	.Lanon.71cc8978aafdad452e4de9b14db389e9.0,@object
	.section	.data.rel.ro..Lanon.71cc8978aafdad452e4de9b14db389e9.0,"aw",@progbits
	.p2align	3, 0x0
.Lanon.71cc8978aafdad452e4de9b14db389e9.0:
	.asciz	"\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\b\000\000\000\000\000\000"
	.quad	_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h601a936d8304b915E
	.quad	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he6dd0c326092176dE
	.quad	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he6dd0c326092176dE
	.size	.Lanon.71cc8978aafdad452e4de9b14db389e9.0, 48

	.type	.Lanon.71cc8978aafdad452e4de9b14db389e9.1,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lanon.71cc8978aafdad452e4de9b14db389e9.1:
	.asciz	"/home/alek/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/iter/range.rs"
	.size	.Lanon.71cc8978aafdad452e4de9b14db389e9.1, 114

	.type	.Lanon.71cc8978aafdad452e4de9b14db389e9.2,@object
	.section	.data.rel.ro..Lanon.71cc8978aafdad452e4de9b14db389e9.2,"aw",@progbits
	.p2align	3, 0x0
.Lanon.71cc8978aafdad452e4de9b14db389e9.2:
	.quad	.Lanon.71cc8978aafdad452e4de9b14db389e9.1
	.asciz	"q\000\000\000\000\000\000\000\266\001\000\000\001\000\000"
	.size	.Lanon.71cc8978aafdad452e4de9b14db389e9.2, 24

	.type	.Lanon.71cc8978aafdad452e4de9b14db389e9.3,@object
	.section	.rodata..Lanon.71cc8978aafdad452e4de9b14db389e9.3,"a",@progbits
.Lanon.71cc8978aafdad452e4de9b14db389e9.3:
	.ascii	"unsafe precondition(s) violated: u32::unchecked_add cannot overflow\n\nThis indicates a bug in the program. This Undefined Behavior check is optional, and cannot be relied on for safety."
	.size	.Lanon.71cc8978aafdad452e4de9b14db389e9.3, 184

	.type	.Lanon.71cc8978aafdad452e4de9b14db389e9.4,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lanon.71cc8978aafdad452e4de9b14db389e9.4:
	.asciz	"\025Primes found (Rust): \300\001\n"
	.size	.Lanon.71cc8978aafdad452e4de9b14db389e9.4, 26

	.type	.Lanon.71cc8978aafdad452e4de9b14db389e9.5,@object
.Lanon.71cc8978aafdad452e4de9b14db389e9.5:
	.asciz	"../main.rs"
	.size	.Lanon.71cc8978aafdad452e4de9b14db389e9.5, 11

	.type	.Lanon.71cc8978aafdad452e4de9b14db389e9.6,@object
	.section	.data.rel.ro..Lanon.71cc8978aafdad452e4de9b14db389e9.6,"aw",@progbits
	.p2align	3, 0x0
.Lanon.71cc8978aafdad452e4de9b14db389e9.6:
	.quad	.Lanon.71cc8978aafdad452e4de9b14db389e9.5
	.asciz	"\n\000\000\000\000\000\000\000\024\000\000\000\r\000\000"
	.size	.Lanon.71cc8978aafdad452e4de9b14db389e9.6, 24

	.type	.Lanon.71cc8978aafdad452e4de9b14db389e9.7,@object
	.section	.data.rel.ro..Lanon.71cc8978aafdad452e4de9b14db389e9.7,"aw",@progbits
	.p2align	3, 0x0
.Lanon.71cc8978aafdad452e4de9b14db389e9.7:
	.quad	.Lanon.71cc8978aafdad452e4de9b14db389e9.5
	.asciz	"\n\000\000\000\000\000\000\000\b\000\000\000\f\000\000"
	.size	.Lanon.71cc8978aafdad452e4de9b14db389e9.7, 24

	.type	.Lanon.71cc8978aafdad452e4de9b14db389e9.8,@object
	.section	.data.rel.ro..Lanon.71cc8978aafdad452e4de9b14db389e9.8,"aw",@progbits
	.p2align	3, 0x0
.Lanon.71cc8978aafdad452e4de9b14db389e9.8:
	.quad	.Lanon.71cc8978aafdad452e4de9b14db389e9.5
	.asciz	"\n\000\000\000\000\000\000\000\013\000\000\000\t\000\000"
	.size	.Lanon.71cc8978aafdad452e4de9b14db389e9.8, 24

	.hidden	DW.ref.rust_eh_personality
	.weak	DW.ref.rust_eh_personality
	.section	.data.DW.ref.rust_eh_personality,"awG",@progbits,DW.ref.rust_eh_personality,comdat
	.p2align	3, 0x0
	.type	DW.ref.rust_eh_personality,@object
	.size	DW.ref.rust_eh_personality, 8
DW.ref.rust_eh_personality:
	.quad	rust_eh_personality
	.ident	"rustc version 1.96.0 (ac68faa20 2026-05-25)"
	.section	".note.GNU-stack","",@progbits
