# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform that supports locking and enforces best
# practices: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

terragrunt = {
  # Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the working directory, into a temporary folder, and execute your Terraform commands in that folder.

  # Replace MODULE_REPOSITORY_NAME with the name of git repo containing the iac modules. Ends with "//" and module name (= name of containing folder)  
  terraform {
    #source = "git::ssh://git@bitbucket.org/beetobit/medgold-mods//common"
    source = "../../../mdg-bias-mods//common" 
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# MODULE DEPENDENCIES
# These are the modules to create before this
# Used by `terragrunt plan-all` and `terragrunt apply-all` commands  ---------------------------------------------------------------------------------------------------------------------


# UNCOMMENT to activate
# dependencies {
#   paths = ["../common", "../mysql", "../redis"]
# }


# ---------------------------------------------------------------------------------------------------------------------
# MODULE PARAMETERS
# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
# ---------------------------------------------------------------------------------------------------------------------

dataset="era5"
project="medgold-BD"
role="DB"
environment="dev"
EOBS-vars=["t2m","tmin","tmax","tp"]
ECMWF-vars=["tmin","tmax","t2m","tp", "10u", "10v", "2d", "ssrd"]
ERA5-vars=["t2m","tmin", "tmax", "tp", "ssrd", "rh"]
