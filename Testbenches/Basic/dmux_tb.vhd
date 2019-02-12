library ieee;
use ieee.std_logic_1164.all;
 
entity dmux_tb is
end dmux_tb;
 
architecture behave of dmux_tb is
    signal r_SIG1    : std_logic := '0';
    signal r_SIG2    : std_logic := '0';
    signal w_RESULT1 : std_logic;
    signal w_RESULT2 : std_logic;
   
    component dmux is
        port (
            i   : in  std_logic;
            sel : in  std_logic;
            a   : out std_logic;
            b   : out std_logic
        );
    end component dmux;
   
    begin
        dmux_INST : dmux
        port map (
            i   => r_SIG1,
            sel => r_SIG2,
            a   => w_RESULT1,
            b   => w_RESULT2
        );
    process is begin
        r_SIG1 <= '0';  r_SIG2 <= '0'; wait for 10 ns; -- w_RESULT1 = 0  w_RESULT2 = 0
        r_SIG1 <= '0';  r_SIG2 <= '1'; wait for 10 ns; -- w_RESULT1 = 0  w_RESULT2 = 0
        r_SIG1 <= '1';  r_SIG2 <= '0'; wait for 10 ns; -- w_RESULT1 = 1  w_RESULT2 = 0
        r_SIG1 <= '1';  r_SIG2 <= '1'; wait for 10 ns; -- w_RESULT1 = 0  w_RESULT2 = 1
    end process; 
end behave;