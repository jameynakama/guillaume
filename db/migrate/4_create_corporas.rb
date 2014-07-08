class CreateCorporas < ActiveRecord::Migration
  def change
    create_table :corporas do |t|
      t.string :title
    end

    add_index :corporas, :title
  end
end
