procedure bubble_sort(var a: array of integer);
var
 i, j, l, b, x: integer;
begin
 l := length(a) - 1;
 x := 1;
 for j := 0 to l do
 begin
  for i := 0 to l - x do
  begin
   if a[i] > a[i + 1] then
   begin
    b := a[i];
    a[i] := a[i + 1];
    a[i + 1] := b;
   end
  end;
  x := x + 1;
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
 bubble_sort(a);
 writeln(a);
end.
