create database bank_loan_project;
use database bank_loan_project;

SELECT * FROM bank_loan_project.`copy of finance_1`;
select* from bank_loan_project . finance_2;


RENAME TABLE copy_of_finance_2 TO finance_2;



#KPIS
#year wise loan amount
#grade-subgrade wise revolution balance
#total payment for verified status vs non verified status
#state wise last credit pull_d wise loan status 
#home ownership vs last payment date stats.



# KPI 1 

select  issue_d  as year_of_issue_d, sum(loan_amnt) as total_loan_amnt
from bank_loan_project .`copy of finance_1`
group by year_of_issue_d
order by year_of_issue_d;


# KPI 2

select 
grade , sub_grade, sum(revol_bal) as total_revol_bal
from bank_loan_project .`copy of finance_1`inner join bank_loan_project . finance_2
on ( bank_loan_project .`copy of finance_1`.id = bank_loan_project . finance_2 . id)
group by grade , sub_grade
order by grade , sub_grade;



# KPI 3 

select verification_status ,
 concat("$" , format(round(sum(total_pymnt)/1000000,2) ,2 ),"m")as total_payment
from bank_loan_project .`copy of finance_1`inner join bank_loan_project . finance_2
on ( bank_loan_project .`copy of finance_1`.id = bank_loan_project . finance_2 . id)
group by verification_status ;


# KPI 4 

SELECT * FROM bank_loan_project.`copy of finance_1`;
select* from bank_loan_project . finance_2;

select addr_state , last_credit_pull_d , loan_status
from bank_loan_project .`copy of finance_1`inner join bank_loan_project . finance_2
on ( bank_loan_project .`copy of finance_1`.id = bank_loan_project . finance_2 . id)
group by addr_state, last_credit_pull_d , loan_status
order by last_credit_pull_d ; 


# KPI 5 
select home_ownership ,
 last_pymnt_d, 
concat("$" , format(round(sum(last_pymnt_amnt)/10000,2) ,2 ),"k")as total_payment
from bank_loan_project .`copy of finance_1`inner join bank_loan_project . finance_2
on bank_loan_project .`copy of finance_1`.id = bank_loan_project . finance_2 . id
group by home_ownership , last_pymnt_d
order by last_pymnt_d desc , home_ownership desc ; 



