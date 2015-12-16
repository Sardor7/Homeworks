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

function is_per(a: array of integer): boolean;
var
 x, j, i, l: integer;
begin
 x := 0;
 j := 0;
 i := 1;
 l := length(a);
 while i < l do
 begin
  if a[j] = a[i] then
  begin
   x := i - j;
   j := j + 1;
  end
  else
  begin
   if j <> 0 then i := i - 1;
   j := 0;
   x := 0;
  end;
  i := i + 1;
 end;
 if x = 0 then is_per := false
 else is_per := true;
end;

var
  a: array of integer;

begin
  read_arr(a);
  write(is_per(a));
end.
