library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLK_DIV is
    Port(CLK: in STD_LOGIC;
    OUTPUT: out STD_LOGIC);
end CLK_DIV;

architecture Behavioral of CLK_DIV is

signal count: INTEGER:=1;
signal tmp: STD_LOGIC :='0';

begin
    process(clk)
    begin
        if(rising_edge(clk))then
            count<=count+1;
            if(count=50000000)then
                tmp<=not tmp;
            count<=1;
            end if;
        end if;
    end process;
    OUTPUT<=tmp;
end Behavioral;
