----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:29:05 05/09/2022 
-- Design Name: 
-- Module Name:    demux - Behavioral 
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

entity demux is
port(
	get7Seg1: in std_logic_vector(0 to 6);
	get7Seg2: in std_logic_vector(0 to 6);
	get7Seg3: in std_logic_vector(0 to 6);
	getcommon: in std_logic_vector(0 to 2);
	demux7Seg: out std_logic_vector(0 to 6)
);
end demux;

architecture Behavioral of demux is
begin
process(get7Seg1,get7Seg2,get7Seg3)
begin
case getcommon is
when "001" =>
demux7Seg <= get7Seg1;
when "010" =>
demux7Seg <= get7Seg2;
when "100" =>
demux7Seg <= get7Seg3;
when others =>
demux7Seg <= "1111111";
end case;
end process;
end Behavioral;

