/*
 * Copyright 2013 Mo McRoberts.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

	.text
	.globl start
	.align 2
start:
	/* keep debuggers happy */
	pushq $0
	/* get the stack pointer */
	movq %rsp, %rbp
	/* ensure SP is aligned properly for calling C */
	and $0xfffffffffffffff0, %rsp
	/* as per libunistd/../p_syscalls.h
	     parameters are in %rdi, %rsi, %rdx, %r10, %r8 and %r9 */
	/* argc => %rdi */
	movq 8(%rbp), %rdi
	/* argv => %rdi */
	leaq 16(%rbp), %rsi
	/* copy value of argc into dx */
	movl %edi, %edx
	/* increment dx to account for null */
	incl %edx
	/* dx <<= 3 (shift left by pointer size) */
	sall $3, %edx
	/* dx += argv (=> envp) */
	addq %rsi, %rdx
	/* call the C-language entrypoint */
	call _crtbegin$UX$private
	/* if this is reached, all bets are off */
	hlt

/* provide a failsafe _exit() syscall which crtbegin can use */
	.globl __exit$UX$private
__exit$UX$private:
	movl $ 0x2000001, %eax
	syscall
	hlt
