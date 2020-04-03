----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:20:09 03/07/2020 
-- Design Name: 
-- Module Name:    ACCUM_UNIT - Behavioral 
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

entity ACCUM_UNIT is
    Port ( CLK : in  STD_LOGIC;
			  RST : in STD_LOGIC;
           MODE : in  STD_LOGIC_VECTOR (1 downto 0);
           ACCUM_EN : in  STD_LOGIC;
			  DATA_SEL : in STD_LOGIC;
			  IR : in BYTE;
			  RAM : in BYTE;
           DOUT : out  BYTE );
end ACCUM_UNIT;

architecture Behavioral of ACCUM_UNIT is

component ACCUM is
    Port ( CLK : in  STD_LOGIC;
			  RST : in STD_LOGIC;
           MODE : in  STD_LOGIC_VECTOR (1 downto 0);
           ACCUM_EN : in  STD_LOGIC;
           DIN : in  BYTE;
           DOUT : out  BYTE );
end component ACCUM;

signal data_in: BYTE; 

begin

	U_ACCUM: ACCUM port map (CLK, RST, MODE, ACCUM_EN, data_in, DOUT);
	
	process_DATA_SEL : process(DATA_SEL, IR, RAM)
	begin
		case DATA_SEL is 
			when '1' => data_in <= IR;
			when '0' => data_in <= RAM;
			when others => data_in <= RAM;
		end case;
	end process;

end Behavioral;

