object Admin: TAdmin
  Left = 339
  Top = 199
  Width = 602
  Height = 441
  Caption = 'Admin'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    586
    402)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 96
    Width = 585
    Height = 305
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 496
    Top = 0
    Width = 89
    Height = 89
    Anchors = [akTop, akRight]
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 489
    Height = 89
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    DataSource = DataSource1
    Parameters = <>
    SQL.Strings = (
      'Select * from Calendar')
    Left = 472
    Top = 152
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=admin;Data Source=C:\Ar' +
      'chie\Repositories\GROOVY-IT-PAT-MAN\Users.mdb;Mode=Share Deny No' +
      'ne;Persist Security Info=False;Jet OLEDB:System database="";Jet ' +
      'OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:' +
      'Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global' +
      ' Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLE' +
      'DB:New Database Password="";Jet OLEDB:Create System Database=Fal' +
      'se;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale ' +
      'on Compact=False;Jet OLEDB:Compact Without Replica Repair=False;' +
      'Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 504
    Top = 152
  end
  object DataSource1: TDataSource
    Left = 440
    Top = 152
  end
end
