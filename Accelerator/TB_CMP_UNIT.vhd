--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:21:06 03/15/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/PCSUPL/Accelerator/TB_CMP_UNIT.vhd
-- Project Name:  Accelerator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CMP_UNIT
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
 
ENTITY TB_CMP_UNIT IS
END TB_CMP_UNIT;
 
ARCHITECTURE behavior OF TB_CMP_UNIT IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CMP_UNIT
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         EN : IN  std_logic;
         ASC : IN  std_logic;
         IN0 : IN  std_logic_vector(7 downto 0);
         IN1 : IN  std_logic_vector(7 downto 0);
         REG0 : OUT  std_logic_vector(7 downto 0);
         REG1 : OUT  std_logic_vector(7 downto 0);
         XCHG : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal EN : std_logic := '0';
   signal ASC : std_logic := '0';
   signal IN0 : std_logic_vector(7 downto 0) := (others => '0');
   signal IN1 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal REG0 : std_logic_vector(7 downto 0);
   signal REG1 : std_logic_vector(7 downto 0);
   signal XCHG : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CMP_UNIT PORT MAP (
          CLK => CLK,
          RST => RST,
          EN => EN,
          ASC => ASC,
          IN0 => IN0,
          IN1 => IN1,
          REG0 => REG0,
          REG1 => REG1,
          XCHG => XCHG
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
		RST <= '0';

		IN0 <= "11110000";
		IN1 <= "00001111";
		ASC <= '1';
		EN <= '1';
		wait for CLK_period*2;
		IN0 <= "00001111";
		IN1 <= "11110000";
		ASC <= '0';
		EN <= '1';
		wait for CLK_period*3;
		
		report "End of simulation" severity failure;
		
   end process;

END;
