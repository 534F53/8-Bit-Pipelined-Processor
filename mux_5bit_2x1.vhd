library ieee;
use ieee.std_logic_1164.all;

entity mux_5bit_2x1 is
port(
	A : in std_logic_vector(4 downto 0);
	B : in std_logic_vector(4 downto 0);
	SEL : in std_logic;
	R : out std_logic_vector(4 downto 0)
);
end mux_5bit_2x1;

architecture mux_5bit_arch of mux_5bit_2x1 is
begin
	R <= A when SEL = '0' else
		  B;
end mux_5bit_arch;