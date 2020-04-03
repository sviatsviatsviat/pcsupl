--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:43:45 03/01/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/PCSUPL/Stack/TB_LIFO.vhd
-- Project Name:  Stack
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LIFO
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
 
ENTITY TB_LIFO IS
END TB_LIFO;
 
ARCHITECTURE behavior OF TB_LIFO IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LIFO
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         LIFO_EN : IN  std_logic;
         MODE : IN  std_logic_vector(1 downto 0);
         DATA_IN : IN  std_logic_vector(7 downto 0);
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
   signal DATA_IN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal TOS : std_logic_vector(7 downto 0);
   signal TOS_1 : std_logic_vector(7 downto 0);
   signal EMPTY : std_logic;
   signal FULL : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	
	signal command_number : integer range 0 to 255 := 0;
	
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
		constant data	  : in integer range 0 to 255;
		signal	MODE	  : out std_logic_vector(1 downto 0);
		signal	DATA_IN : out std_logic_vector(7 downto 0);
		signal 	LIFO_EN	  : out std_logic ) is
	begin
		MODE 		<= command;
		LIFO_EN	<= '1';
		DATA_IN	<= conv_std_logic_vector(data, 8);
		wait for CLK_period;
		LIFO_EN	<= '0';
		wait for CLK_period;
	end RUN_LIFO_CMD;
	
	procedure CHECK_LIFO (
		constant lifo_tos		: in integer range 0 to 255;
		constant lifo_tos_1	: in integer range 0 to 255;
		constant lifo_empty	: in std_logic;
		constant lifo_full	: in std_logic;
		signal	TOS			: in std_logic_vector(7 downto 0);
		signal	TOS_1			: in std_logic_vector(7 downto 0);
		signal	EMPTY			: in std_logic;
		signal	FULL			: in std_logic
	) is
	begin
		assert ( TOS = conv_std_logic_vector(lifo_tos, 8)) 		report "Bad TOS"	severity failure;
		assert ( TOS_1 = conv_std_logic_vector(lifo_tos_1, 8)) 	report "Bad TOS"	severity failure;
		
		assert ( EMPTY = lifo_empty)	report "Bad EMPTY" severity failure;
		assert ( FULL  = lifo_full) 	report "Bad FULL"  severity failure;
	end CHECK_LIFO;
	
	type t_test_line is record
		cmd	: std_logic_vector(1 downto 0);
		dat	: integer range 0 to 255;
		tos	: integer range 0 to 255;
		tos_1 : integer range 0 to 255;
		empty : std_logic;
		full	: std_logic;
	end record t_test_line;
	
	type t_test is array (0 to 22) of t_test_line;
	constant test: t_test := (
		(lifo_cmd.push, 1, 1, 0, '0', '0'),
		(lifo_cmd.push, 2, 2, 1, '0', '0'),
		(lifo_cmd.push, 3, 3, 2, '0', '0'),
		(lifo_cmd.push, 4, 4, 3, '0', '0'),
		(lifo_cmd.push, 5, 5, 4, '0', '0'),
		(lifo_cmd.push, 6, 6, 5, '0', '1'),
		(lifo_cmd.push, 7, 6, 5, '0', '1'),
		(lifo_cmd.tosw, 8, 8, 5, '0', '1'),
		(lifo_cmd.pop1, 8, 5, 4, '0', '0'),
		(lifo_cmd.tosw, 9, 9, 4, '0', '0'),
		(lifo_cmd.push, 10, 10, 9, '0', '1'),
		(lifo_cmd.pop2, 10, 4, 3, '0', '0'),
		(lifo_cmd.push, 11, 11, 4, '0', '0'),
		(lifo_cmd.pop2, 11, 3, 2, '0', '0'),
		(lifo_cmd.pop2, 11, 1, 0, '0', '0'),
		(lifo_cmd.pop2, 11, 0, 0, '1', '0'),
		(lifo_cmd.tosw, 11, 11, 0, '0', '0'),
		(lifo_cmd.pop1, 11, 0, 0, '1', '0'),
		(lifo_cmd.pop1, 11, 0, 0, '1', '0'),
		(lifo_cmd.pop2, 11, 0, 0, '1', '0'),
		(lifo_cmd.push, 12, 12, 0, '0', '0'),
		(lifo_cmd.push, 13, 13, 12, '0', '0'),
		(lifo_cmd.pop1, 13, 12, 0, '0', '0')
	);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LIFO PORT MAP (
          CLK => CLK,
          RST => RST,
          LIFO_EN => LIFO_EN,
          MODE => MODE,
          DATA_IN => DATA_IN,
          TOS => TOS,
          TOS_1 => TOS_1,
          EMPTY => EMPTY,
          FULL => FULL
        );

   -- Clock process definitions
   CLK_process: process
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
		command_number <= command_number + 1;
		
		CHECK_LIFO (0,0,'1','0', TOS, TOS_1, EMPTY, FULL);
		
		for i in 0 to 22 loop
			RUN_LIFO_CMD(test(i).cmd, test(i).dat, MODE, DATA_IN, LIFO_EN);
			CHECK_LIFO (test(i).tos, test(i).tos_1, test(i).empty, test(i).full, TOS, TOS_1, EMPTY, FULL);
			command_number <= command_number + 1;
		end loop;
		
		report "End of simulation" severity failure;
   end process;

END;
