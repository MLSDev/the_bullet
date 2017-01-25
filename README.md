# Rails application template for API-only applications Edit

## Environment

* Ruby 2.4.0
* RubyGems 2.6.8
* Bundler 1.14.3
* Ruby on Rails 5.0.1

## Configure Swagger UI

* `cd public`
* `git clone https://github.com/swagger-api/swagger-ui.git`
* `cd swagger-ui/`
* `git checkout v2.2.10`

Change `url = "http://petstore.swagger.io/v2/swagger.json";` to `url = "http://localhost:3000/api/v1/docs.json";` in `public/dist/index.html`

Open `http://localhost:3000/dist/index.html` in browser.

## Guides

* [Ruby coding style guide](https://github.com/bbatsov/ruby-style-guide)
* [Ruby on Rails style guide](https://github.com/bbatsov/rails-style-guide)
* [Security Guide for Developers](https://github.com/FallibleInc/security-guide-for-developers)
* [Rails SQL Injection](http://rails-sqli.org)
* [Swagger specification](http://swagger.io/specification/)

## About MLSDev

[<img src="https://github.com/MLSDev/development-standards/raw/master/mlsdev-logo.png" alt="MLSDev.com">][mlsdev]

`the_buller` is maintained by MLSDev, Inc. We specialize in providing all-in-one solution in mobile and web development. Our team follows Lean principles and works according to agile methodologies to deliver the best results reducing the budget for development and its timeline.

Find out more [here][mlsdev] and don't hesitate to [contact us][contact]!

[mlsdev]: http://mlsdev.com
[contact]: http://mlsdev.com/contact_us
