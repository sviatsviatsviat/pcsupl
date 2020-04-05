--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:24:34 03/01/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/PCSUPL/Stack/TB_RAM_UNIT.vhd
-- Project Name:  Stack
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM_UNIT
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

library work;
use work.GPRMP.ALL;
 
ENTITY TB_RAM_UNIT IS
END TB_RAM_UNIT;
 
ARCHITECTURE behavior OF TB_RAM_UNIT IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM_UNIT
	 Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           R0_EN : std_logic;
			  R1_EN : std_logic;
			  W0_EN : std_logic;
			  OB_RESULT : in BYTE;
			  REGA0     : in BYTE;
			  REGA1		: in BYTE;
           IR1 		: in BYTE;
			  IR2       : in BYTE;
           ADR0_SEL  : in  STD_LOGIC_VECTOR(1 downto 0);
			  ADR1_SEL  : in  STD_LOGIC;
           ADR0_EN   : in  STD_LOGIC;
			  ADR1_EN   : in  STD_LOGIC;
           DATA_EN   : in  STD_LOGIC;
			  DATA_SEL  : in STD_LOGIC_VECTOR(1 downto 0);
			  DOUT0 : out  BYTE;
           DOUT1 : out  BYTE
			  );
    END COMPONENT;
    

   --Inputs
   signal CLK 			: std_logic := '0';
   signal RST 			: std_logic := '0';
	signal R0_EN 		: std_logic := '0';
	signal R1_EN 		: std_logic := '0';
	signal W0_EN 		: std_logic := '0';
	signal OB_RESULT 	: BYTE;
	signal IR1 			: BYTE;
	signal IR2       	: BYTE;
	signal REGA0      : BYTE;
	signal REGA1      : BYTE;
	signal ADR0_SEL  	: STD_LOGIC_VECTOR(1 downto 0) := "00";
	signal ADR1_SEL  	: STD_LOGIC := '0';
	signal ADR0_EN   	: STD_LOGIC := '0';
	signal ADR1_EN   	: STD_LOGIC := '0';
	signal DATA_EN  	: STD_LOGIC := '0';
	signal DATA_SEL 	: STD_LOGIC_VECTOR(1 downto 0) := "00";

 	--Outputs
	signal DOUT0 		: BYTE;
	signal DOUT1 		: BYTE;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM_UNIT PORT MAP (
			 CLK 			=> CLK,		
			 RST 		   => RST, 		   
			 R0_EN 	   => R0_EN, 	   
			 R1_EN 	   => R1_EN, 	   
			 W0_EN 	   => W0_EN, 	   
			 OB_RESULT  => OB_RESULT,  
			 IR1 		   => IR1, 		   
			 IR2        => IR2,
			 REGA0      => REGA0,
			 REGA1      => REGA1,
			 ADR0_SEL   => ADR0_SEL,   
			 ADR1_SEL   => ADR1_SEL,   
			 ADR0_EN    => ADR0_EN,   
			 ADR1_EN    => ADR1_EN,    
			 DATA_EN    => DATA_EN,    
			 DATA_SEL   =>	DATA_SEL,
			 DOUT0      => DOUT0,
			 DOUT1      => DOUT1
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		wait for CLK_period/2;
		
		RST <= '1'; wait for CLK_period;
		RST <= '0'; wait for CLK_period;
		
		OB_RESULT <= "00000010";
		IR1 <= "00000001";
		IR2 <= "00000000";
		
		-- RAM[IR1], RAM[IR2]
		ADR0_SEL <= "00";
		ADR1_SEL <= '1'; wait for CLK_period;
		ADR0_EN <= '1';
		ADR1_EN <= '1'; wait for CLK_period;
		
		ADR0_EN <= '0';
		ADR1_EN <= '0';
		
		R0_EN <= '1';
		R1_EN <= '1'; wait for CLK_period;
		
		R0_EN <= '0';
		R1_EN <= '0';
		
		-- RAM[IR1] <= RAM1
		IR1 <= "00000010";
		DATA_SEL <= "10";
		ADR0_SEL <= "00"; wait for CLK_period;
		
		
		ADR0_EN <= '1'; 
		DATA_EN <= '1'; wait for CLK_period;
		
		ADR0_EN <= '0';
		DATA_EN <= '0';
		
		W0_EN <= '1'; wait for CLK_period;
		W0_EN <= '0';
		
		-- RAM[IR1] <= IR2	
		IR1 <= "00000011";
		IR2 <= "10101010";
		ADR0_SEL <= "00";
		DATA_SEL <= "00"; wait for CLK_period;
		
		ADR0_EN <= '1'; 
		DATA_EN <= '1'; wait for CLK_period;
		
		ADR0_EN <= '0';
		DATA_EN <= '0';
		
		W0_EN <= '1'; wait for CLK_period;
		W0_EN <= '0';
		
		-- RAM[IR1] <= OB_RESULT	
		IR1 <= "00000100";
		
		ADR0_SEL <= "00";
		DATA_SEL <= "01"; wait for CLK_period;
		
		ADR0_EN <= '1'; 
		DATA_EN <= '1'; wait for CLK_period;
		
		ADR0_EN <= '0';
		DATA_EN <= '0';
		
		W0_EN <= '1'; wait for CLK_period;
		W0_EN <= '0';
		
		-- RAM[IR1], RAM[IR2]
		IR1 <= "00000000";
		IR2 <= "00000100";
		
		ADR0_SEL <= "00";
		ADR1_SEL <= '1'; wait for CLK_period;
		
		ADR0_EN <= '1';
		ADR1_EN <= '1'; wait for CLK_period;
		
		ADR0_EN <= '0';
		ADR1_EN <= '0';
		
		R0_EN <= '1';
		R1_EN <= '1'; wait for CLK_period;
		
		R0_EN <= '0';
		R1_EN <= '0';
		
		-- RAM[RAM0], RAM[RAM1]
		REGA0 <= DOUT0;
		REGA1 <= DOUT1;
		
		ADR0_SEL <= "10";
		ADR1_SEL <= '0'; wait for CLK_period;
		
		ADR0_EN <= '1';
		ADR1_EN <= '1'; wait for CLK_period;
		
		ADR0_EN <= '0';
		ADR1_EN <= '0';
		
		R0_EN <= '1';
		R1_EN <= '1'; wait for CLK_period;
		
		R0_EN <= '0';
		R1_EN <= '0';
		
		-- RAM[IR1], RAM[IR2]
		IR1 <= "00000000";
		IR2 <= "00000001";
		
		ADR0_SEL <= "00";
		ADR1_SEL <= '1'; wait for CLK_period;
		
		ADR0_EN <= '1';
		ADR1_EN <= '1'; wait for CLK_period;
		
		ADR0_EN <= '0';
		ADR1_EN <= '0';
		
		R0_EN <= '1';
		R1_EN <= '1'; wait for CLK_period;
		
		R0_EN <= '0';
		R1_EN <= '0';
		
		-- RAM[RAM0] <= RAM1
		REGA0 <= DOUT0;
		
		ADR0_SEL <= "10";
		DATA_SEL <= "10"; wait for CLK_period;
		
		ADR0_EN <= '1'; 
		DATA_EN <= '1'; wait for CLK_period;
		
		ADR0_EN <= '0';
		DATA_EN <= '0';
		
		W0_EN <= '1'; wait for CLK_period;
		W0_EN <= '0';
		
		wait for CLK_period;
		
		report "End of simulation" severity failure;
   end process;

END;
