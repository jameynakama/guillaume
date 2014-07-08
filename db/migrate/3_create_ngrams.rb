class CreateNgrams < ActiveRecord::Migration
  def change
    create_table :ngrams do |t|
      t.string :type
      t.string :ngram
      t.string :key
      t.string :value
      t.belongs_to :source_text
    end
  end
end
