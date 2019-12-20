readme_TIM5_DAC2_PA5.txt wmh 2019-12-07 : about the triangle-wave generator

The attached project define a MoT device in MoTdevice_TriangleWaveGen01.S which provides a convenient way 
to generate inputs to test your ADC functions from the MoT serial console. The samples below show the
h2M command generator distributed previously being used to create various triangle waves. 

The command format is:
	02			: the device number (probably conflicts with your device numbering but easy to change)
	00			: the function number (placeholder only -- the device has a single command so ignores this)
	xxxxxxxx	: 8-digit hex value of the TIM5 ARR value to be used to divide the 48MHz primary clock.
				(Don't use values lower than 0x5f=95. 5F proves the DAC with a 500kHz clock which is the max allowed)
	xx			: 2 digit hex value. This is a code related to the amplitude of the triangle wave (see pg 639 of RM0351 about MAMP2[3:0])
	xxxx		: 4 digit hex value: This is the offset from zero of the triangle wave. If the offset plus the wave amplitude
				selected with MAMP2[3:0] exceeds 0xFFF then the wave gets very wacky and un-triangular.  
				
Examples of different commands (see attached pictures)
	# 1) leaves everything at initial settings: TIM5=500kHz, ADC2 triangle wave 000 to FFF (no bits masked)
	F:\_umd\_2019-09-01\ENEE440_F19\_work\1206_DAC_MoT_device>h2M 02 00 0000005f 0B 0000
	cmd string: :02005F0000000B000094
	==> no change form default in waveform

	# 2) changes amplitude: TIM5=500kHz, ADC2 triangle wave 000 to 7FF (bit 11 masked -- see manual pg 639 for MAMP2[3:0])
	F:\_umd\_2019-09-01\ENEE440_F19\_work\1206_DAC_MoT_device>h2M 02 00 0000005f 0A 0000
	cmd string: :02005F0000000A000095
	==> wave is 1/2 height and 2x frequency

	# 3) change DC level: TIM5=500kHz, ADC2 triangle wave 400 to BFF
	F:\_umd\_2019-09-01\ENEE440_F19\_work\1206_DAC_MoT_device>h2M 02 00 0000005f 0A 0400
	cmd string: :02005F0000000A000491
	==> wave moves up to middle of scale

	# 4) change wave frequency
	F:\_umd\_2019-09-01\ENEE440_F19\_work\1206_DAC_MoT_device>h2M 02 00 000000BF 0A 0400
	cmd string: :0200BF0000000A000431
	==> wave period is doubled