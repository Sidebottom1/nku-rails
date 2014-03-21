class Assignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|   
      
      t.float  :score
      t.float  :total
    end
  end
end
