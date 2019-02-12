library ieee;
use ieee.std_logic_1164.all;
 
entity xor_gate is
    port (
        a : in  std_logic;
        b : in  std_logic;
        o : out std_logic
    );
end xor_gate;
 
architecture rtl of xor_gate is
    signal a_OR_b, a_NAND_b : std_logic;
begin
    nand_1 : entity work.nand_gate port map(a, b, a_NAND_b);
    or_1   : entity work.or_gate port map(a, b, a_OR_b);
    and_1  : entity work.and_gate port map(a_OR_b, a_NAND_b, o);
end rtl;