library ieee;
use ieee.std_logic_1164.all;

entity comparator_8bit is
port(
	data1 : in std_logic_vector(7 downto 0);
	data2 : in std_logic_vector(7 downto 0);
	zero : out std_logic;
	data1_out : out std_logic_vector(7 downto 0);
	data2_out : out std_logic_vector(7 downto 0)
);
end comparator_8bit;

architecture comparator_arch of comparator_8bit is
begin
	data1_out <= data1;
	data2_out <= data2;
	zero <= (not (data1(7) xor data2(7))) and
	        (not (data1(6) xor data2(6))) and
	        (not (data1(5) xor data2(5))) and
	        (not (data1(4) xor data2(4))) and
	        (not (data1(3) xor data2(3))) and
	        (not (data1(2) xor data2(2))) and
	        (not (data1(1) xor data2(1))) and
	        (not (data1(0) xor data2(0)));
end comparator_arch;