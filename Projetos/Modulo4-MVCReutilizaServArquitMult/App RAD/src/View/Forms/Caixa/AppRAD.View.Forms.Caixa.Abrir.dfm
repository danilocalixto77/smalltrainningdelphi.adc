object FormAbrirCaixa: TFormAbrirCaixa
  Left = 0
  Top = 0
  Caption = 'FormAbrirCaixa'
  ClientHeight = 307
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -27
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 33
  object Label1: TLabel
    Left = 24
    Top = 17
    Width = 175
    Height = 33
    Caption = 'Fiscal Abertura'
  end
  object Label2: TLabel
    Left = 24
    Top = 121
    Width = 209
    Height = 33
    Caption = 'Valor da Abertura'
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 56
    Width = 628
    Height = 41
    TabOrder = 0
  end
  object Button1: TButton
    Left = 24
    Top = 232
    Width = 628
    Height = 57
    Caption = 'Abrir Caixa'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 160
    Width = 628
    Height = 41
    TabOrder = 2
  end
  object DataSource1: TDataSource
    Left = 552
    Top = 16
  end
end
