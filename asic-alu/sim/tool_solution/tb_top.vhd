library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_top is
end entity;

architecture behavioral of tb_top is

component top is
    port(
        in_mux       : in std_logic_vector(1 downto 0);
        in_adder     : in std_logic_vector(7 downto 0);
        out_result   : out std_logic_vector(7 downto 0);
        out_overflow : out std_logic
    );
end component;

    signal s_in_mux       : std_logic_vector(1 downto 0) := "00";
    signal s_in_adder     : std_logic_vector(7 downto 0) := x"00";
    signal s_out_result   : std_logic_vector(7 downto 0) := x"00";
    signal s_out_overflow : std_logic := '0';
	
begin

    system: top port map(
                s_in_mux,
                s_in_adder,
                s_out_result,
                s_out_overflow
            );

	process
    begin
        -- 26 - 25 = 1
        s_in_mux <= "00";
        s_in_adder <= x"1A";
        wait for 10 ns;
        assert (s_out_result = x"01") report "Error: Invalid result!" severity error;

        -- 18 - 17 = 1
        s_in_mux <= "01";
        s_in_adder <= x"12";
        wait for 10 ns;
        assert (s_out_result = x"01") report "Error: Invalid result!" severity error;

        -- 10 - 9 = 1
        s_in_mux <= "10";
        s_in_adder <= x"0A";
        wait for 10 ns;
        assert (s_out_result = x"01") report "Error: Invalid result!" severity error;

        -- 2 - 1 = 1
        s_in_mux <= "11";
        s_in_adder <= x"02";
        wait for 10 ns;
        assert (s_out_result = x"01") report "Error: Invalid result!" severity error;

        -- 1 - 1 = 0
        s_in_mux <= "11";
        s_in_adder <= x"01";
        wait for 10 ns;
        assert (s_out_result = x"00") report "Error: Invalid result!" severity error;

        -- 0 - 1 = -1
        s_in_mux <= "11";
        s_in_adder <= x"00";
        wait for 10 ns;
        assert (s_out_result = x"FF") report "Error: Invalid result!" severity error;

        --wait until ready = '1';        

        assert false report "Test completed with success!" severity note;
        --  Wait forever; this will finish the simulation.
        wait;
    end process;

end architecture;

