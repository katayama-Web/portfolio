class CreatePrivatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :private_posts do |t|
      t.integer :post_id
      t.timestamps
    end
  end
end
