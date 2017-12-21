library ieee;
use ieee.std_logic_1164.all;

entity MEM_WB is
port(
	WB_in : in std_logic_vector(1 downto 0);
	data_in : in std_logic_vector(7 downto 0);
	addr_in : in std_logic_vector(7 downto 0);
	rtd_in : in std_logic_vector(4 downto 0);
	CLK : in std_logic;
	RST : in std_logic;
	RegWrite : out std_logic;
	MemToReg : out std_logic;
	data_out : out std_logic_vector(7 downto 0);
	addr_out : out std_logic_vector(7 downto 0);
	rtd_out : out std_logic_vector(4 downto 0)
);
end MEM_WB;

architecture MEM_WB_arch of MEM_WB is
begin
	process(CLK, RST)
	begin
		if RST = '0' then
			RegWrite <= '0';
			MemToReg <= '0';
			data_out <= "00000000";
			addr_out <= "00000000";
			rtd_out <= "00000";
		elsif (CLK'event and CLK = '1') then
			RegWrite <= WB_in(1);
			MemToReg <= WB_in(0);
			data_out <= data_in;
			addr_out <= addr_in;
			rtd_out <= rtd_in;
		end if;
	end process;
end MEM_WB_arch;