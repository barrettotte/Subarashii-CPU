-- 74LS245 Octal Bus Transceiver --

library ieee;
use ieee.std_logic_1164.all;
 
entity IC_74LS245_tb is
end IC_74LS245_tb;
 
architecture behave of IC_74LS245_tb is
    signal r_A   : std_logic_vector(7 downto 0) := "00000000";
    signal r_EN  : std_logic := '0';
    signal r_DIR : std_logic := '1'; -- active LOW
    signal w_B   : std_logic_vector(7 downto 0);
   
    component IC_74LS245 is
        port (
            a   : in  std_logic_vector(7 downto 0);
            en  : in  std_logic;
            dir : in  std_logic;
            b   : out std_logic_vector(7 downto 0)
        );
    end component IC_74LS245;
   
    begin
        IC_74LS245_INST : IC_74LS245
        port map (
            a   => r_A,
            en  => r_EN,
            dir => r_DIR,
            b   => w_B
        );

    process is begin
        -- r_EN is active LOW, r_DIR is always HIGH (only there for consistency)
        r_A <= "11110000";  r_EN <= '1';  r_DIR <= '1';  wait for 10 ns;  -- w_B = 00000000
        r_A <= "11110000";  r_EN <= '0';  r_DIR <= '1';  wait for 10 ns;  -- w_B = 11110000
    end process; 
    
end behave;