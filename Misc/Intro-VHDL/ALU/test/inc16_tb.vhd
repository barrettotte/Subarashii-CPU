library ieee;
use ieee.std_logic_1164.all;
 
entity inc16_tb is
end inc16_tb;
 
architecture behave of inc16_tb is
    signal r_SIG1   : std_logic_vector(15 downto 0) := "0000000000000000";
    signal w_RESULT : std_logic_vector(15 downto 0);
   
    component inc16 is
        port (
            a : in  std_logic_vector(15 downto 0);
            o : out std_logic_vector(15 downto 0)
        );
    end component inc16;
   
    begin
        inc16_INST : inc16
        port map (
            a => r_SIG1,
            o => w_RESULT
        );
    process is begin
        r_SIG1 <= "0000000000000000"; wait for 10 ns; -- w_RESULT = 00000000 00000001
        r_SIG1 <= "1111111111111111"; wait for 10 ns; -- w_RESULT = 00000000 00000000
        r_SIG1 <= "0000000000000101"; wait for 10 ns; -- w_RESULT = 00000000 00000110
        r_SIG1 <= "1111111111111011"; wait for 10 ns; -- w_RESULT = 11111111 11111100
    end process; 
end behave;