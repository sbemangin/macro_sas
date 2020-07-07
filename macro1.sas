
%let test_print_version = 2;

%macro test_print;
	title Git repository v&git_version;
	proc freq data=sashelp.baseball;
	   	table team;
		run;
%mend;

