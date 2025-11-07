# Setting up a new Mac

## What this does
* Configures your machine with default applications (based on my preferences) (`Brewfile`)
* Configures simple MacOS system settings (`.macos`)
* Installs developer tools like iTerm2, Cursor, and the Fish shell (`Brewfile`)
* Installs relevant packages to help you run TypeScript/Node/Python/PostgreSQL apps (`Brewfile`)
* Stores commands for the Fish shell (`.config/fish/config.fish`)

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

If using the Fish shell, add `.config/fish/config.fish` to your local machine at that directory.
