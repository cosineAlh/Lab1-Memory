library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ADDR_CNTR is
    generic(N:integer:=4);
    Port (Q: out STD_LOGIC_VECTOR(N-1 downto 0);
          D: in STD_LOGIC_VECTOR(N-1 downto 0);
          CLK:in STD_LOGIC;
          RESET: in STD_LOGIC;
          CE: in STD_LOGIC;
          LOAD: in STD_LOGIC;
          UPDN: in STD_LOGIC);
end ADDR_CNTR;

architecture Behavioral of ADDR_CNTR is
signal tmp: STD_LOGIC_VECTOR(N-1 downto 0);
begin
    process(CLK,RESET)
    begin
    if(RESET='1')then
        tmp<= (others => '0');
    elsif(rising_edge(CLK))then
        if(LOAD='1')then
            tmp<=D;
        elsif(CE='1'and LOAD='0')then
            if(UPDN='1')then
            tmp<=tmp+1;
            elsif(UPDN='0')then
            tmp<=tmp-1;
            end if;
         end if;
    end if;
    end process;
    Q<=tmp;
end Behavioral;
