unit uTables;

interface

type
  TCliente = Class
  private
    Femail: String;
    Fcpf: String;
    Fid_cliente: Integer;
    Fnome: String;
  public
    property id_cliente:Integer read Fid_cliente write Fid_cliente;
    property nome:String read Fnome write Fnome;
    property cpf:String read Fcpf write Fcpf;
    property email:String read Femail write Femail;
  end;

  TListaCliente = Class
  private
    FClientes: TArray<TCliente>;
  public
    property Clientes:TArray<TCliente> read FClientes write FClientes;
  end;

implementation

end.
