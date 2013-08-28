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

#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#include <ux/cdefs.h>

extern int main(int argc, char *argv[]);
extern void __ux_exit(int code) __UX_PRIVATE(_exit) __UX_NORETURN;
extern void __ux_libc_init(int argc, char *argv[], char *envp[]) __UX_PRIVATE(init);

void crtbegin(int argc, char *argv[], char *envp[]) __UX_PRIVATE(crtbegin);

void
crtbegin(int argc, char *argv[], char *envp[])
{
	__ux_libc_init(argc, argv, envp);
	__ux_exit(main(argc, argv));
}
