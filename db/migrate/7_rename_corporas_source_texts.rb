class RenameCorporasSourceTexts < ActiveRecord::Migration
  def change
    rename_table :corporas_source_texts, :corpora_source_texts
  end
end
