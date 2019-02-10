library ieee;
use ieee.std_logic_1164.all;
 
entity dmux4way_tb is
end dmux4way_tb;
 
architecture behave of dmux4way_tb is
    signal r_SIG1    : std_logic                    := '0';
    signal r_SIG2    : std_logic_vector(1 downto 0) := "00";
    signal w_RESULT1 : std_logic;
    signal w_RESULT2 : std_logic;
    signal w_RESULT3 : std_logic;
    signal w_RESULT4 : std_logic;
   
    component dmux4way is
        port (
            i   : in  std_logic;
            sel : in  std_logic_vector(1 downto 0);
            a   : out std_logic;
            b   : out std_logic;
            c   : out std_logic;
            d   : out std_logic
        );
    end component dmux4way;
   
    begin
        dmux4way_INST : dmux4way
        port map (
            i   => r_SIG1,
            sel => r_SIG2,
            a   => w_RESULT1,
            b   => w_RESULT2,
            c   => w_RESULT3,
            d   => w_RESULT4
        );
    process is begin
        r_SIG1 <= '0';  r_SIG2 <= "00"; wait for 10 ns; -- a = 0  b = 0  c = 0  d = 0
        r_SIG1 <= '0';  r_SIG2 <= "01"; wait for 10 ns; -- a = 0  b = 0  c = 0  d = 0
        r_SIG1 <= '0';  r_SIG2 <= "10"; wait for 10 ns; -- a = 0  b = 0  c = 0  d = 0
        r_SIG1 <= '0';  r_SIG2 <= "11"; wait for 10 ns; -- a = 0  b = 0  c = 0  d = 0
        r_SIG1 <= '1';  r_SIG2 <= "00"; wait for 10 ns; -- a = 1  b = 0  c = 0  d = 0
        r_SIG1 <= '1';  r_SIG2 <= "01"; wait for 10 ns; -- a = 0  b = 1  c = 0  d = 0
        r_SIG1 <= '1';  r_SIG2 <= "10"; wait for 10 ns; -- a = 0  b = 0  c = 1  d = 0
        r_SIG1 <= '1';  r_SIG2 <= "11"; wait for 10 ns; -- a = 0  b = 0  c = 0  d = 1
    end process; 
end behave;