require "net/http"
require "logger"
require "guillaume/version"
require "guillaume/source_text"
require "guillaume/line"
require "guillaume/poem"
require "guillaume/poetics"

$LOGGER = Logger.new(STDOUT)
$LOGGER.level = Logger::ERROR

module Guillaume
end
