# Jekyll::Webpack

This plugin will allow you to build your assets with Webpack _after_ Jekyll has compiled your site to the `_site` folder. You will need to have Webpack installed at the root of your project in order for this to work.

## Why?

This adds Webpack at a sane point in the build pipeline and will also allow you to parameterize your webpack and other JS config files by prepending them with front matter, before the compilation occurs. You can see a functioning example in the `spec/fixtures` folder:-


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
  - jekyll/webpack
```

NOTE the `/` - the `-` variant is not available yet.

ALSO NOTE - it's probably advisable to place this plugin as the very last one in the build pipe. EG:-

```yml
plugins:
  - jekyll-otherplug
  ...
  - jekyll/webpack
```

## Usage

In your root Jekyll project folder you need to have Webpack installed, so:-

`yarn add webpack webpack-cli --dev`

And the basic JS entrypoint `mkdir src && touch src/index.js`

And you're away! Just run the `jekyll serve` or `jekyll build` commands with whatever env you need.

## Config

### Configuring JS config files

There is a `_data/tailwind.yml` file in the fixure site that's picked up by adding a frontmatter declaration in `tailwind.config.js`. This Tailwind config is in turn picked up by the outputted webpack config and parsed when webpack runs.

### Cleanup
If you wish to clean out unused source files after webpack has run that got included in the compiled site, you need to add an entry into your `_config.yml` like:

``` yml
// _config.yml

webpack:
  cleanup_files: src

// or an array

webpack:
  cleanup_files:
    - src
    - node_modules
```

### Dest inclusion (excluding
If want to ensure that webpack only runs in a specific site dest (eg `_site` only, and no subdirectories) you can pass a single path value or an inclusion list of paths you want webpack to run in, at config time, by modifiying the `_config.yml` like so:

``` yml
// _config.yml

webpack:
  only_in: _site

// or as a list
webpack:
  only_in:
    - _site
    - _build
```

### Example `_config.yml`
You can have a look at the possible configuration options in the fixtures config file at `spec/fixtures/_config.yml` in this repo.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then `cd spec/fixtures && yarn` to install required JS dependencies for specs. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tevio/jekyll-webpack. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/tevio/jekyll-webpack/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jekyll::Webpack project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/jekyll-webpack/blob/master/CODE_OF_CONDUCT.md).
