
-- sample query via using datediff function 
select 
    mm.start_date, 
    mm.end_date, 
    test.datediff('year', mm.start_date, mm.end_date) as diff_year,
    test.datediff('month', mm.start_date, mm.end_date) as diff_month,
    test.datediff('day', mm.start_date, mm.end_date) as diff_day
from (
    select '2021-11-25 02:20:54.200'::timestamp as start_date, now()::timestamp as end_date 
) mm;

