entity sum8bit is
	port(a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7,cin:in bit; s0,s1,s2,s3,s4,s5,s6,s7,cout: out bit);
end sum8bit;

architecture first of sum8bit is
	component full_adder is
		port(a,b,cin: in bit; s,cout: out bit);
	end component;
	for all: full_adder use entity work.full(first);
	signal im0,im1,im2,im3,im4,im5,im6: bit;
begin
	r0: full_adder port map(a0,b0,cin,s0,im0);
	r1: full_adder port map(a1,b1,im0,s1,im1);
	r2: full_adder port map(a2,b2,im1,s2,im2);
	r3: full_adder port map(a3,b3,im2,s3,im3);
	r4: full_adder port map(a4,b4,im3,s4,im4);
	r5: full_adder port map(a5,b5,im4,s5,im5);
	r6: full_adder port map(a6,b6,im5,s6,im6);
	r7: full_adder port map(a7,b7,im6,s7,cout);
end first;