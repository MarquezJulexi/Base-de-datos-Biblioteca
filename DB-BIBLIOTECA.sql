/*==============================================================*/
/* Table: ANO_BIBLIOTECARIO                                     */
/*==============================================================*/
create table ANO_BIBLIOTECARIO (
   ID_ANO               SERIAL               not null,
   ID_BIBLIOTECARIO     INT4                 not null,
   ANOS_BIBLIOTECARIO   VARCHAR(9)           not null,
   constraint PK_ANO_BIBLIOTECARIO primary key (ID_ANO)
);

/*==============================================================*/
/* Table: BIBLIOTECARIO                                         */
/*==============================================================*/
create table BIBLIOTECARIO (
   ID_BIBLIOTECARIO     SERIAL               not null,
   CI_BIBLIOTECARIO     VARCHAR(10)          not null,
   NOMBRE_BIBLIOTECARIO VARCHAR(50)          not null,
   APELLIDO_BIBLIOTECARIO VARCHAR(50)          not null,
   constraint PK_BIBLIOTECARIO primary key (ID_BIBLIOTECARIO)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           SERIAL               not null,
   NOMBRE_CLIENTE       VARCHAR(50)          not null,
   CI_CLIENTE           VARCHAR(10)          not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: EJEMPLAR                                              */
/*==============================================================*/
create table EJEMPLAR (
   ID_EJEMPLAR          SERIAL               not null,
   ID_LIBRO             INT4                 not null,
   CODIGO_EJEMPLAR      VARCHAR(5)           not null,
   ASPECTO_EJEMPLAR     VARCHAR(7)           not null,
   ESTADO               VARCHAR(7)           not null,
   FECHA_BAJA           DATE                 null,
   constraint PK_EJEMPLAR primary key (ID_EJEMPLAR)
);

/*==============================================================*/
/* Table: LIBRO                                                 */
/*==============================================================*/
create table LIBRO (
   ID_LIBRO             SERIAL               not null,
   NOMBRE_LIBRO         VARCHAR(1024)        not null,
   VERSION_LIBRO        VARCHAR(5)           not null,
   AUTOR                VARCHAR(100)         not null,
   ISBN                 VARCHAR(17)          not null,
   EDITORIAL_LIBRO      VARCHAR(50)          not null,
   NO_EJEMPLARES        NUMERIC              not null,
   VERSION_DIGITAL      VARCHAR(2)           not null,
   constraint PK_LIBRO primary key (ID_LIBRO)
);

/*==============================================================*/
/* Table: PRESTAMO                                              */
/*==============================================================*/
create table PRESTAMO (
   ID_PRESTAMO          SERIAL               not null,
   ID_CLIENTE           INT4                 not null,
   ID_EJEMPLAR          INT4                 not null,
   ID_BIBLIOTECARIO     INT4                 not null,
   FECHA_PRESTAMO       DATE                 not null,
   FECHA_ENTREGA        DATE                 not null,
   PENALIZACION         DECIMAL(5)           not null,
   APECTO_ENTREGA       VARCHAR(7)           not null,
   OBSERVACIONES        VARCHAR(500)         not null,
   COSTO_PRESTAMO       DECIMAL              not null,
   constraint PK_PRESTAMO primary key (ID_PRESTAMO)
);

/*==============================================================*/
/* Table: PROVEEDORES                                           */
/*==============================================================*/
create table PROVEEDORES (
   ID_PROVEEDOR         SERIAL               not null,
   NOMBRE_PROVEEDOR     VARCHAR(50)          not null,
   PRECIO_VENTA         DECIMAL              not null,
   FECHA_VENTA          DATE                 not null,
   constraint PK_PROVEEDORES primary key (ID_PROVEEDOR)
);

/*==============================================================*/
/* Table: RELATIONSHIP_5                                        */
/*==============================================================*/
create table RELATIONSHIP_5 (
   ID_VISITA            INT4                 not null,
   ID_EJEMPLAR          INT4                 not null,
   constraint PK_RELATIONSHIP_5 primary key (ID_VISITA, ID_EJEMPLAR)
);

/*==============================================================*/
/* Table: RELATIONSHIP_7                                        */
/*==============================================================*/
create table RELATIONSHIP_7 (
   ID_PROVEEDOR         INT4                 not null,
   ID_EJEMPLAR          INT4                 not null,
   constraint PK_RELATIONSHIP_7 primary key (ID_PROVEEDOR, ID_EJEMPLAR)
);

/*==============================================================*/
/* Table: SERVICIO_VISITA                                       */
/*==============================================================*/
create table SERVICIO_VISITA (
   ID_VISITA            SERIAL               not null,
   ID_CLIENTE           INT4                 not null,
   ID_BIBLIOTECARIO     INT4                 not null,
   HORA_ENTRADA         DATE                 not null,
   HORA_SALIDA          DATE                 not null,
   constraint PK_SERVICIO_VISITA primary key (ID_VISITA)
);

alter table ANO_BIBLIOTECARIO
   add constraint FK_ANO_BIBL_RELATIONS_BIBLIOTE foreign key (ID_BIBLIOTECARIO)
      references BIBLIOTECARIO (ID_BIBLIOTECARIO)
      on delete restrict on update restrict;

alter table EJEMPLAR
   add constraint FK_EJEMPLAR_TIENE_LIBRO foreign key (ID_LIBRO)
      references LIBRO (ID_LIBRO)
      on delete restrict on update restrict;

alter table PRESTAMO
   add constraint FK_PRESTAMO_RELATIONS_EJEMPLAR foreign key (ID_EJEMPLAR)
      references EJEMPLAR (ID_EJEMPLAR)
      on delete restrict on update restrict;

alter table PRESTAMO
   add constraint FK_PRESTAMO_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table PRESTAMO
   add constraint FK_PRESTAMO_RELATIONS_BIBLIOTE foreign key (ID_BIBLIOTECARIO)
      references BIBLIOTECARIO (ID_BIBLIOTECARIO)
      on delete restrict on update restrict;

alter table RELATIONSHIP_5
   add constraint FK_RELATION_RELATIONS_SERVICIO foreign key (ID_VISITA)
      references SERVICIO_VISITA (ID_VISITA)
      on delete restrict on update restrict;

alter table RELATIONSHIP_5
   add constraint FK_RELATION_RELATIONS_EJEMPLAR foreign key (ID_EJEMPLAR)
      references EJEMPLAR (ID_EJEMPLAR)
      on delete restrict on update restrict;

alter table RELATIONSHIP_7
   add constraint FK_RELATION_RELATIONS_PROVEEDO foreign key (ID_PROVEEDOR)
      references PROVEEDORES (ID_PROVEEDOR)
      on delete restrict on update restrict;

alter table RELATIONSHIP_7
   add constraint FK_RELATION_RELATIONS_EJEMPLAR foreign key (ID_EJEMPLAR)
      references EJEMPLAR (ID_EJEMPLAR)
      on delete restrict on update restrict;

alter table SERVICIO_VISITA
   add constraint FK_SERVICIO_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table SERVICIO_VISITA
   add constraint FK_SERVICIO_RELATIONS_BIBLIOTE foreign key (ID_BIBLIOTECARIO)
      references BIBLIOTECARIO (ID_BIBLIOTECARIO)
      on delete restrict on update restrict;

