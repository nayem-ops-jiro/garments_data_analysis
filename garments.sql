SELECT * 
FROM bgm_data;

SELECT *
FROM bgm_data
WHERE management_employees = 0
	and number_of_machines = 0;
    
  SELECT *
FROM bgm_data
WHERE management_employees = 0;
	 
    
SELECT *
FROM bgm_data
WHERE production_capacity_yearly_in_dozen = 0;

SELECT DISTINCT factory_location_in_town
FROM bgm_data
ORDER BY factory_location_in_town;

UPDATE bgm_data
SET factory_location_in_town = CASE 
    WHEN factory_location_in_town IN ('Bahaddarhat', 'Bahadderhat', 'Bahardarhat') THEN 'Bahaddarhat'
    WHEN factory_location_in_town IN ('Baizid', 'Baizid Bostami', 'Bayzid Bostami') THEN 'Bayzid Bostami'
    WHEN factory_location_in_town = 'Bondar' THEN 'Bandar'
    WHEN factory_location_in_town = 'Catonment' THEN 'Cantonment'
    WHEN factory_location_in_town = 'Chandgoan' THEN 'Chandgaon'
    WHEN factory_location_in_town = 'Chawkbazar' THEN 'Chawk Bazar'
    WHEN factory_location_in_town IN ('Chandona', 'Chondona') THEN 'Chandana'
    WHEN factory_location_in_town IN ('Dakkhinkhan', 'Dakshinkhan') THEN 'Dakkhin Khan'
    WHEN factory_location_in_town = 'Dewnhat' THEN 'Dewanhat'
    WHEN factory_location_in_town = 'Dhanialapara' THEN 'Dhaniala Para'
    WHEN factory_location_in_town IN ('Double Mouring', 'Doublemooring') THEN 'Double Mooring'
    WHEN factory_location_in_town = 'Fouzderhat' THEN 'Fouzdarhat'
    WHEN factory_location_in_town = 'Hatazari' THEN 'Hathazari'
    WHEN factory_location_in_town = 'Jatra Bari' THEN 'Jatrabari'
    WHEN factory_location_in_town = 'Joydevpur' THEN 'Joydebpur'
    WHEN factory_location_in_town = 'Kadamtoli' THEN 'Kadamtali'
    WHEN factory_location_in_town IN ('Kalughat', 'Kalurgaht', 'Kalurgate') THEN 'Kalurghat'
    WHEN factory_location_in_town = 'Khatungonj' THEN 'Khatunganj'
    WHEN factory_location_in_town = 'Kotawali' THEN 'Kotowali'
    WHEN factory_location_in_town = 'Laldhighi' THEN 'Laldighi'
    WHEN factory_location_in_town IN ('Mazirghat', 'Mazirhat') THEN 'Mazhirghat'
    WHEN factory_location_in_town = 'Megla' THEN 'Meghla'
    WHEN factory_location_in_town = 'Moghbazar' THEN 'Mogbazar'
    WHEN factory_location_in_town = 'Mohamamdpur' THEN 'Mohammadpur'
    WHEN factory_location_in_town = 'Narayangonj' THEN 'Narayanganj'
    WHEN factory_location_in_town = 'Narshingdi' THEN 'Narsingdi'
    WHEN factory_location_in_town IN ('Pahartali', 'Pahattoli') THEN 'Pahartoli'
    WHEN factory_location_in_town IN ('Panchlish', 'Panchlaish') THEN 'Panchalaish'
    WHEN factory_location_in_town = 'Patherghata' THEN 'Patharghata'
    WHEN factory_location_in_town = 'Postagola' THEN 'Postogola'
    WHEN factory_location_in_town = 'Rupgonj' THEN 'Rupganj'
    WHEN factory_location_in_town IN ('Siddirgonj', 'Siddirganj', 'Siddhirgang') THEN 'Shiddirganj'
    WHEN factory_location_in_town = 'Singaire' THEN 'Singair'
    WHEN factory_location_in_town = 'Sonargoan' THEN 'Sonargaon'
    WHEN factory_location_in_town = 'Tungi' THEN 'Tongi'
    WHEN factory_location_in_town = 'Uttarkhan' THEN 'Uttar Khan'
    WHEN factory_location_in_town = 'Uttra' THEN 'Uttara'
    ELSE factory_location_in_town
END;

SELECT DISTINCT factory_location_in_city
FROM bgm_data
ORDER BY factory_location_in_city;

UPDATE bgm_data
SET factory_location_in_city = CASE 
    WHEN factory_location_in_city IN ('10, H. S. S. Road,','10, HSS Road,','10, H.S.S. Road,') then '10, H.S.S. Road'
    WHEN factory_location_in_city IN ('1670/2091, West Sholashahar, Aturar Depot','1670/2091, West Sholashahar, Aturar Dipot','1670/2091, West Sholashahar, Aturer Depu') then '1670/2091, West Sholoshahar, Aturar Depot'
    WHEN factory_location_in_city = '301 (North) Nasirabad I/A, Baizidbostami Road' then '301 (North) Nasirabad I/A, Baizid Bostami Road'
    WHEN factory_location_in_city = '314, Shekh Mojib Road,' then 'SK. Mujib Road'
    WHEN factory_location_in_city = 'Cumilla' then 'Comilla'
    WHEN factory_location_in_city = 'Hobiganj' then 'Hobigonj'
    WHEN factory_location_in_city IN ('Chattogram','Chittagonj') then 'Chittagong'
    WHEN factory_location_in_city IN ('Narayangan','Narayangonj','Naraynaganj') then 'Narayanganj'
    WHEN factory_location_in_city = 'Mymensing' then 'Mymensingh'
    WHEN factory_location_in_city = 'Netrakona' then 'Netrokona'
    WHEN factory_location_in_city =  'Rifal Club Complex, K.C. Dey Road' then 'Rifle Club Complex, K.C. Dey Road, Nandankanan'
 ELSE factory_location_in_city
END;

ALTER TABLE bgm_data
ADD COLUMN factory_status VARCHAR(50) DEFAULT 'Clean';

UPDATE bgm_data
SET factory_status = 'Anomaly'
WHERE (management_employees=0 AND number_of_machines =0) 
	OR production_capacity_yearly_in_dozen = 0;

SELECT * 
FROM bgm_data
where factory_status = 'Anomaly' ;

SELECT factory_type, AVG(production_capacity_yearly_in_dozen), SUM(production_capacity_yearly_in_dozen)
FROM bgm_data
WHERE factory_status = 'Clean' 
GROUP BY factory_type;

SELECT factory_status,AVG(production_capacity_yearly_in_dozen)
FROM bgm_data
GROUP BY factory_status;

SELECT factory_location_in_town,AVG(production_capacity_yearly_in_dozen)
FROM bgm_data
WHERE factory_status = 'Clean'
GROUP BY factory_location_in_town
ORDER BY AVG(production_capacity_yearly_in_dozen);

SELECT factory_type, AVG(management_employees)
FROM bgm_data
GROUP BY factory_type;

SELECT factory_type, AVG(number_of_machines)
FROM bgm_data
GROUP BY factory_type;

SELECT AVG(factory_count) AS avg_factories_per_town
FROM (SELECT factory_location_in_town, COUNT(*) AS factory_count
    FROM bgm_data
    GROUP BY factory_location_in_town
) AS town_counts;

SELECT factory_location_in_town AS town, 
    COUNT(*) AS total_factories
FROM bgm_data
GROUP BY factory_location_in_town
ORDER BY total_factories DESC;

SELECT factory_name, factory_location_in_town
FROM bgm_data
WHERE factory_location_in_town IN (
    SELECT factory_location_in_town 
    FROM bgm_data 
    GROUP BY factory_location_in_town 
    HAVING COUNT(*) > 20

);

 SELECT factory_location_in_town ,count(*) as factory_total
    FROM bgm_data 
    GROUP BY factory_location_in_town 
    HAVING COUNT(*) > 20
	ORDER BY factory_total DESC;

SELECT factory_priority,AVG(production_capacity_yearly_in_dozen),AVG(management_employees),AVG( number_of_machines)
FROM bgm_data
GROUP BY factory_priority;

SELECT factory_type,AVG(production_capacity_yearly_in_dozen),AVG(management_employees),AVG( number_of_machines)
FROM bgm_data
WHERE factory_status = 'Clean'
GROUP BY factory_type
ORDER BY AVG(production_capacity_yearly_in_dozen) DESC;

SELECT *
FROM bgm_data;

SELECT factory_location_in_city,AVG(production_capacity_yearly_in_dozen), AVG(management_employees), AVG(number_of_machines)
FROM bgm_data
GROUP BY factory_location_in_city
ORDER BY AVG(production_capacity_yearly_in_dozen) DESC;

SELECT *
FROM bgm_data
where factory_status = 'Clean';





