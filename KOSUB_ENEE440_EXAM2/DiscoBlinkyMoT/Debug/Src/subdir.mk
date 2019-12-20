################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/main11.c 

S_UPPER_SRCS += \
../Src/MoTdevice_ExamFunctions.S \
../Src/MoTdevice_GreenLED08.S \
../Src/misc_utilities.S 

OBJS += \
./Src/MoTdevice_ExamFunctions.o \
./Src/MoTdevice_GreenLED08.o \
./Src/main11.o \
./Src/misc_utilities.o 

S_UPPER_DEPS += \
./Src/MoTdevice_ExamFunctions.d \
./Src/MoTdevice_GreenLED08.d \
./Src/misc_utilities.d 

C_DEPS += \
./Src/main11.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o: ../Src/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32L476VGTx -DSTM32L4 -DSTM32 -DDEBUG -I"/home/lkosub/ENEE440/KOSUB_ENEE440_EXAM2/DiscoBlinkyMoT/inc" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Src/%.o: ../Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32L476VGTx -DSTM32L4 -DSTM32 -DDEBUG -I"/home/lkosub/ENEE440/KOSUB_ENEE440_EXAM2/DiscoBlinkyMoT/inc" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


