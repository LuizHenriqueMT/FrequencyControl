object Modulo: TModulo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 519
  Width = 585
  object Conexao: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'frequencycontrol'
    Username = 'luiztiscoski'
    Server = '187.107.106.99'
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 40
    EncryptedPassword = 
      'A8FF96FF93FF93FF96FF9EFF92FF98FF9EFF8BFF90FFCEFFCFFFCFFFCEFFDCFF' +
      'C8FFCEFF97FF9BFF'
  end
  object ProviderAluno: TMySQLUniProvider
    Left = 264
    Top = 240
  end
  object traAluno: TUniTransaction
    DefaultConnection = Conexao
    Left = 193
    Top = 240
  end
  object spAluno: TUniStoredProc
    Connection = Conexao
    Left = 120
    Top = 240
  end
  object queryAluno: TUniQuery
    Connection = Conexao
    SQL.Strings = (
      'Select * from ALUNO'
      '')
    Left = 40
    Top = 104
    object queryAlunoMATRICULA_ALUNO: TIntegerField
      FieldName = 'MATRICULA_ALUNO'
      Required = True
    end
    object queryAlunoID_TURMA: TIntegerField
      FieldName = 'ID_TURMA'
    end
    object queryAlunoNOME_ALUNO: TStringField
      FieldName = 'NOME_ALUNO'
      Size = 45
    end
    object queryAlunoNASC_ALUNO: TDateField
      FieldName = 'NASC_ALUNO'
      Required = True
    end
    object queryAlunoCPF_ALUNO: TStringField
      FieldName = 'CPF_ALUNO'
      FixedChar = True
      Size = 11
    end
    object queryAlunoLIDER_ALUNO: TStringField
      FieldName = 'LIDER_ALUNO'
      Size = 5
    end
    object queryAlunoSEXO_ALUNO: TStringField
      FieldName = 'SEXO_ALUNO'
      FixedChar = True
      Size = 1
    end
    object queryAlunoSTATUS_ALUNO: TStringField
      FieldName = 'STATUS_ALUNO'
      FixedChar = True
      Size = 3
    end
    object queryAlunoSENHA_ALUNO: TStringField
      FieldName = 'SENHA_ALUNO'
      Size = 8
    end
    object queryAlunoEMAIL_ALUNO: TStringField
      FieldName = 'EMAIL_ALUNO'
      Size = 100
    end
  end
  object dsAluno: TUniDataSource
    DataSet = queryAluno
    Left = 40
    Top = 171
  end
  object UniDataSource2: TUniDataSource
    Left = 120
    Top = 171
  end
  object queryProfessor: TUniQuery
    Connection = Conexao
    SQL.Strings = (
      'Select *'
      'From PROFESSOR')
    Left = 120
    Top = 104
    object queryProfessorMATRICULA_PROFESSOR: TIntegerField
      FieldName = 'MATRICULA_PROFESSOR'
      Required = True
    end
    object queryProfessorNOME_PROFESSOR: TStringField
      FieldName = 'NOME_PROFESSOR'
      Size = 45
    end
    object queryProfessorCPF_PROFESSOR: TStringField
      FieldName = 'CPF_PROFESSOR'
      FixedChar = True
      Size = 11
    end
    object queryProfessorCARGAHORA_PROFESSOR: TTimeField
      FieldName = 'CARGAHORA_PROFESSOR'
    end
    object queryProfessorSEXO_PROFESSOR: TStringField
      FieldName = 'SEXO_PROFESSOR'
      FixedChar = True
      Size = 1
    end
    object queryProfessorSENHA_PROFESSOR: TStringField
      FieldName = 'SENHA_PROFESSOR'
      Size = 10
    end
    object queryProfessorEMAIL_PROFESSOR: TStringField
      FieldName = 'EMAIL_PROFESSOR'
      Size = 100
    end
    object queryProfessorFLAG_PROFESSOR: TStringField
      FieldName = 'FLAG_PROFESSOR'
      FixedChar = True
      Size = 1
    end
  end
  object queryNow: TUniQuery
    Connection = Conexao
    SQL.Strings = (
      ''
      'Select now();')
    Left = 192
    Top = 312
    object queryNownow: TDateTimeField
      FieldName = 'now()'
      ReadOnly = True
      Required = True
    end
  end
  object SQLAluno: TUniSQL
    Connection = Conexao
    Left = 40
    Top = 240
  end
  object queryASSOCPD: TUniQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT'
      '  a.*,'
      '  p.MATRICULA_PROFESSOR,'
      '  p.NOME_PROFESSOR,'
      '  d.ID_MATERIA,'
      '  d.NOME_DISCIPLINA'
      'FROM'
      '  AULA a'
      
        '    INNER JOIN ASSOCIACAO_PROFESSOR_DISCIPLINA assoc ON (assoc.I' +
        'D_ASSOCPD = a.ID_ASSOCPD)'
      
        '    INNER JOIN PROFESSOR p ON (p.MATRICULA_PROFESSOR = assoc.MAT' +
        'RICULA_PROFESSOR)'
      
        '    INNER JOIN DISCIPLINAS d ON (d.ID_MATERIA = assoc.ID_MATERIA' +
        ')'
      'WHERE '
      'DIASEMANA_AULA = :pSemana AND'
      'PERIODO_AULA = :pPeriodo AND'
      'ID_TURMA = :pTurma AND'
      'HORARIO_AULA = :pHorario')
    Left = 40
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pSemana'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'pPeriodo'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'pTurma'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'pHorario'
        Value = nil
      end>
    object queryASSOCPDID_AULA: TIntegerField
      FieldName = 'ID_AULA'
      Required = True
    end
    object queryASSOCPDID_ASSOCPD: TIntegerField
      FieldName = 'ID_ASSOCPD'
    end
    object queryASSOCPDID_TURMA: TIntegerField
      FieldName = 'ID_TURMA'
    end
    object queryASSOCPDPERIODO_AULA: TStringField
      FieldName = 'PERIODO_AULA'
      FixedChar = True
      Size = 1
    end
    object queryASSOCPDAULAORDINAL_AULA: TStringField
      FieldName = 'AULAORDINAL_AULA'
      FixedChar = True
      Size = 1
    end
    object queryASSOCPDHORARIO_AULA: TTimeField
      FieldName = 'HORARIO_AULA'
    end
    object queryASSOCPDDIASEMANA_AULA: TStringField
      FieldName = 'DIASEMANA_AULA'
      FixedChar = True
      Size = 3
    end
    object queryASSOCPDMATRICULA_PROFESSOR: TIntegerField
      FieldName = 'MATRICULA_PROFESSOR'
      ReadOnly = True
      Required = True
    end
    object queryASSOCPDNOME_PROFESSOR: TStringField
      FieldName = 'NOME_PROFESSOR'
      ReadOnly = True
      Size = 45
    end
    object queryASSOCPDID_MATERIA: TIntegerField
      FieldName = 'ID_MATERIA'
      ReadOnly = True
      Required = True
    end
    object queryASSOCPDNOME_DISCIPLINA: TStringField
      FieldName = 'NOME_DISCIPLINA'
      ReadOnly = True
      Size = 35
    end
  end
  object queryAulaP: TUniQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT'
      '  a.*,'
      '  p.MATRICULA_PROFESSOR,'
      '  p.NOME_PROFESSOR,'
      '  d.ID_MATERIA,'
      '  d.NOME_DISCIPLINA'
      'FROM'
      '  AULA a'
      
        '    INNER JOIN ASSOCIACAO_PROFESSOR_DISCIPLINA assoc ON (assoc.I' +
        'D_ASSOCPD = a.ID_ASSOCPD)'
      
        '    INNER JOIN PROFESSOR p ON (p.MATRICULA_PROFESSOR = assoc.MAT' +
        'RICULA_PROFESSOR)'
      
        '    INNER JOIN DISCIPLINAS d ON (d.ID_MATERIA = assoc.ID_MATERIA' +
        ')'
      'WHERE '
      'DIASEMANA_AULA = :pSemana AND'
      'PERIODO_AULA = :pPeriodo AND'
      'HORARIO_AULA = :pHorario AND'
      'p.MATRICULA_PROFESSOR = :pProfessor')
    Left = 120
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pSemana'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'pPeriodo'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'pHorario'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'pProfessor'
        Value = nil
      end>
    object queryAulaPID_AULA: TIntegerField
      FieldName = 'ID_AULA'
      Required = True
    end
    object queryAulaPID_ASSOCPD: TIntegerField
      FieldName = 'ID_ASSOCPD'
    end
    object queryAulaPID_TURMA: TIntegerField
      FieldName = 'ID_TURMA'
    end
    object queryAulaPPERIODO_AULA: TStringField
      FieldName = 'PERIODO_AULA'
      FixedChar = True
      Size = 1
    end
    object queryAulaPAULAORDINAL_AULA: TStringField
      FieldName = 'AULAORDINAL_AULA'
      FixedChar = True
      Size = 1
    end
    object queryAulaPHORARIO_AULA: TTimeField
      FieldName = 'HORARIO_AULA'
    end
    object queryAulaPDIASEMANA_AULA: TStringField
      FieldName = 'DIASEMANA_AULA'
      FixedChar = True
      Size = 3
    end
    object queryAulaPMATRICULA_PROFESSOR: TIntegerField
      FieldName = 'MATRICULA_PROFESSOR'
      ReadOnly = True
      Required = True
    end
    object queryAulaPNOME_PROFESSOR: TStringField
      FieldName = 'NOME_PROFESSOR'
      ReadOnly = True
      Size = 45
    end
    object queryAulaPID_MATERIA: TIntegerField
      FieldName = 'ID_MATERIA'
      ReadOnly = True
      Required = True
    end
    object queryAulaPNOME_DISCIPLINA: TStringField
      FieldName = 'NOME_DISCIPLINA'
      ReadOnly = True
      Size = 35
    end
  end
  object queryTime: TUniQuery
    Connection = Conexao
    SQL.Strings = (
      'Select CurTime();')
    Left = 264
    Top = 312
    object queryTimeCurTime: TTimeField
      FieldName = 'CurTime()'
      ReadOnly = True
      Required = True
    end
  end
  object queryAula: TUniQuery
    Connection = Conexao
    SQL.Strings = (
      'Select *'
      'From AULA'
      'WHERE ID_TURMA = 353')
    Left = 193
    Top = 104
    object queryAulaID_AULA: TIntegerField
      FieldName = 'ID_AULA'
      Required = True
    end
    object queryAulaID_ASSOCPD: TIntegerField
      FieldName = 'ID_ASSOCPD'
    end
    object queryAulaID_TURMA: TIntegerField
      FieldName = 'ID_TURMA'
    end
    object queryAulaPERIODO_AULA: TStringField
      FieldName = 'PERIODO_AULA'
      FixedChar = True
      Size = 1
    end
    object queryAulaAULAORDINAL_AULA: TStringField
      FieldName = 'AULAORDINAL_AULA'
      FixedChar = True
      Size = 1
    end
    object queryAulaHORARIO_AULA: TTimeField
      FieldName = 'HORARIO_AULA'
    end
    object queryAulaDIASEMANA_AULA: TStringField
      FieldName = 'DIASEMANA_AULA'
      FixedChar = True
      Size = 3
    end
  end
  object dsAula: TUniDataSource
    DataSet = queryAula
    Left = 193
    Top = 171
  end
  object dsDP: TUniDataSource
    DataSet = queryDP
    Left = 264
    Top = 171
  end
  object dsDisciplina: TUniDataSource
    DataSet = queryDisciplina
    Left = 336
    Top = 171
  end
  object queryDP: TUniQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM ASSOCIACAO_PROFESSOR_DISCIPLINA ')
    Left = 264
    Top = 104
    object queryDPID_ASSOCPD: TIntegerField
      FieldName = 'ID_ASSOCPD'
      Required = True
    end
    object queryDPMATRICULA_PROFESSOR: TIntegerField
      FieldName = 'MATRICULA_PROFESSOR'
    end
    object queryDPID_MATERIA: TIntegerField
      FieldName = 'ID_MATERIA'
    end
    object queryDPFLAG_PROFESSORDISC: TStringField
      FieldName = 'FLAG_PROFESSORDISC'
      FixedChar = True
      Size = 1
    end
  end
  object queryDisciplina: TUniQuery
    Connection = Conexao
    SQL.Strings = (
      'Select * From DISCIPLINAS')
    Left = 336
    Top = 104
    object queryDisciplinaID_MATERIA: TIntegerField
      FieldName = 'ID_MATERIA'
      Required = True
    end
    object queryDisciplinaNOME_DISCIPLINA: TStringField
      FieldName = 'NOME_DISCIPLINA'
      Size = 35
    end
    object queryDisciplinaNUCLEO_DISCIPLINA: TStringField
      FieldName = 'NUCLEO_DISCIPLINA'
      FixedChar = True
      Size = 1
    end
    object queryDisciplinaFLAG_DISCIPLINA: TStringField
      FieldName = 'FLAG_DISCIPLINA'
      FixedChar = True
      Size = 1
    end
  end
  object queryDate: TUniQuery
    Connection = Conexao
    SQL.Strings = (
      ''
      'Select CurDate();')
    Left = 336
    Top = 312
    object queryDateCurDate: TDateField
      FieldName = 'CurDate()'
      ReadOnly = True
      Required = True
    end
  end
  object queryNull: TUniQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS '
      'WHERE TABLE_SCHEMA = '#39'FrequencyControl'#39' '
      'AND TABLE_NAME = '#39'ALUNO'#39';')
    CachedUpdates = True
    Left = 408
    Top = 312
    object queryNullMATRICULA_ALUNO: TIntegerField
      FieldName = 'MATRICULA_ALUNO'
      Required = True
    end
    object queryNullID_TURMA: TIntegerField
      FieldName = 'ID_TURMA'
      Required = True
    end
    object queryNullNOME_ALUNO: TStringField
      FieldName = 'NOME_ALUNO'
      Required = True
      Size = 45
    end
    object queryNullNASC_ALUNO: TDateField
      FieldName = 'NASC_ALUNO'
      Required = True
    end
    object queryNullCPF_ALUNO: TStringField
      FieldName = 'CPF_ALUNO'
      Required = True
      FixedChar = True
      Size = 11
    end
    object queryNullLIDER_ALUNO: TStringField
      FieldName = 'LIDER_ALUNO'
      Required = True
      Size = 5
    end
    object queryNullSEXO_ALUNO: TStringField
      FieldName = 'SEXO_ALUNO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object queryNullSTATUS_ALUNO: TStringField
      FieldName = 'STATUS_ALUNO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object queryNullSENHA_ALUNO: TStringField
      FieldName = 'SENHA_ALUNO'
      Required = True
      Size = 8
    end
    object queryNullEMAIL_ALUNO: TStringField
      FieldName = 'EMAIL_ALUNO'
      Size = 100
    end
    object queryNullCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Required = True
      Size = 64
    end
  end
end
