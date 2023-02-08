object smPrincipal: TsmPrincipal
  OldCreateOrder = False
  Height = 313
  Width = 407
  object FdCon: TFDConnection
    Params.Strings = (
      
        'Database=D:\Developer\CursoApi\ServerAPI-REST\API\Dados\DADOS.FD' +
        'B'
      'User_Name=sysdba'
      'Password=masterkey'
      'Port=1001'
      'DriverID=FB')
    LoginPrompt = False
    Left = 48
    Top = 16
  end
  object qryExec: TFDQuery
    Connection = FdCon
    Left = 48
    Top = 72
  end
end
