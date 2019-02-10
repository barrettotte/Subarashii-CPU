library ieee;
use ieee.std_logic_1164.all;
 
entity or16way is
    port (
        a : in  std_logic_vector(15 downto 0);
        o : out std_logic
    );
end or16way;
 
architecture rtl of or16way is
    signal r, l : std_logic;
begin
    or8way_1 : entity work.or8way  port map(a( 7 downto 0), r);
    or8way_2 : entity work.or8way  port map(a(15 downto 8), l);
    or_1     : entity work.or_gate port map(r, l, o);
end rtl;