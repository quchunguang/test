#include <stdio.h>
#include <stdlib.h>

struct tree {
	struct tree *left;
	int value;
	struct tree *right;
};

struct link {
	int value;
	struct link *next;
};

void link_append(struct link *l, int value)
{
	while (l->next)
		l = l->next;
	struct link *node = (struct link *)malloc(sizeof(struct link));
	node->value = value;
	node->next = NULL;
	l->next = node;
	return;
}

void deepwalk(struct tree *t, struct link *l)
{
	if (t->left != NULL) {
		deepwalk(t->left, l);
	}

	link_append(l, t->value);

	if (t->right != NULL) {
		deepwalk(t->right, l);
	}
}

void link_compare(struct link *a, struct link *b)
{
	struct link *na = a->next;
	struct link *nb = b->next;

	while (1) {
		// if (na)
		//      printf("na->%d\n", na->value);
		// if (nb)
		//      printf("nb->%d\n", nb->value);

		if (na == NULL && nb == NULL) {
			printf("EQUARE.\n");
			return;
		}
		if (na == NULL || nb == NULL || na->value != nb->value) {
			printf("NOT EQUARE.\n");
			return;
		}
		na = na->next;
		nb = nb->next;
	}
	return;
}

struct tree *createtree(int treeinfo[][4], int len)
{
	int i, id, value, lchild, rchild;
	int *flag = (int *)malloc(len * sizeof(int));
	struct tree *block = (struct tree *)malloc(len * sizeof(struct tree));
	struct tree *head;
	for (i = 0; i < len; i++) {
		id = treeinfo[i][0];
		value = treeinfo[i][1];
		lchild = treeinfo[i][2];
		rchild = treeinfo[i][3];

		block[id].value = value;
		if (lchild == -1)
			block[id].left = NULL;
		else {
			flag[lchild] = 1;
			block[id].left = &block[lchild];
		}
		if (rchild == -1)
			block[id].right = NULL;
		else {
			flag[rchild] = 1;
			block[id].right = &block[rchild];
		}
	}
	// find root node and return
	for (i = 0; i < len; i++) {
		if (flag[i] != 1) {
			head = &block[i];
			break;
		}
	}
	free(flag);
	flag = NULL;
	return head;
}

int main()
{

	// // tree a init
	// struct tree a1 = { NULL, 1, NULL };
	// struct tree a3 = { NULL, 2, NULL };
	// struct tree a2 = { &a1, 1, &a3 };
	// struct tree a5 = { NULL, 5, NULL };
	// struct tree a7 = { NULL, 13, NULL };
	// struct tree a6 = { &a5, 8, &a7 };
	// struct tree a4 = { &a2, 3, &a6 };
	// struct tree *a = &a4;

	// // tree b init
	// struct tree b1 = { NULL, 1, NULL };
	// struct tree b3 = { NULL, 2, NULL };
	// struct tree b5 = { NULL, 5, NULL };
	// struct tree b7 = { NULL, 13, NULL };
	// struct tree b2 = { &b1, 1, &b3 };
	// struct tree b4 = { &b2, 3, &b5 };
	// struct tree b6 = { &b4, 8, &b7 };
	// struct tree *b = &b6;

	int atreeinfo[7][4] = {
		// id    value    lchild_id    rchild_id
		// id start with 0; -1 means no child;
		{0, 1, -1, -1,},
		{2, 2, -1, -1,},
		{4, 5, -1, -1,},
		{6, 13, -1, -1,},
		{1, 1, 0, 2,},
		{5, 8, 4, 6,},
		{3, 3, 1, 5,},
	};

	int btreeinfo[7][4] = {
		{0, 1, -1, -1},
		{2, 2, -1, -1},
		{4, 5, -1, -1},
		{6, 13, -1, -1},
		{1, 1, 0, 2},
		{3, 3, 1, 4},
		{5, 8, 3, 6},
	};

	struct tree *a = createtree(atreeinfo, 7);
	struct tree *b = createtree(btreeinfo, 7);

	// links init (with head)
	struct link *la_head = (struct link *)malloc(sizeof(struct link));
	struct link *lb_head = (struct link *)malloc(sizeof(struct link));
	la_head->next = NULL;
	lb_head->next = NULL;

	// walk tree and make link
	deepwalk(a, la_head);
	deepwalk(b, lb_head);

	// compare links
	link_compare(la_head, lb_head);
	return 0;
}
