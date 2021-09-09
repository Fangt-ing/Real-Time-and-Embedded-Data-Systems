library IEEE;
use ieee.std_logic_1164.all;

entity cl is
  port (
      sw : in std_logic_vector (3 downto 0); -- mannual counting
      --tocount : in std_logic;
		
		--tocountled : out std_logic;
      led : out std_logic_vector (3 downto 0);
      sevenled : out std_logic_vector(0 to 7) -- seven as the acronym for 7-segment display.
  ) ;
end cl;

architecture counter of cl is

begin
  led <= sw;
  --tocountled <= tocount;

    with sw select
    sevenled <=  "11111110" when "0000", --7-segment display 0
        "10011111" when "0001", --1
        "00100101" when "0010", --2
        "00001101" when "0011", --3
        "10011001" when "0100", --4		  
        "01001001" when "0101", --5
        "01000001" when "0110", --6
        "00011111" when "0111", --7
        "00000001" when "1000", --8
        "00001001" when "1001", --9
        "11111111" when others;
        --A:1010
        --b:1011
        --C:1100
        --d:1101
        --E:1110
        --F:1111
end counter;