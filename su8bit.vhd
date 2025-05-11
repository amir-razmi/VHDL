entity su8bit is
  port(a: in bit_vector(7 downto 0); s1,s0: in bit; fsu: out bit_vector(7 downto 0));
end su8bit;

architecture first of su8bit is
  component mux8bit is
    port(a,b,c,d: in bit_vector(7 downto 0); s1,s0: in bit; muxout: out bit_vector(7 downto 0));
  end component;

  for all: mux8bit use entity work.mux8bit(first);
  signal x1: bit_vector(7 downto 0);
  signal x2: bit_vector(7 downto 0);
  signal x3: bit_vector(7 downto 0);
  signal x4: bit_vector(7 downto 0);
begin
  x1 <= (a(6), a(5), a(4), a(3), a(2), a(1), a(0), '0');
  x2 <= ('0', a(7), a(6), a(5), a(4), a(3), a(2), a(1));
  x3 <= (a(6), a(5), a(4), a(3), a(2), a(1), a(0), a(7));
  x4 <= (a(0), a(7), a(6), a(5), a(4), a(3), a(2), a(1));

  r1: mux8bit port map(x1,x2,x3,x4, s1,s0, fsu);
end first;