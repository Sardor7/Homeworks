function included(var a1, a2: array of integer): boolean;
var
 i, j, l1, l2: integer;
 s: boolean;
begin
 l1 := length(a1) - 1;
 l2 := length(a2) - 1;
 s := false;
 j := 0;
 for i := 0 to l1 do
 begin
  if a1[i] = a2[j] then
  begin
   if j = l2 then
   begin
    s := true;
    break;
   end
   else
   begin
    j := j + 1;
   end;
  end
  else
  begin
   j := 0;
  end;
 end;
 included := s;
end;

procedure read_oredered_array(var a: array of integer);
var
 i, l: integer;
begin
 write('Length: ');
 readln(l);
 setlength(a, l);
 readln(a[0]);
 i := 1;
 while i <= l - 1 do
 begin
  readln(a[i]);
  if a[i] <= a[i - 1] then
  begin
   i := i - 1;
   writeln('Enter a value bigger than ', a[i], ' !');
  end;
  i := i + 1;
 end;
end;

var
 a1, a2: array of integer;

begin
 read_oredered_array(a1);
 writeln(a1);
 read_oredered_array(a2);
 writeln(a2);
 writeln(included(a1, a2));
end.
