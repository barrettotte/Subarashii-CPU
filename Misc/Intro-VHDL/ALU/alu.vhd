library ieee;
use ieee.std_logic_1164.all;
 
entity alu is
    port (
        x  : in  std_logic_vector(15 downto 0);
        y  : in  std_logic_vector(15 downto 0);
        zx : in  std_logic;     -- Zero the x-input ?
        nx : in  std_logic;     -- Negate x-input ?
        zy : in  std_logic;     -- Zero the y-input ?
        ny : in  std_logic;     -- Negate x-input ?
        f  : in  std_logic;     -- compute (1) ? x+y : x&y
        no : in  std_logic;     -- negate out-output ?
        o  : out std_logic_vector(15 downto 0);
        zr : out std_logic;     -- (o=0) ? 1 : 0
        ng : out std_logic      -- (o<0) ? 1 : 0
    );
end alu;
 
architecture rtl of alu is
    signal notzr : std_logic;
    signal selx, sely, selxy : std_logic_vector(1 downto 0);
    signal notx, outx : std_logic_vector(15 downto 0);
    signal noty, outy : std_logic_vector(15 downto 0);
    signal sumxy, notsumxy, andxy, notandxy, tmpo : std_logic_vector(15 downto 0);
    signal zero16, one16 : std_logic_vector(15 downto 0);
begin
    zero16 <= "0000000000000000";
    one16  <= "1111111111111111";

    -- if(zx) x=0 , if(nx) x=~x
    selx(0) <= nx;
    selx(1) <= zx;
    not16_1     : entity work.not16     port map(x, notx);
    mux4way16_1 : entity work.mux4way16 port map(x, notx, zero16, one16, selx, outx);

    -- if(zy) y=0 , if(ny) y=~y
    sely(0) <= ny;
    sely(1) <= zy;
    not16_2     : entity work.not16     port map(y, noty);
    mux4way16_2 : entity work.mux4way16 port map(y, noty, zero16, one16, sely, outy);

    -- compute x+y and x&y
    add16_1 : entity work.add16 port map(outx, outy, sumxy);
    not16_3 : entity work.not16 port map(sumxy, notsumxy);
    and16_1 : entity work.and16 port map(outx, outy, andxy);
    not16_4 : entity work.not16 port map(andxy, notandxy);

    -- set o = (f) ? x+y : x&y
    selxy(0) <= no;
    selxy(1) <= f;
    mux4way16_3 : entity work.mux4way16 port map(andxy, notandxy, sumxy, notsumxy, selxy, tmpo);
    ng <= tmpo(15);
    o  <= tmpo;

    or16way_1 : entity work.or16way  port map(tmpo, notzr);
    not_1     : entity work.not_gate port map(notzr, zr);
end rtl;