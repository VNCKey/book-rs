; ModuleID = 'main.8f81e49356787d17-cgu.0'
source_filename = "main.8f81e49356787d17-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"core::fmt::rt::Argument<'_>" = type { %"core::fmt::rt::ArgumentType<'_>" }
%"core::fmt::rt::ArgumentType<'_>" = type { ptr, [1 x i64] }

@vtable.0 = private unnamed_addr constant <{ [24 x i8], ptr, ptr, ptr }> <{ [24 x i8] c"\00\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00", ptr @"_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h601a936d8304b915E", ptr @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he6dd0c326092176dE", ptr @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he6dd0c326092176dE" }>, align 8
@alloc_20b0a34e9a3dc46aa38cf86b518d58e7 = private unnamed_addr constant [114 x i8] c"/home/alek/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/iter/range.rs\00", align 1
@alloc_c09726db5b0f6676d8bed439bbf906cd = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc_20b0a34e9a3dc46aa38cf86b518d58e7, [16 x i8] c"q\00\00\00\00\00\00\00\B6\01\00\00\01\00\00\00" }>, align 8
@alloc_a6a0cc8156fe455996de64a9d05b1dfe = private unnamed_addr constant [184 x i8] c"unsafe precondition(s) violated: u32::unchecked_add cannot overflow\0A\0AThis indicates a bug in the program. This Undefined Behavior check is optional, and cannot be relied on for safety.", align 1
@alloc_50e495adb39c1dc9b1559632701f1ff6 = private unnamed_addr constant [26 x i8] c"\15Primes found (Rust): \C0\01\0A\00", align 1
@alloc_3eac727909388d1dc281b6da27c7cce4 = private unnamed_addr constant [11 x i8] c"../main.rs\00", align 1
@alloc_0a7c027983f5ed729934677852dd5ef5 = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc_3eac727909388d1dc281b6da27c7cce4, [16 x i8] c"\0A\00\00\00\00\00\00\00\14\00\00\00\0D\00\00\00" }>, align 8
@alloc_83013e3d3c7e7c1ebe30c48d33d0d0b3 = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc_3eac727909388d1dc281b6da27c7cce4, [16 x i8] c"\0A\00\00\00\00\00\00\00\08\00\00\00\0C\00\00\00" }>, align 8
@alloc_d0fb8df63304625bf96d7b11901ec664 = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc_3eac727909388d1dc281b6da27c7cce4, [16 x i8] c"\0A\00\00\00\00\00\00\00\0B\00\00\00\09\00\00\00" }>, align 8

; std::rt::lang_start
; Function Attrs: nonlazybind uwtable
define hidden i64 @_ZN3std2rt10lang_start17h37ec48243b8dd23aE(ptr %main, i64 %argc, ptr %argv, i8 %sigpipe) unnamed_addr #0 {
start:
  %_7 = alloca [8 x i8], align 8
  store ptr %main, ptr %_7, align 8
; call std::rt::lang_start_internal
  %_0 = call i64 @_RNvNtCs75vJTIYSa2J_3std2rt19lang_start_internal(ptr %_7, ptr align 8 @vtable.0, i64 %argc, ptr %argv, i8 %sigpipe)
  ret i64 %_0
}

; std::rt::lang_start::{{closure}}
; Function Attrs: inlinehint nonlazybind uwtable
define internal i32 @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he6dd0c326092176dE"(ptr align 8 %_1) unnamed_addr #1 {
start:
  %_4 = load ptr, ptr %_1, align 8
; call std::sys::backtrace::__rust_begin_short_backtrace
  call void @_ZN3std3sys9backtrace28__rust_begin_short_backtrace17hafa657e659eb3b9aE(ptr %_4) #10
; call <() as std::process::Termination>::report
  %self = call i8 @"_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17ha4d85548ea4ef648E"() #11
  %_0 = zext i8 %self to i32
  ret i32 %_0
}

; std::f64::<impl f64>::sqrt
; Function Attrs: inlinehint nonlazybind uwtable
define internal double @"_ZN3std3f6421_$LT$impl$u20$f64$GT$4sqrt17h1eb2129ef042b2d1E"(double %self) unnamed_addr #1 {
start:
  %0 = alloca [8 x i8], align 8
  %1 = call double @llvm.sqrt.f64(double %self)
  store double %1, ptr %0, align 8
  %_0 = load double, ptr %0, align 8
  ret double %_0
}

; std::sys::backtrace::__rust_begin_short_backtrace
; Function Attrs: noinline nonlazybind uwtable
define internal void @_ZN3std3sys9backtrace28__rust_begin_short_backtrace17hafa657e659eb3b9aE(ptr %f) unnamed_addr #2 {
start:
; call core::ops::function::FnOnce::call_once
  call void @_ZN4core3ops8function6FnOnce9call_once17h4867892155c980b0E(ptr %f) #11
  call void asm sideeffect "", "~{memory}"(), !srcloc !4
  ret void
}

; <u32 as core::iter::range::Step>::forward_unchecked
; Function Attrs: inlinehint nonlazybind uwtable
define internal i32 @"_ZN47_$LT$u32$u20$as$u20$core..iter..range..Step$GT$17forward_unchecked17h828fb668a8f08599E"(i32 %start1, i64 %n) unnamed_addr #1 {
start:
  %rhs = trunc i64 %n to i32
  br label %bb1

bb1:                                              ; preds = %start
; call core::num::<impl u32>::unchecked_add::precondition_check
  call void @"_ZN4core3num21_$LT$impl$u20$u32$GT$13unchecked_add18precondition_check17hfc673e942adf8c90E"(i32 %start1, i32 %rhs, ptr align 8 @alloc_c09726db5b0f6676d8bed439bbf906cd) #12
  br label %bb2

bb2:                                              ; preds = %bb1
  %_0 = add nuw i32 %start1, %rhs
  ret i32 %_0
}

; core::fmt::rt::Argument::new_display
; Function Attrs: inlinehint nonlazybind uwtable
define internal void @_ZN4core3fmt2rt8Argument11new_display17h0aed3dfa9476b759E(ptr sret([16 x i8]) align 8 %_0, ptr align 4 %x) unnamed_addr #1 {
start:
  %_2 = alloca [16 x i8], align 8
  store ptr %x, ptr %_2, align 8
  %0 = getelementptr inbounds i8, ptr %_2, i64 8
  store ptr @_RNvXs9_NtNtNtCs27Vx93FoQ6z_4core3fmt3num3implNtB9_7Display3fmt, ptr %0, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_0, ptr align 8 %_2, i64 16, i1 false)
  ret void
}

; core::fmt::Arguments::new
; Function Attrs: inlinehint nonlazybind uwtable
define internal { ptr, ptr } @_ZN4core3fmt9Arguments3new17h3339d04ed7bed49bE(ptr %template, ptr align 8 %args) unnamed_addr #1 {
start:
  %0 = insertvalue { ptr, ptr } poison, ptr %template, 0
  %1 = insertvalue { ptr, ptr } %0, ptr %args, 1
  ret { ptr, ptr } %1
}

; core::num::<impl u32>::unchecked_add::precondition_check
; Function Attrs: inlinehint nounwind nonlazybind uwtable
define internal void @"_ZN4core3num21_$LT$impl$u20$u32$GT$13unchecked_add18precondition_check17hfc673e942adf8c90E"(i32 %lhs, i32 %rhs, ptr align 8 %0) unnamed_addr #3 {
start:
  %_4.0 = add i32 %lhs, %rhs
  %_4.1 = icmp ult i32 %_4.0, %lhs
  br i1 %_4.1, label %bb1, label %bb2

bb2:                                              ; preds = %start
  ret void

bb1:                                              ; preds = %start
; call core::panicking::panic_nounwind_fmt
  call void @_RNvNtCs27Vx93FoQ6z_4core9panicking18panic_nounwind_fmt(ptr @alloc_a6a0cc8156fe455996de64a9d05b1dfe, ptr inttoptr (i64 369 to ptr), i1 zeroext false, ptr align 8 %0) #13
  unreachable
}

; core::ops::function::FnOnce::call_once{{vtable.shim}}
; Function Attrs: inlinehint nonlazybind uwtable
define internal i32 @"_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h601a936d8304b915E"(ptr %_1) unnamed_addr #1 {
start:
  %_2 = alloca [0 x i8], align 1
  %0 = load ptr, ptr %_1, align 8
; call core::ops::function::FnOnce::call_once
  %_0 = call i32 @_ZN4core3ops8function6FnOnce9call_once17h13a4f7fbda08a6c5E(ptr %0) #11
  ret i32 %_0
}

; core::ops::function::FnOnce::call_once
; Function Attrs: inlinehint nonlazybind uwtable
define internal i32 @_ZN4core3ops8function6FnOnce9call_once17h13a4f7fbda08a6c5E(ptr %0) unnamed_addr #1 personality ptr @rust_eh_personality {
start:
  %1 = alloca [16 x i8], align 8
  %_2 = alloca [0 x i8], align 1
  %_1 = alloca [8 x i8], align 8
  store ptr %0, ptr %_1, align 8
; invoke std::rt::lang_start::{{closure}}
  %_0 = invoke i32 @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17he6dd0c326092176dE"(ptr align 8 %_1)
          to label %bb1 unwind label %cleanup

bb3:                                              ; preds = %cleanup
  %2 = load ptr, ptr %1, align 8
  %3 = getelementptr inbounds i8, ptr %1, i64 8
  %4 = load i32, ptr %3, align 8
  %5 = insertvalue { ptr, i32 } poison, ptr %2, 0
  %6 = insertvalue { ptr, i32 } %5, i32 %4, 1
  resume { ptr, i32 } %6

cleanup:                                          ; preds = %start
  %7 = landingpad { ptr, i32 }
          cleanup
  %8 = extractvalue { ptr, i32 } %7, 0
  %9 = extractvalue { ptr, i32 } %7, 1
  store ptr %8, ptr %1, align 8
  %10 = getelementptr inbounds i8, ptr %1, i64 8
  store i32 %9, ptr %10, align 8
  br label %bb3

bb1:                                              ; preds = %start
  ret i32 %_0
}

; core::ops::function::FnOnce::call_once
; Function Attrs: inlinehint nonlazybind uwtable
define internal void @_ZN4core3ops8function6FnOnce9call_once17h4867892155c980b0E(ptr %_1) unnamed_addr #1 {
start:
  %_2 = alloca [0 x i8], align 1
  call void %_1()
  ret void
}

; core::iter::range::<impl core::iter::traits::iterator::Iterator for core::ops::range::Range<A>>::next
; Function Attrs: inlinehint nonlazybind uwtable
define internal { i32, i32 } @"_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9c699b5bbf74a956E"(ptr align 4 %self) unnamed_addr #1 {
start:
; call <core::ops::range::Range<T> as core::iter::range::RangeIteratorImpl>::spec_next
  %0 = call { i32, i32 } @"_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$9spec_next17h035e6ca0a5968a8dE"(ptr align 4 %self) #11
  %_0.0 = extractvalue { i32, i32 } %0, 0
  %_0.1 = extractvalue { i32, i32 } %0, 1
  %1 = insertvalue { i32, i32 } poison, i32 %_0.0, 0
  %2 = insertvalue { i32, i32 } %1, i32 %_0.1, 1
  ret { i32, i32 } %2
}

; main::main
; Function Attrs: nonlazybind uwtable
define hidden void @_ZN4main4main17h2dd6e7c25b480450E() unnamed_addr #0 {
start:
  %_16 = alloca [16 x i8], align 8
  %args = alloca [16 x i8], align 8
  %_5 = alloca [8 x i8], align 4
  %iter = alloca [8 x i8], align 4
  %count = alloca [4 x i8], align 4
  store i32 0, ptr %count, align 4
; call <I as core::iter::traits::collect::IntoIterator>::into_iter
  %0 = call { i32, i32 } @"_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h783665c7bffb64e8E"(i32 1, i32 2000000) #11
  %_2.0 = extractvalue { i32, i32 } %0, 0
  %_2.1 = extractvalue { i32, i32 } %0, 1
  store i32 %_2.0, ptr %iter, align 4
  %1 = getelementptr inbounds i8, ptr %iter, i64 4
  store i32 %_2.1, ptr %1, align 4
  br label %bb2

bb2:                                              ; preds = %bb9, %bb5, %start
; call core::iter::range::<impl core::iter::traits::iterator::Iterator for core::ops::range::Range<A>>::next
  %2 = call { i32, i32 } @"_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9c699b5bbf74a956E"(ptr align 4 %iter) #11
  %3 = extractvalue { i32, i32 } %2, 0
  %4 = extractvalue { i32, i32 } %2, 1
  store i32 %3, ptr %_5, align 4
  %5 = getelementptr inbounds i8, ptr %_5, i64 4
  store i32 %4, ptr %5, align 4
  %6 = load i32, ptr %_5, align 4
  %7 = getelementptr inbounds i8, ptr %_5, i64 4
  %8 = load i32, ptr %7, align 4
  %_7 = zext i32 %6 to i64
  %9 = trunc nuw i64 %_7 to i1
  br i1 %9, label %bb5, label %bb6

bb5:                                              ; preds = %bb2
  %10 = getelementptr inbounds i8, ptr %_5, i64 4
  %i = load i32, ptr %10, align 4
; call main::is_prime
  %_9 = call zeroext i1 @_ZN4main8is_prime17he0110dc9aa106f73E(i32 %i)
  br i1 %_9, label %bb8, label %bb2

bb6:                                              ; preds = %bb2
; call core::fmt::rt::Argument::new_display
  call void @_ZN4core3fmt2rt8Argument11new_display17h0aed3dfa9476b759E(ptr sret([16 x i8]) align 8 %_16, ptr align 4 %count) #11
  %11 = getelementptr inbounds nuw %"core::fmt::rt::Argument<'_>", ptr %args, i64 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %11, ptr align 8 %_16, i64 16, i1 false)
; call core::fmt::Arguments::new
  %12 = call { ptr, ptr } @_ZN4core3fmt9Arguments3new17h3339d04ed7bed49bE(ptr @alloc_50e495adb39c1dc9b1559632701f1ff6, ptr align 8 %args) #11
  %_12.0 = extractvalue { ptr, ptr } %12, 0
  %_12.1 = extractvalue { ptr, ptr } %12, 1
; call std::io::stdio::_print
  call void @_RNvNtNtCs75vJTIYSa2J_3std2io5stdio6__print(ptr %_12.0, ptr %_12.1)
  ret void

bb8:                                              ; preds = %bb5
  %13 = load i32, ptr %count, align 4
  %14 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %13, i32 1)
  %_10.0 = extractvalue { i32, i1 } %14, 0
  %_10.1 = extractvalue { i32, i1 } %14, 1
  br i1 %_10.1, label %panic, label %bb9

bb9:                                              ; preds = %bb8
  store i32 %_10.0, ptr %count, align 4
  br label %bb2

panic:                                            ; preds = %bb8
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_RNvNtNtCs27Vx93FoQ6z_4core9panicking11panic_const24panic_const_add_overflow(ptr align 8 @alloc_0a7c027983f5ed729934677852dd5ef5) #14
  unreachable

bb4:                                              ; No predecessors!
  unreachable
}

; main::is_prime
; Function Attrs: nonlazybind uwtable
define internal zeroext i1 @_ZN4main8is_prime17he0110dc9aa106f73E(i32 %n) unnamed_addr #0 {
start:
  %i = alloca [4 x i8], align 4
  %_0 = alloca [1 x i8], align 1
  %_2 = icmp ule i32 %n, 1
  br i1 %_2, label %bb1, label %bb2

bb2:                                              ; preds = %start
  %_5 = uitofp i32 %n to double
; call std::f64::<impl f64>::sqrt
  %_4 = call double @"_ZN3std3f6421_$LT$impl$u20$f64$GT$4sqrt17h1eb2129ef042b2d1E"(double %_5) #11
  %limit = call i32 @llvm.fptoui.sat.i32.f64(double %_4)
  store i32 2, ptr %i, align 4
  br label %bb4

bb1:                                              ; preds = %start
  store i8 0, ptr %_0, align 1
  br label %bb11

bb4:                                              ; preds = %bb9, %bb2
  %_8 = load i32, ptr %i, align 4
  %_7 = icmp ule i32 %_8, %limit
  br i1 %_7, label %bb5, label %bb10

bb10:                                             ; preds = %bb4
  store i8 1, ptr %_0, align 1
  br label %bb11

bb5:                                              ; preds = %bb4
  %_11 = load i32, ptr %i, align 4
  %_12 = icmp eq i32 %_11, 0
  br i1 %_12, label %panic, label %bb6

bb11:                                             ; preds = %bb1, %bb7, %bb10
  %0 = load i8, ptr %_0, align 1
  %1 = trunc nuw i8 %0 to i1
  ret i1 %1

bb6:                                              ; preds = %bb5
  %_10 = urem i32 %n, %_11
  %_9 = icmp eq i32 %_10, 0
  br i1 %_9, label %bb7, label %bb8

panic:                                            ; preds = %bb5
; call core::panicking::panic_const::panic_const_rem_by_zero
  call void @_RNvNtNtCs27Vx93FoQ6z_4core9panicking11panic_const23panic_const_rem_by_zero(ptr align 8 @alloc_83013e3d3c7e7c1ebe30c48d33d0d0b3) #14
  unreachable

bb8:                                              ; preds = %bb6
  %2 = load i32, ptr %i, align 4
  %_13.0 = add i32 %2, 1
  %_13.1 = icmp ult i32 %_13.0, %2
  br i1 %_13.1, label %panic1, label %bb9

bb7:                                              ; preds = %bb6
  store i8 0, ptr %_0, align 1
  br label %bb11

bb9:                                              ; preds = %bb8
  store i32 %_13.0, ptr %i, align 4
  br label %bb4

panic1:                                           ; preds = %bb8
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_RNvNtNtCs27Vx93FoQ6z_4core9panicking11panic_const24panic_const_add_overflow(ptr align 8 @alloc_d0fb8df63304625bf96d7b11901ec664) #14
  unreachable
}

; <() as std::process::Termination>::report
; Function Attrs: inlinehint nonlazybind uwtable
define internal i8 @"_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17ha4d85548ea4ef648E"() unnamed_addr #1 {
start:
  ret i8 0
}

; <I as core::iter::traits::collect::IntoIterator>::into_iter
; Function Attrs: inlinehint nonlazybind uwtable
define internal { i32, i32 } @"_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h783665c7bffb64e8E"(i32 %self.0, i32 %self.1) unnamed_addr #1 {
start:
  %0 = insertvalue { i32, i32 } poison, i32 %self.0, 0
  %1 = insertvalue { i32, i32 } %0, i32 %self.1, 1
  ret { i32, i32 } %1
}

; <core::ops::range::Range<T> as core::iter::range::RangeIteratorImpl>::spec_next
; Function Attrs: inlinehint nonlazybind uwtable
define internal { i32, i32 } @"_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$9spec_next17h035e6ca0a5968a8dE"(ptr align 4 %self) unnamed_addr #1 {
start:
  %_0 = alloca [8 x i8], align 4
  %_4 = getelementptr inbounds i8, ptr %self, i64 4
  %_3.i = load i32, ptr %self, align 4
  %_4.i = load i32, ptr %_4, align 4
  %_0.i = icmp ult i32 %_3.i, %_4.i
  br i1 %_0.i, label %bb2, label %bb4

bb4:                                              ; preds = %start
  store i32 0, ptr %_0, align 4
  br label %bb5

bb2:                                              ; preds = %start
  %old = load i32, ptr %self, align 4
; call <u32 as core::iter::range::Step>::forward_unchecked
  %_6 = call i32 @"_ZN47_$LT$u32$u20$as$u20$core..iter..range..Step$GT$17forward_unchecked17h828fb668a8f08599E"(i32 %old, i64 1) #11
  store i32 %_6, ptr %self, align 4
  %0 = getelementptr inbounds i8, ptr %_0, i64 4
  store i32 %old, ptr %0, align 4
  store i32 1, ptr %_0, align 4
  br label %bb5

bb5:                                              ; preds = %bb2, %bb4
  %1 = load i32, ptr %_0, align 4
  %2 = getelementptr inbounds i8, ptr %_0, i64 4
  %3 = load i32, ptr %2, align 4
  %4 = insertvalue { i32, i32 } poison, i32 %1, 0
  %5 = insertvalue { i32, i32 } %4, i32 %3, 1
  ret { i32, i32 } %5
}

; std::rt::lang_start_internal
; Function Attrs: nonlazybind uwtable
declare i64 @_RNvNtCs75vJTIYSa2J_3std2rt19lang_start_internal(ptr, ptr align 8, i64, ptr, i8) unnamed_addr #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.sqrt.f64(double) #4

; <i32 as core::fmt::Display>::fmt
; Function Attrs: nonlazybind uwtable
declare zeroext i1 @_RNvXs9_NtNtNtCs27Vx93FoQ6z_4core3fmt3num3implNtB9_7Display3fmt(ptr align 4, ptr align 8) unnamed_addr #0

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #5

; core::panicking::panic_nounwind_fmt
; Function Attrs: cold noinline noreturn nounwind nonlazybind uwtable
declare void @_RNvNtCs27Vx93FoQ6z_4core9panicking18panic_nounwind_fmt(ptr, ptr, i1 zeroext, ptr align 8) unnamed_addr #6

; Function Attrs: nounwind nonlazybind uwtable
declare i32 @rust_eh_personality(i32, i32, i64, ptr, ptr) unnamed_addr #7

; std::io::stdio::_print
; Function Attrs: nonlazybind uwtable
declare void @_RNvNtNtCs75vJTIYSa2J_3std2io5stdio6__print(ptr, ptr) unnamed_addr #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #4

; core::panicking::panic_const::panic_const_add_overflow
; Function Attrs: cold noinline noreturn nonlazybind uwtable
declare void @_RNvNtNtCs27Vx93FoQ6z_4core9panicking11panic_const24panic_const_add_overflow(ptr align 8) unnamed_addr #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fptoui.sat.i32.f64(double) #4

; core::panicking::panic_const::panic_const_rem_by_zero
; Function Attrs: cold noinline noreturn nonlazybind uwtable
declare void @_RNvNtNtCs27Vx93FoQ6z_4core9panicking11panic_const23panic_const_rem_by_zero(ptr align 8) unnamed_addr #8

; Function Attrs: nonlazybind
define i32 @main(i32 %0, ptr %1) unnamed_addr #9 {
top:
  %2 = sext i32 %0 to i64
; call std::rt::lang_start
  %3 = call i64 @_ZN3std2rt10lang_start17h37ec48243b8dd23aE(ptr @_ZN4main4main17h2dd6e7c25b480450E, i64 %2, ptr %1, i8 0)
  %4 = trunc i64 %3 to i32
  ret i32 %4
}

attributes #0 = { nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #1 = { inlinehint nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #2 = { noinline nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #3 = { inlinehint nounwind nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #4 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { cold noinline noreturn nounwind nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #7 = { nounwind nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #8 = { cold noinline noreturn nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #9 = { nonlazybind "target-cpu"="x86-64" }
attributes #10 = { noinline }
attributes #11 = { inlinehint }
attributes #12 = { inlinehint nounwind }
attributes #13 = { noinline noreturn nounwind }
attributes #14 = { noinline noreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = !{i32 2, !"RtLibUseGOT", i32 1}
!3 = !{!"rustc version 1.96.0 (ac68faa20 2026-05-25)"}
!4 = !{i64 12722264364364466}
