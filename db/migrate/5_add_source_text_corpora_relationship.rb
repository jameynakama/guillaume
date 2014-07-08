class AddSourceTextCorporaRelationship < ActiveRecord::Migration
  create_table :corporas_source_texts do |t|
    t.belongs_to :corpora
    t.belongs_to :source_text
  end
end
