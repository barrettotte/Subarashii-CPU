library ieee;
use ieee.std_logic_1164.all;
 
entity dmux8way is
    port (
        i   : in  std_logic;
        sel : in  std_logic_vector(2 downto 0);
        a   : out std_logic;
        b   : out std_logic;
        c   : out std_logic;
        d   : out std_logic;
        e   : out std_logic;
        f   : out std_logic;
        g   : out std_logic;
        h   : out std_logic
    );
end dmux8way;
 
architecture rtl of dmux8way is
    signal out1, out2 : std_logic;
begin
    dmux_1 : entity work.dmux     port map(i, sel(2), out1, out2);
    dmux_2 : entity work.dmux4way port map(out1, sel(1 downto 0), a, b, c, d);
    dmux_3 : entity work.dmux4way port map(out2, sel(1 downto 0), e, f, g, h);
end rtl;