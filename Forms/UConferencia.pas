unit UConferencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.UITypes, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, dxGDIPlusClasses,
  Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Buttons, frxClass, frxDBSet, Vcl.Menus;

type
  TFrmConferencia = class(TForm)
    Panel1: TPanel;
    PnlTopo: TPanel;
    PnlLogoTopo: TPanel;
    LbTitle: TLabel;
    Image1: TImage;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    QryInsereItem: TFDQuery;
    QryConsulta: TFDQuery;
    DsCabecalho: TfrxDBDataset;
    DsItens: TfrxDBDataset;
    frxReport1: TfrxReport;
    PopupMenu1: TPopupMenu;
    EditarLayoutFastReport1: TMenuItem;
    Panel2: TPanel;
    PnlLateral: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    LblCodCliente: TLabel;
    Label8: TLabel;
    LblRazao_Social: TLabel;
    LblQtdItens: TLabel;
    Label11: TLabel;
    LblQtdContado: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label3: TLabel;
    EdtCodOrcamento: TEdit;
    EdtCodProduto: TEdit;
    EdtQtd: TEdit;
    BtnFinalizar: TBitBtn;
    PnlBackground: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    ColunCodInterno: TcxGridDBColumn;
    ColunDescricao: TcxGridDBColumn;
    ColunQtdItem: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    QryOrcamento: TFDQuery;
    QryItens: TFDQuery;
    ColunDataConferido: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtCodProdutoKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure ConsultarItemConferido;
    procedure ConsultarTotalItens;
    procedure BtnFinalizarClick(Sender: TObject);
    procedure LimparDados;
    procedure CarregaConferencia;
    procedure EditarLayoutFastReport1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConferencia: TFrmConferencia;

implementation

uses
  UConfig, UConsultaProduto, UConexao, UConsultaOrcamento;

{$R *.dfm}



procedure TFrmConferencia.EdtCodProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 var codigo, codigo_interno: string;
 var codigo_orcamento, cod_produto, qtd, descricao: string;
 var qtd_contagem, qtd_orcamento, qtd_update: Integer;
 var data_conferido: TDate;
begin
  if key = 13 then
  begin
    if EdtCodOrcamento.Text = '' then
    begin
      ShowMessage('Selecione o Orcamento');
      EdtCodOrcamento.SetFocus;
    end
    else
    begin
      if EdtCodProduto.text <> '' then
      begin
        codigo := EdtCodProduto.text;
        sqlstr := 'select * from produtos where cod_ean1 = ' +  codigo + ' or cod_ean2 = ' +  codigo + ' or cod_ean3 = ' +  codigo + ' or cod_interno = ' +  codigo;
        if not ConsultaMySql(FDQuery1, sqlstr) then
        begin
          ShowMessage('Produto: ' + EdtCodProduto.Text + ' Não Cadastrado!');
          EdtCodProduto.SetFocus;
          EdtCodProduto.Text := '';
          ConsultarItemConferido;
        end
        else
        begin
          descricao := FDQuery1.FieldByName('DESCRICAO_COMPLETA').AsString;
          codigo_interno := FDQuery1.FieldByName('cod_interno').AsString;
          sqlstr := 'select * from item_orcamento where cod_produto = ' + codigo_interno + ' and codigo_orcamento = ' + EdtCodOrcamento.Text;
          if not ConsultaMySql(FDQuery1, sqlstr) then
          begin
            ShowMessage('Produto: ' + EdtCodProduto.Text + ' não existe no pedido');
            EdtCodProduto.SetFocus;
            EdtCodProduto.Text := '';
            ConsultarItemConferido;
          end
          else
          begin

            sqlstr := 'select sum(qtd) as quantidade from conferencia_orcamento where cod_orcamento = ' + EdtCodOrcamento.Text + ' and cod_produto = ' + EdtCodProduto.Text;
            ConsultaMySql(FDQuery1, sqlstr);
            qtd_contagem  := FDQuery1.FieldByName('quantidade').AsInteger;
            sqlstr := 'select sum(quantidade) as qtd from item_orcamento where codigo_orcamento = ' + EdtCodOrcamento.Text + ' and cod_produto = ' + EdtCodProduto.Text;
            ConsultaMySql(FDQuery1, sqlstr);

            qtd_orcamento := FDQuery1.FieldByName('qtd').AsInteger;
            if qtd_contagem = qtd_orcamento then
            begin
              ShowMessage('Contagem desse Produto já CONCLUÍDO');
              EdtCodProduto.SetFocus;
              EdtCodProduto.Text := '';
              ConsultarItemConferido;
            end
            else
            begin

              sqlstr := 'select * from item_orcamento where cod_produto = ' + codigo_interno + ' and codigo_orcamento = ' + EdtCodOrcamento.Text;
              ConsultaMySql(FDQuery1, sqlstr);

              codigo_orcamento          := FDQuery1.FieldByName('CODIGO_ORCAMENTO').Asstring;
              cod_produto               := FDQuery1.FieldByName('COD_PRODUTO').Asstring;
              qtd                       := EdtQtd.Text;
              data_conferido            := now;

              sqlstr := 'SELECT * FROM CONFERENCIA_ORCAMENTO WHERE COD_PRODUTO =  ' + cod_produto + ' and cod_orcamento = ' + EdtCodOrcamento.Text + ' and data_conferido = ' + QuotedStr(DateToStr(data_conferido));
              if not ConsultaMySql(FDQuery1, sqlstr) then
              begin
                QryInsereItem.SQL.Clear;
                QryInsereItem.Sql.Add('INSERT INTO CONFERENCIA_ORCAMENTO ');
                QryInsereItem.Sql.Add('(cod_orcamento, cod_produto, descricao_produto, qtd, data_conferido, qtd_pedido)');
                QryInsereItem.Sql.Add('VALUES');
                QryInsereItem.Sql.Add('(:cod_orcamento, :cod_produto, :descricao_produto, :qtd, :data_conferido, :qtd_pedido)');
                QryInsereItem.Params.ParamByName('cod_orcamento').asString := codigo_orcamento;
                QryInsereItem.Params.ParamByName('cod_produto').asString :=  cod_produto;
                QryInsereItem.Params.ParamByName('descricao_produto').asString := descricao;;
                QryInsereItem.Params.ParamByName('qtd').asString := qtd;
                QryInsereItem.Params.ParamByName('data_conferido').asString := DateToStr(data_conferido);
                QryInsereItem.Params.ParamByName('qtd_pedido').asfloat := qtd_orcamento;
              end
              else
              begin
                qtd_update := FDQuery1.FieldByName('qtd').AsInteger;
                QryInsereItem.SQL.Clear;
                QryInsereItem.Sql.Add('UPDATE CONFERENCIA_ORCAMENTO SET ');
                QryInsereItem.Sql.Add('qtd = :QTD WHERE DATA_CONFERIDO = ' + QuotedStr(DateToStr(data_conferido)) + ' and cod_orcamento = ' + EdtCodOrcamento.Text);
                QryInsereItem.Params.ParamByName('qtd').asString := IntToStr(qtd_update + StrToInt(EdtQtd.Text));

              end;

              QryInsereItem.ExecSQL;
              ConsultarItemConferido;
              ConsultarTotalItens;
              EdtCodProduto.SetFocus;
              EdtCodProduto.Text := '';
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TFrmConferencia.BtnFinalizarClick(Sender: TObject);
begin
  if LblQtdItens.Caption = LblQtdContado.Caption then
  begin
    ShowMessage('Contagem Foi concluída com exito');
    CarregaConferencia;
    frxReport1.ShowReport();
    LimparDados;
  end
  else
  begin
    if MessageDlg('Ops, ainda faltam item na conferência. Deseja Finalizar assim mesmo?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
    begin
      CarregaConferencia;
      frxReport1.ShowReport();
      LimparDados;
    end;
  end;
  end;

procedure TFrmConferencia.ConsultarItemConferido;
begin
  QryConsulta.SQL.Clear;
  sqlstr := 'select cod_orcamento, cod_produto, sum(qtd) as qtd, descricao_produto, data_conferido from conferencia_orcamento where cod_orcamento = ' + EdtCodOrcamento.Text + ' group by cod_produto, data_conferido';
  ConsultaMySql(QryConsulta, sqlstr);
end;

procedure TFrmConferencia.EditarLayoutFastReport1Click(Sender: TObject);
begin
  QryOrcamento.SQL.Add('SELECT CODIGO, NOMERAZAOSOCIAL, cpf_cnpj_cliente, DATA FROM ORCAMENTO LIMIT 1');
  QryItens.SQL.Add('select c.data_conferido, c.cod_produto, c.descricao_produto, sum(c.qtd) as contado, sum(i.quantidade) as pedido from item_orcamento as i inner join conferencia_orcamento as c on i.codigo_orcamento = c.cod_orcamento limit 1');
  frxReport1.DesignReport();
end;

procedure TFrmConferencia.FormCreate(Sender: TObject);
begin
  PnlLogoTopo.Color := COLOR_BACKGROUND_TOP_SUBMENU;
  PnlTopo.Color := COLOR_BACKGROUND_TOP;
  PnlBackground.Color := COLOR_BACKGROUND;
  PnlLateral.Color := COLOR_BACKGROUND_MENU;
  LbTitle.Color := FONT_H1;
end;

procedure TFrmConferencia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmConferencia.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    if EdtCodOrcamento.Text = '' then
    begin
      FrmConsultarOrcamento := TFrmConsultarOrcamento.Create(nil);
      try
        FrmConsultarOrcamento.Tag := 0;
        FrmConsultarOrcamento.ShowModal;
      finally
        FreeAndNil(FrmConsultarOrcamento);
        sqlstr := 'select * from conferencia_orcamento where cod_orcamento = ' + EdtCodOrcamento.Text;
        if ConsultaMySql(FDQuery1, sqlstr) then
        begin
          ConsultarItemConferido;
          ConsultarTotalItens;

        end;
      end;
    end
    else
    begin
      sqlstr := 'Select * from orcamento where codigo = ' + EdtCodOrcamento.text;
      if ConsultaMySql(FDQuery1, sqlstr) then
      begin
        LblCodCliente.Caption     := FDQuery1.FieldByName('codigocliente').AsString;
        LblRazao_Social.Caption   := FDQuery1.FieldByName('nomerazaosocial').AsString;
        ConsultarItemConferido;
        ConsultarTotalItens;

      end
      else
        ShowMessage('Venda não localizada');
    end;
  end;
end;


procedure TFrmConferencia.FormShow(Sender: TObject);
begin
  EdtCodOrcamento.SetFocus;
end;

procedure TFrmConferencia.CarregaConferencia;
var data_atual : string;
begin
  data_atual := DateToStr(now);
  QryOrcamento.SQL.Clear;
  QryItens.SQL.Clear;

  if MessageDlg('Deseja imprimir apenas os itens conferidos no dia?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
  begin
    QryOrcamento.SQL.Add('SELECT CODIGO, NOMERAZAOSOCIAL, cpf_cnpj_cliente, DATA FROM ORCAMENTO WHERE CODIGO = ' + EdtCodOrcamento.Text);

    QryItens.SQL.Add('select data_conferido, cod_produto, descricao_produto, qtd, qtd_pedido from conferencia_orcamento where cod_orcamento = ' + EdtCodOrcamento.Text + ' AND DATA_CONFERIDO = ' + data_atual);

  end
  else
  begin

    QryOrcamento.SQL.Add('SELECT CODIGO, NOMERAZAOSOCIAL, cpf_cnpj_cliente, DATA FROM ORCAMENTO WHERE CODIGO = ' + EdtCodOrcamento.Text);

    QryItens.SQL.Add('select data_conferido, cod_produto, descricao_produto, qtd, qtd_pedido from conferencia_orcamento where cod_orcamento = ' + EdtCodOrcamento.Text);

  end;

  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatorios\ConferenciaDAV.fr3');
  QryOrcamento.Active := True;
  QryItens.Active := True;
end;

procedure TFrmConferencia.LimparDados;
begin
  EdtCodOrcamento.Text := '';
  EdtCodProduto.Text := '';
  LblQtdItens.Caption := '000000000';
  LblQtdContado.Caption := '000000000';
  LblRazao_Social.Caption := '';
  LblCodCliente.Caption := '';
  QryConsulta.Close;
  EdtCodOrcamento.SetFocus;

end;

procedure TFrmConferencia.ConsultarTotalItens;
var contado: Integer;
begin
  sqlstr := 'select sum(qtd) as quantidade from conferencia_orcamento where cod_orcamento = ' + EdtCodOrcamento.Text;
  if ConsultaMySql(FDQuery1, sqlstr) then
  begin
    contado := FDQuery1.FieldByName('quantidade').AsInteger;
    if contado > 0 then
    begin
      LblQtdContado.Caption := IntToStr(contado);
    end
    else
      LblQtdContado.Caption := '0';


  end;

  sqlstr := 'select sum(quantidade) as qtd from item_orcamento where codigo_orcamento = ' + EdtCodOrcamento.Text;
  if ConsultaMySql(FDQuery1, sqlstr) then
  begin
    LblQtdItens.Caption := FDQuery1.FieldByName('qtd').AsString;
  end;

end;

end.
