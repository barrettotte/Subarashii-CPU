-- 74LS245 Octal Bus Transceiver --

library ieee;
use ieee.std_logic_1164.all;
 
entity IC_74LS245 is
    port (
        a   : in  std_logic_vector(7 downto 0);
        en  : in  std_logic;                        -- active LOW
        dir : in  std_logic;                        -- direction tied HIGH, not used
        b   : out std_logic_vector(7 downto 0)
    );
end IC_74LS245;
 
architecture rtl of IC_74LS245 is
begin
    if en = '0' then
        o <= a;
    else
        o <= "00000000";
    end if;
end rtl;