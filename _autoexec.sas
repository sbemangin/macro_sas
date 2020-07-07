
%global git_macro_version git_macro_version_date;
%let git_macro_version = 0.1.1;
%let git_macro_version_date = 07/07/2020;

%if %symexist(dir_path) %then %do; %end; 
%else %do;  
	%put ERROR: Macros SBE: la macrovariable "dir_path" doit être déclarée;
%end; 

%include "&dir_path\&local_folder\macro1.sas";