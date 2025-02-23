select *
from final_data

update final_data
set Patient_Name = TRIM(Patient_Name)
from final_data


-- Deal with dates to calculate Average stay days
select Admission_Date , Discharge_Date
from final_data

update final_data
set Discharge_Date  = '2025-02-23' 
where Discharge_Date is null 

select Admission_Date,Discharge_Date
from final_data

-- fetch Average stay Days
select avg(DATEDIFF( DAY , Admission_Date , Discharge_Date)) as Stay_Days
from final_data 

select Hospital_Name ,count(Classfication)as N_High_risk_cases
from final_data
where Classfication ='High risk'
group by Classfication , Hospital_Name

-- EDA Number of positive cases per Diagnosis
select Diagnosis , count(Classfication) as N_Positive_cases
from final_data
where Classfication = 'Positive'
group by Diagnosis 

--EDA Number of High risk cases per Diagnosis
select Diagnosis , count(Classfication) as N_Positive_cases
from final_data
where Classfication = 'High risk'
group by Diagnosis

-- Most Medication Demanded
select Medication , COUNT(Medication)
from final_data  
group by Medication
