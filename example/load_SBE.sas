
/*
* Macro de chargement du git, à importer manuellement
*/
%macro load_SBE(dir_path /* chemin (absolu) vers l'espace de travail local */, 
				git_url=https://github.com/DanChaltiel/macro_sas.git /* repository git à charger */, 
				version=master /*version: release, tag, branch ou hash*/,
				local_folder=git_macro /* nom du dossier à créer pour contenir le clone*/);

%let git_macro_path = &dir_path\&local_folder;
filename git_path "&git_macro_path";
%if %sysfunc(fexist(git_path)) %then %do; 
	%put NOTE: Le dossier "&local_folder" existe déjà dans le répertoire &dir_path.;
	%put NOTE- Les macros ne seront pas mises à jour depuis GitHub.;
	%put NOTE- Supprimer le dossier "&local_folder" pour récupérer la dernière version.;
%end; 
%else %do;  
	%put NOTE: Clonage du git des macros SBE;
	data _null_;
	    rc = gitfn_clone("&git_url", "&git_macro_path");
	    put rc=;
		run;
	%if &version ne master %then %do;
		data _null_;
			rc = gitfn_co_branch("&git_macro_path", "&version");
			put rc=;
			run;
		%put NOTE: Clonage terminé, version "&version" installée;
		%end;
	%else %do;
		%put NOTE: Clonage terminé, dernière version installée;
		%end;
%end; 

%include "&dir_path\&local_folder\_autoexec.sas";
%put NOTE: Chargement des macros SBE version &git_macro_version du &git_macro_version_date;
%mend;