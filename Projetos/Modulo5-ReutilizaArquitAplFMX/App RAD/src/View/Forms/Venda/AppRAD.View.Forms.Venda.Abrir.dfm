object formAbrirVenda: TformAbrirVenda
  Left = 0
  Top = 0
  Caption = 'formAbrirVenda'
  ClientHeight = 196
  ClientWidth = 670
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
    Width = 209
    Height = 33
    Caption = 'Selecionar Cliente'
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
    Top = 120
    Width = 628
    Height = 57
    Caption = 'Iniciar Venda'
    TabOrder = 1
    OnClick = Button1Click
  end
end