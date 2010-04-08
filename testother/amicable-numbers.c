#include <stdio.h>
#include <math.h>
#include <time.h>
#include "nothing.h"

typedef unsigned int  NUMBER;
NUMBER Sigma( NUMBER p );
NUMBER Sigma2( NUMBER p );
void printnumber( NUMBER i, NUMBER j );
time_t begintime;

int main()
{
	int nothing = NOTHING;
	nothing++;
	begintime = time( 0 );
	NUMBER i = 2, j = 1;
	/*int nCount = 0;*/
	while( i < 10000 ){
		j = Sigma( i );
		if( j > i && i == Sigma( j )){
			/* Find pare ( i, j )!*/
			printnumber( i, j );
		}
		++i;
	}
	return 0;
}

NUMBER Sigma( NUMBER p )
{
	NUMBER q = 1;
	int i;
	if(p == 1) return 0;
	NUMBER sqrtp = (NUMBER)sqrt( (double)p );
	for( i = 2; i <= sqrtp; ++i ){
		if( p % i == 0 ){
			q += i; q += p / i;
		}
	}
	return q;
}

NUMBER Sigma2( NUMBER n )
{
	NUMBER sum = 1;
	int step;
	int f;
	if( n == 1 ) return 0;
	NUMBER r = (NUMBER)sqrt( (double)n );
	if( n == r * r ){
		sum = 1 + r; --r;
	}
	else{ sum = 1; }
	if( n % 2 == 1 ) { f = 3; step = 2; }
	else { f = 2; step = 1; }
	while( f <= r ){
		if( n % f == 0 ) sum += f + n / f;
		f += step;
	}
	return sum;
}

void printnumber( NUMBER i, NUMBER j )
{
	static int nCount = 0;
	time_t deltatime;
	++nCount;
	deltatime = time(0) - begintime;
	printf( "n=%05d ( i=%u, j=%u ) TotalTime=%03ldm%02lds n/i=%f",
		nCount, i , j, deltatime / 60, deltatime % 60, (float)nCount / i );
	printf( " %01d%01d ", i % 2, j % 2 );
	printf( "\n" );
	if( nCount % 100 == 0 ){
		printf( "====================%05d====================\n", nCount );
	}
}
