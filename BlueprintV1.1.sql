create database BluePrint
GO
use BluePrint
GO


create table Clientes(
	Id int not null identity(1,1) primary key,
	RazonSocial nvarchar(100) not null,
	Cuit varchar(13) not null primary key,
	/*TIPO DEBERIA SER UNA NUEVA TABLA?*/
	Tipo varchar(50) not null check Tipo("Estatal" or "Mulinacional" or "Educativo Privado" or "Educativo Publico" or "Sin Fines de Lucro"),
)
GO

create table ProyectosxCliente(
	idCliente int foreign key Clientes(Id),
	idProyecto int foreign key Proyectos (IdP),
)
GO

create table Contacto(
	Id int not null foreign key Clientes(Id),
	Mail nvarchar(100) not null,
	Telefono varchar(20) not null,
	Celular varchar(20) null,
)
GO

create table Proyectos(
	NombreP nvarchar(100) not null,
	IdP int identity(1,1) not null primary key,
	IdCliente int not null foreign key Clientes(Id)
	FechaInicio date not null, 
	FechaFin date null,
	Estado bit not null,
	Descripcion nvarchar(500) null,
	CostoEstimado money not null check(CostoEstimado > 0.00),
)
GO