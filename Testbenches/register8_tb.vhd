library ieee;
use ieee.std_logic_1164.all;
 
entity register8_tb is
end register8_tb;
 
architecture behave of register8_tb is
    signal r_I    : std_logic_vector(8 downto 0) := "00000000";
    signal r_LOAD : std_logic := '0';
    signal r_EN   : std_logic := '0';
    signal r_CLR  : std_logic := '0';
    signal r_CLK  : std_logic := '0';
    signal w_O    : std_logic_vector(7 downto 0);

    constant CLK_PERIOD : time := 100 ns;

    component register8 is
        port (
            i    : in  std_logic_vector(7 downto 0);
            en   : in  std_logic;
            load : in  std_logic;
            clr  : in  std_logic;
            clk  : in  std_logic;
            o    : out std_logic_vector(7 downto 0);
        );
    end component register8;
   
    begin
    register8_INST : register8
    port map (
        i    => r_I,
        en   => r_EN,  
        load => r_LOAD, 
        clr  => r_CLR, 
        clk  => r_CLK,     
        o    => w_O
    );

    clk_process : process
        begin
        r_CLK <= '0';   wait for CLK_PERIOD/2;
        r_CLK <= '1';   wait for CLK_PERIOD/2;
    end process; 
    
    sim_process : process
        begin
            r_EN  <= '0';
            wait for 20 ns;
            
            for I in 0 to 14 loop    
                r_I <= "11111111";
                wait for 100 ns;
                r_I <= "00000000";
                wait for 100 ns;

                case I is
                    when 1      =>   r_EN <= '0';   r_LOAD <= '0';   r_CLR <= '1';
                    when 3      =>   r_EN <= '0';   r_LOAD <= '1';   r_CLR <= '0';
                    when 5      =>   r_EN <= '0';   r_LOAD <= '1';   r_CLR <= '1';
                    when 7      =>   r_EN <= '1';   r_LOAD <= '0';   r_CLR <= '0';
                    when 9      =>   r_EN <= '1';   r_LOAD <= '0';   r_CLR <= '1';
                    when 11     =>   r_EN <= '1';   r_LOAD <= '1';   r_CLR <= '0';
                    when 13     =>   r_EN <= '1';   r_LOAD <= '1';   r_CLR <= '1';
                    when others =>  -- Cycle clock again
                end case;
            end loop;
    end process;
end behave;