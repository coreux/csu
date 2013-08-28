#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#include <ux/cdefs.h>

int
main(void)
{
	/* Purposefully arbitrary return value */
	return 23;
}

/* provide a placeholder for the _init$UX$private() routine so that we link correctly */

void libc_init(int argc, char **argv, char **envp) __UX_PRIVATE(init);

void
libc_init(int argc, char **argv, char **envp)
{
	(void) argc;
	(void) argv;
	(void) envp;
}
