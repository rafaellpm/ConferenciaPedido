program Conferencia;

uses
  Vcl.Forms,
  UConfig in 'Upas\UConfig.pas',
  UConferencia in 'Forms\UConferencia.pas' {Form1},
  UConsultaProduto in 'Forms\UConsultaProduto.pas' {Form2},
  UConsultaVenda in 'Forms\UConsultaVenda.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
