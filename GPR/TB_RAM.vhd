--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:21:13 03/01/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/PCSUPL/Stack/TB_RAM.vhd
-- Project Name:  Stack
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.GPRMP.ALL;
 
ENTITY TB_RAM IS
END TB_RAM;
 
ARCHITECTURE behavior OF TB_RAM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM
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
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal W0_EN : std_logic := '0';
   signal R1_EN : std_logic := '0';
	signal R0_EN : std_logic := '0';
   signal ADR0 : std_logic_vector(7 downto 0) := (others => '0');
	signal ADR1 : std_logic_vector(7 downto 0) := (others => '0');
   signal DIN0 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal DOUT1 : std_logic_vector(7 downto 0);
	signal DOUT0 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM PORT MAP (
          CLK => CLK,
          RST => RST,
          W0_EN => W0_EN,
          R1_EN => R1_EN,
			 R0_EN => R0_EN,
          ADR0 => ADR0,
			 ADR1 => ADR1,
          DIN0 => DIN0,
          DOUT1 => DOUT1,
			 DOUT0 => DOUT0
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
		DIN0 <= "10101010";
		
		for i in 0 to 15 loop
			ADR0 <= CONV_STD_LOGIC_Vector(i, 8); wait for CLK_period;
			ADR1 <= CONV_STD_LOGIC_Vector(i, 8); wait for CLK_period;
			R0_EN <= '1'; wait for CLK_period;
			R0_EN <= '0';
			
			if i = 0 then
				assert DOUT0 = "00001010" report "Test failed: Incorrect initial read" severity failure;
			elsif i = 1 then
				assert DOUT0 = "00000100" report "Test failed: Incorrect initial read" severity failure;
			end if;
			
			W0_EN <= '1'; wait for CLK_period;
			W0_EN <= '0';
			
			R1_EN <= '1'; wait for CLK_period;
			R1_EN <= '0';
			
			assert DOUT1 = "10101010" report "Test failed: Incorrect write/read behaviour" severity failure;
			
		end loop;
		
		wait for CLK_Period;
		DIN0 <= ( others => '0');
		
		for i in 0 to 15 loop
			ADR1 <= CONV_STD_LOGIC_Vector(i, 8); wait for CLK_period;
			R1_EN <= '1'; wait for CLK_period;
			R1_EN <= '0';
			
			assert DOUT1 = "10101010" report "Test failed: Incorrect write/read behaviour" severity failure;
		end loop;
		
		wait for CLK_period;
		
		report "End of simulation" severity failure;
   end process;

END;
