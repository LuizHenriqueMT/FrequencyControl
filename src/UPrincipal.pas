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
    retBlackBack: TRectangle;
    RetPopUp: TRectangle;
    ShadowEffect1: TShadowEffect;
    Rectangle2: TRectangle;
    Label1: TLabel;
    Layout2: TLayout;
    layFrequencia: TLayout;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Layout4: TLayout;
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
    procedure FormActivate(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure retBlackBackClick(Sender: TObject);
    procedure lbNumeroTurma1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

uses ULogin, UModulo;

procedure TFPrincipal.Button1Click(Sender: TObject);
begin
      retBlackBack.Visible:= false;
      RetPopUp.Visible:= false;
end;

procedure TFPrincipal.Button2Click(Sender: TObject);
begin
      retBlackBack.Visible:= false;
      RetPopUp.Visible:= false;
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
      lbNomeProfessorP.Text:= (UsuarioProfessor);

      // Adiciona a data atual
      modulo.queryGeral.Close;
      modulo.queryGeral.Sql.Clear;
      modulo.queryGeral.SQL.Add('Select CURDATE()');
      modulo.queryGeral.Open;

      DataQR:= modulo.queryGeral.Fields[0].AsDateTime;
      lbDataQR.text:= (DateToStr(DataQR));

end;

procedure TFPrincipal.imgMenuClick(Sender: TObject);
begin
      mvwProfessor.Visible:= true;
end;

procedure TFPrincipal.lbNumeroTurma1Click(Sender: TObject);
begin
      retBlackBack.Visible:= true;
      RetPopUp.Visible:= true;
end;

procedure TFPrincipal.retBlackBackClick(Sender: TObject);
begin
      retBlackBack.Visible:= false;
      RetPopUp.Visible:= false;
end;

end.