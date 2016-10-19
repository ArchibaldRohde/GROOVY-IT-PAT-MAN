object Admin: TAdmin
  Left = 215
  Top = 338
  Width = 764
  Height = 441
  Caption = 'Admin'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    748
    402)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 96
    Width = 747
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
  object btnSQL: TButton
    Left = 466
    Top = 0
    Width = 89
    Height = 89
    Anchors = [akTop, akRight]
    Caption = 'SQL'
    TabOrder = 1
    OnClick = btnSQLClick
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 465
    Height = 89
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object btnuseless: TButton
    Left = 560
    Top = 0
    Width = 89
    Height = 89
    Caption = 'Useless'
    TabOrder = 3
    OnClick = btnuselessClick
  end
  object btnMorn: TButton
    Left = 656
    Top = 0
    Width = 89
    Height = 25
    Caption = 'Morning'
    TabOrder = 4
    OnClick = btnMornClick
  end
  object btnNight: TButton
    Left = 656
    Top = 32
    Width = 89
    Height = 25
    Caption = 'Night'
    TabOrder = 5
    OnClick = btnNightClick
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Calendar')
    Left = 472
    Top = 152
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=admin;Data Source=Users' +
      '.mdb;Mode=Share Deny None;Persist Security Info=False;Jet OLEDB:' +
      'System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Database' +
      ' Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking ' +
      'Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk' +
      ' Transactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:Cre' +
      'ate System Database=False;Jet OLEDB:Encrypt Database=False;Jet O' +
      'LEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact Withou' +
      't Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 504
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 440
    Top = 152
  end
end
