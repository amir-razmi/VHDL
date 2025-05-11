entity au8bit is
  port(a,b: in bit_vector(7 downto 0); s1,s0: in bit; fau: out bit_vector(7 downto 0));
end au8bit;

architecture first of au8bit is
  component mux8bit is
    port(a,b,c,d: in bit_vector(7 downto 0); s1,s0: in bit; muxout: out bit_vector(7 downto 0));
  end component;
  component sum8bit is
    port(a,b:in bit_vector(7 downto 0); cin:in bit; s: out bit_vector(7 downto 0); cout: out bit);
  end component;

  for all: mux8bit use entity work.mux8bit(first);
  for all: sum8bit use entity work.sum8bit2(first);

  signal allzero: bit_vector(7 downto 0):= "00000000";
  signal allone: bit_vector(7 downto 0):= "11111110";
  signal bnot: bit_vector(7 downto 0);
  signal x: bit_vector(7 downto 0);
  signal none: bit;
begin
  bnot <= not b;
  r1: mux8bit port map(b , bnot, allzero, allone, s1, s0, x);
  r2: sum8bit port map(a,x, s0, fau, none);
end first;