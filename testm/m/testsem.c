#include<linux/init.h> 
#include<linux/module.h> 
#include<linux/sched.h> 
#include<linux/semaphore.h> 

int num[2][5] = { 
	{0,2,4,6,8}, 
	{1,3,5,7,9} 
}; 

struct semaphore sem_first; 
struct semaphore sem_second; 
int thread_print_first(void *); 
int thread_print_second(void *); 

int thread_print_first(void *p) 
{ 
	int i; 
	int *num=(int *)p; 
	for(i = 0;i < 5; i++) { 
		down(&sem_first); 
		printk(KERN_INFO"Hello World:%d\n", num[i]); 
		up(&sem_second); 
	} 
	return 0; 
} 

int thread_print_second(void *p) 
{ 
	int i; 
	int *num=(int *)p; 
	for(i = 0; i < 5; i++) { 
		down(&sem_second); 
		printk(KERN_INFO"Hello World:%d\n", num[i]); 
		up(&sem_first); 
	} 
	return 0; 
} 

static int hello_init(void) 
{ 
	printk(KERN_ALERT"Hello World enter\n"); 
	init_MUTEX(&sem_first); 
	init_MUTEX_LOCKED(&sem_second); 
	kernel_thread(thread_print_second, num[1], CLONE_KERNEL); 
	kernel_thread(thread_print_first, num[0], CLONE_KERNEL); 
	return 0; 
} 

static void hello_exit(void) 
{ 
	printk(KERN_ALERT"helloworld exit\n"); 
} 

module_init(hello_init); 
module_exit(hello_exit); 

MODULE_AUTHOR("Kevin Qu"); 
MODULE_DESCRIPTION("A simple hello world Module"); 
MODULE_ALIAS("a simplest module"); 
MODULE_LICENSE("Dual BSD/GPL"); 
