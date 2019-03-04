-- 74LS377 Octal D Flip-Flop with Enable --

library ieee;
use ieee.std_logic_1164.all;
 
entity IC_74LS377 is
    port (
        data_in    : in  std_logic_vector(7 downto 0);
        clk        : in  std_logic;
        en         : in  std_logic;                     -- active LOW
        data_latch : out std_logic_vector(7 downto 0)
    );
end IC_74LS377;
 
architecture rtl of IC_74LS377 is
    signal val : std_logic_vector(7 downto 0);
begin
    process(clk)
    begin
        -- rising edge triggered --
        if(clk'event and clk = '1') then
            if(en = '0') then
                val <= data_in;
            else
                val <= "00000000";
            end if;
        end if;
    end process;
    data_latch <= val;
end rtl;