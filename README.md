# 8-Bit Pipelined Processor #

A 5-stage pipelined 8-bit processor.  
Execute 32-bit MIPS (assembly) instructions from *instruction_rom*.  
Hazard handling logic included.
![alt text](https://github.com/534F53/8-bit-pipelined-processor/blob/master/top.jpg)

## Initial Memory Values ##
[Data RAM](https://github.com/534F53/8-bit-pipelined-processor/blob/master/data_ram.mif)  
	0    :   55;  
	1    :   AA;  
  
[Instruction ROM](https://github.com/534F53/8-bit-pipelined-processor/blob/master/instruction_rom.mif)  
	0    :   8C020000;  -- lw $2, 0  
	1    :   8C030001;  -- lw $3, 1  
	2    :   00620802;  -- sub $1, $2, $3  
	3    :   00232005;  -- or $4, $1, $3  
	4    :   AC040003;  -- sw $4, 3  
	5    :   00430800;  -- add $1, $2, $3  
	6    :   AC010004;  -- sw $1, 4  
	7    :   AC010004;  -- sw $1, 4  
	8    :   8C020003;  -- lw $2, 3  
	9    :   8C030004;  -- lw $3, 4  
	10    :   0800000B;  -- j 11  
	11   :   1021FFF5;  -- beq $1, $1, -44  
	12   :   1022FFFE;  -- beq $1, $2, -8  

## Project Setup ##
* Import files into Quartus II
* Use ModelSim to execute the test bench instructions
