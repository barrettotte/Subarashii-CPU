library ieee;
use ieee.std_logic_1164.all;
 
entity halfadder_tb is
end halfadder_tb;
 
architecture behave of halfadder_tb is
    signal r_SIG1    : std_logic := '0';
    signal r_SIG2    : std_logic := '0';
    signal w_RESULT1 : std_logic;
    signal w_RESULT2 : std_logic;
   
    component halfadder is
        port (
            a     : in  std_logic;
            b     : in  std_logic;
            sum   : out std_logic;
            carry : out std_logic
        );
    end component halfadder;
   
    begin
        halfadder_INST : halfadder
        port map (
            a     => r_SIG1,
            b     => r_SIG2,
            sum   => w_RESULT1,
            carry => w_RESULT2
        );
    process is begin
        r_SIG1 <= '0';  r_SIG2 <= '0'; wait for 10 ns; -- sum = 0  carry = 0
        r_SIG1 <= '0';  r_SIG2 <= '1'; wait for 10 ns; -- sum = 1  carry = 0
        r_SIG1 <= '1';  r_SIG2 <= '0'; wait for 10 ns; -- sum = 1  carry = 0
        r_SIG1 <= '1';  r_SIG2 <= '1'; wait for 10 ns; -- sum = 0  carry = 1
    end process; 
end behave;