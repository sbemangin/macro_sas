

%let dir_path = C:\Users\D_CHALTIEL\Documents\GitHub\macro_sas\example;

%include "&dir_path\loadSBE.sas";

/*Paramètre principal : 
	dir_path = le dossier de travail 
*/
%load_SBE(dir_path=&dir_path);

/*Appel d'une fonction test, définie sur github*/
*https://github.com/DanChaltiel/macro_sas;
*%test_print;



/*Autres paramètres : 
	git_url = le git cible (pas obligatoirement github, on pourrait même utiliser nextcloud avec un peu d'administration)
	version = la version à installer. Peut être un numéro de release (v2, v3), une branche, un tag ou même un hash (0f757b2)
	local_folder = le dossier local où seront chargées les macros. Changer pour réinstaller autre part sans supprimer le dossier précédent.
*/
%let git_url = https://github.com/DanChaltiel/macro_sas.git;
%load_SBE(dir_path=&dir_path, git_url=&git_url, version=0f757b2, local_folder=git_macro_v2);

