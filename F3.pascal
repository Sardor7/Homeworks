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

function str_to_num(a: string): integer;
var
 i, multiplier, res: integer;
begin
 res := 0;
 multiplier := 1;
 for i := length(a) downto 1  do
 begin
  if is_digit(a[i]) then
  begin
   res := res + to_digit(a[i])*multiplier;
   multiplier := multiplier * 10;
  end;
 end;
 result := res;
end;

function read_array(): array of string;
var
 arr: array of string;
 i, l: integer;
 s: string;
begin
 write('Enter length of array: ');
 readln(l);
 setlength(arr, l);
 writeln('Elements via "enter": ');
 for i := 0 to l - 1 do
 begin
  readln(arr[i]);
 end;
 read_array := arr;
end;

procedure write_to_file(f: text; location: string);
var
 arr: array of string;
 s: string;
 a: char;
 sum, i, j: integer;
begin
 arr := read_array();
 assign(f, location);
 rewrite(f);
 for i := 0 to length(arr) - 2 do
 begin
  write(f, str_to_num(arr[i]), ' ');
 end;
 write(f, str_to_num(arr[length(arr) - 1]));
 close (f);
end;

var
 f: text;

begin
 write_to_file(f, 'ent-nums.txt');
end.
