program Conferencia;

uses
  Vcl.Forms,
  UConfig in 'Upas\UConfig.pas',
  UConferencia in 'Forms\UConferencia.pas' {FrmConferencia},
  UConsultaProduto in 'Forms\UConsultaProduto.pas' {Form2},
  UConexao in 'Upas\UConexao.pas' {DMConexao: TDataModule},
  UConsultaOrcamento in 'Forms\UConsultaOrcamento.pas' {FrmConsultarOrcamento};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmConferencia, FrmConferencia);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.Run;
end.
