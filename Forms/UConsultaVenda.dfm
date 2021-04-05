object FrmConsultaPedido: TFrmConsultaPedido
  Left = 0
  Top = 0
  Caption = 'Consultar Venda'
  ClientHeight = 464
  ClientWidth = 757
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 757
    Height = 67
    Align = alTop
    TabOrder = 0
    object a: TLabel
      Left = 94
      Top = 31
      Width = 6
      Height = 13
      Caption = 'a'
    end
    object Edit1: TEdit
      Left = 192
      Top = 28
      Width = 414
      Height = 21
      TabOrder = 0
      OnKeyDown = Edit1KeyDown
    end
    object ComboBox1: TComboBox
      Left = 612
      Top = 28
      Width = 125
      Height = 21
      TabOrder = 1
      Text = 'ComboBox1'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 8
      Top = 28
      Width = 81
      Height = 21
      Date = 44270.000000000000000000
      Time = 0.423031423611973900
      TabOrder = 2
    end
    object DateTimePicker2: TDateTimePicker
      Left = 106
      Top = 28
      Width = 81
      Height = 21
      Date = 44270.000000000000000000
      Time = 0.423031423611973900
      TabOrder = 3
    end
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 76
    Width = 741
    Height = 371
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = MyDataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object ColunCodOrc: TcxGridDBColumn
        DataBinding.FieldName = 'Codigo'
        Width = 20
      end
      object ColunNomeCliente: TcxGridDBColumn
        Caption = 'Nome/Raz'#227'o Social'
        DataBinding.FieldName = 'NomeRaz'#227'o_Social'
        Width = 150
      end
      object ColunData: TcxGridDBColumn
        Caption = 'Data Venda'
        DataBinding.FieldName = 'data'
        Width = 35
      end
      object ColunTotal: TcxGridDBColumn
        Caption = 'Total R$'
        DataBinding.FieldName = 'totalos'
        Width = 35
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object MyQuery1: TMyQuery
    Connection = DMConexao.MyConnection1
    SQL.Strings = (
      'select * from orcamento')
    MasterSource = MyDataSource1
    Left = 512
    Top = 128
  end
  object MyDataSource1: TMyDataSource
    DataSet = DMConexao.MyQuery1
    Left = 592
    Top = 232
  end
end
