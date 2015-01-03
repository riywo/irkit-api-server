# IRKit API Server

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Usage

### Create irkit.json
Before deploy to heroku, you must finish creating your `irkit.json` using `ruby-irkit` CLI. For example:

````
$ gem install irkit
$ irkit --get foo
$ irkit --get bar
$ irkit --device:add living
$ ls ~/.irkit.json
/Users/riywo/.irkit.json
````

See also: https://github.com/shokai/ruby-irkit

### Upload irkit.json somewhere else
Then, upload the `.irkit.json` content to a web server publicly accessible. This contains some private infomation such as clientkey or deviceid, so private gist is a nice place to put it on. You will get a URL of raw file like `https://gist.githubusercontent.com/riywo/.../raw/.../irkit.json`.

### Deploy and enjoy it!
Now you can deploy via Heroku deploy button. You have to set `IRKIT_DATA_FILE` as the URL you got above.

After deployed, check `SECRET_TOKEN` in the configuration variables.

OK, let's play the api for you!

````
$ curl -X POST https://your-app-name.herokuapp.com/SECRET_TOKEN/api/living/tv_on
$ curl -X POST https://your-app-name.herokuapp.com/SECRET_TOKEN/api/living/tv_off,airconditioner_off
````
