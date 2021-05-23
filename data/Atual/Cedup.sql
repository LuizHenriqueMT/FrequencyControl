/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     18/11/2020 11:57:21                          */
/*==============================================================*/


drop table if exists ALUNO;

drop table if exists ALUNO_CONTROLE;

drop table if exists ASSOCIACAO_PROFESSOR_DISCIPLINA;

drop table if exists AULA;

drop table if exists CONTROLE_DE_FREQUENCIA;

drop table if exists DISCIPLINAS;

drop table if exists ORIENTACAO_CONTROLE;

drop table if exists ORIENTADORAE;

drop table if exists PROFESSOR;

drop table if exists REL_ALUNO_CONTROLEF;

drop table if exists REL_ALUNO_CONTROLF;

drop table if exists REL_AULA_CONTROLEDEFREQUENCIA;

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
   PRESENCA_ALUNO       char(1),
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
   ID_TURMA             int,
   ID_ASSOCPD           int,
   PERIODO_AULA         char(1),
   AULAORDINAL_AULA     char(1),
   HORARIO_AULA         time,
   primary key (ID_AULA)
);

/*==============================================================*/
/* Table: CONTROLE_DE_FREQUENCIA                                */
/*==============================================================*/
create table CONTROLE_DE_FREQUENCIA
(
   ID_CONTROLE          int not null,
   ID_ASSOCPD           int,
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
/* Table: ORIENTACAO_CONTROLE                                   */
/*==============================================================*/
create table ORIENTACAO_CONTROLE
(
   ID_ORIENTACAOC       int not null,
   ID_ORIENTADORAE      int,
   ID_CONTROLEALUNO     int,
   DATA_ORIENTACAOC     timestamp,
   OBSERVACAO_ORIENTACAOC varchar(200),
   FLAG_ORIENTACAOC     char(1),
   primary key (ID_ORIENTACAOC)
);

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
/* Table: REL_ALUNO_CONTROLEF                                   */
/*==============================================================*/
create table REL_ALUNO_CONTROLEF
(
   MATRICULA_ALUNO      int not null,
   ID_CONTROLE          int not null,
   primary key (MATRICULA_ALUNO, ID_CONTROLE)
);

/*==============================================================*/
/* Table: REL_ALUNO_CONTROLF                                    */
/*==============================================================*/
create table REL_ALUNO_CONTROLF
(
   ID_CONTROLE          int not null,
   ID_CONTROLEALUNO     int not null,
   primary key (ID_CONTROLE, ID_CONTROLEALUNO)
);

/*==============================================================*/
/* Table: REL_AULA_CONTROLEDEFREQUENCIA                         */
/*==============================================================*/
create table REL_AULA_CONTROLEDEFREQUENCIA
(
   ID_AULA              int not null,
   ID_CONTROLE          int not null,
   primary key (ID_AULA, ID_CONTROLE)
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

alter table ASSOCIACAO_PROFESSOR_DISCIPLINA add constraint FK_REL_DISCIPLINA_ASSOCPD foreign key (ID_MATERIA)
      references DISCIPLINAS (ID_MATERIA) on delete restrict on update restrict;

alter table ASSOCIACAO_PROFESSOR_DISCIPLINA add constraint FK_REL_PROFESSOR_ASSOCIACAOPD foreign key (MATRICULA_PROFESSOR)
      references PROFESSOR (MATRICULA_PROFESSOR) on delete restrict on update restrict;

alter table AULA add constraint FK_REL_AULA_PROFESSORDISCIPLINA foreign key (ID_ASSOCPD)
      references ASSOCIACAO_PROFESSOR_DISCIPLINA (ID_ASSOCPD) on delete restrict on update restrict;

alter table AULA add constraint FK_REL_TURMA_AULA foreign key (ID_TURMA)
      references TURMA (ID_TURMA) on delete restrict on update restrict;

alter table CONTROLE_DE_FREQUENCIA add constraint FK_REL_CONTROLE_PROFESSOR foreign key (ID_ASSOCPD)
      references ASSOCIACAO_PROFESSOR_DISCIPLINA (ID_ASSOCPD) on delete restrict on update restrict;

alter table CONTROLE_DE_FREQUENCIA add constraint FK_REL_TRUEMA_CONTROLE foreign key (ID_TURMA)
      references TURMA (ID_TURMA) on delete restrict on update restrict;

alter table ORIENTACAO_CONTROLE add constraint FK_REL_ALUNOC_ORIENTACAOC foreign key (ID_CONTROLEALUNO)
      references ALUNO_CONTROLE (ID_CONTROLEALUNO) on delete restrict on update restrict;

alter table ORIENTACAO_CONTROLE add constraint FK_REL_ORIENTACAOC_ORIENTADORAE foreign key (ID_ORIENTADORAE)
      references ORIENTADORAE (ID_ORIENTADORAE) on delete restrict on update restrict;

alter table REL_ALUNO_CONTROLEF add constraint FK_REL_ALUNO_CONTROLEF foreign key (MATRICULA_ALUNO)
      references ALUNO (MATRICULA_ALUNO) on delete restrict on update restrict;

alter table REL_ALUNO_CONTROLEF add constraint FK_REL_ALUNO_CONTROLEF2 foreign key (ID_CONTROLE)
      references CONTROLE_DE_FREQUENCIA (ID_CONTROLE) on delete restrict on update restrict;

alter table REL_ALUNO_CONTROLF add constraint FK_REL_ALUNO_CONTROLF foreign key (ID_CONTROLE)
      references CONTROLE_DE_FREQUENCIA (ID_CONTROLE) on delete restrict on update restrict;

alter table REL_ALUNO_CONTROLF add constraint FK_REL_ALUNO_CONTROLF2 foreign key (ID_CONTROLEALUNO)
      references ALUNO_CONTROLE (ID_CONTROLEALUNO) on delete restrict on update restrict;

alter table REL_AULA_CONTROLEDEFREQUENCIA add constraint FK_REL_AULA_CONTROLEDEFREQUENCIA foreign key (ID_AULA)
      references AULA (ID_AULA) on delete restrict on update restrict;

alter table REL_AULA_CONTROLEDEFREQUENCIA add constraint FK_REL_AULA_CONTROLEDEFREQUENCIA2 foreign key (ID_CONTROLE)
      references CONTROLE_DE_FREQUENCIA (ID_CONTROLE) on delete restrict on update restrict;

