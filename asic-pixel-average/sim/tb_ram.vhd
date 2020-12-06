library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_ram is
    port( 	
        addr:	in	std_logic_vector(7 downto 0);
    	data:	out	std_logic_vector(7 downto 0)	
	);
end entity;

architecture behavioral of tb_ram is
    
    signal dataout: integer range 0 to 255;

    begin

        data <= std_logic_vector(to_unsigned(dataout, 8));
        dataout <=	255 when addr=x"00" else
            		255 when addr=x"01" else
            		255 when addr=x"02" else
            		255 when addr=x"03" else
            		250 when addr=x"04" else
            		231 when addr=x"05" else
            		224 when addr=x"06" else
            		228 when addr=x"07" else
            		235 when addr=x"08" else
            		244 when addr=x"09" else
            		253 when addr=x"0a" else
            		254 when addr=x"0b" else
            		255 when addr=x"0c" else
            		255 when addr=x"0d" else
            		255 when addr=x"0e" else
            		255 when addr=x"0f" else
            		255 when addr=x"10" else
            		254 when addr=x"11" else
            		212 when addr=x"12" else
            		179 when addr=x"13" else
            		194 when addr=x"14" else
            		210 when addr=x"15" else
            		222 when addr=x"16" else
            		230 when addr=x"17" else
            		233 when addr=x"18" else
            		232 when addr=x"19" else
            		243 when addr=x"1a" else
            		254 when addr=x"1b" else
            		254 when addr=x"1c" else
            		255 when addr=x"1d" else
            		255 when addr=x"1e" else
            		254 when addr=x"1f" else
            		179 when addr=x"20" else
            		152 when addr=x"21" else
            		176 when addr=x"22" else
            		193 when addr=x"23" else
            		207 when addr=x"24" else
            		218 when addr=x"25" else
            		226 when addr=x"26" else
            		231 when addr=x"27" else
            		232 when addr=x"28" else
            		228 when addr=x"29" else
            		235 when addr=x"2a" else
            		254 when addr=x"2b" else
            		255 when addr=x"2c" else
            		254 when addr=x"2d" else
            		189 when addr=x"2e" else
            		123 when addr=x"2f" else
            		151 when addr=x"30" else
            		170 when addr=x"31" else
            		185 when addr=x"32" else 
            		198 when addr=x"33" else
                    209 when addr=x"34" else
                    225 when addr=x"35" else
                    228 when addr=x"36" else
                    225 when addr=x"37" else
                    225 when addr=x"38" else
                    216 when addr=x"39" else
                    236 when addr=x"3a" else
                    254 when addr=x"3b" else
                    244 when addr=x"3c" else
                    98  when addr=x"3d" else
                    120 when addr=x"3e" else
                    142 when addr=x"3f" else
                    159 when addr=x"40" else
                    173 when addr=x"41" else
                    185 when addr=x"42" else
                    199 when addr=x"43" else
                    226 when addr=x"44" else
                    228 when addr=x"45" else
                    215 when addr=x"46" else
                    214 when addr=x"47" else
                    210 when addr=x"48" else
                    201 when addr=x"49" else
                    252 when addr=x"4a" else
                    186 when addr=x"4b" else
                    79  when addr=x"4c" else
                    109 when addr=x"4d" else
                    129 when addr=x"4e" else
                    145 when addr=x"4f" else
                    159 when addr=x"50" else
                    171 when addr=x"51" else
                    181 when addr=x"52" else
                    194 when addr=x"53" else
                    199 when addr=x"54" else
                    199 when addr=x"55" else
                    200 when addr=x"56" else
                    198 when addr=x"57" else
                    186 when addr=x"58" else
                    230 when addr=x"59" else
                    140 when addr=x"5a" else
                    67  when addr=x"5b" else
                    94  when addr=x"5c" else
                    113 when addr=x"5d" else
                    129 when addr=x"5e" else
                    143 when addr=x"5f" else
                    154 when addr=x"60" else
                    164 when addr=x"61" else
                    172 when addr=x"62" else
                    178 when addr=x"63" else
                    182 when addr=x"64" else
                    184 when addr=x"65" else
                    182 when addr=x"66" else
                    173 when addr=x"67" else
                    205 when addr=x"68" else
                    123 when addr=x"69" else
                    54  when addr=x"6a" else
                    77  when addr=x"6b" else
                    96  when addr=x"6c" else
                    112 when addr=x"6d" else
                    125 when addr=x"6e" else
                    136 when addr=x"6f" else
                    146 when addr=x"70" else
                    154 when addr=x"71" else
                    160 when addr=x"72" else
                    164 when addr=x"73" else
                    166 when addr=x"74" else
                    163 when addr=x"75" else
                    155 when addr=x"76" else
                    187 when addr=x"77" else
                    136 when addr=x"78" else
                    48  when addr=x"79" else
                    58  when addr=x"7a" else
                    77  when addr=x"7b" else
                    93  when addr=x"7c" else
                    106 when addr=x"7d" else
                    117 when addr=x"7e" else
                    127 when addr=x"7f" else
                    134 when addr=x"80" else
                    140 when addr=x"81" else
                    144 when addr=x"82" else
                    145 when addr=x"83" else
                    143 when addr=x"84" else
                    133 when addr=x"85" else
                    186 when addr=x"86" else
                    177 when addr=x"87" else
                    47  when addr=x"88" else
                    49  when addr=x"89" else
                    57  when addr=x"8a" else
                    72  when addr=x"8b" else
                    85  when addr=x"8c" else
                    96  when addr=x"8d" else
                    106 when addr=x"8e" else
                    113 when addr=x"8f" else
                    119 when addr=x"90" else
                    122 when addr=x"91" else
                    123 when addr=x"92" else 
                    120 when addr=x"93" else
                    107 when addr=x"94" else
                    205 when addr=x"95" else
                    243 when addr=x"96" else
                    60  when addr=x"97" else
                    48  when addr=x"98" else
                    48  when addr=x"99" else
                    52  when addr=x"9a" else
                    62  when addr=x"9b" else
                    73  when addr=x"9c" else
                    83  when addr=x"9d" else
                    90  when addr=x"9e" else
                    96  when addr=x"9f" else
                    98  when addr=x"a0" else
                    99  when addr=x"a1" else
                    93  when addr=x"a2" else
                    93  when addr=x"a3" else
                    249 when addr=x"a4" else
                    254 when addr=x"a5" else
                    168 when addr=x"a6" else
                    47  when addr=x"a7" else
                    48  when addr=x"a8" else
                    48  when addr=x"a9" else
                    48  when addr=x"aa" else
                    51  when addr=x"ab" else
                    58  when addr=x"ac" else
                    65  when addr=x"ad" else
                    70  when addr=x"ae" else
                    72  when addr=x"af" else
                    70  when addr=x"b0" else
                    60  when addr=x"b1" else
                    180 when addr=x"b2" else
                    254 when addr=x"b3" else
                    255 when addr=x"b4" else
                    252 when addr=x"b5" else
                    124 when addr=x"b6" else
                    47  when addr=x"b7" else
                    48  when addr=x"b8" else
                    48  when addr=x"b9" else
                    48  when addr=x"ba" else
                    48  when addr=x"bb" else
                    48  when addr=x"bc" else
                    49  when addr=x"bd" else
                    49  when addr=x"be" else
                    47  when addr=x"bf" else
                    137 when addr=x"c0" else
                    254 when addr=x"c1" else
                    255 when addr=x"c2" else
                    255 when addr=x"c3" else
                    255 when addr=x"c4" else
                    252 when addr=x"c5" else
                    160 when addr=x"c6" else
                    55  when addr=x"c7" else
                    47  when addr=x"c8" else
                    48  when addr=x"c9" else
                    48  when addr=x"ca" else
                    48  when addr=x"cb" else
                    47  when addr=x"cc" else
                    58  when addr=x"cd" else
                    171 when addr=x"ce" else
                    254 when addr=x"cf" else
                    255 when addr=x"d0" else
                    255 when addr=x"d1" else
                    255 when addr=x"d2" else
                    255 when addr=x"d3" else
                    255 when addr=x"d4" else
                    255 when addr=x"d5" else
                    239 when addr=x"d6" else
                    173 when addr=x"d7" else
                    123 when addr=x"d8" else
                    109 when addr=x"d9" else
                    125 when addr=x"da" else
                    177 when addr=x"db" else
                    242 when addr=x"dc" else
                    254 when addr=x"dd" else
                    255 when addr=x"de" else
                    255 when addr=x"df" else
                    255 when addr=x"e0" else
    		        0;
                    
end architecture;      




















































