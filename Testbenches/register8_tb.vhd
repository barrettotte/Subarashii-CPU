-- 8-bit register --

library ieee;
use ieee.std_logic_1164.all;
 
entity register8_tb is
end register8_tb;
 
architecture behave of register8_tb is
    signal r_DATA_IN  : std_logic_vector(7 downto 0) := "00000000";
    signal r_EN_IN    : std_logic := '1'; -- active LOW
    signal r_EN_OUT   : std_logic := '1'; -- active LOW
    signal r_CLK      : std_logic := '0';
    signal w_DATA_OUT : std_logic_vector(7 downto 0);
   
    component register8 is
        port (
            data_in  : in  std_logic_vector(7 downto 0);
            en_in    : in  std_logic;
            en_out   : in  std_logic;
            clk      : in  std_logic;
            data_out : out std_logic_vector(7 downto 0)
        );
    end component register8;
   
    begin
        register8_INST : register8
        port map (
            data_in    => r_DATA_IN
            en_in      => r_EN_IN,
            en_out     => r_EN_OUT,
            clk        => r_CLK,
            data_latch => w_DATA_OUT
        );

    clk_process : process
        begin
        r_CLK <= '0';   wait for CLK_PERIOD/2;
        r_CLK <= '1';   wait for CLK_PERIOD/2;
    end process; 
    
    sim_process : process
        begin
            r_EN_IN   <= '1'; -- active LOW
            r_EN_OUT  <= '1'; -- active LOW
            wait for 20 ns;
            
            for I in 0 to 8 loop    
                r_DATA_IN <= "11110000";
                wait for 100 ns;
                case I is
                    when 1      => r_EN_IN <= '0';  r_EN_OUT <= '0';  -- r_DATA_OUT = 11110000
                    when 3      => r_EN_IN <= '0';  r_EN_OUT <= '1';  -- r_DATA_OUT = 00000000
                    when 5      => r_EN_IN <= '1';  r_EN_OUT <= '0';  -- r_DATA_OUT = 00000000
                    when 7      => r_EN_IN <= '1';  r_EN_OUT <= '1';  -- r_DATA_OUT = 00000000
                    when others => -- Cycle clock again
                end case;
            end loop;
    end process;
end behave;