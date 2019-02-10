library ieee;
use ieee.std_logic_1164.all;
 
entity or16way_tb is
end or16way_tb;
 
architecture behave of or16way_tb is
    signal r_SIG1   : std_logic_vector(15 downto 0) := "0000000000000000";
    signal w_RESULT : std_logic;
   
    component or16way is
        port (
            a : in  std_logic_vector(15 downto 0);
            o : out std_logic
        );
    end component or16way;
   
    begin
        or16way_INST : or16way
        port map (
            a => r_SIG1,
            o => w_RESULT
        );
    process is begin
        r_SIG1 <= "0000000000000000"; wait for 10 ns; -- w_RESULT = 0
        r_SIG1 <= "1111111111111111"; wait for 10 ns; -- w_RESULT = 1
        r_SIG1 <= "0000111100001111"; wait for 10 ns; -- w_RESULT = 1
        r_SIG1 <= "0000000000000001"; wait for 10 ns; -- w_RESULT = 1
        r_SIG1 <= "0101010101010101"; wait for 10 ns; -- w_RESULT = 1
    end process; 
end behave;