/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     05/11/2020 06:26:55                          */
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

drop table if exists TURMA;

/*==============================================================*/
/* Table: ALUNO                                                 */
/*==============================================================*/
create table ALUNO
(
   MATRICULA_ALUNO2     int not null,
   ID_TURMA2            int,
   NOME_ALUNO           varchar(45),
   CPF_ALUNO            int,
   LIDER_ALUNO          char(1),
   SEXO_ALUNO           char(1),
   STATUS_ALUNO         char(3),
   SENHA_ALUNO          varchar(8),
   EMAIL_ALUNO          varchar(100),
   primary key (MATRICULA_ALUNO2)
);

alter table ALUNO comment 'Status (Ativo, Inativo, Repetente, Formado, Atestado';

/*==============================================================*/
/* Table: ALUNO_CONTROLE                                        */
/*==============================================================*/
create table ALUNO_CONTROLE
(
   ID_CONTROLEALUNO     int not null,
   ID_CONTROLE2         int,
   MATRICULA_ALUNO2     int,
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
   ID_ASSOCPD2          int not null,
   ID_MATERIA2          int,
   MATRICULA_PROFESSOR3 int,
   primary key (ID_ASSOCPD2)
);

/*==============================================================*/
/* Table: AULA                                                  */
/*==============================================================*/
create table AULA
(
   ID_AULA              int not null,
   ID_TURMA2            int,
   ID_ASSOCPD2          int,
   PERIODO_AULA         char(1),
   HORARIO_AULA         char(1),
   primary key (ID_AULA)
);

alter table AULA comment 'Perio_Aula (M/V/N)
Horario_Aula (1,2,3,4,5,6)';

/*==============================================================*/
/* Table: CONTROLE_DE_FREQUENCIA                                */
/*==============================================================*/
create table CONTROLE_DE_FREQUENCIA
(
   ID_CONTROLE2         int not null,
   ID_TURMA2            int,
   MATRICULA_ALUNO2     int,
   ID_AULA              int,
   ID_ASSOCPD2          int,
   DATA_CONTROLE        timestamp,
   OBSERVACAO_CONTROLE  varchar(200),
   primary key (ID_CONTROLE2)
);

alter table CONTROLE_DE_FREQUENCIA comment 'Presenca ( A [ausente] P [presente] )
';

/*==============================================================*/
/* Table: DISCIPLINAS                                           */
/*==============================================================*/
create table DISCIPLINAS
(
   ID_MATERIA2          int not null,
   NOME_DISCIPLINA      varchar(35),
   NUCLEO_DISCIPLINA    char(1),
   primary key (ID_MATERIA2)
);

alter table DISCIPLINAS comment 'Materia Nucleo = C (Comum) or T (Tecnico)
';

/*==============================================================*/
/* Table: ORIENTACAO_CONTROLE                                   */
/*==============================================================*/
create table ORIENTACAO_CONTROLE
(
   ID_ORIENTACAOC       int not null,
   ID_CONTROLEALUNO     int,
   ID_ORIENTADORAE      int,
   DATA_ORIENTACAOCONTROLE timestamp,
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
   CARGO_ORIENTADORAE   varchar(20),
   TELEFONE_ORIENTADORAE int,
   FLAG_ORIENTADORAE    char(1),
   primary key (ID_ORIENTADORAE)
);

/*==============================================================*/
/* Table: PROFESSOR                                             */
/*==============================================================*/
create table PROFESSOR
(
   MATRICULA_PROFESSOR3 int not null,
   CPF_PROFESSOR        int,
   CARGAHORA_PROFESSOR  time,
   SEXO_PROFESSOR       char(1),
   SENHA_PROFESSOR      varchar(10),
   EMAIL_PROFESSOR      varchar(100),
   primary key (MATRICULA_PROFESSOR3)
);

/*==============================================================*/
/* Table: TURMA                                                 */
/*==============================================================*/
create table TURMA
(
   ID_TURMA2            int not null,
   SALA_TURMA           varchar(10),
   primary key (ID_TURMA2)
);

alter table ALUNO add constraint FK_REL_TURMA_ALUNO foreign key (ID_TURMA2)
      references TURMA (ID_TURMA2) on delete restrict on update restrict;

alter table ALUNO_CONTROLE add constraint FK_REL_ALUNO_CONTROLEA foreign key (MATRICULA_ALUNO2)
      references ALUNO (MATRICULA_ALUNO2) on delete restrict on update restrict;

alter table ALUNO_CONTROLE add constraint FK_REL_ALUNO_CONTROLF foreign key (ID_CONTROLE2)
      references CONTROLE_DE_FREQUENCIA (ID_CONTROLE2) on delete restrict on update restrict;

alter table ASSOCIACAO_PROFESSOR_DISCIPLINA add constraint FK_REL_DISCIPLINA_ASSOCPD foreign key (ID_MATERIA2)
      references DISCIPLINAS (ID_MATERIA2) on delete restrict on update restrict;

alter table ASSOCIACAO_PROFESSOR_DISCIPLINA add constraint FK_REL_PROFESSOR_ASSOCIACAOPD foreign key (MATRICULA_PROFESSOR3)
      references PROFESSOR (MATRICULA_PROFESSOR3) on delete restrict on update restrict;

alter table AULA add constraint FK_REL_PROFESSOR_AULA foreign key (ID_ASSOCPD2)
      references ASSOCIACAO_PROFESSOR_DISCIPLINA (ID_ASSOCPD2) on delete restrict on update restrict;

alter table AULA add constraint FK_REL_TURMA_AULA foreign key (ID_TURMA2)
      references TURMA (ID_TURMA2) on delete restrict on update restrict;

alter table CONTROLE_DE_FREQUENCIA add constraint FK_REL_ALUNO_CONTROLEF foreign key (MATRICULA_ALUNO2)
      references ALUNO (MATRICULA_ALUNO2) on delete restrict on update restrict;

alter table CONTROLE_DE_FREQUENCIA add constraint FK_REL_CONTROLE_AULA foreign key (ID_AULA)
      references AULA (ID_AULA) on delete restrict on update restrict;

alter table CONTROLE_DE_FREQUENCIA add constraint FK_REL_CONTROLE_PROFESSOR foreign key (ID_ASSOCPD2)
      references ASSOCIACAO_PROFESSOR_DISCIPLINA (ID_ASSOCPD2) on delete restrict on update restrict;

alter table CONTROLE_DE_FREQUENCIA add constraint FK_REL_TRUEMA_CONTROLE foreign key (ID_TURMA2)
      references TURMA (ID_TURMA2) on delete restrict on update restrict;

alter table ORIENTACAO_CONTROLE add constraint FK_REL_ALUNOC_ORIENTACAOC foreign key (ID_CONTROLEALUNO)
      references ALUNO_CONTROLE (ID_CONTROLEALUNO) on delete restrict on update restrict;

alter table ORIENTACAO_CONTROLE add constraint FK_REL_ORIENTACAOCONTROL_ORIENTADORAE foreign key (ID_ORIENTADORAE)
      references ORIENTADORAE (ID_ORIENTADORAE) on delete restrict on update restrict;

