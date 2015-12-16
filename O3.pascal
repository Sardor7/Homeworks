procedure inclusion_sort(var a: array of integer);
var
 i, j, l, b: integer;
begin
 l := length(a) - 1;
 for i := 1 to l do
 begin
  b := a[i];
  j := i;
  while (j > 0) and (a[j - 1] > b) do
  begin
   a[j] := a[j - 1];
   j := j - 1;
  end;
  a[j] := b;
 end;
end;

procedure read_array(var a: array of integer);
var
 i, l: integer;
begin
 write('Length: ');
 readln(l);
 setlength(a, l);
 for i := 0 to l - 1 do
 begin
  readln(a[i]);
 end;
end;

var
 a: array of integer;

begin
 read_array(a);
 writeln(a);
 inclusion_sort(a);
 writeln(a);
end.
