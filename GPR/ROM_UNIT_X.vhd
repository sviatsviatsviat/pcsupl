----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:36 03/02/2020 
-- Design Name: 
-- Module Name:    ROM_UNIT_X - Structural 
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
use work.GPRMP.ALL;

entity ROM_UNIT_X is
    Port ( ROM_IN : in  ROM_UNIT_INPUTS;
           ROM_OUT : out  ROM_UNIT_OUTPUTS );
end ROM_UNIT_X;

architecture Structural of ROM_UNIT_X is

component ROM_UNIT is
    Port ( CLK 	: in  STD_LOGIC;
           RST 	: in  STD_LOGIC;
           PC_EN 	: in  STD_LOGIC;
           IR_EN 	: in  STD_LOGIC;
			  ROM_EN : in  STD_LOGIC;
           L 		: in  STD_LOGIC;
           E 		: in  STD_LOGIC;
           IR_OUT : out  PENTIBBLE
			  );
end component;

begin

U_ROM_UNIT_X: ROM_UNIT port map(ROM_IN.CLK, ROM_IN.RST, ROM_IN.PC_EN, ROM_IN.IR_EN, ROM_IN.EN, ROM_IN.L,
												ROM_IN.E, ROM_OUT.IR);

end Structural;

