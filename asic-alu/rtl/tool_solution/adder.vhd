library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
	port(	
		in_signal_a  : in std_logic_vector(7 downto 0);
		in_signal_b  : in std_logic_vector(7 downto 0);
	  	out_signal   : out std_logic_vector(7 downto 0);
	  	out_overflow : out std_logic
	);
end entity;

architecture behavioral of adder is
	
	signal auxiliary_vector : std_logic_vector(8 downto 0);
	
	begin
		auxiliary_vector <= std_logic_vector(
								resize(unsigned(in_signal_a), in_signal_a'length+1) + 
								resize(unsigned(in_signal_b), in_signal_b'length+1)
							);

		out_signal   <= auxiliary_vector(7 downto 0);
		out_overflow <= auxiliary_vector(8);



end architecture;

