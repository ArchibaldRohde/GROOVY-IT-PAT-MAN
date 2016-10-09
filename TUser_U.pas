unit TUser_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, jpeg, ExtCtrls, DMOD;

type
TUser = class(Tobject)
  constructor create(naam : string);
  procedure fillerup;
  function getSomeDate : string;
  function getBrushed : integer;
  function getFlossed : integer;
  function getNaam : string;

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
z := 1;

  for i := 1 to 3 do
  begin
      for k := 1 to 7 do
      begin
         for z := 1 to 30 do
         begin
            if arrDates[z] = Cal.SGCal.Cells[k,i] then
            begin
              Cal.SGCal.Cells[k,i] := arrDates[z];
              somedate := arrDates[z];
              if arrMorning[z] = true then
                    begin Cal.SGCal.Cells[k,i] := Cal.SGCal.Cells[k,i] + #9 + 'You Brushed in the morning';  //
                    inc(fBrushedamount);
                     end; //

              if arrNight[z] = true then
                    begin Cal.SGCal.Cells[k,i] := Cal.SGCal.Cells[k,i] + #9 + 'You Brushed at night';//
                    inc(fBrushedamount);
                    end; //
               if arrFlossed[z] = true then
                    begin Cal.SGCal.Cells[k,i] := Cal.SGCal.Cells[k,i] + #9 + 'And you flossed!'; //
                    inc(fFlossedamount);
                    end; //
            end;

         end;

      end;

   end;



end;

function TUser.getBrushed: integer;
begin
result := fBrushedamount;
end;

function TUser.getFlossed: integer;
begin
result := fFlossedamount;
end;

function TUser.getNaam: string;
begin
 result := fNaam;
end;

function TUser.getSomeDate: string;
begin
 result := somedate;
end;


end.

