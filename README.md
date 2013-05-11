utility
====

Deploy
------

The simplest way is to run `./deploy.sh`. 
It will symlink those utilities to where they belong. 
If the destination already exists and isn't a symlink from us, `deploy.sh` will do nothing but to prompt you.  
Be sure to read the output and manually process the conflicts. 
Or, some of my utilities may not work due to lack of dependency. 

You can use `./deploy.sh | grep -i warning -B 3` to get a list of conflict rules.

