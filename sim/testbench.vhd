library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture Behavioral of testbench is
component LED_DRIVER
   generic(N:integer:=4);
   Port (CLK_50:in STD_LOGIC;
         RST: in STD_LOGIC;
         LED_X: out STD_LOGIC_VECTOR(7 downto 0);
         DATA: in STD_LOGIC_VECTOR(N-1 downto 0);
         LOAD: in STD_LOGIC;
         UPDN: in STD_LOGIC;
         CE: in STD_LOGIC);
end component;

signal CLK_50: STD_LOGIC:='0';
signal RST: STD_LOGIC:='0';
signal LED_X: STD_LOGIC_VECTOR(7 downto 0);
signal DATA: STD_LOGIC_VECTOR(3 downto 0);
signal LOAD: STD_LOGIC:='0';
signal UPDN: STD_LOGIC:='0';
signal CE: STD_LOGIC:='0';
begin
uut : LED_DRIVER port map(
    CLK_50=>CLK_50,
    RST=>RST,
    LED_X=>LED_X,
    DATA=>DATA,
    LOAD=>LOAD,
    UPDN=>UPDN,
    CE=>CE);
process
begin
    CLK_50<='1';
    RST<='1';
    DATA(0)<='0';
    DATA(1)<='1';
    DATA(2)<='0';
    DATA(3)<='1';
    LOAD<='1';
    UPDN<='1';
    CE<='1';
    wait for 20 ns;
    CLK_50<='1';
    RST<='0';
    DATA(0)<='0';
    DATA(1)<='1';
    DATA(2)<='0';
    DATA(3)<='1';
    LOAD<='1';
    UPDN<='1';
    CE<='1';
    wait for 20ns;
end process;
end Behavioral;
