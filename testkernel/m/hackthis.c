#include <linux/init.h>
#include <linux/module.h>

static int hackthis_init(void){
	printk(KERN_ALERT "Test: hack this, begin.");
	return 0;
}
static void hackthis_exit(void){
	printk(KERN_ALERT "Test: hack this, end.");
}
module_init(hackthis_init);
module_exit(hackthis_exit);
