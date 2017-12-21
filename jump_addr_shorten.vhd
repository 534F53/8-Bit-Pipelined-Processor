library ieee;
use ieee.std_logic_1164.all;

entity jump_addr_shorten is
port(
	jump_addr_26 : in std_logic_vector(25 downto 0);
	jump_addr_8 : out std_logic_vector(7 downto 0)
);
end jump_addr_shorten;

architecture jump_addr_shorten_arch of jump_addr_shorten is
begin
	jump_addr_8 <= jump_addr_26(7 downto 0);
end jump_addr_shorten_arch;