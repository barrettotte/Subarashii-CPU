library ieee;
use ieee.std_logic_1164.all;
 
entity not16 is
    port (
        a : in  std_logic_vector(15 downto 0);
        o : out std_logic_vector(15 downto 0)
    );
end not16;
 
architecture rtl of not16 is
begin
    o <= a NAND a;
end rtl;