library IEEE;
use IEEE.Std_Logic_1164.all;

entity fulladder is
	port (
		A: in std_logic;
		B: in std_logic;
		Cin: in std_logic;
		Sum: out std_logic;
		Cout: out std_logic
	);
end entity;

architecture arc_fullader of fulladder is

	signal F1, F2, F3: std_logic;
	
	begin
		F1 <= A xor B;
		F2 <= A and B;
		F3 <= F1 and Cin;
		Sum <= F1 xor Cin;
		Cout <= F2 or F3;
end architecture;