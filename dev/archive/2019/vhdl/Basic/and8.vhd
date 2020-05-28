library ieee;
use ieee.std_logic_1164.all;
 
entity and8 is
    port (
        a : in  std_logic_vector(7 downto 0);
        b : in  std_logic_vector(7 downto 0);
        o : out std_logic_vector(7 downto 0)
    );
end and8;
 
architecture rtl of and8 is
    signal a_NAND_b : std_logic_vector(7 downto 0);
begin
    a_NAND_b <= a NAND b;
    not8_1 : entity work.not8 port map(a_NAND_b, o);
end rtl;