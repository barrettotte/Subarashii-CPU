-- Register Bank --

library ieee;
use ieee.std_logic_1164.all;

entity register_bank is
    port (
        en          : in std_logic_vector(1 downto 0);
        sel         : in std_logic_vector(2 downto 0);
        clk         : in std_logic;
        rd_out      : out std_logic_vector(7 downto 0);
        rs_out      : out std_logic_vector(7 downto 0)
    );
end register_bank;

architecture rtl of register_bank is
    a, b, c, d, e, f, g, h : std_logic_vector(7 downto 0);
begin
    rd_sel : entity work.register_selector port map(en(0), sel, clk, a, b, c, d, e, f, g, h, rd_out);
    rs_sel : entity work.register_selector port map(en(1), sel, clk, a, b, c, d, e, f, g, h, rs_out);
end rtl;