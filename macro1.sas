/*
https://documentation.sas.com/?docsetId=lefunctionsref&docsetTarget=n10pxql65jtf4sn11m3d6jzcrgcz.htm&docsetVersion=9.4&locale=en
https://github.com/DanChaltiel/macro_sas
*/


%let git_version = 1;

%macro test_print;
	title Git repository v&git_version;
	proc freq data=sashelp.baseball;
	   	table team;
		run;
%mend;



%test_print;

