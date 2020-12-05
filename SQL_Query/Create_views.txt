/* AllLBSREgsiterBirthsCurrent Status View*/

USE [LBSRegistrarServicesTest]
GO

CREATE VIEW [dbo].[AllLBSRegisterBirthsCurrentStatus] as 

	SELECT reporting_case_ref as CaseRef, reporting_event_type as EventType, reporting_product as Product, reporting_case_type as Process,
		   
		reporting_created_date as CaseCreatedDate, DATEPART(YEAR,reporting_created_date) as CreatedDateYear, DATENAME (MONTH, reporting_created_date) as CreatedDateMonthName ,
		DATEPART (MONTH, reporting_created_date) as CreatedMonthNumber, DATEPART (Week, reporting_created_date) as DateCreatedWeek,DATEPART(WEEKDAY,reporting_created_date) as CreatedDateDayOfWeekNumber,
		DATENAME (WEEKDAY,reporting_created_date) as CreatedDateDayOfWeekName,cast(reporting_created_date as time(0))CreatedDateTime,

		reporting_case_closed as CaseClosedDate, DATEPART(YEAR,reporting_case_closed) as ClosedDateYear, DATENAME (MONTH, reporting_case_closed) as ClosedDateMonthName ,
		DATEPART (MONTH, reporting_case_closed) as ClosedMonthNumber, DATEPART (Week, reporting_case_closed) as DateClosedWeek,DATEPART(WEEKDAY,reporting_case_closed) as ClosedDateDayOfWeekNumber,
		DATENAME (WEEKDAY,reporting_case_closed) as ClosedDateDayOfWeekName,cast(reporting_case_closed as time(0))ClosedDateTime,

		reporting_borough as Borough, reporting_userName as Officer, reporting_stage as CurrentStage, reporting_number_of_children as NumberOfChildren,
		reporting_child_DOB as ChildDOB, 
		   
		reporting_appointment_datetime as Appointment, DATENAME (WEEKDAY,reporting_appointment_datetime) as AppointmentDateDayOfWeekName,
		DATEPART(YEAR,reporting_appointment_datetime) as AppointmentDateYear, DATENAME (MONTH, reporting_appointment_datetime) AppointmentDateMonthName ,
		DATEpart (MONTH, reporting_appointment_datetime) as AppointmentDateMonthNumber, DATEPART (Week, reporting_appointment_datetime) as AppointmentDateWeek,
		DATEPART(WEEKDAY,reporting_appointment_datetime) as AppointmentDateDayOfWeekNumber,
		Trim ('@kingston.gov.uk' from reporting_usernameBackOffice) as UsernameBackOffice

		FROM LBSRegisterBirthCurrentStatus

GO


/* RegisterABirthDaysElapsedFromEvent View */

USE [LBSRegistrarServicesTest]
GO


Create VIEW [dbo].[RegisterABirthDaysElapsedFromEvent] AS

Select *, 
	DATEDIFF(day,ChildDOB , Appointment) AS NumberOFElapsedDaysEventAndAppointment , 
	DATEDIFF(day,ChildDOB , CaseCreatedDate) AS NumberOFElapsedDaysEventAndCreatingCase,
	DATEDIFF(day,CaseCreatedDate, Appointment) AS NumberOFElapsedDaysCaseCreationAndAppointment
From AllLBSRegisterBirthsCurrentStatus 

GO

