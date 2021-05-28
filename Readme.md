# MedGold Processing Live

## How to use this project

* Export your key and secret key in your terminal (you can find them in your AWS console)
* Go into the dev folder
* Exec the command `source .env`
* Go into the common folder
* Exec the command `terragrunt apply`

## How to extend the project
This project was implemented using the git flow paradigm. If you want to extend it then follow this steps: 

* Install git flow
* Exec `git flow init` in order to initialize git flow. Leave all default values
* Exec`git flow feature start <nome_feature>` in order to have a private branch in which you can freely work.
    * It it's a group project, and your colleagues had already create the branch in which you have to work, you can use `git branch feature/<nome_feature>` in order to use that branch
* When you're finished, create a PR to the develop branch. After a revision someone else will accept (or deny) it