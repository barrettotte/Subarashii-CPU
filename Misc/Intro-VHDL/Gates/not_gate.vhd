library ieee;
use ieee.std_logic_1164.all;
 
entity not_gate is
    port (
        a : in  std_logic;
        o : out std_logic
    );
end not_gate;
 
architecture rtl of not_gate is
begin
    nand_1  : entity work.nand_gate  port map(a, a, o);
end rtl;