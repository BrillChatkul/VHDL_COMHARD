----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:49:06 05/10/2022 
-- Design Name: 
-- Module Name:    Shiftbit - Behavioral 
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

entity Shiftbit is
port(	clk_1: in std_logic;
		setshiftbit: out std_logic_vector(0 to 2)
);
end Shiftbit;

architecture Behavioral of Shiftbit is
signal shiftNow: std_logic_vector(0 to 2);
begin
process(clk_1)
begin
	if rising_edge(clk_1) then
	case shiftNow is
	when "001" =>
	shiftNow <= "010";
	when "010" =>
	shiftNow <= "100";
	when "100" =>
	shiftNow <= "001";
	when others =>
	shiftNow <= "001";
	end case;
	end if;
end process;
setshiftbit <= shiftNow;
end Behavioral;

