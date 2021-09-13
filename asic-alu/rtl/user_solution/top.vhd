library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
    port(
        in_mux       : in std_logic_vector(1 downto 0);
        in_adder     : in std_logic_vector(7 downto 0);
        out_result   : out std_logic_vector(7 downto 0);
        out_overflow : out std_logic
    );
end entity;

architecture behavioral of top is

    component adder is
        port(   
            A: in std_logic_vector(7 downto 0);
            B: in std_logic_vector(7 downto 0);
            C: in std_logic;
            S: out std_logic_vector(7 downto 0);
            Overflow: out std_logic
        );
    end component;

    component mux is
        port(   
            in_ctrl_sel : in std_logic_vector(1 downto 0);
            in_signal_a : in std_logic_vector(7 downto 0); 
            in_signal_b : in std_logic_vector(7 downto 0);
            in_signal_c : in std_logic_vector(7 downto 0);
            in_signal_d : in std_logic_vector(7 downto 0);
            out_mux     : out std_logic_vector(7 downto 0) 
        );
    end component;

    signal s_mux_output      : std_logic_vector(7 downto 0);

    constant CONST_INPUT_A : integer range -128 to 127 := -25;
    constant CONST_INPUT_B : integer range -128 to 127 := -17;
    constant CONST_INPUT_C : integer range -128 to 127 := -9;
    constant CONST_INPUT_D : integer range -128 to 127 := -1;


begin

	c1_adder: adder port map(
                A => in_adder,
                B => s_mux_output,
                C => '0',
                S => out_result,
                Overflow => out_overflow
            );

    c2_mux: mux port map(
                in_ctrl_sel => in_mux,
                in_signal_a => std_logic_vector(to_signed((CONST_INPUT_A), 8)),
                in_signal_b => std_logic_vector(to_signed((CONST_INPUT_B), 8)),
                in_signal_c => std_logic_vector(to_signed((CONST_INPUT_C), 8)),
                in_signal_d => std_logic_vector(to_signed((CONST_INPUT_D), 8)),
                out_mux     => s_mux_output
            );

end architecture;
