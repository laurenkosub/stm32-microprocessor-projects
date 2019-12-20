################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../Src/LL_device/stm32L476Disco_GreenLED.S \
../Src/LL_device/stm32L476Disco_RedLED.S 

OBJS += \
./Src/LL_device/stm32L476Disco_GreenLED.o \
./Src/LL_device/stm32L476Disco_RedLED.o 

S_UPPER_DEPS += \
./Src/LL_device/stm32L476Disco_GreenLED.d \
./Src/LL_device/stm32L476Disco_RedLED.d 


# Each subdirectory must supply rules for building sources it contributes
Src/LL_device/%.o: ../Src/LL_device/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32L476VGTx -DSTM32L4 -DSTM32 -DDEBUG -I"/home/lkosub/ENEE440/KOSUB_ENEE440_EXAM2/DiscoBlinkyMoT/inc" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


