class AddRawSourceToSourceTexts < ActiveRecord::Migration
  def change
    add_column :source_texts, :raw_source, :text
  end
end
