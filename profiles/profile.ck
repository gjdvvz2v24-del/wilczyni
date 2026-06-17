PATH=$PATH:/opt/homebrew/opt/postgresql\@12/bin/

tf-local () {
    if [ $1 -eq 0 ]; then
        find tfvars -type f -exec gsed -e 's/avengers\/admin/jenkins-worker\/deployment/g' -i {} \;
    fi

    if [ $1 -eq 1 ]; then
        find tfvars -type f -exec gsed -e 's/jenkins-worker\/deployment/avengers\/admin/g' -i {} \;
    fi
}

alias cd-glue="cd /Users/ck-GP/Work/glue/data"
alias cd-utility="cd ~/Repo/utility/utility-application-terraform-deployment"
alias cd-utility-opensearch="cd ~/Repo/utility/utility-opensearch-terraform-deployment"
alias cd-ckid="cd ~/Repo/gpe-deploy-circlekid"
alias cd-pass="cd /Users/ck-GP/.password-store"
