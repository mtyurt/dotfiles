# There are lots of well-built tools that completely manage your
# AWS profiles and login and credentials, like aws-vault and AWSume.
# This isn't that.
# I tend to prefer to go as lightweight as possible around AWS-produced tools.
# So all this does is set and unset your AWS_PROFILE environment variable.

# You might also be interested in aws-whoami
# which improves upon `aws sts get-caller-identity`
# https://github.com/benkehoe/aws-whoami

awsprofile () {
  # USAGE:
  # aws-profile              <- print out current value
  # aws-profile PROFILE_NAME <- set PROFILE_NAME active
  # aws-profile --unset      <- unset the env vars
  if [ -z "$1" ]; then
    echo $AWS_PROFILE$AWS_DEFAULT_PROFILE
  elif [ "$1" = "--unset" ]; then
    echo 'Unsetting active AWS profile...'
    AWS_PROFILE=
    AWS_DEFAULT_PROFILE=
    export AWS_PROFILE AWS_DEFAULT_PROFILE
  else
    AWS_DEFAULT_PROFILE=
    export AWS_PROFILE=$1
    export AWS_DEFAULT_PROFILE
  fi;
}

