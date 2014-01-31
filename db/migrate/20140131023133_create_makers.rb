class CreateMakers < ActiveRecord::Migration
  def change
    create_table :makers do |t|
      t.string :name
      t.string :nickname
      t.string :email
      t.string :imageURL

      t.timestamps
    end
  end
end
