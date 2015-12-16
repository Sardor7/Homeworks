const
 n = 3;
 m = 3;

type
 matrix = array[0..n-1, 0..m-1] of real;

procedure read_matrix(var a: matrix);
var i, j: integer;
begin
 for i := 0 to n-1 do
 begin
  for j := 0 to m-1 do
  begin
   readln(A[i,j]);
  end;
 end;
end;

procedure write_matrix(a: matrix);
var i, j: integer;
begin
 for i := 0 to n-1 do
 begin
  for j := 0 to m-1 do
  begin
   write(' ', A[i,j], ' ');
  end;
  writeln;
 end;
end;

procedure write_saddles(a: matrix; lines, columns: array of array of real);
var i, j: integer;
begin
 for i := 0 to n-1 do
 begin
  for j := 0 to m-1 do
  begin
   if ( ((a[i, j] = lines[i, 0]) and (a[i, j] = columns[j, 1])) or ((a[i, j] = lines[i, 1]) and (a[i, j] = columns[j, 0])) ) then
   begin
    writeln('[', i, ', ' , j, ']');
   end;
  end;
 end;
end;

procedure mins_and_maxs(a: matrix; var lines, columns: array of array of real);
var i, j: integer;
begin
 for i := 0 to length(lines) - 1 do
 begin
  lines[i, 0] := a[i, 0]; {min}
  lines[i, 1] := a[i, 0]; {max}
  for j := 0 to n-1 do
  begin
   if a[i, j] < lines[i, 0] then
   begin
    lines[i, 0] := a[i, j];
   end
   else
   begin
    if a[i, j] > lines[i, 1] then
    begin
     lines[i, 1] := a[i, j];
    end;
   end;
  end;
 end;

 for i := 0 to length(columns) - 1 do
 begin
  columns[i, 0] := a[0, i]; {min}
  columns[i, 1] := a[0, i]; {max}
  for j := 0 to m-1 do
  begin
   if a[j, i] < columns[i, 0] then
   begin
    columns[i, 0] := a[j, i];
   end
   else
   begin
    if a[j, i] > columns[i, 1] then
    begin
     columns[i, 1] := a[j, i];
    end;
   end;
  end;
 end;
end;

var
 i, j: integer;
 a: matrix;
 lines, columns: array of array of real;

begin
 setlength(lines, n);
 for i := 0 to n - 1 do setlength(lines[i], 2);
 setlength(columns, m);
 for i := 0 to n - 1 do setlength(columns[i], 2);
 read_matrix(a);
 write_matrix(a);
 mins_and_maxs(a, lines, columns);
 write_saddles(a, lines, columns);
end.
