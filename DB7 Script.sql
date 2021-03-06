USE [DB7]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 13-Apr-19 3:03:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[DepartmentId] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](10) NOT NULL,
	[Designation] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 13-Apr-19 3:03:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 13-Apr-19 3:03:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Designation] [nvarchar](50) NOT NULL,
	[Salary] [decimal](30, 0) NULL,
	[HireDate] [datetime] NOT NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[ContactNo] [nvarchar](24) NULL,
	[AccountNo] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[BirthDate] [datetime] NULL,
	[Gender] [nchar](1) NOT NULL,
	[ProvidentFundOpted] [nchar](1) NOT NULL,
	[ProvidentFundAmount] [nvarchar](50) NULL,
	[ProvidentFundPercentage] [real] NULL,
	[DepartmentId] [int] NOT NULL,
	[ProvidentFundOptedDate] [datetime] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Installment]    Script Date: 13-Apr-19 3:03:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Installment](
	[InstallmentId] [int] IDENTITY(1,1) NOT NULL,
	[LoanId] [int] NOT NULL,
	[InstallmentsNo] [int] NULL,
	[InstallmentDate] [datetime] NULL,
 CONSTRAINT [PK_Installment] PRIMARY KEY CLUSTERED 
(
	[InstallmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanApply]    Script Date: 13-Apr-19 3:03:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanApply](
	[LoanApplyId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[LoanCategory] [int] NOT NULL,
	[LoanMoney] [decimal](18, 0) NOT NULL,
	[NoOfInstallments] [int] NOT NULL,
	[InstallmentStartDate] [datetime] NULL,
	[InstallmentEndDate] [datetime] NULL,
	[Template] [image] NOT NULL,
	[RequestDate] [datetime] NOT NULL,
	[LoanAgreement] [image] NOT NULL,
 CONSTRAINT [PK_LoanApply] PRIMARY KEY CLUSTERED 
(
	[LoanApplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanCategory]    Script Date: 13-Apr-19 3:03:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanCategory](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoanCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanDocumentVerify]    Script Date: 13-Apr-19 3:03:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanDocumentVerify](
	[LoanId] [int] NOT NULL,
	[PropertyDocument] [image] NULL,
	[AutomobileDocument] [image] NULL,
	[IsDefaulter] [nchar](1) NULL,
	[Reason] [nvarchar](max) NULL,
	[Status] [nchar](10) NULL,
	[SubmissionDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanRequestStatus]    Script Date: 13-Apr-19 3:03:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanRequestStatus](
	[LoanId] [int] NOT NULL,
	[RequestStatus] [nvarchar](15) NOT NULL,
	[Reason] [nvarchar](max) NULL,
	[RespondDate] [datetime] NULL,
 CONSTRAINT [PK_LoanRequestStatus] PRIMARY KEY CLUSTERED 
(
	[LoanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lookup]    Script Date: 13-Apr-19 3:03:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lookup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
	[Designation] [nvarchar](50) NULL,
 CONSTRAINT [PK_Lookup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Installment]  WITH CHECK ADD  CONSTRAINT [FK_Installment_LoanApply] FOREIGN KEY([LoanId])
REFERENCES [dbo].[LoanApply] ([LoanApplyId])
GO
ALTER TABLE [dbo].[Installment] CHECK CONSTRAINT [FK_Installment_LoanApply]
GO
ALTER TABLE [dbo].[LoanApply]  WITH CHECK ADD  CONSTRAINT [FK_LoanApply_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[LoanApply] CHECK CONSTRAINT [FK_LoanApply_Employee]
GO
ALTER TABLE [dbo].[LoanApply]  WITH CHECK ADD  CONSTRAINT [FK_LoanApply_LoanApply] FOREIGN KEY([LoanApplyId])
REFERENCES [dbo].[LoanApply] ([LoanApplyId])
GO
ALTER TABLE [dbo].[LoanApply] CHECK CONSTRAINT [FK_LoanApply_LoanApply]
GO
ALTER TABLE [dbo].[LoanApply]  WITH CHECK ADD  CONSTRAINT [FK_LoanApply_LoanCategory] FOREIGN KEY([LoanCategory])
REFERENCES [dbo].[LoanCategory] ([Id])
GO
ALTER TABLE [dbo].[LoanApply] CHECK CONSTRAINT [FK_LoanApply_LoanCategory]
GO
ALTER TABLE [dbo].[LoanDocumentVerify]  WITH CHECK ADD  CONSTRAINT [FK_LoanDocumentVerify_LoanApply] FOREIGN KEY([LoanId])
REFERENCES [dbo].[LoanApply] ([LoanApplyId])
GO
ALTER TABLE [dbo].[LoanDocumentVerify] CHECK CONSTRAINT [FK_LoanDocumentVerify_LoanApply]
GO
ALTER TABLE [dbo].[LoanDocumentVerify]  WITH CHECK ADD  CONSTRAINT [FK_LoanDocumentVerify_LoanRequestStatus] FOREIGN KEY([LoanId])
REFERENCES [dbo].[LoanRequestStatus] ([LoanId])
GO
ALTER TABLE [dbo].[LoanDocumentVerify] CHECK CONSTRAINT [FK_LoanDocumentVerify_LoanRequestStatus]
GO
ALTER TABLE [dbo].[LoanRequestStatus]  WITH CHECK ADD  CONSTRAINT [FK_LoanRequestStatus_LoanApply] FOREIGN KEY([LoanId])
REFERENCES [dbo].[LoanApply] ([LoanApplyId])
GO
ALTER TABLE [dbo].[LoanRequestStatus] CHECK CONSTRAINT [FK_LoanRequestStatus_LoanApply]
GO
