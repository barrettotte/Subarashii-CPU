library ieee;
use ieee.std_logic_1164.all;
 
entity mux_tb is
end mux_tb;
 
architecture behave of mux_tb is
    signal r_SIG1   : std_logic := '0';
    signal r_SIG2   : std_logic := '0';
    signal r_SIG3   : std_logic := '0';
    signal w_RESULT : std_logic;
   
    component mux is
        port (
            a   : in  std_logic;
            b   : in  std_logic;
            sel : in  std_logic;
            o   : out std_logic
        );
    end component mux;
   
    begin
        mux_INST : mux
        port map (
            a   => r_SIG1,
            b   => r_SIG2,
            sel => r_SIG3,
            o   => w_RESULT
        );
    process is begin
        r_SIG1 <= '0';  r_SIG2 <= '0';  r_SIG3 <= '0';  wait for 10 ns; -- w_RESULT = 0
        r_SIG1 <= '0';  r_SIG2 <= '0';  r_SIG3 <= '1';  wait for 10 ns; -- w_RESULT = 0
        r_SIG1 <= '0';  r_SIG2 <= '1';  r_SIG3 <= '0';  wait for 10 ns; -- w_RESULT = 0
        r_SIG1 <= '0';  r_SIG2 <= '1';  r_SIG3 <= '1';  wait for 10 ns; -- w_RESULT = 1
        r_SIG1 <= '1';  r_SIG2 <= '0';  r_SIG3 <= '0';  wait for 10 ns; -- w_RESULT = 1
        r_SIG1 <= '1';  r_SIG2 <= '0';  r_SIG3 <= '1';  wait for 10 ns; -- w_RESULT = 0
        r_SIG1 <= '1';  r_SIG2 <= '1';  r_SIG3 <= '0';  wait for 10 ns; -- w_RESULT = 1
        r_SIG1 <= '1';  r_SIG2 <= '1';  r_SIG3 <= '1';  wait for 10 ns; -- w_RESULT = 1
    end process; 
end behave;