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

### Command line

    Usage: guillaume /path/to/text_source.txt [options]
        -v, --verbose                    Verbose output while writing
        -d, --debug                      Debug (extra verbose) output while writing
        -s, --seed SEED                  Seed to start poem
        -m, --max-stanzas STANZAS        Maximum number of stanzas to write

### Gem

    require "guillaume"
    source_text_file = Guillaume::SourceText.new("/path/to/text_source.txt")
    poem = Guillaume::Poem.new(source_text_file, max_stanzas: 5)
    puts poem.formatted

## TODO

- establish data storage
- write separate parsing methods for poetry (linebreak-aware) and literature (linebreak-agnostic)
- write functionality for staying/straying from topics

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
