function is_digit(chr: char): boolean;
begin
 result := ('0' <= chr) and (chr <= '9');
end;

function to_digit(chr: char): integer;
begin
 if is_digit(chr) then
 begin
  result := integer(chr) - integer('0');
 end
 else
 begin
  result := -1;
 end;
end;

function num_to_str(num: integer): string;
var
 s: string;
begin
 Str(num, s);
 num_to_str := S;
end;

function sum_of_str(str1, str2: string): string;
var
 sum, min, max, i, mlt, l1, l2: integer;
begin
 sum := 0;
 mlt := 1;
 l1 := length(str1);
 l2 := length(str2);
 if l1 >= l2 then
 begin
  max := l1;
  min := l2;
 end
 else
 begin
  max := l2;
  min := l1;
 end;
 for i := max downto max - min + 1 do
 begin
  if l1 <= l2 then
  begin
   sum := sum + (to_digit(str1[i - l2 + l1]) + to_digit(str2[i]))*mlt;
  end
  else
  begin
   sum := sum + (to_digit(str1[i]) + to_digit(str2[i - l1 + l2]))*mlt;
  end;
  mlt := mlt*10;
 end;
 for i := max - min downto 1 do
 begin
  if l1 < l2 then
  begin
   sum := sum + to_digit(str2[i])*mlt;
  end
  else
  begin
   sum := sum + to_digit(str1[i])*mlt;
  end;
  mlt := mlt*10;
 end;
 sum_of_str := num_to_str(sum);
end;

var
 s1, s2: string;

begin
 readln(s1);
 readln(s2);
 writeln(sum_of_str(s1, s2));
end.
