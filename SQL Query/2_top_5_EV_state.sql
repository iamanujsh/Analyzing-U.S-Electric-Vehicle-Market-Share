
/* Which states have the highest EV adoption rates */

WITH total_vehicle AS(
	select * , Electric_EV + Plug_In_Hybrid_Electric_PHEV + Hybrid_Electric_HEV + Biodiesel 
			  + Ethanol_Flex_E85 + Compressed_Natural_Gas_CNG + Propane + Hydrogen + Methanol + Gasoline +
				Diesel + Unknown_Fuel [all_vehicles]
	from Vehicle_Data
) select Top 5
		State , 
		(Electric_EV * 1.0 / all_vehicles) * 100.0 [% of EVs]
from total_vehicle
order by [% of EVs] desc
