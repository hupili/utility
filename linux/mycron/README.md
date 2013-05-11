# Centralized Cron Manage

## Usage

   * Edit cron jobs in `crontab.d` directory. 
   There is a sample file. 
   Every line is a valid crontab description. 
   * For those jobs you want to enable, make a 
   soft link to `enabled` directory. 
   e.g `cd enabled` and then `ln -s ../crontab.d/sample.cron ./`.
   * Run `./refresh-cron.sh` after every modification of `enabled` dir.

