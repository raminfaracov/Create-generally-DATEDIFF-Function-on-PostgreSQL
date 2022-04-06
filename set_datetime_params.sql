CREATE OR REPLACE FUNCTION set_date_values
(
	pdate timestamp,
	pyear integer default null, 
	pmonth integer default null, 
	pday integer default null,
	phour integer default null,
	pminute integer default null,
	psecond integer default null
)
RETURNS timestamp
LANGUAGE plpgsql
AS $function$
declare
	new_date timestamp;
	v_val integer; 
begin
	
	new_date = pdate; 

	if (psecond is not null) then 
		new_date = new_date - (extract(second from new_date)::text || ' second')::interval + (psecond::text || ' second')::interval;  
	end if; 

	if (pminute is not null) then 
		new_date = new_date - (extract(minute from new_date)::text || ' minute')::interval + (pminute::text || ' minute')::interval;  
	end if; 

	if (phour is not null) then 
		new_date = new_date - (extract(hour from new_date)::text || ' hour')::interval + (phour::text || ' hour')::interval;  
	end if; 


	if (pday is not null) then 
		v_val = pday;
	
		if (v_val > 1) then 
			v_val = v_val - 1; 
		end if;
	
		if (v_val > 0) then 
			new_date = new_date - (extract(day from new_date)::text || ' day')::interval + (v_val::text || ' day')::interval;
		end if; 
	end if; 


	if (pmonth is not null) then 
		v_val = pmonth; 
	
		if (v_val > 1) then 
			v_val = v_val - 1; 
		end if;

		if (v_val > 0) then 	
			new_date = new_date - (extract(month from new_date)::text || ' month')::interval + (v_val::text || ' month')::interval;
		end if; 
	end if; 


	if (pyear is not null) then 
		new_date = replace(new_date::text, extract(year from new_date)::text, pyear::text)::timestamp; 
	end if; 

	return new_date;

end;
$function$;

