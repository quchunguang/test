/*
 * hello.c  Hello, World! As a Kernel Module
 */

#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

/*
 * hello_init  the init function, called when the module is loaded.
 * Returns zero if successfully loaded, nonzero otherwise.
 */
static int hello_init(void)
{
	printk("<0>I bear a charmed life.0\n");
	printk("<1>I bear a charmed life.1\n");
	printk("<2>I bear a charmed life.2\n");
	printk("<3>I bear a charmed life.3\n");
	printk("<4>I bear a charmed life.4\n");
	printk("<5>I bear a charmed life.5\n");
	printk("<6>I bear a charmed life.6\n");
	printk("<7>I bear a charmed life.7\n");
	return 0;
}

/*
 * hello_exit  the exit function, called when the module is removed.
 */
static void hello_exit(void)
{
	printk(KERN_ALERT "Out, out, brief candle!\n");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Kevin Q");
