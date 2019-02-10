library ieee;
use ieee.std_logic_1164.all;
 
entity mux16_tb is
end mux16_tb;
 
architecture behave of mux16_tb is
    signal r_SIG1   : std_logic_vector(15 downto 0) := "0000000000000000";
    signal r_SIG2   : std_logic_vector(15 downto 0) := "0000000000000000";
    signal r_SIG3   : std_logic                     := '0';
    signal w_RESULT : std_logic_vector(15 downto 0);
   
    component mux16 is
        port (
            a   : in  std_logic_vector(15 downto 0);
            b   : in  std_logic_vector(15 downto 0);
            sel : in  std_logic;
            o   : out std_logic_vector(15 downto 0)
        );
    end component mux16;
   
    begin
        mux16_INST : mux16
        port map (
            a   => r_SIG1,
            b   => r_SIG2,
            sel => r_SIG3,
            o   => w_RESULT
        );
    process is begin
        r_SIG1 <= "0000000000000000"; r_SIG2 <= "0000000000000000"; r_SIG3 <= '0'; wait for 10 ns; -- w_RESULT = 00000000 00000000
        r_SIG1 <= "0000000000000000"; r_SIG2 <= "0000000000000000"; r_SIG3 <= '1'; wait for 10 ns; -- w_RESULT = 00000000 00000000
        r_SIG1 <= "0000000000000000"; r_SIG2 <= "0001001000110100"; r_SIG3 <= '0'; wait for 10 ns; -- w_RESULT = 00000000 00000000
        r_SIG1 <= "0000000000000000"; r_SIG2 <= "0001001000110100"; r_SIG3 <= '1'; wait for 10 ns; -- w_RESULT = 00010010 00110100
        r_SIG1 <= "1001100001110110"; r_SIG2 <= "0000000000000000"; r_SIG3 <= '0'; wait for 10 ns; -- w_RESULT = 10011000 01110110
        r_SIG1 <= "1001100001110110"; r_SIG2 <= "0000000000000000"; r_SIG3 <= '1'; wait for 10 ns; -- w_RESULT = 00000000 00000000
        r_SIG1 <= "1010101010101010"; r_SIG2 <= "0101010101010101"; r_SIG3 <= '0'; wait for 10 ns; -- w_RESULT = 10101010 10101010
        r_SIG1 <= "1010101010101010"; r_SIG2 <= "0101010101010101"; r_SIG3 <= '1'; wait for 10 ns; -- w_RESULT = 01010101 01010101
    end process; 
end behave;