unit UModulo;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, Uni, MemDS, UniProvider,
  MySQLUniProvider;

type
  TModulo = class(TDataModule)
    Conexao: TUniConnection;
    ProviderAluno: TMySQLUniProvider;
    traAluno: TUniTransaction;
    spAluno: TUniStoredProc;
    queryAluno: TUniQuery;
    dsAluno: TUniDataSource;
    UniDataSource2: TUniDataSource;
    queryProfessor: TUniQuery;
    queryNow: TUniQuery;
    queryNownow: TDateTimeField;
    SQLAluno: TUniSQL;
    queryASSOCPD: TUniQuery;
    queryAulaP: TUniQuery;
    queryTime: TUniQuery;
    queryAula: TUniQuery;
    dsAula: TUniDataSource;
    dsDP: TUniDataSource;
    dsDisciplina: TUniDataSource;
    queryDP: TUniQuery;
    queryDisciplina: TUniQuery;
    queryDate: TUniQuery;
    queryDateCurDate: TDateField;
    queryNull: TUniQuery;
    queryNullMATRICULA_ALUNO: TIntegerField;
    queryNullID_TURMA: TIntegerField;
    queryNullNOME_ALUNO: TStringField;
    queryNullNASC_ALUNO: TDateField;
    queryNullCPF_ALUNO: TStringField;
    queryNullLIDER_ALUNO: TStringField;
    queryNullSEXO_ALUNO: TStringField;
    queryNullSTATUS_ALUNO: TStringField;
    queryNullSENHA_ALUNO: TStringField;
    queryNullEMAIL_ALUNO: TStringField;
    queryASSOCPDID_AULA: TIntegerField;
    queryASSOCPDID_ASSOCPD: TIntegerField;
    queryASSOCPDID_TURMA: TIntegerField;
    queryASSOCPDPERIODO_AULA: TStringField;
    queryASSOCPDAULAORDINAL_AULA: TStringField;
    queryASSOCPDHORARIO_AULA: TTimeField;
    queryASSOCPDDIASEMANA_AULA: TStringField;
    queryASSOCPDMATRICULA_PROFESSOR: TIntegerField;
    queryASSOCPDNOME_PROFESSOR: TStringField;
    queryASSOCPDID_MATERIA: TIntegerField;
    queryASSOCPDNOME_DISCIPLINA: TStringField;
    queryAulaPID_AULA: TIntegerField;
    queryAulaPID_ASSOCPD: TIntegerField;
    queryAulaPID_TURMA: TIntegerField;
    queryAulaPPERIODO_AULA: TStringField;
    queryAulaPAULAORDINAL_AULA: TStringField;
    queryAulaPHORARIO_AULA: TTimeField;
    queryAulaPDIASEMANA_AULA: TStringField;
    queryAulaPMATRICULA_PROFESSOR: TIntegerField;
    queryAulaPNOME_PROFESSOR: TStringField;
    queryAulaPID_MATERIA: TIntegerField;
    queryAulaPNOME_DISCIPLINA: TStringField;
    queryNullCOLUMN_NAME: TStringField;
    queryAlunoMATRICULA_ALUNO: TIntegerField;
    queryAlunoID_TURMA: TIntegerField;
    queryAlunoNOME_ALUNO: TStringField;
    queryAlunoNASC_ALUNO: TDateField;
    queryAlunoCPF_ALUNO: TStringField;
    queryAlunoLIDER_ALUNO: TStringField;
    queryAlunoSEXO_ALUNO: TStringField;
    queryAlunoSTATUS_ALUNO: TStringField;
    queryAlunoSENHA_ALUNO: TStringField;
    queryAlunoEMAIL_ALUNO: TStringField;
    queryProfessorMATRICULA_PROFESSOR: TIntegerField;
    queryProfessorNOME_PROFESSOR: TStringField;
    queryProfessorCPF_PROFESSOR: TStringField;
    queryProfessorCARGAHORA_PROFESSOR: TTimeField;
    queryProfessorSEXO_PROFESSOR: TStringField;
    queryProfessorSENHA_PROFESSOR: TStringField;
    queryProfessorEMAIL_PROFESSOR: TStringField;
    queryProfessorFLAG_PROFESSOR: TStringField;
    queryAulaID_AULA: TIntegerField;
    queryAulaID_ASSOCPD: TIntegerField;
    queryAulaID_TURMA: TIntegerField;
    queryAulaPERIODO_AULA: TStringField;
    queryAulaAULAORDINAL_AULA: TStringField;
    queryAulaHORARIO_AULA: TTimeField;
    queryAulaDIASEMANA_AULA: TStringField;
    queryDPID_ASSOCPD: TIntegerField;
    queryDPMATRICULA_PROFESSOR: TIntegerField;
    queryDPID_MATERIA: TIntegerField;
    queryDPFLAG_PROFESSORDISC: TStringField;
    queryDisciplinaID_MATERIA: TIntegerField;
    queryDisciplinaNOME_DISCIPLINA: TStringField;
    queryDisciplinaNUCLEO_DISCIPLINA: TStringField;
    queryDisciplinaFLAG_DISCIPLINA: TStringField;
    queryTimeCurTime: TTimeField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Modulo: TModulo;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TModulo.DataModuleCreate(Sender: TObject);
begin
  //Database connection initialization
  Conexao.Connected:= true;

  //Query database initialization
  queryNow.open;
  queryTime.Open;
  queryDate.open;
  queryAula.Open;
end;

end.
