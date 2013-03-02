#!/bin/sh
set -x
idtfile=id_rsa.bitbucket
mkdir -p $HOME/.ssh/bitbucket
cd $HOME/.ssh/bitbucket
ssh-keygen -t rsa -C "wargs.no2tm@gmail.com" -f $idtfile
chmod 700 $HOME/.ssh/bitbucket
chmod 600 $idtfile

cat >> ~/.ssh/config <<_EOT_

Host bitbucket
	HostName bitbucket.org
	IdentityFile ~/.ssh/bitbucket/$idtfile
	User git
	Port 22
	TCPKeepAlive yes
	IdentitiesOnly yes
_EOT_

echo "paste this text(include mail address) to bitbucket add key form "
cat $idtfile.pub

# ssh-agent $SHELL
# ssh-add ~/.ssh/bitbucket/$idtfile
# git clone git@bitbucket.org:wolverine6/note.git

