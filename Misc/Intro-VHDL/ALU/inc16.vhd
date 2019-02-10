library ieee;
use ieee.std_logic_1164.all;
 
entity inc16 is
    port (
        a : in  std_logic_vector(15 downto 0);
        o : out std_logic_vector(15 downto 0)
    );
end inc16;
 
architecture rtl of inc16 is
    signal one : std_logic_vector(15 downto 0);
begin
    one <= "0000000000000001";
    add16_1 : entity work.add16 port map(a, one, o);
end rtl;