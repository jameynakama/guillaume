class RenameCorporaToCorpus < ActiveRecord::Migration
  def change
    rename_table :corporas, :corpora
  end
end
