library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity count is
	port(	
		in_ctrl_clk : in std_logic;
		in_ctrl_rst	: in std_logic;
		out_count 	: out std_logic_vector(7 downto 0) 
	);
end entity;

architecture behavioral of count is

signal count_buffer : std_logic_vector(7 downto 0);

	begin
		process(in_ctrl_rst, in_ctrl_clk)
		begin
			if (to_unsigned(in_ctrl_rst) = 1) then
				count_buffer <= (others=>'0');
				out_count    <= (others=>'0');
			elsif (rising_edge(in_ctrl_clk)) then
				count_buffer <= std_logic_vector(to_unsigned(count_buffer) + 1);
				out_count    <= count_buffer;				
			end if;					 
		end process;

end architecture;