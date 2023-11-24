sudo pip install --upgrade awscli && hash -r
sudo apt update
sudo apt install jq gettext bash-completion moreutils -y
rm -vf ${HOME}/.aws/credentials
export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account
export STS_RESPONSE=$(aws sts assume-role --role-arn arn:aws:iam::${ACCOUNT_ID}:role/Docker-Workshop-Admin --role-session-name $(uuidgen) --duration-seconds 3600)
export AWS_ACCESS_KEY_ID=$(echo $STS_RESPONSE | jq .Credentials.AccessKeyId | tr -d \")
export AWS_SECRET_ACCESS_KEY=$(echo $STS_RESPONSE | jq .Credentials.SecretAccessKey | tr -d \")
export AWS_SESSION_TOKEN=$(echo $STS_RESPONSE | jq .Credentials.SessionToken | tr -d \")
export AWS_DEFAULT_REGION=us-east-1
		        
