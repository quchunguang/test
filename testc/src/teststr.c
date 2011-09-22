/*
 * teststr.c
 *
 *  Created on: 2011-9-21
 *      Author: qcg
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "binarytree.h"
#include "bst.h"

#define RANGE 100
#define N 6

void print_item(linkitem p) {
	printf("%d", p->item);
}

struct record {
	char name[10];
	int age;
};

static const char *msg[] = { "Sunday", "Monday", "Tuesday", "Wednesday",
		"Thursday", "Friday", "Saturday" };

char *get_a_day(int idx) {
	static char buf[20];
	strcpy(buf, msg[idx]);
	return buf;
}

void teststrtok() {
	char str[] = "root:x::0:root:/root:/bin/bash:";
	char *token;
	token = strtok(str, ":");
	printf("%s\n", token);
	while ((token = strtok(NULL, ":")) != NULL)
		printf("%s\n", token);
}

void testmemmove() {
	char buf[20] = "hello world\n";
	memmove(buf + 2, buf, 13);
	printf("%s", buf);
}

void teststrtok_r() {
	char *str1, *str2, *token, *subtoken;
	char *saveptr1, *saveptr2;
	int j;
	char arg1[] = "a/bbb///cc;xxx:yyy:";
	char arg2[] = ";:";
	char arg3[] = "/";
	for (j = 1, str1 = arg1;; j++, str1 = NULL) {
		token = strtok_r(str1, arg2, &saveptr1);
		if (token == NULL
		)
			break;
		printf("%d: %s\n", j, token);

		for (str2 = token;; str2 = NULL) {
			subtoken = strtok_r(str2, arg3, &saveptr2);
			if (subtoken == NULL
			)
				break;
			printf(" --> %s\n", subtoken);
		}
	}
}

int testfseek() {
	FILE *fp;
	if ((fp = fopen("hello", "r+")) == NULL) {
		perror("Open file textfile");
		return 1;
	}
	if (fseek(fp, 10, SEEK_SET) != 0) {
		perror("Seek file textfile");
		return 1;
	}
	fputc('K', fp);
	fclose(fp);
	return 0;
}

int testfwrite() {
	struct record array[2] = { { "Ken", 24 }, { "Knuth", 28 } };
	FILE *fp = fopen("recfile", "w");
	if (fp == NULL) {
		perror("Open file recfile");
		return 1;
	}
	fwrite(array, sizeof(struct record), 2, fp);
	fclose(fp);
	return 0;
}

int testfread() {
	struct record array[2];
	FILE *fp = fopen("recfile", "r");
	if (fp == NULL) {
		perror("Open file recfile");
		return 1;
	}
	fread(array, sizeof(struct record), 2, fp);
	printf("Name1: %s\tAge1: %d\n", array[0].name, array[0].age);
	printf("Name2: %s\tAge2: %d\n", array[1].name, array[1].age);
	fclose(fp);
	return 0;
}

void testscanf() {
	int day, month, year;
	char monthname[20];
	char line[20];

	// scanf把换行符也看作空白字符，仅仅当作字段之间的分隔符，
	// 如果输入中的字段个数不确定，最好是先用fgets按行读取，然后再交给sscanf处理
	while (fgets(line, sizeof(line), stdin) > 0) {
		if (sscanf(line, "%d %s %d", &day, monthname, &year) == 3)
			printf("valid: %s\n", line); /* 25 Dec 1988 form */
		else if (sscanf(line, "%d/%d/%d", &month, &day, &year) == 3)
			printf("valid: %s\n", line); /* mm/dd/yy form */
		else
			printf("invalid: %s\n", line); /* invalid form */
	}
}

void testbtree() {
	//testscanf();
	unsigned char pre_seq[] = { 4, 2, 1, 3, 6, 5, 7 };
	unsigned char in_seq[] = { 1, 2, 3, 4, 5, 6, 7 };
	linkitem root = init(pre_seq, in_seq, 7);
	pre_order(root, print_item);
	putchar('\n');
	in_order(root, print_item);
	putchar('\n');
	post_order(root, print_item);
	putchar('\n');
	printf("count=%d depth=%d\n", count(root), depth(root));
	destroy(root);
}

void testbst() {
	int i, key;
	linkbst root = NULL;
	srand(time(NULL));
	for (i = 0; i < N; i++)
		root = insert(root, rand() % RANGE);

	printf("\t\\tree");
	print_tree(root);
	printf("\n\n");
	while (root) {
		key = rand() % RANGE;
		if (search(root, key)) {
			printf("delete %d in tree\n", key);
			root = delete(root, key);
			printf("\t\\tree");
			print_tree(root);
			printf("\n\n");
		}
	}

}

void testconst() {
	//const char *p = "abcd";
	const char str1[5] = "abcd";
	//char str2[5] = "abcd";
	//printf(p);
	printf(str1);
	//printf(str2);
	printf("abcd");
}

int main(int argc, char *argv[]) {
	testmemmove();
	teststrtok(); // not thread safe
	teststrtok_r(); // thread safe
	testfseek();
	testfwrite();
	testfread();
	//testscanf();
	testbtree();
	testbst();
	testconst();

	printf("%s %s %s\n", get_a_day(2), get_a_day(1), get_a_day(0));

	return 0;
}
