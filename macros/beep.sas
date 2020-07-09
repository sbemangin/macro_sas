/*
* Emet un son à une fréquence donnée. Utile pour signifier qu'un long programme a fini de tourner
* source : https://documentation.sas.com/?docsetId=hostwin&docsetTarget=p0wbvz5uovd30dn1kdpgt00gspfz.htm&docsetVersion=9.4&locale=en
* Voir aussi : https://support.sas.com/resources/papers/proceedings/proceedings/sugi29/048-29.pdf
*/
%macro beep(freq=440 /*440Hz: La3*/, time=1000 /*duration in milliseconds*/);
data _null_;
	call sound(&freq, &time); 
	run; 
%mend beep;
