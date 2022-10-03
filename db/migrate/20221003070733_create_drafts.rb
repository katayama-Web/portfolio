class CreateDrafts < ActiveRecord::Migration[6.1]
  def change
    create_table :drafts do |t|
      t.integer :post_id
      t.timestamps
    end
  end
end
