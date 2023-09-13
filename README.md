# CatSay - Make Carlos Rosario and Zoni Say Things

This is the app for the Docker Book.

## Use

* `bin/setup` will install all needed Ruby Gems and Node modules
* `bin/run` will run the app on localhost, port 3000. By default, it binds to 0.0.0.0. You can change this in `.env.development` and `.env.test`

Notes:

* If you have Redis, it is expected to be at `redis://redis:6379/1`.  If you don't have Redis, the app should still work.
* Tests will expect Redis on `redis://redis:6379/2` and if it's not available, some tests are skipped. You'll see the messages.
