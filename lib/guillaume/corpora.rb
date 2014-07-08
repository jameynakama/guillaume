class Guillaume::Corpora < ActiveRecord::Base
  has_and_belongs_to_many :source_texts

  validates_uniqueness_of :title
end
