USE [master]
GO

/****** Object:  Database [FilmIXDatabase]    Script Date: 5/8/2020 12:31:33 AM ******/
CREATE DATABASE [FilmIXDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FilmIXDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\FilmIXDatabase.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FilmIXDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\FilmIXDatabase_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FilmIXDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [FilmIXDatabase] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET ARITHABORT OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [FilmIXDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [FilmIXDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET  DISABLE_BROKER 
GO

ALTER DATABASE [FilmIXDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [FilmIXDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [FilmIXDatabase] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [FilmIXDatabase] SET  MULTI_USER 
GO

ALTER DATABASE [FilmIXDatabase] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [FilmIXDatabase] SET DB_CHAINING OFF 
GO 

ALTER DATABASE [FilmIXDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [FilmIXDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [FilmIXDatabase] SET  READ_WRITE 
GO

USE [FilmIXDatabase]
GO

/* Object:  Table [dbo].[Roli] */
create table Roli(
 RoliID int not null primary key,
 Lloji varchar(24) not null
 )
 
 /* Object:  Table [dbo].[Perdoruesi] */
 create table Perdoruesi(
   PerdoruesiID  int IDENTITY(1,1) Primary Key,
   Username varchar(25),
   Passwordi varchar(25),
   RoliID int FOREIGN KEY REFERENCES Roli(RoliID)
   )

   /* Object:  Table [dbo].[Zhanri] */
   create table Zhanri(
    ZhanriID int not null primary key,
	Lloji varchar(20)
	)

	/* Object:  Table [dbo].[Filmi] */
	create table Filmi(
	FilmiID int IDENTITY(1,1) Primary Key,
	EmriFilmit varchar(15),
	/*Pershkrimi varchar(300),*/
	ZhanriID int foreign key REFERENCES Zhanri(ZhanriID)
	)

	/* Object:  Table [dbo].[Sallat] */
	create table Sallat(
	SallaID int PRIMARY KEY, 
	EmriSalles varchar(20),
	KapacitetiUlseve int
   )

   /* Object:  Table [dbo].[Ulset] */
	create table Ulset(
	UlesejaID INT IDENTITY (1,1) PRIMARY KEY,
	EmriUlses varchar(50),
	SallaID int foreign key references Sallat(SallaID)
    )

	/* Object:  Table [dbo].[Streaming_Filmat] */
	create table Streaming_Filmat(
	StreamingFilmID int IDENTITY(1,1)PRIMARY KEY,
	FilmiID int foreign key references Filmi(FilmiID),
	Cmimi decimal,
	DataFilmit date,
	OraFillimit time,
	OraMbarimit time,
    )

	/* Object:  Table [dbo].[Ushqimi] */
	create table Ushqimi(
	UshqimiID int identity(1,1) PRIMARY KEY,
	EmriUshqimit varchar(20),
	Cmimi decimal
	)

  /* Object:  Table [dbo].[Klienti] */
	create table Klienti(
	KlientiID int identity(1,1) Primary KEY,
	EmriMbiemri varchar(40)

	)

	/* Object:  Table [dbo].[Bileta] */	
	create table Bileta(
	BiletaID int IDENTITY(1,1) PRIMARY KEY,
	StreamingFilmID int foreign key references Streaming_Filmat(StreamingFilmID),
	KlientiID int foreign key references Klienti(KlientiID),
	UshqimiID int foreign key references Ushqimi(UshqimiID) null,
	SallaID int foreign key references Sallat(SallaID),
	UlesejaID int foreign key references Ulset(UlesejaID)

	)
	/* Object:  Table [dbo].[MenyraPageses] */
	create table MenyraPageses(
		MenyraPagesesID int Primary Key,
		LlojiPageses varchar(10)
	)

	/* Object:  Table [dbo].[Pagesat] */
	create table Pagesat(
	PagesatID int identity(1,1) primary key,
	shuma decimal,
	BiletaID int foreign key references Bileta(BiletaID)

	)
	/* Object:  Table [dbo].[Ankesat] */
	create table Ankesat(
	AnkesaID int identity(1,1),
	DataAnkseses date null,
	Ankesa text null
	)
	
	/* Insert from Roli Table*/
	INSERT INTO Roli(RoliID, Lloji) VALUES(1, 'Admin');
    INSERT INTO Roli(RoliID, Lloji) VALUES(2, 'Punetor');

	/* Insert from Perdoruesi Table*/
	INSERT INTO Perdoruesi(Username, Passwordi, RoliID) VALUES('Arbese', 'Arbesa', 1); 
	INSERT INTO Perdoruesi(Username, Passwordi, RoliID) VALUES('Dren', 'Dreni', 2);

	SET IDENTITY_INSERT Zhanri ON;
	/* Insert from Zhanri Table*/
	INSERT INTO Zhanri(ZhanriID, Lloji) VALUES(1, 'Aksion');
	INSERT INTO Zhanri(ZhanriID, Lloji) VALUES(2, 'Drame');

	/* Insert from Filmi Table*/
	INSERT INTO Filmi(EmriFilmit, ZhanriID) VALUES('Second Act', 2); 
    INSERT INTO Filmi(EmriFilmit, ZhanriID) VALUES('Elite Squad', 1);

	/* Insert from Sallat Table*/
	INSERT INTO Sallat(SallaID, EmriSalles, KapacitetiUlseve) VALUES(101, '101', 100);
	INSERT INTO Sallat(SallaID, EmriSalles, KapacitetiUlseve) VALUES(103, '103', 102);

	SET IDENTITY_INSERT  Ulset ON;
	/* Insert from Ulset Table*/
	
	INSERT INTO Ulset(EmriUlses, SallaID) VALUES('A01', 103); 
	INSERT INTO Ulset(EmriUlses, SallaID) VALUES('A03', 101); 

	
	
	/* Insert from Streaming_Filmat Table*/
	INSERT INTO Streaming_Filmat(FilmiID, Cmimi, DataFilmit, OraFillimit, OraMbarimit) VALUES(1, 4.5, CAST(N'2020-07-03' AS Date), '13:00:00', '14:50:00');
	INSERT INTO Streaming_Filmat(FilmiID, Cmimi, DataFilmit, OraFillimit, OraMbarimit) VALUES(2, 4.5, CAST(N'2020-08-03' AS Date), '15:00:00', '16:50:00');


	/* Insert from Ushqimi Table*/
	INSERT INTO Ushqimi(EmriUshqimit, Cmimi) VALUES('Popcorn', 3.5);
	INSERT INTO Ushqimi(EmriUshqimit, Cmimi) VALUES('Pomfrits', 4.5);

	SET IDENTITY_INSERT Bileta ON;
	/* Insert from Klienti Table*/
	INSERT INTO Klienti(EmriMbiemri) VALUES('Arbese Musliu');
	INSERT INTO Klienti(EmriMbiemri) VALUES('Dren Bilalli');

    /* Insert from Bileta Table*/
	INSERT INTO Bileta(StreamingFilmID, KlientiID, UshqimiID, SallaID, UlesejaID) VALUES(1, 1, null, 103, 3);  
 	INSERT INTO Bileta(StreamingFilmID, KlientiID, UshqimiID, SallaID, UlesejaID) VALUES(2, 2, null, 103, 4);

	/* Insert from MenyraPageses Table*/
	INSERT INTO MenyraPageses(MenyraPagesesID, LlojiPageses) VALUES(1, 'Kesh');
	INSERT INTO MenyraPageses(MenyraPagesesID, LlojiPageses) VALUES(2, 'Karte');

	/* Insert from Pagesat Table*/
	INSERT INTO Pagesat(shuma, BiletaID) VALUES(25.5, 9);
	INSERT INTO Pagesat(shuma, BiletaID) VALUES(40.0, 12);

	/* Insert from Ankesat Table*/
	INSERT INTO Ankesat(DataAnkseses, Ankesa) VALUES(null, null); 



	


