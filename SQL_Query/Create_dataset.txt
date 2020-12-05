
Sutton Register Birth All Cases

Select * 
From LBSRegisterBirthCurrentStatus



Sutton Register Births Totals

DataSet1
Select CaseRef ,Count (CaseRef) as TotalCases,AppointmentDateMonthNumber,AppointmentDateMonthName,AppointmentDateYear
FROM  AllLBSRegisterBirthsCurrentStatus
Where AppointmentDateYear= @AppointmentYear
Group by AppointmentDateMonthNumber, AppointmentDateMonthName, AppointmentDateYear,CaseRef 
Order by AppointmentDateMonthNumber

AppointmentYear
Select Distinct AppointmentDateYear
From AllLBSRegisterBirthsCurrentStatus

TotalAppointmentOriginalDate

Select CaseRef,Count (CaseRef) as TotalAppointmentOriginalDate, AppointmentDateMonthName, AppointmentDateMonthNumber, AppointmentDateYear

From AllLBSRegisterBirthsCurrentStatus

Group by AppointmentDateMonthNumber, AppointmentDateMonthName, AppointmentDateYear, CaseRef

Order by AppointmentDateMonthNumber




Sutton Register a Birth Days Elapsed From Event By Case Ref


Select * , 

DATEDIFF(day,ChildDOB , Appointment) AS NumberOFElapsedDaysEventAndAppointment , 

DATEDIFF(day,ChildDOB , CaseCreatedDate) AS NumberOFElapsedDaysEventAndCreatingCase,

DATEDIFF(day,CaseCreatedDate , Appointment) AS NumberOFElapsedDaysCaseCreationAndAppointment

From AllLBSRegisterBirthsCurrentStatus 
Where  CaseRef = @CaseRef
