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
use work.GPRMP.ALL;

entity RAM_UNIT_X is
    Port ( RAM_IN : in  RAM_UNIT_INPUTS;
           RAM_OUT : out  RAM_UNIT_OUTPUTS);
end RAM_UNIT_X;

architecture Behavioral of RAM_UNIT_X is

component RAM_UNIT is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           R0_EN : std_logic;
			  R1_EN : std_logic;
			  W0_EN : std_logic;
			  OB_RESULT : in BYTE;
			  REGA0     : in BYTE;
			  REGA1		: in BYTE;
           IR1 		: in BYTE;
			  IR2       : in BYTE;
           ADR0_SEL  : in  STD_LOGIC_VECTOR(1 downto 0);
			  ADR1_SEL  : in  STD_LOGIC;
           ADR0_EN   : in  STD_LOGIC;
			  ADR1_EN   : in  STD_LOGIC;
           DATA_EN   : in  STD_LOGIC;
			  DATA_SEL  : in STD_LOGIC_VECTOR(1 downto 0);
			  DOUT0 : out  BYTE;
           DOUT1 : out  BYTE
			  );
end component;

begin

U_RAM_UNIT_X: RAM_UNIT port map(
	RAM_IN.CLK, RAM_IN.RST, RAM_IN.R0_EN, RAM_IN.R1_EN, RAM_IN.W0_EN, RAM_IN.OB_RESULT, RAM_IN.REGA0, RAM_IN.REGA1, RAM_IN.IR1, RAM_IN.IR2, RAM_IN.ADR0_SEL, RAM_IN.ADR1_SEL,
	RAM_IN.ADR0_EN, RAM_IN.ADR1_EN, RAM_IN.DATA_EN, RAM_IN.DATA_SEL, RAM_OUT.DOUT0, RAM_OUT.DOUT1
);

end Behavioral;

