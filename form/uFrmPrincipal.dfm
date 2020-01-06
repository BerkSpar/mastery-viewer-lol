object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 146
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblSummonerName: TLabel
    Left = 8
    Top = 13
    Width = 80
    Height = 13
    Caption = 'Summoner Name'
  end
  object lblChampionId: TLabel
    Left = 8
    Top = 67
    Width = 81
    Height = 13
    Caption = 'Champion Name:'
  end
  object lblChest: TLabel
    Left = 8
    Top = 86
    Width = 35
    Height = 13
    Caption = 'Chest: '
  end
  object lblMastery: TLabel
    Left = 8
    Top = 105
    Width = 46
    Height = 13
    Caption = 'Mastery: '
  end
  object lblLevelMastery: TLabel
    Left = 8
    Top = 124
    Width = 74
    Height = 13
    Caption = 'Level Mastery: '
  end
  object Image1: TImage
    Left = 224
    Top = 59
    Width = 80
    Height = 80
  end
  object edtSummonerName: TEdit
    Left = 8
    Top = 32
    Width = 257
    Height = 21
    TabOrder = 0
    Text = 'ANNIE INDIE'
    OnKeyPress = edtSummonerNameKeyPress
  end
  object btnGo: TButton
    Left = 271
    Top = 32
    Width = 34
    Height = 21
    Caption = 'GO'
    TabOrder = 1
    OnClick = btnGoClick
  end
end
