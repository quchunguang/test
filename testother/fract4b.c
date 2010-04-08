//========================================================================
//
//	cl /O2 fract4.cpp
//  gcc -O1 fract4b.cpp -lpthread -o fract4b
//
#define equal   !strcmp
#define equaln  !strncmp

#ifdef _WIN32
#define _WIN32_WINNT  0x0400
#include <windows.h>
#define INT64   __int64
#else
#define INT64 long long
#include <sys/time.h>
#include <stdlib.h>
#endif

//========================================================================

#ifdef _WIN32
#   define THRDFN LPTHREAD_START_ROUTINE
#   include <windows.h>
#   define WINDEC  __stdcall
#   define YIELD   SleepSwitch()
#   define SLEEP(x)    Sleep(1000*x)
#   define LOCK    EnterCriticalSection
#   define UNLOCK  LeaveCriticalSection
#   define SLASHC   '\\'
#   define SLASHSTR "\\"
#	define Errno GetLastError()

    CRITICAL_SECTION critA;
    CRITICAL_SECTION lock_run_count;
    HANDLE mutexA;
    unsigned long timerId;
    HANDLE th1;
#else
#   include <pthread.h>
#   include <errno.h>
#   include <unistd.h>
#   include <string.h>

#   define WINDEC
#   define YIELD    Nsleep()
#   define SLEEP(x)    sleep(x)
#   define LOCK    pthread_mutex_lock
#   define UNLOCK  pthread_mutex_unlock
#   define SLASHC   '/'
#   define SLASHSTR "/"
#	define Errno errno

    pthread_mutex_t mut = PTHREAD_MUTEX_INITIALIZER;
    pthread_mutex_t lock_run_count;
    unsigned long threadreturn;
    pthread_t tA;
    void Nsleep();
#endif

#include <stdio.h>

int summary  = 0;
int nthreads = 1;
int sched_yieldflag = 0;
int sleep_switchflag = 0;

struct threadlocalm {
    unsigned long threadid;
#   ifdef _WIN32
    HANDLE t1;
#   else
    pthread_t t1;
#   endif
    INT64 iterations;
    int tnum;
    int tyields;
    int tstate;
} *threadmem;

#ifdef _WIN32
void SleepSwitch()
{
    if(sleep_switchflag == 0)
        Sleep(0);
    else
        (void)SwitchToThread();
}
#else
void Nsleep()
{
    static struct timespec req = { 0, 0 };

    if(sched_yieldflag)
        sched_yield();
    else {
        if(nanosleep(&req, NULL) == -1) {
            printf("nanosleep FAILED: err=%d\n",Errno);
            exit(1);
        }
    }
}
#endif

unsigned long threadmemsz;

unsigned long fractwork(void *);
void createthreads();
void cleanupthreads();

int startTimedTest(volatile int *);
void endTimedTest();
int nseconds = 4;
unsigned long WINDEC timerloop(void *);
volatile int run_count = 0;

int startTimedTest(volatile int *flg)
{
    static int first = 1;

    if(first) {
#ifdef _WIN32
        InitializeCriticalSection(&lock_run_count);
#else
        (void)pthread_mutex_init(&lock_run_count,NULL);
#endif
        first = 0;
    }
    run_count = 0;
#ifdef _WIN32
    th1 = CreateThread(NULL, 4096,timerloop,(char *)flg,NULL,&timerId);
    if(th1 == NULL) {
        printf("CreateThread FAILED: err=%d\n",Errno);
        return 1;
    }
#else
    int terr;

#   define DEC (void *(*)(void *))

    terr = pthread_create(&tA, NULL, DEC timerloop, (void *)flg);
    if(terr) {
        printf("pthread_create FAILED: err=%d\n", terr);
        return 1;
    }
#endif
    while(run_count != 1)
        YIELD;
    return 0;
}

unsigned long WINDEC timerloop(void *v)
{
    int *flg = (int *)v;

    LOCK(&lock_run_count);
    run_count++;
    UNLOCK(&lock_run_count);

    *flg = 1;
    SLEEP(nseconds);
    *flg = 2;
    return 0;
}

void endTimedTest()
{
#ifdef _WIN32
    unsigned long uret;
    int waittime;

    waittime = nseconds + nseconds + 2;
    //uret = WaitForSingleObject(th1, waittime*1000);
    uret = WaitForSingleObject(th1, INFINITE);
    if(uret == WAIT_FAILED) {
        printf("endTimedTest WaitForSingleObject FAILED: err=%d\n",Errno);
        exit(1);
    }
    if(uret == WAIT_TIMEOUT) {
        printf("Timer thread exit timed out (%d seconds)\n", waittime);
        fflush(stdout);
        exit(1);
    }
    if(CloseHandle(th1) == 0) {
        printf("endTimedTest CloseHandle FAILED: err=%d\n",Errno);
        exit(1);
    }
#else
    int err;

    err = pthread_join(tA, (void **)&threadreturn);

    if(err) {
        printf("pthread_join FAILED: err=%d\n",err);
        return;
    }
#endif
}

void *Malloc(size_t sz)
{
	char *p;

	p = (char *)malloc(sz);
	if(p == NULL) {
		(void)printf("malloc(%d) failed\n",sz);
		exit(1);
	}
	return (void *)p;
}

#include <stdlib.h>

typedef struct genlist {
    int fl_first;
    int fl_start;
    int fl_end;
    int fl_parts;
    int fl_last;
    int fl_subs;
    int fl_bs;
    int fl_flag;        // 0 == arithmetic; !0 == geometric
} genlist_t;

int init_list(genlist_t *,int,int,int,int);

#define restart_list(l) init_list((l),(l)->fl_start,(l)->fl_end,(l)->fl_parts,(l)->fl_flag)

int next_list(genlist_t *);
void getlist(char *, genlist_t *);

int init_list(genlist_t *l, int start, int end, int parts, int flag)
{
    memset((void *)l, '\0', sizeof(*l));

    l->fl_start     = start;
    l->fl_end       = end;
    if(l->fl_end < start)
        l->fl_end   = start;
    l->fl_parts     = parts;
    if(l->fl_parts < 1)
        l->fl_parts = 1;
    l->fl_flag      = flag;
    l->fl_first     = 1;   

    return 0;
}
int next_list(genlist_t *l)
{
    int nbs;

    if(l->fl_first) {
        if(l->fl_first == -1)
            return 0;

        l->fl_first = 0;

        if(l->fl_flag == 0) {
            nbs = l->fl_bs = l->fl_start;
            return l->fl_bs;
        }
        else {
            l->fl_subs  = 0;
            l->fl_last  = -1;
            nbs = l->fl_bs    = l->fl_start;
            l->fl_last = nbs;
            return l->fl_bs;
        }
    }
    else {

        if(l->fl_flag == 0) {
            l->fl_bs += l->fl_parts;
            if(l->fl_bs > l->fl_end) {
                l->fl_first = -1;
                return 0;
            }
            return l->fl_bs;
        }
        for(;;) {
            l->fl_subs++;
            if(l->fl_subs >= l->fl_parts) {
                l->fl_subs = 0;
                l->fl_bs = l->fl_bs + l->fl_bs;
                if(l->fl_bs > l->fl_end) {
                    l->fl_first = -1;
                    return 0;
                }
            }
            nbs = l->fl_bs + (l->fl_subs*l->fl_bs)/l->fl_parts;
            if(nbs == l->fl_last)
                continue;
             else
                break;
        }
        l->fl_last = nbs;

        return nbs;
    }
}

#include <stdio.h>

volatile int timedtestflag = 0;
char *applname;
int debug = 0;

void tstart(void);
void tend(void);
double tval(void);

double a = .1;
double b = .1;
double c = .1;
double d = .1;

char *defaulttimelist   = "4,4,1,0";
char *defaultthreadlist = "1,1,1,0";

int main(int ac, char *av[])
{
	double tim;
    int ii;
    genlist_t timelist, threadlist;

    applname = av[0];
    if(strrchr(applname,SLASHC))
        applname = strrchr(applname,SLASHC) + 1;

    if(ac <= 1)
        goto USAGE;

    getlist(defaulttimelist,   &timelist);
    getlist(defaultthreadlist, &threadlist);

    while(ac > 1 && av[1][0] == '-') {
        if(equal(av[1], "-d")) {
            debug++;
            ac--;
            av++;
        }
#ifdef _WIN32
        else if(equal(av[1], "-sleep_switch")) {
            sleep_switchflag = 1;
            ac--;
            av++;
        }
#else
        else if(equal(av[1], "-sched_yield")) {
            sched_yieldflag = 1;
            ac--;
            av++;
        }
#endif
        else if(equal(av[1],"-s")) {
            summary++;
            ac--;
            av++;
        }
        else if(equaln(av[1], "-t",2)) {
            if(av[1][2]) {
                getlist(&av[1][2],&threadlist);
            }
            else {
                ac--;
                av++;
                getlist(av[1],&threadlist);
            }
            ac--;
            av++;
        }
		else
			goto USAGE;
    }
    if(ac == 2) {
        getlist(av[1],&timelist);
    }
	else if(ac == 5) {
		a = atof(av[1]);
		b = atof(av[2]);
		c = atof(av[3]);
		d = atof(av[4]);
    }
    else if (ac == 6) {
        getlist(av[1],&timelist);
		a          = atof(av[2]);
		b          = atof(av[3]);
		c          = atof(av[4]);
		d          = atof(av[5]);
	}
    else if(ac != 1 || nthreads < 1) {
USAGE:
        printf("USAGE: %s - compute (.1,.1),(.1,.1) for %d seconds\n",
            applname,nseconds);
        printf("       %s [-s] ... - print summary only\n",applname);
        printf("       %s [-d] ... - print thread,yields debug info\n",applname);
#ifdef _WIN32
        printf("       %s [-sleep_switch] use SwitchToThread() rather than Sleep()\n",applname);
#else
        printf("       %s [-sched_yield] ... - use sched_yield rather than nanosleep() API.\n",applname);
#endif
        printf("       %s [-t nthreads] ... - use nthreads (default=1)\n",applname);
        printf("       %s  3 - compute (.1,.1),(.1,.1) for 3 seconds\n",
            applname);
        printf("       %s  w x y z - compute (w,x),(y,z) for %d seconds\n",
            applname,nseconds);
        return 0;
    }

	//
	//	x1 = x0*x0 + c
	//
	//	where x0 and c are complex numbers.
	//	x0 = a + bi;
	//	c  = c + di;
	//

    if(summary)
        printf("seconds,threads,unscheduled-threads,iter/usec\n");


threadloop:

    nthreads = next_list(&threadlist);
    if(nthreads == 0) {
        return 0; // exiting from main.
    }


    timedtestflag = 0;
    //printf("Createthreads nthreads=%d\n",nthreads); fflush(stdout);
    createthreads();
    restart_list(&timelist);
    //printf("Created\n"); fflush(stdout);

    for(;;) {
        timedtestflag = 0;
        nseconds = next_list(&timelist);
        if(nseconds == 0)
            break;

        for(ii = 0; ii < nthreads; ii++) {
            threadmem[ii].iterations = 0;
            while(threadmem[ii].tstate != 1) {
                YIELD;
			}
        }
        //printf("tstate=1\n"); fflush(stdout);
        //
        // All are waiting for timedtestflag to go to 1.
        //
        tstart();
        if(startTimedTest(&timedtestflag))
            return 1;
        endTimedTest();
        //
        // Wait for all of them to finish before stopping the watch.
        // this makes sure the current thread isn't the the first to finish.
        //
        //printf("Done, waiting for all to read tstate=3\n"); fflush(stdout);
        for(ii = 0; ii < nthreads; ii++)
            while(threadmem[ii].tstate != 3) {
                YIELD;
			}

        tend();
        //printf("All to tstate=3\n"); fflush(stdout);

        INT64 total = 0;
        unsigned long nocycles = 0;

        for(ii = 0; ii < nthreads; ii++) {
            total += threadmem[ii].iterations;
            if(threadmem[ii].iterations == 0)
                nocycles++;
        }

        tim = tval();

        if(summary) {
            double d;

            d = (double)total;

            printf("%d,%d,%lu,%5.4f\n",
                    nseconds,nthreads,nocycles,
					d/(tim*1E6));
			fflush(stdout);
        }
        else {
            INT64 subtot = 0;
            INT64 subtot0 = 0;

            printf("%s -t %d %d %8.5f %8.5f %8.5f %8.5f\n",
                    applname,nthreads,nseconds,a,b,c,d);
            printf("\tThrd   total  running_total   percent_of_total\n");

            subtot0 = 0;
            for(ii = 0; ii < nthreads; ii++)
                subtot0 += threadmem[ii].iterations;

            for(ii = 0; ii < nthreads; ii++) {
                subtot += threadmem[ii].iterations;
#ifdef _WIN32
                printf("\t%3d: %9I64d  %9I64d     %.2f%%\n",
#else
                printf("\t%3d: %9Lu    %9Lu       %.2f%%\n",
#endif
                    ii,threadmem[ii].iterations,subtot,
                    100.*(double)threadmem[ii].iterations/(double)subtot0);
            }
#ifdef _WIN32
            printf("%I64d Total Iterations %6.4f iter/usec  %6.3f seconds\n",
#else
            printf("%Lu Total Iterations %6.4f iter/usec  %6.3f seconds\n",
#endif
                total,(double)total/(tim*1E6), tim);
        }
        fflush(stdout);
    }

    timedtestflag = 3;
    cleanupthreads();
    goto threadloop;

}

void createthreads()
{
    int ii;

    threadmemsz = nthreads*sizeof(struct threadlocalm);
    threadmem = (struct threadlocalm *) Malloc(threadmemsz);
    memset((void *)threadmem, '\0', threadmemsz);

    for(ii = 0; ii < nthreads; ii++) {
#ifdef _WIN32
        threadmem[ii].t1 = CreateThread(NULL, 4096, (THRDFN)fractwork,
                                (void *)&threadmem[ii], NULL,
                                &threadmem[ii].threadid);
        if(threadmem[ii].t1 == NULL) {
            printf("CreateThread #%d FAILED: err=%d\n",ii,Errno);
            exit(1);
        }
#else
        int terr;
        pthread_t tt1;

        terr = pthread_create(&tt1,NULL,
                DEC fractwork, (void *)&threadmem[ii]);
        if(terr) {
            printf("pthread_create #%d FAILED: err=%d\n",ii,terr);
            exit(1);
        }
        threadmem[ii].t1 = tt1;
        //printf("\t%d\n",ii); fflush(stdout);
#endif
        threadmem[ii].tnum = ii;
    }
}

void cleanupthreads()
{
    int ii;

    for(ii = nthreads; --ii >= 0; ) {
#ifdef _WIN32
        for(;;) {
            unsigned long uret;

            uret = WaitForSingleObject(threadmem[ii].t1, 4000);

            if(uret == WAIT_FAILED) {
                printf("WaitForSingleObject FAILED: err=%d\n",Errno);
                fflush(stdout);
                exit(1);
            }
            if(uret == WAIT_TIMEOUT) {

                FILETIME ctime,exittime,kerntime,usertime;

                if(GetThreadTimes(threadmem[ii].t1, &ctime, &exittime,
                                &kerntime, &usertime) == 0) {
                    printf("GetThreadTimes FAILED: err=%d\n",Errno);
                    fflush(stdout);
                    exit(1);
                }
                printf("Thrd[%d] uret=%u tstate=%d iter=%I64d ttf=%d %u.%u %u.%u %u.%u %u.%u\n",
                    ii,
                    uret,
                    threadmem[ii].tstate,
                    threadmem[ii].iterations,
                    timedtestflag,
                    ctime.dwLowDateTime,ctime.dwHighDateTime,
                    exittime.dwLowDateTime,exittime.dwHighDateTime,
                    kerntime.dwLowDateTime,kerntime.dwHighDateTime,
                    usertime.dwLowDateTime,usertime.dwHighDateTime);

                fflush(stdout);
                YIELD;
            }
            else {
                CloseHandle(threadmem[ii].t1);
                break;
            }
        }
#else
        if(pthread_join(threadmem[ii].t1,NULL)) {
            printf("pthread_join FAILED: err=%d\n",Errno);
            fflush(stdout);
            exit(1);
        }
#endif
    }
    free(threadmem);
}

unsigned long fractwork(void *p)
{
    INT64 ull;
    struct threadlocalm *t = (struct threadlocalm *)p;
    int cnt = 0;

    double x, y, x1, y1;

    for(;;) {
        cnt = 0;
        t->tstate = 1;
        t->tyields = 0;
        while(timedtestflag == 0) {
            t->tstate = 1;
            t->tyields++;
            YIELD;
        }
        if(debug && t->tyields > 2)
            printf("%d,%d ",t->tnum,t->tyields);
        t->tstate = 2;
        x = a;
        y = b;
        for(ull = 0; timedtestflag == 1 ; ull++) {
            x1 = x*x - y*y;
            y1 = -2 * x * y;
            if( (x1*x1 + y1*y1) > 1.0)
                break;
            x = x1 + c;
            y = y1 + d;
        }
        t->iterations = ull;
        t->tstate = 3;
        while(timedtestflag == 2) {
            YIELD;
        }
        if(timedtestflag > 2) {
            t->tstate = 4;
            break;
        }
    }
    return 0;
}

void getlist(char *s, genlist_t *l)
{
    int num;
    char *p;

    init_list(l,0,0,0,0);

    num = atoi(s);
    l->fl_start = l->fl_end = num;
    l->fl_parts = 1;

    p = strchr(s,',');
    if(p) {
        p++;
        if(*p) {
            num = atoi(p);
            l->fl_end = num;
            p = strchr(p,',');
            if(p) {
                p++;
                if(*p) {
                    num = atoi(p);
                    l->fl_parts = num;
                    p = strchr(p,',');
                    if(p) {
                        p++;
                        if(*p)
                            l->fl_flag = atoi(p);
                    }
                }
            }
        }
    }
}

#ifdef _WIN32
static LARGE_INTEGER _tstart, _tend;
static LARGE_INTEGER freq;

void tstart(void)
{
	static int first = 1;

	if(first) {
		QueryPerformanceFrequency(&freq);
		first = 0;
	}
	QueryPerformanceCounter(&_tstart);
}
void tend(void)
{
	QueryPerformanceCounter(&_tend);
}

double tval()
{
	return ((double)_tend.QuadPart -
				(double)_tstart.QuadPart)/((double)freq.QuadPart);
}
#else
static struct timeval _tstart, _tend;
static struct timezone tz;

void tstart(void)
{
	gettimeofday(&_tstart, &tz);
}
void tend(void)
{
	gettimeofday(&_tend,&tz);
}

double tval()
{
	double t1, t2;

	t1 =  (double)_tstart.tv_sec + (double)_tstart.tv_usec/(1000*1000);
	t2 =  (double)_tend.tv_sec + (double)_tend.tv_usec/(1000*1000);
	return t2-t1;
}
#endif

