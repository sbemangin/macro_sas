/*
* Load a JSON file into macrovariables. Useful for config files.
*/
%macro readJSON(JSONfile);
filename jsonxmp &JSONfile;
libname jstest JSON fileref=jsonxmp;
data _null_;
	set jstest.root;
	array xxx{*} _numeric_;
	do i=1 to dim(xxx);
		call symputx(vname(xxx[i]), xxx[i], "G");
		end; 
	array yyy{*} $ _character_;
	do i=1 to dim(yyy);
		call symputx(vname(yyy[i]), yyy[i], "G");
		end; 
	run; 
%mend readJSON;
