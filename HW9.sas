data datesy;
input @1 Name $4. @6 Bday ddmmyy8.;
format Bday ddmmyy8.;
datalines; 
Noel 25/12/53
Hank 29/2/56
Mary 31/12/99
Eric 1/1/03
Jane 4/7/07
;


proc print data=dates;
   title 'students';
format Bday ddmmyy10.;   
run;

data dates;
set datesy;
format Bday ddmmyy8.;
Bweek = day(Bday);
Bmonth = month(Bday);
format Age1 date9.;
Age1 = today()-Bday; /*I subtracted 3/29/2022 with the number of days from Bday*/
Age2 = intck('years', Bday, today());
format school1 ddmmyy8.;
school1 = Bday+3653;
format school2 ddmmyy8.;
school2 = intnx('year', Bday, 18, 's');
run;


proc means data=dates;
var Age1;
run;

data strings;

input @1 id $8. @11 color $5.;
State = substr(id,1,2);
CID = compress(id);
NIC = substr(id,4,6);
Upper = upcase(color);
datalines;
NY 243312 Red
NC 35646  BLUE
CA 456    GrEeN
;
run;











