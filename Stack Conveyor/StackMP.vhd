--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package StackMP is

-- Type declarations
subtype BYTE is std_logic_vector(7 downto 0);
subtype NIBBLE is std_logic_vector(3 downto 0);
subtype TRIBBLE is std_logic_vector(11 downto 0);


type C_ROM_UNIT_INPUTS is record
	EN 	: STD_LOGIC;
   RST 	: STD_LOGIC;
	ROM_EN : STD_LOGIC;
	STP: STD_LOGIC;
	CJ_EN: STD_LOGIC;
   L 		: STD_LOGIC;
   E 		: STD_LOGIC;
end record C_ROM_UNIT_INPUTS;

type ROM_UNIT_OUTPUTS is record
	IR		: TRIBBLE;
end record ROM_UNIT_OUTPUTS;

type C_RAM_UNIT_INPUTS is record
	CLK : STD_LOGIC;
	RST : STD_LOGIC;
	DIN : BYTE;
	ADR : BYTE;
	W_EN : STD_LOGIC;
	R_EN : STD_LOGIC;
end record C_RAM_UNIT_INPUTS;

type RAM_UNIT_OUTPUTS is record
	RAM_DATA : BYTE;
end record RAM_UNIT_OUTPUTS;

type C_LIFO_UNIT_INPUTS is record
	CLK : STD_LOGIC;
   RST : STD_LOGIC;
   LIFO_EN : STD_LOGIC;
   MODE : STD_LOGIC_VECTOR (1 downto 0);
   PUSHDATA : BYTE;
end record C_LIFO_UNIT_INPUTS;

type LIFO_UNIT_OUTPUTS is record
	TOS : BYTE;
   TOS_1 : BYTE;
   EMPTY : STD_LOGIC;
   FULL : STD_LOGIC;
end record LIFO_UNIT_OUTPUTS;

type OB_UNIT_INPUTS is record
    CLK : STD_LOGIC;
    RST : STD_LOGIC;
    EN : STD_LOGIC;
    ARG_1 : BYTE;
    ARG_2 : BYTE;
    OPCODE : NIBBLE;
end record OB_UNIT_INPUTS;

type OB_UNIT_OUTPUTS is record
    RESULT : BYTE;
    L_FLAG : STD_LOGIC;
    E_FLAG : STD_LOGIC;
end record OB_UNIT_OUTPUTS;

-- Declare constants

constant PUSHC  : NIBBLE := "0000";
constant PUSHV  : NIBBLE := "0001";
constant PEEK   : NIBBLE := "0010";
constant POP    : NIBBLE := "0011";
constant WR     : NIBBLE := "0100";
constant RD     : NIBBLE := "0101";
constant CMP    : NIBBLE := "0110";
constant J      : NIBBLE := "0111";
constant JL     : NIBBLE := "1000";
constant JE     : NIBBLE := "1001";
constant INC    : NIBBLE := "1010";
constant DEC    : NIBBLE := "1011";
constant STOP   : NIBBLE := "1100";
constant NON	 : NIBBLE := "1111";
constant NONE	 : BYTE	 := "11111111";

constant PADDR  : BYTE   := "00000000";
constant NADDR  : BYTE   := "00000001";
constant VADDR  : BYTE   := "00000010";


end StackMP;

package body StackMP is

 
end StackMP;
