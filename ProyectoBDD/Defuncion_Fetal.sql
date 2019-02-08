-- DROP DATABASE "Defuncion Fetal";

CREATE DATABASE "Defuncion Fetal"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Spanish_Ecuador.1252'
       LC_CTYPE = 'Spanish_Ecuador.1252'
       CONNECTION LIMIT = -1;
 

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ACTA_INSCRIPCION') and o.name = 'FK_ACTA_INS_RELATIONS_REGISTRO')
alter table ACTA_INSCRIPCION
   drop constraint FK_ACTA_INS_RELATIONS_REGISTRO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ACTA_INSCRIPCION') and o.name = 'FK_ACTA_INS_RELATIONS_MADRE')
alter table ACTA_INSCRIPCION
   drop constraint FK_ACTA_INS_RELATIONS_MADRE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ACTA_INSCRIPCION') and o.name = 'FK_ACTA_INS_RELATIONS_MEDICO')
alter table ACTA_INSCRIPCION
   drop constraint FK_ACTA_INS_RELATIONS_MEDICO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ACTA_INSCRIPCION') and o.name = 'FK_ACTA_INS_RELATIONS_DEF_FETA')
alter table ACTA_INSCRIPCION
   drop constraint FK_ACTA_INS_RELATIONS_DEF_FETA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DEF_FETAL') and o.name = 'FK_DEF_FETA_RELATIONS_ACTA_INS')
alter table DEF_FETAL
   drop constraint FK_DEF_FETA_RELATIONS_ACTA_INS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ACTA_INSCRIPCION')
            and   name  = 'RELATIONSHIP_5_FK'
            and   indid > 0
            and   indid < 255)
   drop index ACTA_INSCRIPCION.RELATIONSHIP_5_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ACTA_INSCRIPCION')
            and   name  = 'RELATIONSHIP_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index ACTA_INSCRIPCION.RELATIONSHIP_3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ACTA_INSCRIPCION')
            and   name  = 'RELATIONSHIP_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index ACTA_INSCRIPCION.RELATIONSHIP_2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ACTA_INSCRIPCION')
            and   name  = 'RELATIONSHIP_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index ACTA_INSCRIPCION.RELATIONSHIP_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ACTA_INSCRIPCION')
            and   type = 'U')
   drop table ACTA_INSCRIPCION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DEF_FETAL')
            and   name  = 'RELATIONSHIP_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index DEF_FETAL.RELATIONSHIP_4_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DEF_FETAL')
            and   type = 'U')
   drop table DEF_FETAL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MADRE')
            and   type = 'U')
   drop table MADRE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MEDICO')
            and   type = 'U')
   drop table MEDICO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('REGISTROCIVIL')
            and   type = 'U')
   drop table REGISTROCIVIL
go

/*==============================================================*/
/* Table: ACTA_INSCRIPCION                                      */
/*==============================================================*/
create table ACTA_INSCRIPCION (
   ACTAINSCRIPCION      varchar(40)          not null,
   IDREGISTROCIVIL      int                  null,
   ID_FETAL             int                  null,
   CI_MADRE             int                  null,
   CI_MEDICO            int                  null,
   FECHAINSCRIPCION     datetime             not null,
   FECHACRITICA         datetime             null,
   constraint PK_ACTA_INSCRIPCION primary key nonclustered (ACTAINSCRIPCION)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on ACTA_INSCRIPCION (
IDREGISTROCIVIL ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on ACTA_INSCRIPCION (
CI_MADRE ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on ACTA_INSCRIPCION (
CI_MEDICO ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on ACTA_INSCRIPCION (
ID_FETAL ASC
)
go

/*==============================================================*/
/* Table: DEF_FETAL                                             */
/*==============================================================*/
create table DEF_FETAL (
   ID_FETAL             int                  not null,
   ACTAINSCRIPCION      varchar(40)          null,
   SEXOFETO             char(30)             not null,
   SEMANAGESTA          smallint             not null,
   FECHADEFUN           datetime             not null,
   PRODUCTOEMBARA       char(20)             not null,
   ASISTENCIAFETAL      char(30)             not null,
   LUGAROCURRENCIA      char(30)             not null,
   NOMBREESTABLEFETAL   char(30)             not null,
   PROVINCIAFETAL       char(30)             not null,
   CANTONFETAL          char(30)             not null,
   PARROQUIAFETAL       char(30)             not null,
   LOCALIDADFETAL       char(30)             not null,
   CAUSAFETAL           char(30)             not null,
   constraint PK_DEF_FETAL primary key nonclustered (ID_FETAL)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on DEF_FETAL (
ACTAINSCRIPCION ASC
)
go

/*==============================================================*/
/* Table: MADRE                                                 */
/*==============================================================*/
create table MADRE (
   CI_MADRE             int                  not null,
   NOMBREMADRE          char(50)             not null,
   NACIONALMADRE        char(30)             not null,
   FECHANACIMIMADRE     datetime             not null,
   EDADMADRE            int                  not null,
   HIJOSVIVEN           smallint             not null,
   HIJOSMUERTOSVIVEN    smallint             not null,
   HIJOSMUERTOS         smallint             not null,
   NUMCONTROLES         int                  not null,
   AUTOMADRE            char(20)             not null,
   ESTADOCIVIL          char(30)             not null,
   LECTURA              char(20)             not null,
   NIVELINSTRUCCIONMADRE char(40)             not null,
   PROVINCIAMADRE       char(30)             not null,
   CANTONMADRE          char(30)             not null,
   PARROQUIAMADRE       char(40)             not null,
   CIUDADMADRE          char(30)             not null,
   DIREMADRE            char(40)             not null,
   constraint PK_MADRE primary key nonclustered (CI_MADRE)
)
go

/*==============================================================*/
/* Table: MEDICO                                                */
/*==============================================================*/
create table MEDICO (
   CI_MEDICO            int                  not null,
   NOMBREMEDICO         char(30)             not null,
   NUMTELEMEDICO        int                  not null,
   FIRMAMEDICO          image                not null,
   OBSERMEDICO          text                 not null,
   constraint PK_MEDICO primary key nonclustered (CI_MEDICO)
)
go

/*==============================================================*/
/* Table: REGISTROCIVIL                                         */
/*==============================================================*/
create table REGISTROCIVIL (
   IDREGISTROCIVIL      int                  not null,
   DIRECCIONRESGISTRO   char(50)             not null,
   NOMBREREGISTRO       char(30)             not null,
   OFICINAREGISTRO      int                  not null,
   PARROQUIAREGISTRO    char(30)             not null,
   CANTONREGISTRO       char(30)             not null,
   PROVINCIAREGISTRO    char(30)             not null,
   constraint PK_REGISTROCIVIL primary key nonclustered (IDREGISTROCIVIL)
)
go

alter table ACTA_INSCRIPCION
   add constraint FK_ACTA_INS_RELATIONS_REGISTRO foreign key (IDREGISTROCIVIL)
      references REGISTROCIVIL (IDREGISTROCIVIL)
go

alter table ACTA_INSCRIPCION
   add constraint FK_ACTA_INS_RELATIONS_MADRE foreign key (CI_MADRE)
      references MADRE (CI_MADRE)
go

alter table ACTA_INSCRIPCION
   add constraint FK_ACTA_INS_RELATIONS_MEDICO foreign key (CI_MEDICO)
      references MEDICO (CI_MEDICO)
go

alter table ACTA_INSCRIPCION
   add constraint FK_ACTA_INS_RELATIONS_DEF_FETA foreign key (ID_FETAL)
      references DEF_FETAL (ID_FETAL)
go

alter table DEF_FETAL
   add constraint FK_DEF_FETA_RELATIONS_ACTA_INS foreign key (ACTAINSCRIPCION)
      references ACTA_INSCRIPCION (ACTAINSCRIPCION)
go

