library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity mux is
	port(	
	  	in_ctrl_sel : in std_logic;
		in_signal_a : in std_logic_vector(7 downto 0); 
		in_signal_b : in std_logic_vector(7 downto 0);
		out_mux     : out std_logic_vector(7 downto 0) 
	);
end entity;

architecture behavioral of mux is

	begin 
		control_c <= in_signal_b when (in_ctrl_sel='1') else 
					 in_signal_a;

end architecture;
		