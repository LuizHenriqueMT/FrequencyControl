/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     22/11/2020 21:26:08                          */
/*==============================================================*/


drop table if exists ALUNO;

drop table if exists ALUNO_CONTROLE;

drop table if exists ASSOCIACAO_PROFESSOR_DISCIPLINA;

drop table if exists AULA;

drop table if exists CONTROLE_DE_FREQUENCIA;

drop table if exists DISCIPLINAS;

drop table if exists ORIENTADORAE;

drop table if exists PROFESSOR;

drop table if exists TURMA;

/*==============================================================*/
/* Table: ALUNO                                                 */
/*==============================================================*/
create table ALUNO
(
   MATRICULA_ALUNO      int not null,
   ID_TURMA             int,
   NOME_ALUNO           varchar(45),
   CPF_ALUNO            bigint,
   LIDER_ALUNO          char(1),
   SEXO_ALUNO           char(1),
   STATUS_ALUNO         char(3),
   SENHA_ALUNO          varchar(8),
   EMAIL_ALUNO          varchar(100),
   primary key (MATRICULA_ALUNO)
);

alter table ALUNO comment 'Status (Ativo, Inativo, Repetente, Formado, Atestado';

/*==============================================================*/
/* Table: ALUNO_CONTROLE                                        */
/*==============================================================*/
create table ALUNO_CONTROLE
(
   ID_CONTROLEALUNO     int not null,
   MATRICULA_ALUNO      int,
   ID_CONTROLE          int,
   PRESENCA_ALUNO       char(1),
   DATAF_ALUNO          timestamp,
   primary key (ID_CONTROLEALUNO)
);

alter table ALUNO_CONTROLE comment 'Presenca_Aluno (A/P)
';

/*==============================================================*/
/* Table: ASSOCIACAO_PROFESSOR_DISCIPLINA                       */
/*==============================================================*/
create table ASSOCIACAO_PROFESSOR_DISCIPLINA
(
   ID_ASSOCPD           int not null,
   MATRICULA_PROFESSOR  int,
   ID_MATERIA           int,
   FLAG_PROFESSORDISC   char(1),
   primary key (ID_ASSOCPD)
);

/*==============================================================*/
/* Table: AULA                                                  */
/*==============================================================*/
create table AULA
(
   ID_AULA              int not null,
   ID_ASSOCPD           int,
   ID_TURMA             int,
   PERIODO_AULA         char(1),
   AULAORDINAL_AULA     char(1),
   HORARIO_AULA         time,
   DIASEMANA_AULA       char(3),
   primary key (ID_AULA)
);

/*==============================================================*/
/* Table: CONTROLE_DE_FREQUENCIA                                */
/*==============================================================*/
create table CONTROLE_DE_FREQUENCIA
(
   ID_CONTROLE          int not null,
   ID_ORIENTADORAE      int,
   ID_ASSOCPD           int,
   ID_AULA              int,
   ID_TURMA             int,
   DATA_CONTROLE        timestamp,
   OBSERVACAO_CONTROLE  varchar(200),
   FLAG_CONTROLE        char(1),
   primary key (ID_CONTROLE)
);

alter table CONTROLE_DE_FREQUENCIA comment 'Presenca ( A [ausente] P [presente] )
';

/*==============================================================*/
/* Table: DISCIPLINAS                                           */
/*==============================================================*/
create table DISCIPLINAS
(
   ID_MATERIA           int not null,
   NOME_DISCIPLINA      varchar(35),
   NUCLEO_DISCIPLINA    char(1),
   FLAG_DISCIPLINA      char(1),
   primary key (ID_MATERIA)
);

alter table DISCIPLINAS comment 'Materia Nucleo = C (Comum) or T (Tecnico)
';

/*==============================================================*/
/* Table: ORIENTADORAE                                          */
/*==============================================================*/
create table ORIENTADORAE
(
   ID_ORIENTADORAE      int not null,
   NOME_ORIENTADORAE    varchar(45),
   SEXO_ORIENTADORAE    char(1),
   CARGO_ORIENTADOR     varchar(20),
   TELEFONE_ORIENTADOR  int,
   FLAG_ORIENTADOR      char(1),
   SENHA_ORIENTADORAE   varchar(10),
   primary key (ID_ORIENTADORAE)
);

/*==============================================================*/
/* Table: PROFESSOR                                             */
/*==============================================================*/
create table PROFESSOR
(
   MATRICULA_PROFESSOR  int not null,
   NOME_PROFESSOR       varchar(45),
   CPF_PROFESSOR        bigint,
   CARGAHORA_PROFESSOR  time,
   SEXO_PROFESSOR       char(1),
   SENHA_PROFESSOR      varchar(10),
   EMAIL_PROFESSOR      varchar(100),
   FLAG_PROFESSOR       char(1),
   primary key (MATRICULA_PROFESSOR)
);

/*==============================================================*/
/* Table: TURMA                                                 */
/*==============================================================*/
create table TURMA
(
   ID_TURMA             int not null,
   SALA_TURMA           varchar(10),
   FLAG_TURMA           char(1),
   primary key (ID_TURMA)
);

alter table ALUNO add constraint FK_REL_TURMA_ALUNO foreign key (ID_TURMA)
      references TURMA (ID_TURMA) on delete restrict on update restrict;

alter table ALUNO_CONTROLE add constraint FK_REL_ALUNO_CONTROLF foreign key (ID_CONTROLE)
      references CONTROLE_DE_FREQUENCIA (ID_CONTROLE) on delete restrict on update restrict;

alter table ALUNO_CONTROLE add constraint FK_REL_PRESENCAALUNO foreign key (MATRICULA_ALUNO)
      references ALUNO (MATRICULA_ALUNO) on delete restrict on update restrict;

alter table ASSOCIACAO_PROFESSOR_DISCIPLINA add constraint FK_REL_DISCIPLINA_ASSOCPD foreign key (ID_MATERIA)
      references DISCIPLINAS (ID_MATERIA) on delete restrict on update restrict;

alter table ASSOCIACAO_PROFESSOR_DISCIPLINA add constraint FK_REL_PROFESSOR_ASSOCIACAOPD foreign key (MATRICULA_PROFESSOR)
      references PROFESSOR (MATRICULA_PROFESSOR) on delete restrict on update restrict;

alter table AULA add constraint FK_REL_AULA_PROFESSORDISCIPLINA foreign key (ID_ASSOCPD)
      references ASSOCIACAO_PROFESSOR_DISCIPLINA (ID_ASSOCPD) on delete restrict on update restrict;

alter table AULA add constraint FK_REL_TURMA_AULA foreign key (ID_TURMA)
      references TURMA (ID_TURMA) on delete restrict on update restrict;

alter table CONTROLE_DE_FREQUENCIA add constraint FK_REL_AULA_CONTROLEDEFREQUENCIA foreign key (ID_AULA)
      references AULA (ID_AULA) on delete restrict on update restrict;

alter table CONTROLE_DE_FREQUENCIA add constraint FK_REL_CONTROLEF_ORIENTADOR foreign key (ID_ORIENTADORAE)
      references ORIENTADORAE (ID_ORIENTADORAE) on delete restrict on update restrict;

alter table CONTROLE_DE_FREQUENCIA add constraint FK_REL_CONTROLE_PROFESSOR foreign key (ID_ASSOCPD)
      references ASSOCIACAO_PROFESSOR_DISCIPLINA (ID_ASSOCPD) on delete restrict on update restrict;

alter table CONTROLE_DE_FREQUENCIA add constraint FK_REL_TRUEMA_CONTROLE foreign key (ID_TURMA)
      references TURMA (ID_TURMA) on delete restrict on update restrict;

