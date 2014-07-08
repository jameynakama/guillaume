# Guillaume

Guillaume is a generative poetry creation tool.

## Installation

Add this line to your application's Gemfile:

    gem "guillaume"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guillaume

## Usage

Guillaume requires a database to work. In order to know what to connect to, you
must place a .guillaume_dbs.yml file in your home directory. The
config/.guillaume_dbs.yml.example file shows a generic setup for this. You must
have a development and test environment, but what you do in there is up to you.

Currently, guillaume cannot create a user or db by itself, so you'll have to do
that once. The following example is for postgres:

    $ createuser -EdP guillaume
    $ createdb -U guillaume guillaume

You must then run `$ guillaume init` once to run migrations.

### Command line

    Usage: guillaume /path/to/text_source.txt [options]
        -v, --verbose                    Verbose output while writing
        -d, --debug                      Debug (extra verbose) output while writing
        -s, --seed SEED                  Seed to start poem
        -m, --max-stanzas STANZAS        Maximum number of stanzas to write

### Gem

    require "guillaume"
    source_text = Guillaume::SourceText.new
    source_text.file_name = "/path/to/text_source.txt"
    source_text.title = "Whatever you want to call it"
    source_text.save
    source_text.record_ngrams
    poem = Guillaume::Poem.new(source_text, max_stanzas: 5)
    puts poem.formatted

## UPCOMING

- bulk insert to make source_text#record_ngrams way faster
- subcommands `read`, `write`, and `forget` to manage source texts and corporas containing arbitrary source texts

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
