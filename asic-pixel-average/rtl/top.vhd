library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
    port(
        top_clk      : in std_logic;
        top_start	 : in std_logic;
        top_ready    : out std_logic;
        top_mem_data : in std_logic_vector(7 downto 0);
        top_mem_addr : out std_logic_vector(7 downto 0);
        top_average  : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behavioral of top is

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

    component mux is
        port (
            in_ctrl_sel : in std_logic;
            in_signal_a : in std_logic_vector(7 downto 0); 
            in_signal_b : in std_logic_vector(7 downto 0);
            out_mux     : out std_logic_vector(7 downto 0) 
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

    signal buffer_count    : std_logic_vector(7 downto 0);
    signal buffer_mem_data : std_logic_vector(15 downto 0);
    signal buffer_shift_8  : std_logic_vector(15 downto 0);
    signal buffer_shift_11 : std_logic_vector(15 downto 0);
    signal buffer_mux_a    : std_logic_vector(15 downto 0);
    signal buffer_mux_b    : std_logic_vector(15 downto 0);
    signal buffer_adder    : std_logic_vector(15 downto 0);
    signal buffer_acc      : std_logic_vector(15 downto 0);


begin

    buffer_count <= top_mem_addr;
    buffer_mem_data <= x"00" & top_mem_data;
    buffer_shift_8  <= x"00" & buffer_acc(15 downto 8);
    buffer_shift_11 <= "00000000000" & buffer_acc(15 downto 11);

    top_average <= acc(7 downto 0);

	adder: adder port map(
                buffer_mux_a,
                buffer_mux_b,
                buffer_adder
            );

    mux_a: mux port map(
                ctrl_sel_a
                buffer_reg,
                buffer_shift_11,
                buffer_mux_a
            );

    mux_b: mux port map(
                ctrl_sel_b
                buffer_mem_data,
                buffer_shift_8,
                buffer_mux_b
            );

    comp: comp port map(
                buffer_count,
                std_logic_vector(225),
                ctrl_comp
            );

    count: count port map(
                top_clk,
                ctrl_rst,
                buffer_count
            );

    acc: reg port map(
                top_clk,
                ctrl_rst,
                ctrl_en,
                buffer_adder,
                buffer_acc
            );

    fsm: fsm port map(
                ctrl_clk,
                top_start,
                ctrl_comp,
                ctrl_en,
                ctrl_rst,
                ctrl_sel_a,
                ctrl_sel_b,
                top_ready
            );

end architecture;
