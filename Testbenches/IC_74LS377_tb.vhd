-- 74LS377 Octal D Flip-Flop with Enable --

library ieee;
use ieee.std_logic_1164.all;
 
entity IC_74LS377_tb is
end IC_74LS377_tb;
 
architecture behave of IC_74LS377_tb is
    signal r_DATA_IN    : std_logic_vector(7 downto 0) := "00000000";
    signal r_CLK        : std_logic := '0';
    signal r_EN         : std_logic := '1'; -- active LOW
    signal w_DATA_LATCH : std_logic_vector(7 downto 0);
   
    component IC_74LS377 is
        port (
            data_in    : in  std_logic_vector(7 downto 0);
            clk        : in  std_logic;
            en         : in  std_logic;
            data_latch : out std_logic_vector(7 downto 0)
        );
    end component IC_74LS377;
   
    begin
        IC_74LS377_INST : IC_74LS377
        port map (
            data_in    => r_DATA_IN
            clk        => r_CLK,
            en         => r_EN,
            data_latch => w_DATA_LATCH
        );

    clk_process : process
        begin
        r_CLK <= '0';   wait for CLK_PERIOD/2;
        r_CLK <= '1';   wait for CLK_PERIOD/2;
    end process; 
    
    sim_process : process
        begin
            r_EN      <= '1'; -- active LOW
            r_DATA_IN <= "11110000";
            wait for 20 ns;
            
            for I in 0 to 4 loop    
                wait for 100 ns;
                case I is
                    when 1      =>   r_EN <= '0'; -- r_DATA_LATCH = 11110000
                    when 3      =>   r_EN <= '1'; -- r_DATA_LATCH = 00000000
                    when others =>  -- Cycle clock again
                end case;
            end loop;
    end process;
end behave;