library ieee;
use ieee.std_logic_1164.all;

entity reg_8bit is
port(
	D : in std_logic_vector(7 downto 0);
	EN : in std_logic;
	CLK : in std_logic;
	RST : in std_logic;
	Q : out std_logic_vector(7 downto 0)
);
end reg_8bit;

architecture reg_8bit_arch of reg_8bit is
begin
	process(CLK, RST)
	begin
		if RST = '0' then
			Q <= (others => '0');
		elsif (CLK'event and CLK = '1') then
			if EN = '1' then
				Q <= D;
			end if;
		end if;
	end process;
end reg_8bit_arch;