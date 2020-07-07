
%let test_print_version = 3;

%macro test_print;
	title Git repository v&git_macro_version du &git_macro_version_date;
	proc freq data=sashelp.baseball;
	   	table team;
		run;
%mend;

