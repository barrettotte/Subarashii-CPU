-- 74LS151 8-Input Multiplexer --

library ieee;
use ieee.std_logic_1164.all;
 
entity IC_74LS151 is
    port (
        i     : in  std_logic_vector(7 downto 0);
        sel   : in  std_logic_vector(2 downto 0);
        en    : in  std_logic;                        -- active LOW
        z     : out std_logic;
        z_not : out std_logic
    );
end IC_74LS151;
 
architecture rtl of IC_74LS151 is
begin
    if en = '0' then
        case sel is
            when "000" =>   z <= i(0);  z_not <= not z;
            when "001" =>   z <= i(1);  z_not <= not z;
            when "010" =>   z <= i(2);  z_not <= not z;
            when "011" =>   z <= i(3);  z_not <= not z;
            when "100" =>   z <= i(4);  z_not <= not z;
            when "101" =>   z <= i(5);  z_not <= not z;
            when "110" =>   z <= i(6);  z_not <= not z;
            when "111" =>   z <= i(7);  z_not <= not z;
    else
        z     <= '1';
        z_not <= '0';
    end if;
end rtl;