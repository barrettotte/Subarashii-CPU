library ieee;
use ieee.std_logic_1164.all;
 
entity dmux4way is
    port (
        i   : in  std_logic;
        sel : in  std_logic_vector(1 downto 0);
        a   : out std_logic;
        b   : out std_logic;
        c   : out std_logic;
        d   : out std_logic
    );
end dmux4way;
 
architecture rtl of dmux4way is
    signal out1, out2 : std_logic;
begin
    dmux_1 : entity work.dmux port map(i, sel(1), out1, out2);
    dmux_2 : entity work.dmux port map(out1, sel(0), a, b);
    dmux_3 : entity work.dmux port map(out2, sel(0), c, d);
end rtl;