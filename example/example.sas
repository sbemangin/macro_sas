
/*Pour plus d'informations, aller sur https://github.com/DanChaltiel/macro_sas/tree/master/example*/


*1) On change 'dir_path';
%let dir_path = C:\Users\d_chaltiel\Documents\GitHub\macro_sas\example;


*2) on inclut les macros git;
%include "&dir_path\git_utils.sas";


*3) on utlise 'install_git' pour installer le repository et charger les macros;
*le dossier 'git_macro' apparait dans le dossier désigné par 'dir_path';

/*Paramètre principal : 
	dir_path = le dossier de travail 
*/
%install_git(dir_path=&dir_path);
%put WARNING: INSTALL_GIT: git_macro_version=&git_macro_version;


*4) On peut maintenant appeler toutes les fonctions définies dans le dossier "macros" du repo git;

/*Par exemple, voici un appel d'une fonction test, définie dans le fichier macro1.sas, qui lance une proc freq.
Voir un exemple de dossier sur https://github.com/DanChaltiel/macro_sas/tree/master/macros*/
%test_print;


*5) (optionnel) On peut également installer une version spécifique, dans un dossier local spécifique;

/*Autres paramètres : 
	git_url = le git cible (pas obligatoirement github, on pourrait même utiliser nextcloud avec un peu d'administration)
	version = la version à installer. Peut être un numéro de release (v2, v3), une branche, un tag ou même un hash (e.g. 0f757b2, pointant vers la version 0.1.1)
	local_folder = le dossier local où seront chargées les macros. Changer pour réinstaller autre part sans supprimer le dossier précédent.
*/
%let git_url = https://github.com/DanChaltiel/macro_sas.git;
%install_git(dir_path=&dir_path, git_url=&git_url, version=0f757b2, local_folder=git_macro_v2);


%put WARNING: INSTALL_GIT: git_macro_version=&git_macro_version;