# ExternalAssetPipeline

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'external_asset_pipeline'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install external_asset_pipeline

## Usage

In `config/application.rb`, after the code that `require`s rails, add:

```ruby
require 'external_asset_pipeline/railtie'
```

See an example in
[`examples/demo_app/config/application.rb`](./examples/demo_app/config/application.rb)

Additionally, in any environments where you don't want the asset manifest to be
cached (e.g. in development), you should set

```ruby
config.external_asset_pipeline.cache_manifest = false
```

See an example in
[`examples/demo_app/config/environments/development.rb`](./examples/demo_app/config/environments/development.rb)

### Usage together with sprockets

If you'd like to use the `external_asset_pipeline` together with `sprockets`,
you must also set

```ruby
config.external_asset_pipeline.fall_back_to_sprockets = true
````

either in `config/application.rb` or in an initializer (e.g.
`config/initializers/assets.rb`). This tells your app to first look for an asset
in the external asset pipeline manifest, and if no asset is found then fall back
to looking in the sprockets pipeline.

See an example in
[`examples/demo_app/config/application.rb`](./examples/demo_app/config/application.rb)

### Configuration

By default, the `external_asset_pipeline` will look for an asset manifest in
`public/packs/manifest.json`. You can configure both the public subdirectory and
the manifest filename:

```ruby
config.external_asset_pipeline.assets_prefix = '/static'
config.external_asset_pipeline.manifest_filename = '.asset-manifest.json'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to [rubygems.org].

[rubygems.org]: https://rubygems.org

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/rails-front-end/external_asset_pipeline.

## License

The gem is available as open source under the terms of the [MIT License].

[MIT License]: https://opensource.org/licenses/MIT
