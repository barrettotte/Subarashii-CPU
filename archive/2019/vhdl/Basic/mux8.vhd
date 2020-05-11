library ieee;
use ieee.std_logic_1164.all;
 
entity mux8 is
    port (
        a   : in  std_logic_vector(7 downto 0);
        b   : in  std_logic_vector(7 downto 0);
        sel : in  std_logic;
        o   : out std_logic_vector(7 downto 0)
    );
end mux8;
 
architecture rtl of mux8 is
    signal sel8, notSel, selA, selB : std_logic_vector(7 downto 0);
begin
    sel8 <= (0 => sel, others => sel);
    not8_1 : entity work.not8 port map(sel8, notSel);
    and8_1 : entity work.and8 port map(notSel, a, selA);
    and8_2 : entity work.and8 port map(sel8, b, selB);
    or8_1  : entity work.or8  port map(selA, selB, o);
end rtl;