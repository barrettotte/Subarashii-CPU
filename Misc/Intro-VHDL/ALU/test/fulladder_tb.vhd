library ieee;
use ieee.std_logic_1164.all;
 
entity fulladder_tb is
end fulladder_tb;
 
architecture behave of fulladder_tb is
    signal r_SIG1    : std_logic := '0';
    signal r_SIG2    : std_logic := '0';
    signal r_SIG3    : std_logic := '0';
    signal w_RESULT1 : std_logic;
    signal w_RESULT2 : std_logic;
   
    component fulladder is
        port (
            a     : in  std_logic;
            b     : in  std_logic;
            c     : in  std_logic;
            sum   : out std_logic;
            carry : out std_logic
        );
    end component fulladder;
   
    begin
        fulladder_INST : fulladder
        port map (
            a     => r_SIG1,
            b     => r_SIG2,
            c     => r_SIG3,
            sum   => w_RESULT1,
            carry => w_RESULT2
        );
    process is begin
        r_SIG1 <= '0';  r_SIG2 <= '0';  r_SIG3 <= '0';  wait for 10 ns; -- sum = 0  carry = 0
        r_SIG1 <= '0';  r_SIG2 <= '0';  r_SIG3 <= '1';  wait for 10 ns; -- sum = 1  carry = 0
        r_SIG1 <= '0';  r_SIG2 <= '1';  r_SIG3 <= '0';  wait for 10 ns; -- sum = 1  carry = 0
        r_SIG1 <= '1';  r_SIG2 <= '0';  r_SIG3 <= '0';  wait for 10 ns; -- sum = 1  carry = 0
        r_SIG1 <= '1';  r_SIG2 <= '0';  r_SIG3 <= '1';  wait for 10 ns; -- sum = 0  carry = 1
        r_SIG1 <= '1';  r_SIG2 <= '1';  r_SIG3 <= '0';  wait for 10 ns; -- sum = 0  carry = 1
        r_SIG1 <= '1';  r_SIG2 <= '1';  r_SIG3 <= '1';  wait for 10 ns; -- sum = 1  carry = 1
    end process; 
end behave;