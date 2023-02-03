object wbPrincipal: TwbPrincipal
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end>
  Height = 333
  Width = 414
  object dsServer: TDSServer
    Left = 64
  end
  object DSHTTPWebDispatcher: TDSHTTPWebDispatcher
    Server = dsServer
    DSPort = 1001
    Filters = <>
    AuthenticationManager = dsAuth
    WebDispatch.PathInfo = 'datasnap*'
    Left = 64
    Top = 104
  end
  object dsAuth: TDSAuthenticationManager
    OnUserAuthenticate = dsAuthUserAuthenticate
    OnUserAuthorize = dsAuthUserAuthorize
    Roles = <>
    Left = 64
    Top = 160
  end
  object dsServerClass: TDSServerClass
    OnGetClass = dsServerClassGetClass
    Server = dsServer
    Left = 64
    Top = 56
  end
end
