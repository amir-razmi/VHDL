entity mul2bit is
  port(a1,a0,b1,b0: in bit; m: out bit_vector(3 downto 0));
end mul2bit;

architecture first of mul2bit is
  component ha is
    port(A,B:in bit;S,C:out bit);
  end component;
  for all: ha use entity work.HA(first);
  signal x: bit_vector(3 downto 0);
begin
  m(0) <= a0 and b0;
  x(0) <= a1 and b0;
  x(1) <= a0 and b1;
  r1: ha port map(x(0), x(1), m(1), x(2));
  x(3) <= a1 and b1;
  r2: ha port map(x(2), x(3), m(2), m(3));
end first;