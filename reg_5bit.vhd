library ieee;
use ieee.std_logic_1164.all;

entity reg_5bit is
port(
	D : in std_logic_vector(4 downto 0);
	CLK : in std_logic;
	RST : in std_logic;
	Q : out std_logic_vector(4 downto 0)
);
end reg_5bit;

architecture reg_5bit_arch of reg_5bit is
begin
	process(CLK, RST)
	begin
		if RST = '0' then
			Q <= "00000";
		elsif (CLK'event and CLK = '1') then
				Q <= D;
		end if;
	end process;
end reg_5bit_arch;