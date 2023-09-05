# CatSay - Make Carlos Rosario and Zoni Say Things

This is the app for the Docker Book.

## Use

* `bin/setup` will install all needed Ruby Gems and Node modules
* `bin/run` will run the app on localhost, port 3000.  To change the binding, set `BINDING` in the environment.

Notes:

* If you have Redis, it is expected to be at `redis://redis:6379/1`.  If you don't have Redis, the app should still work
