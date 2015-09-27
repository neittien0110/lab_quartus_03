---------------------------------------------------------------------------------------------------
--
-- Title       : DFF
-- Design      : Design5
-- Author      : Nguyen Duc Tien
-- Company     : DCE, SOICT, HUST
--
---------------------------------------------------------------------------------------------------
--
-- File        : DFF.vhd
-- Generated   : Mon Sep 12 07:14:16 2011
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {DFF} architecture {DFF}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity DFF_R is
	 port(
		 D : in STD_LOGIC;
		 Rst : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 Q : out STD_LOGIC
	     );
end entity DFF_R;

--}} End of automatically maintained section

architecture behavior of DFF_R is
begin
	process (CLK,Rst)
	begin
		if Rst ='1' then	--asynchronous RESET active High
			Q <= '0';
		elsif rising_edge(clk) then  --CLK rising edge
			Q <= D;
		end if;
	end process;	 
end behavior;
