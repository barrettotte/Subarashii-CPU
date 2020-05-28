library ieee;
use ieee.std_logic_1164.all;
 
entity not8 is
    port (
        a : in  std_logic_vector(7 downto 0);
        o : out std_logic_vector(7 downto 0)
    );
end not8;
 
architecture rtl of not8 is
begin
    o <= a NAND a;
end rtl;