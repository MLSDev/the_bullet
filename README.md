# Rails application template for API-only applications

## Environment

* Ruby 2.4.1
* RubyGems 2.6.8
* Bundler 1.15.0
* Ruby on Rails 5.1.1

## Configure Swagger UI

* `cd public`
* `git clone https://github.com/swagger-api/swagger-ui.git`
* `cd swagger-ui/`
* `git checkout v2.2.10`

Change `url = "http://petstore.swagger.io/v2/swagger.json";` to `url = "http://localhost:3000/api/docs.json";` in `public/dist/index.html`

Or to `http://localhost:3000/backoffice/docs.json` if you need developing backoffice stuff.

Open `http://localhost:3000/dist/index.html` in browser.

## Add backoffice superuser

```ruby
Backoffice::Superuser.create!(email: 'me@example.com', name: 'John Snow', password: 'password')
```

## Guides

* [Ruby coding style guide](https://github.com/bbatsov/ruby-style-guide)
* [Ruby on Rails style guide](https://github.com/bbatsov/rails-style-guide)
* [Security Guide for Developers](https://github.com/FallibleInc/security-guide-for-developers)
* [Rails SQL Injection](http://rails-sqli.org)
* [Swagger specification](http://swagger.io/specification/)

## About MLSDev

[<img src="https://github.com/MLSDev/development-standards/raw/master/mlsdev-logo.png" alt="MLSDev.com">][mlsdev]

`the_bullet` is maintained by MLSDev, Inc. We specialize in providing all-in-one solution in mobile and web development. Our team follows Lean principles and works according to agile methodologies to deliver the best results reducing the budget for development and its timeline.

Find out more [here][mlsdev] and don't hesitate to [contact us][contact]!

[mlsdev]: http://mlsdev.com
[contact]: http://mlsdev.com/contact_us
