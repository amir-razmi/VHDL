entity full is
  port(a,b,cin: in bit; s,cout: out bit);
end full;

architecture first of full is
  component half_adder is
    port(a,b: in bit; s,c: out bit);
  end component;
  for all: half_adder use entity work.HA(first);
  signal im1,im2,im3: bit;
begin
  g0: half_adder port map(A,B,im1,im2);
  g1: half_adder port map(im1,cin,S,im3);
  cout <= im3 or im2;
end first;