library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux is
	port(	
	  	in_ctrl_sel : in std_logic_vector(1 downto 0);
		in_signal_a : in std_logic_vector(7 downto 0); 
		in_signal_b : in std_logic_vector(7 downto 0);
		in_signal_c : in std_logic_vector(7 downto 0);
		in_signal_d : in std_logic_vector(7 downto 0);
		out_mux     : out std_logic_vector(7 downto 0) 
	);
end entity;

architecture behavioral of mux is

	begin 
		out_mux <= in_signal_d when (in_ctrl_sel = "11") else
				   in_signal_c when (in_ctrl_sel = "10") else
				   in_signal_b when (in_ctrl_sel = "01") else 
				   in_signal_a;

end architecture;
		