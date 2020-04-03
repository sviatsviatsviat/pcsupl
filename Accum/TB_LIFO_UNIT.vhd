--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:44:44 03/01/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/PCSUPL/Stack/TB_LIFO_UNIT.vhd
-- Project Name:  Stack
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LIFO_UNIT
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
 
ENTITY TB_LIFO_UNIT IS
END TB_LIFO_UNIT;
 
ARCHITECTURE behavior OF TB_LIFO_UNIT IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LIFO_UNIT
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         LIFO_EN : IN  std_logic;
         MODE : IN  std_logic_vector(1 downto 0);
         PUSHDATA : IN  std_logic_vector(1 downto 0);
         OB_RESULT : IN  std_logic_vector(7 downto 0);
         RAM_DATA : IN  std_logic_vector(7 downto 0);
         IR_OUT : IN  std_logic_vector(7 downto 0);
         TOS : OUT  std_logic_vector(7 downto 0);
         TOS_1 : OUT  std_logic_vector(7 downto 0);
         EMPTY : OUT  std_logic;
         FULL : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal LIFO_EN : std_logic := '0';
   signal MODE : std_logic_vector(1 downto 0) := (others => '0');
   signal PUSHDATA : std_logic_vector(1 downto 0) := (others => '0');
   signal OB_RESULT : std_logic_vector(7 downto 0) := (others => '0');
   signal RAM_DATA : std_logic_vector(7 downto 0) := (others => '0');
   signal IR_OUT : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal TOS : std_logic_vector(7 downto 0);
   signal TOS_1 : std_logic_vector(7 downto 0);
   signal EMPTY : std_logic;
   signal FULL : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	
	type t_lifo_cmd is record
		push : std_logic_vector(1 downto 0);
		pop1 : std_logic_vector(1 downto 0);
		pop2 : std_logic_vector(1 downto 0);
		tosw : std_logic_vector(1 downto 0);
	end record t_lifo_cmd;
	
	constant lifo_cmd : t_lifo_cmd := ("00", "01", "10", "11");
	
	procedure SIGNAL_PULSE (signal s_out: out std_logic) is
	begin
		s_out <= '0'; wait for CLK_period;
		s_out <= '1'; wait for CLK_period;
		s_out <= '0'; wait for CLK_period;
	end SIGNAL_PULSE;
	
	procedure RUN_LIFO_CMD (
		constant command : in std_logic_vector(1 downto 0);
		signal	MODE	  : out std_logic_vector(1 downto 0);
		signal 	LIFO_EN	  : out std_logic ) is
	begin
		MODE 		<= command;
		LIFO_EN	<= '1';
		wait for CLK_period;
		LIFO_EN	<= '0';
		wait for CLK_period;
	end RUN_LIFO_CMD;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LIFO_UNIT PORT MAP (
          CLK => CLK,
          RST => RST,
          LIFO_EN => LIFO_EN,
          MODE => MODE,
          PUSHDATA => PUSHDATA,
          OB_RESULT => OB_RESULT,
          RAM_DATA => RAM_DATA,
          IR_OUT => IR_OUT,
          TOS => TOS,
          TOS_1 => TOS_1,
          EMPTY => EMPTY,
          FULL => FULL
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
		
		SIGNAL_PULSE(RST);
		
		OB_RESULT 	<= "00001111";
		RAM_DATA 	<= "00010000";
		IR_OUT		<= "00000011";
		
		wait for CLK_period/2;
		PUSHDATA <= "00";
		RUN_LIFO_CMD (lifo_cmd.push, MODE, LIFO_EN);
		PUSHDATA <= "01";
		RUN_LIFO_CMD (lifo_cmd.push, MODE, LIFO_EN);
		PUSHDATA <= "10";
		RUN_LIFO_CMD (lifo_cmd.push, MODE, LIFO_EN);
		PUSHDATA <= "11";
		RUN_LIFO_CMD (lifo_cmd.push, MODE, LIFO_EN);
		
		report "End of simulation" severity failure;
		
   end process;

END;
