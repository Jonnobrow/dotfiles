# Work Laptop
if [[ "$(hostname)" == "UKCCWQPCWJV2" ]]; then
  
  # SP AWS Aliases
  alias sp-dev-admin='export AWS_PROFILE="sp-dev-admin" && aws_login'
  alias sp-stage-admin='export AWS_PROFILE="sp-stage-admin" && aws_login'
  alias sp-prod-admin='export AWS_PROFILE="sp-prod-admin" && aws_login'
  alias sp-test-admin='export AWS_PROFILE="sp-test-admin" && aws_login'
  alias sp-regression-admin='export AWS_PROFILE="sp-regression-admin" && aws_login'
  alias sp-mgmt-admin='export AWS_PROFILE="sp-mgmt-admin" && aws_login'
  
  # Random String
  randstr() {
    len=${1:-16}
    tr -dc A-Za-z0-9 </dev/urandom | head -c $len; echo
  }
  
  aws_login() {
    SSO_ACCOUNT=$(aws sts get-caller-identity --query "Account")
    if ! [ ${#SSO_ACCOUNT} -eq 14 ]; then
      aws sso login
    fi
  }
  
  codeartifact_login() {
    sp-mgmt-admin
    export CODEARTIFACT_AUTH_TOKEN=$(aws codeartifact \
      get-authorization-token \
      --domain sky-protect \
      --domain-owner 872609768854 \
      --region eu-west-1 \
      --query authorizationToken \
      --output text)
  
    bundle config https://sky-protect-872609768854.d.codeartifact.eu-west-1.amazonaws.com/ruby/gems/ aws:${CODEARTIFACT_AUTH_TOKEN}
    export BUNDLE_SKY___PROTECT___872609768854__D__CODEARTIFACT__EU___WEST___1__AMAZONAWS__COM="aws:${CODEARTIFACT_AUTH_TOKEN}"
    aws codeartifact login --tool pip --repository pips --domain sky-protect --domain-owner 872609768854 --region eu-west-1
  }

fi
