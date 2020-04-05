----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:25:48 03/02/2020 
-- Design Name: 
-- Module Name:    RAM_UNIT_X - Behavioral 
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
use work.AccumMP.ALL;

entity RAM_UNIT_X is
    Port ( RAM_IN : in  RAM_UNIT_INPUTS;
           RAM_OUT : out  RAM_UNIT_OUTPUTS);
end RAM_UNIT_X;

architecture Behavioral of RAM_UNIT_X is

component RAM_UNIT is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ACC : in  BYTE;
           IR : in  BYTE;
           ADR_SEL : in  STD_LOGIC;
           ADR_EN : in  STD_LOGIC;
           DATA_EN : in  STD_LOGIC;
			  DATA_SEL : in  STD_LOGIC;
           W_EN : in  STD_LOGIC;
           R_EN : in  STD_LOGIC;
           RAM_DATA : out  BYTE);
end component;

begin

U_RAM_UNIT_X: RAM_UNIT port map(
	RAM_IN.CLK, RAM_IN.RST, RAM_IN.ACC, RAM_IN.IR, RAM_IN.ADR_SEL, RAM_IN.ADR_EN, RAM_IN.DATA_EN, RAM_IN.DATA_SEL,
	RAM_IN.W_EN, RAM_IN.R_EN, RAM_OUT.RAM_DATA
);

end Behavioral;

