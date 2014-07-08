class CreateSourceTexts < ActiveRecord::Migration
  def change
    create_table :source_texts do |t|
      t.string :title
    end

    add_index :source_texts, :title
  end
end
