Create database telecom
use telecom
select*from [dbo].[Sheet1$]

DELETE FROM [dbo].[Sheet1$]
WHERE[Area] IS NULL OR
 [Shared region] is null OR
[LTE Accessibility] is null OR
[LTE Retainability] is null OR
[LTE Intra Frequency Handover] is null OR
[LTE Inter Frequency Handover] is null OR
[4G VoLTE Accessibility] is null OR
[Volte CSSR] is null OR
[Network Availability] is null OR
[time value] is null OR
[Country] is null OR
[City] is null OR
[State] is null OR
[Postal Code] is null OR
[Region] is null;
--Query to calculate the average LTE Accessibility:
SELECT
    AVG([LTE Accessibility]) AS Avg_LTE_Accessibility
FROM
    [dbo].[Sheet1$];

--Query to calculate the MIN LTE Accessibility:
SELECT
    MIN([LTE Accessibility]) AS MIN_LTE_Accessibility
FROM
    [dbo].[Sheet1$];

--Query to calculate the MAX LTE Accessibility:
SELECT
    MAX([LTE Accessibility]) AS MAX_LTE_Accessibility
FROM
    [dbo].[Sheet1$];

---Query to calculate the AVG LTE Retainability:
SELECT
    AVG([LTE Retainability]) AS AVG_LTE_Retainability
FROM
    [dbo].[Sheet1$];

---Query to calculate the MAX LTE Retainability:
SELECT
    MAX([LTE Retainability]) AS MAX_LTE_Retainability
FROM
    [dbo].[Sheet1$];

---Query to calculate the MIN LTE Retainability:
SELECT
    MIN([LTE Retainability]) AS MIN_LTE_Retainability
FROM
    [dbo].[Sheet1$];


--Query to calculate the average 4G VoLTE Accessibility:
SELECT
    AVG([4G VoLTE Accessibility]) AS Avg_VoLTE_Accessibility
FROM
    [dbo].[Sheet1$];

--Query to calculate the MAX 4G VoLTE Accessibility:
SELECT
    MAX([4G VoLTE Accessibility]) AS MAX_VoLTE_Accessibility
FROM
    [dbo].[Sheet1$];

--Query to calculate the MIN 4G VoLTE Accessibility:
SELECT
    MIN([4G VoLTE Accessibility]) AS MIN_VoLTE_Accessibility
FROM
    [dbo].[Sheet1$];

--Query to calculate the average Volte CSSR:
SELECT
    AVG([Volte CSSR]) AS Avg_Volte_CSSR
FROM
    [dbo].[Sheet1$];

----Query to calculate the MAX Volte CSSR:
SELECT
    MAX([Volte CSSR]) AS MAX_Volte_CSSR
FROM
    [dbo].[Sheet1$];

----Query to calculate the MIN Volte CSSR:
SELECT
    MIN([Volte CSSR]) AS MIN_Volte_CSSR
FROM
    [dbo].[Sheet1$];

----Query to calculate the Network Availability:
SELECT
    AVG([Network Availability]) AS Network_Availability
FROM
    [dbo].[Sheet1$];

----Query to calculate the LTE Intra Frequency Handover:
SELECT
    AVG([LTE Intra Frequency Handover]) AS LTE_Intra_Frequency_Handover
FROM
    [dbo].[Sheet1$];

----Query to calculate the LTE Inter Frequency Handover:
SELECT
    AVG([LTE Inter Frequency Handover]) AS LTE_Inter_Frequency_Handover
FROM
    [dbo].[Sheet1$];

---------------------------------------------------------------------------------------------------------------------------------------------------------
/*1. LTE Accessibility and LTE Retainability  Analysis:
Query to calculate the average LTE Accessibility and LTE Retainability for each unique location (City and State) in the dataset:*/
SELECT
    [City],
    [State],
    AVG([LTE Accessibility]) AS Avg_LTE_Accessibility,
    AVG([LTE Retainability]) AS Avg_LTE_Retainability
FROM
    [dbo].[Sheet1$]
GROUP BY
    [City], [State]
ORDER BY
    Avg_LTE_Accessibility DESC, Avg_LTE_Retainability DESC;

--Query to calculate the average LTE Accessibility and LTE Retainability for each unique location (City and State) in the dataset:
SELECT
    [Region],
    AVG([LTE Accessibility]) AS Avg_LTE_Accessibility,
    AVG([LTE Retainability]) AS Avg_LTE_Retainability
FROM
    [dbo].[Sheet1$]
GROUP BY
    [Region]
ORDER BY
    Avg_LTE_Accessibility DESC, Avg_LTE_Retainability DESC;


----Query to calculate the average LTE Accessibility and LTE Retainability for OVER TIME
SELECT
    
	 DATEPART(YEAR, [time value]) AS Year,
    DATEPART(DAY, [time value]) AS day,
    AVG([LTE Accessibility]) AS Avg_LTE_Accessibility,
    AVG([LTE Retainability]) AS Avg_LTE_Retainability
FROM
    [dbo].[Sheet1$]
GROUP BY
    DATEPART(YEAR, [time value]), DATEPART(DAY,[time value])
ORDER BY
    Avg_LTE_Accessibility DESC, Avg_LTE_Retainability DESC,Year, DAY;

---LTE Intra Frequency Handover AND LTE Inter Frequency Handover ANALYSIS
---Query to calculate the average LTE Intra Frequency Handover over time:
SELECT
    DATEPART(YEAR, [time value]) AS Year,
    DATEPART(MONTH, [time value]) AS Month,
    AVG([LTE Intra Frequency Handover]) AS Avg_LTE_Intra_Handover
FROM
    [dbo].[Sheet1$]
GROUP BY
    DATEPART(YEAR, [time value]), DATEPART(MONTH, [time value])
ORDER BY
    Year, Month;
--- by day 
SELECT
    DATEPART(YEAR, [time value]) AS Year,
    DATEPART(DAY, [time value]) AS day,
    AVG([LTE Intra Frequency Handover]) AS Avg_LTE_Intra_Handover
FROM
    [dbo].[Sheet1$]
GROUP BY
    DATEPART(YEAR, [time value]), DATEPART(DAY,[time value])
ORDER BY
    Year, DAY;

--Query to calculate the standard deviation of LTE Inter Frequency Handover over time:
SELECT
    DATEPART(YEAR, [time value]) AS Year,
    DATEPART(MONTH, [time value]) AS Month,
    AVG([LTE Inter Frequency Handover]) AS Avg_LTE_Intra_Handover
FROM
    [dbo].[Sheet1$]
GROUP BY
    DATEPART(YEAR, [time value]), DATEPART(MONTH, [time value])
ORDER BY
    Year, Month;

SELECT
    DATEPART(YEAR, [time value]) AS Year,
    DATEPART(DAY, [time value]) AS day,
    AVG([LTE Inter Frequency Handover]) AS Avg_LTE_Intra_Handover
FROM
    [dbo].[Sheet1$]
GROUP BY
    DATEPART(YEAR, [time value]), DATEPART(DAY,[time value])
ORDER BY
    Year, DAY;

-----Query to calculate the average LTE Intra Frequency Handover and LTE Inter Frequency Handover for each REGION
SELECT
    [Region],
    SUM([LTE Intra Frequency Handover]) AS LTE_Intra_Frequency_Handover,
    SUM([LTE Inter Frequency Handover]) AS LTE_Inter_Frequency_Handover
FROM
    [dbo].[Sheet1$]
GROUP BY
    [Region]
ORDER BY
    LTE_Intra_Frequency_Handover DESC, LTE_Inter_Frequency_Handover DESC;


---------------------------------------------------------------------------------------------------------------------------------------------------------/*1. The State with the Best Network Availability:
--- BEST AND LEAST PERFORMANCE ANALYSIS
---Query to identify the state with the highest network availability:*/
SELECT top 1
    [State],
    avg([Network Availability]) AS Avg_Network_Availability
FROM
   [dbo].[Sheet1$]
GROUP BY
    [State]
ORDER BY
    Avg_Network_Availability desc


--- for least network
SELECT top 1
    [State],
    avg([Network Availability]) AS Avg_Network_Availability
FROM
   [dbo].[Sheet1$]
GROUP BY
    [State]
ORDER BY
    Avg_Network_Availability asc

/*2. The State with the Best LTE Accessibility:

Query to identify the state with the highest LTE accessibility:*/
SELECT top 1
    [State],
    avg([LTE Accessibility]) AS Avg_LTE_accessibility
FROM
   [dbo].[Sheet1$]
GROUP BY
    [State]
ORDER BY
    Avg_LTE_accessibility desc

----FOR LEAST

SELECT top 1
    [State],
    avg([LTE Accessibility]) AS Avg_LTE_accessibility
FROM
   [dbo].[Sheet1$]
GROUP BY
    [State]
ORDER BY
    Avg_LTE_accessibility ASC

/*3. The State with the Best LTE Retainability:

Query to identify the state with the highest LTE retainability:*/
SELECT top 1
    [State],
    avg([LTE Retainability]) AS Avg_LTE_retainability
FROM
   [dbo].[Sheet1$]
GROUP BY
    [State]
ORDER BY
    Avg_LTE_retainability desc

-- FOR LEAST
SELECT top 1
    [State],
    avg([LTE Retainability]) AS Avg_LTE_retainability
FROM
   [dbo].[Sheet1$]
GROUP BY
    [State]
ORDER BY
    Avg_LTE_retainability ASC

/*4. The State with the Best 4G VoLTE Accessibility:

Query to identify the state with the highest 4G VoLTE accessibility:*/
SELECT top 1
    [State],
    avg([4G VoLTE Accessibility]) AS Avg_4G_VoLTE_accessibility
FROM
   [dbo].[Sheet1$]
GROUP BY
    [State]
ORDER BY
    Avg_4G_VoLTE_accessibility desc

-- FOR LEAST
SELECT top 1
    [State],
    avg([4G VoLTE Accessibility]) AS Avg_4G_VoLTE_accessibility
FROM
   [dbo].[Sheet1$]
GROUP BY
    [State]
ORDER BY
    Avg_4G_VoLTE_accessibility ASC
/*5. The State with the Best VoLTE CSSR:

Query to identify the state with the highest VoLTE CSSR:*/
SELECT top 1
    [State],
    avg([Volte CSSR]) AS Avg_VoLTE_CSSR
FROM
   [dbo].[Sheet1$]
GROUP BY
    [State]
ORDER BY
    Avg_VoLTE_CSSR desc

-- FOR LEAST
SELECT top 1
    [State],
    avg([Volte CSSR]) AS Avg_VoLTE_CSSR
FROM
   [dbo].[Sheet1$]
GROUP BY
    [State]
ORDER BY
    Avg_VoLTE_CSSR ASC

------------------------------------------------------------------------------------------------------------------------

----4G VoLTE Accessibility and Volte CSSR  ANALYSIS
----Query to calculate the average 4G VoLTE Accessibility and Volte CSSR for each REGION
SELECT
    [Region],
    AVG([4G VoLTE Accessibility]) AS "4G_VoLTE_Accessibility",
    AVG([Volte CSSR]) AS Volte_CSSR_Retainability
FROM
    [dbo].[Sheet1$]
GROUP BY
    [Region]
ORDER BY
    "4G_VoLTE_Accessibility" DESC, Volte_CSSR_Retainability DESC;

-------Query to calculate the average LTE Accessibility and LTE Retainability for OVER TIME
SELECT
    
	 DATEPART(YEAR, [time value]) AS Year,
    DATEPART(DAY, [time value]) AS day,
    AVG([4G VoLTE Accessibility]) AS "4G_VoLTE_Accessibility",
    AVG([Volte CSSR]) AS Volte_CSSR_Retainability 
FROM
    [dbo].[Sheet1$]
GROUP BY
    DATEPART(YEAR, [time value]), DATEPART(DAY,[time value])
ORDER BY
   "4G_VoLTE_Accessibility" DESC, Volte_CSSR_Retainability  DESC,Year, DAY;
-----NETWORK AVAILABILTY
-------Query to calculate the average Network Availability for each  State
SELECT
    
    [State],
    AVG([Network Availability]) AS Avg_Network_Availability
FROM
    [dbo].[Sheet1$]
GROUP BY
   [State]
ORDER BY
    Avg_Network_Availability DESC;

-------Query to calculate the average Network Availability for each  REGION
SELECT
    [Region] ,
    AVG([Network Availability]) AS Avg_Network_Availability
FROM
    [dbo].[Sheet1$]
GROUP BY
   [Region]
ORDER BY
    Avg_Network_Availability DESC;

-------Query to calculate the average LTE Accessibility and LTE Retainability for OVER TIME
SELECT
    
	 DATEPART(YEAR, [time value]) AS Year,
    DATEPART(DAY, [time value]) AS day,
    AVG([Network Availability]) AS Avg_Network_Availability
FROM
    [dbo].[Sheet1$]
GROUP BY
    DATEPART(YEAR, [time value]), DATEPART(DAY,[time value])
ORDER BY
   Avg_Network_Availability DESC, Year, DAY;