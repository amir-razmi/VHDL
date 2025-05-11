entity lu8bit is
  port(a,b: in bit_vector(7 downto 0); s1,s0: in bit; flu: out bit_vector(7 downto 0));
end lu8bit;

architecture first of lu8bit is
  component mux8bit is
    port(a,b,c,d: in bit_vector(7 downto 0); s1,s0: in bit; muxout: out bit_vector(7 downto 0));
  end component;

  for all: mux8bit use entity work.mux8bit(first);
  signal x1: bit_vector(7 downto 0);
  signal x2: bit_vector(7 downto 0);
  signal x3: bit_vector(7 downto 0);
  signal x4: bit_vector(7 downto 0);
begin
  x1 <= a and b;
  x2 <= a or b;
  x3 <= a xor b;
  x4 <= not a;

  r1: mux8bit port map(x1,x2,x3,x4, s1,s0, flu);
end first;