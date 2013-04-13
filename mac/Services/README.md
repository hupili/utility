# My Services

## Usage

   * Put the `*.workflow` dir in your `~/Library/Services/`.
   * Configure hotkey for the service if necessary. 
   ("System Preferen" -- "Keyboard" -- "Keyboard Shortcuts" -- "Services")

## Short Introduction

   * `Open Terminal.workflow`:
   It just opens a new Terminal. 
   I bind it to a global keyboard shortcut.
   * `copy POSIX path.workflow`:
   MAC do not have "address bar" which you are familiar with under Windows.
   This service adds an item to your "right click" menu. 
   Use it to copy the POSIC path of files or folders. 
   * `make soft link.workflow`:
   A suggestion: **Do not use MAC's "make alias"** menu item.
   It's a weird and old thing. 
   The alias is only effective in Finder -- really annoying. 
   You can not `cd` into an alias. 
   Whenever I want to make an alias, I would use this service instead
   -- it creates a soft link, which is effective everywhere. 
   * `unrar it.workflow`:
   It seems MAC only uncompress "zip" by default. 
   I don't know whether there are better ways.
   Since workflow is so easy to write, I just make this one for common "rar" types.
