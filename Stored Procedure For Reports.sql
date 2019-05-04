Use [DB7]
GO
--1.Employees loan requests which are still pending.
CREATE or alter PROCEDURE pending
AS
select FirstName + LastName as [Name], Email,LoanMoney,NoOfInstallments,InstallmentStartDate,InstallmentEndDate,RequestDate from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
join LoanRequestStatus on LoanApply.LoanApplyId =  LoanRequestStatus.LoanId 
where RequestStatus = 'Pending'; 
GO
--Execute pending
--2.Employees loan requests which are accepted.
CREATE or alter PROCEDURE accepted
AS
select FirstName + LastName as [Name], Email,LoanMoney,NoOfInstallments,InstallmentStartDate,InstallmentEndDate,RequestDate from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
join LoanRequestStatus on LoanApply.LoanApplyId =  LoanRequestStatus.LoanId 
where RequestStatus = 'Accepted'; 
Go
--Execute accepted
--3.Employees loan requests which are rejected.
CREATE or alter PROCEDURE rejected
AS
select FirstName + LastName as [Name], Email,LoanMoney,NoOfInstallments,InstallmentStartDate,InstallmentEndDate,RequestDate from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
join LoanRequestStatus on LoanApply.LoanApplyId =  LoanRequestStatus.LoanId 
where RequestStatus = 'Rejected'; 
Go
--Execute rejected
--4.Defaulter Employees.
CREATE or alter PROCEDURE defaulter
AS
select FirstName + LastName as [Name], Email,Designation, LoanMoney,RequestDate from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
join LoanDocumentVerify on LoanApply.LoanApplyId = LoanDocumentVerify.LoanId 
where IsDefaulter = 'Y'; 
Go
--Execute defaulter
--5.Employees who have taken loan against Provident Fund.
CREATE or alter PROCEDURE provident
AS
select FirstName + LastName as [Name], Email,LoanMoney,RequestDate from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
join LoanCategory on LoanApply.LoanCategory = LoanCategory.Id 
where LoanCategory.Type ='Against Provident Fund'; 
Go
--Execute provident
--6.Employees who have taken general loan.
CREATE or alter PROCEDURE general
AS
select FirstName + LastName as [Name], Email,LoanMoney,RequestDate from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
join LoanCategory on LoanApply.LoanCategory = LoanCategory.Id 
where LoanCategory.Type ='General Loan'; 
Go
--Execute general
--7.Employees who have taken loan against Provident Fund for property.
CREATE or alter PROCEDURE pfproperty
AS
select FirstName + LastName as [Name], Email,LoanMoney,RequestDate from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
where LoanForProperty ='Y'; 
Go
--Execute pfproperty
--8.Employees who have taken loan against Provident Fund for automobile.
CREATE or alter PROCEDURE pfautomobile
AS
select FirstName + LastName as [Name], Email,LoanMoney,RequestDate from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
where LoanForAutomobile ='Y'; 
Go
--Execute pfautomobile

------------------------------------------------------------DONE-------------------------------------------------------------------
--9.Installments which will be paid by employee.
CREATE or alter PROCEDURE installments @LoanId int
AS
select InstallmentsNo,InstallmentDate,[Installment Money],IsPaid from Installment
Join LoanApply on Installment.LoanId = LoanApply.LoanApplyId
where LoanApply.LoanApplyId = @LoanId 
Go
--Execute installments
--10.Paid installments of employee.
CREATE or alter PROCEDURE paidinstallments @LoanId int
AS
select InstallmentsNo,InstallmentDate,[Installment Money],IsPaid from Installment
Join LoanApply on Installment.LoanId = LoanApply.LoanApplyId
where LoanApply.LoanApplyId = @LoanId   and Installment.IsPaid='Y'
Go
--Execute installments
--11.Paid installments of employee.
CREATE or alter PROCEDURE unpaidinstallments @LoanId int
AS
select InstallmentsNo,InstallmentDate,[Installment Money],IsPaid from Installment
Join LoanApply on Installment.LoanId = LoanApply.LoanApplyId
where LoanApply.LoanApplyId = @LoanId   and Installment.IsPaid='N'
Go
--Execute paidinstallments
--12.Specific employee’s loan history.
CREATE or alter PROCEDURE loanhistory @Employeeid int
AS
select FirstName + LastName as [Name], Email,LoanMoney,NoOfInstallments,RequestDate,RequestStatus,LoanCategory.[Type]
from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
join LoanCategory on LoanApply.LoanCategory = LoanCategory.Id 
join LoanRequestStatus on LoanApply.LoanApplyId = LoanRequestStatus.LoanId
WHERE LoanApply.EmployeeId = @Employeeid
Go
--Execute loanhistory






