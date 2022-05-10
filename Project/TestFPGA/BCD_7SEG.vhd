----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:35:22 05/09/2022 
-- Design Name: 
-- Module Name:    BCD_7SEG - Behavioral 
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

entity BCD_7SEG is
Port (
clk_t : in STD_LOGIC;
getStart : in STD_LOGIC; --start
cl_button : in STD_LOGIC; --test button
Seven_Segment: out STD_LOGIC_VECTOR(6 downto 0);
common7Seg : out STD_LOGIC_VECTOR(2 downto 0);
check_LED : out STD_LOGIC; --test LED
sntdata : out std_logic_vector(0 to 3) 
);
end BCD_7SEG;

architecture Behavioral of BCD_7SEG is

component TTimer
port(clk_in : in  STD_LOGIC;
     reset  : in  STD_LOGIC;
     clk_out: out STD_LOGIC);
end component;

component TTimer_div
port(clk_in : in  STD_LOGIC;
     reset  : in  STD_LOGIC;
     clk_out: out STD_LOGIC);
end component;

component TTimer_div1
port(clk_in : in  STD_LOGIC;
     reset  : in  STD_LOGIC;
     clk_out: out STD_LOGIC);
end component;

component TTimer_div2
port(clk_in : in  STD_LOGIC;
     reset  : in  STD_LOGIC;
     clk_out: out STD_LOGIC);
end component;

component counter2bit
port(rst,clk : in std_logic;
     o: out std_logic_vector(1 downto 0));
end component;

component decoder2bit is
port(
		getbinary: in std_logic_vector(0 to 1);
		decoder7Seg: out std_logic_vector(0 to 6)
);
end component;

component Shiftbit is
port(	clk_1: in std_logic;
		setshiftbit: out std_logic_vector(0 to 2)
);
end component;

component demux is
port(
	get7Seg1: in std_logic_vector(0 to 6);
	get7Seg2: in std_logic_vector(0 to 6);
	get7Seg3: in std_logic_vector(0 to 6);
	getcommon: in std_logic_vector(0 to 2);
	demux7Seg: out std_logic_vector(0 to 6)
);
end component;

component T_FLIPFLOP is
   Port ( T,CLK,RES : in  STD_LOGIC;
          Q,QB : out STD_LOGIC);
end component;

component Ripple_Adder1 is
Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
B : in STD_LOGIC_VECTOR (1 downto 0);
Cin : in STD_LOGIC;
S : out STD_LOGIC_VECTOR (3 downto 0);
Cout : out STD_LOGIC);
end component;

component Ripple_Adder2 is
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (1 downto 0);
Cin : in STD_LOGIC;
S : out STD_LOGIC_VECTOR (3 downto 0);
Cout : out STD_LOGIC);
end component;

--varible
signal m0,m1,mm1,mm2,mm3,a0,a1,a2,x11,x22: std_logic;
signal res_var: std_logic := '0';
signal m2,m3,m4: std_logic_vector(0 to 1);
signal shift7Seg: std_logic_vector(0 to 2);
signal Seven_Segment1,Seven_Segment2,Seven_Segment3 : STD_LOGIC_VECTOR(6 downto 0);
signal x1,x2: std_logic_vector(0 to 3);

--beginning
begin
U1: TTimer port map(clk_t,res_var,m0); --Clock divider
a0 <= getstart and cl_button;
UTFILPFLOP: T_FLIPFLOP port map('1',a0,not getstart,check_LED,a1);
a2 <= getstart and a1;
m1 <= m0 and a2;
U2: TTimer_div port map(m1,res_var,mm1); --clock div1
U21: TTimer_div1 port map(m1,res_var,mm2); --clock div2
U22: TTimer_div2 port map(m1,res_var,mm3); --clock div3
U4: counter2bit port map(res_var,mm1,m2); --counter1
U41: counter2bit port map(res_var,mm2,m3);--counter2
U42: counter2bit port map(res_var,mm3,m4);--counter3
UAdder1: Ripple_Adder1 port map(m2,m3,'0',x1,x11); --adder1
UAdder2: Ripple_Adder2 port map(x1,m4,'0',x2,x22); --adder2
sntdata <= x2;
u5: decoder2bit port map(m2,Seven_Segment1);--decode to sevensegment1
u51: decoder2bit port map(m3,Seven_Segment2);--decode to sevensegment2
u52: decoder2bit port map(m4,Seven_Segment3);--decode to sevensegment3
u6: Shiftbit port map(m0,shift7Seg); --shift bit
u7: demux port map(Seven_Segment1,Seven_Segment2,Seven_Segment3,shift7Seg,Seven_Segment); --demux
common7Seg(0) <= not shift7Seg(0);
common7Seg(1) <= not shift7Seg(1);
common7Seg(2) <= not shift7Seg(2);
end Behavioral;

