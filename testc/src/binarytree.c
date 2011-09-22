/*
 * binarytree.c
 *
 *  Created on: 2011-9-22
 *      Author: qcg
 */

#include <stdlib.h>
#include "binarytree.h"

static linkitem make_node(unsigned char item) {
	linkitem p = malloc(sizeof *p);
	p->item = item;
	p->leftitem = p->rightitem = NULL;
	return p;
}

static void free_node(linkitem p) {
	free(p);
}

linkitem init(unsigned char VLR[], unsigned char LVR[], int n) {
	linkitem t;
	int k;
	if (n <= 0)
		return NULL;
	for (k = 0; VLR[0] != LVR[k]; k++)
		;
	t = make_node(VLR[0]);
	t->leftitem = init(VLR + 1, LVR, k);
	t->rightitem = init(VLR + 1 + k, LVR + 1 + k, n - k - 1);
	return t;
}

void pre_order(linkitem t, void(*visit)( linkitem)) {
	if (!t)
		return;
	visit(t);
	pre_order(t->leftitem, visit);
	pre_order(t->rightitem, visit);
}

void in_order(linkitem t, void(*visit)( linkitem)) {
	if (!t)
		return;
	in_order(t->leftitem, visit);
	visit(t);
	in_order(t->rightitem, visit);
}

void post_order(linkitem t, void(*visit)( linkitem)) {
	if (!t)
		return;
	post_order(t->leftitem, visit);
	post_order(t->rightitem, visit);
	visit(t);
}

int count(linkitem t) {
	if (!t)
		return 0;
	return 1 + count(t->leftitem) + count(t->rightitem);
}

int depth(linkitem t) {
	int dl, dr;
	if (!t)
		return 0;
	dl = depth(t->leftitem);
	dr = depth(t->rightitem);
	return 1 + (dl > dr ? dl : dr);
}

void destroy(linkitem t) {
	post_order(t, free_node);
}
