
%global git_macro_version git_macro_version_date;
%let git_macro_version = 0.1.3;
%let git_macro_version_date = 07/07/2020;

%if %symexist(dir_path) %then %do;
%include "&dir_path\&local_folder\macros\macro1.sas";

%include "&dir_path\&local_folder\macros\beep.sas";
%include "&dir_path\&local_folder\macros\read_json.sas";
%include "&dir_path\&local_folder\macros\delete_all.sas";
%end; 
%else %do;  
	%put ERROR: Macros SBE: la macrovariable "dir_path" doit être déclarée;
%end; 

