USE [LBSRegistrarServicesTest]
GO


CREATE TABLE [dbo].[LBSRegisterBirthCurrentStatus](
	[LBSBirthID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[reporting_case_ref] [nvarchar](max) NULL,
	[reporting_event_type] [nvarchar](max) NULL,
	[reporting_product] [nvarchar](max) NULL,
	[reporting_case_type] [nvarchar](max) NULL,
	[reporting_created_date] [datetime] NULL,
	[reporting_case_closed] [datetime] NULL,
	[reporting_borough] [nvarchar](max) NULL,
	[reporting_userName] [nvarchar](max) NULL,
	[reporting_stage] [nvarchar](max) NULL,
	[reporting_number_of_children] [int] NULL,
	[reporting_child_DOB] [date] NULL,
	[reporting_appointment_datetime] [datetime] NULL,
	[reporting_usernameBackOffice] [nvarchar](max) NULL,

GO
