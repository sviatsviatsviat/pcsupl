----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:34:06 03/02/2020 
-- Design Name: 
-- Module Name:    LIFO_UNIT_X - Structural 
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

library work;
use work.StackMP.ALL;

entity LIFO_UNIT_X is
    Port ( LIFO_IN : in  LIFO_UNIT_INPUTS;
           LIFO_OUT : out  LIFO_UNIT_OUTPUTS);
end LIFO_UNIT_X;

architecture Structural of LIFO_UNIT_X is

component LIFO_UNIT is
	 Generic (Size: integer := 6);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           LIFO_EN : in  STD_LOGIC;
           MODE : in  STD_LOGIC_VECTOR (1 downto 0);
           PUSHDATA : in  STD_LOGIC_VECTOR (1 downto 0);
           OB_RESULT : in  BYTE;
           RAM_DATA : in  BYTE;
           IR_OUT : in  BYTE;
           TOS : out  BYTE;
           TOS_1 : out  BYTE;
           EMPTY : out  STD_LOGIC;
           FULL : out  STD_LOGIC);
end component;

begin

U_LIFO_UNIT_X: LIFO_UNIT 
	generic map (6)
	port map ( 
		LIFO_IN.CLK, LIFO_IN.RST, LIFO_IN.LIFO_EN, LIFO_IN.MODE, LIFO_IN.PUSHDATA, LIFO_IN.OB_RESULT,
		LIFO_IN.RAM_DATA, LIFO_IN.IR_OUT, LIFO_OUT.TOS, LIFO_OUT.TOS_1, LIFO_OUT.EMPTY, LIFO_OUT.FULL
	);

end Structural;

