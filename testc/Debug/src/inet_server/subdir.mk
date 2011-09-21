################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/inet_server/server.c 

OBJS += \
./src/inet_server/server.o 

C_DEPS += \
./src/inet_server/server.d 


# Each subdirectory must supply rules for building sources it contributes
src/inet_server/%.o: ../src/inet_server/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


