library ieee;
use ieee.std_logic_1164.all;

entity EX_MEM is
port(
	WB_in : in std_logic_vector(1 downto 0);
	M_in : in std_logic_vector(3 downto 0);
	ALU_in : in std_logic_vector(7 downto 0);
	data_in : in std_logic_vector(7 downto 0);
	rtd_in : in std_logic_vector(4 downto 0);
	CLK : in std_logic;
	RST : in std_logic;
	WB_out : out std_logic_vector(1 downto 0);
	MemWrite : out std_logic;
	MemRead : out std_logic;
	ALU_out : out std_logic_vector(7 downto 0);
	data_out : out std_logic_vector(7 downto 0);
	rtd_out : out std_logic_vector(4 downto 0)
);
end EX_MEM;

architecture EX_MEM_arch of EX_MEM is
begin
	process(CLK, RST)
	begin
		if RST = '0' then
			WB_out <= "00";
			MemWrite <= '0';
			MemRead <= '0';
			ALU_out <= "00000000";
			data_out <= "00000000";
			rtd_out <= "00000";
		elsif (CLK'event and CLK = '1') then
			WB_out <= WB_in;
			MemWrite <= M_in(3);
			MemRead <= M_in(2);
			ALU_out <= ALU_in;
			data_out <= data_in;
			rtd_out <= rtd_in;
		end if;
	end process;
end EX_MEM_arch;