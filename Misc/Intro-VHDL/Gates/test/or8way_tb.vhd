library ieee;
use ieee.std_logic_1164.all;
 
entity or8way_tb is
end or8way_tb;
 
architecture behave of or8way_tb is
    signal r_SIG1   : std_logic_vector(7 downto 0) := "00000000";
    signal w_RESULT : std_logic;
   
    component or8way is
        port (
            a : in  std_logic_vector(7 downto 0);
            o : out std_logic
        );
    end component or8way;
   
    begin
        or8way_INST : or8way
        port map (
            a => r_SIG1,
            o => w_RESULT
        );
    process is begin
        r_SIG1 <= "00000000"; wait for 10 ns; -- w_RESULT = 0
        r_SIG1 <= "00010000"; wait for 10 ns; -- w_RESULT = 1
        r_SIG1 <= "00000001"; wait for 10 ns; -- w_RESULT = 1
        r_SIG1 <= "00100110"; wait for 10 ns; -- w_RESULT = 1
        r_SIG1 <= "11111111"; wait for 10 ns; -- w_RESULT = 1
    end process; 
end behave;