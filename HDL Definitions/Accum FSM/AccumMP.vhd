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

package AccumMP is

-- Type declarations
subtype BYTE is std_logic_vector(7 downto 0);
subtype NIBBLE is std_logic_vector(3 downto 0);
subtype TRIBBLE is std_logic_vector(11 downto 0);

type ROM_UNIT_INPUTS is record
	CLK   : std_logic;
	RST   : std_logic;
	PC_EN : std_logic;
	IR_EN : std_logic;
	EN	   : std_logic;
	L		: std_logic;
	E		: std_logic;
end record ROM_UNIT_INPUTS;

type ROM_UNIT_OUTPUTS is record
	IR		: TRIBBLE;
end record ROM_UNIT_OUTPUTS;

type RAM_UNIT_INPUTS is record
	CLK : STD_LOGIC;
	RST : STD_LOGIC;
	ACC : BYTE;
	IR : BYTE;
	ADR_SEL : STD_LOGIC;
	ADR_EN : STD_LOGIC;
	DATA_EN : STD_LOGIC;
	DATA_SEL : STD_LOGIC;
	W_EN : STD_LOGIC;
	R_EN : STD_LOGIC;
end record RAM_UNIT_INPUTS;

type RAM_UNIT_OUTPUTS is record
	RAM_DATA : BYTE;
end record RAM_UNIT_OUTPUTS;

type ACCUM_UNIT_INPUTS is record
	CLK : STD_LOGIC;
	RST : STD_LOGIC;
   MODE : STD_LOGIC_VECTOR (1 downto 0);
   ACCUM_EN : STD_LOGIC;
	DATA_SEL : STD_LOGIC;
	IR : BYTE;
	RAM : BYTE;
end record ACCUM_UNIT_INPUTS;

type ACCUM_UNIT_OUTPUTS is record
	DOUT : BYTE;
end record ACCUM_UNIT_OUTPUTS;

type OB_UNIT_INPUTS is record
    CLK : STD_LOGIC;
    RST : STD_LOGIC;
    EN : STD_LOGIC;
    ACC : BYTE;
    RAM : BYTE;
    OPCODE : NIBBLE;
end record OB_UNIT_INPUTS;

type OB_UNIT_OUTPUTS is record
    L_FLAG : STD_LOGIC;
    E_FLAG : STD_LOGIC;
end record OB_UNIT_OUTPUTS;

-- Declare constants

constant LOADC  : NIBBLE := "0000";
constant LOADV  : NIBBLE := "0001";
constant STORE  : NIBBLE := "0010";
constant RD     : NIBBLE := "0011";
constant WR     : NIBBLE := "0100";
constant CMP    : NIBBLE := "0101";
constant J      : NIBBLE := "0110";
constant JL     : NIBBLE := "0111";
constant JLE    : NIBBLE := "1000";
constant INC    : NIBBLE := "1001";
constant DEC    : NIBBLE := "1010";
constant STOP   : NIBBLE := "1011";
constant NON	 : NIBBLE := "1111";
constant NONE	 : BYTE	 := "11111111";

constant PADDR  : BYTE   := "00000000"; -- pointer to array
constant NADDR  : BYTE   := "00000001"; -- array size
constant LADDR	 : BYTE	 := "00000010"; -- lim variable addr
constant JADDR  : BYTE   := "00000011"; -- j variable addr
constant CADDR  : BYTE   := "00000100"; -- current array element
constant MADDR  : BYTE   := "00000101"; -- min value
constant TADDR  : BYTE   := "00000110"; -- temp value

end AccumMP;

package body AccumMP is

 
end AccumMP;
