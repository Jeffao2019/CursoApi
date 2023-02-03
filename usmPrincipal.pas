unit usmPrincipal;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth;

type
  TsmPrincipal = class(TDSServerModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function updateteste(value: string):string;
    function cancelteste(value: string):string;

  end;

implementation


{$R *.dfm}


uses System.StrUtils;

function TsmPrincipal.cancelteste(value: string): string;
begin
   Result:= 'O valor digitado é: ' + value;
end;

function TsmPrincipal.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TsmPrincipal.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TsmPrincipal.updateteste(value: string): string;
begin
   Result:= 'O valor digitado é: ' + value;
end;

end.

