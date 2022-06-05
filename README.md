# Simple AWS EC2 and RDS setup
This repo will spin up a set number of EC2 instance and an RDS instance in the usw2 region by default. Everything can be overridden in the `.tfvars` file if needed

## Setup
1. `brew install terraform terragrunt terratest tfenv tgenv`
1. add the following to your bash_profile  
    * `alias terraform='tfenv install | terraform'`
    * `alias terragrunt='tgenv install | terragrunt'`

## Running
This repo works on a `stack` concept via the corresponding `make` file
*

### Notes:
This nothing supa dupa fancy, but should provide a complete infrastructure for `dev`,`qa`,`stage` and `prod` envrionments.
Connecting it to a `CI/CD` pipeline would involve targeting the correct `/env`