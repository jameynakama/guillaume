require "securerandom"

FactoryGirl.define do
  factory :corpus, :class => Guillaume::Corpus do
    sequence :title do |n|
      "Corpus #{n}"
    end
  end
end
