#include <linux/init.h>
#include <linux/module.h>
#include <linux/kthread.h>
#include <linux/completion.h>

MODULE_LICENSE("Dual BSD/GPL");

struct completion my_completion1;
struct completion my_completion2;


int thread_dirver(void *);
int thread_saleman(void *);

int thread_driver(void *p)
{
    printk(KERN_ALERT"DRIVER:I AM WAITING FOR SALEMAN CLOSED THE DOOR\n");
    wait_for_completion(&my_completion1);

    printk(KERN_ALERT"DRIVER:OK , LET'S GO!NOW~\n");
    printk(KERN_ALERT"DRIVER:ARRIVE THE STATION.STOPED CAR!\n");
    complete(&my_completion2);

    return 0;
}

int thread_saleman(void *p)
{
    printk(KERN_ALERT"SALEMAN:THE DOOR IS CLOSED!\n");
    complete(&my_completion1);

    printk(KERN_ALERT"SALEMAN:YOU CAN GO NOW!\n");
    wait_for_completion(&my_completion2);

    printk(KERN_ALERT"SALEMAN:OK,THE DOOR BE OPENED!\n");
    return 0;
}

static int hello_init(void)
{
    printk(KERN_ALERT"\nHello everybody~\n");
    init_completion(&my_completion1);
    init_completion(&my_completion2);

    kthread_run(thread_driver, NULL, "thread_driver");
    kthread_run(thread_saleman, NULL, "thread_saleman");

    return 0;
}

static void hello_exit(void)
{
    printk(KERN_ALERT"Goodbye everybody~\n");
}

module_init(hello_init);
module_exit(hello_exit);
MODULE_AUTHOR("CHEN");
MODULE_DESCRIPTION("A simple completion Module");
