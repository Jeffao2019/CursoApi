unit uwmPrincipal;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Datasnap.DSHTTPCommon,
  Datasnap.DSHTTPWebBroker, Datasnap.DSServer,
  Web.WebFileDispatcher, Web.HTTPProd,
  DataSnap.DSAuth,
  Datasnap.DSProxyJavaScript, IPPeerServer, Datasnap.DSMetadata,
  Datasnap.DSServerMetadata, Datasnap.DSClientMetadata,
  Datasnap.DSCommonServer, Datasnap.DSHTTP;

type
  TwbPrincipal = class(TWebModule)
    DSHTTPWebDispatcher: TDSHTTPWebDispatcher;
    dsServer: TDSServer;
    dsAuth: TDSAuthenticationManager;
    dsServerClass: TDSServerClass;
    procedure dsServerClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure dsAuthUserAuthorize(Sender: TObject;
      EventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure dsAuthUserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TwbPrincipal;

implementation


{$R *.dfm}

uses usmPrincipal, Web.WebReq;

procedure TwbPrincipal.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<html>' +
    '<head><title>DataSnap Server</title></head>' +
    '<body>DataSnap Server</body>' +
    '</html>';
end;

procedure TwbPrincipal.dsServerClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := usmPrincipal.TsmPrincipal;
end;

procedure TwbPrincipal.dsAuthUserAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
begin
  valid := True;
end;

procedure TwbPrincipal.dsAuthUserAuthorize(
  Sender: TObject; EventObject: TDSAuthorizeEventObject; 
  var valid: Boolean);
begin
  valid := True;
end;

initialization
finalization
  Web.WebReq.FreeWebModules;

end.

