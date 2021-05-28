# Use --terragrunt-source-update to clean up the tmp folder if anything goes wrong
# Use --terragrunt-source ../relative/path//to to point to a local checkout at XXX

terragrunt = {
  remote_state {
    backend = "s3"

    config {
      encrypt = true
      bucket  = "${get_env("TF_VAR_customer", "unknown")}-${get_aws_account_id()}-${get_env("TF_VAR_environment", "exp")}-${get_env("TF_VAR_project", "example")}-tf"
      key     = "${path_relative_to_include()}/terraform.tfstate"
      region  = "${get_env("TF_VAR_aws_region", "eu-west-1")}"
      # profile = "toc"

      # dynamodb_table = "terraform-locks"
    }
  }

  # Configure root level variables that all resources can inherit
  terraform {
    extra_arguments "env" {
      commands = ["${get_terraform_commands_that_need_vars()}"]

      optional_var_files = [
        "${get_tfvars_dir()}/${find_in_parent_folders("env.tfvars", "ignore")}",
        "${get_tfvars_dir()}/terraform.tfvars",
      ]
    }
  }
}