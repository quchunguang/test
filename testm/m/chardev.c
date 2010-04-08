/*
 *  chardev.c: Creates a read-only char device that says how many times
 *  you've read from the dev file
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/fs.h>
#include <asm/uaccess.h>	/* for put_user */

/*
 *  Prototypes - this would normally go in a .h file
 */
static int device_open(struct inode *, struct file *);
static int device_release(struct inode *, struct file *);
static ssize_t device_read(struct file *, char *, size_t, loff_t *);
static ssize_t device_write(struct file *, const char *, size_t, loff_t *);

#define SUCCESS 0
#define DEVICE_NAME "chardev"	/* Dev name as it appears in /proc/devices   */
#define BUF_LEN 80		/* Max length of the message from the device */

/*
 * Global variables are declared as static, so are global within the file.
 */

static int Major;		/* Major number assigned to our device driver */
static int Device_Open = 0;	/* Is device open?
				 * Used to prevent multiple access to device */
static struct file_operations fops = {
	.read = device_read,
	.write = device_write,
	.open = device_open,
	.release = device_release
};

struct dev_data_s {
	struct list_head data_list;
};

struct dev_data_s dev_data = {
	.data_list = LIST_HEAD_INIT(dev_data.data_list)
};

struct data_node {
	struct list_head list;
	char *data;
	int length;
};

/*
 * Functions
 */

int chardev_init(void)
{
	Major = register_chrdev(0, DEVICE_NAME, &fops);
	if (Major < 0) {
		printk("Registering the character device failed with %d\n",
				Major);
		return Major;
	}
	/*
	printk("<6>I was assigned major number %d.  To talk to\n", Major);
	printk("<6>the driver, create a dev file with\n");
	printk("'mknod /dev/hello c %d 0'.\n", Major);
	printk("<6>Try various minor numbers.  Try to cat and echo to\n");
	printk("the device file.\n");
	printk("<6>Remove the device file and module when done.\n");
	*/
	return 0;
}

void chardev_exit(void)
{
	/* Release resource in dev_data.data_list */
	struct data_node *node, *n;
	list_for_each_entry_safe(node, n, &dev_data.data_list, list) {
		list_del(&node->list);
		kfree(node->data);
		kfree(node);
	}

	/* Save with above
	while (!list_empty(&dev_data.data_list)) {
		node = list_first_entry(&dev_data.data_list, struct data_node, list);
		list_del(&node->list);
		kfree(node->data);
		kfree(node);
	}
	*/
	/*
	 * Unregister the device
	 */
	unregister_chrdev(Major, DEVICE_NAME);
}

/*
 * Called when a process tries to open the device file, like
 * "cat /dev/mycharfile"
 */
static int device_open(struct inode *inode, struct file *file)
{
	if (Device_Open)
		return -EBUSY;
	Device_Open++;
	try_module_get(THIS_MODULE);

	return SUCCESS;
}

/*
 * Called when a process closes the device file.
 */
static int device_release(struct inode *inode, struct file *file)
{
	Device_Open--;		/* We're now ready for our next caller */
	module_put(THIS_MODULE);

	return 0;
}

/*
 * Called when a process, which already opened the dev file, attempts to
 * read from it.
 */
static ssize_t device_read(struct file *filp,	/* see include/linux/fs.h   */
		char *buffer,	/* buffer to fill with data */
		size_t length,	/* length of the buffer     */
		loff_t * offset)
{
	int bytes_read = 0;
	struct data_node *node;

	if (list_empty(&dev_data.data_list))
		return 0;
	node = list_first_entry(&dev_data.data_list, struct data_node, list);
	bytes_read = node->length < length ? node->length : length;
	if (copy_to_user(buffer, node->data, bytes_read)) {
		return -EFAULT;
	}
	list_del(&node->list);
	kfree(node->data);
	kfree(node);

	return bytes_read;
}

/*
 * Called when a process writes to dev file: echo "hi" > /dev/hello
 */
static ssize_t device_write(struct file *filp, 
		const char *buff, 
		size_t len, loff_t * off)
{
	int retval;
	struct data_node *new_node;
#ifdef UNIT_TEST
	struct list_head *p;
	struct data_node *node;
#endif
	if (len > 1024)
		len = 1024;

	/* Create and add node to data_list in dev_data */
	new_node = kmalloc(sizeof(struct data_node), GFP_KERNEL);
	if(!new_node)
		return -ENOMEM;
	new_node->data = kmalloc(len, GFP_KERNEL);
	memset(new_node->data, 0, len);

	if(!new_node->data){
		retval = -ENOMEM;
		goto err1;
	}
	if (copy_from_user(new_node->data, buff, len)){
		retval = -EFAULT;
		goto err2;
	}
	new_node->length = len;
	INIT_LIST_HEAD(&new_node->list);
	list_add_tail(&new_node->list, &dev_data.data_list);
#ifdef UNIT_TEST
	list_for_each(p, &dev_data.data_list) {
		node = list_entry(p, struct data_node, list);
		printk("<7>data = ");
		while(len--)
			printk("%x ", *(node->data + len));
		printk("\n");
	}
#endif
	return len;

err2:
	kfree(new_node->data);
err1:
	kfree(new_node);

	return retval;
}

module_init(chardev_init);
module_exit(chardev_exit);

MODULE_AUTHOR("Kevin Qu");
MODULE_LICENSE("GPL");
