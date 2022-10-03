class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :private_post_id
      t.integer :draft_id
      t.integer :genre_id
      t.string :title
      t.text :body
      t.string :shooting_datetime
      t.string :location
      t.string :camara
      t.string :lens
      t.string :iso
      t.string :shutter_speed
      t.string :f_number
      t.text :remark
      
      t.timestamps
    end
  end
end
