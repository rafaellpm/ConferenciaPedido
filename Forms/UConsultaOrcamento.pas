unit UConsultaOrcamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Colorful, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, dxSkinsForm, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Menus;

type
  TFrmConsultarOrcamento = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdtDescricao: TEdit;
    DTInicial: TDateTimePicker;
    DTFinal: TDateTimePicker;
    ComboBox1: TComboBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    ColunCodigo: TcxGridDBColumn;
    ColunNomeRazaoSocial: TcxGridDBColumn;
    ColunVendedor: TcxGridDBColumn;
    ColunClienteCaixa: TcxGridDBColumn;
    ColunData: TcxGridDBColumn;
    ColunTipo: TcxGridDBColumn;
    ColunNrNFCe: TcxGridDBColumn;
    ColunNrNFe: TcxGridDBColumn;
    ColunTotal: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    BtnSair: TBitBtn;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    procedure EdtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure CarregaDados;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarOrcamento: TFrmConsultarOrcamento;

implementation

uses
  Uconexao, UConferencia;

{$R *.dfm}

procedure TFrmConsultarOrcamento.CarregaDados;
begin
  if not FDQuery1.IsEmpty then
  begin
    if FrmConsultarOrcamento.Tag = 0 then
    begin
      FrmConferencia.EdtCodOrcamento.Text          := FDQuery1.FieldByName('CODIGO').AsString;
      FrmConferencia.LblCodCliente.Caption      := FDQuery1.FieldByName('CODIGOCLIENTE').AsString;
      FrmConferencia.LblRazao_Social.Caption    := FDQuery1.FieldByName('NOMERAZAOSOCIAL').AsString;
    end;
    FrmConsultarOrcamento.Close;
  end;
end;

procedure TFrmConsultarOrcamento.cxGrid1DBTableView1DblClick(Sender: TObject);
var cod_vendedor: string;
begin
  CarregaDados;
end;

procedure TFrmConsultarOrcamento.cxGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    CarregaDados;
  end;
end;

procedure TFrmConsultarOrcamento.EdtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
var datainicial, datafinal: string;
begin
  datainicial := FormatDateTime('yyyy-mm-dd hh:mm:ss', DTInicial.DateTime);
  datafinal := FormatDateTime('yyyy-mm-dd hh:mm:ss', DTFinal.DateTime);
  if key = #13 then
  begin
    sqlstr := 'select * from orcamento as o inner join vendedores as v on o.cod_vendedor = v.codigo where o.data between ' + QuotedStr(datainicial) + ' and ' + QuotedStr(datafinal);
    ConsultaMySql(FDQuery1, sqlstr);
    cxGrid1.SetFocus;
  end;
end;

procedure TFrmConsultarOrcamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmConsultarOrcamento.FormShow(Sender: TObject);
var hora_inicial, hora_final: string;
    data_inicial, data_final: string;
begin
  hora_inicial := '00:00:00';
  data_inicial := DateToStr(Now);
  hora_final := '23:59:59';
  data_final := DateToStr(Now);
  DTInicial.DateTime := StrToDateTime(data_inicial + ' ' + hora_inicial);
  DTFinal.DateTime := StrToDateTime(data_final + ' ' + hora_final);
  cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText:= '';
  EdtDescricao.SetFocus;
end;

end.
