library ieee;
use ieee.std_logic_1164.all;
 
entity add16_tb is
end add16_tb;
 
architecture behave of add16_tb is
    signal r_SIG1   : std_logic_vector(15 downto 0) := "0000000000000000";
    signal r_SIG2   : std_logic_vector(15 downto 0) := "0000000000000000";
    signal w_RESULT : std_logic_vector(15 downto 0);
   
    component add16 is
        port (
            a : in  std_logic_vector(15 downto 0);
            b : in  std_logic_vector(15 downto 0);
            o : out std_logic_vector(15 downto 0)
        );
    end component add16;
   
    begin
        add16_INST : add16
        port map (
            a => r_SIG1,
            b => r_SIG2,
            o => w_RESULT
        );
    process is begin
        r_SIG1 <= "0000000000000000"; r_SIG2 <= "0000000000000000";  wait for 10 ns; -- w_RESULT = 00000000 00000000
        r_SIG1 <= "0000000000000000"; r_SIG2 <= "1111111111111111";  wait for 10 ns; -- w_RESULT = 11111111 11111111
        r_SIG1 <= "1010101010101010"; r_SIG2 <= "0101010101010101";  wait for 10 ns; -- w_RESULT = 11111111 11111111
        r_SIG1 <= "0011110011000011"; r_SIG2 <= "0000111111110000";  wait for 10 ns; -- w_RESULT = 01001100 10110011
        r_SIG1 <= "0001001000110100"; r_SIG2 <= "1001100001110110";  wait for 10 ns; -- w_RESULT = 10101010 10101010
        r_SIG1 <= "1111111111111111"; r_SIG2 <= "1111111111111111";  wait for 10 ns; -- w_RESULT = 11111111 11111111
    end process; 
end behave;