library ieee;
use ieee.std_logic_1164.all;
 
entity mux is
    port (
        a   : in  std_logic;
        b   : in  std_logic;
        sel : in  std_logic;
        o   : out std_logic
    );
end mux;
 
architecture rtl of mux is
    signal notSel, selA, selB : std_logic;
begin
    not_1 : entity work.not_gate port map(sel, notSel);
    and_1 : entity work.and_gate port map(notSel, a, selA);
    and_2 : entity work.and_gate port map(sel, b, selB);
    or_1  : entity work.or_gate  port map(selA, selB, o);
end rtl;