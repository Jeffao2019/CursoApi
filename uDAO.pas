unit uDAO;

interface

uses
  FireDAC.Comp.Client, System.SysUtils;

type
  TDAO = Class
  private
    class procedure Connect(const pCon:TFDConnection);static;
    class procedure Disconnect(const pCon:TFDConnection);static;
  public
    class function ExecSQL(pSQL: string; const pCon:TFDConnection; const pQuery:TFDQuery):String;static;
  end;


implementation

{ TDAO }

class procedure TDAO.Connect(const pCon: TFDConnection);
begin
   pCon.Connected:=True;
end;

class procedure TDAO.Disconnect(const pCon: TFDConnection);
begin
   pCon.Connected:=False;
end;


class function TDAO.ExecSQL(pSQL: string; const pCon: TFDConnection; const pQuery: TFDQuery):String;
begin
  try
    try
      Connect(pCon);
      pQuery.Close;
      pQuery.Sql.Clear;
      pQuery.Sql.Text:=pSQL;
      pQuery.ExecSQL;
      pCon.Commit;
      Result:='Sucesso';
    except
      on E: Exception do begin
        Result:=E.Message;
      end;
    end;
  finally
    Disconnect(pCon);
  end;
end;

end.
