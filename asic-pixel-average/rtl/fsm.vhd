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

	type state_type is (IDLE, RST, ACC, DIV);
	signal current_state : state_type := IDLE;
	signal next_state : state_type := IDLE;

	begin
		-- Next state logic
		process(current_state, in_ctrl_start, in_ctrl_comp)
		begin
			next_state <= current_state;
			case current_state is
				when IDLE =>
					if (in_ctrl_start = '1') then
						next_state <= RST;
					end if;
				when RST => 
					next_state <= ACC;
				when ACC =>
					if (in_ctrl_comp = '1') then
						next_state <= DIV;
					end if;
				when DIV =>
					next_state <= IDLE;
			end case;
		end process;

		-- State register
		process(in_ctrl_clk)
		begin
			if rising_edge(in_ctrl_clk) then
				current_state <= next_state; 
			end if;
		end process;

		-- Output logic
		process(current_state)
		begin
			case current_state is
				when IDLE => 
					out_ctrl_en    <= '0';
					out_ctrl_rst   <= '0';
					out_ctrl_sel_a <= '0';
					out_ctrl_sel_b <= '0';
					out_ctrl_ready <= '1';
				when RST =>
					out_ctrl_en    <= '0';
					out_ctrl_rst   <= '1';
					out_ctrl_sel_a <= '0';
					out_ctrl_sel_b <= '0';
					out_ctrl_ready <= '0';
				when ACC =>
					out_ctrl_en    <= '1';
					out_ctrl_rst   <= '0';
					out_ctrl_sel_a <= '0';
					out_ctrl_sel_b <= '0';
					out_ctrl_ready <= '0';
				when DIV =>
					out_ctrl_en    <= '1';
					out_ctrl_rst   <= '0';
					out_ctrl_sel_a <= '1';
					out_ctrl_sel_b <= '1';
					out_ctrl_ready <= '0';
			end case;
		end process;

end architecture;


	