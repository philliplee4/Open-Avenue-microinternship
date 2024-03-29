/****** Object:  Table [dbo].[BuildVersion]    Script Date: 3/21/2024 8:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildVersion](
	[SystemInformationID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Database Version] [nvarchar](25) NOT NULL,
	[VersionDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SystemInformationID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 3/21/2024 8:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ErrorLogID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorTime] [datetime] NOT NULL,
	[UserName] [sysname] NOT NULL,
	[ErrorNumber] [int] NOT NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorProcedure] [nvarchar](126) NULL,
	[ErrorLine] [int] NULL,
	[ErrorMessage] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_ErrorLog_ErrorLogID] PRIMARY KEY CLUSTERED 
(
	[ErrorLogID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 3/21/2024 8:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital](
	[HospitalId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[OpeningDate] [date] NOT NULL,
	[HospitalTypeId] [int] NOT NULL,
	[ContactPhone] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Hospital] PRIMARY KEY CLUSTERED 
(
	[HospitalId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalType]    Script Date: 3/21/2024 8:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalType](
	[HospitalTypeId] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_HospitalType] PRIMARY KEY CLUSTERED 
(
	[HospitalTypeId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalCaregiver]    Script Date: 3/21/2024 8:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalCaregiver](
	[CaregiverId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[ContactInfo] [varchar](100) NOT NULL,
	[CaregiverTypeId] [int] NOT NULL,
 CONSTRAINT [PK_MedicalCaregiver] PRIMARY KEY CLUSTERED 
(
	[CaregiverId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalCaregiverType]    Script Date: 3/21/2024 8:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalCaregiverType](
	[CaregiverTypeId] [int] NOT NULL,
	[TypeName] [varchar](255) NOT NULL,
 CONSTRAINT [PK_MedcialCaregiverType] PRIMARY KEY CLUSTERED 
(
	[CaregiverTypeId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalTransaction]    Script Date: 3/21/2024 8:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalTransaction](
	[MedicalTransactionId] [int] IDENTITY(1,1) NOT NULL,
	[RxNumber] [int] NOT NULL,
	[DateFilled] [date] NOT NULL,
	[NDC] [varchar](50) NOT NULL,
	[DaysSupply] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[TotalCost] [decimal](10, 2) NULL,
	[TransactionFee] [decimal](10, 2) NULL,
	[CopayAmount] [decimal](10, 2) NULL,
	[PayerName] [varchar](100) NULL,
	[NurseId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
 CONSTRAINT [PK_MedicalTransaction] PRIMARY KEY CLUSTERED 
(
	[MedicalTransactionId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 3/21/2024 8:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](255) NOT NULL,
	[lastName] [varchar](255) NOT NULL,
	[gender] [varchar](10) NOT NULL,
	[age] [int] NOT NULL,
	[HospitalId] [int] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientEvent]    Script Date: 3/21/2024 8:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientEvent](
	[PatientEventId] [int] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[PatientId] [int] NOT NULL,
	[NurseId] [int] NOT NULL,
	[Description] [varchar](500) NOT NULL,
 CONSTRAINT [PK_PatientEvent] PRIMARY KEY CLUSTERED 
(
	[PatientEventId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BuildVersion] ADD  CONSTRAINT [DF_BuildVersion_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [DF_ErrorLog_ErrorTime]  DEFAULT (getdate()) FOR [ErrorTime]
GO
ALTER TABLE [dbo].[Hospital]  WITH CHECK ADD FOREIGN KEY([HospitalTypeId])
REFERENCES [dbo].[HospitalType] ([HospitalTypeId])
GO
ALTER TABLE [dbo].[MedicalCaregiver]  WITH CHECK ADD FOREIGN KEY([CaregiverTypeId])
REFERENCES [dbo].[MedicalCaregiverType] ([CaregiverTypeId])
GO
ALTER TABLE [dbo].[MedicalTransaction]  WITH CHECK ADD FOREIGN KEY([DoctorId])
REFERENCES [dbo].[MedicalCaregiver] ([CaregiverId])
GO
ALTER TABLE [dbo].[MedicalTransaction]  WITH CHECK ADD FOREIGN KEY([NurseId])
REFERENCES [dbo].[MedicalCaregiver] ([CaregiverId])
GO
ALTER TABLE [dbo].[MedicalTransaction]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD FOREIGN KEY([HospitalId])
REFERENCES [dbo].[Hospital] ([HospitalId])
GO
ALTER TABLE [dbo].[PatientEvent]  WITH CHECK ADD FOREIGN KEY([NurseId])
REFERENCES [dbo].[MedicalCaregiver] ([CaregiverId])
GO
ALTER TABLE [dbo].[PatientEvent]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
