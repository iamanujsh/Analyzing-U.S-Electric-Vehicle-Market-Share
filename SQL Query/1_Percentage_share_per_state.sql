/* What percentage of vehicles in each state are EVs, PHEVs, HEVs, and gasoline? */

WITH total_vehicle AS(
	select * , Electric_EV + Plug_In_Hybrid_Electric_PHEV + Hybrid_Electric_HEV + Biodiesel 
			  + Ethanol_Flex_E85 + Compressed_Natural_Gas_CNG + Propane + Hydrogen + Methanol + Gasoline +
				Diesel + Unknown_Fuel [all_vehicles]
	from Vehicle_Data
) select  
		State , 
		CAST((Electric_EV * 1.0 / all_vehicles) * 100.0 as decimal(10,2) ) [% of EVs],
		CAST( (Plug_In_Hybrid_Electric_PHEV * 1.0 / all_vehicles) * 100.0 as DECIMAL(10 , 2 )) [% of PHEV],
		CAST((Hybrid_Electric_HEV * 1.0 / all_vehicles) * 100.0 as DECIMAL(10 , 2 )) [% of HEVs],
		CAST((Gasoline * 1.0 / all_vehicles) * 100.0 as DECIMAL(10 , 2 )) [% of Gasoline]
from total_vehicle
order by [% of Gasoline] 
