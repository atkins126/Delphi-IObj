object frmIObjTestMain: TfrmIObjTestMain
  Left = 0
  Top = 0
  Caption = 'IObj Test Main'
  ClientHeight = 582
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 21
  object FlowPanel1: TFlowPanel
    Left = 0
    Top = 0
    Width = 220
    Height = 582
    Align = alLeft
    FlowStyle = fsTopBottomLeftRight
    ShowCaption = False
    TabOrder = 0
    ExplicitHeight = 583
    object btnHome: TButton
      AlignWithMargins = True
      Left = 11
      Top = 6
      Width = 200
      Height = 25
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      Caption = 'Home'
      TabOrder = 0
      OnClick = btnHomeClick
    end
    object btnIObj: TButton
      AlignWithMargins = True
      Left = 11
      Top = 41
      Width = 200
      Height = 25
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      Caption = 'IObj'
      TabOrder = 1
      OnClick = btnIObjClick
    end
    object btnLocalVariables: TButton
      AlignWithMargins = True
      Left = 11
      Top = 76
      Width = 200
      Height = 25
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      Caption = 'Local Variables'
      TabOrder = 2
      OnClick = btnLocalVariablesClick
    end
    object btnMyClass: TButton
      AlignWithMargins = True
      Left = 11
      Top = 111
      Width = 200
      Height = 25
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      Caption = 'Variables Inside a Class'
      TabOrder = 3
      OnClick = btnMyClassClick
    end
    object btnLoopVariables: TButton
      AlignWithMargins = True
      Left = 11
      Top = 146
      Width = 200
      Height = 25
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      Caption = 'Loop variables'
      TabOrder = 4
      OnClick = btnLoopVariablesClick
    end
    object btnObjectAsProperty: TButton
      AlignWithMargins = True
      Left = 11
      Top = 181
      Width = 200
      Height = 25
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      Caption = 'Object Properties'
      TabOrder = 5
      OnClick = btnObjectAsPropertyClick
    end
    object cbLeaked: TCheckBox
      AlignWithMargins = True
      Left = 4
      Top = 261
      Width = 200
      Height = 17
      Margins.Top = 50
      Align = alTop
      Caption = 'Leaked executed'
      TabOrder = 6
    end
    object cbStandardFix: TCheckBox
      AlignWithMargins = True
      Left = 4
      Top = 291
      Width = 200
      Height = 17
      Margins.Top = 10
      Align = alTop
      Caption = 'Standard Fix executed'
      TabOrder = 7
    end
    object cbIObjFix: TCheckBox
      AlignWithMargins = True
      Left = 4
      Top = 321
      Width = 200
      Height = 17
      Margins.Top = 10
      Align = alTop
      Caption = 'IObj Fix executed'
      TabOrder = 8
    end
    object cbLineNumbers: TCheckBox
      AlignWithMargins = True
      Left = 4
      Top = 391
      Width = 200
      Height = 17
      Margins.Top = 50
      Align = alTop
      Caption = 'Show Line Numbers'
      TabOrder = 9
      OnClick = cbLineNumbersClick
    end
  end
  object CardPanel1: TCardPanel
    Left = 220
    Top = 0
    Width = 553
    Height = 582
    Align = alClient
    ActiveCard = CardCode
    Caption = 'CardPanel1'
    TabOrder = 1
    ExplicitLeft = 185
    ExplicitWidth = 588
    object CardCode: TCard
      Left = 1
      Top = 1
      Width = 555
      Height = 581
      CardIndex = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 586
      ExplicitHeight = 580
      object pgCode: TPageControl
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 545
        Height = 571
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ActivePage = tbCodeLeaked
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 580
        object tbCodeLeaked: TTabSheet
          Caption = 'Leaked'
          DesignSize = (
            533
            534)
          object memoLeaked: TMemo
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 527
            Height = 486
            Margins.Bottom = 45
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            ScrollBars = ssBoth
            TabOrder = 0
            ExplicitWidth = 562
            ExplicitHeight = 492
          end
          object btnLeaked: TButton
            Left = 3
            Top = 506
            Width = 150
            Height = 25
            Anchors = [akLeft, akBottom]
            Caption = 'Execute'
            TabOrder = 1
            ExplicitTop = 512
          end
        end
        object tbCodeStandard: TTabSheet
          Caption = 'Standard Fix'
          ImageIndex = 1
          DesignSize = (
            533
            534)
          object memoStandardFix: TMemo
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 527
            Height = 486
            Margins.Bottom = 45
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            ScrollBars = ssBoth
            TabOrder = 0
            ExplicitWidth = 566
            ExplicitHeight = 487
          end
          object btnStandardFix: TButton
            Left = 3
            Top = 501
            Width = 150
            Height = 25
            Anchors = [akLeft, akBottom]
            Caption = 'Execute'
            TabOrder = 1
            ExplicitTop = 502
          end
        end
        object tbCodeIObj: TTabSheet
          Caption = 'IObj Fix'
          ImageIndex = 2
          DesignSize = (
            533
            534)
          object btnIObjFix: TButton
            Left = 3
            Top = 501
            Width = 150
            Height = 25
            Anchors = [akLeft, akBottom]
            Caption = 'Execute'
            TabOrder = 0
            ExplicitTop = 502
          end
          object memoIObjFix: TMemo
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 527
            Height = 486
            Margins.Bottom = 45
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            ScrollBars = ssBoth
            TabOrder = 1
            ExplicitWidth = 566
            ExplicitHeight = 487
          end
        end
      end
    end
    object CardIObj: TCard
      Left = 1
      Top = 1
      Width = 551
      Height = 580
      Caption = 'CardIObj'
      CardIndex = 1
      TabOrder = 1
      ExplicitWidth = 590
      ExplicitHeight = 581
      object memoIObj: TMemo
        Left = 0
        Top = 0
        Width = 555
        Height = 581
        Margins.Bottom = 45
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
        ExplicitWidth = 590
      end
    end
    object CardHome: TCard
      Left = 1
      Top = 1
      Width = 551
      Height = 580
      Caption = 'CardHome'
      CardIndex = 2
      TabOrder = 2
      ExplicitWidth = 590
      ExplicitHeight = 581
      object Label1: TLabel
        Left = 48
        Top = 24
        Width = 90
        Height = 21
        Caption = 'uses LN.IObj;'
      end
      object Label2: TLabel
        Left = 48
        Top = 95
        Width = 313
        Height = 21
        Caption = 'var myObj := TIObj.Create(TMyObject.create);'
      end
      object Label3: TLabel
        Left = 48
        Top = 120
        Width = 84
        Height = 21
        Caption = 'myObj.Obj...'
      end
      object Label4: TLabel
        Left = 48
        Top = 226
        Width = 295
        Height = 21
        Caption = 'No need for destructor code to free myObj'
      end
      object Label5: TLabel
        Left = 48
        Top = 250
        Width = 293
        Height = 21
        Caption = 'No need for try finally block to free myObj'
      end
    end
  end
end
