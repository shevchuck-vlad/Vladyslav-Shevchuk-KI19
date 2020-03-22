unit unit1_task2_Shevchuk;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, validator_task2_Shevchuk, math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Xe: TEdit;
    Ye: TEdit;
    Ze: TEdit;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);

const Pi = 3.14;
var
a,b,c,x,y,z:extended;
validch:string;

function TocToZap (str : string) : extended;  // Заміна крапки на кому.
var
i:byte;
begin
 for i:=1 to length(str) do
 begin
  if str[i] = '.' then
   begin str[i] := ',' end;
 end;
TocToZap := StrToFloat(str);
end;


begin
if Xe.text = '' then
begin label1.caption := 'Введіть число Х.'; exit; end;
if Ye.text = '' then
begin label1.caption := 'Введіть число Y.'; exit; end;
if Ze.text = '' then
begin label1.caption := 'Введіть число Z.'; exit; end;

validch:=Xe.text;
 if Num(validch) = false then
 begin label1.caption := 'Некоректне число Х.'; exit; end;
validch:=Ye.text;
 if Num(validch) = false then
 begin label1.caption := 'Некоректне число Y.'; exit; end;
validch:=Ze.text;
 if Num(validch) = false then
 begin label1.caption := 'Некоректне число Z.'; exit; end;

validch := Xe.text;
x := TocToZap(validch);
validch := Ye.text;
y := TocToZap(validch);
validch := Ze.text;
z := TocToZap(validch);

if x = z then
begin label1.caption := 'Число X не може бути рівним Z.'; exit; end;

if Limit(x) = false then
begin label1.caption := 'Число X не входить в діапазон 1-126.'; exit; end;
if Limit(y) = false then
begin label1.caption := 'Число Y не входить в діапазон 1-126.'; exit; end;
if Limit(z) = false then
begin label1.caption := 'Число Z не входить в діапазон 1-126.'; exit; end;

a := x-z;
a := abs(a);
a := ln(a);

b := power(x,3);
b := Pi*b;

c := z-2;
c := abs(c);
c := power(2*y,c);
c := (2*x) + c;
c := sqrt(c);

b := b/c;
b := sqrt(b);

a := a+b;
label1.caption := 'Результат: ' + FloatToStr(A);

end;

end.

