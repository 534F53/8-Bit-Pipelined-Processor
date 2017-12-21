library ieee;
use ieee.std_logic_1164.all;

entity ALU is
port(
	in_a : in std_logic_vector(7 downto 0);
	in_b : in std_logic_vector(7 downto 0);
	control : in std_logic_vector(2 downto 0);
	output : out std_logic_vector(7 downto 0);
	zero : out std_logic
);
end ALU;

architecture ALU_arch of ALU is
	
	component adder_8bit is 
	port(
		x_in : in std_logic_vector(7 downto 0);
		y_in : in std_logic_vector(7 downto 0);
		carry_in : in std_logic;
		sum : out std_logic_vector(7 downto 0)
	);
	end component;
	
	signal or_result, and_result, add_result, sub_result, result : std_logic_vector(7 downto 0);
	signal b_1scomplement : std_logic_vector(7 downto 0);
	
begin
	
	b_1scomplement <= "11111111" xor in_b;
	
	or_result <= in_a or in_b;
	and_result <= in_a and in_b;
	adder : adder_8bit port map(in_a, in_b, '0', add_result);
	suber : adder_8bit port map(in_a, b_1scomplement, '1', sub_result);
	
	result <= and_result when control = "000" else
				 or_result when control = "001" else 
				 add_result when control = "010" else
				 sub_result when control = "110";
				 
	output <= result;
	zero <= '1' when result = "00000000" else
			  '0';
	
end ALU_arch;