library ieee;
use ieee.std_logic_1164.all;

entity ID_EX is
port(
	WB_in : in std_logic_vector(1 downto 0);
	M_in : in std_logic_vector(3 downto 0);
	EX_in : in std_logic_vector(3 downto 0);
	data1_in : in std_logic_vector(7 downto 0);
	data2_in : in std_logic_vector(7 downto 0);
	rs_in : in std_logic_vector(4 downto 0);
	rt_in : in std_logic_vector(4 downto 0);
	rd_in : in std_logic_vector(4 downto 0);
	funct_in : in std_logic_vector(5 downto 0);
	branch_off_in : in std_logic_vector(7 downto 0);
	CLK : in std_logic;
	RST : in std_logic;
	WB_out : out std_logic_vector(1 downto 0);
	M_out : out std_logic_vector(3 downto 0);
	ALUSrc : out std_logic;
	ALUOp1 : out std_logic;
	ALUOp0 : out std_logic;
	RegDst : out std_logic;
	data1_out : out std_logic_vector(7 downto 0);
	data2_out : out std_logic_vector(7 downto 0);
	rs_out : out std_logic_vector(4 downto 0);
	rt_out : out std_logic_vector(4 downto 0);
	rd_out : out std_logic_vector(4 downto 0);
	funct_out : out std_logic_vector(5 downto 0);
	branch_off_out : out std_logic_vector(7 downto 0)
);
end ID_EX;

architecture ID_EX_arch of ID_EX is
begin

	process(CLK, RST)
	begin
		if RST = '0' then
			WB_out <= "00";
			M_out <= "0000";
			ALUSrc <= '0';
			ALUOp1 <= '0';
			ALUOp0 <= '0';
			RegDst <= '0';
			data1_out <= "00000000";
			data2_out <= "00000000";
			rs_out <= "00000";
			rt_out <= "00000";
			rd_out <= "00000";
			funct_out <= "000000";
			branch_off_out <= "00000000";
		elsif (CLK'event and CLK = '1') then
			WB_out <= WB_in;
			M_out <= M_in;
			ALUSrc <= EX_in(3);
			ALUOp1 <= EX_in(2);
			ALUOp0 <= EX_in(1);
			RegDst <= EX_in(0);
			data1_out <= data1_in;
			data2_out <= data2_in;
			rs_out <= rs_in;
			rt_out <= rt_in;
			rd_out <= rd_in;
			funct_out <= funct_in;
			branch_off_out <= branch_off_in;
		end if;
	end process;
	
end ID_EX_arch;