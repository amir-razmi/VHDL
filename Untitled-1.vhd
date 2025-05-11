entity HA is
  port(A,B:in bit;S,C:out bit);
end HA;

architecture first of HA is
begin
  S <= A xor B;
  C <= A and B;
end first;