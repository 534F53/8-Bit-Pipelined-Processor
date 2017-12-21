library ieee;
use ieee.std_logic_1164.all;

entity IF_ID is
port(
	IF_ID_write : in std_logic;
	PC_in: in std_logic_vector(7 downto 0);
	instruction : in std_logic_vector(31 downto 0);
	flush : in std_logic;
	CLK : in std_logic;
	RST : in std_logic;
	PC_out : out std_logic_vector(7 downto 0);
	instru_type : out std_logic_vector(5 downto 0);
	rs : out std_logic_vector(4 downto 0);
	rt : out std_logic_vector(4 downto 0);
	rd : out std_logic_vector(4 downto 0);
	funct : out std_logic_vector(5 downto 0);
	addr_16bits : out std_logic_vector(15 downto 0);
	jump_addr : out std_logic_vector(25 downto 0)
);
end IF_ID;

architecture IF_ID_arch of IF_ID is

	signal instruction_output : std_logic_vector(31 downto 0);
	signal EN : std_logic;

begin

	EN <= IF_ID_write;
	instru_type <= instruction_output(31 downto 26);
	rs <= instruction_output(25 downto 21);
	rt <= instruction_output(20 downto 16);
	rd <= instruction_output(15 downto 11);
	funct <= instruction_output(5 downto 0);
	addr_16bits <= instruction_output(15 downto 0);
	jump_addr <= instruction_output(25 downto 0);
	
	process(CLK, RST, EN, flush)
	begin
		if RST = '0' then
			PC_out <= (others => '0');
			instruction_output <= (others => '0');
		elsif (CLK'event and CLK = '1') then
			if flush = '1' then
				PC_out <= (others => '0');
				instruction_output <= (others => '0');
			elsif (flush = '0' and EN = '1') then
				PC_out <= PC_in;
				instruction_output <= instruction;
			end if;
		end if;
	end process;
end IF_ID_arch;