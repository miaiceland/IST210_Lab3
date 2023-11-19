-- Part 1

-- 1. Select all rows and columns from the hospital_basic table
select *
from Iceland_hospital_basic.hospital_basic;

-- 2. Select all the rows and columns from hospital_basic where the Physician is not Molly Clock.
select *
from Iceland_hospital_basic.hospital_basic
where Physician != 'Molly Clock';

-- 3. Select all rows and columns where the patient is Cary Richard from the hospital_basic table.
select *
from Iceland_hospital_basic.hospital_basic
where PatientName = 'Cary Richard';

-- 4. Select all the rows and columns where the patient’s name begins with “C” from the hospital_basic table.
select *
from Iceland_hospital_basic.hospital_basic
where PatientName like 'C%';

-- 5. Select all distinct rows and only the Name and Address columns from the hospital_basic table order by patient name.
select distinct PatientName, Addr
from Iceland_hospital_basic.hospital_basic
order by PatientName;

-- 6. Select all rows and show only the procedure, patient, physician and nurse columns, where the nurse is NULL in the hospital_basic table.
select hospital_basic.procedure, PatientName, Physician, Nurse
from Iceland_hospital_basic.hospital_basic
where nurse is null;

-- 7. Select all rows and columns from hospital_basic where the patient is Cary Richard, and the surgeon is Todd Quinlan.
select *
from Iceland_hospital_basic.hospital_basic
where Physician = 'Todd Quinlan' and PatientName = 'Cary Richard';

-- 8. Select all the rows and columns from hospital_basic where the ID is between 10 and 20 (inclusive) and the patient is not Cary Richard.
select *
from Iceland_hospital_basic.hospital_basic
where RecordID >= 10 and RecordID <= 20 and PatientName != 'Cary Richard';

/* 9. Select all rows from the hospital_basic table where the procedure is either Complete Walletectomy or Reversible Cryobobulation. 
	  Show only the procedure, name, and physician columns. */
select hospital_basic.procedure, PatientName, Physician, Nurse
from Iceland_hospital_basic.hospital_basic
where hospital_basic.procedure in ('Complete Walletectomy', 'Reversible Cryobobulation');

/* 10. Select all distinct rows and only the physician and procedure columns from the hospital_basic table 
	   where the name of the procedure ends with ‘ectomy’. Order by physician. */
select hospital_basic.procedure, PatientName, Physician, Nurse
from Iceland_hospital_basic.hospital_basic
where hospital_basic.procedure like '%ectomy'
order by Physician;

/* 11. Select all rows and only the physician, procedure, and date of procedure columns from the
	   hospital_basic table where Molly Clock is the physician. Limit the results by showing only the 1
       record with the latest date from date of procedure. */
select *
from Iceland_hospital_basic.hospital_basic
where Physician = 'Molly Clock'
order by date_of_procedure desc
limit 1;

-- Part 2

/* 1. Insert the following data into the hospital_basic table. Display all data from the table
	using a SELECT statement.
	- Antoinette Peterson lives at 567 Pancakes Street. She arrived on 2008-07-14 and
	got help from Carlton McCclure on 2008-07-15 in Room 302. 
    Antoinette stayed for two days. Her phone number on file is 555-6575
	- Angelica Sutton lives at 757 Waffle Rd. She arrived on 2008-07-02 and received
	help from Clara Booth on 2008-07-3 in Room 103. Angelica stayed 
    in the hospital for 5 days and did not provide a phone number. */
insert into hospital_basic (PatientName, Addr, Phone, Room, Physician, date_of_procedure, Stay_Arrival)
values ('Antoinette Peterson', '567 Pancakes Street', '555-6575', 302, 'Carlton McCclure', 2008-07-15, 2008-07-14);

insert into hospital_basic (PatientName, Addr, Room, Physician, date_of_procedure, Stay_Arrival, Stay_Departure)
values ('Angelica Sutton', '757 Waffle Rd.', 103, 'Carlton McCclure', 2008-07-3, 2008-07-02, 2008-07-07);

/* 2. UPDATE the following data in the table. Display all data from the table using a SELECT
	statement.
	- UPDATE the name of the procedure ‘Reverse Rhinopodoplasty” to “Forward
	Rhinopodoplasty II” (4 rows)
	- UPDATE the physician ‘Elliot Reid’ to ‘Elliot Dudemeister’ (4 rows)
	- UPDATE the cost of the “Follicular Demiectomy” procedure to $100 (6 rows)
	- UPDATE all rooms on the 4th floor (4xx) to NULL (10 rows) */
update hospital_basic
set hospital_basic.procedure = 'Forward Rhinopodoplasty II'
where hospital_basic.procedure = 'Reverse Rhinopodoplasty';

update hospital_basic
set Physician = 'Elliot Dudemeister'
where Physician = 'Elliot Reid';

update hospital_basic
set Cost = 100
where hospital_basic.procedure = 'Follicular Demiectomy';

update hospital_basic
set Room = NULL
where Room like '4%';
    
/* 2b. You will notice for some records in your hospital_basic table there is a NULL value for
	the Assisting Nurse. The NULL value represents Nurse Thomas Jones: A Nurse who was
	mistakenly deleted from the database. UPDATE the hospital_basic table so the NULL values
	are replaced with Thomas Jones. */
update hospital_basic
set Nurse = 'Thomas Jones'
where Nurse = NULL;
    
-- 3. DELETE all records from the hospital_basic database where the patient was Albert Coffey 
delete from hospital_basic
where PatientName = 'Albert Coffey';

-- 4. DELETE all records from the hospital_basic database where the address contains the keyword ‘Street’ 
delete from hospital_basic
where Addr like '%Street%';

delete from hospital_basic
where Addr like '%Street';

delete from hospital_basic
where Addr like 'Street%';

-- 5. DELETE all records from the hospital_basic database where the patient’s phone number ends in 1 and the cost is less than 3000
delete from hospital_basic
where Phone like '%1' and Cost < 3000;
