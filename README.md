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
   * Install Linux core-utils and zsh: `brew install coreutils zsh` (or more verbosely init all suggested default brew tools from [mac/brew-init.sh](mac/brew-init.sh) )
   * Use GNU bins: `export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH`
   * Modify `mac/home-bin/gen.sh` to work with the latest version of brew-ed core-utils (use `brew info coreutils` to lookup for version).
   * Deploy the utilities: `deploy.sh` it!
   * In System Preferences --> Accounts, find your user name and right click for "Advanced Options". Change the "Login shell" to `/usr/local/bin/zsh`
     * `chsh -s /bin/zsh`

Optional:

   * Checkout the `mac/` folder for more.
   * Install the "IR Black Terminal" theme. Open Terminal, use commai+i to open the settings, choose the theme, right click, set default.

Check Errors
------------

Use `./deploy.sh | grep -i warning -B 3`
to detect whether there is any problem

Other MAC tips
--------------

* Make "option" (alt) to act as "meta" in the Terminal's preference, under keyboard panel. See more: https://stackoverflow.com/a/5542996
