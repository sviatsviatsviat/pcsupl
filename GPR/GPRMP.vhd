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

package GPRMP is

-- Type declarations
subtype BYTE is std_logic_vector(7 downto 0);
subtype NIBBLE is std_logic_vector(3 downto 0);
subtype PENTIBBLE is std_logic_vector(19 downto 0);

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
	IR		: PENTIBBLE;
end record ROM_UNIT_OUTPUTS;

type RAM_UNIT_INPUTS is record
			  CLK : STD_LOGIC;
           RST : STD_LOGIC;
           R0_EN : std_logic;
			  R1_EN : std_logic;
			  W0_EN : std_logic;
			  OB_RESULT : BYTE;
			  REGA0     : BYTE;
			  REGA1		: BYTE;
           IR1 		: BYTE;
			  IR2       : BYTE;
           ADR0_SEL  : STD_LOGIC_VECTOR(1 downto 0);
			  ADR1_SEL  : STD_LOGIC;
           ADR0_EN   : STD_LOGIC;
			  ADR1_EN   : STD_LOGIC;
           DATA_EN   : STD_LOGIC;
			  DATA_SEL  : STD_LOGIC_VECTOR(1 downto 0);
end record RAM_UNIT_INPUTS;

type RAM_UNIT_OUTPUTS is record
   DOUT0 : BYTE;
   DOUT1 : BYTE;
end record RAM_UNIT_OUTPUTS;

type OB_UNIT_INPUTS is record
			CLK : STD_LOGIC;
         RST : STD_LOGIC;
         EN : STD_LOGIC;
         RAM0 : BYTE;
         RAM1 : BYTE;
			IR2  : BYTE;
         OPCODE : NIBBLE;
end record OB_UNIT_INPUTS;

type OB_UNIT_OUTPUTS is record
    RESULT : BYTE;
    L_FLAG : STD_LOGIC;
    E_FLAG : STD_LOGIC;
end record OB_UNIT_OUTPUTS;

type REGA_UNIT_INPUTS is record
	CLK : STD_LOGIC;
	RST : STD_LOGIC;
	EN : STD_LOGIC;
	REG0_IN : BYTE;
	REG1_IN : BYTE;
end record REGA_UNIT_INPUTS;

type REGA_UNIT_OUTPUTS is record
	REG0_OUT : BYTE;
	REG1_OUT : BYTE;
end record REGA_UNIT_OUTPUTS;

-- Declare constants

constant MOVC   : NIBBLE := "0000";
constant MOV    : NIBBLE := "0001";
constant MOVA   : NIBBLE := "0010";
constant RD  	 : NIBBLE := "0011";
constant WR     : NIBBLE := "0100";
constant TESTC  : NIBBLE := "0101";
constant TEST   : NIBBLE := "0110";
constant J      : NIBBLE := "0111";
constant JL     : NIBBLE := "1000";
constant JLE    : NIBBLE := "1001";
constant INC    : NIBBLE := "1010";
constant DEC    : NIBBLE := "1011";
constant STOP   : NIBBLE := "1100";
constant NON	 : NIBBLE := "1111";
constant NONE	 : BYTE	 := "11111111";

constant PA   : BYTE   := "00000000";
constant NA   : BYTE   := "00000001";
constant LA   : BYTE   := "00000010";
constant JA   : BYTE   := "00000011";
constant CVA  : BYTE   := "00000100";
constant NVA  : BYTE   := "00000101";
constant CV   : BYTE   := "00000110";
constant NV   : BYTE   := "00000111";

end GPRMP;

package body GPRMP is
 
end GPRMP;
