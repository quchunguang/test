#include <stdio.h>
#include <malloc.h>

struct Node {
	int value;
	struct Node *next;
};
typedef struct Node *List;

int printLink(struct Node *head)
{
	int num = 0;
	struct Node *cur;
	for (cur = head; cur; cur = cur->next) {
		printf("%d -> ", cur->value);
		num++;
	}
	printf("(null)\nCount:%d\n", num);
	return num;
}

struct Node *push(struct Node *head, int value)
{
	struct Node *newitem;
	newitem = (struct Node *)malloc(sizeof(struct Node));
	newitem->value = value;
	newitem->next = head;
	return newitem;
}

struct Node *pop(struct Node *head, int *value)
{
	struct Node *tmp = head;
	if (tmp) {
		head = head->next;
		*value = tmp->value;
		free(tmp);
	}
	return head;
}

int main()
{
	int value;
	List li = NULL;
	li = push(li, 1);
	li = push(li, 2);
	li = push(li, 3);
	int ret = printLink(li);
	li = pop(li, &value);
	printf("pop value %d\n", value);
	li = pop(li, &value);
	printf("pop value %d\n", value);
	li = pop(li, &value);
	printf("pop value %d\n", value);

	return ret;
}
