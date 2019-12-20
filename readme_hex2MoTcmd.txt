hex2MoTcmd.c wmh 2019-12-04 : generates MoT command strings from console input
usage: h2M <list of hex bytes, halfwords, or words of the command separated by spaces
Input is restricted to only only 2-,4- or 8-digit numbers using only hex charactes 0-9,A-F,a-f
		good input: 	'01 02 03 4567 89ABCDEF'	output: ':0102036745EFCDAB895E'				(quotes added)
		bad input:      '01 02 03 4567 9ABCDEF'		output:	'error: bad command arg 9ABCDEF'	(quotes added)

Executable h2M.exe compiled with MINGW-W64 gcc; source code should also compile on Linux or Mac. 
