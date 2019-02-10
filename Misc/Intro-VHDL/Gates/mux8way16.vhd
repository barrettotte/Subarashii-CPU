library ieee;
use ieee.std_logic_1164.all;
 
entity mux8way16 is
    port (
        a   : in  std_logic_vector(15 downto 0);
        b   : in  std_logic_vector(15 downto 0);
        c   : in  std_logic_vector(15 downto 0);
        d   : in  std_logic_vector(15 downto 0);
        e   : in  std_logic_vector(15 downto 0);
        f   : in  std_logic_vector(15 downto 0);
        g   : in  std_logic_vector(15 downto 0);
        h   : in  std_logic_vector(15 downto 0);
        sel : in  std_logic_vector( 2 downto 0);
        o   : out std_logic_vector(15 downto 0)
    );
end mux8way16;
 
architecture rtl of mux8way16 is
    signal abcd, efgh : std_logic_vector(15 downto 0);
begin
    mux4way16_1 : entity work.mux4way16 port map(a, b, c, d, sel(1 downto 0), abcd);
    mux4way16_2 : entity work.mux4way16 port map(e, f, g, h, sel(1 downto 0), efgh);
    mux16_1     : entity work.mux16     port map(abcd, efgh, sel(2), o);
end rtl;