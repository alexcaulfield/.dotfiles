# Setting up a new Mac

## What this does
* Configures your machine with default applications (based on my preferences)
* Configures simple MacOS system settings
* Installs developer tools like iTerm2, Cursor, and the Fish shell
* Installs relevant packages to help you run TypeScript/Node/Python/PostgreSQL apps

## Steps

Clone this repo
```sh
git clone https://github.com/alexcaulfield/.dotfiles.git
```

Then run
```sh
cd .dotfiles
ls -a # see what files are available
chmod u+x run.sh
./run.sh
```

When getting the dev environment setup, you may need to run
```sh
fisher install edc/bass
```
Which will enable `bass` to help run `nvm` in the `fish` shell
