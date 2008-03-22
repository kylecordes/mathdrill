program MathDrill;

uses
  Forms,
  uMain in 'uMain.pas' {MathFlashCardForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Math Drill';
  Application.CreateForm(TMathFlashCardForm, MathFlashCardForm);
  Application.Run;
end.

