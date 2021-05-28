# Root level variables that all modules can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed directly into the modules.

# Common used variable 

# Syntax <ID Cliente>-<AWS Accound ID>-​<ENVIROMENT>-<PROJECT>-TF

account_id = "${get_aws_account_id()}"
