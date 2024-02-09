// Create a function to format TAQ data.


formatData:{[sym]
  // Function: reads TAQ file and formats the data.
  // Input: 'sym' : ticker as symbol type
  // Output: Formatted table
	dir: `$""sv string (`:data/,sym,`$"_0900_to_0940.csv"); 
	t:("ID*FF*FFFFFFFF"; enlist ",")0: dir;
	t:update last_dup: t`last from t;  // There is an issue where KDB cannot read the "last" column using qSQL - solution - duplicate the column. 
	t: update spread: ask - bid from t;
	t: update time: "J"$("C"$11#'string time) from t;
	tss: update time: "p"$("f"$("p"$t`date) + "f"$("p"$(1000*t`time))) from t;
	tss: update daytime: `time$time from tss;
	tss: `time xasc tss;
  tss
