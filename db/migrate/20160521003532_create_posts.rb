class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :email
      t.text :content, default: ''
      t.text :tags, default: ''
      t.string :image_url, default: ''
      
      t.timestamps null: false
    end
  end
end
