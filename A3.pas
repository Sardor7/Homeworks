procedure read_arr(var a: array of integer);
var
  i, n: integer;
begin
 write('Count of elements: ');
 readln(n);
 setlength(a, n);
 writeln('Elements via Enter:');
 for i := 0 to n-1 do
 begin
  readln(a[i]);
 end;
end;

function longest_step_length(a: array of integer): integer;
var
 x, i, l, last: integer;
begin
 x := 1;
 l := 1;
 for i := 0 to length(a) - 2 do
 begin
  if a[i] < a[i + 1] then
  begin
   x := x + 1;
   last := x;
  end
  else
  begin
   if l < x then
   begin
    l := x;
   end;
   x := 1;
  end;
 end;
 if l < last then
   begin
    l := last;
   end;
 longest_step_length := l;
end;

var
  a: array of integer;

begin
  read_arr(a);
  write(longest_step_length(a));
end.
