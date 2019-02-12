library ieee;
use ieee.std_logic_1164.all;
 
entity dmux8way_tb is
end dmux8way_tb;
 
architecture behave of dmux8way_tb is
    signal r_SIG1    : std_logic                    := '0';
    signal r_SIG2    : std_logic_vector(2 downto 0) := "000";
    signal w_RESULT1 : std_logic;
    signal w_RESULT2 : std_logic;
    signal w_RESULT3 : std_logic;
    signal w_RESULT4 : std_logic;
    signal w_RESULT5 : std_logic;
    signal w_RESULT6 : std_logic;
    signal w_RESULT7 : std_logic;
    signal w_RESULT8 : std_logic;
   
    component dmux8way is
        port (
            i   : in  std_logic;
            sel : in  std_logic_vector(2 downto 0);
            a   : out std_logic;
            b   : out std_logic;
            c   : out std_logic;
            d   : out std_logic;
            e   : out std_logic;
            f   : out std_logic;
            g   : out std_logic;
            h   : out std_logic
        );
    end component dmux8way;
   
    begin
        dmux8way_INST : dmux8way
        port map (
            i   => r_SIG1,
            sel => r_SIG2,
            a   => w_RESULT1,
            b   => w_RESULT2,
            c   => w_RESULT3,
            d   => w_RESULT4,
            e   => w_RESULT5,
            f   => w_RESULT6,
            g   => w_RESULT7,
            h   => w_RESULT8
        );
    process is begin
        r_SIG1 <= '0';  r_SIG2 <= "000"; wait for 10 ns; -- a=0  b=0  c=0  d=0  e=0  f=0  g=0  h=0
        r_SIG1 <= '0';  r_SIG2 <= "001"; wait for 10 ns; -- a=0  b=0  c=0  d=0  e=0  f=0  g=0  h=0
        r_SIG1 <= '0';  r_SIG2 <= "010"; wait for 10 ns; -- a=0  b=0  c=0  d=0  e=0  f=0  g=0  h=0
        r_SIG1 <= '0';  r_SIG2 <= "011"; wait for 10 ns; -- a=0  b=0  c=0  d=0  e=0  f=0  g=0  h=0
        r_SIG1 <= '0';  r_SIG2 <= "100"; wait for 10 ns; -- a=0  b=0  c=0  d=0  e=0  f=0  g=0  h=0
        r_SIG1 <= '0';  r_SIG2 <= "101"; wait for 10 ns; -- a=0  b=0  c=0  d=0  e=0  f=0  g=0  h=0
        r_SIG1 <= '0';  r_SIG2 <= "110"; wait for 10 ns; -- a=0  b=0  c=0  d=0  e=0  f=0  g=0  h=0
        r_SIG1 <= '0';  r_SIG2 <= "111"; wait for 10 ns; -- a=0  b=0  c=0  d=0  e=0  f=0  g=0  h=0
        
        r_SIG1 <= '1';  r_SIG2 <= "000"; wait for 10 ns; -- a=1  b=0  c=0  d=0  e=0  f=0  g=0  h=0
        r_SIG1 <= '1';  r_SIG2 <= "001"; wait for 10 ns; -- a=0  b=1  c=0  d=0  e=0  f=0  g=0  h=0
        r_SIG1 <= '1';  r_SIG2 <= "010"; wait for 10 ns; -- a=0  b=0  c=1  d=0  e=0  f=0  g=0  h=0
        r_SIG1 <= '1';  r_SIG2 <= "011"; wait for 10 ns; -- a=0  b=0  c=0  d=1  e=0  f=0  g=0  h=0
        r_SIG1 <= '1';  r_SIG2 <= "100"; wait for 10 ns; -- a=0  b=0  c=0  d=0  e=1  f=0  g=0  h=0
        r_SIG1 <= '1';  r_SIG2 <= "101"; wait for 10 ns; -- a=0  b=0  c=0  d=0  e=0  f=1  g=0  h=0
        r_SIG1 <= '1';  r_SIG2 <= "110"; wait for 10 ns; -- a=0  b=0  c=0  d=0  e=0  f=0  g=1  h=0
        r_SIG1 <= '1';  r_SIG2 <= "111"; wait for 10 ns; -- a=0  b=0  c=0  d=0  e=0  f=0  g=0  h=1
    end process; 
end behave;