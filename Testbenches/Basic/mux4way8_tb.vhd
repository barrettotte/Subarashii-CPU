library ieee;
use ieee.std_logic_1164.all;
 
entity mux4way8_tb is
end mux4way8_tb;
 
architecture behave of mux4way8_tb is
    signal r_SIG1   : std_logic_vector(7 downto 0) := "00000000";
    signal r_SIG2   : std_logic_vector(7 downto 0) := "00000000";
    signal r_SIG3   : std_logic_vector(7 downto 0) := "00000000";
    signal r_SIG4   : std_logic_vector(7 downto 0) := "00000000";
    signal r_SIG5   : std_logic_vector(1 downto 0) := "00";
    signal w_RESULT : std_logic_vector(7 downto 0) := "00000000";
   
    component mux4way8 is
        port (
            a   : in  std_logic_vector(7 downto 0);
            b   : in  std_logic_vector(7 downto 0);
            c   : in  std_logic_vector(7 downto 0);
            d   : in  std_logic_vector(7 downto 0);
            sel : in  std_logic_vector(1 downto 0);
            o   : out std_logic_vector(7 downto 0)
        );
    end component mux4way8;
   
    begin
        mux4way8_INST : mux4way8
        port map (
            a   => r_SIG1,
            b   => r_SIG2,
            c   => r_SIG3,
            d   => r_SIG4,
            sel => r_SIG5,
            o   => w_RESULT
        );
    process is begin
    -- Condition 1
            r_SIG1 <= "00000000";   r_SIG2 <= "00000000";   r_SIG3 <= "00000000";
            r_SIG4 <= "00000000";   r_SIG5 <= "00";     wait for 10 ns;     -- w_RESULT = 00000000
    -- Condition 2
            r_SIG1 <= "00000000";   r_SIG2 <= "00000000";   r_SIG3 <= "00000000";
            r_SIG4 <= "00000000";   r_SIG5 <= "01";     wait for 10 ns;     -- w_RESULT = 00000000
    -- Condition 3
            r_SIG1 <= "00000000";   r_SIG2 <= "00000000";   r_SIG3 <= "00000000";
            r_SIG4 <= "00000000";   r_SIG5 <= "10";     wait for 10 ns;     -- w_RESULT = 00000000
    -- Condition 4
            r_SIG1 <= "00000000";   r_SIG2 <= "00000000";   r_SIG3 <= "00000000";
            r_SIG4 <= "00000000";   r_SIG5 <= "11";     wait for 10 ns;     -- w_RESULT = 00000000
    -- Condition 5
            r_SIG1 <= "00110100";   r_SIG2 <= "01110110";   r_SIG3 <= "10101010";
            r_SIG4 <= "01010101";   r_SIG5 <= "00";     wait for 10 ns;     -- w_RESULT = 00110100
    -- Condition 6
            r_SIG1 <= "00110100";   r_SIG2 <= "01110110";   r_SIG3 <= "10101010";
            r_SIG4 <= "01010101";   r_SIG5 <= "01";     wait for 10 ns;     -- w_RESULT = 01110110
    -- Condition 7
            r_SIG1 <= "00110100";   r_SIG2 <= "01110110";   r_SIG3 <= "10101010";
            r_SIG4 <= "01010101";   r_SIG5 <= "10";     wait for 10 ns;     -- w_RESULT = 10101010
    -- Condition 8
            r_SIG1 <= "00110100";   r_SIG2 <= "01110110";   r_SIG3 <= "10101010";
            r_SIG4 <= "01010101";   r_SIG5 <= "11";     wait for 10 ns;     -- w_RESULT = 01010101
    end process; 
end behave;