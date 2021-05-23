unit USplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFSplash = class(TForm)
    Tempo: TTimer;
    Progresso: TProgressBar;
    procedure FormActivate(Sender: TObject);
    procedure TempoTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSplash: TFSplash;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses ULogin;
{$R *.iPhone55in.fmx IOS}

procedure TFSplash.FormActivate(Sender: TObject);
begin
          Tempo.Enabled := true;
end;

procedure TFSplash.TempoTimer(Sender: TObject);
begin
      If Progresso.Value = 100 then
        Begin
          Tempo.Enabled := False;
          FSplash.Hide;
          FLogin.Show;
          FSplash.ReleaseForm;
        End;

      // Vai contando
      Progresso.Value := Progresso.Value + 1;
end;

end.