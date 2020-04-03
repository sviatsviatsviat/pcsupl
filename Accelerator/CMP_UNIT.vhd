----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:52:42 03/15/2020 
-- Design Name: 
-- Module Name:    CMP_UNIT - Behavioral 
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

entity CMP_UNIT is
    Port ( ASC : in STD_LOGIC;
			  IN0 : in STD_LOGIC_VECTOR (7 downto 0);
			  IN1 : in STD_LOGIC_VECTOR (7 downto 0);
           REG0 : out  STD_LOGIC_VECTOR (7 downto 0);
           REG1 : out  STD_LOGIC_VECTOR (7 downto 0);
			  XCHG : out STD_LOGIC);
end CMP_UNIT;

architecture Behavioral of CMP_UNIT is

signal exch: Boolean;
signal r0, r1: STD_LOGIC_VECTOR (7 downto 0);

begin

	exch <= (IN0 < IN1 and ASC = '0') or (IN1 < IN0 and ASC = '1');
	REG0 <= IN1 when exch else IN0;
	REG1 <= IN0 when exch else IN1;
	XCHG <= '1' when exch else '0';

end Behavioral;

