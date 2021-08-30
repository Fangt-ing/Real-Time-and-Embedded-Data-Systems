library IEEE;
use IEEE.std_logic_1164.all;

entity lab1 is
  port (
      sw : in std_logic_vector(9 downto 0); -- slide switch as the inputs.
      led : out std_logic_vector(9 downto 0) -- led as the outputs.
      );
    end entity lab1;

architecture top_level of lab1 is

begin
    led <= sw;
end architecture top_level;