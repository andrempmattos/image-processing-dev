library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity top is
    port(
        top_clk      : in std_logic;
        top_start	 : in std_logic;
        top_ready    : out std_logic;
        top_mem_data : in std_logic_vector(7 downto 0);
        top_mem_addr : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behavioral of top is

    signal signal_reg_in: std_logic_vector(15 downto 0);
    signal signal_reg_out: std_logic_vector(15 downto 0);
    signal count_out: std_logic_vector(7 downto 0);
    signal control_top_c0: std_logic;
    signal control_top_ena: std_logic;
    signal control_top_rst: std_logic;
    signal control_top_busy: std_logic;

    component adder is
        port (
            in_signal_a  : in std_logic_vector(15 downto 0);
            in_signal_b  : in std_logic_vector(15 downto 0);
            out_signal   : out std_logic_vector(15 downto 0)
        );
    end component;

    component comp is
        port (
            in_signal_a : in std_logic_vector(7 downto 0); 
            in_signal_b : in std_logic_vector(7 downto 0); 
            out_comp    : out std_logic
        );
    end component;

    component fsm is
        port (
            in_ctrl_clk    : in std_logic;
            in_ctrl_start  : in std_logic;
            in_ctrl_comp   : in std_logic;
            out_ctrl_en    : out std_logic;
            out_ctrl_rst   : out std_logic;
            out_ctrl_sel_a : out std_logic;
            out_ctrl_sel_b : out std_logic;
            out_ctrl_ready : out std_logic
        );
    end component;

    component count is
        port (
            in_ctrl_clk : in std_logic;
            in_ctrl_rst : in std_logic;
            out_count   : out std_logic_vector(7 downto 0) 
        );
    end component;

    component reg is
        port (
            in_ctrl_clk  : in std_logic;
            in_ctrl_rst  : in std_logic;
            in_ctrl_en   : in std_logic;
            in_signal_d  : in std_logic_vector(15 downto 0);
            out_signal_d : out std_logic_vector(15 downto 0) 
        );
    end component;

begin
	U1: adder port map(top_A,signal_reg_out,signal_reg_in);
	U2: comp  port map(count_out,top_B,control_top_c0);
    U3: fsm   port map(top_clk,top_start,control_top_c0,control_top_ena,control_top_rst, control_top_busy);
    U4: count port map(top_clk,control_top_rst,control_top_ena,count_out);
    U5: reg   port map(signal_reg_in,top_clk,control_top_rst,control_top_ena,signal_reg_out);

	top_S <= signal_reg_out;
    top_busy <= control_busy;

end architecture;
