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
use work.GPRMP.ALL;


entity RAM is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  R0_EN : std_logic;
			  R1_EN : std_logic;
			  W0_EN : std_logic;
           ADR0 : in  BYTE;
			  ADR1 : in BYTE;
			  DIN0 : in BYTE;
           DOUT0 : out  BYTE;
           DOUT1 : out  BYTE );
end RAM;

architecture Behavioral of RAM is

type t_ram is array (0 to 255) of BYTE;
signal c_ram : t_ram := (
	0 => "00001010", 			-- PA 0x10
	1 => "00000100", 			-- NA 0x04
	2 => (others => '0'),	-- LA
	3 => (others => '0'),   -- JA
	4 => (others => '0'),   -- CVA
	5 => (others => '0'),   -- NVA
	6 => (others => '0'),   -- CV
	7 => (others => '0'),   -- NV
	8 => (others => '0'),
	9 => (others => '0'),
	10 => "00010100",
	11 => "00100100",
	12 => "10011100",
	13 => "01101000",
	others => NONE
);

signal reg_in0  : BYTE;
signal reg_out0 : BYTE;
signal reg_out1 : BYTE;
signal ram_adr0 : integer range 0 to 255;
signal ram_adr1 : integer range 0 to 255;

begin

	reg_in0 <= DIN0;
	
	ram_adr0 <= CONV_INTEGER(ADR0);
	ram_adr1 <= CONV_INTEGER(ADR1);

	process_REG0_IN: process(CLK, W0_EN, ram_adr0, reg_in0)
	begin
		if (W0_EN = '1') then
			if (rising_edge(CLK)) then
				c_ram(ram_adr0) <= reg_in0;
			end if;
		end if;
	end process;
	
	process_REG0_OUT: process(CLK, RST, R0_EN, c_ram, ram_adr0)
	begin
		if (RST = '1') then
			reg_out0 <= (others => '0');
		elsif (R0_EN = '1') then
			if (rising_edge(CLK)) then
				reg_out0 <= c_ram(ram_adr0);
			end if;
		end if;
	end process;
	
	process_REG1_OUT: process(CLK, RST, R1_EN, c_ram, ram_adr1)
	begin
		if (RST = '1') then
			reg_out1 <= (others => '0');
		elsif (R1_EN = '1') then
			if (rising_edge(CLK)) then
				reg_out1 <= c_ram(ram_adr1);
			end if;
		end if;
	end process;
	
	DOUT0 <= reg_out0;
	DOUT1 <= reg_out1;

end Behavioral;

