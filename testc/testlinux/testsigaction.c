#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

struct sigaction act, act2;

void sig_handle(int signum) {
	puts("signal ALARM received");
	// sigaction(SIGALRM, &act, NULL);
	alarm(1);
}

void sig_handle2(int signum) {
	puts("signal INT received");
	exit(1);
}

int main() {
	act.sa_handler = sig_handle;
	act2.sa_handler = sig_handle2;
	sigaction(SIGALRM, &act, NULL);
	sigaction(SIGINT, &act2, NULL);

	alarm(1);
	while (1)
		pause();
        return EXIT_SUCCESS;
}
