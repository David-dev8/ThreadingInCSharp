USE [master]
GO
/****** Object:  Database [LifeThreadening]    Script Date: 31-3-2023 12:45:29 ******/
CREATE DATABASE [LifeThreadening]
 CONTAINMENT = NONE
GO
ALTER DATABASE [LifeThreadening] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LifeThreadening].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LifeThreadening] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LifeThreadening] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LifeThreadening] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LifeThreadening] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LifeThreadening] SET ARITHABORT OFF 
GO
ALTER DATABASE [LifeThreadening] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LifeThreadening] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LifeThreadening] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LifeThreadening] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LifeThreadening] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LifeThreadening] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LifeThreadening] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LifeThreadening] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LifeThreadening] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LifeThreadening] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LifeThreadening] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LifeThreadening] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LifeThreadening] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LifeThreadening] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LifeThreadening] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LifeThreadening] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LifeThreadening] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LifeThreadening] SET RECOVERY FULL 
GO
ALTER DATABASE [LifeThreadening] SET  MULTI_USER 
GO
ALTER DATABASE [LifeThreadening] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LifeThreadening] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LifeThreadening] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LifeThreadening] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LifeThreadening] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LifeThreadening] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LifeThreadening] SET QUERY_STORE = OFF
GO
USE [LifeThreadening]
GO
/****** Object:  Table [dbo].[Ecosystem]    Script Date: 31-3-2023 12:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ecosystem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[image] [varchar](255) NOT NULL,
	[difficulty] [float] NOT NULL,
 CONSTRAINT [PK__Ecosyste__3213E83FB7D2CB81] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EcosystemObstruction]    Script Date: 31-3-2023 12:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EcosystemObstruction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[obstructionId] [int] NOT NULL,
	[ecosystemId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EcosystemSpecies]    Script Date: 31-3-2023 12:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EcosystemSpecies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ecosystemId] [int] NOT NULL,
	[speciesId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EcosystemVegetation]    Script Date: 31-3-2023 12:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EcosystemVegetation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vegetationId] [int] NOT NULL,
	[ecosystemId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mutation]    Script Date: 31-3-2023 12:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mutation](
	[type] [varchar](20) NOT NULL,
	[allel] [varchar](255) NOT NULL,
	[proteinBefore] [varchar](255) NOT NULL,
	[proteinAfter] [varchar](255) NOT NULL,
	[simulationId] [int] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Mutation] PRIMARY KEY CLUSTERED 
(
	[allel] ASC,
	[simulationId] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MutationAffectedStatistic]    Script Date: 31-3-2023 12:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MutationAffectedStatistic](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statistic] [varchar](50) NOT NULL,
	[affection] [int] NOT NULL,
	[simulationId] [int] NOT NULL,
	[mutationDate] [date] NOT NULL,
	[mutationAllel] [varchar](255) NOT NULL,
	[color] [varchar](15) NOT NULL,
 CONSTRAINT [PK__Mutation__3213E83FCCD98323] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Obstruction]    Script Date: 31-3-2023 12:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Obstruction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Simulation]    Script Date: 31-3-2023 12:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Simulation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[score] [int] NOT NULL,
	[dateStarted] [date] NOT NULL,
	[dateEnded] [date] NULL,
	[ecosystemId] [int] NOT NULL,
	[amountOfDisasters] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[fileNameSaveSlot] [varchar](255) NULL,
 CONSTRAINT [PK__Simulati__3213E83FA83E309F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SimulationPopulation]    Script Date: 31-3-2023 12:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SimulationPopulation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[speciesId] [int] NOT NULL,
	[simulationId] [int] NOT NULL,
	[amountofAnimals] [int] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK__Simulati__3213E83FD703804C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Species]    Script Date: 31-3-2023 12:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Species](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](40) NOT NULL,
	[image] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[scientificName] [varchar](40) NOT NULL,
	[averageAge] [int] NOT NULL,
	[maxAge] [int] NOT NULL,
	[maxBreedSize] [int] NOT NULL,
	[minBreedSize] [int] NOT NULL,
	[diet] [varchar](20) NOT NULL,
	[aggression] [int] NOT NULL,
	[detection] [int] NOT NULL,
	[selfDefence] [int] NOT NULL,
	[intelligence] [int] NOT NULL,
	[metabolicRate] [int] NOT NULL,
	[resilience] [int] NOT NULL,
	[size] [int] NOT NULL,
	[weight] [int] NOT NULL,
	[speed] [int] NOT NULL,
 CONSTRAINT [PK__Species__3213E83F59B25FE3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vegetation]    Script Date: 31-3-2023 12:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vegetation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [varchar](255) NOT NULL,
	[growth] [int] NOT NULL,
	[maxNutrition] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ecosystem] ON 

INSERT [dbo].[Ecosystem] ([id], [name], [image], [difficulty]) VALUES (2, N'Savanna', N'/Assets/savanna.png', 1)
INSERT [dbo].[Ecosystem] ([id], [name], [image], [difficulty]) VALUES (4, N'Antartica', N'/Assets/antartica.png', 1)
INSERT [dbo].[Ecosystem] ([id], [name], [image], [difficulty]) VALUES (5, N'Amazon', N'/Assets/amazon.png', 1)
INSERT [dbo].[Ecosystem] ([id], [name], [image], [difficulty]) VALUES (6, N'Desert', N'/Assets/desert.png', 2)
INSERT [dbo].[Ecosystem] ([id], [name], [image], [difficulty]) VALUES (9, N'Mountains', N'/Assets/mountains.png', 2)
INSERT [dbo].[Ecosystem] ([id], [name], [image], [difficulty]) VALUES (10, N'Ocean', N'/Assets/ocean.png', 2)
SET IDENTITY_INSERT [dbo].[Ecosystem] OFF
GO
SET IDENTITY_INSERT [dbo].[EcosystemObstruction] ON 

INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (2, 1, 2)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (3, 2, 2)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (4, 4, 2)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (7, 1, 4)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (8, 2, 4)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (9, 4, 4)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (10, 1, 5)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (11, 2, 5)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (13, 3, 5)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (14, 4, 5)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (15, 1, 6)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (16, 2, 6)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (17, 4, 6)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (18, 1, 9)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (19, 2, 9)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (20, 3, 9)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (21, 4, 9)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (22, 5, 2)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (23, 5, 6)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (24, 6, 10)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (25, 7, 4)
INSERT [dbo].[EcosystemObstruction] ([id], [obstructionId], [ecosystemId]) VALUES (26, 1, 10)
SET IDENTITY_INSERT [dbo].[EcosystemObstruction] OFF
GO
SET IDENTITY_INSERT [dbo].[EcosystemSpecies] ON 

INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (4, 4, 20)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (5, 4, 21)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (6, 4, 8)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (7, 4, 9)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (8, 4, 17)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (9, 10, 17)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (10, 10, 18)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (11, 10, 19)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (12, 5, 22)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (13, 5, 23)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (14, 5, 7)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (15, 5, 11)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (16, 2, 3)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (17, 2, 4)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (18, 2, 16)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (19, 2, 10)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (20, 2, 15)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (21, 6, 22)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (22, 6, 23)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (23, 9, 13)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (24, 9, 15)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (25, 9, 12)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (26, 9, 1)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (27, 9, 8)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (28, 5, 2)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (29, 10, 24)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (30, 10, 25)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (31, 6, 16)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (32, 6, 4)
INSERT [dbo].[EcosystemSpecies] ([id], [ecosystemId], [speciesId]) VALUES (33, 6, 26)
SET IDENTITY_INSERT [dbo].[EcosystemSpecies] OFF
GO
SET IDENTITY_INSERT [dbo].[EcosystemVegetation] ON 

INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (6, 20, 2)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (7, 3, 2)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (8, 6, 2)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (9, 8, 2)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (10, 9, 2)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (11, 1, 5)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (12, 6, 5)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (13, 11, 5)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (14, 12, 5)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (15, 8, 6)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (17, 14, 6)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (20, 8, 6)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (22, 13, 6)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (23, 1, 9)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (24, 9, 9)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (25, 6, 9)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (26, 15, 9)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (27, 16, 10)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (28, 17, 10)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (29, 18, 10)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (30, 19, 10)
INSERT [dbo].[EcosystemVegetation] ([id], [vegetationId], [ecosystemId]) VALUES (31, 22, 4)
SET IDENTITY_INSERT [dbo].[EcosystemVegetation] OFF
GO
SET IDENTITY_INSERT [dbo].[Obstruction] ON 

INSERT [dbo].[Obstruction] ([id], [image]) VALUES (1, N'rock.png')
INSERT [dbo].[Obstruction] ([id], [image]) VALUES (2, N'water.png')
INSERT [dbo].[Obstruction] ([id], [image]) VALUES (3, N'wood.png')
INSERT [dbo].[Obstruction] ([id], [image]) VALUES (4, N'tent.png')
INSERT [dbo].[Obstruction] ([id], [image]) VALUES (5, N'desert_rock.png')
INSERT [dbo].[Obstruction] ([id], [image]) VALUES (6, N'island.png')
INSERT [dbo].[Obstruction] ([id], [image]) VALUES (7, N'ice.png')
SET IDENTITY_INSERT [dbo].[Obstruction] OFF
GO
SET IDENTITY_INSERT [dbo].[Species] ON 

INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (1, N'Fox', N'fox.png', N'Foxes, or reynards are well known for their ability to be intelligent', N'Vulpes vulpes', 4, 10, 5, 3, N'Carnivore', 20, 20, 20, 20, 20, 20, 20, 20, 50)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (2, N'Gorrila', N'gorilla202303301214044576.png', N'As a very strong animal, gorillas are very territorial.', N'Gorilla', 30, 38, 5, 2, N'Omnivore', 50, 60, 20, 75, 30, 30, 20, 30, 25)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (3, N'Giraffe ', N'giraffe202303301141437006.png', N'An animal walking with a strangely long neck', N'Giraffa camelopardalis', 25, 32, 3, 1, N'Herbivore', 10, 73, 20, 13, 20, 28, 90, 67, 25)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (4, N'Elephant ', N'elephant202303301208469201.png', N'A pure heavyweight with huge ears', N'Loxodonta', 60, 75, 5, 2, N'Herbivore', 20, 44, 50, 23, 36, 20, 60, 70, 24)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (7, N'Tiger', N'tiger202303301220285233.png', N'Very sharp and dangerous, you should stay away!', N'Panthera tigris', 10, 13, 5, 2, N'Carnivore', 52, 24, 55, 38, 30, 41, 14, 24, 71)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (8, N'Bear', N'bear202303301225102805.png', N'Not mean or malicious; they are very gentle and tolerant animals', N'Ursidae', 20, 25, 5, 2, N'Omnivore', 49, 27, 44, 28, 39, 48, 19, 63, 32)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (9, N'Wolf', N'wolf202303301229247831.png', N'Complex, highly intelligent animals who are caring, playful, and above all devoted to family', N'Canis lupus', 20, 25, 3, 1, N'Carnivore', 47, 18, 55, 50, 35, 35, 13, 18, 64)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (10, N'Hippo', N'hippo202303301238593498.png', N'A big animal with short legs and an enormous head', N'Hippopotamus amphibius', 51, 64, 5, 2, N'Herbivore', 46, 21, 47, 26, 35, 53, 22, 48, 25)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (11, N'Boar', N'boar202303301257267613.png', N'Very dangerous and aggressive animals, with little ears', N'Sus scrofa', 15, 19, 3, 1, N'Omnivore', 52, 14, 28, 33, 23, 27, 16, 37, 24)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (12, N'Hedgehog', N'hedgehog202303301300139298.png', N'A little brown animal, which is very spiky', N'Erinaceinae', 6, 8, 3, 1, N'Omnivore', 9, 7, 2, 59, 21, 8, 6, 6, 5)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (13, N'Skunk', N'skunk202303301302497748.png', N'Run for your live, to protect your nose!', N'Mephitidae', 11, 14, 6, 2, N'Omnivore', 29, 6, 5, 60, 15, 13, 7, 3, 4)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (14, N'Rhino', N'rhino202303301306222599.png', N'This grey species van storm like a battering ram', N'Rhinocerotidae', 49, 62, 3, 1, N'Herbivore', 47, 25, 59, 37, 34, 36, 31, 54, 24)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (15, N'Koala', N'koala202303301309331517.png', N'A cute koala bear', N'Phascolarctos cinereus', 21, 27, 6, 2, N'Herbivore', 13, 16, 4, 39, 15, 13, 18, 9, 14)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (16, N'Lion', N'lion202303301311577213.png', N'The king of all animals has arrived, with sharp teeth', N'Panthera leo', 17, 22, 3, 1, N'Carnivore', 55, 15, 51, 21, 49, 51, 18, 16, 71)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (17, N'Dolphin', N'dolphin202303301332554319.png', N'People say dolphins are one of the most intelligent species', N'Delphinus', 21, 27, 5, 2, N'Carnivore', 16, 27, 22, 100, 20, 37, 22, 20, 72)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (18, N'Orca', N'orca202303301335005291.png', N'Like a whale, but with a cool skin', N'Orcinus orca', 34, 43, 3, 1, N'Carnivore', 48, 22, 24, 68, 27, 24, 27, 36, 68)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (19, N'Shark', N'shark202303301337068504.png', N'Tearing apart its prey', N'Selachimorpha', 20, 25, 2, 1, N'Carnivore', 55, 29, 60, 21, 32, 29, 32, 38, 47)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (20, N'Walrus', N'walrus202303301342062924.png', N'Hunting for fresh meat, as it is searching for pray', N'Odobenus rosmarus', 29, 37, 2, 1, N'Carnivore', 23, 21, 61, 28, 33, 40, 12, 60, 20)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (21, N'Pengiun', N'pengiun202303301344508342.png', N'Diving like a professional diver and hunting for fresh fish', N'Spheniscidae', 16, 20, 2, 1, N'Carnivore', 20, 18, 15, 10, 7, 20, 12, 14, 7)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (22, N'Spider', N'spider202303301355080422.png', N'People with arochnofobia: stay away. It, however, is not as harmful.', N'Araneae', 8, 10, 2, 1, N'Carnivore', 45, 18, 17, 15, 20, 15, 1, 1, 1)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (23, N'Snake', N'snake202303301400241222.png', N'Very dangerous, especially because of its potential poison', N'Serpentes', 16, 20, 2, 1, N'Carnivore', 54, 33, 43, 25, 21, 37, 19, 4, 31)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (24, N'Turtle', N'turtle202303301823454596.png', N'Has turned its slowness into its strength', N'Testudines', 56, 70, 2, 1, N'Omnivore', 8, 8, 52, 21, 9, 28, 11, 7, 16)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (25, N'Octopus', N'octopus202303301827112139.png', N'With 8 tentacles a true multitasker', N'Octopoda', 31, 39, 2, 1, N'Carnivore', 14, 6, 5, 45, 4, 7, 8, 8, 7)
INSERT [dbo].[Species] ([id], [name], [image], [description], [scientificName], [averageAge], [maxAge], [maxBreedSize], [minBreedSize], [diet], [aggression], [detection], [selfDefence], [intelligence], [metabolicRate], [resilience], [size], [weight], [speed]) VALUES (26, N'Camel', N'camel202303301831175348.png', N'No, this is not a dromedary, it is a camel', N'Camelus', 56, 70, 2, 1, N'Herbivore', 13, 19, 15, 30, 64, 47, 26, 12, 10)
SET IDENTITY_INSERT [dbo].[Species] OFF
GO
SET IDENTITY_INSERT [dbo].[Vegetation] ON 

INSERT [dbo].[Vegetation] ([id], [image], [growth], [maxNutrition]) VALUES (1, N'tree.png', 2, 2)
INSERT [dbo].[Vegetation] ([id], [image], [growth], [maxNutrition]) VALUES (3, N'mais.png', 2, 2)
INSERT [dbo].[Vegetation] ([id], [image], [growth], [maxNutrition]) VALUES (6, N'leaf.png', 2, 2)
INSERT [dbo].[Vegetation] ([id], [image], [growth], [maxNutrition]) VALUES (8, N'cactus.png', 2, 2)
INSERT [dbo].[Vegetation] ([id], [image], [growth], [maxNutrition]) VALUES (9, N'desert_pant.png', 2, 2)
INSERT [dbo].[Vegetation] ([id], [image], [growth], [maxNutrition]) VALUES (11, N'jungle_plant.png', 2, 2)
INSERT [dbo].[Vegetation] ([id], [image], [growth], [maxNutrition]) VALUES (12, N'jungle_tree.png', 2, 2)
INSERT [dbo].[Vegetation] ([id], [image], [growth], [maxNutrition]) VALUES (13, N'desert_grass.png', 2, 2)
INSERT [dbo].[Vegetation] ([id], [image], [growth], [maxNutrition]) VALUES (14, N'palm_tree.png', 2, 2)
INSERT [dbo].[Vegetation] ([id], [image], [growth], [maxNutrition]) VALUES (15, N'pine.png', 2, 2)
INSERT [dbo].[Vegetation] ([id], [image], [growth], [maxNutrition]) VALUES (16, N'seaweed.png', 2, 2)
INSERT [dbo].[Vegetation] ([id], [image], [growth], [maxNutrition]) VALUES (17, N'seaweed_2.png', 2, 2)
INSERT [dbo].[Vegetation] ([id], [image], [growth], [maxNutrition]) VALUES (18, N'star.png', 2, 2)
INSERT [dbo].[Vegetation] ([id], [image], [growth], [maxNutrition]) VALUES (19, N'scallop.png', 2, 2)
INSERT [dbo].[Vegetation] ([id], [image], [growth], [maxNutrition]) VALUES (20, N'savanna_tree.png', 2, 2)
INSERT [dbo].[Vegetation] ([id], [image], [growth], [maxNutrition]) VALUES (22, N'wild_grass.png', 2, 2)
SET IDENTITY_INSERT [dbo].[Vegetation] OFF
GO
ALTER TABLE [dbo].[Simulation] ADD  CONSTRAINT [DF_Simulation_score]  DEFAULT ((0)) FOR [score]
GO
ALTER TABLE [dbo].[Simulation] ADD  CONSTRAINT [DF_Simulation_amountOfDisasters]  DEFAULT ((0)) FOR [amountOfDisasters]
GO
ALTER TABLE [dbo].[EcosystemObstruction]  WITH CHECK ADD  CONSTRAINT [FK_EcosystemObstruction_Ecosystem] FOREIGN KEY([ecosystemId])
REFERENCES [dbo].[Ecosystem] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EcosystemObstruction] CHECK CONSTRAINT [FK_EcosystemObstruction_Ecosystem]
GO
ALTER TABLE [dbo].[EcosystemObstruction]  WITH CHECK ADD  CONSTRAINT [FK_EcosystemObstruction_Obstruction] FOREIGN KEY([obstructionId])
REFERENCES [dbo].[Obstruction] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EcosystemObstruction] CHECK CONSTRAINT [FK_EcosystemObstruction_Obstruction]
GO
ALTER TABLE [dbo].[EcosystemSpecies]  WITH CHECK ADD  CONSTRAINT [FK_EcosystemSpecies_Ecosystem] FOREIGN KEY([ecosystemId])
REFERENCES [dbo].[Ecosystem] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EcosystemSpecies] CHECK CONSTRAINT [FK_EcosystemSpecies_Ecosystem]
GO
ALTER TABLE [dbo].[EcosystemSpecies]  WITH CHECK ADD  CONSTRAINT [FK_EcosystemSpecies_Species] FOREIGN KEY([speciesId])
REFERENCES [dbo].[Species] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EcosystemSpecies] CHECK CONSTRAINT [FK_EcosystemSpecies_Species]
GO
ALTER TABLE [dbo].[EcosystemVegetation]  WITH CHECK ADD  CONSTRAINT [FK_EcosystemVegetation_Ecosystem] FOREIGN KEY([ecosystemId])
REFERENCES [dbo].[Ecosystem] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EcosystemVegetation] CHECK CONSTRAINT [FK_EcosystemVegetation_Ecosystem]
GO
ALTER TABLE [dbo].[EcosystemVegetation]  WITH CHECK ADD  CONSTRAINT [FK_EcosystemVegetation_Vegetation] FOREIGN KEY([vegetationId])
REFERENCES [dbo].[Vegetation] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EcosystemVegetation] CHECK CONSTRAINT [FK_EcosystemVegetation_Vegetation]
GO
ALTER TABLE [dbo].[Mutation]  WITH NOCHECK ADD  CONSTRAINT [FK_Mutation_SimulationPopulationId] FOREIGN KEY([simulationId])
REFERENCES [dbo].[Simulation] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Mutation] CHECK CONSTRAINT [FK_Mutation_SimulationPopulationId]
GO
ALTER TABLE [dbo].[MutationAffectedStatistic]  WITH NOCHECK ADD  CONSTRAINT [FK_MutationAffectedStatistic_Mutation] FOREIGN KEY([mutationAllel], [simulationId], [mutationDate])
REFERENCES [dbo].[Mutation] ([allel], [simulationId], [date])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MutationAffectedStatistic] CHECK CONSTRAINT [FK_MutationAffectedStatistic_Mutation]
GO
ALTER TABLE [dbo].[Simulation]  WITH CHECK ADD  CONSTRAINT [FK_Simulation_Ecosystem] FOREIGN KEY([ecosystemId])
REFERENCES [dbo].[Ecosystem] ([id])
GO
ALTER TABLE [dbo].[Simulation] CHECK CONSTRAINT [FK_Simulation_Ecosystem]
GO
ALTER TABLE [dbo].[SimulationPopulation]  WITH NOCHECK ADD  CONSTRAINT [FK_SimulationPopulation_Simulation] FOREIGN KEY([simulationId])
REFERENCES [dbo].[Simulation] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SimulationPopulation] CHECK CONSTRAINT [FK_SimulationPopulation_Simulation]
GO
ALTER TABLE [dbo].[SimulationPopulation]  WITH NOCHECK ADD  CONSTRAINT [FK_SimulationPopulation_Species] FOREIGN KEY([speciesId])
REFERENCES [dbo].[Species] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SimulationPopulation] CHECK CONSTRAINT [FK_SimulationPopulation_Species]
GO
USE [master]
GO
ALTER DATABASE [LifeThreadening] SET  READ_WRITE 
GO
