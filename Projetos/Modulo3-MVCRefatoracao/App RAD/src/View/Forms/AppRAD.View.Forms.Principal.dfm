object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 806
  ClientWidth = 911
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 144
    Top = 296
    Width = 759
    Height = 276
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
  object DBGrid3: TDBGrid
    Left = 144
    Top = 624
    Width = 759
    Height = 88
    DataSource = DataSource3
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button3: TButton
    Left = 828
    Top = 718
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button5: TButton
    Left = 472
    Top = 728
    Width = 75
    Height = 25
    Caption = 'Button5'
    TabOrder = 7
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 192
    Top = 718
    Width = 75
    Height = 25
    Caption = 'Button6'
    TabOrder = 8
    OnClick = Button6Click
  end
  object DBEdit1: TDBEdit
    Left = 146
    Top = 597
    Width = 121
    Height = 21
    DataField = 'ID'
    DataSource = DataSource3
    TabOrder = 9
  end
  object DBEdit2: TDBEdit
    Left = 273
    Top = 597
    Width = 121
    Height = 21
    DataField = 'STATUS'
    DataSource = DataSource3
    TabOrder = 10
  end
  object DataSource1: TDataSource
    DataSet = dmDados.QueryVendas
    Left = 848
    Top = 304
  end
  object DataSource2: TDataSource
    DataSet = dmDados.QueryCaixa
    OnDataChange = DataSource2DataChange
    Left = 848
    Top = 16
  end
  object DataSource3: TDataSource
    Left = 808
    Top = 632
  end
end
