require 'rspec/core/rake_task'

task :default => :spec

task :stats => "spec:statsetup"

desc "Run all specs in spec directory (excluding plugin specs)"
RSpec::Core::RakeTask.new(:spec => "spec:prepare")

namespace :spec do
  types = begin
            dirs = Dir['./spec/**/*_spec.rb'].
              map { |f| f.sub(/^\.\/(spec\/\w+)\/.*/, '\\1') }.
              uniq.
              select { |f| File.directory?(f) }
            Hash[dirs.map { |d| [d.split('/').last, d] }]
          end

  task :prepare do
    ENV["DATABASE_ENV"] = "test"
    test_database = "db/test.sqlite3"
    File.delete(test_database) if File.exists?(test_database)
    Rake::Task["db:migrate"].invoke
  end

  types.each do |type, dir|
    desc "Run the code examples in #{dir}"
    RSpec::Core::RakeTask.new(type => "spec:prepare") do |t|
      t.pattern = "./#{dir}/**/*_spec.rb"
    end
  end

  task :statsetup do
    require 'rails/code_statistics'
    types.each do |type, dir|
      name = type.singularize.capitalize

      ::STATS_DIRECTORIES << ["#{name} specs", dir]
      ::CodeStatistics::TEST_TYPES << "#{name} specs"
    end
  end
end
