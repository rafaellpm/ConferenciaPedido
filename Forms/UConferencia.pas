unit UConferencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, dxGDIPlusClasses,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PnlLateral: TPanel;
    PnlBackground: TPanel;
    PnlTopo: TPanel;
    PnlLogoTopo: TPanel;
    Image1: TImage;
    LbTitle: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  UConfig;

{$R *.dfm}



procedure TForm1.FormCreate(Sender: TObject);
begin
  PnlLogoTopo.Color := COLOR_BACKGROUND_TOP_SUBMENU;
  PnlTopo.Color := COLOR_BACKGROUND_TOP;
  PnlBackground.Color := COLOR_BACKGROUND;
  PnlLateral.Color := COLOR_BACKGROUND_MENU;
  LbTitle.Color := FONT_H1;
end;

end.
