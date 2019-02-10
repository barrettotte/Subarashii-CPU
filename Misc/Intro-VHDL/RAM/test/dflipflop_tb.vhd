library ieee;
use ieee.std_logic_1164.all;
 
entity dflipflop_tb is
end dflipflop_tb;
 
architecture behave of dflipflop_tb is
    signal r_CLK : std_logic := '0';
    signal r_RST : std_logic := '0';
    signal r_EN  : std_logic := '0';
    signal r_D   : std_logic := '0';
    signal w_Q   : std_logic;
    signal w_NQ  : std_logic;

    constant CLK_PERIOD : time := 100 ns;

    component dflipflop is
        port (
            clk : in  std_logic;
            rst : in  std_logic;
            en  : in  std_logic;
            d   : in  std_logic;
            q   : out std_logic;
            nq  : out std_logic
        );
    end component dflipflop;
   
    begin
    dflipflop_INST : dflipflop
    port map (
        clk => r_CLK,
        rst => r_RST,
        en  => r_EN,
        d   => r_D,
        q   => w_Q,
        nq  => w_NQ
    );

    clk_process : process
        begin
        r_CLK <= '0';   wait for CLK_PERIOD/2;
        r_CLK <= '1';   wait for CLK_PERIOD/2;
    end process; 
    
    sim_process : process
        begin
            r_RST <= '0';
            r_EN  <= '0';
            wait for 20 ns;
            
            for I in 0 to 4 loop    
                r_D <= '1';
                wait for 100 ns;
                r_D <= '0';
                wait for 100 ns;

                if(I = 1) then
                    r_EN <= '1';
                end if;
                if(I = 3) then
                    r_RST <= '1';
                end if;
            end loop;
    end process;
end behave;