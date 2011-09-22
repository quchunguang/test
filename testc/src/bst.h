/*
 * bst.h
 *
 *  Created on: 2011-9-22
 *      Author: qcg
 */

#ifndef BST_H_
#define BST_H_

typedef struct bstnode *linkbst;
struct bstnode {
	unsigned char item;
	linkbst leftitem, rightitem;
};

extern linkbst search(linkbst t, unsigned char key);
extern linkbst insert(linkbst t, unsigned char key);
extern linkbst delete(linkbst t, unsigned char key);
extern void print_tree(linkbst t);

#endif /* BST_H_ */
