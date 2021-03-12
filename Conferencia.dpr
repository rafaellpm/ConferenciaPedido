program Conferencia;

uses
  Vcl.Forms,
  UConfig in 'Upas\UConfig.pas',
  UConferencia in 'Forms\UConferencia.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
