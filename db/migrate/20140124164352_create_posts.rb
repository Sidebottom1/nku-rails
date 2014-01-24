class CreatePosts < ActiveRecord::Migration
  def change
    create_table :post do |t|
      t.string :title
      t.text :text
      
      t.timestamps
    end
  end
end
