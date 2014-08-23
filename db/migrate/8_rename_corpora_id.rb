class RenameCorporaId < ActiveRecord::Migration
  def change
    rename_column :corpora_source_texts, :corpora_id, :corpus_id
  end
end
