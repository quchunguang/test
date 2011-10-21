/*
 * testlog.c
 *
 *  Created on: 2011-10-20
 *      Author: qcg
 */
#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <string.h>
#include <regex.h>
#include <dlfcn.h>

void testlog(char *argv[]) {
	char *str = "test";
	openlog(argv[0], LOG_PID, LOG_USER);
	printf(
			"1. sudo vim /etc/rsyslog.d/50-default.conf uncommet `user.*'\n");
	printf("2. sudo service rsyslog restart\n");
	printf("3. run this and log will write to /var/log/user.log\n");
	syslog(LOG_INFO, "%s\n", str);
	closelog();
}

void testenv() {
	char *p;
	if ((p = getenv("USER")) != NULL
	)
		printf("USER=%s\n", p);
}

void testregex() {
	char *string =
			"Tab has 8 characters\n has and indentations has 8 characters.\n";
	regex_t preg;
	char *regex = "has ";
	regmatch_t pmatch[5];
	unsigned int i, len;
	bzero(&preg, sizeof(regex_t));
	if (regcomp(&preg, regex, REG_ICASE) != 0)
		goto clear;
	if (regexec(&preg, string, 5, pmatch, 0) != 0)
		goto clear;

	for (i = 0; i < 5; i++) {
		if (pmatch[i].rm_so == -1)
			continue;

		len = pmatch[i].rm_eo - pmatch[i].rm_so;
		printf("%.*s\n", len, (string + pmatch[i].rm_so));
	}
	clear: regfree(&preg);
}

void testdl() {
	int (*my_printf)(const char*, ...);
	void *handle = dlopen("/lib/libc.so.6", RTLD_LAZY);
	my_printf = dlsym(handle, "printf");
	my_printf("printf()'s address is 0x%x\n", my_printf);
}

void teststrtok2() {
	int in = 0;
	char buffer[] = "Fred,John,Ann";
	char *p[10];
	char *buf = buffer;
	while ((p[in] = strtok(buf, ",")) != NULL) {
		printf("%s\n", p[in]);
		in++;
		buf = NULL;
	}
	printf("Total results = %d\n", in);
}

int main(int argc, char *argv[]) {
	testlog(argv);
	testenv();
	testregex();
	testdl();
	teststrtok2();

	return EXIT_SUCCESS;
}
