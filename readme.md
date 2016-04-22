## Base dev box
Updated dev box based on inherited config from MakerSquare. Fixed rbenv rights issue(requires sudo), added rails and meteor. This install requires Vagrant to be installed. Please download it from https://www.vagrantup.com/ if you have not, otherwise this will not work.

##### When setting up, please place in/create folder user/code/devenv or change the folder listing yourself in the VagrantFile line for synced_folder.

After completing this step, cd to the folder you have cloned this repo to and run 'vagrant up', then when finished, run 'vagrant provision' due to rbenv rights issue. If you still run in to install errors in regards to rbenv, just run 'sudo chown -Rf vagrant ${home}/.rbenv'

### includes:
-Rails
-Rbenv
-NodeJS
-MeteorJS
-Sqlite3
-PostgreSQL
-Git
-VIM
-ohmyzsh
-Pry
-Mini Magick

#### When running meteor, run 'sudo meteor' to get the meteor server correctly talking to the database.
#### If you need Mongo installed for something other than MeteorJS, I would highly suggest installing seperately.
