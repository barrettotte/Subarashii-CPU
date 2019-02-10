library ieee;
use ieee.std_logic_1164.all;
 
entity not_gate_tb is
end not_gate_tb;
 
architecture behave of not_gate_tb is
    signal r_SIG1   : std_logic := '0';
    signal w_RESULT : std_logic;
   
    component not_gate is
        port (
            a : in  std_logic;
            o : out std_logic
        );
    end component not_gate;
   
    begin
        not_gate_INST : not_gate
        port map (
            a => r_SIG1,
            o => w_RESULT
        );
    process is begin
        r_SIG1 <= '0';  wait for 10 ns; -- w_RESULT = 1
        r_SIG1 <= '1';  wait for 10 ns; -- w_RESULT = 0
    end process; 
end behave;