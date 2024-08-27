create database dwh_SistVenta

USE [dwh_SistVenta]
GO

/****** Object:  Table [dbo].[DIM_CATEGORIA]    Script Date: 25/08/2024 7:29:28 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_CATEGORIA](
	[skCategoria] [smallint] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Descripcion] [varchar](80) NULL,
	[FechaCarga] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[skCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DIM_CLIENTE](
	[skCliente] [smallint] IDENTITY(1,1) NOT NULL,
	[IdCliente] [varchar](5) NOT NULL,
	[Compania] [varchar](40) NOT NULL,
	[ContactoNombre] [varchar](30) NULL,
	[ContactoTitulo] [varchar](30) NULL,
	[Telefono] [varchar](24) NULL,
	[Fax] [varchar](24) NULL,
	[Direccion] [varchar](60) NULL,
	[FechaCarga] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[skCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[DIM_DESPACHADOR](
	[skDespachador] [smallint] IDENTITY(1,1) NOT NULL,
	[IdDespachador] [int] NOT NULL,
	[Compania] [varchar](40) NOT NULL,
	[Telefono] [varchar](24) NULL,
	[FechaCarga] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[skDespachador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[DIM_EMPLEADO](
	[skEmpleado] [smallint] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[NombreEmpleado] [varchar](50) NOT NULL,
	[Cargo] [varchar](30) NULL,
	[TituloCortesia] [varchar](25) NULL,
	[FCumpleanos] [datetime] NULL,
	[FContrato] [datetime] NULL,
	[Direccion] [varchar](60) NULL,
	[TelCasa] [varchar](24) NULL,
	[Extension] [varchar](4) NULL,
	[Notas] [varchar](500) NOT NULL,
	[FechaCarga] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[skEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[DIM_GEOGRAFIA](
	[skGeografia] [smallint] IDENTITY(1,1) NOT NULL,
	[IdGeografia] [varchar](15) NOT NULL,
	[NombrePais] [varchar](50) NOT NULL,
	[NombreRegion] [varchar](50) NULL,
	[NombreCiudad] [varchar](50) NOT NULL,
	[FechaCarga] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[skGeografia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[DIM_PRODUCTO](
	[skProducto] [smallint] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Nombre] [varchar](40) NOT NULL,
	[CantidadPorUnd] [varchar](20) NULL,
	[UnidadesEnStock] [smallint] NULL,
	[UnidadesEnPedido] [smallint] NULL,
	[NivelReorder] [smallint] NULL,
	[Descontinuado] [bit] NULL,
	[FechaCarga] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[skProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[DIM_PROVEEDOR](
	[skProveedor] [smallint] IDENTITY(1,1) NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[Compania] [varchar](40) NOT NULL,
	[ContactoNom] [varchar](30) NULL,
	[ContactoTitulo] [varchar](30) NULL,
	[Telefono] [varchar](24) NULL,
	[Fax] [varchar](24) NULL,
	[FechaCarga] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[skProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[DIM_TIEMPO](
	[skTiempo] [smallint] IDENTITY(1,1) NOT NULL,
	[IdTiempo] [int] NOT NULL,
	[Anio] [smallint] NOT NULL,
	[Mes] [smallint] NOT NULL,
	[Dia] [smallint] NOT NULL,
	[NombreMes] [varchar](50) NOT NULL,
	[NombreDia] [varchar](50) NOT NULL,
	[Fecha] [smalldatetime] NOT NULL,
	[FechaCarga] [datetime] NOT NULL,
 CONSTRAINT [PK__DIM_TIEM__A5F036268BA54758] PRIMARY KEY CLUSTERED 
(
	[skTiempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[FACT_PEDIDOS](
	[fkCliente] [smallint] NOT NULL,
	[fkEmpleado] [smallint] NOT NULL,
	[fkDespachador] [smallint] NOT NULL,
	[fkProducto] [smallint] NOT NULL,
	[fkProveedor] [smallint] NOT NULL,
	[fkCategoria] [smallint] NOT NULL,
	[fkGeografia] [smallint] NOT NULL,
	[fkPedido] [smallint] NOT NULL,
	[fkRequerida] [smallint] NOT NULL,
	[fkDespacho] [smallint] NOT NULL,
	[EntregaNombre] [varchar](40) NOT NULL,
	[EntregaDireccion] [varchar](60) NOT NULL,
	[PrecioUnd] [decimal](10, 4) NOT NULL,
	[Cantidad] [smallint] NOT NULL,
	[Descuento] [float] NOT NULL,
	[Flete] [decimal](10, 4) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FACT_PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_FactPedidos_DimCategoria] FOREIGN KEY([fkCategoria])
REFERENCES [dbo].[DIM_CATEGORIA] ([skCategoria])
GO

ALTER TABLE [dbo].[FACT_PEDIDOS] CHECK CONSTRAINT [FK_FactPedidos_DimCategoria]
GO

ALTER TABLE [dbo].[FACT_PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_FactPedidos_DimCliente] FOREIGN KEY([fkCliente])
REFERENCES [dbo].[DIM_CLIENTE] ([skCliente])
GO

ALTER TABLE [dbo].[FACT_PEDIDOS] CHECK CONSTRAINT [FK_FactPedidos_DimCliente]
GO

ALTER TABLE [dbo].[FACT_PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_FactPedidos_DimDespachador] FOREIGN KEY([fkDespachador])
REFERENCES [dbo].[DIM_DESPACHADOR] ([skDespachador])
GO

ALTER TABLE [dbo].[FACT_PEDIDOS] CHECK CONSTRAINT [FK_FactPedidos_DimDespachador]
GO

ALTER TABLE [dbo].[FACT_PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_FactPedidos_DimEmpleado] FOREIGN KEY([fkEmpleado])
REFERENCES [dbo].[DIM_EMPLEADO] ([skEmpleado])
GO

ALTER TABLE [dbo].[FACT_PEDIDOS] CHECK CONSTRAINT [FK_FactPedidos_DimEmpleado]
GO

ALTER TABLE [dbo].[FACT_PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_FactPedidos_DimGeografia] FOREIGN KEY([fkGeografia])
REFERENCES [dbo].[DIM_GEOGRAFIA] ([skGeografia])
GO

ALTER TABLE [dbo].[FACT_PEDIDOS] CHECK CONSTRAINT [FK_FactPedidos_DimGeografia]
GO

ALTER TABLE [dbo].[FACT_PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_FactPedidos_DimProducto] FOREIGN KEY([fkProducto])
REFERENCES [dbo].[DIM_PRODUCTO] ([skProducto])
GO

ALTER TABLE [dbo].[FACT_PEDIDOS] CHECK CONSTRAINT [FK_FactPedidos_DimProducto]
GO

ALTER TABLE [dbo].[FACT_PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_FactPedidos_DimProveedor] FOREIGN KEY([fkProveedor])
REFERENCES [dbo].[DIM_PROVEEDOR] ([skProveedor])
GO

ALTER TABLE [dbo].[FACT_PEDIDOS] CHECK CONSTRAINT [FK_FactPedidos_DimProveedor]
GO

ALTER TABLE [dbo].[FACT_PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_FactPedidos_DimTiempoDespacho] FOREIGN KEY([fkDespacho])
REFERENCES [dbo].[DIM_TIEMPO] ([skTiempo])
GO

ALTER TABLE [dbo].[FACT_PEDIDOS] CHECK CONSTRAINT [FK_FactPedidos_DimTiempoDespacho]
GO

ALTER TABLE [dbo].[FACT_PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_FactPedidos_DimTiempoPedido] FOREIGN KEY([fkPedido])
REFERENCES [dbo].[DIM_TIEMPO] ([skTiempo])
GO

ALTER TABLE [dbo].[FACT_PEDIDOS] CHECK CONSTRAINT [FK_FactPedidos_DimTiempoPedido]
GO

ALTER TABLE [dbo].[FACT_PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_FactPedidos_DimTiempoRequerida] FOREIGN KEY([fkRequerida])
REFERENCES [dbo].[DIM_TIEMPO] ([skTiempo])
GO

ALTER TABLE [dbo].[FACT_PEDIDOS] CHECK CONSTRAINT [FK_FactPedidos_DimTiempoRequerida]
GO





