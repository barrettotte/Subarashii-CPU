library ieee;
use ieee.std_logic_1164.all;
 
entity or_gate is
    port (
        a : in  std_logic;
        b : in  std_logic;
        o : out std_logic
    );
end or_gate;
 
architecture rtl of or_gate is
    signal aNot, bNot, aNot_AND_bNot : std_logic;
begin
    not_1 : entity work.not_gate port map(a, aNot);
    not_2 : entity work.not_gate port map(b, bNot);
    and_1 : entity work.and_gate port map(aNot, bNot, aNot_AND_bNot);
    not_3 : entity work.not_gate port map(aNot_AND_bNot, o);
end rtl;