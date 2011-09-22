/*
 * bst.c
 *
 *  Created on: 2011-9-22
 *      Author: qcg
 */

#include <stdlib.h>
#include <stdio.h>
#include "bst.h"

static linkbst make_node(unsigned char item) {
	linkbst p = malloc(sizeof *p);
	p->item = item;
	p->leftitem = p->rightitem = NULL;
	return p;
}

static void free_node(linkbst p) {
	free(p);
}

linkbst search(linkbst t, unsigned char key) {
	if (!t)
		return NULL;
	if (t->item > key)
		return search(t->leftitem, key);
	if (t->item < key)
		return search(t->rightitem, key);
	/* if (t->item == key) */
	return t;
}

linkbst insert(linkbst t, unsigned char key) {
	if (!t)
		return make_node(key);
	if (t->item > key) /* insert to left subtree */
		t->leftitem = insert(t->leftitem, key);
	else
		/* if (t->item <= key), insert to right subtree */
		t->rightitem = insert(t->rightitem, key);
	return t;
}

linkbst delete(linkbst t, unsigned char key) {
	linkbst p;
	if (!t)
		return NULL;
	if (t->item > key) /* delete from left subtree */
		t->leftitem = delete(t->leftitem, key);
	else if (t->item < key) /* delete from right subtree */
		t->rightitem = delete(t->rightitem, key);
	else { /* if (t->item == key) */
		if (t->leftitem == NULL && t->rightitem == NULL) { /* if t is leaf node */
			free_node(t);
			t = NULL;
		} else if (t->leftitem) { /* if t has left subtree */
			/* replace t with the rightmost node in left subtree */
			for (p = t->leftitem; p->rightitem; p = p->rightitem)
				;
			t->item = p->item;
			t->leftitem = delete(t->leftitem, t->item);
		} else { /* if t has right subtree */
			/* replace t with the leftmost node in right subtree */
			for (p = t->rightitem; p->leftitem; p = p->leftitem)
				;
			t->item = p->item;
			t->rightitem = delete(t->rightitem, t->item);
		}
	}
	return t;
}

void print_tree(linkbst t) {
	if (t) {
		printf("(");
		printf("%d", t->item);
		print_tree(t->leftitem);
		print_tree(t->rightitem);
		printf(")");
	} else
		printf("()");
}
