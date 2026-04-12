-- Compare EV adoption in California vs. other large states (e.g., Texas, Florida, New York).


WITH total_market AS(
	select * , Electric_EV + Plug_In_Hybrid_Electric_PHEV + Hybrid_Electric_HEV + Biodiesel 
			  + Ethanol_Flex_E85 + Compressed_Natural_Gas_CNG + Propane + Hydrogen + Methanol + Gasoline +
				Diesel + Unknown_Fuel [all_vehicles]
	from Vehicle_Data
) select State , (Electric_EV * 1.0 / all_vehicles) *100 [EV Market %] , 
				(select (Electric_EV * 1.0 / all_vehicles) * 100
				from total_market where state  = 'California') [California EV Market %] 
from total_market
where State in ('Texas' , 'Florida' , 'New York')
