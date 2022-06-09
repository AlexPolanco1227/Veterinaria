/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     1/6/2022 18:32:27                            */
/*==============================================================*/


drop index RELATIONSHIP_15_FK;

drop index RELATIONSHIP_2_FK;

drop index CITA_PK;

drop table CITA;

drop index CLIENTE_PK;

drop table CLIENTE;

drop index RELATIONSHIP_20_FK;

drop index RELATIONSHIP_19_FK;

drop index DOSIFICACION_PK;

drop table DOSIFICACION;

drop index RELATIONSHIP_17_FK;

drop index RELATIONSHIP_11_FK;

drop index FACTURA_PK;

drop table FACTURA;

drop index RELATIONSHIP_14_FK;

drop index HABITO_PK;

drop table HABITO;

drop index 1_M_FK;

drop index MASCOTA_PK;

drop table MASCOTA;

drop index RELATIONSHIP_13_FK;

drop index RELATIONSHIP_21_FK;

drop index PRODUCTO_PK;

drop table PRODUCTO;

drop index PROVEDOR_PK;

drop table PROVEDOR;

drop index RELATIONSHIP_16_FK;

drop index VACUNA_PK;

drop table VACUNA;

drop index RELATIONSHIP_10_FK;

drop index VENTA_PK;

drop table VENTA;

drop index VETERINARIO_PK;

drop table VETERINARIO;

drop index RELATIONSHIP_12_FK;

drop index VISITA_PK;

drop table VISITA;

/*==============================================================*/
/* Table: CITA                                                  */
/*==============================================================*/
create table CITA (
   ID_CITA              INT4                 not null,
   ID_CLIENTE           INT4                 null,
   ID_MASCOTA           INT4                 not null,
   FECHA_CITA           DATE                 null,
   RAZON_CITA           VARCHAR(100)         null,
   constraint PK_CITA primary key (ID_CITA)
);

/*==============================================================*/
/* Index: CITA_PK                                               */
/*==============================================================*/
create unique index CITA_PK on CITA (
ID_CITA
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on CITA (
ID_CLIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_15_FK on CITA (
ID_MASCOTA
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           INT4                 not null,
   NOMBRES_CLIENTE      VARCHAR(30)          null,
   APELLIDOS_CLIENTE    VARCHAR(30)          null,
   GENERO_CLIENTE       VARCHAR(15)          null,
   DIRECCION_CLIENTE    VARCHAR(60)          null,
   TELEFONO_CLIENTE     VARCHAR(10)          null,
   CEDULA_CLIENTE       VARCHAR(10)          null,
   FECHAREGISTRO_CLIENTE DATE                 null,
   NUMERO_MASCOTAS      NUMERIC              null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Table: DOSIFICACION                                          */
/*==============================================================*/
create table DOSIFICACION (
   ID_CONSULTA          INT4                 not null,
   ID_MASCOTA           INT4                 null,
   ID_VETERINARIO       INT4                 null,
   MOTIVO_CONSULTA      VARCHAR(60)          null,
   FECHA_CONSULTA       DATE                 null,
   constraint PK_DOSIFICACION primary key (ID_CONSULTA)
);

/*==============================================================*/
/* Index: DOSIFICACION_PK                                       */
/*==============================================================*/
create unique index DOSIFICACION_PK on DOSIFICACION (
ID_CONSULTA
);

/*==============================================================*/
/* Index: RELATIONSHIP_19_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_19_FK on DOSIFICACION (
ID_MASCOTA
);

/*==============================================================*/
/* Index: RELATIONSHIP_20_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_20_FK on DOSIFICACION (
ID_VETERINARIO
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           INT4                 not null,
   ID_CLIENTE           INT4                 null,
   ID_VENTAS            INT4                 null,
   FECHA_FACTURA        DATE                 null,
   TIPO_FACTURA         VARCHAR(30)          null,
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Index: FACTURA_PK                                            */
/*==============================================================*/
create unique index FACTURA_PK on FACTURA (
ID_FACTURA
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on FACTURA (
ID_VENTAS
);

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_17_FK on FACTURA (
ID_CLIENTE
);

/*==============================================================*/
/* Table: HABITO                                                */
/*==============================================================*/
create table HABITO (
   ID_HABITO            INT4                 not null,
   ID_MASCOTA           INT4                 null,
   TIPO_HABITO          VARCHAR(30)          null,
   RAZON_HABITO         VARCHAR(100)         null,
   constraint PK_HABITO primary key (ID_HABITO)
);

/*==============================================================*/
/* Index: HABITO_PK                                             */
/*==============================================================*/
create unique index HABITO_PK on HABITO (
ID_HABITO
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_14_FK on HABITO (
ID_MASCOTA
);

/*==============================================================*/
/* Table: MASCOTA                                               */
/*==============================================================*/
create table MASCOTA (
   ID_MASCOTA           INT4                 not null,
   ID_CLIENTE           INT4                 null,
   NOMBRE_MASCOTA       VARCHAR(15)          null,
   NACIMIENTO_MASCOTA   DATE                 null,
   GENERO_MASCOTA       VARCHAR(15)          null,
   TIPO_MASCOTA         VARCHAR(30)          null,
   COLOR_MASCOTA        VARCHAR(15)          null,
   ESTERILIZADO_MASCOTA VARCHAR(10)          null,
   constraint PK_MASCOTA primary key (ID_MASCOTA)
);

/*==============================================================*/
/* Index: MASCOTA_PK                                            */
/*==============================================================*/
create unique index MASCOTA_PK on MASCOTA (
ID_MASCOTA
);

/*==============================================================*/
/* Index: 1_M_FK                                                */
/*==============================================================*/
create  index 1_M_FK on MASCOTA (
ID_CLIENTE
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          INT4                 not null,
   ID_PROVEDOR          INT4                 null,
   ID_VENTAS            INT4                 null,
   NOMBRE_PRODUCTO      VARCHAR(100)         null,
   TIPO_PRODUCTO        VARCHAR(60)          null,
   PESO_PRODUCTO        NUMERIC              null,
   PRECIO_PRODUCTO      DECIMAL              null,
   CARACTERISTICAS_PRODUCTO VARCHAR(100)         null,
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
);

/*==============================================================*/
/* Index: PRODUCTO_PK                                           */
/*==============================================================*/
create unique index PRODUCTO_PK on PRODUCTO (
ID_PRODUCTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_21_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_21_FK on PRODUCTO (
ID_PROVEDOR
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on PRODUCTO (
ID_VENTAS
);

/*==============================================================*/
/* Table: PROVEDOR                                              */
/*==============================================================*/
create table PROVEDOR (
   ID_PROVEDOR          INT4                 not null,
   NOMBRE_PROVEDOR      VARCHAR(30)          null,
   APELLIDO_PROVEDOR    VARCHAR(30)          null,
   CEDULA_PROVEDOR      VARCHAR(10)          null,
   NUMERO_PROVEDOR      VARCHAR(10)          null,
   EMPRESA_PROVEDOR     VARCHAR(60)          null,
   DIRECCION_PROVEDOR   VARCHAR(60)          null,
   constraint PK_PROVEDOR primary key (ID_PROVEDOR)
);

/*==============================================================*/
/* Index: PROVEDOR_PK                                           */
/*==============================================================*/
create unique index PROVEDOR_PK on PROVEDOR (
ID_PROVEDOR
);

/*==============================================================*/
/* Table: VACUNA                                                */
/*==============================================================*/
create table VACUNA (
   ID_VACUNA            INT4                 not null,
   ID_MASCOTA           INT4                 null,
   FEHCA_VACUNA         DATE                 null,
   TIPO_VACUNA          VARCHAR(30)          null,
   RAZON_VACUNA         VARCHAR(100)         null,
   constraint PK_VACUNA primary key (ID_VACUNA)
);

/*==============================================================*/
/* Index: VACUNA_PK                                             */
/*==============================================================*/
create unique index VACUNA_PK on VACUNA (
ID_VACUNA
);

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_16_FK on VACUNA (
ID_MASCOTA
);

/*==============================================================*/
/* Table: VENTA                                                 */
/*==============================================================*/
create table VENTA (
   ID_VENTAS            INT4                 not null,
   ID_FACTURA           INT4                 not null,
   FECHA_VENTAS         DATE                 null,
   TIPO_VENTAS          VARCHAR(30)          null,
   constraint PK_VENTA primary key (ID_VENTAS)
);

/*==============================================================*/
/* Index: VENTA_PK                                              */
/*==============================================================*/
create unique index VENTA_PK on VENTA (
ID_VENTAS
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on VENTA (
ID_FACTURA
);

/*==============================================================*/
/* Table: VETERINARIO                                           */
/*==============================================================*/
create table VETERINARIO (
   ID_VETERINARIO       INT4                 not null,
   NOMBRE_VETERINARIO   VARCHAR(30)          null,
   APELLIDO_VETERINARIO VARCHAR(30)          null,
   GENERO_VETERINARIO   VARCHAR(15)          null,
   CEDULA_VETERINARIO   VARCHAR(10)          null,
   TELEFONO_VETERINARIO VARCHAR(10)          null,
   DIRECCION_VETERINARIO VARCHAR(60)          null,
   constraint PK_VETERINARIO primary key (ID_VETERINARIO)
);

/*==============================================================*/
/* Index: VETERINARIO_PK                                        */
/*==============================================================*/
create unique index VETERINARIO_PK on VETERINARIO (
ID_VETERINARIO
);

/*==============================================================*/
/* Table: VISITA                                                */
/*==============================================================*/
create table VISITA (
   ID_VISITA            INT4                 not null,
   ID_CLIENTE           INT4                 null,
   FECHA_VISITA         DATE                 null,
   RAZON_VISITA         VARCHAR(100)         null,
   constraint PK_VISITA primary key (ID_VISITA)
);

/*==============================================================*/
/* Index: VISITA_PK                                             */
/*==============================================================*/
create unique index VISITA_PK on VISITA (
ID_VISITA
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on VISITA (
ID_CLIENTE
);

alter table CITA
   add constraint FK_CITA_RELATIONS_MASCOTA foreign key (ID_MASCOTA)
      references MASCOTA (ID_MASCOTA)
      on delete restrict on update restrict;

alter table CITA
   add constraint FK_CITA_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table DOSIFICACION
   add constraint FK_DOSIFICA_RELATIONS_MASCOTA foreign key (ID_MASCOTA)
      references MASCOTA (ID_MASCOTA)
      on delete restrict on update restrict;

alter table DOSIFICACION
   add constraint FK_DOSIFICA_RELATIONS_VETERINA foreign key (ID_VETERINARIO)
      references VETERINARIO (ID_VETERINARIO)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_RELATIONS_VENTA foreign key (ID_VENTAS)
      references VENTA (ID_VENTAS)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table HABITO
   add constraint FK_HABITO_RELATIONS_MASCOTA foreign key (ID_MASCOTA)
      references MASCOTA (ID_MASCOTA)
      on delete restrict on update restrict;

alter table MASCOTA
   add constraint FK_MASCOTA_1_M_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table PRODUCTO
   add constraint FK_PRODUCTO_RELATIONS_VENTA foreign key (ID_VENTAS)
      references VENTA (ID_VENTAS)
      on delete restrict on update restrict;

alter table PRODUCTO
   add constraint FK_PRODUCTO_RELATIONS_PROVEDOR foreign key (ID_PROVEDOR)
      references PROVEDOR (ID_PROVEDOR)
      on delete restrict on update restrict;

alter table VACUNA
   add constraint FK_VACUNA_RELATIONS_MASCOTA foreign key (ID_MASCOTA)
      references MASCOTA (ID_MASCOTA)
      on delete restrict on update restrict;

alter table VENTA
   add constraint FK_VENTA_RELATIONS_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA)
      on delete restrict on update restrict;

alter table VISITA
   add constraint FK_VISITA_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

