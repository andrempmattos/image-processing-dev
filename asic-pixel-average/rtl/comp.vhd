library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comp is
	port(	
		in_signal_a : in std_logic_vector(7 downto 0); 
		in_signal_b : in std_logic_vector(7 downto 0); 
	  	out_comp    : out std_logic
	);
end entity;

architecture behavioral of comp is

	begin 
		control_c <= '0' when std_logic(to_unsigned(in_signal_a) > to_unsigned(in_signal_b)) else 
					 '1';

end architecture;
		