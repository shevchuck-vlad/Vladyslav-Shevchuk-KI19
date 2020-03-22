unit validator_task2_Shevchuk;

{$mode objfpc}{$H+}

interface

function Num (text : string) : boolean;
function Limit (a : extended) : boolean;

implementation

function Num (text : string) : boolean;
var
  val : string;
  znak1 : boolean;
  i : byte;
begin
  znak1 := false;
  val := '0123456789-,.';


  for i:=1 to length(text) do
  begin
    if (pos(text[i], val) = 0) then
    begin Num:=false; exit; end;
  end;


  for i:=1 to length(text) do
  begin
    if (text[i] = '.') then text[i] := ',';

    if (text[i] = '-') and (i<>1) then
    begin Num := false; exit; end;

    if (text[i] = ',') and (znak1 = true) then

    begin num := false; exit; end;
    if (text[i] = ',') and (znak1 = false) then
    begin znak1 := true; end;
  end;

  if text[1] = ',' then
  begin Num := false; exit; end;
  if text[length(text)] = ',' then
  begin Num := false; exit; end;

  Num := true;


end;

function Limit (a : extended) : boolean;
begin
  if (a<1) or (a>126) then
  limit := false
  else limit := true;
end;

end.

