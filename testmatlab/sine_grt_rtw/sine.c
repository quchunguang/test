/*
 * sine.c
 *
 * Code generation for model "sine".
 *
 * Model version              : 1.2
 * Simulink Coder version : 8.2 (R2012a) 29-Dec-2011
 * C source code generated on : Sat Apr 14 10:37:23 2012
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: 32-bit Generic
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */
#include "sine.h"
#include "sine_private.h"

/* Block signals (auto storage) */
BlockIO_sine sine_B;

/* Block states (auto storage) */
D_Work_sine sine_DWork;

/* Real-time model */
RT_MODEL_sine sine_M_;
RT_MODEL_sine *const sine_M = &sine_M_;

/* Model step function */
void sine_step(void)
{
  /* Sin: '<Root>/Sine Wave' */
  sine_B.SineWave = sin(sine_P.SineWave_Freq * sine_M->Timing.t[0] +
                        sine_P.SineWave_Phase) * sine_P.SineWave_Amp +
    sine_P.SineWave_Bias;

  /* Matfile logging */
  rt_UpdateTXYLogVars(sine_M->rtwLogInfo, (sine_M->Timing.t));

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++sine_M->Timing.clockTick0)) {
    ++sine_M->Timing.clockTickH0;
  }

  sine_M->Timing.t[0] = sine_M->Timing.clockTick0 * sine_M->Timing.stepSize0 +
    sine_M->Timing.clockTickH0 * sine_M->Timing.stepSize0 * 4294967296.0;

  {
    /* Update absolute timer for sample time: [0.2s, 0.0s] */
    /* The "clockTick1" counts the number of times the code of this task has
     * been executed. The resolution of this integer timer is 0.2, which is the step size
     * of the task. Size of "clockTick1" ensures timer will not overflow during the
     * application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick1 and the high bits
     * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
     */
    sine_M->Timing.clockTick1++;
    if (!sine_M->Timing.clockTick1) {
      sine_M->Timing.clockTickH1++;
    }
  }
}

/* Model initialize function */
void sine_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)sine_M, 0,
                sizeof(RT_MODEL_sine));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&sine_M->solverInfo, &sine_M->Timing.simTimeStep);
    rtsiSetTPtr(&sine_M->solverInfo, &rtmGetTPtr(sine_M));
    rtsiSetStepSizePtr(&sine_M->solverInfo, &sine_M->Timing.stepSize0);
    rtsiSetErrorStatusPtr(&sine_M->solverInfo, (&rtmGetErrorStatus(sine_M)));
    rtsiSetRTModelPtr(&sine_M->solverInfo, sine_M);
  }

  rtsiSetSimTimeStep(&sine_M->solverInfo, MAJOR_TIME_STEP);
  rtsiSetSolverName(&sine_M->solverInfo,"FixedStepDiscrete");

  /* Initialize timing info */
  {
    int_T *mdlTsMap = sine_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    mdlTsMap[1] = 1;
    sine_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    sine_M->Timing.sampleTimes = (&sine_M->Timing.sampleTimesArray[0]);
    sine_M->Timing.offsetTimes = (&sine_M->Timing.offsetTimesArray[0]);

    /* task periods */
    sine_M->Timing.sampleTimes[0] = (0.0);
    sine_M->Timing.sampleTimes[1] = (0.2);

    /* task offsets */
    sine_M->Timing.offsetTimes[0] = (0.0);
    sine_M->Timing.offsetTimes[1] = (0.0);
  }

  rtmSetTPtr(sine_M, &sine_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = sine_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    mdlSampleHits[1] = 1;
    sine_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(sine_M, 10.0);
  sine_M->Timing.stepSize0 = 0.2;

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    sine_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(sine_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(sine_M->rtwLogInfo, (NULL));
    rtliSetLogT(sine_M->rtwLogInfo, "tout");
    rtliSetLogX(sine_M->rtwLogInfo, "");
    rtliSetLogXFinal(sine_M->rtwLogInfo, "");
    rtliSetSigLog(sine_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(sine_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(sine_M->rtwLogInfo, 0);
    rtliSetLogMaxRows(sine_M->rtwLogInfo, 1000);
    rtliSetLogDecimation(sine_M->rtwLogInfo, 1);
    rtliSetLogY(sine_M->rtwLogInfo, "");
    rtliSetLogYSignalInfo(sine_M->rtwLogInfo, (NULL));
    rtliSetLogYSignalPtrs(sine_M->rtwLogInfo, (NULL));
  }

  sine_M->solverInfoPtr = (&sine_M->solverInfo);
  sine_M->Timing.stepSize = (0.2);
  rtsiSetFixedStepSize(&sine_M->solverInfo, 0.2);
  rtsiSetSolverMode(&sine_M->solverInfo, SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  (void) memset(((void *) &sine_B), 0,
                sizeof(BlockIO_sine));

  /* states (dwork) */
  (void) memset((void *)&sine_DWork, 0,
                sizeof(D_Work_sine));

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(sine_M->rtwLogInfo, 0.0, rtmGetTFinal(sine_M),
    sine_M->Timing.stepSize0, (&rtmGetErrorStatus(sine_M)));

  /* Initialize Sizes */
  sine_M->Sizes.numContStates = (0);   /* Number of continuous states */
  sine_M->Sizes.numY = (0);            /* Number of model outputs */
  sine_M->Sizes.numU = (0);            /* Number of model inputs */
  sine_M->Sizes.sysDirFeedThru = (0);  /* The model is not direct feedthrough */
  sine_M->Sizes.numSampTimes = (2);    /* Number of sample times */
  sine_M->Sizes.numBlocks = (2);       /* Number of blocks */
  sine_M->Sizes.numBlockIO = (1);      /* Number of block outputs */
  sine_M->Sizes.numBlockPrms = (4);    /* Sum of parameter "widths" */
}

/* Model terminate function */
void sine_terminate(void)
{
}
