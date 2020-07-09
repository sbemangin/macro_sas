/*
* Supprime toutes les macrovariables présentes
* Source : https://blogs.sas.com/content/sastraining/2018/05/07/deleting-global-macro-variables/
*/
%macro delete_all; 
	options nonotes; 
	%local vars; 
	proc sql noprint;
		select name into: vars separated by ' '
		from dictionary.macros
		where scope='GLOBAL' 
		and not name contains 'SYS_SQL_IP_';
		quit; 
	%symdel &vars; 
	options notes; 
	%put NOTE: Macro variables deleted.; 
%mend delete_all;