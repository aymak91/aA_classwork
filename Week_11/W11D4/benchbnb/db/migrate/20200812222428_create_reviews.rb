class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :body, null: false
      
      t.integer :bench_id, null: false
      t.integer :author_id, null: false 
      t.timestamps
    end
    add_index :reviews, :bench_id
    add_index :reviews, :author_id
  end
end
