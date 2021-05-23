object Modulo: TModulo
  OldCreateOrder = False
  Height = 518
  Width = 551
  object Conexao: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'luiz.hmt_frequencycontrol'
    Username = 'luiz.hmt'
    Server = '189.8.214.4'
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 40
    EncryptedPassword = '93FF8AFF96FF85FFCDFFCCFFC8FFCBFFCBFFCEFFCFFFCBFF'
  end
  object ProviderAluno: TMySQLUniProvider
    Left = 40
    Top = 440
  end
  object traAluno: TUniTransaction
    DefaultConnection = Conexao
    Left = 40
    Top = 372
  end
  object spAluno: TUniStoredProc
    Connection = Conexao
    Left = 40
    Top = 305
  end
  object SQLAluno: TUniSQL
    Connection = Conexao
    Left = 40
    Top = 238
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
    object queryAlunoCPF_ALUNO: TLargeintField
      FieldName = 'CPF_ALUNO'
    end
    object queryAlunoLIDER_ALUNO: TStringField
      FieldName = 'LIDER_ALUNO'
      FixedChar = True
      Size = 1
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
  object UniStoredProc2: TUniStoredProc
    Connection = Conexao
    Left = 136
    Top = 305
  end
  object UniSQL2: TUniSQL
    Left = 136
    Top = 238
  end
  object UniDataSource2: TUniDataSource
    Left = 136
    Top = 171
  end
  object queryProfessor: TUniQuery
    Connection = Conexao
    SQL.Strings = (
      'Select *'
      'From PROFESSOR')
    Left = 136
    Top = 104
    object queryProfessorMATRICULA_PROFESSOR: TIntegerField
      FieldName = 'MATRICULA_PROFESSOR'
      Required = True
    end
    object queryProfessorNOME_PROFESSOR: TStringField
      FieldName = 'NOME_PROFESSOR'
      Size = 45
    end
    object queryProfessorCPF_PROFESSOR: TLargeintField
      FieldName = 'CPF_PROFESSOR'
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
  object UniQuery1: TUniQuery
    Left = 224
    Top = 104
  end
  object UniDataSource3: TUniDataSource
    Left = 224
    Top = 171
  end
  object UniSQL1: TUniSQL
    Left = 224
    Top = 238
  end
  object UniStoredProc3: TUniStoredProc
    Connection = Conexao
    Left = 224
    Top = 305
  end
  object UniStoredProc4: TUniStoredProc
    Left = 304
    Top = 305
  end
  object UniSQL3: TUniSQL
    Left = 304
    Top = 238
  end
  object UniDataSource4: TUniDataSource
    Left = 304
    Top = 171
  end
  object UniQuery3: TUniQuery
    Connection = Conexao
    Left = 304
    Top = 104
  end
  object queryGeral: TUniQuery
    Connection = Conexao
    SQL.Strings = (
      'Select CURDATE()')
    Left = 480
    Top = 24
    object queryGeralCURDATE: TDateField
      FieldName = 'CURDATE()'
      ReadOnly = True
      Required = True
    end
  end
end