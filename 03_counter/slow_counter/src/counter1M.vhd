-------------------------------------------------------------------------------
--
-- Tieu de     : counter40
-- Ten thiet ke: slow_counter
-- Tac gia     : Nguyen Duc Tien
-- Don vi      : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : counter40.vhd
-- Ngay tao    : Mon Nov 25 00:00:31 2013
-- Tu file     : interface description file
-- Boi         : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Mo ta       : Bo chia tan tin hieu dong do 1MH -> 1Hz, 2Hz...
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {counter40} architecture {behavior}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_ARITH.all;   
use IEEE.STD_LOGIC_UNSIGNED.all;

--- @brief Bo dem tran 1MHz, de chia tan so 1MHz thanh nhieu tan so nho hon
entity counter1M is    
     port(
         CLK   : in STD_LOGIC;     --- Tin hieu dong ho dau vao.
         aReset: in STD_LOGIC;     --- Tin hieu reset a/p.
         G1Hz  : out STD_LOGIC;    --- Tin hieu sau khi tran bo cong, voi tan so 1Hz
         G2Hz  : out STD_LOGIC;    --- Tin hieu sau khi tran bo cong, voi tan so 2Hz
         G4Hz  : out STD_LOGIC;    --- Tin hieu sau khi tran bo cong, voi tan so 5Hz
         G8Hz  : out STD_LOGIC;    --- Tin hieu sau khi tran bo cong, voi tan so 10Hz
         G32Hz  : out STD_LOGIC;   --- Tin hieu sau khi tran bo cong, voi tan so 32Hz
         G128Hz  : out STD_LOGIC;  --- Tin hieu sau khi tran bo cong, voi tan so 128Hz
         G1024Hz  : out STD_LOGIC  --- Tin hieu sau khi tran bo cong, voi tan so 1024Hz
      );
end counter1M;

--}} End of automatically maintained section

architecture behavior of counter1M is
signal adder_value: STD_LOGIC_VECTOR(19 downto 0);    --- Thanh ghi chua gia tri hien thoi cua bo dem
begin        
    --- Thuc hien bo dem 19 bit
    process (CLK, aReset)
    begin                  
        if aReset = '1' then
            adder_value <= (others => '0');  
        elsif rising_edge(CLK) then
            adder_value <= adder_value + 1;
        end if;    
    end process;                
    --- Dua gia tri bit carry, bit tran cua bo dem ra ngoai, thanh tin hieu chia tan so
    G1Hz    <= adder_value(19);
    G2Hz    <= adder_value(18);
    G4Hz    <= adder_value(17);
    G8Hz    <= adder_value(16);
    G32Hz   <= adder_value(14);
    G128Hz  <= adder_value(12);
    G1024Hz <= adder_value(9);	 
	-- G500KHz <= <= adder_value(0);
end behavior;

