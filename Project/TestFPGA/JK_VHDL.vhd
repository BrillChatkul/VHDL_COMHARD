----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:47:25 05/10/2022 
-- Design Name: 
-- Module Name:    JK_VHDL - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity T_FLIPFLOP is
   Port ( T,CLK,RES : in  STD_LOGIC;
          Q,QB : out STD_LOGIC);
end T_FLIPFLOP;

architecture Behavioral of T_FLIPFLOP is

begin

PROCESS(T,CLK,RES)

VARIABLE TEMP:STD_LOGIC:='0';

BEGIN

IF(RES='1')THEN
TEMP:='0';
ELSIF(RISING_EDGE(CLK))THEN
IF(T='1')THEN
TEMP:= NOT TEMP;

END IF;
END IF;
Q<= TEMP;
QB<= not TEMP;

END PROCESS;
END BEHAVIORAL;
