library ieee;
use ieee.std_logic_1164.all;
 
entity register16_tb is
end register16_tb;
 
architecture behave of register16_tb is
    signal r_I   : std_logic_vector(15 downto 0) := "0000000000000000";
    signal r_EN  : std_logic := '0';
    signal r_CLK : std_logic := '0';
    signal w_O   : std_logic_vector(15 downto 0);

    constant CLK_PERIOD : time := 100 ns;

    component register16 is
        port (
            i   : in  std_logic_vector(15 downto 0);
            en  : in  std_logic;
            clk : in  std_logic;
            o   : out std_logic_vector(15 downto 0);
        );
    end component register16;
   
    begin
    register16_INST : register16
    port map (
        i   => r_I,
        en  => r_EN,    
        clk => r_CLK,     
        o   => w_O,
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
            
            for I in 0 to 4 loop    
                r_I <= "1111111111111111";
                wait for 100 ns;
                r_I <= "0000000000000000";
                wait for 100 ns;

                if(I = 1) then
                    r_EN <= '1';
                end if;
            end loop;
    end process;
end behave;