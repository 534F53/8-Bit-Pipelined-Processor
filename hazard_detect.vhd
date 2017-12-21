library ieee;
use ieee.std_logic_1164.all;

entity hazard_detect is
port(
	ID_EX_M : in std_logic_vector(3 downto 0);
	ID_EX_rt : in std_logic_vector(4 downto 0);
	IF_ID_rs : in std_logic_vector(4 downto 0);
	IF_ID_rt : in std_logic_vector(4 downto 0);
	stall : out std_logic
);
end hazard_detect;

architecture hazard_detect_arch of hazard_detect is
begin
	stall <= '1' when ((ID_EX_M(2) = '1') and ((ID_EX_rt = IF_ID_rs) or (ID_EX_rt = IF_ID_rt))) else
				'0';
end hazard_detect_arch;