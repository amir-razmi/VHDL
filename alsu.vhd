entity alsu is
    port(a,b:in bit_vector(7 downto 0); s: in bit_vector(3 downto 0); fout: out bit_vector(7 downto 0));
end alsu;

architecture first of alsu is
    component au is
        port(a,b: in bit_vector(7 downto 0); s1,s0: in bit; fau: out bit_vector(7 downto 0));
    end component;
    component lu is
        port(a,b: in bit_vector(7 downto 0); s1,s0: in bit; flu: out bit_vector(7 downto 0));
    end component;
    component su is
        port(a: in bit_vector(7 downto 0); s1,s0: in bit; fsu: out bit_vector(7 downto 0));
    end component;
    component mux8bit is
        port(a,b,c,d: in bit_vector(7 downto 0); s1,s0: in bit; muxout: out bit_vector(7 downto 0));
    end component;

    for all: au use entity work.au8bit(first);
    for all: lu use entity work.lu8bit(first);
    for all: su use entity work.su8bit(first);
    for all: mux8bit use entity work.mux8bit(first);

    signal x0: bit_vector(7 downto 0);
    signal x1: bit_vector(7 downto 0);
    signal x2: bit_vector(7 downto 0);
    signal x3: bit_vector(7 downto 0);

begin
    r1: au port map(a,b,s(1),s(0),x0);
    r2: lu port map(a,b,s(1),s(0),x1);
    r3: su port map(a,s(1),s(0),x2);
    r4: mux8bit port map(x0,x1,x2,x3,s(2),s(3),fout);
end first;
