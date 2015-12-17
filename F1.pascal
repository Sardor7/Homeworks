function get_longest_word(f: file of char; location: string): string;
var
 s1, s2: string;
 a: char;
 i1, i2: integer;
begin
 assign(f, location);
 reset(f);
 s1 := '';
 s2 := '';
 i1 := 0;
 i2 := 0;
 while not eof(f) do
 begin
  read(f, a);
  if a <> ' ' then
  begin
   s2 := s2 + a;
   i2 := i2 + 1;
  end
  else
  begin
   if i2 > i1 then
   begin
    s1 := s2;
    i1 := i2;
    s2 := '';
    i2 := 0;
   end
   else
   begin
    s2 := '';
    i2 := 0;
   end;
  end;
 end;
 get_longest_word := s1;
end;

var
 f: file of char;
 l: integer;
 s: string;

begin
 s := get_longest_word(f, 'text.txt');
 l := length(s);
 writeln('Longest word is "', s, '". Length: ', l);
end.
