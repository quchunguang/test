################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/alarm.c \
../src/daemon.c \
../src/dump.c \
../src/execve.c \
../src/fork.c \
../src/gettty.c \
../src/inet_server.c \
../src/lsr.c \
../src/mysleep.c \
../src/pipe.c \
../src/printenv.c \
../src/pthread.c \
../src/pthread_cond.c \
../src/pthread_exit.c \
../src/pthread_mutex.c \
../src/sem.c \
../src/setenv.c \
../src/sigmask.c \
../src/testc.c \
../src/testmmap.c \
../src/udp_server.c \
../src/unix_socket.c \
../src/waitpid.c \
../src/wrap.c 

OBJS += \
./src/alarm.o \
./src/daemon.o \
./src/dump.o \
./src/execve.o \
./src/fork.o \
./src/gettty.o \
./src/inet_server.o \
./src/lsr.o \
./src/mysleep.o \
./src/pipe.o \
./src/printenv.o \
./src/pthread.o \
./src/pthread_cond.o \
./src/pthread_exit.o \
./src/pthread_mutex.o \
./src/sem.o \
./src/setenv.o \
./src/sigmask.o \
./src/testc.o \
./src/testmmap.o \
./src/udp_server.o \
./src/unix_socket.o \
./src/waitpid.o \
./src/wrap.o 

C_DEPS += \
./src/alarm.d \
./src/daemon.d \
./src/dump.d \
./src/execve.d \
./src/fork.d \
./src/gettty.d \
./src/inet_server.d \
./src/lsr.d \
./src/mysleep.d \
./src/pipe.d \
./src/printenv.d \
./src/pthread.d \
./src/pthread_cond.d \
./src/pthread_exit.d \
./src/pthread_mutex.d \
./src/sem.d \
./src/setenv.d \
./src/sigmask.d \
./src/testc.d \
./src/testmmap.d \
./src/udp_server.d \
./src/unix_socket.d \
./src/waitpid.d \
./src/wrap.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


