--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:19:07 03/07/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/PCSUPL/Accum/TB_ACCUM.vhd
-- Project Name:  Accum
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ACCUM
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
 
ENTITY TB_ACCUM IS
END TB_ACCUM;
 
ARCHITECTURE behavior OF TB_ACCUM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ACCUM
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         MODE : IN  std_logic_vector(1 downto 0);
         ACCUM_EN : IN  std_logic;
         DIN : IN  std_logic_vector(7 downto 0);
         DOUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal MODE : std_logic_vector(1 downto 0) := (others => '0');
   signal ACCUM_EN : std_logic := '0';
   signal DIN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal DOUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ACCUM PORT MAP (
          CLK => CLK,
          RST => RST,
          MODE => MODE,
          ACCUM_EN => ACCUM_EN,
          DIN => DIN,
          DOUT => DOUT
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
		
		wait for CLK_Period/2;
		
		RST <= '1'; wait for CLK_Period;
		RST <= '0'; wait for CLK_Period;
		
		ACCUM_EN <= '0';
		ACCUM_EN <= '1'; wait for CLK_Period;
		assert DOUT = "00000000" report "Test failed: incorrect reset" severity failure; 
		
		wait for CLK_Period;
		
		ACCUM_EN <= '0';
		MODE <= "10"; wait for CLK_Period;
		ACCUM_EN <= '1'; wait for CLK_Period;
		ACCUM_EN <= '0';
		assert DOUT = "00000001" report "Test failed: incorrect increment" severity failure; 
		
		MODE <= "11"; wait for CLK_Period;
		ACCUM_EN <= '1'; wait for CLK_Period;
		ACCUM_EN <= '0';
		assert DOUT = "00000000" report "Test failed: incorrect decrement" severity failure; 
		
		DIN <= "10101010";
		MODE <= "01"; wait for CLK_Period;
		ACCUM_EN <= '1'; wait for CLK_Period;
		ACCUM_EN <= '0';
		assert DOUT = "10101010" report "Test failed: incorrect write" severity failure; 
		
		MODE <= "00"; wait for CLK_Period;
		ACCUM_EN <= '1'; wait for CLK_Period;
		ACCUM_EN <= '0';
		assert DOUT = "10101010" report "Test failed: incorrect store" severity failure; 
		
		wait for CLK_period;
		
		report "End of simulation" severity failure;
   end process;

END;
