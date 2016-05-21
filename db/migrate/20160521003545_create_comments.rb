class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :post_id
      t.string :image_url
      
      t.string :email;

      t.timestamps null: false
    end
  end
end
