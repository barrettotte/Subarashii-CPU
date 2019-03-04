-- 8-bit register --

library ieee;
use ieee.std_logic_1164.all;

entity register8 is
    port (
        data_in  : in  std_logic_vector(7 downto 0);
        en_in    : in  std_logic;                     -- active LOW
        en_out   : in  std_logic;                     -- active LOW
        clk      : in  std_logic;
        data_out : out std_logic_vector(7 downto 0)
    );
end register8;

architecture rtl of register8 is
    signal dir_1 : std_logic;
    signal out_377 : std_logic_vector(7 downto 0);
begin
    dir_1 <= '1';
    IC_74LS377_1 : entity work.IC_74LS377 port map(data_in, clk, en_out, out_377);
    IC_74LS245_1 : entity work.IC_74LS245 port map(out_377, en_in, dir_1, data_out);
end rtl;