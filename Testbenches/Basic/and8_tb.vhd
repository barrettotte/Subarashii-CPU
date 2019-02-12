library ieee;
use ieee.std_logic_1164.all;
 
entity and8_tb is
end and8_tb;
 
architecture behave of and8_tb is
    signal r_SIG1   : std_logic_vector(7 downto 0) := "00000000";
    signal r_SIG2   : std_logic_vector(7 downto 0) := "00000000";
    signal w_RESULT : std_logic_vector(7 downto 0);
   
    component and8 is
        port (
            a : in  std_logic_vector(7 downto 0);
            b : in  std_logic_vector(7 downto 0);
            o : out std_logic_vector(7 downto 0)
        );
    end component and8;
   
    begin
        and8_INST : and8
        port map (
            a => r_SIG1,
            b => r_SIG2,
            o => w_RESULT
        );
    process is begin
        r_SIG1 <= "00000000"; r_SIG2 <= "00000000";  wait for 10 ns; -- w_RESULT = 00000000
        r_SIG1 <= "00000000"; r_SIG2 <= "11111111";  wait for 10 ns; -- w_RESULT = 00000000
        r_SIG1 <= "10101010"; r_SIG2 <= "01010101";  wait for 10 ns; -- w_RESULT = 00000000 
        r_SIG1 <= "11000011"; r_SIG2 <= "11110000";  wait for 10 ns; -- w_RESULT = 11000000 
        r_SIG1 <= "00110100"; r_SIG2 <= "01110110";  wait for 10 ns; -- w_RESULT = 00110100 
        r_SIG1 <= "11111111"; r_SIG2 <= "11111111";  wait for 10 ns; -- w_RESULT = 11111111 
    end process; 
end behave;