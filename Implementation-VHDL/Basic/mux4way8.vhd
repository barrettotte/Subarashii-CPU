library ieee;
use ieee.std_logic_1164.all;
 
entity mux4way8 is
    port (
        a   : in  std_logic_vector(7 downto 0);
        b   : in  std_logic_vector(7 downto 0);
        c   : in  std_logic_vector(7 downto 0);
        d   : in  std_logic_vector(7 downto 0);
        sel : in  std_logic_vector(1 downto 0);
        o   : out std_logic_vector(7 downto 0)
    );
end mux4way8;
 
architecture rtl of mux4way8 is
    signal  out_ab, out_cd : std_logic_vector(7 downto 0);
begin
    mux8_1 : entity work.mux8 port map(a, b, sel(0), out_ab);
    mux8_2 : entity work.mux8 port map(c, d, sel(0), out_cd);
    mux8_3 : entity work.mux8 port map(out_ab, out_cd, sel(1), o);
end rtl;