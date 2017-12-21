library ieee;
use ieee.std_logic_1164.all;

entity path_router1x8 is
port(
	SEL : in std_logic_vector(4 downto 0);
	reg_write : in std_logic;
	EN0 : out std_logic;
	EN1 : out std_logic;
	EN2 : out std_logic;
	EN3 : out std_logic;
	EN4 : out std_logic;
	EN5 : out std_logic;
	EN6 : out std_logic;
	EN7 : out std_logic
);
end path_router1x8;

architecture path_router1x8_arch of path_router1x8 is
	
begin
	
	EN0 <= (not SEL(2)) and (not SEL(1)) and (not SEL(0)) and reg_write;
	EN1 <= (not SEL(2)) and (not SEL(1)) and SEL(0) and reg_write;
	EN2 <= (not SEL(2)) and SEL(1) and (not SEL(0)) and reg_write;
	EN3 <= (not SEL(2)) and SEL(1) and SEL(0) and reg_write;
	EN4 <= SEL(2) and (not SEL(1)) and (not SEL(0)) and reg_write;
	EN5 <= SEL(2) and (not SEL(1)) and SEL(0) and reg_write;
	EN6 <= SEL(2) and SEL(1) and (not SEL(0)) and reg_write;
	EN7 <= SEL(2) and SEL(1) and SEL(0) and reg_write;
	
end path_router1x8_arch;