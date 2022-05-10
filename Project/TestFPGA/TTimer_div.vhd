----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:29:27 05/09/2022 
-- Design Name: 
-- Module Name:    TTimer_div - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TTimer_div is
PORT(
        clk_in : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        clk_out: out STD_LOGIC
);
end TTimer_div;

architecture Behavioral of TTimer_div is
	signal temporal: STD_LOGIC;
   signal counter : integer range 0 to 12 := 0;
begin
process (reset, clk_in) 
begin
     if (reset = '1') then
     temporal <= '0';
     counter <= 0;
     elsif rising_edge(clk_in) then
			if (counter = 12) then
         temporal <= NOT(temporal);
         counter <= 0;
         else
         counter <= counter + 1;
         end if;
     end if;
end process;
     clk_out <= temporal;
end Behavioral;

