library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
  port (
    sw    : in std_logic_vector(9 downto 0);
    clk   : in std_logic;
    click : in std_logic;
    reset : in std_logic;

    led  : out std_logic_vector(9 downto 0);
    hex0 : out std_logic_vector(7 downto 0)
  );
end entity;

architecture rtl of counter is
  -- holder is to create registers
  signal holder : std_logic_vector(2 downto 0) := "000";
  -- counting is to enable counting
  signal counting : unsigned(3 downto 0) := "0000";

begin
  the_register : process (clk)
  begin
    if rising_edge(clk) then
      holder <= holder(1 downto 0) & click;
    end if;
  end process;

  the_counter : process (clk, reset) --click is not needed for sensitivity list, as click will comsume CPU resources
  -- reset as asynchronous, every time 'reset' is pushed, the process will be re-evaluated.
  begin
    if reset = '0' then
      counting <= "0000";
    elsif rising_edge(clk) then
      if holder(1) = '0' and holder(2) = '1' then
        counting <= counting + 1;
      end if;
    end if;
  end process;

  led(9 downto 4) <= sw(9 downto 4);
--   led(3 downto 0) <= counting(3 downto 0);
  with counting select
      led(3 downto 0) <= 
      "0000" when "0000", --0
      "0001" when "0001", --1
      "0010" when "0010", --2
      "0011" when "0011", --3
      "0100" when "0100", --4
      "0101" when "0101", --5
      "0110" when "0110", --6
      "0111" when "0111", --7
      "1000" when "1000", --8
      "1001" when "1001", --9
      "1010" when "1010", --A
      "1011" when "1011", --b
      "1100" when "1100", --C
      "1101" when "1101", --d
      "1110" when "1110", --E
      "1111" when "1111", --F
      "0000" when others; --7seg dot is lighted

  with counting select
    hex0 <=
    "11000000" when "0000", --0
    "11111001" when "0001", --1
    "10100100" when "0010", --2
    "10110000" when "0011", --3
    "10011001" when "0100", --4
    "10010010" when "0101", --5
    "10000010" when "0110", --6
    "11111000" when "0111", --7
    "10000000" when "1000", --8
    "10010000" when "1001", --9
    "10001000" when "1010", --A
    "10000011" when "1011", --b
    "11000110" when "1100", --C
    "10100001" when "1101", --d
    "10000110" when "1110", --E
    "10001110" when "1111", --F
    "01111111" when others; --7seg dot is lighted
end architecture;