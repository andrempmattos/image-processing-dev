library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
	port(	
		in_signal_a : in std_logic_vector(15 downto 0);
		in_signal_b : in std_logic_vector(15 downto 0);
	  	out_signal  : out std_logic_vector(15 downto 0)
	);
end entity;

architecture behavioral of adder is
	
	begin
		out_signal <= std_logic_vector(unsigned(in_signal_a) + unsigned(in_signal_b));

end architecture;
