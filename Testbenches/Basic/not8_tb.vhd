library ieee;
use ieee.std_logic_1164.all;
 
entity not8_tb is
end not8_tb;
 
architecture behave of not8_tb is
    signal r_SIG1   : std_logic_vector(7 downto 0) := "00000000";
    signal w_RESULT : std_logic_vector(7 downto 0);
   
    component not8 is
        port (
            a : in  std_logic_vector(7 downto 0);
            o : out std_logic_vector(7 downto 0)
        );
    end component not8;
   
    begin
        not8_INST : not8
        port map (
            a => r_SIG1,
            o => w_RESULT
        );
    process is begin
        r_SIG1 <= "00000000";  wait for 10 ns; -- w_RESULT = 11111111
        r_SIG1 <= "10101010";  wait for 10 ns; -- w_RESULT = 01010101
        r_SIG1 <= "00001101";  wait for 10 ns; -- w_RESULT = 11110010
        r_SIG1 <= "00110010";  wait for 10 ns; -- w_RESULT = 11001101
        r_SIG1 <= "11111111";  wait for 10 ns; -- w_RESULT = 00000000
    end process; 
end behave;