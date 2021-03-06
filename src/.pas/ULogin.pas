unit ULogin;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.Edit,
  FMX.Layouts;

type
  TFLogin = class(TForm)
    layTelaLogin: TLayout;
    layUsuario: TLayout;
    bckGrndUsuario: TRoundRect;
    edtUsuario: TEdit;
    imgUsuario: TImage;
    imgSenha: TImage;
    imgVisualizacaoSenha: TImage;
    layAcoesLogin: TLayout;
    bckGrndEntrar: TRoundRect;
    btnEntrar: TLabel;
    btnEsqueciSenha: TLabel;
    LogoCedup: TImage;
    lbRodape: TLabel;
    StyleBook: TStyleBook;
    layLogin: TLayout;
    layLogo: TLayout;
    layImgUsuario: TLayout;
    layEntradaUsuario: TLayout;
    layEditUsuario: TLayout;
    laySenha: TLayout;
    layEntradaSenha: TLayout;
    bckGrndSenha: TRoundRect;
    layEditSenha: TLayout;
    edtSenha: TEdit;
    layImgSenha: TLayout;
    layVisualizacaoSenha: TLayout;
    btnEntradaRapida: TButton;
    procedure btnEntrarClick(Sender: TObject);
    procedure imgVisualizacaoSenhaClick(Sender: TObject);
    procedure btnEntradaRapidaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure CriarContaFirebase;
    function DoLogin: boolean;
  end;

var
  FLogin: TFLogin;

implementation

{$R *.fmx}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}

uses UModulo, UPrincipal;

procedure TFLogin.btnEntradaRapidaClick(Sender: TObject);
begin
  edtUsuario.text:= '1';
  edtSenha.text:= '123';
  btnEntrarClick(Sender);
end;

procedure TFLogin.btnEntrarClick(Sender: TObject);
var
  ConsultaUsuario1, ConsultaUsuario2: string;
begin
  with modulo do
    begin
      //Check if the "USUARIO" has not been entered
      if (edtUsuario.Text = '') then
        begin
          Showmessage ('"Usu?rio" inv?lido!');
          edtUsuario.SetFocus;
          exit
        end;

      //Check if the "SENHA" has not been entered
      if (edtSenha.Text = '') then
        begin
          ShowMessage ('"Senha" inv?lida!');
          edtSenha.SetFocus;
          exit
        end;

      //Check if the "USUARIO" and "SENHA" have been entered
      if (edtUsuario.text <> '') and (edtSenha.Text <> '') then
        begin
          //Query to fetch the login by the "PROFESSOR"
          ConsultaUsuario1:= '';
          ConsultaUsuario1:= 'SELECT * FROM PROFESSOR ' +
            'WHERE MATRICULA_PROFESSOR = ' + quotedSTR (edtUsuario.Text) +
            ' AND SENHA_PROFESSOR = ' + quotedSTR (edtSenha.Text);
          queryProfessor.close;
          queryProfessor.SQL.Clear;
          queryProfessor.SQL.Add(ConsultaUsuario1);
          queryProfessor.open;

          //Query to fetch the login by the "ALUNO"
          ConsultaUsuario2:= '';
          ConsultaUsuario2:= 'SELECT * FROM ALUNO ' +
            'WHERE MATRICULA_ALUNO = ' + quotedSTR (edtUsuario.Text) +
            ' AND SENHA_ALUNO = ' + quotedSTR (edtSenha.Text);
          queryAluno.close;
          queryAluno.SQL.Clear;
          queryAluno.SQL.Add(ConsultaUsuario2);
          queryAluno.open;

          //Check if have a registered any user
          if (queryProfessor.Fields[0].AsInteger > 0) or
            (queryAluno.Fields[0].AsInteger > 0) then
              begin
                //Check if the user found is a "PROFESSOR"
                if (queryProfessor.Fields[0].AsInteger > 0) then
                  begin
                    try
                      Application.CreateForm(TFPrincipal, FPrincipal);
                      FPrincipal.Show;
                      FPrincipal.TabControl.TabIndex:= 1;
                    finally
                      FreeAndNil(FLogin);
                    end;
                  end
                else
                  queryProfessor.SQL.Clear;

                //Check if the user found is an "ALUNO"
                if (queryAluno.Fields[0].AsInteger > 0) then
                  begin
                    try
                      Application.CreateForm(TFPrincipal, FPrincipal);
                      FPrincipal.Show;
                      FPrincipal.TabControl.TabIndex:= 0;

                    finally
                      FreeAndNil(FLogin);
                    end;
                  end
                else
                  queryAluno.SQL.Clear;
                  exit
              end
          else
            begin
              showmessage ('"Usu?rio" ou "Senha" Incorreta!');
              edtUsuario.Text:= '';
              edtSenha.Text:= '';
              edtUsuario.SetFocus;
              exit
            end;
        end;
    end;
end;

procedure TFLogin.CriarContaFirebase;
begin

end;

function TFLogin.DoLogin: boolean;
begin

end;

procedure TFLogin.FormActivate(Sender: TObject);
begin
  //Server connection error
  if modulo.conexao.Connected = false then
    begin
      showmessage ('O servidor est? offline. Por favor entrar em ' +
                   'contato com luizh.mtiscoski@hotmail.com');
    end;
end;

procedure TFLogin.imgVisualizacaoSenhaClick(Sender: TObject);
begin
  //View password
  if (edtSenha.Password = true) then
   edtSenha.Password:= false
  else
  if (edtSenha.Password = false) then
    edtsenha.Password:= true;
end;

end.


