----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:20:51 03/15/2020 
-- Design Name: 
-- Module Name:    REGA_UNIT - Behavioral 
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

entity REGA_UNIT is
    Port (
		INPUTS : in REGA_UNIT_INPUTS;
		OUTPUTS : out REGA_UNIT_OUTPUTS);
end REGA_UNIT;

architecture Behavioral of REGA_UNIT is

component REGA is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           REG_IN : in  BYTE;
           REG_OUT : out  BYTE;
           EN : in  STD_LOGIC);
end component REGA;

begin

REGA0 : REGA port map (INPUTS.CLK, INPUTS.RST, INPUTS.REG0_IN, OUTPUTS.REG0_OUT, INPUTS.EN);
REGA1 : REGA port map (INPUTS.CLK, INPUTS.RST, INPUTS.REG1_IN, OUTPUTS.REG1_OUT, INPUTS.EN);

end Behavioral;

