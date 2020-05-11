library ieee;
use ieee.std_logic_1164.all;
 
entity xnor_gate is
    port (
        a : in  std_logic;
        b : in  std_logic;
        o : out std_logic
    );
end xnor_gate;
 
architecture rtl of xnor_gate is
    signal a_XOR_b : std_logic;
begin
    xor_1 : entity work.xor_gate port map(a, b, a_XOR_b);
    not_1 : entity work.not_gate port map(a_XOR_b, o);
end rtl;