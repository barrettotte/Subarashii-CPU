library ieee;
use ieee.std_logic_1164.all;
 
entity nand_gate is
    port (
        a : in  std_logic;
        b : in  std_logic;
        o : out std_logic
    );
end nand_gate;
 
architecture rtl of nand_gate is
begin
    o <= a NAND b;
end rtl;