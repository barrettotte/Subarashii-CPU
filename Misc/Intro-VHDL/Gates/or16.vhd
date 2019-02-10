library ieee;
use ieee.std_logic_1164.all;
 
entity or16 is
    port (
        a : in  std_logic_vector(15 downto 0);
        b : in  std_logic_vector(15 downto 0);
        o : out std_logic_vector(15 downto 0)
    );
end or16;
 
architecture rtl of or16 is
    signal aNot, bNot, aNot_AND_bNot : std_logic_vector(15 downto 0);
begin
    not16_1 : entity work.not16 port map(a, aNot);
    not16_2 : entity work.not16 port map(b, bNot);
    and16_1 : entity work.and16 port map(aNot, bNot, aNot_AND_bNot);
    not16_3 : entity work.not16 port map(aNot_AND_bNot, o);
end rtl;