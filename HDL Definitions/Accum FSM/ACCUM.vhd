----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:41:39 03/07/2020 
-- Design Name: 
-- Module Name:    ACCUM - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.AccumMP.ALL;

entity ACCUM is
    Port ( CLK : in  STD_LOGIC;
			  RST : in STD_LOGIC;
           MODE : in  STD_LOGIC_VECTOR (1 downto 0);
           ACCUM_EN : in  STD_LOGIC;
           DIN : in  BYTE;
           DOUT : out  BYTE );
end ACCUM;

-- MODE: 00 store, 01 write, 10 inc, 11 dec;

architecture Behavioral of ACCUM is

signal acc_reg : BYTE;

begin

	process_ACCUM : process(CLK, RST, MODE, ACCUM_EN, DIN)
	begin
		if (RST = '1') then
			acc_reg <= (others => '0');
		elsif (ACCUM_EN = '1') then
			if (rising_edge(CLK)) then
				if (MODE = "01") then
					acc_reg <= DIN;
				elsif (MODE = "10") then
					acc_reg <= acc_reg + 1;
				elsif (MODE = "11") then
					acc_reg <= acc_reg - 1;
				end if;
			end if;
		end if;
	end process;
	
	DOUT <= acc_reg;

end Behavioral;

