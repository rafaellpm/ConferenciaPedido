object DMConexao: TDMConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 211
  Width = 339
  object FDQuery1: TFDQuery
    Left = 160
    Top = 40
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=quantum'
      'Port=3390'
      'Database=ferragro'
      'Password=quantum28042004'
      'DriverID=MySQL')
    Left = 248
    Top = 48
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'E:\Programa'#231#227'o\ConferenciaPedido\libmysql.dll'
    Left = 128
    Top = 120
  end
end
