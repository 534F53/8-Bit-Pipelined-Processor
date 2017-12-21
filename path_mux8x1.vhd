library ieee;
use ieee.std_logic_1164.all;

entity path_mux8x1 is
port(
	D0 : in std_logic_vector(7 downto 0);
	D1 : in std_logic_vector(7 downto 0);
	D2 : in std_logic_vector(7 downto 0);
	D3 : in std_logic_vector(7 downto 0);
	D4 : in std_logic_vector(7 downto 0);
	D5 : in std_logic_vector(7 downto 0);
	D6 : in std_logic_vector(7 downto 0);
	D7 : in std_logic_vector(7 downto 0);
	SEL : in std_logic_vector(4 downto 0);
	Q : out std_logic_vector(7 downto 0)
	
);
end path_mux8x1;

architecture path_mux8x1_arch of path_mux8x1 is
	
	signal enable : std_logic_vector(7 downto 0);
	
begin
	
	enable(0) <= (not SEL(2)) and (not SEL(1)) and (not SEL(0));
	enable(1) <= (not SEL(2)) and (not SEL(1)) and SEL(0);
	enable(2) <= (not SEL(2)) and SEL(1) and (not SEL(0));
	enable(3) <= (not SEL(2)) and SEL(1) and SEL(0);
	enable(4) <= SEL(2) and (not SEL(1)) and (not SEL(0));
	enable(5) <= SEL(2) and (not SEL(1)) and SEL(0);
	enable(6) <= SEL(2) and SEL(1) and (not SEL(0));
	enable(7) <= SEL(2) and SEL(1) and SEL(0);
	
	Q <= D0 when enable(0) = '1' else
		  D1 when enable(1) = '1' else
		  D2 when enable(2) = '1' else
		  D3 when enable(3) = '1' else
		  D4 when enable(4) = '1' else
		  D5 when enable(5) = '1' else
		  D6 when enable(6) = '1' else
		  D7;
	
end path_mux8x1_arch;