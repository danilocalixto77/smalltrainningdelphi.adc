object dmDados: TdmDados
  OldCreateOrder = False
  Height = 423
  Width = 652
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=D:\Projetos\Cursos\SmallTrainning\MVC e Servidor de Apl' +
        'icacao\Database\PDV.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 80
    Top = 24
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 184
    Top = 24
  end
  object QueryCaixa: TFDQuery
    Connection = FDConnection1
    Left = 62
    Top = 136
  end
  object QueryVendas: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM VENDA')
    Left = 134
    Top = 136
  end
  object QueryUsuarios: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM USUARIO')
    Left = 136
    Top = 200
  end
  object QueryAux: TFDQuery
    Connection = FDConnection1
    Left = 304
    Top = 136
  end
  object QueryClientes: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM CLIENTE')
    Left = 216
    Top = 136
  end
  object QueryProdutos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM PRODUTO')
    Left = 64
    Top = 200
  end
  object QueryVendaItens: TFDQuery
    Connection = FDConnection1
    Left = 216
    Top = 200
  end
end