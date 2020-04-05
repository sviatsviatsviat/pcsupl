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
 
ENTITY TB_RAM_UNIT IS
END TB_RAM_UNIT;
 
ARCHITECTURE behavior OF TB_RAM_UNIT IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM_UNIT
	 Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ACC : in  std_logic_vector(7 downto 0);
           IR : in  std_logic_vector(7 downto 0);
           ADR_SEL : in  STD_LOGIC;
           ADR_EN : in  STD_LOGIC;
			  DATA_SEL : in STD_LOGIC;
           DATA_EN : in  STD_LOGIC;
           W_EN : in  STD_LOGIC;
           R_EN : in  STD_LOGIC;
           RAM_DATA : out  std_logic_vector(7 downto 0));
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal ACC : std_logic_vector(7 downto 0) := (others => '0');
   signal IR : std_logic_vector(7 downto 0) := (others => '0');
   signal ADR_SEL : std_logic := '0';
   signal ADR_EN : std_logic := '0';
   signal DATA_EN : std_logic := '0';
	signal DATA_SEL : std_logic := '0';
   signal W_EN : std_logic := '0';
   signal R_EN : std_logic := '0';

 	--Outputs
   signal RAM_DATA : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM_UNIT PORT MAP (
          CLK => CLK,
          RST => RST,
          ACC => ACC,
          IR => IR,
          ADR_SEL => ADR_SEL,
          ADR_EN => ADR_EN,
          DATA_EN => DATA_EN,
			 DATA_SEL => DATA_SEL,
          W_EN => W_EN,
          R_EN => R_EN,
          RAM_DATA => RAM_DATA
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
		
		-- Read RAM[ACC]
		ACC <= "00000000";
		ADR_SEL <= '1';
		
		ADR_EN <= '1'; wait for CLK_period;
		ADR_EN <= '0';
		
		R_EN <= '1'; wait for CLK_period;
		R_EN <= '0';
		assert RAM_DATA = "00001010" report "Test failed: Incorrect ACC read" severity failure;
		
		-- Read RAM[IR]
		IR <= "00000001";
		ADR_SEL <= '0'; wait for CLK_period;
		
		ADR_EN <= '1'; wait for CLK_period;
		ADR_EN <= '0';
		
		R_EN <= '1'; wait for CLK_period;
		R_EN <= '0';
		assert RAM_DATA = "00000100" report "Test failed: Incorrect IR read" severity failure;
		
		--Write RAM[ACC] <= RAM[IR] / 2'nd tact
		ACC <= "00000010";
		
		DATA_SEL <= '0';
		ADR_SEL <= '1'; wait for CLK_period;
		
		ADR_EN <= '1';
		DATA_EN <= '1'; wait for CLK_period;
		
		ADR_EN <= '0';
		DATA_EN <= '0';
		
		W_EN <= '1'; wait for CLK_period;
		W_EN <= '0';
		
		R_EN <= '1'; wait for CLK_period;
		R_EN <= '0';
		assert RAM_DATA = "00000100" report "Test failed: Incorrect ACC write" severity failure;
		
		-- Write RAM[IR] <= ACC
		IR <= "00000011";
		ACC <= "01010101";
		
		DATA_SEL <= '1';
		ADR_SEL <= '0'; wait for CLK_period;	
		
		ADR_EN <= '1';
		DATA_EN <= '1'; wait for CLK_period;
		ADR_EN <= '0';
		DATA_EN <= '0';
		
		W_EN <= '1'; wait for CLK_period;
		W_EN <= '0';
		R_EN <= '1'; wait for CLK_period;
		R_EN <= '0';
		assert RAM_DATA = "01010101" report "Test failed: Incorrect IR write" severity failure;
		
		
		wait for CLK_period;
		
		report "End of simulation" severity failure;
   end process;

END;
