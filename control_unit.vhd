library ieee;
use ieee.std_logic_1164.all;

entity control_unit is
port(
	instruction : in std_logic_vector(5 downto 0);
	ctrl_out : out std_logic_vector(9 downto 0);
	branch_out : out std_logic;
	jump_out : out std_logic
);
end control_unit;

architecture control_unit_arch of control_unit is
	
	signal R_format, lw, sw, beq : std_logic;
	signal RegDst, ALUOp1, ALUOp0, ALUSrc : std_logic;
	signal Branch, Jump, MemRead, MemWrite : std_logic;
	signal RegWrite, MemtoReg : std_logic;
	
begin

	R_format <= (not instruction(5)) and (not instruction(4)) and (not instruction(3)) and
					(not instruction(2)) and (not instruction(1)) and (not instruction(0));
	lw <= instruction(5) and (not instruction(4)) and (not instruction(3)) and
			(not instruction(2)) and instruction(1) and instruction(0);
	sw <= instruction(5) and (not instruction(4)) and instruction(3) and
			(not instruction(2)) and instruction(1) and instruction(0);
	beq <= (not instruction(5)) and (not instruction(4)) and (not instruction(3)) and
			 instruction(2) and (not instruction(1)) and (not instruction(0));
	Jump <= (not instruction(5)) and (not instruction(4)) and (not instruction(3)) and
			  (not instruction(2)) and instruction(1) and (not instruction(0));
			 
	RegDst <= R_format;
	Branch <= beq;
	MemRead <= lw;
	MemtoReg <= lw;
	MemWrite <= sw;
	ALUSrc <= lw or sw;
	RegWrite <= R_format or lw;
	ALUOp1 <= R_format;
	ALUOp0 <= beq;
	
	ctrl_out(9) <= RegWrite;
	ctrl_out(8) <= MemtoReg;
	ctrl_out(7) <= MemWrite;
	ctrl_out(6) <= MemRead;
	ctrl_out(5) <= Jump;
	ctrl_out(4) <= Branch;
	ctrl_out(3) <= ALUSrc;
	ctrl_out(2) <= ALUOp1;
	ctrl_out(1) <= ALUOp0;
	ctrl_out(0) <= RegDst;
	
	branch_out <= Branch;
	jump_out <= Jump;
	
end control_unit_arch;