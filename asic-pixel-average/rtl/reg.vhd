library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg is
	port(	
		in_ctrl_clk	 : in std_logic;
		in_ctrl_rst	 : in std_logic;
		in_ctrl_en	 : in std_logic;
		in_signal_d  : in std_logic_vector(15 downto 0);
		out_signal_d : out std_logic_vector(15 downto 0) 
	);
end entity;

architecture behavioral of reg is

	begin
		process(in_ctrl_rst, in_ctrl_clk, in_ctrl_en)
    	begin
	        if (to_unsigned(in_ctrl_rst) = 1) then
	            out_signal_d <= (others=>'0');
	        elsif (rising_edge(in_ctrl_clk) and (to_unsigned(in_ctrl_en) = 1)) then
	            out_signal_d <= in_signal_d;
	    	end if;
		end process;

end architecture;



	
