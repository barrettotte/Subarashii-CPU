library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram4K is
	port(
        i       : in  std_logic_vector(15 downto 0);
        address : in  std_logic_vector(11 downto 0);
		en      : in  std_logic;
        clk     : in  std_logic;
		o       : out std_logic_vector(15 downto 0)
	);
end entity ram4K;

architecture rtl of ram4K is
    signal r1, r2, r3, r4, r5, r6, r7, r8 : std_logic;
    signal ro1, ro2, ro3, ro4, ro5, ro6, ro7, ro8 : std_logic_vector(15 downto 0);
begin
    dmux8way_1  : entity work.dmux8way  port map(en, address(11 downto 9), r1, r2, r3, r4, r5, r6, r7, r8);
    ram512_1    : entity work.ram512    port map(i, r1, clk, addr(8 downto 0) ro1);
    ram512_2    : entity work.ram512    port map(i, r2, clk, addr(8 downto 0) ro2);
    ram512_3    : entity work.ram512    port map(i, r3, clk, addr(8 downto 0) ro3);
    ram512_4    : entity work.ram512    port map(i, r4, clk, addr(8 downto 0) ro4);
    ram512_5    : entity work.ram512    port map(i, r5, clk, addr(8 downto 0) ro5);
    ram512_6    : entity work.ram512    port map(i, r6, clk, addr(8 downto 0) ro6);
    ram512_7    : entity work.ram512    port map(i, r7, clk, addr(8 downto 0) ro7);
    ram512_8    : entity work.ram512    port map(i, r8, clk, addr(8 downto 0) ro8);
    mux8way16_1 : entity work.mux8way16 port map(r1o, r2o, r3o, r4o, r5o, r6o, r7o, r8o, address(11 downto 9), o);
end rtl;