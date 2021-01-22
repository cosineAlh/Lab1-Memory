library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LED_DRIVER is
   generic(N:integer:=4);
   Port (CLK_50:in STD_LOGIC;
         RST: in STD_LOGIC;
         LED_X: out STD_LOGIC_VECTOR(7 downto 0);
         DATA: in STD_LOGIC_VECTOR(N-1 downto 0);
         LOAD: in STD_LOGIC;
         UPDN: in STD_LOGIC;
         CE: in STD_LOGIC);
end LED_DRIVER;

architecture Behavioral of LED_DRIVER is
component MEM
    Port (ADD: in STD_LOGIC_VECTOR(3 downto 0);
          LED_X:out STD_LOGIC_VECTOR(7 downto 0));
end component;

component CLK_DIV
     Port(CLK: in STD_LOGIC;
    OUTPUT: out STD_LOGIC);
end component;

component ADDR_CNTR
    generic(N:integer:=4);
    Port (Q: out STD_LOGIC_VECTOR(N-1 downto 0);
          D: in STD_LOGIC_VECTOR(N-1 downto 0);
          CLK:in STD_LOGIC;
          RESET: in STD_LOGIC;
          CE: in STD_LOGIC;
          LOAD: in STD_LOGIC;
          UPDN: in STD_LOGIC);
end component;

signal CLK_ENABLE: STD_LOGIC;
signal ADDR:STD_LOGIC_VECTOR(3 downto 0);
begin
    U0:CLK_DIV port map (CLK=>CLK_50,OUTPUT=>CLK_ENABLE);
    U1:ADDR_CNTR generic map(N=>4) port map (Q=>ADDR,LOAD=>LOAD,CE=>CE,UPDN=>UPDN,RESET=>RST,CLK=>CLK_ENABLE,D=>DATA);
    U2:MEM port map(ADD=>ADDR,LED_X=>LED_X);
end Behavioral;
