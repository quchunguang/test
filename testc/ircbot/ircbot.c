/*
 ============================================================================
 Name        : main.c
 Author      : Kevin Qu
 Version     :
 Copyright   : By Kevin Qu, @2012, all rights reserved.
 Description : A simple robot to talk to irc.
 	       call like `ircbot grazestar.com 6667'
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

//#include <locale.h>
#include <time.h>

#define BUFFER_LEN 1024

void error(const char *msg)
{
	perror(msg);
	exit(0);
}
void write_irc(char buffer[], int sockfd, const char *msg) {
	int n;

	bzero(buffer, BUFFER_LEN);
	strcpy(buffer, msg);
	n = write(sockfd, buffer, strlen(buffer));
	printf("%s", buffer);
	if (n < 0)
		error("ERROR writing to socket");
}
void read_irc(char buffer[], int sockfd) {
	int n;

	do {
		bzero(buffer, BUFFER_LEN);
		n = read(sockfd, buffer, BUFFER_LEN - 1);
		if (n < 0)
			error("ERROR reading from socket");
		if (n > 0)
			printf("%s", buffer);
	} while (n == BUFFER_LEN);
}
void read_irc_till(char buffer[], int sockfd, const char *keyword) {
	do {
		read_irc(buffer, sockfd);
	} while( strstr(buffer, keyword) == NULL );
}
void robot_loop(char buffer[], int sockfd) {
	time_t now;
	char write_buf[BUFFER_LEN];
	bzero(write_buf, BUFFER_LEN);
	while(1)
	{
		read_irc(buffer, sockfd);
		if ( strstr(buffer, "PING ") != NULL ) {
			strcpy(write_buf, buffer);
			strncpy(write_buf, "PONG", 4);
			write_irc(buffer, sockfd, write_buf);
		}
		else if (strstr(buffer, "fuck you") != NULL) {
			write_irc(buffer, sockfd, "PRIVMSG #aa :你妈妈的骂人，伤心了，闪了~~~\n");
			write_irc(buffer, sockfd, "QUIT\n");
			break;
		}
		else if (strstr(buffer, "what time") != NULL) {
			//setlocale(LC_TIME, "zh_CN");
			time(&now);
			sprintf(write_buf, "PRIVMSG #aa :现在时间是 %s\n", ctime(&now));
			write_irc(buffer, sockfd, write_buf);
		}
		else if (strstr(buffer, "your name") != NULL) {
			write_irc(buffer, sockfd,
				"PRIVMSG #aa :大家叫我机器人，其实我叫爱因斯坦，:)\n");
		}
		else if (strstr(buffer, "how old") != NULL) {
			write_irc(buffer, sockfd,
				"PRIVMSG #aa :本小姐年方82，至今未婚~~~\n");
		}
		else if (strstr(buffer, "i love you") != NULL) {
			write_irc(buffer, sockfd,"PRIVMSG #aa :  __________________________\n");
			write_irc(buffer, sockfd,"PRIVMSG #aa :< 我也爱你, 流氓兔，绿毛小乌龟! >\n");
			write_irc(buffer, sockfd,"PRIVMSG #aa :  --------------------------\n");
			write_irc(buffer, sockfd,"PRIVMSG #aa :       \\   ^__^\n");
			write_irc(buffer, sockfd,"PRIVMSG #aa :        \\  (oo)\\_______\n");
			write_irc(buffer, sockfd,"PRIVMSG #aa :           (__)\\       )\\/\\\n");
			write_irc(buffer, sockfd,"PRIVMSG #aa :               ||----w |\n");
			write_irc(buffer, sockfd,"PRIVMSG #aa :               ||     ||\n");
		}
	}
}
int main(int argc, char *argv[])
{
	int sockfd, portno;
	struct sockaddr_in serv_addr;
	struct hostent *server;
	char buffer[BUFFER_LEN];

	// connect to server
	if (argc < 3) {
		fprintf(stderr,"usage %s hostname port\n", argv[0]);
		exit(0);
	}
	portno = atoi(argv[2]);
	sockfd = socket(AF_INET, SOCK_STREAM, 0);
	if (sockfd < 0)
		error("ERROR opening socket");
	server = gethostbyname(argv[1]);
	if (server == NULL) {
		fprintf(stderr,"ERROR, no such host\n");
		exit(0);
	}
	bzero((char *) &serv_addr, sizeof(serv_addr));
	serv_addr.sin_family = AF_INET;
	bcopy((char *)server->h_addr,
			(char *)&serv_addr.sin_addr.s_addr,
			server->h_length);
	serv_addr.sin_port = htons(portno);
	if (connect(sockfd,(struct sockaddr *) &serv_addr,sizeof(serv_addr)) < 0)
		error("ERROR connecting");

	// irc login
	read_irc_till(buffer, sockfd, "Couldn't look up your hostname");
	write_irc(buffer, sockfd, "NICK IrcRobot\n");
	write_irc(buffer, sockfd, "USER paul 8 *  : Paul Mutton\n");
	read_irc_till(buffer, sockfd, " MODE ");

	// irc join #room
	write_irc(buffer, sockfd, "JOIN #aa\n");
	read_irc_till(buffer, sockfd, ":End of /NAMES list");
	write_irc(buffer, sockfd, "PRIVMSG #aa :I am here ...\n");

	// robot talk to irc
	robot_loop(buffer, sockfd);

	// quit irc
	close(sockfd);
	return 0;
}
