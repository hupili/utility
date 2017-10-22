utility
=======

   * Configs, e.g. many dotfiles. 
   * Tools for daily use. 

Deploy (for Linux)
------------------

The simplest way is to run `./deploy.sh`. 
It will symlink those utilities to where they belong. 
If the destination already exists and isn't a symlink from us, `deploy.sh` will do nothing but to prompt you.  
Be sure to read the output and manually process the conflicts. 
Or, some of my utilities may not work due to lack of dependency. 

You can use `./deploy.sh | grep -i warning -B 3` to get a list of conflict rules.

Deploy (for MAC)
----------------

Since my `deploy.sh` uses some commands in Linux way, 
those options may not be available (or correct) on a MAC. 
I'm highly accustomized to the Linux commands so I have to get them back:

   * Install [HomeBrew](https://github.com/mxcl/homebrew).
   Remember to `brew doctor` and `brew update` before you proceed. 
   * Install Linux core-utils: `brew install coreutils` (or more verbosely init all suggested default brew tools from [mac/brew-init.sh](mac/brew-init.sh) )
   * Use GNU bins: `export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH`

After the preparation, everything is just as Linux. 
`deploy.sh` it!

Note, may need to modify `mac/home-bin/gen.sh`
to work with the latest version of brew-ed core-utils.

Check Errors
------------

Use `./deploy.sh | grep -i warning -B 3`
to detect whether there is any problem


