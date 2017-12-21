library ieee;
use ieee.std_logic_1164.all;

entity control_sel is
port(
	sel : in std_logic;
	control_in : in std_logic_vector(9 downto 0);
	WB_out : out std_logic_vector(1 downto 0);
	M_out : out std_logic_vector(3 downto 0);
	EX_out : out std_logic_vector(3 downto 0)
);
end control_sel;

architecture control_sel_arch of control_sel is
begin
	WB_out <= control_in(9 downto 8) when sel = '0' else
				 "00";
	M_out <= control_in(7 downto 4) when sel = '0' else
				 "0000";
	EX_out <= control_in(3 downto 0) when sel = '0' else
				 "0000";
end control_sel_arch;