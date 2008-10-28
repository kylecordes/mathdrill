object MathFlashCardForm: TMathFlashCardForm
  Left = 390
  Top = 299
  Caption = 'Math Drill'
  ClientHeight = 387
  ClientWidth = 669
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object MainPC: TPageControl
    Left = 0
    Top = 0
    Width = 669
    Height = 387
    ActivePage = SetupSheet
    Align = alClient
    TabOrder = 0
    object SetupSheet: TTabSheet
      Caption = 'Setup'
      object Label5: TLabel
        Left = 40
        Top = 60
        Width = 38
        Height = 14
        Caption = 'Range:'
      end
      object Label7: TLabel
        Left = 138
        Top = 57
        Width = 4
        Height = 14
        Caption = '-'
      end
      object Label8: TLabel
        Left = 40
        Top = 264
        Width = 53
        Height = 14
        Caption = 'Problems:'
      end
      object ProblemCountLabel: TLabel
        Left = 111
        Top = 264
        Width = 24
        Height = 14
        Caption = '999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 8
        Top = 24
        Width = 272
        Height = 14
        Caption = 'What kinds of problems do you want to practice?'
      end
      object Label11: TLabel
        Left = 208
        Top = 60
        Width = 369
        Height = 14
        Caption = 
          '(Don'#39't enter negative number here, the negative option is below.' +
          ')'
      end
      object IncludeNegativeInputs: TCheckBox
        Left = 40
        Top = 201
        Width = 169
        Height = 17
        Caption = 'Include negative values'
        TabOrder = 6
        OnClick = IncludeNegativeInputsClick
      end
      object IncludeNegativeResults: TCheckBox
        Left = 40
        Top = 224
        Width = 169
        Height = 17
        Caption = 'Include negative answers'
        TabOrder = 7
        OnClick = IncludeNegativeResultsClick
      end
      object Panel1: TPanel
        Left = 0
        Top = 307
        Width = 661
        Height = 51
        Align = alBottom
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 9
        object Label10: TLabel
          Left = 12
          Top = 8
          Width = 317
          Height = 14
          Caption = 'Copyright 2007-2008 Kyle Cordes - http://kylecordes.com'
        end
        object Label6: TLabel
          Left = 12
          Top = 28
          Width = 397
          Height = 21
          AutoSize = False
          Caption = 'This is free software. You are welcome to use and copy it.'
          WordWrap = True
          OnClick = Label6Click
        end
      end
      object IncludeAddition: TCheckBox
        Left = 40
        Top = 96
        Width = 89
        Height = 17
        Caption = '+  Addition'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = IncludeAdditionClick
      end
      object IncludeSubtraction: TCheckBox
        Left = 40
        Top = 120
        Width = 117
        Height = 17
        Caption = '-   Subtraction'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = IncludeAdditionClick
      end
      object IncludeMultiplication: TCheckBox
        Left = 40
        Top = 144
        Width = 117
        Height = 17
        Caption = 'x   Multiplication'
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = IncludeAdditionClick
      end
      object IncludeDivision: TCheckBox
        Left = 40
        Top = 167
        Width = 81
        Height = 17
        Caption = '/  Division'
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = IncludeAdditionClick
      end
      object GoButton: TButton
        Left = 310
        Top = 236
        Width = 75
        Height = 42
        Caption = 'Go!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = GoButtonClick
      end
      object MaxInputEdit: TEdit
        Left = 147
        Top = 57
        Width = 40
        Height = 22
        MaxLength = 3
        TabOrder = 1
        Text = '12'
        OnChange = MaxInputEditChange
      end
      object MinInputEdit: TEdit
        Left = 92
        Top = 57
        Width = 40
        Height = 22
        MaxLength = 3
        TabOrder = 0
        Text = '0'
        OnChange = MinInputEditChange
      end
    end
    object RunSheet: TTabSheet
      Caption = 'Go'
      ImageIndex = 1
      object Bevel2: TBevel
        Left = 17
        Top = 240
        Width = 200
        Height = 105
      end
      object Val1Label: TLabel
        Left = 325
        Top = 42
        Width = 36
        Height = 72
        Alignment = taRightJustify
        Caption = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -64
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RightLabel: TLabel
        Left = 160
        Top = 296
        Width = 20
        Height = 16
        Caption = '----'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object OopsLabel: TLabel
        Left = 160
        Top = 320
        Width = 20
        Height = 16
        Caption = '----'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object TimeLabel: TLabel
        Left = 160
        Top = 248
        Width = 25
        Height = 20
        Caption = '----'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SorryLabel: TLabel
        Left = 152
        Top = 149
        Width = 339
        Height = 29
        Caption = 'Oops, the correct answer was'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label1: TLabel
        Left = 24
        Top = 296
        Width = 115
        Height = 14
        Caption = 'Right The First Time:'
      end
      object Label2: TLabel
        Left = 24
        Top = 320
        Width = 103
        Height = 14
        Caption = 'Room To Improve:'
      end
      object Label3: TLabel
        Left = 24
        Top = 248
        Width = 76
        Height = 14
        Caption = 'Time Elapsed:'
      end
      object GoodJobLabel: TLabel
        Left = 176
        Top = 120
        Width = 300
        Height = 72
        Caption = 'Good Job!'
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -64
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object AnswerLabel: TLabel
        Left = 152
        Top = 184
        Width = 353
        Height = 37
        Alignment = taCenter
        AutoSize = False
        Caption = '-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -32
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label4: TLabel
        Left = 24
        Top = 272
        Width = 112
        Height = 14
        Caption = 'Problems Remaining:'
      end
      object RemainingLabel: TLabel
        Left = 160
        Top = 272
        Width = 20
        Height = 16
        Caption = '----'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object AllDoneLabel: TLabel
        Left = 304
        Top = 256
        Width = 263
        Height = 72
        Caption = 'All Done!'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -64
        Font.Name = 'Academy Engraved LET'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object AnswerEdit: TEdit
        Left = 392
        Top = 34
        Width = 145
        Height = 80
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -64
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object CheckButton: TButton
        Left = 576
        Top = 66
        Width = 75
        Height = 25
        Caption = 'Check'
        Default = True
        TabOrder = 1
        OnClick = CheckButtonClick
      end
      object StartOverButton: TButton
        Left = 0
        Top = 0
        Width = 100
        Height = 25
        Caption = '<< Start Over'
        TabOrder = 2
        OnClick = StartOverButtonClick
      end
    end
  end
  object CountdownTimer: TTimer
    Enabled = False
    OnTimer = CountdownTimerTimer
    Left = 176
  end
  object MessageTimer: TTimer
    Enabled = False
    OnTimer = MessageTimerTimer
    Left = 224
  end
  object XPManifest1: TXPManifest
    Left = 288
  end
end
