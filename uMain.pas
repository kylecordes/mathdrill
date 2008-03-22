unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

const
  WM_AFTER = WM_USER + 435;

type
  TProblem = class
    Operation: string;
    Val1, Val2: integer;
    Answer: integer;
    function Text: string;
  end;

  TMathFlashCardForm = class(TForm)
    CountdownTimer: TTimer;
    MessageTimer: TTimer;
    MainPC: TPageControl;
    SetupSheet: TTabSheet;
    RunSheet: TTabSheet;
    Bevel2: TBevel;
    Val1Label: TLabel;
    RightLabel: TLabel;
    OopsLabel: TLabel;
    TimeLabel: TLabel;
    SorryLabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GoodJobLabel: TLabel;
    AnswerLabel: TLabel;
    Label4: TLabel;
    RemainingLabel: TLabel;
    AllDoneLabel: TLabel;
    AnswerEdit: TEdit;
    CheckButton: TButton;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    IncludeNegativeInputs: TCheckBox;
    IncludeNegativeResults: TCheckBox;
    Panel1: TPanel;
    Label10: TLabel;
    ProblemCountLabel: TLabel;
    IncludeAddition: TCheckBox;
    IncludeSubtraction: TCheckBox;
    IncludeMultiplication: TCheckBox;
    IncludeDivision: TCheckBox;
    GoButton: TButton;
    MaxInputEdit: TEdit;
    MinInputEdit: TEdit;
    StartOverButton: TButton;
    Label6: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CountdownTimerTimer(Sender: TObject);
    procedure CheckButtonClick(Sender: TObject);
    procedure MessageTimerTimer(Sender: TObject);
    procedure GoButtonClick(Sender: TObject);
    procedure IncludeAdditionClick(Sender: TObject);
    procedure IncludeNegativeInputsClick(Sender: TObject);
    procedure IncludeNegativeResultsClick(Sender: TObject);
    procedure MinInputEditChange(Sender: TObject);
    procedure MaxInputEditChange(Sender: TObject);
    procedure StartOverButtonClick(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure UrlLabelClick(Sender: TObject);
    procedure OnAfterLoad(var Mes: TMessage); message WM_AFTER;
  private
    Problems: TList;
    Right, Oops: integer;
    Seconds: integer;
    CurrentProblem: TProblem;
    MinInput, MaxInput: Integer;
    procedure NextProblem;
    procedure MakeProblems;
    procedure ShowSeconds;
    procedure GotRight;
    procedure GotWrong;
    procedure HideLabels;
    procedure MakeProblemsForPair(const A, B: Integer);
  public

  end;

var
  MathFlashCardForm: TMathFlashCardForm;

implementation

{$R *.dfm}

procedure TMathFlashCardForm.FormCreate(Sender: TObject);
begin
  Randomize;
  RunSheet.TabVisible := False;
  SetupSheet.TabVisible := False;
  MainPC.ActivePageIndex := 0;
  Problems := TList.Create;
  MakeProblems;
  PostMessage(Handle, WM_AFTER, 0, 0);
end;

procedure TMathFlashCardForm.FormDestroy(Sender: TObject);
begin
  Problems.Free;
end;

procedure TMathFlashCardForm.NextProblem;
var
  X: integer;
begin
  MessageTimer.Enabled := False;
  MessageTimer.Enabled := True;

  RemainingLabel.Caption := IntToStr(Problems.Count);

  if Problems.Count = 0 then begin
    AllDoneLabel.Visible := True;
    CountdownTimer.Enabled := False;
    CheckButton.Enabled := False;
    AnswerEdit.Enabled := False;
    Exit;
  end;

  X := Random(Problems.Count);
  CurrentProblem := TProblem(Problems.Items[X]);

  Val1Label.Caption := CurrentProblem.Text;
  AnswerEdit.Text := '';
  AnswerEdit.SetFocus;
end;

procedure TMathFlashCardForm.OnAfterLoad(var Mes: TMessage);
begin
  MinInputEdit.SetFocus;
end;

procedure TMathFlashCardForm.MakeProblems;
var
  A, B: integer;
begin
  MinInput := StrToInt(MinInputEdit.Text);
  MaxInput := StrToInt(MaxInputEdit.Text);

  if MinInput>1000 then
    MinInput := 1000;
  if MaxInput>1000 then
    MaxInput := 1000;

  if MaxInput<MinInput then
    MaxInput := MinInput;

  Problems.Clear;
  for A := MinInput to MaxInput do
    for B := A to MaxInput do begin
      MakeProblemsForPair(A, B);

      if IncludeNegativeInputs.Checked and (A>0) and (B>0) then begin
        MakeProblemsForPair(A, -B);
        MakeProblemsForPair(-A, B);
        MakeProblemsForPair(-A, -B);
      end;
    end;

  ProblemCountLabel.Caption := IntToStr(Problems.Count);
end;

procedure TMathFlashCardForm.MakeProblemsForPair(const A, B: Integer);
var
  P: TProblem;

  procedure AddProblem;
  begin
   if (P.Answer >= 0) or IncludeNegativeResults.Checked then
     Problems.Add(P)
   else
     FreeAndNil(P);
  end;
begin
  if IncludeAddition.Checked then begin
    P := TProblem.Create;
    P.Val1 := A;
    P.Val2 := B;
    P.Operation := '+';
    P.Answer := A + B;
    AddProblem;
  end;
  if IncludeSubtraction.Checked then begin
    P := TProblem.Create;
    P.Operation := '-';
    P.Val1 := A;
    P.Val2 := B;
    P.Answer := A - B;
    AddProblem;
  end;
  if IncludeMultiplication.Checked then begin
    P := TProblem.Create;
    P.Val1 := A;
    P.Val2 := B;
    P.Operation := 'x';
    P.Answer := A * B;
    AddProblem;
  end;
  if IncludeDivision.Checked then begin
    if A > 0 then begin
      P := TProblem.Create;
      P.Val1 := A * B;
      P.Val2 := A;
      P.Operation := '/';
      P.Answer := B;
      AddProblem;
    end;
  end;
end;

procedure TMathFlashCardForm.MaxInputEditChange(Sender: TObject);
begin
  MakeProblems;
end;

procedure TMathFlashCardForm.CountdownTimerTimer(Sender: TObject);
begin
  Seconds := Seconds + 1;
  ShowSeconds;
end;

procedure TMathFlashCardForm.ShowSeconds;
begin
  TimeLabel.Caption := FormatDateTime('nn:ss', Seconds / 24.0 / 3600.0)
end;

procedure TMathFlashCardForm.StartOverButtonClick(Sender: TObject);
begin
  MainPc.ActivePageIndex := 0;
end;

procedure TMathFlashCardForm.CheckButtonClick(Sender: TObject);
var
  A: integer;
begin
  A := StrToIntDef(AnswerEdit.Text, -99999);
  if A = CurrentProblem.Answer then begin
    GotRight;
  end else begin
    GotWrong;
  end;
end;

procedure TMathFlashCardForm.GoButtonClick(Sender: TObject);
begin
  MainPC.ActivePageIndex := 1;

  Oops := 0;
  Right := 0;
  OopsLabel.Caption := '0';
  RightLabel.Caption := '0';
  AllDoneLabel.Visible := False;
  CountdownTimer.Enabled := True;
  CheckButton.Enabled := True;
  AnswerEdit.Enabled := True;

  Seconds := 0;
  ShowSeconds;
  MakeProblems;
  NextProblem;
end;

procedure TMathFlashCardForm.GotRight;
begin
  Inc(Right);
  RightLabel.Caption := IntToStr(Right);
  HideLabels;

  GoodJobLabel.Visible := True;
  Problems.Remove(CurrentProblem);

  NextProblem;
end;

procedure TMathFlashCardForm.GotWrong;
begin
  Inc(Oops);
  OopsLabel.Caption := IntToStr(Oops);
  HideLabels;

  SorryLabel.Visible := True;
  AnswerLabel.Caption := CurrentProblem.Text + ' ' +
    IntToStr(CurrentProblem.Answer);
  AnswerLabel.Visible := True;

  NextProblem;
end;

procedure TMathFlashCardForm.MessageTimerTimer(Sender: TObject);
begin
  MessageTimer.Enabled := False;
  HideLabels;
end;

procedure TMathFlashCardForm.MinInputEditChange(Sender: TObject);
begin
  MakeProblems;
end;

procedure TMathFlashCardForm.HideLabels;
begin
  GoodJobLabel.Visible := False;
  sorryLabel.Visible := False;
  AnswerLabel.Visible := False;
end;

procedure TMathFlashCardForm.IncludeAdditionClick(Sender: TObject);
begin
  if not IncludeAddition.Checked and not IncludeSubtraction.Checked
    and not IncludeMultiplication.Checked and not IncludeDivision.Checked then
    IncludeAddition.Checked := True;
  MakeProblems;
end;

procedure TMathFlashCardForm.IncludeNegativeInputsClick(Sender: TObject);
begin
  MakeProblems;
end;

procedure TMathFlashCardForm.IncludeNegativeResultsClick(Sender: TObject);
begin
  MakeProblems;
end;

procedure TMathFlashCardForm.UrlLabelClick(Sender: TObject);
begin
  // launch the site?
end;

procedure TMathFlashCardForm.Label6Click(Sender: TObject);
begin

end;

{ TProblem }

function TProblem.Text: string;
begin
  Result := IntToStr(Val1) + ' ' + Operation + ' ' + IntToStr(Val2) + ' =';
end;

end.

