library ieee;
use ieee.std_logic_1164.all;

entity sign_shorten_16 is
port(
	addr_instruction : in std_logic_vector(15 downto 0);
	branch_offset : out std_logic_vector(7 downto 0)
);
end sign_shorten_16;

architecture sign_shorten_16_arch of sign_shorten_16 is
begin

	branch_offset(7) <= addr_instruction(15);
	branch_offset(6 downto 0) <= addr_instruction(6 downto 0);

end sign_shorten_16_arch;