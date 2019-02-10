library ieee;
use ieee.std_logic_1164.all;
 
entity dmux is
    port (
        i   : in  std_logic;
        sel : in  std_logic;
        a   : out std_logic;
        b   : out std_logic
    );
end dmux;
 
architecture rtl of dmux is
    signal notSel, notSel_AND_i : std_logic;
begin
    not_1 : entity work.not_gate port map(sel, notSel);
    and_1 : entity work.and_gate port map(notSel, i, a);
    and_2 : entity work.and_gate port map(sel, i, b);
end rtl;