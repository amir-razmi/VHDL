entity sum8bit2 is
	port(a,b:in bit_vector(7 downto 0); cin:in bit; s: out bit_vector(7 downto 0); cout: out bit);
end sum8bit2;

architecture first of sum8bit2 is
	component full_adder is
		port(a,b,cin: in bit; s,cout: out bit);
	end component;
	for all: full_adder use entity work.full(first);
	signal im: bit_vector(6 downto 0);
begin
	r0: full_adder port map(a(0),b(0), cin ,s(0),im(0));
	r1: full_adder port map(a(1),b(1),im(0),s(1),im(1));
	r2: full_adder port map(a(2),b(2),im(1),s(2),im(2));
	r3: full_adder port map(a(3),b(3),im(2),s(3),im(3));
	r4: full_adder port map(a(4),b(4),im(3),s(4),im(4));
	r5: full_adder port map(a(5),b(5),im(4),s(5),im(5));
	r6: full_adder port map(a(6),b(6),im(5),s(6),im(6));
	r7: full_adder port map(a(7),b(7),im(6),s(7),cout);
end first;