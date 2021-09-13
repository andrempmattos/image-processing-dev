library IEEE;
use IEEE.Std_Logic_1164.all;

entity adder is
	port (
		A: in std_logic_vector(7 downto 0);
		B: in std_logic_vector(7 downto 0);
		C: in std_logic;
		S: out std_logic_vector(7 downto 0);
		Overflow: out std_logic
	);
end entity;

architecture arc_adder of adder is

	component fulladder is
		port (
			A: in std_logic;
			B: in std_logic;
			Cin: in std_logic;
			Sum: out std_logic;
			Cout: out std_logic
		);
	end component;
	
	component modb is
		port (
			I0: in std_logic;
			I1: in std_logic;
			I2: in std_logic;
			R: out std_logic
		);
	end component;

	signal E: std_logic_vector(7 downto 0);

	begin
		FA0: fulladder port map (A(0), B(0), C,    S(0), E(0));
		FA1: fulladder port map (A(1), B(1), E(0), S(1), E(1));
		FA2: fulladder port map (A(2), B(2), E(1), S(2), E(2));
		FA3: fulladder port map (A(3), B(3), E(2), S(3), E(3));
		FA4: fulladder port map (A(4), B(4), E(3), S(4), E(4));
		FA5: fulladder port map (A(5), B(5), E(4), S(5), E(5));
		FA6: fulladder port map (A(6), B(6), E(5), S(6), E(6));
		FA7: fulladder port map (A(7), B(7), E(6), S(7), E(7));
		
		Overflow <= E(6) xor E(7);
		
end architecture;