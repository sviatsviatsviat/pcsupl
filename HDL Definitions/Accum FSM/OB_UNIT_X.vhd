----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:40:58 03/02/2020 
-- Design Name: 
-- Module Name:    OB_UNIT_X - Structural 
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

entity OB_UNIT_X is
    Port ( OB_IN : in  OB_UNIT_INPUTS;
           OB_OUT : out  OB_UNIT_OUTPUTS);
end OB_UNIT_X;

architecture Structural of OB_UNIT_X is

component OB_UNIT is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           ACC : in  BYTE;
           RAM : in  BYTE;
           OPCODE : in  NIBBLE;
           L_FLAG : out  STD_LOGIC;
           E_FLAG : out  STD_LOGIC);
end component;

begin

U_OB_UNIT_X: OB_UNIT port map(
	OB_IN.CLK, OB_IN.RST, OB_IN.EN, OB_IN.ACC, OB_IN.RAM, OB_IN.OPCODE,
	OB_OUT.L_FLAG, OB_OUT.E_FLAG
);

end Structural;

