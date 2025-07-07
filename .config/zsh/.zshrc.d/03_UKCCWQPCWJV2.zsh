# Work Laptop
if [[ "$(hostname)" == "UKCCWQPCWJV2" ]]; then
  
  # Aliases for samlaz
  alias samlazdev='samlaz -e skycloud-gtvd-res-sds-dev -r skycloud-az-residentAdmins-dev && export AWS_PROFILE="skycloud-gtvd-res-sds-dev:skycloud-az-residentAdmins-dev" && export AWS_SHARED_CREDENTIALS_FILE=~/.aws/credentials'
  alias samlazmgmt='samlaz -e skycloud-gtvd-res-sds-mgmt -r skycloud-az-residentAdmins-mgmt && export AWS_PROFILE="skycloud-gtvd-res-sds-mgmt:skycloud-az-residentAdmins-mgmt" && export AWS_SHARED_CREDENTIALS_FILE=~/.aws/credentials'
  alias samlaznonp='samlaz -e skycloud-sds-res-uk-nonp -r skycloud-az-residentAdmins-nonp && export AWS_PROFILE="skycloud-sds-res-uk-nonp:skycloud-az-residentAdmins-nonp" && export AWS_SHARED_CREDENTIALS_FILE=~/.aws/credentials'
  alias samlazprod='samlaz -e skycloud-sds-res-uk-prod -r skycloud-az-residentAdmins-prod && export AWS_PROFILE="skycloud-sds-res-uk-prod:skycloud-az-residentAdmins-prod" && export AWS_SHARED_CREDENTIALS_FILE=~/.aws/credentials'

  # SP AWS Aliases
  alias sp-mgmt-admin='export AWS_PROFILE="sp-mgmt-admin" && aws sso login'
  alias sp-dev-admin='export AWS_PROFILE="sp-dev-admin" && aws sso login'
  alias sp-stage-admin='export AWS_PROFILE="sp-stage-admin" && aws sso login'
  alias sp-prod-read='export AWS_PROFILE="sp-prod-read" && aws sso login'

fi
