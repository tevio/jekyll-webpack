# Jekyll::Webpack

This plugin will allow you to build your assets with Webpack _after_ Jekyll has compiled your site to the `_site` folder. You will need to have Webpack installed at the root of your project in order for this to work.

## Why?

This adds Webpack at a sane point in the build pipeline and will also allow you to parameterize your webpack and other JS config files by prepending them with front matter, before the compilation occurs. You can see a functioning excample in the `spec/fixtures` folder:-

There is a `_data/tailwind.yml` file in the fixure site that's picked up by adding a frontmatter declaration in `tailwind.config.yml`.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll-webpack'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jekyll-webpack

And add the following to your site's `_config.yml`

```yml
plugins:
  - jekyll-webpack
```

## Usage

In your root Jekyll project folder you need to have Webpack installed, so:-

`yarn add webpack webpack-cli --dev`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then `cd spec/fixtures && yarn` to install required JS dependencies for specs. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tevio/jekyll-webpack. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/tevio/jekyll-webpack/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jekyll::Webpack project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/jekyll-webpack/blob/master/CODE_OF_CONDUCT.md).
