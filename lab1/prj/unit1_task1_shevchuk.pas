unit unit1_task1_Shevchuk;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, validator_task1_Shevchuk;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button3Click(Sender: TObject);               // Пора доби.
var
  nowtime : TDateTime;
begin
  nowtime := now;
  if (StrToInt(FormatDateTime('hhnn', nowtime)) > 2300) or (StrToInt(FormatDateTime('hhnn', nowtime)) < 0501) then
  label1.caption := 'Поточна пора доби - ніч.';
  if (StrToInt(FormatDateTime('hhnn', nowtime)) > 0500) and (StrToInt(FormatDateTime('hhnn', nowtime)) < 1101) then
  label1.caption := 'Поточна пора доби - ранок.';
  if (StrToInt(FormatDateTime('hhnn', nowtime)) > 1100) and (StrToInt(FormatDateTime('hhnn', nowtime)) < 1601) then
  label1.caption := 'Поточна пора доби - день.';
  if (StrToInt(FormatDateTime('hhnn', nowtime)) > 1600) and (StrToInt(FormatDateTime('hhnn', nowtime)) < 2301) then
  label1.caption := 'Поточна пора доби - вечір.';
end;

procedure TForm1.Button1Click(Sender: TObject);               // Кількість літер.
var
  i : byte;
  Text1  : string;
begin
  if edit1.text = '' then
  label1.caption := 'Поле пусте.';
  text1 := edit1.text;

  if (Rech(text1) = false) then
  begin
    label1.caption := 'Помилка. Введено некоректне речення.';
    exit;
  end;

  label1.caption := '0';
  for i:= 1 to length(text1) do
  if Slovo(text1[i]) = true then
  label1.caption := FloatToStr(StrToFloat(label1.caption)+0.5);

  if label1.caption = '0' then
  label1.caption := 'Помилка. Літери відсутні.'
  else
  begin
    label1.caption := 'Кількість введених літер - ' + label1.caption;
    edit1.text := '';
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);               // Визначити.
var
  text1 : string;
  i : byte;
begin
  if edit1.text = '' then
  begin label1.caption := 'Помилка. Пустий рядок.'; exit; end;
  text1 := edit1.text;


  if (Num(text1) = false) and (slovo(text1) = false) then
  begin label1.caption := 'Помилка. Некоректний рядок.'; exit; end;

  if (Num(text1) = false) and (slovo(text1) = true) then
  begin label1.caption := 'Рядок містить слово.'; edit1.text := ''; exit; end;

  if (Num(text1) = true) and (slovo(text1) = false) then
  begin
    for i:=1 to length(text1) do
    begin
    if (text1[i] = '.') or (text1[i] = ',') then
    begin label1.caption := 'Рядок містить дійсне число.'; edit1.text := ''; exit; end;
    end;
  label1.caption := 'Рядок містить ціле число.'; edit1.text := '';
  end;
end;















end.

