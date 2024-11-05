library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity HW1 is 
port(
	A : in std_logic_vector(3 downto 0);
	C: out std_logic_vector(15 downto 0)
);
end HW1;

architecture main of HW1 is
signal var :unsigned(15 downto 0) := "1111111111110000";
begin
	C <= std_logic_vector(var rol to_integer(unsigned(A)));
end main;
