object formOperador: TformOperador
  Left = 0
  Top = 0
  Caption = 'formOperador'
  ClientHeight = 200
  ClientWidth = 663
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
    Left = 16
    Top = 17
    Width = 241
    Height = 33
    Caption = 'Selecionar Operador'
  end
  object ComboBox1: TComboBox
    Left = 16
    Top = 56
    Width = 628
    Height = 41
    TabOrder = 0
  end
  object Button1: TButton
    Left = 16
    Top = 120
    Width = 628
    Height = 57
    Caption = 'Confirmar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    Left = 568
    Top = 8
  end
end
