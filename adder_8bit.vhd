library ieee;
use ieee.std_logic_1164.ALL;

entity adder_8bit is 
port(
	x_in : in std_logic_vector(7 downto 0);
	y_in : in std_logic_vector(7 downto 0);
	carry_in : in std_logic;
	sum : out std_logic_vector(7 downto 0)
);
end adder_8bit;

architecture adder_8bit_arch of adder_8bit is

signal half_sum : std_logic_vector(7 downto 0);
signal c_g : std_logic_vector(7 downto 0);
signal c_p : std_logic_vector(7 downto 0);
signal c_i :std_logic_vector(7 downto 1);

begin
    half_sum <= x_in xor y_in;
	 
    c_g <= x_in and y_in;
    c_p <= x_in or y_in;
	 
	 c_i(1) <= c_g(0) or (c_p(0) and carry_in);
	 c_i(2) <= c_g(1) or (c_p(1) and c_i(1));
	 c_i(3) <= c_g(2) or (c_p(2) and c_i(2));
	 c_i(4) <= c_g(3) or (c_p(3) and c_i(3));
	 c_i(5) <= c_g(4) or (c_p(4) and c_i(4));
	 c_i(6) <= c_g(5) or (c_p(5) and c_i(5));
	 c_i(7) <= c_g(6) or (c_p(6) and c_i(6));

    sum(0) <= half_sum(0) xor carry_in;
    sum(7 downto 1) <= half_sum(7 downto 1) xor c_i(7 downto 1);
end adder_8bit_arch;