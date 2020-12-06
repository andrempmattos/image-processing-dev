library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm is

	port(	
		in_ctrl_clk	   : in std_logic;
		in_ctrl_start  : in std_logic;
		in_ctrl_comp   : in std_logic;
		out_ctrl_en	   : out std_logic;
		out_ctrl_rst   : out std_logic;
		out_ctrl_sel_a : out std_logic;
		out_ctrl_sel_b : out std_logic;
		out_ctrl_ready : out std_logic
	);
end entity;

architecture behavioral of fsm is

	type state_type is (S0,S1,S2);
	signal current_state : state_type;
	signal next_state : state_type;

	begin
		-- Next state logic
		process(current_state, in_ctrl_start, in_ctrl_comp)
		begin
			next_state <= current_state;
			case current_state is
				when S0 =>
					if in_ctrl_start = '1' then
						next_state <= S1;
					end if;
				when S1 => 
					next_state <= S2;
				when S2 =>
					if in_ctrl_comp = '0' then
						next_state <= S0;
					end if;
			end case;
		end process;

		-- State register
		process(in_ctrl_clk, in_ctrl_rst)
		begin
			if in_ctrl_rst = '1' then 
				current_state <= S0;
			elsif rising_edge(in_ctrl_clk) then
				current_state <= next_state; 
			end if;
		end process;

		-- Output logic
		process(current_state)
		begin
			case current_state is
				when S0 => 
					out_ctrl_en    <= '0';
					out_ctrl_rst   <= '1';
					out_ctrl_sel_a <= '0';
					out_ctrl_sel_b <= '0';
					out_ctrl_ready <= '0';
				when S1 =>
					out_ctrl_en    <= '0';
					out_ctrl_rst   <= '1';
					out_ctrl_sel_a <= '0';
					out_ctrl_sel_b <= '0';
					out_ctrl_ready <= '0';
				when S2 =>
					out_ctrl_en    <= '0';
					out_ctrl_rst   <= '1';
					out_ctrl_sel_a <= '0';
					out_ctrl_sel_b <= '0';
					out_ctrl_ready <= '0';
			end case;
		end process;

end architecture;


	