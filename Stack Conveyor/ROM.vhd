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
use work.StackMP.ALL;

entity ROM is
    Port ( ADR : in  STD_LOGIC_VECTOR (4 downto 0);
           CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           DOUT : out TRIBBLE );
end ROM;

architecture Behavioral of ROM is

type t_rom is array (0 to 30) of TRIBBLE;
constant mp_rom : t_rom := (
	0 =>  PUSHC & "00000000", -- 0x00
	1 =>  PUSHV & NADDR,
	2 =>  DEC	& NONE,
	3 =>  CMP	& NONE,
	4 =>  JL    & "00000110", -- 0x06
	5 =>  STOP  & NONE,
	6 =>  PUSHC & "00000000",
	7 =>  PUSHV & PADDR,
	8 =>  PEEK  & VADDR,
	9 =>  RD    & NONE,
	10 => PUSHV & VADDR,
	11 => INC   & NONE,
	12 => RD    & NONE,
	13 => CMP   & NONE,
	14 => JL    & "00010010", -- 0x12 // 18
	15 => POP   & NONE,
	16 => POP   & NONE,
	17 => J     & "00010111", -- 0x17 // 23
	18 => PUSHV & VADDR,
	19 => WR    & NONE,
	20 => PUSHV & VADDR,
	21 => INC   & NONE,
	22 => WR    & NONE,
	23 => INC   & NONE,
	24 => CMP   & NONE,
	25 => JE    & "00011101", -- 0x1D // 29
	26 => PUSHV & VADDR,
	27 => INC   & NONE,
	28 => J     & "00001000", -- 0x08
	29 => POP   & NONE,
	30 => J     & "00000010", -- 0x02,
	
	others => NON & NONE
);

signal rom_data : TRIBBLE;
signal reg_out  : TRIBBLE;
signal rom_addr : integer range 0 to 30;

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

