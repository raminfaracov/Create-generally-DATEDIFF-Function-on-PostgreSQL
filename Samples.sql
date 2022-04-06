
/***************************************************************************************
**************************  SAMPLES: set_date_value  ***********************************
***************************************************************************************/
select set_date_values('2022-04-06 22:26:37.106'::timestamp, 2021, 1, 1)
-- Return: 2021-01-01 22:26:37.106

select set_date_values('2022-04-06 22:26:37.106'::timestamp, 2021, 1, 1, null, 0, 0)
-- Return: 2021-01-01 22:00:00.000


/***************************************************************************************
*******************************  SAMPLES: datediff  ************************************
***************************************************************************************/
with sample_data as (
	select 
		'2021-01-01 15:41:13.010'::timestamp as start_date, 
		'2022-04-06 18:54:47.103'::timestamp as end_date
) 
select 
    datediff('year', start_date, end_date) as diff_year,
    datediff('month', start_date, end_date) as diff_month,
    datediff('day', start_date, end_date) as diff_day
from sample_data 

/* Return: 

diff_year	diff_month		diff_day
-------------------------------------
1			15				460

*/

