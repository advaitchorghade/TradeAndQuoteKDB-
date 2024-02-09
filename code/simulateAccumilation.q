
openAccumilation:{[sym]
    first_tick_of_mkt_open: select Open: first last_dup by date from tss where daytime >= 09:30:00, cond1 = 1;
  	hit: select Hit_Open: avg(1_(4 sublist bid)) by date from tss where cond1 = 1;
  	lift: select Lift_Open: avg(1_(4 sublist ask)) by date from tss where cond1 = 1;
  	tmp_final: first_tick_of_mkt_open+hit+lift;
  	final: (`date,(`$"Open_", string sym),(`$"Hit_Open_", string sym),(`$"Lift_Open_",string sym)) xcol tmp_final;
    final
  	}
