-- 74LS86 Quad 2-Input Exclusive-OR Gate --

library ieee;
use ieee.std_logic_1164.all;
 
entity IC_74LS86_tb is
end IC_74LS86_tb;
 
architecture behave of IC_74LS86_tb is
    signal r_A   : std_logic_vector(1 downto 0) := "00";
    signal r_B   : std_logic_vector(1 downto 0) := "00";
    signal r_C   : std_logic_vector(1 downto 0) := "00";
    signal r_D   : std_logic_vector(1 downto 0) := "00";
    signal w_O_1 : std_logic;
    signal w_O_2 : std_logic;
    signal w_O_3 : std_logic;
    signal w_O_4 : std_logic;
   
    component IC_74LS86 is
        port (
            a   : in  std_logic_vector(1 downto 0);
            b   : in  std_logic_vector(1 downto 0);
            c   : in  std_logic_vector(1 downto 0);
            d   : in  std_logic_vector(1 downto 0);
            o_1 : out std_logic;
            o_2 : out std_logic;
            o_3 : out std_logic;
            o_4 : out std_logic
        );
    end component IC_74LS86;
   
    begin
        IC_74LS86_INST : IC_74LS86
        port map (
            a   => r_A,
            b   => r_B,
            c   => r_C,
            d   => r_D,
            o_1 => w_O_1,
            o_2 => w_O_2,
            o_3 => w_O_3,
            o_4 => w_O_4
        );

    process is begin
        r_A <= "00";  wait for 10 ns;  -- o_1 = 0
        r_A <= "01";  wait for 10 ns;  -- o_1 = 1
        r_A <= "10";  wait for 10 ns;  -- o_1 = 1
        r_A <= "11";  wait for 10 ns;  -- o_1 = 0
        
        -- r_B, r_C, r_D are the same as r_A --
    end process; 
    
end behave;