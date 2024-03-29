class CreateBenches < ActiveRecord::Migration[5.2]
  def change
    create_table :benches do |t|
      t.string :description
      t.integer :seats, null: false
      t.float :lat
      t.float :lng
      t.timestamps
    end
  end
end
