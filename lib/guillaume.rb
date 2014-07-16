require "net/http"
require "logger"
require "active_record"
require "activerecord-import"
require "guillaume/version"
require "guillaume/corpora"
require "guillaume/source_text"
require "guillaume/ngram"
require "guillaume/line"
require "guillaume/poem"
require "guillaume/poetics"

DATABASE_ENV = ENV["DATABASE_ENV"] || "development"

$LOGGER = Logger.new(STDOUT)
$LOGGER.level = Logger::ERROR

guillaume_db_config = YAML.load_file("#{Dir.home}/.guillaume_dbs.yml")
ActiveRecord::Base.establish_connection(guillaume_db_config[DATABASE_ENV])

module Guillaume
end
