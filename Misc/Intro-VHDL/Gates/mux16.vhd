library ieee;
use ieee.std_logic_1164.all;
 
entity mux16 is
    port (
        a   : in  std_logic_vector(15 downto 0);
        b   : in  std_logic_vector(15 downto 0);
        sel : in  std_logic;
        o   : out std_logic_vector(15 downto 0)
    );
end mux16;
 
architecture rtl of mux16 is
    signal sel16, notSel, selA, selB : std_logic_vector(15 downto 0);
begin
    sel16 <= (0 => sel, others => sel);
    not16_1 : entity work.not16 port map(sel16, notSel);
    and16_1 : entity work.and16 port map(notSel, a, selA);
    and16_2 : entity work.and16 port map(sel16, b, selB);
    or16_1  : entity work.or16  port map(selA, selB, o);
end rtl;