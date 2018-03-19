# Social!
Welcome to Social, a fresh social network built on Ruby on Rails.

## Getting Started
In order to begin poking around with what I'm working on, you'll need the following tools installed.
* Ruby
* Ruby on Rails
* mySQL

## Grab the Code!
1. First, create a new working directory for yourself:
```
$ mkdir work
$ cd work
```
2. Then, clone this repo into the folder, and enter it.
```
$ git clone https://github.com/lfroms/social.git
$ cd social
```
3. Run Bundler to install all the necessary dependencies.
```
bundle install
```
4. At this point, you'll need to set up a mySQL server on your machine.  You may need to reference `config/database.yml` for any authentication defaults.  Once that's done, run
```
$ rake db:setup
$ rake db:migrate
```
5. Yay!  You're all set (assuming I didn't miss any steps).  Run your server with:
```
$ rails server
```
You can now access the page at `http://localhost:3000`.
