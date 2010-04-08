#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <netdb.h>
#include <sys/types.h>
#include <netinet/in.h>

int main(int argc, char *argv[])
{
  struct hostent *h;
  if ((h=gethostbyname(argv[1])) == NULL)
  {
    exit(1);   
  }
  printf("hostname:%s\nIP Addr:%s\n",
         h->h_name,
         inet_ntoa(*((struct in_addr*)h->h_addr)));
  return 0;
}

