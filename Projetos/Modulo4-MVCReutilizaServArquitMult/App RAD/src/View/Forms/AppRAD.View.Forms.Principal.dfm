object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 585
  ClientWidth = 911
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    911
    585)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 144
    Top = 296
    Width = 759
    Height = 276
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
    Left = 8
    Top = 8
    Width = 130
    Height = 41
    Caption = 'Listar Vendas'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBGrid2: TDBGrid
    Left = 144
    Top = 8
    Width = 759
    Height = 282
    Anchors = [akLeft, akTop, akRight]
    DataSource = DataSource2
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 8
    Top = 55
    Width = 130
    Height = 41
    Caption = 'Abrir Caixa'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 8
    Top = 102
    Width = 130
    Height = 41
    Caption = 'Abrir Venda'
    TabOrder = 4
    OnClick = Button4Click
  end
  object DataSource1: TDataSource
    Left = 848
    Top = 304
  end
  object DataSource2: TDataSource
    OnDataChange = DataSource2DataChange
    Left = 848
    Top = 16
  end
end
