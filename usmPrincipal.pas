unit usmPrincipal;

interface

uses System.SysUtils, System.Classes, System.StrUtils, uDAO, System.JSON, REST.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uTables, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef ;

type
  TsmPrincipal = class(TDSServerModule)
    FdCon: TFDConnection;
    qryExec: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function updateNovoCliente(pTable:String;pJSON:TJSONObject):String;
    function ListarClientes(pCodigo:Integer):TJSONObject;
  end;

implementation


{$R *.dfm}


{ TsmPrincipal }



{ TsmPrincipal }

function TsmPrincipal.ListarClientes(pCodigo: Integer): TJSONObject;
Var
  vCliente:TCliente;
  vQuery:TFDQuery;
  vSql:String;
begin
  vCliente:=TCliente.Create;
  vQuery:=TFDQuery.Create(nil);
  vQuery.Connection:=FdCon;
  try
    if pCodigo >0 then begin
      vSql:='SELECT * FROM CLIENTE WHERE ID_CLIENTE = '+IntToStr(pCodigo);
      TDao.getData(vSql,FdCon,vQuery);

      vCliente.id_cliente := vQuery.FieldByName('ID_CLIENTE').AsInteger;
      vCliente.nome       := vQuery.FieldByName('NOME').AsString;
      vCliente.cpf        := vQuery.FieldByName('CPF').AsString;
      vCliente.email      := vQuery.FieldByName('EMAIL').AsString;

      Result:= TJson.ObjectToJsonObject(vCliente);

    end else begin
      vSql:='SELECT * FROM CLIENTE';
      TDao.getData(vSql,FdCon,vQuery);
    end;





  finally
   TDao.Disconnect(FdCon);
  end;

end;

function TsmPrincipal.updateNovoCliente(pTable:String; pJSON: TJSONObject): String;
Var
  vCliente:TCliente;
  vSql:String;
begin
  vCliente:=TCliente.Create;
  if pTable = 'CLIENTE' then begin
    vCliente:=TJson.JsonToObject<TCliente>(pJSON.ToString);
    vSql:='INSERT INTO CLIENTE (NOME,CPF,EMAIL) VALUES ('+QuotedStr(vCliente.nome)+','+QuotedStr(vCliente.cpf)+','+QuotedStr(vCliente.email)+')';
    Result:=TDao.ExecSQL(vSql,FdCon,qryExec);
  end else begin
    Result:='Esta tabela não existe.';
  end;
end;

end.

