----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:04:35 03/01/2020 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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

entity ROM is
    Port ( ADR : in  STD_LOGIC_VECTOR (5 downto 0);
           CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           DOUT : out TRIBBLE );
end ROM;

architecture Behavioral of ROM is

type t_rom is array (0 to 33) of TRIBBLE;
constant mp_rom : t_rom := (
	0 =>  LOADV & NADDR,
	1 =>  DEC	& NONE,
	2 =>  STORE & LADDR,
   3 =>  LOADC & "00000000", --0x00
   4 =>  CMP   & LADDR,
   5 =>  JL    & "00000111", --0x07
	6 =>  STOP  & NONE,
   7 =>  STORE & JADDR,
	8 =>  LOADV & PADDR,
   9 =>  STORE & CADDR,
	10 => RD		& NONE,
	11 => STORE & MADDR,
   12 => LOADV & CADDR,
   13 => INC	& NONE,
	14 => RD		& NONE,
	15 => CMP   & MADDR,
	16 => JLE   & "00010111", --0x17 // 23
	17 => STORE & TADDR,
	18 => LOADV & CADDR,
	19 => WR    & TADDR,
	20 => INC	& NONE,
	21 => WR    & MADDR,
	22 => J     & "00011010", --0x1A // 26
	23 => STORE & MADDR,
	24 => LOADV & CADDR,
	25 => INC	& NONE,
	26 => STORE & CADDR,
	27 => LOADV & JADDR,
	28 => INC	& NONE,
	29 => STORE & JADDR,
	30 => CMP   & LADDR,
	31 => JL    & "00001100", --0x0C // 12
	32 => LOADV & LADDR,
	33 => J     & "00000001", --0x01
	others => NON & NONE
);

signal rom_data : TRIBBLE;
signal reg_out  : TRIBBLE;
signal rom_addr : integer range 0 to 33;

begin

	rom_addr <= CONV_INTEGER(ADR);
	rom_data <= mp_rom(rom_addr);
	
	proc_reg_out: process (CLK, RST, EN, rom_data)
	begin
		if (RST = '1') then
			reg_out <= (others => '0'); -- reset output
		elsif (EN = '1') then		    -- enabled
			if (rising_edge(CLK)) then
				reg_out <= rom_data;
			end if;
		end if;
	end process;
	
	DOUT <= reg_out;

end Behavioral;

