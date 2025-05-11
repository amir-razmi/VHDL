entity mux8bit is
	port(a,b,c,d: in bit_vector(7 downto 0); s1,s0: in bit; muxout: out bit_vector(7 downto 0));
end mux8bit;

architecture first of mux8bit is
	component mux4bit is
		port(a,b,c,d,s1,s0: in bit; maxout: out bit);
	end component;
	for all: mux4bit use entity work.mux4bit(first);

begin
	r0: mux4bit port map(a(0) , b(0) , c(0) , d(0) , s1, s0, muxout(0));
	r1: mux4bit port map(a(1) , b(1) , c(1) , d(1) , s1, s0, muxout(1));
	r2: mux4bit port map(a(2) , b(2) , c(2) , d(2) , s1, s0, muxout(2));
	r3: mux4bit port map(a(3) , b(3) , c(3) , d(3) , s1, s0, muxout(3));
	r4: mux4bit port map(a(4) , b(4) , c(4) , d(4) , s1, s0, muxout(4));
	r5: mux4bit port map(a(5) , b(5) , c(5) , d(5) , s1, s0, muxout(5));
	r6: mux4bit port map(a(6) , b(6) , c(6) , d(6) , s1, s0, muxout(6));
	r7: mux4bit port map(a(7) , b(7) , c(7) , d(7) , s1, s0, muxout(7));
end first;