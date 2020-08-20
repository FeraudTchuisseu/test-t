********************************************************************************
**  COVID-19 Note: Real-time Covid-19 Factsheet for SSA Countries
**
**  Prepared by : Feraud Tchuisseu Seuyong 
**                World Bank Consulatnt
**				  ftchuisseuseuyon@worldbank.org/ feraudseuyong@gmail.com
**				  August 2020
********************************************************************************
global root "C:\Users\Feraud Tchuisseu\Documents\Project\WBG\Mobility"

global google "$root\Google mobility"
global facebook  "$root\Facebook and NO2"
global Foodprice  "$root\Food price\Graphs for each country"
global All  "$root\All fact sheet"

	version 16
		local version_date "August 8, 2020" // latest date of update
		local access_date "August 5, 2020" // latest date of data source access
	
		
		putdocx clear
		// Create a document with a header
		putdocx begin, footer(foot) header(head)		
		
		// Define the header content, and include page numbers
		putdocx paragraph,  tofooter(foot) font(,14)
		putdocx text ("page ")
		putdocx pagenumber
		
		// putdocx paragraph, toheader(head) font(,12)
		// putdocx text ("Real-time tracking report for `Country`i''")
	
		putdocx paragraph, style(Title)  font("", "", gray) halign(center) // shading( black,black,pct25)
		putdocx text ("`Country`i'' COVID-19 Mobility Factsheet"), bold
		
		putdocx paragraph, font(,14) halign(center)
		putdocx text ("`version_date'") , italic   
		putdocx paragraph,font(,10) halign(center)
		putdocx text ("This document summarizes high-frequency data on mobility, pollution, and food prices through July 2020 for Sub-Saharan Africa. The first section provides summary figures, while subsequent sections provide more detailed information on mobility, including subnational data when possible. This document was prepared by the Sub-Saharan Africa Team for Statistical Development in the World Bank’s Poverty and Equity Global Practice."), italic
/*
		putdocx text ("It was prepared by the Sub-Saharan Africa Team for Statistical Development in the World Bank’s Poverty and Equity Global Practice."), italic
*/
		putdocx save "`Countrycod`i''" ,replace
		
		if "`Countrycod`i''" !="REU" {
			* Short overview
			putdocx begin, footer(foot) header(head) 
			putdocx paragraph, style(Heading1)	
			putdocx text ("Overview")
			
			putdocx paragraph, style(Heading2)	
			putdocx text ("Figure 0.1: Mobility patterns based on cellphone location data for places of residence")
			putdocx image "Trend`Countrycod`i''_residential.png", width(10cm) height(5cm)	linebreak
			
			putdocx text ("Source: Google LLC Google COVID-19 Community Mobility Reports."), italic font(,10,black)
			putdocx text (" Please refer to Section 1 for more details for all the six sectors (Retail and recreation, Parks, Workplaces, Transit stations, Places of residence and Grocery and pharmacy), as well as changes in mobility at the sub-regional level."), italic font(,10,black)
			putdocx save "`Countrycod`i''" ,append
		}
		local kk=1
		
		if "`Countrycod`i''" !="REU" {
			local ++kk
			putdocx begin, footer(foot) header(head)		
			putdocx paragraph, style(Heading2)	
			putdocx text ("Figure 0.`kk': Percent Change in Facebook Users Movement")
			putdocx image "$facebook\graph facebook for intro\\`Countrycod`i''.png", width(10cm) height(6cm)	linebreak	
			putdocx text ("Source: Facebook Disease Prevention Maps. "), italic font(,10,black)  
			putdocx text (" For more details on indicators at the country and sub-regional levels, please refer to Section 2."), italic font(,10,black) linebreak
			putdocx save "`Countrycod`i''" ,append
		}
		if "`Countrycod`i''" !="REU" &  "`Countrycod`i''" !="ZAF" {
		    local ++kk
			putdocx begin, footer(foot) header(head)		
			putdocx paragraph, style(Heading2)	
			putdocx text ("Figure 0.`kk': Percent Change in NO2 Density from January to July 2020 Compared to the Same Month in 2019"),linebreak
			putdocx image "$facebook\graph no2 for intro\\`Countrycod`i''_NO2.png",	width(12cm) height(7.5cm)linebreak	// 
			putdocx text ("Source: Google Earth L3 composite data on NO2 derived from the Sentinel 5-Precursor satellite."), italic font(,10,black)  
			putdocx save "`Countrycod`i''" ,append
		}
		
		if "`Countrycod`i''" !="CIV" & "`Countrycod`i''" !="CPV"   & "`Countrycod`i''" !="GNB" ///
		& "`Countrycod`i''" !="NER" &  "`Countrycod`i''" !="REU" &  "`Countrycod`i''" !="TZA"  {
			local ++kk
			putdocx begin, footer(foot) header(head)		
			putdocx paragraph, style(Heading2)	
			putdocx text ("Figure 0.`kk': Percentage Change in Food Prices")
			putdocx image "$Foodprice\\`Countrycod`i''_foodprice.png",linebreak	 // width(10cm) height(6cm)	
			putdocx text ("Source: Food prices were web scraped from FAO’s Daily Food Price Monitor for all countries"),italic font(,10,black)
			putdocx text (" (http://www.fao.org/giews/food-prices/home/en/)."), italic font(,10,blue)
			putdocx text ("The Daily Price pages house food price data collected and prepared from numbeo.com to include data on February 14th, 2020 and the current day. we estimate the average price change between Feb 14th and July 31st, "), italic font(,10,black)
			putdocx text ("this is computed by calculating the percentage difference between the unit prices for each food on the dates. We average these percentage differences for each country by food category. "),  italic font(,10,black) 
			putdocx save "`Countrycod`i''" ,append
		}
		

		
 		*	Summary of percentage change in mobility by sector
		putdocx begin, footer(foot) header(head) 
		putdocx paragraph, style(Heading1)
		putdocx text ("Section 1: Google mobility data")
        putdocx save "`Countrycod`i''" ,append
		
		putdocx begin, footer(foot) header(head) 
		putdocx paragraph		
		putdocx text (" The data show how visitors to (or time spent in) categorized places change compared to the baseline. The baseline day is the median value from the 5-week period January 3 – February 6, 2020."), italic font(,11,black) 

        putdocx save "`Countrycod`i''" ,append
			
		*	Summary of percentage change in mobility by sector
		putdocx begin, footer(foot) header(head) 
		putdocx paragraph, style(Heading2)
		putdocx text ("Figure 1.1: Mobility patterns based on cellphone location data")
		putdocx image "Graph_Mobility_`Country`i''.png"	
		putdocx text ("Source: Google LLC Google COVID-19 Community Mobility Reports."), italic font(,10,black) 
		putdocx text (" https://www.google.com/covid19/mobility (Accessed: `access_date').")  , italic font(,10)	 
		putdocx text (" Figures reflect weekly average of percentage change compared to baseline."), italic font(,10,black)	 
		// putdocx pagebreak
		putdocx save "`Countrycod`i''" ,append
		
	
		putdocx begin, footer(foot) header(head) 
		putdocx paragraph

		if  `test1'!=1 {
			putdocx text (" Lockdown start dates are taken from the Kaggle website,"), italic font(,10,black) 
			putdocx text (" https://www.kaggle.com/jcyzag/covid19-lockdown-dates-by-country/version (Accessed: `access_date')."), italic font(,10) 		
		}
	    if  `test3'!=1 {  // lockdown lift date available
			putdocx text (" The lockdown lift dates are taken from the Aura Vision website,"), italic font(,10,black) 
			putdocx text (" https://auravision.ai/covid19-lockdown-tracker/ (Accessed: `access_date')."), italic font(,10) 		
		}
		// putdocx pagebreak	
        putdocx save "`Countrycod`i''" ,append
		
	
	putdocx begin, footer(foot) header(head)	
	putdocx paragraph, style(Heading2)
	putdocx text ("Table 1. Average change in Mobility for `Country`i''")
	putdocx table tbl5 = matrix(sub_SSA_mat), rownames colnames nformat(%5.1f)  halign(center) layout(autofitcontents) ///
	note("Source: Google LLC Google COVID-19 Community Mobility Reports. Table reflect simple average of percentage change compared to baseline for each period.") // title("string")
	putdocx save "`Countrycod`i''" ,append

	local j=1 // for figure 1
	* sub-region map
	if `test2'==1 & "`Country`i''"!="Reunion"  & "`Country`i''"!="Rwanda" & "`Country`i''"!="Mauritius" & "`Country`i''"!="Zimbabwe" & "`Country`i''"!="Uganda" & "`Country`i''"!="Gabon" & "`Country`i''"!="Mauritius"{  // excluding with no/no-reliable shape file
		putdocx begin, footer(foot) header(head)
		putdocx paragraph, style(Heading2)	
		putdocx text ("Sub-regional map for percentage change in Mobility")
		putdocx save "`Countrycod`i''" ,append
		
		foreach x of varlist `var' {
			if `number`x''>=2 {
				local ++j
				local labx: variable label Week_mean_`x' 
				putdocx begin, footer(foot) header(head)	
				putdocx paragraph, style(Heading2)
				putdocx text ("Figure 1.`j': Average change in `labx'")
				putdocx image "`Countrycod`i''_`x'.png" // ,height(9.5cm)
				putdocx text ("Source: Google LLC Google COVID-19 Community Mobility Reports."), italic font(,10,black) 
				putdocx text (" https://www.google.com/covid19/mobility (Accessed: `access_date'). "), italic font(,10)	
				putdocx text ("Figures reflect monthly average of percentage change compared to baseline."), italic font(,10,black)	
				putdocx save "`Countrycod`i''" ,append
			} // end if
		} // end foreach	
		
	} // end if
	copy "`Countrycod`i''.docx" "$google\\`Countrycod`i''.docx",replace

	