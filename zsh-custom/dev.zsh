## python
### clean python outputs
pyclean(){
    find . -name "*.pyc" -exec rm -f {} \;
}

alias tiv="terraform init -backend=false -upgrade && terraform validate"
alias tibv="terraform init && terraform validate"

