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
    SQLAluno: TUniSQL;
    queryAluno: TUniQuery;
    dsAluno: TUniDataSource;
    UniStoredProc2: TUniStoredProc;
    UniSQL2: TUniSQL;
    UniDataSource2: TUniDataSource;
    queryProfessor: TUniQuery;
    UniQuery1: TUniQuery;
    UniDataSource3: TUniDataSource;
    UniSQL1: TUniSQL;
    UniStoredProc3: TUniStoredProc;
    UniStoredProc4: TUniStoredProc;
    UniSQL3: TUniSQL;
    UniDataSource4: TUniDataSource;
    UniQuery3: TUniQuery;
    queryGeral: TUniQuery;
    queryAlunoMATRICULA_ALUNO: TIntegerField;
    queryAlunoID_TURMA: TIntegerField;
    queryAlunoNOME_ALUNO: TStringField;
    queryAlunoLIDER_ALUNO: TStringField;
    queryAlunoSEXO_ALUNO: TStringField;
    queryAlunoSTATUS_ALUNO: TStringField;
    queryAlunoSENHA_ALUNO: TStringField;
    queryAlunoEMAIL_ALUNO: TStringField;
    queryProfessorMATRICULA_PROFESSOR: TIntegerField;
    queryProfessorNOME_PROFESSOR: TStringField;
    queryProfessorCARGAHORA_PROFESSOR: TTimeField;
    queryProfessorSEXO_PROFESSOR: TStringField;
    queryProfessorSENHA_PROFESSOR: TStringField;
    queryProfessorEMAIL_PROFESSOR: TStringField;
    queryProfessorFLAG_PROFESSOR: TStringField;
    queryProfessorCPF_PROFESSOR: TStringField;
    queryAlunoNASC_ALUNO: TDateField;
    queryAlunoCPF_ALUNO: TStringField;
    queryGeralnow: TDateTimeField;
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

end.
