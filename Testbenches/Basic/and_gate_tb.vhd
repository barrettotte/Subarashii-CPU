library ieee;
use ieee.std_logic_1164.all;
 
entity and_gate_tb is
end and_gate_tb;
 
architecture behave of and_gate_tb is
    signal r_SIG1   : std_logic := '0';
    signal r_SIG2   : std_logic := '0';
    signal w_RESULT : std_logic;
   
    component and_gate is
        port (
            a : in  std_logic;
            b : in  std_logic;
            o : out std_logic
        );
    end component and_gate;
   
    begin
        and_gate_INST : and_gate
        port map (
            a => r_SIG1,
            b => r_SIG2,
            o => w_RESULT
        );
    process is begin
        r_SIG1 <= '0';  r_SIG2 <= '0';  wait for 10 ns; -- w_RESULT = 0
        r_SIG1 <= '0';  r_SIG2 <= '1';  wait for 10 ns; -- w_RESULT = 0
        r_SIG1 <= '1';  r_SIG2 <= '0';  wait for 10 ns; -- w_RESULT = 0
        r_SIG1 <= '1';  r_SIG2 <= '1';  wait for 10 ns; -- w_RESULT = 1
    end process; 
end behave;