library ieee;
use ieee.std_logic_1164.all;

entity forward_unit is
port(
	ID_EX_rs : in std_logic_vector(4 downto 0);
	ID_EX_rt : in std_logic_vector(4 downto 0);
	EX_MEM_rd : in std_logic_vector(4 downto 0);
	EX_MEM_WB : in std_logic_vector(1 downto 0);
	MEM_WB_rd : in std_logic_vector(4 downto 0);
	MEM_WB_regWrite : in std_logic;
	forward_A : out std_logic_vector(1 downto 0);
	forward_B : out std_logic_vector(1 downto 0)
);
end forward_unit;

architecture forward_unit_arch of forward_unit is
	signal EX_hazard_A, EX_hazard_B, MEM_hazard_A, MEM_hazard_B : std_logic;
begin
	EX_hazard_A <= '1' when (EX_MEM_WB(1) = '1') and (EX_MEM_rd /= "00000") and (EX_MEM_rd = ID_EX_rs) else
						'0';
	EX_hazard_B <= '1' when (EX_MEM_WB(1) = '1') and (EX_MEM_rd /= "00000") and (EX_MEM_rd = ID_EX_rt) else
						'0';
	MEM_hazard_A <= '1' when (MEM_WB_regWrite = '1') 
						and (MEM_WB_rd /= "00000") 
						and (not ((EX_MEM_WB(1) = '1') and (EX_MEM_rd /= "00000") and (EX_MEM_rd /= ID_EX_rs))) 
						and (MEM_WB_rd = ID_EX_rs) else '0';
	MEM_hazard_B <= '1' when (MEM_WB_regWrite = '1') 
						and (MEM_WB_rd /= "00000") 
						and (not ((EX_MEM_WB(1) = '1') and (EX_MEM_rd /= "00000") and (EX_MEM_rd /= ID_EX_rt))) 
						and (MEM_WB_rd = ID_EX_rt) else '0';
	
	forward_A <= "01" when MEM_hazard_A = '1' else
					 "10" when EX_hazard_A = '1' else
					 "00";
	forward_B <= "01" when MEM_hazard_B = '1' else
					 "10" when EX_hazard_B = '1' else
					 "00";
	
end forward_unit_arch;