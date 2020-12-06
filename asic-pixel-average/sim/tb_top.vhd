library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_top is
end entity;

architecture behavioral of tb_top is

component top is
    port(
        top_clk      : in std_logic;
        top_start	 : in std_logic;
        top_ready    : out std_logic;
        top_mem_data : in std_logic_vector(7 downto 0);
        top_mem_addr : out std_logic_vector(7 downto 0);
        top_average  : out std_logic_vector(7 downto 0)
    );
end component;

component tb_ram is
    port(   
        addr: in  std_logic_vector(7 downto 0);
        data: out std_logic_vector(7 downto 0)  
    );
end component;
	
    signal clock    : std_logic := '0';
    signal start    : std_logic := '0'; 
    signal ready    : std_logic := '0';
    signal mem_data : std_logic_vector(7 downto 0) := x"00";
    signal mem_addr : std_logic_vector(7 downto 0) := x"00";
	
begin

    system: top port map(
                clock,
                start,
                ready,
                mem_data,
                mem_addr,
                average
            );

    memory: tb_ram port map(
                mem_data,
                mem_addr
            );
    
    clock <= not clock after 10 ns; -- when finished /= '1' else '0';

	process
    begin
        start <= '1';
        wait until ready = '1';        

        assert average = x"a0" 
            report "bad sum value" severity error;

    assert false report "end of test" severity note;
    --  Wait forever; this will finish the simulation.
    wait;
  end process;

end architecture;

