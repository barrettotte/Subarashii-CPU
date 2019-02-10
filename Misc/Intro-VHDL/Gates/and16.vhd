library ieee;
use ieee.std_logic_1164.all;
 
entity and16 is
    port (
        a : in  std_logic_vector(15 downto 0);
        b : in  std_logic_vector(15 downto 0);
        o : out std_logic_vector(15 downto 0)
    );
end and16;
 
architecture rtl of and16 is
    signal a_NAND_b : std_logic_vector(15 downto 0);
begin
    a_NAND_b <= a NAND b;
    not16_1 : entity work.not16 port map(a_NAND_b, o);
end rtl;