-- 74LS86 Quad 2-Input Exclusive-OR Gate --

library ieee;
use ieee.std_logic_1164.all;
 
entity IC_74LS86 is
    port (
        a   : in  std_logic_vector(1 downto 0);
        b   : in  std_logic_vector(1 downto 0);
        c   : in  std_logic_vector(1 downto 0);
        d   : in  std_logic_vector(1 downto 0);
        o_1 : out std_logic;
        o_2 : out std_logic;
        o_3 : out std_logic;
        o_4 : out std_logic;
    );
end IC_74LS86;
 
architecture rtl of IC_74LS86 is
begin
    o_1 <= a(0) XOR a(1);
    o_2 <= b(0) XOR b(1);
    o_3 <= c(0) XOR c(1);
    o_4 <= d(0) XOR d(1);
end rtl;