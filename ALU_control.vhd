library ieee;
use ieee.std_logic_1164.all;

entity ALU_control is
port(
	funct : in std_logic_vector(5 downto 0);
	ALUOp1 : in std_logic;
	ALUOp0 : in std_logic;
	ALU_operation : out std_logic_vector(2 downto 0)
);
end ALU_control;

architecture ALU_control_arch of ALU_control is
begin

	ALU_operation(2) <= (funct(1) and ALUOp1) or ALUOp0;
	ALU_operation(1) <= (not funct(2)) or (not ALUOp1);
	ALU_operation(0) <= (funct(3) or funct(0)) and ALUOp1;
	
end ALU_control_arch;