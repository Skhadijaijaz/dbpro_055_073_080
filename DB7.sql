USE [DB7]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 13-Apr-19 11:05:35 PM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 13-Apr-19 11:05:36 PM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 13-Apr-19 11:05:36 PM ******/
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
	[CNIC] [nchar](15) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Installment]    Script Date: 13-Apr-19 11:05:36 PM ******/
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
/****** Object:  Table [dbo].[LoanApply]    Script Date: 13-Apr-19 11:05:36 PM ******/
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
	[LoanForProperty] [nchar](1) NULL,
	[LoanForAutomobile] [nchar](1) NULL,
 CONSTRAINT [PK_LoanApply] PRIMARY KEY CLUSTERED 
(
	[LoanApplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanCategory]    Script Date: 13-Apr-19 11:05:36 PM ******/
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
/****** Object:  Table [dbo].[LoanDocumentVerify]    Script Date: 13-Apr-19 11:05:36 PM ******/
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
/****** Object:  Table [dbo].[LoanRequestStatus]    Script Date: 13-Apr-19 11:05:36 PM ******/
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
/****** Object:  Table [dbo].[Lookup]    Script Date: 13-Apr-19 11:05:36 PM ******/
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
SET IDENTITY_INSERT [dbo].[Lookup] ON 
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (1, N'Gender', N'M', NULL)
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (2, N'Gender', N'F', NULL)
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (3, N'Loan Category', N'Against PFund', NULL)
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (4, N'Loan Category', N'General Loan', NULL)
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (5, N'Department', N'HR', NULL)
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (6, N'Department', N'Development', NULL)
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (7, N'Department', N'Accounts and Finance', NULL)
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (8, N'Department', N'Quality Assurance', NULL)
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (9, N'Designation', N'HR', N'HR Director                               ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (10, N'Designation', N'HR', N'HR Manager                                        ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (11, N'Designation', N'HR', N'HR Assistant Manager                              ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (12, N'Designation', N'HR', N'Interns                                           ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (15, N'Designation', N'Development', N'Senior Sofware Engineer                           ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (16, N'Designation', N'Development', N'Junior Software Engineer                          ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (17, N'Designation', N'Development', N'Programmer Analyst                                ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (18, N'Designation', N'Development', N'System Analyst                                    ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (19, N'Designation', N'Development', N'Interns                                           ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (20, N'Department', N'Business Development', NULL)
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (21, N'Designation', N'Business Development', N'Project Manager                                   ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (23, N'Designtion', N'Business Development', N'Purchasing Manager                                ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (24, N'Designation', N'Business Development', N'Marketing Manager                                 ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (25, N'Designation', N'Accounts and Finance', N'Accountant                                        ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (26, N'Designation', N'Accounts and Finance', N'Cashier                                           ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (27, N'Designation', N'Accounts and Finance', N'Financial Officer                                 ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (31, N'Designation', N'Business Development', N'Interns                                           ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (32, N'Designation', N'Accounts and Finance', N'Interns                                           ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (33, N'Designation', N'Quality Assurance', N'Interns                                           ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (34, N'Designation', N'Quality Assurance', N'QA Director                                       ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (35, N'Designation', N'Quality Assurance', N'QA Engineer                                       ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (36, N'Designation', N'Quality Assurance', N'QA Manager                                        ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (37, N'Designation', N'Quality Assurance', N'Interns                                           ')
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (38, N'Request Status', N'Accepted', NULL)
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (39, N'Request Status', N'Pending', NULL)
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (40, N'Request Status', N'Rejected', NULL)
GO
INSERT [dbo].[Lookup] ([Id], [Category], [Value], [Designation]) VALUES (41, N'Admin', N'HR ', N'HR Director')
GO
SET IDENTITY_INSERT [dbo].[Lookup] OFF
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
