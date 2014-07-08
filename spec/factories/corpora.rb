require "securerandom"

FactoryGirl.define do
  factory :corpora, :class => Guillaume::Corpora do
    sequence :title do |n|
      "Corpora #{n}"
    end
  end
end
