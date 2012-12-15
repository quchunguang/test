#include <linux/kernel.h>
#include <linux/module.h>

int init_module()
{
  printk("init_module\n");
  return 0;
}

void cleanup_module()
{
  printk("clean_module\n");
}

