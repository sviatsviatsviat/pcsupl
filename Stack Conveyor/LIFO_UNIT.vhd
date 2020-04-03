----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:29:45 03/01/2020 
-- Design Name: 
-- Module Name:    LIFO_UNIT - Behavioral 
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
use work.StackMP.ALL;

entity LIFO_UNIT is
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
end LIFO_UNIT;

architecture Mixed of LIFO_UNIT is

component LIFO is
	 Generic (Size : integer := 6);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           LIFO_EN : in  STD_LOGIC;
           MODE : in  STD_LOGIC_VECTOR (1 downto 0);
           DATA_IN : in  BYTE;
           TOS : out  BYTE;
           TOS_1 : out  BYTE;
           EMPTY : out  STD_LOGIC;
           FULL : out  STD_LOGIC);
end component;

signal data_in			 : BYTE;
signal error			 : std_logic;
signal lifo_enable_in : std_logic;
signal lifo_empty_out : std_logic;
signal lifo_full_out	 : std_logic;

begin

	lifo_enable_in <= LIFO_EN and (not error);
	EMPTY				<= lifo_empty_out or error;
	FULL				<= lifo_full_out or error;

	U_LIFO : LIFO generic map (Size) port map (CLK, RST, lifo_enable_in, MODE, data_in, 
		TOS, TOS_1, lifo_empty_out, lifo_full_out);
	
	process_LIFO_DATA_SELECT: process (PUSHDATA, OB_RESULT,RAM_DATA, IR_OUT)
	begin
		if (PUSHDATA = "00") then
			data_in <= OB_RESULT;
		elsif (PUSHDATA = "01") then
			data_in <= RAM_DATA;
		elsif (PUSHDATA = "10") then
			data_in <= IR_OUT;
		else
			data_in <= (others => '0');
		end if;
	end process;
	
	process_ERROR: process (PUSHDATA)
	begin
		if (PUSHDATA = "11") then
			error <= '1';
		else
			error <= '0';
		end if;
	end process;

end Mixed;

