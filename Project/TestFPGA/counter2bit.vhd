----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:20:17 05/09/2022 
-- Design Name: 
-- Module Name:    counter2bit - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity counter2bit is
    Port ( rst,clk : in std_logic;
           o: out std_logic_vector(0 to 1));
end counter2bit;

architecture Behavioral of counter2bit is
 signal count : std_logic_vector(0 to 1);
 begin
   process(rst,clk)
   begin
     if (rst = '1') then count <= "00";
     elsif (clk'event and clk = '1') then count <= count + 1;
     end if;
 end process;
   o <= count;
 end Behavioral;

