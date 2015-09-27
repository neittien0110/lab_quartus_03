-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : slow_counter
-- Author      : Nguyen Duc Tien
-- Company     : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : W:\workspaces\quartus\03_counter\slow_counter\compile\top.vhd
-- Generated   : Tue Sep 15 11:35:38 2015
-- From        : W:\workspaces\quartus\03_counter\slow_counter\src\top.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


entity top is
  port(
       CLK : in STD_LOGIC;--	 Tan so 50MHz,  lay tu CLK co  san tren Kit
       Key : in STD_LOGIC;
       Pause : in STD_LOGIC;
       aReset : in STD_LOGIC;
       DS_a : out STD_LOGIC;
       DS_b : out STD_LOGIC;
       DS_c : out STD_LOGIC;
       DS_d : out STD_LOGIC;
       DS_e : out STD_LOGIC;
       DS_f : out STD_LOGIC;
       DS_g : out STD_LOGIC;
       G1024Hz : out STD_LOGIC;
       G128Hz : out STD_LOGIC;
       G1Hz : out STD_LOGIC;
       G2Hz : out STD_LOGIC;
       G32Hz : out STD_LOGIC;
       G4Hz : out STD_LOGIC;
       G8Hz : out STD_LOGIC;
       L7seg_a : out STD_LOGIC;
       L7seg_b : out STD_LOGIC;
       L7seg_c : out STD_LOGIC;
       L7seg_d : out STD_LOGIC;
       L7seg_e : out STD_LOGIC;
       L7seg_f : out STD_LOGIC;
       L7seg_g : out STD_LOGIC;
       M0_a : out STD_LOGIC;
       M0_b : out STD_LOGIC;
       M0_c : out STD_LOGIC;
       M0_d : out STD_LOGIC;
       M0_e : out STD_LOGIC;
       M0_f : out STD_LOGIC;
       M0_g : out STD_LOGIC;
       M1_a : out STD_LOGIC;
       M1_b : out STD_LOGIC;
       M1_c : out STD_LOGIC;
       M1_d : out STD_LOGIC;
       M1_e : out STD_LOGIC;
       M1_f : out STD_LOGIC;
       M1_g : out STD_LOGIC;
       S0_a : out STD_LOGIC;
       S0_b : out STD_LOGIC;
       S0_c : out STD_LOGIC;
       S0_d : out STD_LOGIC;
       S0_e : out STD_LOGIC;
       S0_f : out STD_LOGIC;
       S0_g : out STD_LOGIC;
       S1_a : out STD_LOGIC;
       S1_b : out STD_LOGIC;
       S1_c : out STD_LOGIC;
       S1_d : out STD_LOGIC;
       S1_e : out STD_LOGIC;
       S1_f : out STD_LOGIC;
       S1_g : out STD_LOGIC;
       Led : out STD_LOGIC_VECTOR(3 downto 0)
  );
end top;

architecture top of top is

---- Component declarations -----

component counter
  port (
       CLK : in STD_LOGIC;
       aReset : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component Counter10
  port (
       CLK : in STD_LOGIC;
       aReset : in STD_LOGIC;
       Co : out STD_LOGIC;
       Q : buffer STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component counter128_10
  port (
       CLK128 : in STD_LOGIC;
       aReset : in STD_LOGIC;
       DS : buffer STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component counter1M
  port (
       CLK : in STD_LOGIC;
       aReset : in STD_LOGIC;
       G1024Hz : out STD_LOGIC;
       G128Hz : out STD_LOGIC;
       G1Hz : out STD_LOGIC;
       G2Hz : out STD_LOGIC;
       G32Hz : out STD_LOGIC;
       G4Hz : out STD_LOGIC;
       G8Hz : out STD_LOGIC
  );
end component;
component counter50
  port (
       CLK : in STD_LOGIC;
       aReset : in STD_LOGIC;
       G : buffer STD_LOGIC
  );
end component;
component Counter6
  port (
       CLK : in STD_LOGIC;
       aReset : in STD_LOGIC;
       Co : out STD_LOGIC;
       Q : buffer STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component decoder7seg
  port (
       I : in STD_LOGIC_VECTOR(3 downto 0);
       a : out STD_LOGIC;
       b : out STD_LOGIC;
       c : out STD_LOGIC;
       d : out STD_LOGIC;
       e : out STD_LOGIC;
       f : out STD_LOGIC;
       g : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal apReset : STD_LOGIC;
signal G128Hz_pre : STD_LOGIC;
signal G1Hz_pre : STD_LOGIC;
signal NET1863 : STD_LOGIC;
signal NET1875 : STD_LOGIC;
signal NET1890 : STD_LOGIC;
signal NET3872 : STD_LOGIC;
signal NET4460 : STD_LOGIC;
signal NET93 : STD_LOGIC;
signal BUS3264 : STD_LOGIC_VECTOR (3 downto 0);
signal Cv : STD_LOGIC_VECTOR (3 downto 0);
signal M0 : STD_LOGIC_VECTOR (3 downto 0);
signal M1 : STD_LOGIC_VECTOR (3 downto 0);
signal S0 : STD_LOGIC_VECTOR (3 downto 0);
signal S1 : STD_LOGIC_VECTOR (3 downto 0);

begin

----  Component instantiations  ----

--	Bo chia tan so
--	tu 1MHz ve cac
--	tan so 1Hz, 2Hz
ClockDiv_1M : counter1M
  port map(
       CLK => NET93,
       G1024Hz => G1024Hz,
       G128Hz => G128Hz_pre,
       G1Hz => G1Hz_pre,
       G2Hz => G2Hz,
       G32Hz => G32Hz,
       G4Hz => G4Hz,
       G8Hz => G8Hz,
       aReset => apReset
  );

--	Bo chia tan so
--	tu 50MHz ve
--	1MHz
ClockDiv_50x : counter50
  port map(
       CLK => NET4460,
       G => NET93,
       aReset => apReset
  );

--	Bo giai ma
--	den led 7 doan
DeciSecond : decoder7seg
  port map(
       I => BUS3264,
       a => DS_a,
       b => DS_b,
       c => DS_c,
       d => DS_d,
       e => DS_e,
       f => DS_f,
       g => DS_g
  );

--	Bo dem so lan
--	bam phim 
--	tren Kit
KeyPressCounter : counter
  port map(
       CLK => NET3872,
       Q => Cv,
       aReset => apReset
  );

--	Bo giai ma
--	den led 7 doan
Led7Seg_Decoder : decoder7seg
  port map(
       I => Cv,
       a => L7seg_a,
       b => L7seg_b,
       c => L7seg_c,
       d => L7seg_d,
       e => L7seg_e,
       f => L7seg_f,
       g => L7seg_g
  );

--	Bo giai ma
--	den led 7 doan
Minute0 : decoder7seg
  port map(
       I => M0,
       a => M0_a,
       b => M0_b,
       c => M0_c,
       d => M0_d,
       e => M0_e,
       f => M0_f,
       g => M0_g
  );

--	Bo giai ma
--	den led 7 doan
Minute1 : decoder7seg
  port map(
       I => M1,
       a => M1_a,
       b => M1_b,
       c => M1_c,
       d => M1_d,
       e => M1_e,
       f => M1_f,
       g => M1_g
  );

--	Bo giai ma
--	den led 7 doan
Second0 : decoder7seg
  port map(
       I => S0,
       a => S0_a,
       b => S0_b,
       c => S0_c,
       d => S0_d,
       e => S0_e,
       f => S0_f,
       g => S0_g
  );

--	Bo giai ma
--	den led 7 doan
Second1 : decoder7seg
  port map(
       I => S1,
       a => S1_a,
       b => S1_b,
       c => S1_c,
       d => S1_d,
       e => S1_e,
       f => S1_f,
       g => S1_g
  );

U1 : Counter10
  port map(
       CLK => G1Hz_pre,
       Co => NET1863,
       Q => S0,
       aReset => apReset
  );

NET4460 <= CLK and Pause;

U2 : Counter6
  port map(
       CLK => NET1863,
       Co => NET1890,
       Q => S1,
       aReset => apReset
  );

U3 : Counter10
  port map(
       CLK => NET1890,
       Co => NET1875,
       Q => M0,
       aReset => apReset
  );

U4 : Counter6
  port map(
       CLK => NET1875,
       Q => M1,
       aReset => apReset
  );

U5 : counter128_10
  port map(
       CLK128 => G128Hz_pre,
       DS => BUS3264,
       aReset => apReset
  );

G1Hz <= G1Hz_pre;

G128Hz <= G128Hz_pre;

apReset <= not(aReset);

NET3872 <= not(Key);


---- Terminal assignment ----

    -- Output\buffer terminals
	Led <= Cv;


end top;
