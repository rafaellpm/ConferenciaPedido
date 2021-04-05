object FrmConsultarOrcamento: TFrmConsultarOrcamento
  Left = 0
  Top = 0
  Caption = 'Consultar Orcamento'
  ClientHeight = 601
  ClientWidth = 999
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    999
    601)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 999
    Height = 57
    Align = alTop
    TabOrder = 0
    DesignSize = (
      999
      57)
    object Label1: TLabel
      Left = 183
      Top = 4
      Width = 229
      Height = 13
      Caption = 'Digite Dados do Orcamento, Pesquisa Din'#226'mica.'
    end
    object Label2: TLabel
      Left = 9
      Top = 4
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label3: TLabel
      Left = 96
      Top = 4
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object Label4: TLabel
      Left = 807
      Top = 4
      Width = 69
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Consultar Por:'
    end
    object EdtDescricao: TEdit
      Left = 183
      Top = 23
      Width = 618
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnKeyPress = EdtDescricaoKeyPress
    end
    object DTInicial: TDateTimePicker
      Left = 9
      Top = 23
      Width = 81
      Height = 21
      Date = 44249.000000000000000000
      Time = 44249.000000000000000000
      TabOrder = 0
    end
    object DTFinal: TDateTimePicker
      Left = 96
      Top = 23
      Width = 81
      Height = 21
      Date = 44249.000000000000000000
      Time = 0.596096018518437600
      TabOrder = 1
    end
    object ComboBox1: TComboBox
      Left = 807
      Top = 23
      Width = 183
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      TabStop = False
      Text = 'ComboBox1'
    end
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 63
    Width = 983
    Height = 483
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      OnKeyPress = cxGrid1DBTableView1KeyPress
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object ColunCodigo: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'codigo'
        HeaderAlignmentHorz = taCenter
        Width = 66
      end
      object ColunNomeRazaoSocial: TcxGridDBColumn
        Caption = 'Nome/Raz'#227'o Social'
        DataBinding.FieldName = 'nomerazaosocial'
        HeaderAlignmentHorz = taCenter
        Width = 372
      end
      object ColunVendedor: TcxGridDBColumn
        Caption = 'Vendedor'
        DataBinding.FieldName = 'nome'
        HeaderAlignmentHorz = taCenter
        Width = 66
      end
      object ColunClienteCaixa: TcxGridDBColumn
        Caption = 'Cli.Caixa'
        DataBinding.FieldName = 'cli_caixa'
        HeaderAlignmentHorz = taCenter
        Width = 72
      end
      object ColunData: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'DATA'
        HeaderAlignmentHorz = taCenter
        Width = 143
      end
      object ColunTipo: TcxGridDBColumn
        Caption = 'Tipo'
        DataBinding.FieldName = 'tipo'
        HeaderAlignmentHorz = taCenter
        Width = 49
      end
      object ColunNrNFCe: TcxGridDBColumn
        Caption = 'Nr. NFCe'
        DataBinding.FieldName = 'numero_nfce'
        HeaderAlignmentHorz = taCenter
        Width = 72
      end
      object ColunNrNFe: TcxGridDBColumn
        Caption = 'Nr NFe'
        DataBinding.FieldName = 'nrnfe'
        HeaderAlignmentHorz = taCenter
        Width = 77
      end
      object ColunTotal: TcxGridDBColumn
        Caption = 'R$ Total'
        DataBinding.FieldName = 'totalos'
        HeaderAlignmentHorz = taCenter
        Width = 64
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object CheckBox1: TCheckBox
    Left = 64
    Top = 552
    Width = 97
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'Todos DAV'
    TabOrder = 2
  end
  object CheckBox2: TCheckBox
    Left = 183
    Top = 552
    Width = 97
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'DAV Abertos'
    TabOrder = 3
  end
  object CheckBox3: TCheckBox
    Left = 302
    Top = 552
    Width = 97
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'DAV Fechados'
    TabOrder = 4
  end
  object CheckBox4: TCheckBox
    Left = 422
    Top = 552
    Width = 97
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'DAV Cancelados'
    TabOrder = 5
  end
  object CheckBox5: TCheckBox
    Left = 534
    Top = 552
    Width = 107
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'DAV Transferidos'
    TabOrder = 6
  end
  object CheckBox6: TCheckBox
    Left = 766
    Top = 552
    Width = 97
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'DAV Devolu'#231#227'o'
    TabOrder = 7
  end
  object CheckBox7: TCheckBox
    Left = 654
    Top = 552
    Width = 97
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'DAV Consumo'
    TabOrder = 8
  end
  object BtnSair: TBitBtn
    Left = 869
    Top = 552
    Width = 122
    Height = 42
    Anchors = [akRight, akBottom]
    Caption = 'Sair'
    TabOrder = 9
  end
  object FDQuery1: TFDQuery
    Connection = DMConexao.FDConnection1
    SQL.Strings = (
      
        'select * from orcamento as o inner join vendedores as v on o.cod' +
        '_vendedor = v.codigo limit 1')
    Left = 648
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 696
    Top = 160
  end
end
