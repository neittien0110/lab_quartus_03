-------------------------------------------------------------------------------
--
-- Tieu de     : counter128_10
-- Ten thiet ke: slow_counter
-- Tac gia     : Nguyen Duc Tien
-- Don vi      : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : counter128_10.vhd
-- Ngay tao    : Mon Nov 25 00:00:31 2013
-- Tu file     : interface description file
-- Boi         : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Mo ta       : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {counter128_10} architecture {behavior}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_ARITH.all;   
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Boi vi sau khi chia tan so, xung dong ho khong chan 10 vi vay
-- phai su dung giai thuat gan dung de chuyen tu 128Hz sang don vi centi-second
entity counter128_10 is
     port(
        CLK128 : in STD_LOGIC;   --- Tin hieu dong ho dau vao. Kit DE2-150i, CLK=50MHz, sau khi chia tan, con lai 128Hz
         aReset: in STD_LOGIC;   --- Tin hieu reset a/p.
         DS    : buffer STD_LOGIC_VECTOR(3 downto 0)  -- Gia tri Deci-second don vi
      );
end counter128_10;

--}} End of automatically maintained section

architecture behavior of counter128_10 is
signal adder_value: STD_LOGIC_VECTOR(6 downto 0);    --- Thanh ghi chua gia tri hien thoi cua bo dem 7 bit, tu 0-> 127
begin       
    process (CLK128, aReset) 
	variable deci: integer;
    begin                  
        if aReset = '1' then
            adder_value <= CONV_STD_LOGIC_VECTOR(65,7);         -- boi vi moi khi bam reset thi chi con 1 nua chu ki la sang giay tiep theo roi
			DS <= (others  => '0');   
        elsif rising_edge(CLK128) then
            adder_value <= adder_value + 1;	  			       --adder_value= 0 --> 12, 13 -> 25, 26 -> 38, 39 -> 51, 52 -> 64, 65 -> 76, 77-> 89, 90
		                                                   	   --tmp        = 0 -->  0,  1 ->  1, 2  -> 2 , 3  ->  3, 4  -> 4 , 5  --> 5, 6 -> 6 , 7
			if adder_value = CONV_STD_LOGIC_VECTOR(0,7) then
				DS <= CONV_STD_LOGIC_VECTOR(0,4);
			elsif adder_value = CONV_STD_LOGIC_VECTOR(13,7) then
				DS <= CONV_STD_LOGIC_VECTOR(1,4);				  
			elsif adder_value = CONV_STD_LOGIC_VECTOR(26,7) then
				DS <= CONV_STD_LOGIC_VECTOR(2,4);
			elsif adder_value = CONV_STD_LOGIC_VECTOR(39,7) then
				DS <= CONV_STD_LOGIC_VECTOR(3,4);
			elsif adder_value = CONV_STD_LOGIC_VECTOR(52,7) then
				DS <= CONV_STD_LOGIC_VECTOR(4,4);
			elsif adder_value = CONV_STD_LOGIC_VECTOR(65,7) then
				DS <= CONV_STD_LOGIC_VECTOR(5,4);
			elsif adder_value = CONV_STD_LOGIC_VECTOR(77,7) then
				DS <= CONV_STD_LOGIC_VECTOR(6,4);
			elsif adder_value = CONV_STD_LOGIC_VECTOR(90,7) then
				DS <= CONV_STD_LOGIC_VECTOR(7,4);
			elsif adder_value = CONV_STD_LOGIC_VECTOR(103,7) then
				DS <= CONV_STD_LOGIC_VECTOR(8,4);
			elsif adder_value = CONV_STD_LOGIC_VECTOR(116,7) then
				DS <= CONV_STD_LOGIC_VECTOR(9,4);				
			end if;
        end if;    
    end process;                
    
end behavior;
