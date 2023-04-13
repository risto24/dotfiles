export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
# export PATH=$HOME/.nodebrew/current/bin:$PATH
export ANDROID_SDK=~/Library/Android/sdk
export PATH=~/Library/Android/sdk/platform-tools:$PATH
export PGDATA=/usr/local/var/postgres
export PATH=$PATH:/usr/local/go/bin

export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

export AWS_PROFILE=saml
export ONELOGIN_MFA_IP_ADDRESS=$(curl -SsL http://checkip.amazonaws.com/)

