#include <linux/init.h>
#include <linux/module.h>
#include <linux/sched.h>
#include <linux/semaphore.h>

MODULE_LICENSE("Dual BSD/GPL");

struct semaphore sem_producer; 	/*"生?需求?",在?品没有被消?的?候不能再?行生?*/
struct semaphore sem_consumer; 	/*"消??"，在有?品的?候(可以?得??)才可以消?*/
char product[10]; 		/*"?品"存放地*/
int exit_flags; 	  	/*生?????志*/
int producer(void *product); 	/*生?者*/
int consumer(void *product); 	/*消?者*/

static int procon_init(void)
{
    printk(KERN_INFO"show producer and consumer\n");
    init_MUTEX(&sem_producer); 	/*??"生?需求?"，并且准?生?*/
    init_MUTEX_LOCKED(&sem_consumer); 			/*??"消??"，但不可消?*/
    exit_flags=0; 		/*生??可以?工*/
    kernel_thread(consumer,product,CLONE_KERNEL); 	/*??消?者*/
    kernel_thread(producer,product,CLONE_KERNEL); 	/*??生?者*/
    return 0;
}
static void procon_exit(void)
{
    printk(KERN_INFO"exit producer and consumer\n");
}
/*
* 生?者，??生?十个?品
*/
int producer(void *p)
{
    char *product=(char *)p;
    int i;
    for(i=0;i<10;i++) { 	/*?共生?十个?品*/
        /* ?看"生?需求?"，如果?品已?被消?，
         * ?准?生?。否?在此等待直到需要生?
         */
        down(&sem_producer);
        snprintf(product,10,"product-%d",i); 		/*生??品*/
        printk(KERN_INFO"producer produce %s\n",product);/*生?者提示已?生?*/
        up(&sem_consumer); 	/*?消?者?放"消??"*/
    }
    exit_flags=1; 		/*生?完?，??生??*/
    return 0;
}
/*
* 消?者，如果有?品，?消??品
*/
int consumer(void *p)
{
    char *product=(char *)p;
    for(;;) {
        if(exit_flags) 		/*如果生?工厂已???，?停止消?*/
            break;
        /*?取"消??"，如果有?品，?可以?取，
         *?行消?。否?等待直到有?品。
         */
        down(&sem_consumer);
        printk(KERN_INFO"consumer consume %s\n",product);/*消?者提示?得了?品*/
        memset(product,'\0',10);/*消??品*/
        up(&sem_producer); 	/*向生?者提出生?需求*/
    }
    return 0;
}

module_init(procon_init);
module_exit(procon_exit);
MODULE_AUTHOR("Niu Tao");
MODULE_DESCRIPTION("producer and consumer Module");
MODULE_ALIAS("a simplest module");
