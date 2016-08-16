#!/bin/bash

rake assets:precompile RAILS_ENV=production

read -r -p "Git commit (y/n) ? " gitresponse
if [ "$gitresponse" = "y" ]; then
	read -r -p "Enter commit message: " commitmsg
	git commit -am "$commitmsg"
fi

rsync -azPh --stats ../Bitnote/ root@139.59.28.15:~rails/Bitnotes
