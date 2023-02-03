program API;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uFormPrincipal in 'uFormPrincipal.pas' {FormPrincipal},
  usmPrincipal in 'usmPrincipal.pas' {smPrincipal: TDSServerModule},
  uwmPrincipal in 'uwmPrincipal.pas' {wbPrincipal: TWebModule},
  uDAO in 'uDAO.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
