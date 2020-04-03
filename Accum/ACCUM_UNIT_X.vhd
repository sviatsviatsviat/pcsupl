----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:54:18 03/07/2020 
-- Design Name: 
-- Module Name:    ACCUM_UNIT_X - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ACCUM_UNIT_X is
    Port ( ACCUM_IN : in  ACCUM_UNIT_INPUTS;
           ACCUM_OUT : out  ACCUM_UNIT_OUTPUTS);
end ACCUM_UNIT_X;

architecture Structural of ACCUM_UNIT_X is

component ACCUM_UNIT is
    Port ( CLK : in  STD_LOGIC;
			  RST : in STD_LOGIC;
           MODE : in  STD_LOGIC_VECTOR (1 downto 0);
           ACCUM_EN : in  STD_LOGIC;
			  DATA_SEL : in STD_LOGIC;
			  IR : in BYTE;
			  RAM : in BYTE;
           DOUT : out  BYTE );
end component ACCUM_UNIT;

begin

U_ACCUM_UNIT: ACCUM_UNIT port map(ACCUM_IN.CLK, ACCUM_IN.RST, ACCUM_IN.MODE, ACCUM_IN.ACCUM_EN,
 ACCUM_IN.DATA_SEL, ACCUM_IN.IR, ACCUM_IN.RAM, ACCUM_OUT.DOUT);

end Structural;

