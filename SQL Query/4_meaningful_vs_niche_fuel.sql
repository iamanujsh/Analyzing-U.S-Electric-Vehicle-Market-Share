/*Highlight which alternative fuels (biodiesel, ethanol, hydrogen) have meaningful presence vs. niche usage. */

With total_summary AS(
	 select SUM(biodiesel) [biodiesel], 
			 SUM(Ethanol_Flex_E85) [ethanol],
			 SUM(hydrogen) [hydrogen],
			 SUM(Electric_EV + Plug_In_Hybrid_Electric_PHEV + Hybrid_Electric_HEV + Biodiesel 
				  + Ethanol_Flex_E85 + Compressed_Natural_Gas_CNG + Propane + Hydrogen + Methanol + Gasoline +
					Diesel + Unknown_Fuel) [total_vehicles]
	 from Vehicle_Data	
) select biodiesel,
		 (biodiesel * 1.0 / total_vehicles) * 100 [biodiesel_%],
		 ethanol,
		 (ethanol * 1.0 / total_vehicles) * 100 [ethanol_%],
		 hydrogen,
		 (hydrogen * 1.0 / total_vehicles ) * 100 [hydrogen_%],
		 total_vehicles
from total_summary
