/*
 * binarytree.h
 *
 *  Created on: 2011-9-22
 *      Author: qcg
 */

#ifndef BINARYTREE_H_
#define BINARYTREE_H_

typedef struct bnode *linkitem;
struct bnode {
	unsigned char item;
	linkitem leftitem, rightitem;
};

extern linkitem init(unsigned char VLR[], unsigned char LVR[], int n);
extern void pre_order(linkitem t, void(*visit)(linkitem));
extern void in_order(linkitem t, void(*visit)(linkitem));
extern void post_order(linkitem t, void(*visit)(linkitem));
extern int count(linkitem t);
extern int depth(linkitem t);
extern void destroy(linkitem t);

#endif /* BINARYTREE_H_ */
