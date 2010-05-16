#include <iostream>
#include <ctime>
using namespace std;

// This sample program uses the clock() function to measure
// the time that it takes for the loop part of the program
// to execute

int main()
{
	clock_t start_time ,finish_time;

	// get the delay of executing the clock() function

	start_time = clock();
	finish_time = clock();
	double delay_time = (double)(finish_time - start_time);

	cout<<"Delay time:"<<(double)delay_time<<" seconds."<<endl;

	// start timing

	start_time = clock();

	// Begin the timing

	for (int i = 0; i < 100000; i++)
	{
		cout <<"In:"<<i<<" loop" << endl;
	}

	// End the timing

	// finish timing

	finish_time = clock();

	// compute the running time without the delay

	double elapsed_iter_time = (double)(finish_time - start_time);
	elapsed_iter_time -= delay_time;

	// convert to second format

	double elapsed_time = elapsed_iter_time / CLOCKS_PER_SEC;

	// output the time elapsed

	cout<<"Elapsed time:"<<(double)elapsed_time<<" seconds."<<endl;

	// get the delay of executing the clock() function


	start_time = clock();
	finish_time = clock();
	delay_time = (double)(finish_time - start_time);

	cout<<"Delay time:"<<(double)delay_time<<" seconds."<<endl;

	// now see what results we get by doing the measurement
	// of the loop by cutting the loop in half

	// start timing

	start_time = clock();

	// Begin the timing

	for (int i = 0; i < 50000; i++)
	{
		cout <<"In:"<<i<<" loop" << endl;
	}

	// End the timing

	// finish timing

	finish_time = clock();

	// compute the running time without the delay

	elapsed_iter_time = (double)(finish_time - start_time);
	elapsed_iter_time -= delay_time;

	// convert to second format

	elapsed_time = elapsed_iter_time / CLOCKS_PER_SEC;

	// output the time elapsed.

	cout<<"Elapsed time:"<<(double)elapsed_time<<" seconds."
		<<endl;

	return 0;

}
