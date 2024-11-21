library ieee;
use ieee.std_logic_1164.all;

entity random_mode9 is
port(
clk :in std_logic;
rst :in std_logic;
sel :in std_logic;
q:out std_logic_vector(3 downto 0)
);
end random_mode9;

architecture a of random_mode9 is
type state_type is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9);
signal state: state_type;
signal qt: std_logic_vector(3 downto 0);
signal d, d0, d1: std_logic;
signal run : std_logic := '0';
begin
process(clk)
begin
if rst = '0' then
state <= S0;
elsif clk'event and clk = '1' then
d1<=d0; d0<=sel;
case state is
when S0 => if (run = '0') then state <= S1; end if;
when S1 => if (run = '0') then state <= S2; end if;
when S2 => if (run = '0') then state <= S3; end if;
when S3 => if (run = '0') then state <= S4; end if;
when S4 => if (run = '0') then state <= S5; end if;
when S5 => if (run = '0') then state <= S6; end if;
when S6 => if (run = '0') then state <= S7; end if;
when S7 => if (run = '0') then state <= S8; end if;
when S8 => if (run = '0') then state <= S9; end if;
when S9 => if (run = '0') then state <= S0; end if;
when others => null;
end case;
end if;
end process;
d<=d1 and not d0;
with state select
qt <= "0000" when S0,
"0001" when S1,
"0010" when S2,
"0011" when S3,
"0100" when S4,
"0101" when S5,
"0110" when S6,
"0111" when S7,
"1000" when S8,
"1001" when S9;

process(d, clk)
begin
if clk'event and clk='1' then
q<=qt;
if (d='1') then
run <= not run;
end if;
end if;
end process;
end a;

