object formVenderItens: TformVenderItens
  Left = 0
  Top = 0
  Caption = 'formVenderItens'
  ClientHeight = 647
  ClientWidth = 744
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
    Width = 94
    Height = 33
    Caption = 'Produto'
  end
  object Label2: TLabel
    Left = 24
    Top = 103
    Width = 136
    Height = 33
    Caption = 'Quantidade'
  end
  object Label3: TLabel
    Left = 661
    Top = 103
    Width = 60
    Height = 33
    Caption = 'Total'
  end
  object Label4: TLabel
    Left = 601
    Top = 519
    Width = 120
    Height = 57
    Alignment = taRightJustify
    Caption = 'Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -47
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 652
    Top = 142
    Width = 69
    Height = 33
    Alignment = taRightJustify
    Caption = 'Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 24
    Top = 257
    Width = 207
    Height = 33
    Caption = 'Itens no Carrinho'
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 56
    Width = 697
    Height = 41
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 24
    Top = 142
    Width = 136
    Height = 41
    TabOrder = 1
    OnChange = Edit1Change
  end
  object Button1: TButton
    Left = 24
    Top = 189
    Width = 697
    Height = 57
    Caption = 'Adicionar Item'
    TabOrder = 2
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 296
    Width = 697
    Height = 217
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -27
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 24
    Top = 519
    Width = 201
    Height = 42
    Caption = 'Remover Item'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 584
    Width = 697
    Height = 55
    Caption = 'Finalizar Venda'
    TabOrder = 5
    OnClick = Button3Click
  end
  object DataSource1: TDataSource
    DataSet = dmDados.QueryVendaItens
    Left = 672
    Top = 312
  end
end