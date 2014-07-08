require "securerandom"

FactoryGirl.define do
  factory :source_text, :class => Guillaume::SourceText do
    sequence :title do |n|
      "Book #{n}"
    end
    file_name "spec/data/lorem.txt"
  end
end
