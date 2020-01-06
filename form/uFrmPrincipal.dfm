object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'LoL Mastery'
  ClientHeight = 132
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblSummonerName: TLabel
    Left = 3
    Top = 4
    Width = 80
    Height = 13
    Caption = 'Summoner Name'
  end
  object lblChampionId: TLabel
    Left = 3
    Top = 50
    Width = 81
    Height = 13
    Caption = 'Champion Name:'
  end
  object lblChest: TLabel
    Left = 3
    Top = 71
    Width = 35
    Height = 13
    Caption = 'Chest: '
  end
  object lblMastery: TLabel
    Left = 3
    Top = 92
    Width = 46
    Height = 13
    Caption = 'Mastery: '
  end
  object lblLevelMastery: TLabel
    Left = 3
    Top = 114
    Width = 74
    Height = 13
    Caption = 'Level Mastery: '
  end
  object icon: TImage
    Left = 219
    Top = 50
    Width = 80
    Height = 80
    Proportional = True
  end
  object edtSummonerName: TEdit
    Left = 3
    Top = 23
    Width = 257
    Height = 21
    TabOrder = 0
    Text = 'ANNIE INDIE'
    OnKeyPress = edtSummonerNameKeyPress
  end
  object btnGo: TButton
    Left = 266
    Top = 23
    Width = 34
    Height = 21
    Caption = 'GO'
    TabOrder = 1
    OnClick = btnGoClick
  end
end
