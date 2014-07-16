# Guillaume

Guillaume is a generative poetry creation tool.

## Installation

Add this line to your application's Gemfile:

    gem "guillaume"

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install guillaume

## Usage

Guillaume requires a database to work. In order to know what to connect to, you
must place a .guillaume_dbs.yml file in your home directory. The
config/.guillaume_dbs.yml.example file shows a generic setup for this. You must
have development and test environments, but what you do with each is up to you.

Currently, guillaume cannot create a user or db by itself, so you'll have to do
that once. The following example is for postgres, assuming a guillaume user and
db:

    $ createuser -EdP guillaume
    $ createdb -U guillaume guillaume

You must then run `$ guillaume init` once to run migrations.

### Command line

See indiviudal commands for specifics on usage (e.g. `$ guillaume help read`)

    NAME
        guillaume - A generative poetry bot

    SYNOPSIS
        guillaume [global options] command [command options] [arguments...]

    VERSION
        0.0.2

    GLOBAL OPTIONS
        --help    - Show this message
        --version - Display the program version

    COMMANDS
        forget - Forget a particular source text
        help   - Shows a list of commands or help for one command
        init   - Migrate the DB
        list   - List all known source texts
        read   - Read, parse, and store a source text in the DB
        write  - Write a poem

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

- Arbitrarily combine source texts into corporas and choose corpora to write from

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
