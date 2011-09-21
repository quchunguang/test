/*
 * udp_server.c
 *
 *  Created on: 2011-9-20
 *      Author: qcg
 */
/* client.c */
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <unistd.h>
#include <netinet/in.h>
#include <arpa/inet.h> // for inet_ntop() ...
#include "wrap.h"

#define MAXLINE 80
#define SERV_PORT 8000

void udp_client(char *no_use)
{
	struct sockaddr_in servaddr;
	int sockfd, n;
	char buf[MAXLINE];

	sockfd = Socket(AF_INET, SOCK_DGRAM, 0);

	bzero(&servaddr, sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	inet_pton(AF_INET, "127.0.0.1", &servaddr.sin_addr);
	servaddr.sin_port = htons(SERV_PORT);

	while (fgets(buf, MAXLINE, stdin) != NULL) {
		n = sendto(sockfd, buf, strlen(buf), 0, (struct sockaddr *)&servaddr, sizeof(servaddr));
		if (n == -1)
			perr_exit("sendto error");

		n = recvfrom(sockfd, buf, MAXLINE, 0, NULL, 0);
		if (n == -1)
			perr_exit("recvfrom error");

		Write(STDOUT_FILENO, buf, n);
	}

	Close(sockfd);
}

void udp_server()
{
	struct sockaddr_in servaddr, cliaddr;
	socklen_t cliaddr_len;
	int sockfd;
	char buf[MAXLINE];
	char str[INET_ADDRSTRLEN];
	int i, n;

	sockfd = Socket(AF_INET, SOCK_DGRAM, 0);

	bzero(&servaddr, sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
	servaddr.sin_port = htons(SERV_PORT);

	Bind(sockfd, (struct sockaddr *)&servaddr, sizeof(servaddr));

	printf("Accepting connections ...\n");
	while (1) {
		cliaddr_len = sizeof(cliaddr);
		n = recvfrom(sockfd, buf, MAXLINE, 0, (struct sockaddr *)&cliaddr, &cliaddr_len);
		if (n == -1)
			perr_exit("recvfrom error");
		printf("received from %s at PORT %d\n",
		       inet_ntop(AF_INET, &cliaddr.sin_addr, str, sizeof(str)),
		       ntohs(cliaddr.sin_port));

		for (i = 0; i < n; i++)
			buf[i] = toupper(buf[i]);
		n = sendto(sockfd, buf, n, 0, (struct sockaddr *)&cliaddr, sizeof(cliaddr));
		if (n == -1)
			perr_exit("sendto error");
	}
}
/*
int main(int argc, char *argv[]) {
	if (argc != 2)
		udp_server();
	else
		// with '-c' for example
		udp_client(argv[1]);

	return 0;
}
*/
