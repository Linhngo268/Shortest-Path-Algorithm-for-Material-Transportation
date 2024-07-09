USE [master]
GO
/****** Object:  Database [path1db]    Script Date: 24/09/2023 8:04:00 PM ******/
CREATE DATABASE [path1db]
GO
ALTER DATABASE [path1db] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [path1db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [path1db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [path1db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [path1db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [path1db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [path1db] SET ARITHABORT OFF 
GO
ALTER DATABASE [path1db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [path1db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [path1db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [path1db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [path1db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [path1db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [path1db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [path1db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [path1db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [path1db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [path1db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [path1db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [path1db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [path1db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [path1db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [path1db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [path1db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [path1db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [path1db] SET  MULTI_USER 
GO
ALTER DATABASE [path1db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [path1db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [path1db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [path1db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [path1db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [path1db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [path1db] SET QUERY_STORE = ON
GO
ALTER DATABASE [path1db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [path1db]
GO
/****** Object:  Table [dbo].[Edges]    Script Date: 24/09/2023 8:04:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Edges](
	[edge_id] [int] IDENTITY(0,1) NOT NULL,
	[cost] [int] NULL,
	[edge_status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[edge_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
)
AS EDGE ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nodes]    Script Date: 24/09/2023 8:04:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nodes](
	[node_id] [int] IDENTITY(0,1) NOT NULL,
	[node_name] [varchar](50) NOT NULL,
	[is_source] [bit] NOT NULL,
	[is_destination] [bit] NOT NULL,
	[node_status] [bit] NOT NULL,
	[cost] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[node_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
)
AS NODE ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Results](
	[index] [int] NOT NULL,
	[sourceNode] [varchar](50) NOT NULL,
	[targetNode] [varchar](50) NOT NULL,
	[totalCostWithNodeCost] [int] NULL,
	[nodeNames] [text] NULL,
	[costs] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[index] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[source_data]    Script Date: 24/09/2023 8:04:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[source_data](
	[Plant Item] [varchar](255) NULL,
	[Is Source] [bit] NOT NULL,
	[Is Destination] [bit] NOT NULL,
	[Connect from] [varchar](255) NULL,
	[Connect to] [varchar](255) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CLEAN101', 0, 0, N'ELEVATOR_SWICTH_1', N'DISTRIBUTOR1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CLEAN102', 0, 0, N'ELEVATOR_SWICTH_2', N'DISTRIBUTOR2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CLEAN103', 0, 0, N'ELEVATOR_SWICTH_3', N'SCREEN2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CLEAN104', 0, 0, N'ELEVATOR_SWICTH_4', N'DIVERTER3')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'PRESSURE106', 0, 0, N'SOURCE_6', N'CONVEYOR6')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'PRESSURE107', 0, 0, N'SOURCE_7', N'CONVEYOR7')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'PRESSURE108', 0, 0, N'SOURCE_8', N'DIVERTER8')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CALIBRATE111', 0, 0, N'FLOW6', N'PVC')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CALIBRATE111', 0, 0, N'SOURCE_11', N'PVC')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CONVEYOR1', 0, 0, N'SOURCE_1', N'LINK1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CONVEYOR2', 0, 0, N'LINK1', N'WEIGHT2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'WEIGHT2', 0, 0, N'CONVEYOR2', N'SEPARATOR2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'PROCESSOR2', 0, 0, N'DRIVE2', N'SPLITTER1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CONVEYOR3', 0, 0, N'LINK2', N'WEIGHT3')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'WEIGHT3', 0, 0, N'CONVEYOR3', N'SEPARATOR3')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'PROCESSOR3', 0, 0, N'SEPARATOR3', N'DIVERTER7')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CONVEYOR4', 0, 0, N'DISTRIBUTOR2', N'PRESS1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CONVEYOR4', 0, 0, N'DISTRIBUTOR1', N'PRESS1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CONVEYOR5', 0, 0, N'DISTRIBUTOR1', N'PRESS1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CONVEYOR5', 0, 0, N'DISTRIBUTOR2', N'PRESS1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CONVEYOR6', 0, 0, N'PRESSURE106', N'WEIGHT6')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CONVEYOR6', 0, 0, N'DIVERTER8', N'WEIGHT6')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'WEIGHT6', 0, 0, N'CONVEYOR6', N'DUST6')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DUST6', 0, 0, N'WEIGHT6', N'PROCESSOR6')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'PROCESSOR6', 0, 0, N'DUST6', N'DIVERTER1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CONVEYOR7', 0, 0, N'PRESSURE107', N'WEIGHT7')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'WEIGHT7', 0, 0, N'CONVEYOR7', N'DUST7')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DUST7', 0, 0, N'WEIGHT7', N'PROCESSOR7')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'PROCESSOR7', 0, 0, N'DUST7', N'DIVERTER2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CONVEYOR8', 0, 0, N'MAIN_WEIGHTER2', N'WEIGHT8')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'WEIGHT8', 0, 0, N'CONVEYOR8', N'CONVEYOR9')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CONVEYOR9', 0, 0, N'WEIGHT8', N'SEPARATOR1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CONVEYOR10', 0, 0, N'DRIVE1', N'WEIGHT10')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'WEIGHT10', 0, 0, N'CONVEYOR10', N'CONVEYOR11')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CONVEYOR11', 0, 0, N'WEIGHT10', N'LINK6')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CONVEYOR12', 0, 0, N'LINK8', N'WEIGHT12')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'WEIGHT12', 0, 0, N'CONVEYOR12', N'DEST_LOAD')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CONVEYOR14', 0, 0, N'DIVERTER8', N'WEIGHT14')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'WEIGHT14', 0, 0, N'CONVEYOR14', N'LINK5')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DEST1', 0, 1, N'DISTRIBUTOR2', NULL)
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DEST1', 0, 1, N'DISTRIBUTOR1', NULL)
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DEST6', 0, 1, N'DISTRIBUTOR2', NULL)
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DEST6', 0, 1, N'DISTRIBUTOR1', NULL)
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DEST11', 0, 1, N'PVC', NULL)
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DEST_CLEAN', 0, 1, N'LINK6', NULL)
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DEST4', 0, 1, N'TRIPPER1', NULL)
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DEST5', 0, 1, N'TRIPPER2', NULL)
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DEST14', 0, 1, N'CHUTE1', NULL)
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DEST_LOAD', 0, 1, N'WEIGHT12', NULL)
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DEST_WEIGH', 0, 1, N'SCREEN1', NULL)
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DEST_WEIGH', 0, 1, N'SCREEN2', NULL)
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK1', 0, 0, N'CONVEYOR1', N'CONVEYOR2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK2', 0, 0, N'SOURCE_3', N'CONVEYOR3')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK3', 0, 0, N'DIVERTER7', N'ELEVATOR2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK3', 0, 0, N'DIVERTER7', N'ELEVATOR1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK3', 0, 0, N'SPLITTER1', N'SPLITTER1A')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK3', 0, 0, N'SPLITTER1', N'SPLITTER1B')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK3', 0, 0, N'DIVERTER3', N'ELEVATOR1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK3', 0, 0, N'SPLITTER2', N'SPLITTER2A')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK3', 0, 0, N'SPLITTER2', N'SPLITTER2B')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK3', 0, 0, N'SPLITTER3', N'SPLITTER3A')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK3', 0, 0, N'SPLITTER3', N'SPLITTER3B')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK4', 0, 0, N'SPLITTER4', N'SPLITTER4A')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK4', 0, 0, N'SPLITTER4', N'SPLITTER4B')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK4', 0, 0, N'SPLITTER5', N'SPLITTER5A')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK4', 0, 0, N'SPLITTER5', N'SPLITTER3B')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK5', 0, 0, N'WEIGHT14', N'CHUTE1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK6', 0, 0, N'CONVEYOR11', N'LOAD1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK6', 0, 0, N'CONVEYOR11', N'DEST_CLEAN')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK7', 0, 0, N'LOAD1', N'LINK8')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LINK8', 0, 0, N'LINK7', N'CONVEYOR12')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DIVERTER1', 0, 0, N'PROCESSOR6', N'SPLITTER4')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DIVERTER1', 0, 0, N'PROCESSOR6', N'SPLITTER2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DIVERTER2', 0, 0, N'PROCESSOR7', N'SPLITTER3')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DIVERTER2', 0, 0, N'PROCESSOR7', N'SPLITTER5')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DIVERTER3', 0, 0, N'CLEAN104', N'LINK3')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DIVERTER3', 0, 0, N'CLEAN104', N'SCREEN1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DIVERTER6', 0, 0, N'FLOW5', N'MAIN_WEIGHTER2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DIVERTER7', 0, 0, N'PROCESSOR3', N'LINK3')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DIVERTER8', 0, 0, N'PRESSURE108', N'CONVEYOR14')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DIVERTER8', 0, 0, N'PRESSURE108', N'CONVEYOR6')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR_PATH_1', 0, 0, N'ELEVATOR1', N'ELEVATOR_SWICTH_1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR_PATH_2', 0, 0, N'ELEVATOR2', N'ELEVATOR_SWICTH_2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR_PATH_3', 0, 0, N'ELEVATOR3', N'ELEVATOR_SWICTH_3')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR_PATH_4', 0, 0, N'ELEVATOR4', N'ELEVATOR_SWICTH_4')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR1', 0, 0, N'LINK3', N'ELEVATOR_PATH_1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR1', 0, 0, N'SPLITTER1B', N'ELEVATOR_PATH_1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR1', 0, 0, N'SPLITTER2A', N'ELEVATOR_PATH_1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR1', 0, 0, N'SPLITTER3A', N'ELEVATOR_PATH_1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR_SWICTH_1', 0, 0, N'ELEVATOR_PATH_1', N'CLEAN101')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR2', 0, 0, N'LINK3', N'ELEVATOR_PATH_2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR2', 0, 0, N'SPLITTER1A', N'ELEVATOR_PATH_2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR2', 0, 0, N'SPLITTER2B', N'ELEVATOR_PATH_2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR2', 0, 0, N'SPLITTER3B', N'ELEVATOR_PATH_2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR_SWICTH_2', 0, 0, N'ELEVATOR_PATH_2', N'CLEAN102')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR3', 0, 0, N'SPLITTER4A', N'ELEVATOR_PATH_3')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR3', 0, 0, N'SPLITTER5A', N'ELEVATOR_PATH_3')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR_SWICTH_3', 0, 0, N'ELEVATOR_PATH_3', N'CLEAN103')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR4', 0, 0, N'FLOW7', N'ELEVATOR_PATH_4')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR4', 0, 0, N'SPLITTER4B', N'ELEVATOR_PATH_4')
GO
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR4', 0, 0, N'SPLITTER3B', N'ELEVATOR_PATH_4')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'ELEVATOR_SWICTH_4', 0, 0, N'ELEVATOR_PATH_4', N'CLEAN104')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'FLOW5', 0, 0, N'MAIN_WEIGHTER1', N'DIVERTER6')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'FLOW6', 0, 0, N'MAIN_WEIGHTER2', N'CALIBRATE111')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'FLOW7', 0, 0, N'PVC', N'ELEVATOR4')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'PRESS1', 0, 0, N'CONVEYOR5', N'TRIPPER2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'PRESS1', 0, 0, N'CONVEYOR4', N'TRIPPER1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'CHUTE1', 0, 0, N'LINK5', N'DEST14')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SEPARATOR1', 0, 0, N'CONVEYOR9', N'DRIVE1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SEPARATOR2', 0, 0, N'WEIGHT2', N'DRIVE2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SEPARATOR3', 0, 0, N'WEIGHT3', N'DRIVE3')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DRIVE1', 0, 0, N'SEPARATOR1', N'CONVEYOR10')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DRIVE2', 0, 0, N'SEPARATOR2', N'PROCESSOR2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DRIVE3', 0, 0, N'SEPARATOR3', N'PROCESSOR3')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'PVC', 0, 0, N'CALIBRATE111', N'DEST11')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'PVC', 0, 0, N'CALIBRATE111', N'FLOW7')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DISTRIBUTOR1', 0, 0, N'CLEAN101', N'DEST6')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DISTRIBUTOR1', 0, 0, N'CLEAN101', N'CONVEYOR5')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DISTRIBUTOR1', 0, 0, N'CLEAN101', N'DEST1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DISTRIBUTOR1', 0, 0, N'CLEAN101', N'CONVEYOR4')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DISTRIBUTOR2', 0, 0, N'CLEAN102', N'DEST6')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DISTRIBUTOR2', 0, 0, N'CLEAN102', N'CONVEYOR5')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DISTRIBUTOR2', 0, 0, N'CLEAN102', N'DEST1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'DISTRIBUTOR2', 0, 0, N'CLEAN102', N'CONVEYOR4')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SCREEN1', 0, 0, N'DIVERTER3', N'DEST_WEIGH')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SCREEN1', 0, 0, N'DIVERTER3', N'MAIN_WEIGHTER1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SCREEN2', 0, 0, N'CLEAN103', N'MAIN_WEIGHTER1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SCREEN2', 0, 0, N'CLEAN103', N'DEST_WEIGH')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'LOAD1', 0, 0, N'LINK6', N'LINK7')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SOURCE_11', 1, 0, NULL, N'CALIBRATE111')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SOURCE_1', 1, 0, NULL, N'CONVEYOR1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SOURCE_3', 1, 0, NULL, N'LINK2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SOURCE_6', 1, 0, NULL, N'PRESSURE106')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SOURCE_7', 1, 0, NULL, N'PRESSURE107')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SOURCE_8', 1, 0, NULL, N'PRESSURE108')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SOURCE_WEIGH', 1, 0, NULL, N'MAIN_WEIGHTER1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SPLITTER1', 0, 0, N'PROCESSOR2', N'LINK3')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SPLITTER1A', 0, 0, N'LINK3', N'ELEVATOR2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SPLITTER1B', 0, 0, N'LINK3', N'ELEVATOR1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SPLITTER2', 0, 0, N'DIVERTER1', N'LINK3')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SPLITTER2A', 0, 0, N'LINK3', N'ELEVATOR1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SPLITTER2B', 0, 0, N'LINK3', N'ELEVATOR2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SPLITTER3', 0, 0, N'DIVERTER2', N'LINK3')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SPLITTER3A', 0, 0, N'LINK3', N'ELEVATOR1')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SPLITTER3B', 0, 0, N'LINK3', N'ELEVATOR2')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SPLITTER3B', 0, 0, N'LINK4', N'ELEVATOR4')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SPLITTER4', 0, 0, N'DIVERTER1', N'LINK4')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SPLITTER4A', 0, 0, N'LINK4', N'ELEVATOR3')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SPLITTER4B', 0, 0, N'LINK4', N'ELEVATOR4')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SPLITTER5', 0, 0, N'DIVERTER2', N'LINK4')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'SPLITTER5A', 0, 0, N'LINK4', N'ELEVATOR3')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'TRIPPER1', 0, 0, N'PRESS1', N'DEST4')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'TRIPPER2', 0, 0, N'PRESS1', N'DEST5')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'MAIN_WEIGHTER1', 0, 0, N'SCREEN2', N'FLOW5')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'MAIN_WEIGHTER1', 0, 0, N'SCREEN1', N'FLOW5')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'MAIN_WEIGHTER1', 0, 0, N'SOURCE_WEIGH', N'FLOW5')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'MAIN_WEIGHTER2', 0, 0, N'DIVERTER6', N'FLOW6')
INSERT [dbo].[source_data] ([Plant Item], [Is Source], [Is Destination], [Connect from], [Connect to]) VALUES (N'MAIN_WEIGHTER2', 0, 0, N'DIVERTER6', N'CONVEYOR8')
GO
/****** Object:  Index [GRAPH_UNIQUE_INDEX_7C7B06D0A69547CEA5C04D74105DB37B]    Script Date: 24/09/2023 8:04:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [GRAPH_UNIQUE_INDEX_7C7B06D0A69547CEA5C04D74105DB37B] ON [dbo].[Edges]
(
	$edge_id
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [GRAPH_UNIQUE_INDEX_F0DF9E84B5B6466CA2F08A3DFF7A5AC3]    Script Date: 24/09/2023 8:04:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [GRAPH_UNIQUE_INDEX_F0DF9E84B5B6466CA2F08A3DFF7A5AC3] ON [dbo].[Nodes]
(
	$node_id
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Edges] ADD  DEFAULT ((1)) FOR [cost]
GO
ALTER TABLE [dbo].[Edges] ADD  DEFAULT ((1)) FOR [edge_status]
GO
ALTER TABLE [dbo].[Nodes] ADD  DEFAULT ((0)) FOR [is_source]
GO
ALTER TABLE [dbo].[Nodes] ADD  DEFAULT ((0)) FOR [is_destination]
GO
ALTER TABLE [dbo].[Nodes] ADD  DEFAULT ((1)) FOR [node_status]
GO
ALTER TABLE [dbo].[Nodes] ADD  DEFAULT ((1)) FOR [cost]
GO

with DeduplicatedData as (
	select 
		[Plant Item],
		[Is Source],
		[Is Destination],
		ROW_NUMBER() over (partition by [Plant Item] order by (select 0)) as rn 
	from source_data
)


insert into nodes (node_name, is_source, is_destination) 
select
	[Plant Item],
	[Is Source], 
	[Is Destination]
from 
	DeduplicatedData
where rn = 1;

insert into Edges ($from_id, $to_id)
select 
	n1.$node_id as from_id,
	n2.$node_id as to_id
from
	source_data s
	join Nodes n1 on s.[Plant Item] = n1.node_name
	join Nodes n2 on s.[Connect to] = n2.node_name

USE [master]
GO
ALTER DATABASE [path1db] SET  READ_WRITE 
GO
