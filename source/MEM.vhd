library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MEM is
    Port (ADD: in STD_LOGIC_VECTOR(3 downto 0);
          LED_X:out STD_LOGIC_VECTOR(7 downto 0));
end MEM;

architecture Behavioral of MEM is

type RAM is array(0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
signal ram1_1 : RAM;
CONSTANT memory: RAM:= ("00000000","00000001","00000010","00000100",
                             "00001000","00001001","00001010", "00001011",
                             "00001100","00001101", "00001110","00001111",
                             "00010000", "00010001", "00010010", "00010011");
begin
ram1_1<=memory;
LED_X <= ram1_1(conv_integer(ADD)); -- Reading the data from RAM
end Behavioral;
