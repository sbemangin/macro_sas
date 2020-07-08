# Example

## Mise en place
Dans un dossier, mettre les fichiers `example.sas` et `git_utils.sas`.
Lancer `example.sas` en mettant à jour la variable `dir_path` comme le chemin vers le dossier.

## Explication
La macro `install_git` va copier toutes les macros du git dans un sous-dossier "git_macro" et charger toutes les macros décrites dans `_autoexec.sas`.

Par défaut:

 - le git cible est celui-ci (modifiable via le paramètre `git_url`)
 - le sous-dossier s'appelle "git_macro" (modifiable via le paramètre `local_folder`)
 - la version cible est la dernière en ligne, sur la branche master (modifiable via le paramètre `version`)
 
Si le sous-dossier `local_folder` ("git_macro") existe déjà, les macros seront chargées mais pas mises à jour. Changer ce paramètre permet de tester plusieurs versions simutanément:

```sas	
%let dir_path = /*dossier*/ ;
%install_git(dir_path=&dir_path, version=v2, local_folder=git_macro_v2);
%put NOTE: git_macro_version=&git_macro_version;
%install_git(dir_path=&dir_path, version=v0.1.2, local_folder=git_macro_v3);
%put NOTE: git_macro_version=&git_macro_version;
```

```bash
NOTE: git_macro_version=0.1.1
NOTE: git_macro_version=0.1.2
```