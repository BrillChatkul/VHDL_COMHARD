----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:48:40 05/10/2022 
-- Design Name: 
-- Module Name:    rippleAdder - Behavioral 
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
 
entity full_adder_vhdl_code is
 Port ( A : in STD_LOGIC;
 B : in STD_LOGIC;
 Cin : in STD_LOGIC;
 S : out STD_LOGIC;
 Cout : out STD_LOGIC);
end full_adder_vhdl_code;
 
architecture gate_level of full_adder_vhdl_code is
 
begin
 
 S <= A XOR B XOR Cin ;
 Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ;
 
end gate_level;

--------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Ripple_Adder1 is
Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
B : in STD_LOGIC_VECTOR (1 downto 0);
Cin : in STD_LOGIC;
S : out STD_LOGIC_VECTOR (3 downto 0);
Cout : out STD_LOGIC);
end Ripple_Adder1;
 
architecture Behavioral of Ripple_Adder1 is
 
component full_adder_vhdl_code
Port ( A : in STD_LOGIC;
B : in STD_LOGIC;
Cin : in STD_LOGIC;
S : out STD_LOGIC;
Cout : out STD_LOGIC);
end component;
 
signal c1,c2,c3: STD_LOGIC;
 
begin
 
FA1: full_adder_vhdl_code port map( A(0), B(0), Cin, S(0), c1);
FA2: full_adder_vhdl_code port map( A(1), B(1), c1, S(1), c2);
FA3: full_adder_vhdl_code port map( '0', '0', c2, S(2), c3);
FA4: full_adder_vhdl_code port map( '0', '0', c3, S(3), Cout);
 
end Behavioral;
----------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Ripple_Adder2 is
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (1 downto 0);
Cin : in STD_LOGIC;
S : out STD_LOGIC_VECTOR (3 downto 0);
Cout : out STD_LOGIC);
end Ripple_Adder2;
 
architecture Behavioral of Ripple_Adder2 is
 
component full_adder_vhdl_code
Port ( A : in STD_LOGIC;
B : in STD_LOGIC;
Cin : in STD_LOGIC;
S : out STD_LOGIC;
Cout : out STD_LOGIC);
end component;
 
signal c1,c2,c3: STD_LOGIC;
 
begin
 
FA1: full_adder_vhdl_code port map( A(0), B(0), Cin, S(0), c1);
FA2: full_adder_vhdl_code port map( A(1), B(1), c1, S(1), c2);
FA3: full_adder_vhdl_code port map( A(2), '0', c2, S(2), c3);
FA4: full_adder_vhdl_code port map( A(3), '0', c3, S(3), Cout);

end Behavioral;
