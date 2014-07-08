RSpec.configure do |config|
  # additional factory_girl configuration

  config.before(:suite) do
    FactoryGirl.lint
  end
end
