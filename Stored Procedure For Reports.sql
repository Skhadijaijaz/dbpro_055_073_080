Use [DB7]
GO;
--1.Employees loan requests which are still pending.
CREATE PROCEDURE pending
AS
select FirstName + LastName as [Name], Email,LoanMoney,NoOfInstallments,InstallmentStartDate,InstallmentEndDate,RequestDate from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
join LoanRequestStatus on LoanApply.LoanApplyId =  LoanRequestStatus.LoanId 
where RequestStatus = 'Pending'; 
GO;
--2.Employees loan requests which are accepted.
CREATE PROCEDURE accepted
AS
select FirstName + LastName as [Name], Email,LoanMoney,NoOfInstallments,InstallmentStartDate,InstallmentEndDate,RequestDate from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
join LoanRequestStatus on LoanApply.LoanApplyId =  LoanRequestStatus.LoanId 
where RequestStatus = 'Accepted'; 
Go;
--3.Employees loan requests which are rejected.
CREATE PROCEDURE rejected
AS
select FirstName + LastName as [Name], Email,LoanMoney,NoOfInstallments,InstallmentStartDate,InstallmentEndDate,RequestDate from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
join LoanRequestStatus on LoanApply.LoanApplyId =  LoanRequestStatus.LoanId 
where RequestStatus = 'Rejected'; 
Go;
--4.Defaulter Employees.
CREATE PROCEDURE defaulter
AS
select FirstName + LastName as [Name], Email,LoanMoney,NoOfInstallments,InstallmentStartDate,InstallmentEndDate,RequestDate from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
join LoanDocumentVerify on LoanApply.LoanApplyId = LoanDocumentVerify.LoanId 
where IsDefaulter = 'Y'; 
Go;
--5.Employees who have taken loan against Provident Fund.
CREATE PROCEDURE provident
AS
select FirstName + LastName as [Name], Email,LoanMoney,NoOfInstallments,InstallmentStartDate,InstallmentEndDate,RequestDate from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
join LoanCategory on LoanApply.LoanCategory = LoanCategory.Id 
where LoanCategory.Type ='Against Provident Fund'; 
Go;
--Execute provident
--6.Employees who have taken general loan.
CREATE PROCEDURE general
AS
select FirstName + LastName as [Name], Email,LoanMoney,NoOfInstallments,InstallmentStartDate,InstallmentEndDate,RequestDate from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
join LoanCategory on LoanApply.LoanCategory = LoanCategory.Id 
where LoanCategory.Type ='General Loan'; 
Go;
--7.Employees who have taken loan against Provident Fund for property.
CREATE PROCEDURE pfproperty
AS
select FirstName + LastName as [Name], Email,LoanMoney,NoOfInstallments,InstallmentStartDate,InstallmentEndDate,RequestDate from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
where LoanForProperty ='Y'; 
Go;
--Execute pfproperty
--8.Employees who have taken loan against Provident Fund for automobile.
CREATE PROCEDURE pfautomobile
AS
select FirstName + LastName as [Name], Email,LoanMoney,NoOfInstallments,InstallmentStartDate,InstallmentEndDate,RequestDate from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
where LoanForAutomobile ='Y'; 
Go;
--Execute pfautomobile

------------------------------------------------------------DONE-------------------------------------------------------------------
--9.Installments which will be paid by employee.
CREATE PROCEDURE installments
AS
select FirstName + LastName as [Name], Email,NoOfInstallments,[Installment Money] from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
Go;
--10.Paid installments of employee.
CREATE PROCEDURE paidinstallments
AS
select FirstName + LastName as [Name], Email,InstallmentsNo,[Installment Money] from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
join Installment on LoanApply.LoanApplyId = Installment.LoanId 
where Installment.IsPaid ='Y'; 
Go;
--11.Specific employee’s loan history.
CREATE PROCEDURE loanhistory
AS
select FirstName + LastName as [Name], Email,LoanMoney,NoOfInstallments,InstallmentStartDate,InstallmentEndDate,RequestDate from Employee 
Join LoanApply on Employee.Id = LoanApply.EmployeeId 
join LoanCategory on LoanApply.LoanCategory = LoanCategory.Id 
where LoanCategory.Type ='General Loan' Or LoanCategory.Type = 'Against PFund' 
Or LoanApply.LoanForProperty = 'Y' or LoanApply.LoanForAutomobile = 'Y';
Go;





