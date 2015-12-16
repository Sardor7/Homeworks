function diff(a1, a2: array of integer): array of integer;
var
 i, j, l3: integer;
 a3: array of integer;
 numbers: array of boolean;
begin
 l3 := 0;
 j := 0;
 i := 0;
 setlength(numbers, length(a1));
 while i < length(a1) do
 begin
  if j < length(a2) then
  begin
   if a1[i] <> a2[j] then
   begin
    if a1[i] < a2[j] then
    begin
     numbers[i] := true;
     l3 := l3 + 1;
     j := j - 1;
    end
    else
    begin
     i := i - 1;
    end;
   end;
   i := i + 1;
   j := j + 1;
  end
  else
  begin
   numbers[i] := true;
   l3 := l3 + 1;
   i := i + 1;
  end;
 end;
 setlength(a3, l3);
 j := 0;
 for i := 0 to length(a1) - 1 do
 begin
  if numbers[i] then
  begin
   a3[j] := a1[i];
   j := j + 1;
  end;
 end;
 diff := a3;
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
 a1, a2, a3: array of integer;

begin
 read_oredered_array(a1);
 writeln(a1);
 read_oredered_array(a2);
 writeln(a2);
 a3 := diff(a1, a2);
 write(a3);
end.
