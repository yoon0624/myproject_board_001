class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      
      t.text :problem
      t.text :answer
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
