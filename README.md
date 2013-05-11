utility
=======

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
   * Install Linux core-utils: `brew install coreutils`
   * To not conflict MAC's commands, those Linux commands will be prefixed with a "g". 
   You can find them in either `/usr/local/bin/guname`
   or `../Cellar/coreutils/8.21/bin` (assume coreutils 8.21).
   You should link them to a place in your `$PATH` using the name without "g" prefix. 

After the preparation, everything is just as Linux. 
`deploy.sh` it!
