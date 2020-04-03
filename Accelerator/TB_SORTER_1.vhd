--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:24:35 03/16/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/PCSUPL/Accelerator/TB_SORTER_1.vhd
-- Project Name:  Accelerator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sorter
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_SORTER_1 IS
END TB_SORTER_1;
 
ARCHITECTURE behavior OF TB_SORTER_1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sorter
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         EN : IN  std_logic;
         ASC : IN  std_logic;
         REG0 : INOUT  std_logic_vector(7 downto 0);
         REG1 : INOUT  std_logic_vector(7 downto 0);
         REG2 : INOUT  std_logic_vector(7 downto 0);
         REG3 : INOUT  std_logic_vector(7 downto 0);
         HALT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal EN : std_logic := '0';
   signal ASC : std_logic := '0';

	--BiDirs
   signal REG0 : std_logic_vector(7 downto 0);
   signal REG1 : std_logic_vector(7 downto 0);
   signal REG2 : std_logic_vector(7 downto 0);
   signal REG3 : std_logic_vector(7 downto 0);

 	--Outputs
   signal HALT : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sorter PORT MAP (
          CLK => CLK,
          RST => RST,
          EN => EN,
          ASC => ASC,
          REG0 => REG0,
          REG1 => REG1,
          REG2 => REG2,
          REG3 => REG3,
          HALT => HALT
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
      wait for CLK_period;
		
		RST <= '1';
		wait for CLK_period;
		RST <= '0';
		
		REG0 <= "00010000";
		REG1 <= "10000000";
		REG2 <= "00000010";
		REG3 <= "00100000";
		ASC <= '0';
		wait for CLK_period;
		
		EN <= '1';
		wait for CLK_period;
		
		
		
		wait until HALT = '1';		

      report "End of simulation" severity failure;
   end process;

END;
