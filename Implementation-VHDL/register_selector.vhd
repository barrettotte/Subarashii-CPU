-- 8 x 8-bit register selector, essentially an 8x8 MUX for my registers --

library ieee;
use ieee.std_logic_1164.all;

entity register_selector is
    port (
        en    : in  std_logic;
        sel   : in  std_logic_vector(2 downto 0); -- 000=A, ... , 111=H
        clk   : in  std_logic;
        a     : in  std_logic_vector(7 downto 0);
        b     : in  std_logic_vector(7 downto 0);
        c     : in  std_logic_vector(7 downto 0);
        d     : in  std_logic_vector(7 downto 0);
        e     : in  std_logic_vector(7 downto 0);
        f     : in  std_logic_vector(7 downto 0);
        g     : in  std_logic_vector(7 downto 0);
        h     : in  std_logic_vector(7 downto 0);
        o     : out std_logic_vector(7 downto 0);  -- 00000001, ... , 10000000 
    );
end register_selector;

architecture rtl of register_selector is
    signal not_o std_logic_vector(7 downto 0);
begin
    IC_74LS151_0 : entity work.IC_74LS151 port map(a, sel, en(0), o(0), not not_o(0));
    IC_74LS151_1 : entity work.IC_74LS151 port map(b, sel, en(1), o(1), not not_o(1));
    IC_74LS151_2 : entity work.IC_74LS151 port map(c, sel, en(2), o(2), not not_o(2));
    IC_74LS151_3 : entity work.IC_74LS151 port map(d, sel, en(3), o(3), not not_o(3));
    IC_74LS151_4 : entity work.IC_74LS151 port map(e, sel, en(4), o(4), not not_o(4));
    IC_74LS151_5 : entity work.IC_74LS151 port map(f, sel, en(5), o(5), not not_o(5));
    IC_74LS151_6 : entity work.IC_74LS151 port map(g, sel, en(6), o(6), not not_o(6));
    IC_74LS151_7 : entity work.IC_74LS151 port map(h, sel, en(7), o(7), not not_o(7));    
end rtl;