library ieee;
use ieee.std_logic_1164.all;
 
entity and_gate is
    port (
        a : in  std_logic;
        b : in  std_logic;
        o : out std_logic
    );
end and_gate;

architecture rtl of and_gate is
    signal a_NAND_b : std_logic;
begin
    nand_1 : entity work.nand_gate port map(a, b, a_NAND_b);
    not_1  : entity work.not_gate port  map(a_NAND_b, o);
end rtl;