USE [db_SistVenta]
GO

/****** Object:  Table [dbo].[Categorias]    Script Date: 25/08/2024 7:07:00 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Descripcion] [varchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Clientes](
	[IdCliente] [varchar](5) NOT NULL,
	[Compania] [varchar](40) NOT NULL,
	[ContactoNombre] [varchar](30) NULL,
	[ContactoTitulo] [varchar](30) NULL,
	[Direccion] [varchar](60) NULL,
	[Ciudad] [varchar](15) NULL,
	[Region] [varchar](15) NULL,
	[Pais] [varchar](15) NULL,
	[Telefono] [varchar](24) NULL,
	[Fax] [varchar](24) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Clientes] ADD  DEFAULT (NULL) FOR [ContactoNombre]
GO

ALTER TABLE [dbo].[Clientes] ADD  DEFAULT (NULL) FOR [ContactoTitulo]
GO

ALTER TABLE [dbo].[Clientes] ADD  DEFAULT (NULL) FOR [Direccion]
GO

ALTER TABLE [dbo].[Clientes] ADD  DEFAULT (NULL) FOR [Ciudad]
GO

ALTER TABLE [dbo].[Clientes] ADD  DEFAULT (NULL) FOR [Region]
GO

ALTER TABLE [dbo].[Clientes] ADD  DEFAULT (NULL) FOR [Pais]
GO

ALTER TABLE [dbo].[Clientes] ADD  DEFAULT (NULL) FOR [Telefono]
GO

ALTER TABLE [dbo].[Clientes] ADD  DEFAULT (NULL) FOR [Fax]
GO



CREATE TABLE [dbo].[Despachadores](
	[IdDespachador] [int] NOT NULL,
	[Compania] [varchar](40) NOT NULL,
	[Telefono] [varchar](24) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDespachador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Despachadores] ADD  DEFAULT (NULL) FOR [Telefono]
GO



CREATE TABLE [dbo].[Empleados](
	[IdEmpleado] [int] NOT NULL,
	[Apellidos] [varchar](20) NOT NULL,
	[Nombres] [varchar](10) NOT NULL,
	[Cargo] [varchar](30) NULL,
	[TituloCortesia] [varchar](25) NULL,
	[FCumpleanos] [datetime] NULL,
	[FContrato] [datetime] NULL,
	[Direccion] [varchar](60) NULL,
	[Ciudad] [varchar](15) NULL,
	[Region] [varchar](15) NULL,
	[Pais] [varchar](15) NULL,
	[TelCasa] [varchar](24) NULL,
	[Extension] [varchar](4) NULL,
	[Notas] [varchar](500) NOT NULL,
	[Reporta_A] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Empleados] ADD  DEFAULT (NULL) FOR [Cargo]
GO

ALTER TABLE [dbo].[Empleados] ADD  DEFAULT (NULL) FOR [TituloCortesia]
GO

ALTER TABLE [dbo].[Empleados] ADD  DEFAULT (NULL) FOR [FCumpleanos]
GO

ALTER TABLE [dbo].[Empleados] ADD  DEFAULT (NULL) FOR [FContrato]
GO

ALTER TABLE [dbo].[Empleados] ADD  DEFAULT (NULL) FOR [Direccion]
GO

ALTER TABLE [dbo].[Empleados] ADD  DEFAULT (NULL) FOR [Ciudad]
GO

ALTER TABLE [dbo].[Empleados] ADD  DEFAULT (NULL) FOR [Region]
GO

ALTER TABLE [dbo].[Empleados] ADD  DEFAULT (NULL) FOR [Pais]
GO

ALTER TABLE [dbo].[Empleados] ADD  DEFAULT (NULL) FOR [TelCasa]
GO

ALTER TABLE [dbo].[Empleados] ADD  DEFAULT (NULL) FOR [Extension]
GO

ALTER TABLE [dbo].[Empleados] ADD  DEFAULT (NULL) FOR [Reporta_A]
GO

ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Empleados] FOREIGN KEY([Reporta_A])
REFERENCES [dbo].[Empleados] ([IdEmpleado])
GO

ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Empleados]
GO




CREATE TABLE [dbo].[Pedidos](
	[IdPedido] [int] NOT NULL,
	[IdCliente] [varchar](5) NULL,
	[IdEmpleado] [int] NULL,
	[FPedido] [datetime] NULL,
	[FRequerida] [datetime] NULL,
	[FDespacho] [datetime] NULL,
	[IdDespachador] [int] NULL,
	[Flete] [decimal](10, 4) NULL,
	[EntregaNombre] [varchar](40) NULL,
	[EntregaDireccion] [varchar](60) NULL,
	[EntregaCiudad] [varchar](15) NULL,
	[EntregaRegion] [varchar](15) NULL,
	[EntregaPais] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (NULL) FOR [IdCliente]
GO

ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (NULL) FOR [IdEmpleado]
GO

ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (NULL) FOR [FPedido]
GO

ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (NULL) FOR [FRequerida]
GO

ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (NULL) FOR [FDespacho]
GO

ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (NULL) FOR [IdDespachador]
GO

ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT ((0)) FOR [Flete]
GO

ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (NULL) FOR [EntregaNombre]
GO

ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (NULL) FOR [EntregaDireccion]
GO

ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (NULL) FOR [EntregaCiudad]
GO

ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (NULL) FOR [EntregaRegion]
GO

ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (NULL) FOR [EntregaPais]
GO

ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Clientes] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO

ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Clientes]
GO

ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Despachadores] FOREIGN KEY([IdDespachador])
REFERENCES [dbo].[Despachadores] ([IdDespachador])
GO

ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Despachadores]
GO

ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Empleados] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([IdEmpleado])
GO

ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Empleados]
GO



CREATE TABLE [dbo].[PedidosDetalle](
	[IdPedido] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[PrecioUnd] [decimal](10, 4) NOT NULL,
	[Cantidad] [smallint] NOT NULL,
	[Descuento] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC,
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PedidosDetalle] ADD  DEFAULT ((0)) FOR [PrecioUnd]
GO

ALTER TABLE [dbo].[PedidosDetalle] ADD  DEFAULT ((1)) FOR [Cantidad]
GO

ALTER TABLE [dbo].[PedidosDetalle] ADD  DEFAULT ((0)) FOR [Descuento]
GO

ALTER TABLE [dbo].[PedidosDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PedidosDetalle_Pedidos] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedidos] ([IdPedido])
GO

ALTER TABLE [dbo].[PedidosDetalle] CHECK CONSTRAINT [FK_PedidosDetalle_Pedidos]
GO

ALTER TABLE [dbo].[PedidosDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PedidosDetalle_Productos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO

ALTER TABLE [dbo].[PedidosDetalle] CHECK CONSTRAINT [FK_PedidosDetalle_Productos]
GO




CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] NOT NULL,
	[Nombre] [varchar](40) NOT NULL,
	[IdProveedor] [int] NULL,
	[IdCategoria] [int] NULL,
	[CantidadPorUnd] [varchar](20) NULL,
	[PrecioUnd] [decimal](10, 4) NULL,
	[UnidadesEnStock] [smallint] NULL,
	[UnidadesEnPedido] [smallint] NULL,
	[NivelReorder] [smallint] NULL,
	[Descontinuado] [bit] NOT NULL,
	[TotalVentas] [decimal](10, 4) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Productos] ADD  DEFAULT (NULL) FOR [IdProveedor]
GO

ALTER TABLE [dbo].[Productos] ADD  DEFAULT (NULL) FOR [IdCategoria]
GO

ALTER TABLE [dbo].[Productos] ADD  DEFAULT (NULL) FOR [CantidadPorUnd]
GO

ALTER TABLE [dbo].[Productos] ADD  DEFAULT ((0)) FOR [PrecioUnd]
GO

ALTER TABLE [dbo].[Productos] ADD  DEFAULT ((0)) FOR [UnidadesEnStock]
GO

ALTER TABLE [dbo].[Productos] ADD  DEFAULT ((0)) FOR [UnidadesEnPedido]
GO

ALTER TABLE [dbo].[Productos] ADD  DEFAULT ((0)) FOR [NivelReorder]
GO

ALTER TABLE [dbo].[Productos] ADD  DEFAULT ((0)) FOR [Descontinuado]
GO

ALTER TABLE [dbo].[Productos] ADD  DEFAULT (NULL) FOR [TotalVentas]
GO

ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO

ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO

ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Proveedores] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedores] ([IdProveedor])
GO

ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Proveedores]
GO



CREATE TABLE [dbo].[Proveedores](
	[IdProveedor] [int] NOT NULL,
	[Compania] [varchar](40) NOT NULL,
	[ContactoNom] [varchar](30) NULL,
	[ContactoTitulo] [varchar](30) NULL,
	[Direccion] [varchar](60) NULL,
	[Ciudad] [varchar](15) NULL,
	[Region] [varchar](15) NULL,
	[Pais] [varchar](15) NULL,
	[Telefono] [varchar](24) NULL,
	[Fax] [varchar](24) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Proveedores] ADD  DEFAULT (NULL) FOR [ContactoNom]
GO

ALTER TABLE [dbo].[Proveedores] ADD  DEFAULT (NULL) FOR [ContactoTitulo]
GO

ALTER TABLE [dbo].[Proveedores] ADD  DEFAULT (NULL) FOR [Direccion]
GO

ALTER TABLE [dbo].[Proveedores] ADD  DEFAULT (NULL) FOR [Ciudad]
GO

ALTER TABLE [dbo].[Proveedores] ADD  DEFAULT (NULL) FOR [Region]
GO

ALTER TABLE [dbo].[Proveedores] ADD  DEFAULT (NULL) FOR [Pais]
GO

ALTER TABLE [dbo].[Proveedores] ADD  DEFAULT (NULL) FOR [Telefono]
GO

ALTER TABLE [dbo].[Proveedores] ADD  DEFAULT (NULL) FOR [Fax]
GO



