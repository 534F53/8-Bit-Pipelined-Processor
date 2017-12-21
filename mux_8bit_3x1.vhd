library ieee;
use ieee.std_logic_1164.all;

entity mux_8bit_3x1 is
port(
	A : in std_logic_vector(7 downto 0);
	B : in std_logic_vector(7 downto 0);
	C : in std_logic_vector(7 downto 0);
	SEL : in std_logic_vector(1 downto 0);
	R : out std_logic_vector(7 downto 0)
);
end mux_8bit_3x1;

architecture mux_8bit3_arch of mux_8bit_3x1 is
begin
	R <= A when SEL = "00" else
		  B when SEL = "01" else
		  C;
end mux_8bit3_arch;