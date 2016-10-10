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
  procedure newEntry(date : string; floss, og, aan : boolean);
  procedure changeEntry(date : string; floss, og, aan : boolean);

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
  p : integer;

public

end;
implementation

uses
Cal_Form;
//code hier//



{ TUser }

procedure TUser.changeEntry(date: string; floss, og, aan: boolean);
var
i : integer;
begin
  for i := 1 to p do
  begin
    if arrDates[i] = date then
    begin
      arrMorning[i] := og;
      arrNight[i] := aan;
      arrFlossed[i] := floss;
    end;

  end;

end;

constructor TUser.create(naam: string);
var
i : integer;
begin
 fBrushedamount := 0;
 fFlossedamount := 0;
 fGamedamount := 0;
  p := 1;
 fNaam := naam;
 Dmod.DataModule1.TableUser.Open;
 DMOD.DataModule1.TableCalendar.First;
 While not DMOD.DataModule1.TableCalendar.Eof do
 begin
 
   if Dmod.DataModule1.TableCalendar['User'] = fNaam then
     begin
       arrDates[p] := Dmod.DataModule1.TableCalendar['Day'];
       arrMorning[p] := Dmod.DataModule1.TableCalendar['Morning'];
       arrNight[p] := Dmod.DataModule1.TableCalendar['Night'];
       arrFlossed[p] := Dmod.DataModule1.TableCalendar['Flossed'];
       inc(p);
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
                    begin Cal.SGCal.Cells[k,i] := Cal.SGCal.Cells[k,i] + ' M ';  //
                    inc(fBrushedamount);
                     end; //

              if arrNight[z] = true then
                    begin Cal.SGCal.Cells[k,i] := Cal.SGCal.Cells[k,i] + ' N ';//
                    inc(fBrushedamount);
                    end; //
               if arrFlossed[z] = true then
                    begin Cal.SGCal.Cells[k,i] := Cal.SGCal.Cells[k,i] + ' F '; //
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

procedure TUser.newEntry(date: string; floss, og, aan: boolean);
begin
  inc(p);
  arrDates[p] := date;
  arrMorning[p] := og;
  arrNight[p] := aan;
  arrFlossed[p] := floss;

end;

end.

