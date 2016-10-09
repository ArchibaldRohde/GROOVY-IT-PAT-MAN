unit TUser_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, jpeg, ExtCtrls, DMOD;

type
TUser = class(Tobject)
  constructor create(naam : string);
  function toString : string;
  procedure fillerup;
  function getSomeDate : string;
  function getBrushed : integer;
  function getFlossed : integer;

private
  fNaam : string;
  somedate : string;
  fBrushedamount : integer;
  fFlossedamount : integer;
  fGamedamount : integer;
  arrDates : array[1..30] of string;
  arrMorning : array[1..30] of boolean;
  arrNight : array[1..30] of boolean;
  arrFlossed : array[1..30] of boolean;

public

end;
implementation

uses
Cal_Form;
//code hier//



{ TUser }

constructor TUser.create(naam: string);
var
i : integer;
begin
 fBrushedamount := 0;
 fFlossedamount := 0;
 fGamedamount := 0;
  i := 1;
 fNaam := naam;
 DMOD.DataModule1.TableCalendar.First;
 While not DMOD.DataModule1.TableCalendar.Eof do
 begin
  showmessage(Dmod.DataModule1.TableCalendar['User'] + Dmod.DataModule1.TableCalendar['Day']);
   if Dmod.DataModule1.TableCalendar['User'] = fNaam then
     begin
       arrDates[i] := Dmod.DataModule1.TableCalendar['Day'];
       arrMorning[i] := Dmod.DataModule1.TableCalendar['Morning'];
       arrNight[i] := Dmod.DataModule1.TableCalendar['Night'];
       arrFlossed[i] := Dmod.DataModule1.TableCalendar['Flossed'];
       inc(i);
     end;
   Dmod.DataModule1.TableCalendar.Next;
 end;
 
end;

procedure TUser.fillerup;
var
i, k, z : integer;

begin//
//z := 1;
  //////////////////////////////////////////Fillerup
  for i := 1 to 3 do
begin //
    for k := 1 to 7 do
    begin //
    Dmod.Datamodule1.TableCalendar.First;
  while NOT Dmod.DataModule1.TableCalendar.Eof do
    begin  //
       if( (arrDates[((i-1)*(7) + (k))] = Dmod.DataModule1.TableCalendar['Day']) and (fNaam = Dmod.DataModule1.TableCalendar['User']))then
       begin //
         Cal.SGCal.Cells[k,i] := arrDates[(i-1)*(7) + k];
          somedate := arrDates[(i-1)*(7) + k];
          showmessage(somedate);
         if arrMorning[(i-1)*(7) + k] = true then
         begin Cal.SGCal.Cells[k,i] := Cal.SGCal.Cells[k,i] + #9 + 'You Brushed in the morning';  //
                inc(fBrushedamount);
         end; //

         if arrNight[(i-1)*(7) + k] = true then
         begin Cal.SGCal.Cells[k,i] := Cal.SGCal.Cells[k,i] + #9 + 'You Brushed at night';//
                 inc(fBrushedamount);
         end; //
         if arrFlossed[(i-1)*(7) + k] = true then
         begin Cal.SGCal.Cells[k,i] := Cal.SGCal.Cells[k,i] + #9 + 'And you flossed!'; //
                 inc(fFlossedamount);
         end; //



         end; //

      Dmod.DataModule1.TableCalendar.Next;
      end;//



    end;//
end; //

end;///////////////////////////////////////////////fillerup

function TUser.getBrushed: integer;
begin
result := fBrushedamount;
end;

function TUser.getFlossed: integer;
begin
result := fFlossedamount;
end;

function TUser.getSomeDate: string;
begin
 result := somedate;
end;

function TUser.toString: string;
begin
 // result := fnaam + '#' + arrDates[1] + '#' + booltostr(arrMorning[1]) + '#' + booltostr(arrNight[1]) + '#' + booltostr(arrFlossed[1]);
end;

end.

