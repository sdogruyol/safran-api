# Safran API

This is the unofficial Safran API.

It fetches the latest stories from Safran every one hour and serves it as a JSON API for client consuming.

# Routes

You can check 'routes.rb' file for the api paths.


# Usage

If you are starting the app for the **first time**. You better fetch some stories. To do so:

    cd safran-api && bundle exec rails c
    MainParser.new

And then boot up your Rails serve to serve JSON

    bundle exec rails s

## Installation

	git clone https://github.com/Sdogruyol/safran-api
	cd safran-api && bundle install
    bundle exec rake db:migrate
	bundle exec whenever --update-crontab
	

## Contribution

All contribution and Pull Requests are welcome.