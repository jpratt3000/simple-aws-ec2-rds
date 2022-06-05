ifndef STACK
    $(error STACK is undefined, options: dev, qa)
endif

%-plan: .terraform/terraform.tfstate
    terragrunt plan \
        -var-file=stack/$(STACK).tfvars \
        -out $(*).plan

%-apply: %.plan
    terragrunt apply $(*).plan

%-plandestroy: .terraform/terraform.tfstate
    terragrunt plan \
        -var-file=stack/$(STACK).tfvars \
        -destroy -out $(*)-destroy.plan

%-refresh: .terraform/terraform.tfstate
    terragrunt refresh \
        -var-file=stack/$(STACK).tfvars

%-destroy: %-destroy.plan
    terragrunt apply $(*)-destroy.plan

plan: $(STACK)-plan

apply: .terraform/terraform.tfstate $(STACK)-apply

plandestroy: $(STACK)-plandestroy

refresh: $(STACK)-refresh

destroy: $(STACK)-destroy clean

.terraform:
    mkdir .terraform
    tfenv install
    tgenv install
    terraform get

.terraform/terraform.tfstate: .terraform
    terragrunt init \
        -backend-config=stack/$(STACK).tfvars

clean:
    rm -f *.plan
    rm -rf .terraform

.PHONY: clean %-apply