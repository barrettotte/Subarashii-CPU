library ieee;
use ieee.std_logic_1164.all;
 
entity not16_tb is
end not16_tb;
 
architecture behave of not16_tb is
    signal r_SIG1   : std_logic_vector(15 downto 0) := "0000000000000000";
    signal w_RESULT : std_logic_vector(15 downto 0);
   
    component not16 is
        port (
            a : in  std_logic_vector(15 downto 0);
            o : out std_logic_vector(15 downto 0)
        );
    end component not16;
   
    begin
        not16_INST : not16
        port map (
            a => r_SIG1,
            o => w_RESULT
        );
    process is begin
        r_SIG1 <= "0000000000000000";  wait for 10 ns; -- w_RESULT = 11111111 11111111
        r_SIG1 <= "1010101010101010";  wait for 10 ns; -- w_RESULT = 01010101 01010101
        r_SIG1 <= "0000111100001101";  wait for 10 ns; -- w_RESULT = 11110000 11110010
        r_SIG1 <= "1100000100110010";  wait for 10 ns; -- w_RESULT = 00111110 11001101
        r_SIG1 <= "1111111111111111";  wait for 10 ns; -- w_RESULT = 00000000 00000000
    end process; 
end behave;