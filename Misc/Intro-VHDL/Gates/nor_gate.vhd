library ieee;
use ieee.std_logic_1164.all;
 
entity nor_gate is
    port (
        a : in  std_logic;
        b : in  std_logic;
        o : out std_logic
    );
end nor_gate;
 
architecture rtl of nor_gate is
    signal a_OR_b : std_logic;
begin
    or_1  : entity work.or_gate  port map(a, b, a_OR_b);
    not_1 : entity work.not_gate port map(a_OR_b, o);
end rtl; 