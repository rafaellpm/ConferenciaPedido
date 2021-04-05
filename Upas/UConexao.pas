unit UConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, MyAccess, IniFiles,
  MyEmbConnection, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Forms;

type
  TDMConexao = class(TDataModule)
    FDQuery1: TFDQuery;
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaIni;
    var User, Porta, Database, Senha, Servidor: string;
  end;

  function ConsultaMySql(var Qry : TFDQuery; CmdSQL: string) : Boolean;


var
  DMConexao: TDMConexao;
  sqlstr : string;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMConexao.CarregaIni;
var arquivo: TIniFile;
begin
  //-------------LENDO ARQUIVO INI---------
  arquivo := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'db.ini');
  User := 'quantum'; //arquivo.ReadString('BANCO', 'UsuarioBD', '');
  Porta := arquivo.ReadString('BANCO', 'Porta', '');
  Database := arquivo.ReadString('BANCO', 'NomeBanco', '');
  Senha := 'quantum28042004'; //arquivo.ReadString('BANCO', 'SenhaBD', '');
  Servidor := arquivo.ReadString('BANCO', 'Servidor', '');



  //--------------CONECTANDO AO BANCO---------
  with FDConnection1 do
  begin
    Params.Add('hostname='+ Servidor);
    Params.Add('user_name='+ User);
    Params.Add('password='+ Senha);
    Params.Add('port='+ Porta);
    Params.Add('Database='+ Database);
    FDConnection1.Connected := True;
    DriverName:= 'MySQL';
  end;

end;

procedure TDMConexao.DataModuleCreate(Sender: TObject);
begin
  FDPhysMySQLDriverLink1.VendorLib := ExtractFilePath(Application.ExeName) + 'libmysql.dll';
  CarregaIni;
end;

function ConsultaMySql(var Qry: TFDQuery; CmdSQL: string): Boolean;
begin
  Result := False;
  if (Trim(CmdSQL) = '') then
  begin
    Result := False;
    Exit;
  end;
  try
    Qry.ResourceOptions.SilentMode := True;
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(CmdSQL);
    Qry.Open;
    if not Qry.IsEmpty then
      Result := True
    else
      Result := False;
  except
    raise;
    Result := False;
    Exit;
  end;
end;

end.
