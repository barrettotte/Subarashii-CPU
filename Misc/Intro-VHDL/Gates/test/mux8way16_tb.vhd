library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux8way16_tb is
end entity;

architecture behavioral of mux8way16_tb is
    component mux8way16
        port(
            a   : in  std_logic_vector(15 downto 0);
            b   : in  std_logic_vector(15 downto 0);
            c   : in  std_logic_vector(15 downto 0);
            d   : in  std_logic_vector(15 downto 0);
            e   : in  std_logic_vector(15 downto 0);
            f   : in  std_logic_vector(15 downto 0);
            g   : in  std_logic_vector(15 downto 0);
            h   : in  std_logic_vector(15 downto 0);
            sel : in  std_logic_vector( 2 downto 0);
            o   : out std_logic_vector(15 downto 0)
        );
    end component;
  
    signal aa:unsigned(15 downto 0) := X"0001";
    signal bb:unsigned(15 downto 0) := X"0002";
    signal cc:unsigned(15 downto 0) := X"0003";
    signal dd:unsigned(15 downto 0) := X"0004";
    signal ee:unsigned(15 downto 0) := X"0005";
    signal ff:unsigned(15 downto 0) := X"0006";
    signal gg:unsigned(15 downto 0) := X"0007";
    signal hh:unsigned(15 downto 0) := X"0008";
    signal ss:unsigned(2 downto 0)  := "000";
    signal oo:std_logic_vector(15 downto 0);
  
    begin
    dut:mux8way16 port map(
        std_logic_vector(aa),
        std_logic_vector(bb),
        std_logic_vector(cc),
        std_logic_vector(dd),
        std_logic_vector(ee),
        std_logic_vector(ff),
        std_logic_vector(gg),
        std_logic_vector(hh),
        std_logic_vector(ss),
        oo
    );
    process
        begin
        wait for 10 ns;
        ss <= ss + 1;
    end process;
end behavioral;