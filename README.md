# CouncilSpeak Matchmaking

This platform aspires to connect citizens who want to speak
on-the-record in front of City Council, with volunteers who can make it
happen.

Speakers simply record a short video addressing an upcoming
agenda item, and we'll do the work of finding a fellow citizen to ensure
it's seen during the related discussion at City Hall.

### Setup

Requirements:

* SQLite3
* Ruby 2.3.1

```
bundle install
bundle exec rake db:setup
bundle exec rails server
```

### Heroku

Requirements:

* Heroku Toolbelt

```
heroku create myappname
heroku addons:create heroku-postgresql:hobby-dev
heroku addons:create sendgrid:starter
git push heroku master
heroku run rake db:schema:load
heroku run rake db:migrate
heroku run rake db:seed
```

### Inspiration

This project was inspired by the amazing [SpeakTO
project](https://github.com/xenyal/tplhack), created during the "Remote
Deputations" Challenge at the [TO Prosperity
Hackathon](http://www.torontopubliclibrary.ca/hackathon/)<super>1</super>.

<super>[1]: Supporting document: [Google Doc - Challenge
Summaries](https://docs.google.com/document/d/1o5Q8Od25HvMXVYQqK2pjpl6k8Z1as5fxeovfi37S68w/edit?ts=5798eb82#heading=h.vyblhz62pbr3)</super>
