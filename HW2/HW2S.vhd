library ieee;
use ieee.std_logic_1164.all;

entity HW2S is
port(
	clk:in std_logic;
	Din:in std_logic_vector(3 downto 0);
	A, B, C, D:out std_logic_vector(3 downto 0));
end HW2S;

architecture main of HW2S is

component D_FF_B4I4O
	port(
		clk:in std_logic;
		Din:in std_logic_vector(3 downto 0);
		Dout:out std_logic_vector(3 downto 0)
	);
end component;

type arr is array (0 to 4) of std_logic_vector(3 downto 0);
signal Q:arr;
begin
	Q(0) <= Din;
	D_FF_generate: for i in 0 to 3 generate
		tmp_comp:D_FF_B4I4O port map(clk, Q(i), Q(i+1));
	end generate;
	A <= Q(4);
	B <= Q(3);
	C <= Q(2);
	D <= Q(1);
end main;