unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.MultiView,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.TabControl, FMX.Effects;

type
  TFPrincipal = class(TForm)
    TabControl: TTabControl;
    tbAluno: TTabItem;
    layAluno: TLayout;
    layPerfilAluno: TLayout;
    layClientAluno: TLayout;
    bckGrndPerfilAluno: TRectangle;
    imgAluno: TCircle;
    layInfoAluno: TLayout;
    lbNomeAluno: TLabel;
    lbProfessorAluno: TLabel;
    lbDisciplinaAluno: TLabel;
    backGroundFrequencia: TRoundRect;
    FrequenciaBar: TRoundRect;
    lbFrequenciaBar: TLabel;
    layQRCode: TLayout;
    imgQRCode: TImage;
    layDiaAtual: TLayout;
    bckGrndDiaAtual: TRoundRect;
    lbDiaAtual: TLabel;
    mvwAluno: TMultiView;
    Rectangle1: TRectangle;
    Image1: TImage;
    tbProfessor: TTabItem;
    layProfessor: TLayout;
    topMenuProfessor: TRectangle;
    layMenuProfessor: TLayout;
    btnMenuProfessor: TImage;
    layCronogramaProfessor: TLayout;
    tituloCronogramaProfessor: TRectangle;
    lbCronogramaProfessor: TLabel;
    layTurmaCronogramaP: TLayout;
    layTurma1CronogramaP: TLayout;
    lbTurmaCronogramaP: TLabel;
    btnTurmaCronogramaP: TRectangle;
    lbNumeroTurma1: TLabel;
    btnOpcoesCronograma: TImage;
    mvwProfessor: TMultiView;
    RetMtvP: TRectangle;
    imgMenuPmtv: TImage;
    bckGrndAluno: TRectangle;
    bckGrndEscuro: TRectangle;
    confirmacaoTurmaIndevida: TRectangle;
    ShadowEffect1: TShadowEffect;
    layTituloTurmaIndevida: TLayout;
    layFrequencia: TLayout;
    msgConfirmacaoTurmaIndevida: TLabel;
    layAcaoConfirmacaoTurma: TLayout;
    tbChamada: TTabItem;
    retTopChamada: TRectangle;
    layMenuChamada: TLayout;
    menuChamada: TImage;
    topMenuAluno: TRectangle;
    layMenuAluno: TLayout;
    btnMenuAluno: TImage;
    mvwChamada: TMultiView;
    Image2: TImage;
    Rectangle3: TRectangle;
    layImgAluno: TLayout;
    layNomeAluno: TLayout;
    layProfessorAluno: TLayout;
    layDisciplinaAluno: TLayout;
    layPerfilProfessor: TLayout;
    layClientProfessor: TLayout;
    bckGrndPerfilProfessor: TRectangle;
    layInfoProfessor: TLayout;
    laySituacaoProfessor: TLayout;
    bckGrndSituacao: TRoundRect;
    lbSituacaoProfessor: TLabel;
    layNomeProfessor: TLayout;
    lbNomeProfessor: TLabel;
    layDisciplinaProfessor: TLayout;
    lbDisciplinaProfessor: TLabel;
    layTurmaProfessor: TLayout;
    lbTurmaProfessor: TLabel;
    layImgProfessor: TLayout;
    imgProfessor: TCircle;
    layOpcoesCronograma: TLayout;
    lbHorarioCronogramaP: TLabel;
    lbTurmaIndevida: TLabel;
    lbConfirmar: TLabel;
    lbCancelar: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure bckGrndEscuroClick(Sender: TObject);
    procedure lbNumeroTurma1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure lbConfirmarClick(Sender: TObject);
    procedure lbCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}

uses ULogin, UModulo;

procedure TFPrincipal.Button1Click(Sender: TObject);
begin
  bckGrndEscuro.Visible:= false;
  confirmacaoTurmaIndevida.Visible:= false;
end;

procedure TFPrincipal.Button2Click(Sender: TObject);
begin
  bckGrndEscuro.Visible:= false;
  confirmacaoTurmaIndevida.Visible:= false;
  TabControl.TabIndex:= 2;
end;

procedure TFPrincipal.Button3Click(Sender: TObject);
begin
  bckGrndEscuro.Visible:= false;
  confirmacaoTurmaIndevida.Visible:= false;
  TabControl.TabIndex:= 2;
end;

procedure TFPrincipal.FormActivate(Sender: TObject);
var
  UsuarioAluno, UsuarioProfessor: string;
  DataQR: TDATE;
begin

  // Adiciona nome do "ALUNO" no perfil
  //UsuarioAluno:= IntToStr(UsuarioA);
  UsuarioAluno:= (modulo.queryAluno.Fields[2].asString);
  lbNomeALuno.Text:= (UsuarioAluno);

  // Adiciona nome do "PROFESSOR" no perfil
  //UsuarioProfessor:= IntToStr(UsuarioP);
  UsuarioProfessor:= (modulo.queryProfessor.Fields[1].asString);
  lbNomeProfessor.Text:= (UsuarioProfessor);

  // Adiciona a data atual
  modulo.queryGeral.Close;
  modulo.queryGeral.Sql.Clear;
  modulo.queryGeral.SQL.Add('Select CURDATE()');
  modulo.queryGeral.Open;

  DataQR:= modulo.queryGeral.Fields[0].AsDateTime;
  lbDiaAtual.text:= (DateToStr(DataQR));

end;

procedure TFPrincipal.imgMenuClick(Sender: TObject);
begin
  mvwProfessor.Visible:= true;
end;

procedure TFPrincipal.lbCancelarClick(Sender: TObject);
begin
  bckGrndEscuro.Visible:= false;
  confirmacaoTurmaIndevida.Visible:= false;
end;

procedure TFPrincipal.lbNumeroTurma1Click(Sender: TObject);
begin
 bckGrndEscuro.Visible:= true;
 confirmacaoTurmaIndevida.Visible:= true;


end;

procedure TFPrincipal.lbConfirmarClick(Sender: TObject);
begin
  bckGrndEscuro.Visible:= false;
  confirmacaoTurmaIndevida.Visible:= false;
  TabControl.TabIndex:= 2;
end;

procedure TFPrincipal.bckGrndEscuroClick(Sender: TObject);
begin
  bckGrndEscuro.Visible:= false;
  confirmacaoTurmaIndevida.Visible:= false;
end;

end.