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
use work.GPRMP.ALL;

entity ROM is
    Port ( ADR : in  STD_LOGIC_VECTOR (4 downto 0);
           CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           DOUT : out PENTIBBLE );
end ROM;

architecture Behavioral of ROM is

type t_rom is array (0 to 20) of PENTIBBLE;
constant mp_rom : t_rom := (
	0 =>  MOV   & LA & NA,
	1 =>  DEC   & LA & NONE,
	2 =>  TESTC & LA & "00000000",
   3 =>  JL    & "00000101" & NONE, --0x05
   4 =>  STOP  & NONE & NONE,
   5 =>  MOVC  & JA & "00000000",
	6 =>  MOV   & CVA & PA,
   7 =>  MOV   & NVA & CVA,
	8 =>  INC   & NVA & NONE,
	9 =>  MOVA  & CVA & NVA,
   10 => RD 	& CV  & "00000000",
	11 => RD    & NV  & "00000001",
	12 => TEST  & CV  & NV,
	13 => JLE   & "00010000" & NONE, -- 0x10 // 16
	14 => WR    & "00000000" & NV,
	15 => WR    & "00000001" & CV,
   16 => MOV   & CVA & NVA,
   17 => INC	& JA & NONE,
	18 => TEST	& LA & JA,
	19 => JL    & "00001000" & NONE, -- 0x08
	20 => J     & "00000001" & NONE, --0x01
	others => NON & NONE & NONE
);

signal rom_data : PENTIBBLE;
signal reg_out  : PENTIBBLE;
signal rom_addr : integer range 0 to 18;

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

