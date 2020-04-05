----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:05:28 03/01/2020 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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


entity RAM is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           W_EN : in  STD_LOGIC;
           R_EN : in  STD_LOGIC;
           ADR : in  BYTE;
           DIN : in  BYTE;
           DOUT : out  BYTE );
end RAM;

architecture Behavioral of RAM is

type t_ram is array (0 to 255) of BYTE;
signal c_ram : t_ram := (
	0 => "00001010", 			-- 0x10
	1 => "00000100", 			-- 0x04
	2 => (others => '0'),	-- VADDR
	3 => (others => '0'),
	4 => (others => '0'),
	5 => (others => '0'),
	6 => (others => '0'),
	7 => (others => '0'),
	8 => (others => '0'),
	9 => (others => '0'),
	10 => "00010100",
	11 => "00100100",
	12 => "10011100",
	13 => "01101000",
	others => NONE
);

signal reg_in  : BYTE;
signal reg_out : BYTE;
signal ram_adr : integer range 0 to 255;

begin

	reg_in <= DIN;
	ram_adr <= CONV_INTEGER(ADR);

	process_REG_IN: process(CLK, W_EN, ram_adr, reg_in)
	begin
		if (W_EN = '1') then
			if (rising_edge(CLK)) then
				c_ram(ram_adr) <= reg_in;
			end if;
		end if;
	end process;
	
	process_REG_OUT: process(CLK, RST, R_EN, c_ram, ram_adr)
	begin
		if (RST = '1') then
			reg_out <= (others => '0');
		elsif (R_EN = '1') then
			if (rising_edge(CLK)) then
				reg_out <= c_ram(ram_adr);
			end if;
		end if;
	end process;
	
	DOUT <= reg_out;

end Behavioral;

