entity mux4bit is
	port(a,b,c,d,s1,s0: in bit; maxout: out bit);
end mux4bit;

architecture first of mux4bit is
begin
	maxout <= ((not s1) and (not s0) and a) or ((not s1) and s0 and b) or ( s1 and (not s0) and c) or (s1 and s0 and d);
end first;