function d_srch(var a: array of integer; n: integer): integer;
var
 i, a1, a2: integer;
 s: boolean;
begin
 a1 := 1;
 a2 := length(a);
 while not s do
 begin
  i := (a1 + a2) div 2;
  if (a[i] < n) then
  begin
   a1 := i + 1;
  end
  else if (a[i] > n) then
  begin
   a2 := i - 1;
  end
  else
  begin
   d_srch := i;
   s := true;
  end;
 end;
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
 a: array of integer;
 n: integer;

begin
 read_oredered_array(a);
 writeln(a);
 writeln('What we will search?');
 readln(n);
 n := d_srch(a, n);
 writeln('Index of searching number: ', n);
end.
