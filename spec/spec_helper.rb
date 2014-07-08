require "guillaume"
require "factory_girl"

RSpec.configure do |config|
  config.color = true

  FactoryGirl.find_definitions
end
