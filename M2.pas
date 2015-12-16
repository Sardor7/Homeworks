const
 n = 3;

type
 sqr_matrix = array[1..n, 1..n] of integer;

procedure read_matrix(var a: sqr_matrix);
var
 i, j: integer;
begin
 for i := 1 to n do
 begin
  for j := 1 to n do
  begin
   readln(a[i, j]);
  end;
 end;
end;

procedure write_matrix(a: sqr_matrix);
var
 i, j: integer;
begin
 for i := 1 to n do
 begin
  for j := 1 to n do
  begin
   write(a[i, j], '|');
  end;
  writeln;
 end;
end;

function is_magic(a: sqr_matrix): boolean;
var
 i, j, row_sum, col_sum: integer;
 yes: boolean;
 arr: array[1..n, 1..2] of integer;
begin
 row_sum := 0;
 col_sum := 0;
 for i := 1 to n do
 begin
  for j := 1 to n do
  begin
   row_sum := row_sum + a[i, j];
  end;
  for j := 1 to n do
  begin
   col_sum := col_sum + a[j, i];
  end;
  arr[i, 1] := row_sum; {сумма эл-тов i-ой строки}
  arr[i, 2] := col_sum; {сумма эл-тов i-го столбца}
  row_sum := 0;
  col_sum := 0;
 end;
 yes := true;
 for i := 1 to n do
 begin
  if arr[i, 1] <> arr[i, 2] then
  begin
   yes := false;
   break;
  end;
  for j := 1 to n do
  begin
   if a[i, j] > n then
   begin
    yes := false;
    break;
   end;
  end;
  if not yes then break;
 end;
 is_magic := yes;
end;

var
 a: sqr_matrix;

begin
 read_matrix(a);
 write_matrix(a);
 writeln(is_magic(a));
end.
