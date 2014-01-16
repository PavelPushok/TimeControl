object FrmMain: TFrmMain
  Left = 192
  Top = 115
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FrmMain'
  ClientHeight = 442
  ClientWidth = 902
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 104
    Top = 0
    Width = 60
    Height = 13
    Caption = 'Process List:'
  end
  object Label3: TLabel
    Left = 376
    Top = 0
    Width = 161
    Height = 13
    Caption = 'Choose the processes for control: '
  end
  object Label4: TLabel
    Left = 664
    Top = 0
    Width = 117
    Height = 13
    Caption = 'Processes under control:'
  end
  object btnPrc: TButton
    Left = 8
    Top = 32
    Width = 81
    Height = 25
    Caption = 'Get Processes'
    TabOrder = 0
    OnClick = btnPrcClick
  end
  object redt1: TRichEdit
    Left = 104
    Top = 16
    Width = 257
    Height = 417
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object chklstprc: TCheckListBox
    Left = 376
    Top = 16
    Width = 281
    Height = 417
    OnClickCheck = chklstprcClickCheck
    ItemHeight = 13
    TabOrder = 2
  end
  object lstchnprc: TListBox
    Left = 664
    Top = 16
    Width = 233
    Height = 417
    ItemHeight = 13
    TabOrder = 3
  end
  object TmrMain: TTimer
    OnTimer = TmrMainTimer
    Left = 64
    Top = 8
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 8
    Top = 80
    object ClientDataSet1TimeWrk: TIntegerField
      FieldName = 'TimeWrk'
    end
  end
end
