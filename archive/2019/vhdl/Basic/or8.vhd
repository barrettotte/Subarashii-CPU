library ieee;
use ieee.std_logic_1164.all;
 
entity or8 is
    port (
        a : in  std_logic_vector(7 downto 0);
        b : in  std_logic_vector(7 downto 0);
        o : out std_logic_vector(7 downto 0)
    );
end or8;
 
architecture rtl of or8 is
    signal aNot, bNot, aNot_AND_bNot : std_logic_vector(7 downto 0);
begin
    not8_1 : entity work.not8 port map(a, aNot);
    not8_2 : entity work.not8 port map(b, bNot);
    and8_1 : entity work.and8 port map(aNot, bNot, aNot_AND_bNot);
    not8_3 : entity work.not8 port map(aNot_AND_bNot, o);
end rtl;