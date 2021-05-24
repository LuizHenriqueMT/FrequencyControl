unit ULogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts;

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
    procedure btnEntrarClick(Sender: TObject);
    procedure imgVisualizacaoSenhaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    //Usuario: integer;
  end;

var
  FLogin: TFLogin;
  usuarioP, usuarioA: integer;

implementation

{$R *.fmx}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}

uses UModulo, UPrincipal;

procedure TFLogin.btnEntrarClick(Sender: TObject);
var
      ConsultaUsuario1, ConsultaUsuario2: string;
begin
      Application.CreateForm(TFPrincipal, FPrincipal);
      // Verifica se o "USUARIO" est� preenchido
      if (edtUsuario.Text = '') then
        begin
          Showmessage ('"Usu�rio" inv�lido!');
          edtUsuario.SetFocus;
          exit
        end;

      // Verifica se a "SENHA" est� preenchida
      if (edtSenha.Text = '') then
        begin
          ShowMessage ('"Senha" inv�lida!');
          edtSenha.SetFocus;
          exit
        end;

      // Verifica se o "USUARIO" e "SENHA" est�o preenchidos
      if (edtUsuario.text <> '') and (edtSenha.Text <> '') then
        begin
          // Texto query para a tabela "PROFESSOR"
          ConsultaUsuario1:= '';
          ConsultaUsuario1:= 'SELECT * FROM PROFESSOR ' +
            'WHERE MATRICULA_PROFESSOR = ' + quotedSTR (edtUsuario.Text) +
            ' AND SENHA_PROFESSOR = ' + quotedSTR (edtSenha.Text);

          modulo.queryProfessor.close;
          modulo.queryProfessor.SQL.Clear;
          modulo.queryProfessor.SQL.Add(ConsultaUsuario1);
          modulo.queryProfessor.open;

          // Texto query para a tabela "ALUNO"
          ConsultaUsuario2:= '';
          ConsultaUsuario2:= 'SELECT * FROM ALUNO ' +
            'WHERE MATRICULA_ALUNO = ' + quotedSTR (edtUsuario.Text) +
            ' AND SENHA_ALUNO = ' + quotedSTR (edtSenha.Text);

          modulo.queryAluno.close;
          modulo.queryAluno.SQL.Clear;
          modulo.queryAluno.SQL.Add(ConsultaUsuario2);
          modulo.queryAluno.open;
          //-------------------------Espa�amento----------------------------//

          // Verifica se existe algum dado de "USUARIOS"
          if (modulo.queryProfessor.Fields[0].AsInteger > 0) or
            (modulo.queryAluno.Fields[0].AsInteger > 0) then
              begin
                // Verifica se o usuario encontrado � um "PROFESSOR"
                if (modulo.queryProfessor.Fields[0].AsInteger > 0) then
                  begin
                    try
                      //Application.CreateForm(TFPrincipal, FPrincipal);
                      //UsuarioP:= modulo.queryProfessor.Fields[0].Value;
                      FPrincipal.Show;
                      FPrincipal.TabControl.TabIndex:= 1;
                    finally
                      //FreeAndNil(FPrincipal);
                      //UsuarioP:= modulo.queryProfessor.Fields[0].Value;
                    end;
                    //FPrincipal.TabControl.TabIndex:= 1;
                    //UsuarioP:= modulo.queryProfessor.Fields[0].Value;
                  end
                else
                  modulo.queryProfessor.SQL.Clear;

                // Verifica se o usuario encontrado � um "ALUNO"
                if (modulo.queryAluno.Fields[0].AsInteger > 0) then
                  begin
                    try
                      //Application.CreateForm(TFPrincipal, FPrincipal);
                      //UsuarioA:= modulo.queryAluno.Fields[0].Value;
                      FPrincipal.Show;
                      FPrincipal.TabControl.TabIndex:= 0;
                    finally
                      //FreeAndNil(FPrincipal);
                    end;
                  end
                else
                  modulo.queryAluno.SQL.Clear;
                  exit
              end
          else
            begin
              showmessage ('"Usu�rio" ou "Senha" Incorreta!');
              edtUsuario.Text:= '';
              edtSenha.Text:= '';
              edtUsuario.SetFocus;
              exit
            end;
        end;

end;

procedure TFLogin.imgVisualizacaoSenhaClick(Sender: TObject);
begin
      if (edtSenha.Password = true) then
        edtSenha.Password:= false
      else
      if (edtSenha.Password = false) then
        edtsenha.Password:= true;
end;

end.

