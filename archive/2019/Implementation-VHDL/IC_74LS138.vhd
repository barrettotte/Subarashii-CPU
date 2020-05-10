-- 74LS138 1-of-8 Decoder/Demultiplexer --

library ieee;
use ieee.std_logic_1164.all;
 
entity IC_74LS138 is
    port (
        addr  : in  std_logic_vector(2 downto 0);
        en    : in  std_logic_vector(2 downto 0); -- [LOW,LOW,HIGH]
        o     : out std_logic_vector(7 downto 0)  -- active LOWs
    );
end IC_74LS138;
 
architecture rtl of IC_74LS138 is
begin
    if en(0) = '0' and en(1) = '0' and en(2) = '1' then
        case addr is
            when "000" =>   o <= "11111110";
            when "001" =>   o <= "11111101";
            when "010" =>   o <= "11111011";
            when "011" =>   o <= "11110111";
            when "100" =>   o <= "11101111";
            when "101" =>   o <= "11011111";
            when "110" =>   o <= "10111111";
            when "111" =>   o <= "01111111";
    else
        o <= "11111111";
    end if;
end rtl;