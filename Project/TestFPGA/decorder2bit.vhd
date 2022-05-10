----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:03:57 05/09/2022 
-- Design Name: 
-- Module Name:    decorder2bit - Behavioral 
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

entity decoder2bit is
port(
		getbinary: in std_logic_vector(0 to 1);
		decoder7Seg: out std_logic_vector(0 to 6)
);
end decoder2bit;

architecture Behavioral of decoder2bit is

begin
process(getbinary)
begin
case getbinary is
when "00" =>
decoder7Seg <= "0111111";
when "01" =>
decoder7Seg <= "0000110";
when "10" =>
decoder7Seg <= "1011011";
when "11" =>
decoder7Seg <= "1001111";
when others =>
decoder7Seg <= "1111111";
end case;
end process;

end Behavioral;

