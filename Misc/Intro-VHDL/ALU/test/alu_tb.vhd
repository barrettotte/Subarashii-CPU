library ieee;
use ieee.std_logic_1164.all;
 
entity alu_tb is
end alu_tb;
 
architecture behave of alu_tb is
    signal r_X  : std_logic_vector(15 downto 0) := "0000000000000000";
    signal r_Y  : std_logic_vector(15 downto 0) := "0000000000000000";
    signal r_ZX : std_logic                     := '0';
    signal r_NX : std_logic                     := '0';
    signal r_ZY : std_logic                     := '0';
    signal r_NY : std_logic                     := '0';
    signal r_F  : std_logic                     := '0';
    signal r_NO : std_logic                     := '0';
    signal w_O  : std_logic_vector(15 downto 0);
    signal w_ZR : std_logic;
    signal w_NG : std_logic;
   
    component alu is
        port (
            x  : in  std_logic_vector(15 downto 0);
            y  : in  std_logic_vector(15 downto 0);
            zx : in  std_logic;     -- Zero the x-input ?
            nx : in  std_logic;     -- Negate x-input ?
            zy : in  std_logic;     -- Zero the y-input ?
            ny : in  std_logic;     -- Negate x-input ?
            f  : in  std_logic;     -- compute (1) ? x+y : x&y
            no : in  std_logic;     -- negate out-output ?
            o  : out std_logic_vector(15 downto 0);
            zr : out std_logic;     -- (o=0) ? 1 : 0
            ng : out std_logic      -- (o<0) ? 1 : 0
        );
    end component alu;
   
    begin
        alu_INST : alu
        port map (
            x  => r_X,
            y  => r_Y,
            zx => r_ZX,
            nx => r_NX,
            zy => r_ZY,
            ny => r_NY,
            f  => r_F,
            no => r_NO,
            o  => w_O,
            zr => w_ZR,
            ng => w_NG
        );
    process is begin
    -- Condition 01:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '1'; r_NX <= '0'; r_ZY <= '1'; r_NY <= '0'; r_F <= '1'; r_NO <= '0';
        wait for 10 ns;     -- w_O = 00000000 00000000    w_ZR = 1    w_NG = 0
    -- Condition 02:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '1'; r_NX <= '1'; r_ZY <= '1'; r_NY <= '1'; r_F <= '1'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 00000000 00000001    w_ZR = 0    w_NG = 0
    -- Condition 03:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '1'; r_NX <= '1'; r_ZY <= '1'; r_NY <= '0'; r_F <= '1'; r_NO <= '0';
        wait for 10 ns;     -- w_O = 11111111 11111111    w_ZR = 0    w_NG = 1
    -- Condition 04:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '0'; r_NX <= '0'; r_ZY <= '1'; r_NY <= '1'; r_F <= '0'; r_NO <= '0';
        wait for 10 ns;     -- w_O = 00000000 00000000    w_ZR = 1    w_NG = 0
    -- Condition 05:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '1'; r_NX <= '1'; r_ZY <= '0'; r_NY <= '0'; r_F <= '0'; r_NO <= '0';
        wait for 10 ns;     -- w_O = 11111111 11111111    w_ZR = 0    w_NG = 1
    -- Condition 06:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '0'; r_NX <= '0'; r_ZY <= '1'; r_NY <= '1'; r_F <= '0'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 11111111 11111111    w_ZR = 0    w_NG = 1
    -- Condition 07:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '1'; r_NX <= '1'; r_ZY <= '0'; r_NY <= '0'; r_F <= '0'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 00000000 00000000    w_ZR = 1    w_NG = 0
    -- Condition 08:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '0'; r_NX <= '0'; r_ZY <= '1'; r_NY <= '1'; r_F <= '1'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 00000000 00000000    w_ZR = 1    w_NG = 0
    -- Condition 09:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '1'; r_NX <= '1'; r_ZY <= '0'; r_NY <= '0'; r_F <= '1'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 00000000 00000001    w_ZR = 0    w_NG = 0
    -- Condition 10:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '0'; r_NX <= '1'; r_ZY <= '1'; r_NY <= '1'; r_F <= '1'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 00000000 00000001    w_ZR = 0    w_NG = 0
    -- Condition 11:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '1'; r_NX <= '1'; r_ZY <= '0'; r_NY <= '1'; r_F <= '1'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 00000000 00000000    w_ZR = 1    w_NG = 0
    -- Condition 12:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '0'; r_NX <= '0'; r_ZY <= '1'; r_NY <= '1'; r_F <= '1'; r_NO <= '0';
        wait for 10 ns;     -- w_O = 11111111 11111111    w_ZR = 0    w_NG = 1
    -- Condition 13:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '1'; r_NX <= '1'; r_ZY <= '0'; r_NY <= '0'; r_F <= '1'; r_NO <= '0';
        wait for 10 ns;     -- w_O = 11111111 11111110    w_ZR = 0    w_NG = 1
    -- Condition 14:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '0'; r_NX <= '0'; r_ZY <= '0'; r_NY <= '0'; r_F <= '1'; r_NO <= '0';
        wait for 10 ns;     -- w_O = 11111111 11111111    w_ZR = 0    w_NG = 1
    -- Condition 15:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '0'; r_NX <= '1'; r_ZY <= '0'; r_NY <= '0'; r_F <= '1'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 00000000 00000001    w_ZR = 0    w_NG = 0
    -- Condition 16:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '0'; r_NX <= '0'; r_ZY <= '0'; r_NY <= '1'; r_F <= '1'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 11111111 11111111    w_ZR = 0    w_NG = 1
    -- Condition 17:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '0'; r_NX <= '0'; r_ZY <= '0'; r_NY <= '0'; r_F <= '0'; r_NO <= '0';
        wait for 10 ns;     -- w_O = 00000000 00000000    w_ZR = 1    w_NG = 0
    -- Condition 18:
        r_X <= "0000000000000000"; r_Y <= "1111111111111111"; 
        r_ZX <= '0'; r_NX <= '1'; r_ZY <= '0'; r_NY <= '1'; r_F <= '0'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 11111111 11111111    w_ZR = 0    w_NG = 1
    -- Condition 19:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '1'; r_NX <= '0'; r_ZY <= '1'; r_NY <= '0'; r_F <= '1'; r_NO <= '0';
        wait for 10 ns;     -- w_O = 00000000 00000000    w_ZR = 0    w_NG = 1
    -- Condition 20:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '1'; r_NX <= '1'; r_ZY <= '1'; r_NY <= '1'; r_F <= '1'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 00000000 00000001    w_ZR = 0    w_NG = 0
    -- Condition 21:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '1'; r_NX <= '1'; r_ZY <= '1'; r_NY <= '0'; r_F <= '1'; r_NO <= '0';
        wait for 10 ns;     -- w_O = 11111111 11111111    w_ZR = 0    w_NG = 1
    -- Condition 22:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '0'; r_NX <= '0'; r_ZY <= '1'; r_NY <= '1'; r_F <= '0'; r_NO <= '0';
        wait for 10 ns;     -- w_O = 00000000 00010001    w_ZR = 0    w_NG = 0
    -- Condition 23:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '1'; r_NX <= '1'; r_ZY <= '0'; r_NY <= '0'; r_F <= '0'; r_NO <= '0';
        wait for 10 ns;     -- w_O = 00000000 00000011    w_ZR = 0    w_NG = 0
    -- Condition 24:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '0'; r_NX <= '0'; r_ZY <= '1'; r_NY <= '1'; r_F <= '0'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 11111111 11101110    w_ZR = 0    w_NG = 1
    -- Condition 25:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '1'; r_NX <= '1'; r_ZY <= '0'; r_NY <= '0'; r_F <= '0'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 11111111 11111100    w_ZR = 0    w_NG = 1
    -- Condition 26:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '0'; r_NX <= '0'; r_ZY <= '1'; r_NY <= '1'; r_F <= '1'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 11111111 11101111    w_ZR = 0    w_NG = 1
    -- Condition 27:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '1'; r_NX <= '1'; r_ZY <= '0'; r_NY <= '0'; r_F <= '1'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 11111111 11111101    w_ZR = 0    w_NG = 1
    -- Condition 28:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '0'; r_NX <= '1'; r_ZY <= '1'; r_NY <= '1'; r_F <= '1'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 00000000 00010010    w_ZR = 0    w_NG = 0
    -- Condition 29:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '1'; r_NX <= '1'; r_ZY <= '0'; r_NY <= '1'; r_F <= '1'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 00000000 00000100    w_ZR = 0    w_NG = 0
    -- Condition 30:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '0'; r_NX <= '0'; r_ZY <= '1'; r_NY <= '1'; r_F <= '1'; r_NO <= '0';
        wait for 10 ns;     -- w_O = 00000000 00010000    w_ZR = 0    w_NG = 0
    -- Condition 31:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '1'; r_NX <= '1'; r_ZY <= '0'; r_NY <= '0'; r_F <= '1'; r_NO <= '0';
        wait for 10 ns;     -- w_O = 00000000 00000010    w_ZR = 0    w_NG = 0
    -- Condition 32:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '0'; r_NX <= '0'; r_ZY <= '0'; r_NY <= '0'; r_F <= '1'; r_NO <= '0';
        wait for 10 ns;     -- w_O = 00000000 00010010    w_ZR = 0    w_NG = 0
    -- Condition 33:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '0'; r_NX <= '1'; r_ZY <= '0'; r_NY <= '0'; r_F <= '1'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 00000000 00001110    w_ZR = 0    w_NG = 0
    -- Condition 34:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '0'; r_NX <= '0'; r_ZY <= '0'; r_NY <= '1'; r_F <= '1'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 11111111 11110010    w_ZR = 0    w_NG = 1
    -- Condition 35:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '0'; r_NX <= '0'; r_ZY <= '0'; r_NY <= '0'; r_F <= '0'; r_NO <= '0';
        wait for 10 ns;     -- w_O = 00000000 00000001    w_ZR = 0    w_NG = 0
    -- Condition 36:
        r_X <= "0000000000010001"; r_Y <= "0000000000000011"; 
        r_ZX <= '0'; r_NX <= '1'; r_ZY <= '0'; r_NY <= '1'; r_F <= '0'; r_NO <= '1';
        wait for 10 ns;     -- w_O = 00000000 00010011    w_ZR = 0    w_NG = 0
    end process; 
end behave;